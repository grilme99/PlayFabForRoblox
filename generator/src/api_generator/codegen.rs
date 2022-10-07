use std::collections::BTreeMap;
use std::fs::File;
use std::io::Write;
use std::path::PathBuf;

use anyhow::Context;
use convert_case::{Case, Casing};
use serde::Serialize;
use serde_variant::to_variant_name;

use crate::playfab_api::{SwaggerResponse, SwaggerSpec, SwaggerTypeDefinition};
use crate::util::truncate_string;

const KNOWN_REF_CATEGORIES: [&str; 3] = ["definitions", "parameters", "responses"];

#[derive(Debug, Serialize)]
enum ApiSecurity {
    EntityToken,
    SecretKey,
    SessionTicket,
}

pub async fn generate_source(
    file_name: PathBuf,
    api_name: &str,
    api_description: &str,
    swagger_spec: &SwaggerSpec,
) -> anyhow::Result<File> {
    let mut buffer = File::create(file_name)?;

    write_module_header(&mut buffer, api_name, api_description)?;

    write_type_definitions(&mut buffer, swagger_spec)?;
    write_api_functions(&mut buffer, swagger_spec, api_name)?;

    write_module_footer(&mut buffer, api_name)?;

    Ok(buffer)
}

fn write_module_header(
    w: &mut dyn Write,
    api_name: &str,
    api_description: &str,
) -> anyhow::Result<()> {
    writeln!(w, "--!strict")?;
    writeln!(w, "--[=[")?;
    writeln!(w, "\t# {api_name}Api")?;
    writeln!(w, "")?;

    let description_parts = truncate_string(api_description);
    for part in description_parts {
        writeln!(w, "\t{part}")?;
    }

    writeln!(w, "]=]")?;
    writeln!(w, "")?;

    writeln!(
        w,
        "local PlayFabInternal = require(script.Parent.PlayFabInternal)"
    )?;
    writeln!(w, "")?;

    writeln!(w, "local {api_name}Api = {{}}")?;
    writeln!(w, "")?;

    writeln!(
        w,
        "function {api_name}Api.SetSettings(settings: PlayFabInternal.ISettings)"
    )?;
    writeln!(w, "\tPlayFabInternal.SetSettings(settings)")?;
    writeln!(w, "end")?;
    writeln!(w, "")?;

    Ok(())
}

fn write_type_definitions(w: &mut dyn Write, swagger_spec: &SwaggerSpec) -> anyhow::Result<()> {
    let definitions = &swagger_spec.definitions;

    for (name, definition) in definitions {
        match definition.def_type.as_str() {
            "object" => write_type_object(w, name, definition)?,
            "string" => write_type_string(w, name, definition)?,
            _ => (),
        };
    }

    writeln!(w, "")?;

    Ok(())
}

fn write_type_object(
    w: &mut dyn Write,
    name: &str,
    definition: &SwaggerTypeDefinition,
) -> anyhow::Result<()> {
    let required_properties = match definition.required.to_owned() {
        Some(required) => required,
        None => Vec::new(),
    };

    write_description(w, &definition.description, "", false)?;

    writeln!(w, "export type {name} = {{")?;

    if let Some(properties) = &definition.properties {
        for (name, property) in properties {
            let def_type = &property.def_type;
            let prop_type = match def_type.as_str() {
                "array" => {
                    if let Some(items) = &property.items {
                        if let Some(prop_ref) = &items.def_ref {
                            if let Some(parsed_ref) = parse_ref(prop_ref) {
                                format!("{{{parsed_ref}}}")
                            } else {
                                "{any}".into()
                            }
                        } else {
                            "{any}".into()
                        }
                    } else {
                        "{any}".into()
                    }
                }
                "object" => {
                    if let Some(prop_ref) = &property.def_ref {
                        if let Some(parsed_ref) = parse_ref(prop_ref) {
                            parsed_ref
                        } else {
                            "{[any]: any}".into()
                        }
                    } else {
                        "{[any]: any}".into()
                    }
                }
                "integer" => "number".into(),
                _ => def_type.into(),
            };

            let required = if required_properties.contains(name) {
                ""
            } else {
                "?"
            };

            write_description(w, &property.description, "\t", false)?;

            let line = format!("\t{name}: {}{required},", prop_type);
            writeln!(w, "{line}")?;
        }
    }

    writeln!(w, "}}")?;
    writeln!(w, "")?;

    Ok(())
}

fn write_type_string(
    w: &mut dyn Write,
    name: &str,
    definition: &SwaggerTypeDefinition,
) -> anyhow::Result<()> {
    write_description(w, &definition.description, "", false)?;

    writeln!(w, "export type {name} = ")?;

    let mut items = definition.def_enum.as_ref().unwrap().into_iter(); // Safe to unwrap, type string always has an enum

    let first_item = items.next().unwrap();
    writeln!(w, "\t\"{first_item}\"")?;

    while let Some(item) = items.next() {
        writeln!(w, "\t| \"{item}\"")?;
    }

    writeln!(w, "")?;

    Ok(())
}

fn write_api_functions(
    w: &mut dyn Write,
    swagger_spec: &SwaggerSpec,
    api_name: &str,
) -> anyhow::Result<()> {
    let namespace = format!("{api_name}Api");
    for (_, methods) in &swagger_spec.paths {
        let method = &methods.post;

        write_description(w, &method.request_details, "", true)?;
        writeln!(w, "--- {}", method.external_docs.url)?;

        // Swagger security format is weird to parse, but this should work fine?
        let security_types = method.security.get(0).context("Missing security details")?;
        let api_security = parse_security_types(security_types);

        let security_parameter = if let Some(api_security) = &api_security {
            let name = to_variant_name(api_security)?.to_case(Case::Camel);
            format!("{name}: string, \n\t")
        } else {
            "".to_owned()
        };

        let parameter_container = method
            .parameters
            .get(0)
            .context("Missing parameter details")?;
        let parameter_ref = parameter_container
            .get("$ref")
            .context("Missing parameter ref")?;
        let parameter_type = parse_ref(parameter_ref).context("Failed to parse parameter ref")?;
        let parameters = format!("{security_parameter}request: {parameter_type}");

        let return_type =
            parse_api_responses(&method.responses).context("Failed to parse API responses")?;

        writeln!(
            w,
            "function {namespace}.{}Async(\n\t{parameters}\n): {return_type}",
            method.operation_id
        )?;

        let header_name = match &api_security {
            Some(api_security) => match &api_security {
                ApiSecurity::EntityToken => "\"X-EntityToken\"",
                ApiSecurity::SessionTicket => "\"X-Authorization\"",
                ApiSecurity::SecretKey => "\"X-SecretKey\"",
            },
            None => "nil",
        };

        let security_parameter = if let Some(api_security) = &api_security {
            to_variant_name(api_security)?.to_case(Case::Camel)
        } else {
            "nil".to_owned()
        };

        writeln!(w, "\treturn PlayFabInternal.MakeApiCall(")?;
        writeln!(w, "\t\t\"/{api_name}/{}\",", method.operation_id)?;
        writeln!(w, "\t\trequest,")?;
        writeln!(w, "\t\t{header_name},")?;
        writeln!(w, "\t\t{security_parameter}")?;
        writeln!(w, "\t)")?;

        writeln!(w, "end")?;
        writeln!(w, "")?;
    }

    Ok(())
}

fn write_description(
    w: &mut dyn Write,
    description: &Option<String>,
    line_prefix: &str,
    newline: bool,
) -> anyhow::Result<()> {
    if let Some(description) = description {
        let description_parts = truncate_string(description);
        for part in description_parts {
            writeln!(w, "{line_prefix}--- {part}")?;
        }

        if newline {
            writeln!(w, "{line_prefix}---")?;
        }
    }

    Ok(())
}

fn write_module_footer(w: &mut dyn Write, api_name: &str) -> anyhow::Result<()> {
    writeln!(w, "return {api_name}Api")?;
    writeln!(w, "")?;

    Ok(())
}

fn parse_ref(prop_ref: &str) -> Option<String> {
    let mut parts = prop_ref.split("/").into_iter();
    parts.next();

    if let Some(category) = parts.next() {
        if KNOWN_REF_CATEGORIES.contains(&category) {
            if let Some(def_type) = parts.next() {
                return Some(def_type.to_owned());
            }
        }
    }

    None
}

fn parse_security_types(security_types: &BTreeMap<String, Vec<()>>) -> Option<ApiSecurity> {
    if security_types.get("EntityToken").is_some() {
        return Some(ApiSecurity::EntityToken);
    } else if security_types.get("SecretKey").is_some() {
        return Some(ApiSecurity::SecretKey);
    } else if security_types.get("SessionTicket").is_some() {
        return Some(ApiSecurity::SessionTicket);
    }

    None
}

fn parse_api_responses(responses: &BTreeMap<String, SwaggerResponse>) -> anyhow::Result<String> {
    let mut return_str = String::new();

    let mut responses = responses
        .iter()
        .filter(|(status_code, _)| **status_code != "400".to_owned())
        .peekable();

    while let Some((_, response)) = responses.next() {
        let response_type = parse_ref(&response.def_ref).context("Failed to parse response ref")?;
        return_str.push_str(&response_type);

        // Only push a pipe if we're not at the end of iteration
        if responses.peek().is_some() {
            return_str.push_str(" | ");
        }
    }

    Ok(return_str)
}
