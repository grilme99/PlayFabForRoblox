use std::collections::BTreeMap;
use std::fs::{self, File};
use std::io::Write;
use std::path::{Path, PathBuf};

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
    module_root: &PathBuf,
    api_name: &str,
    api_description: &str,
    swagger_spec: &SwaggerSpec,
    version: &str,
) -> anyhow::Result<(File, File, File)> {
    if !module_root.exists() {
        fs::create_dir(module_root)?;
    }

    let entry_path = module_root.join(Path::new("init.lua"));
    let apis_path = module_root.join(Path::new("Apis.lua"));
    let types_path = module_root.join(Path::new("Types.lua"));

    let mut entry_buffer = File::create(entry_path)?;
    let mut apis_buffer = File::create(apis_path)?;
    let mut types_buffer = File::create(types_path)?;

    write_entry_header(&mut entry_buffer, api_name, api_description, version)?;
    write_apis_module_header(&mut apis_buffer)?;
    write_types_module_header(&mut types_buffer)?;

    write_type_definitions(&mut types_buffer, swagger_spec)?;
    write_api_functions(&mut apis_buffer, swagger_spec)?;

    write_entry_reexports(&mut entry_buffer, swagger_spec)?;

    write_entry_footer(&mut entry_buffer, api_name)?;
    write_apis_footer(&mut apis_buffer)?;

    Ok((entry_buffer, apis_buffer, types_buffer))
}

fn write_entry_header(
    w: &mut dyn Write,
    api_name: &str,
    api_description: &str,
    version: &str,
) -> anyhow::Result<()> {
    writeln!(w, "--!strict")?;
    writeln!(w, "--[=[")?;
    writeln!(w, "\t# {api_name}Api")?;
    writeln!(w, "")?;

    let description_parts = truncate_string(api_description);
    for part in description_parts {
        writeln!(w, "\t{part}")?;
    }

    writeln!(w, "")?;
    writeln!(w, "\tAPI Version: {version}")?;

    writeln!(w, "]=]")?;
    writeln!(w, "")?;

    writeln!(
        w,
        "local PlayFabInternal = require(script.Parent.PlayFabInternal)"
    )?;
    writeln!(w, "local Types = require(script.Types)")?;
    writeln!(w, "")?;
    
    writeln!(w, "local {api_name}Api = require(script.Apis)")?;
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

fn write_types_module_header(w: &mut dyn Write) -> anyhow::Result<()> {
    writeln!(w, "--!strict")?;
    writeln!(w, "")?;

    Ok(())
}

fn write_apis_module_header(w: &mut dyn Write) -> anyhow::Result<()> {
    writeln!(w, "--!strict")?;
    writeln!(w, "")?;

    writeln!(
        w,
        "local PlayFabInternal = require(script.Parent.Parent.PlayFabInternal)"
    )?;
    writeln!(w, "local Types = require(script.Parent.Types)")?;
    writeln!(w, "")?;

    writeln!(w, "local Apis = {{}}")?;
    writeln!(w, "")?;

    Ok(())
}

fn write_entry_reexports(w: &mut dyn Write, swagger_spec: &SwaggerSpec) -> anyhow::Result<()> {
    let definitions = &swagger_spec.definitions;
    for (name, _) in definitions {
        writeln!(w, "export type {name} = Types.{name}")?;
    }

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
            // We automatically set the TitleId prop when sending the request, users can ignore this here
            if name == "TitleId" {
                continue;
            }

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

fn write_api_functions(w: &mut dyn Write, swagger_spec: &SwaggerSpec) -> anyhow::Result<()> {
    for (url, methods) in &swagger_spec.paths {
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
        let parameters = format!("{security_parameter}request: Types.{parameter_type}");

        let return_type =
            parse_api_responses(&method.responses).context("Failed to parse API responses")?;

        writeln!(
            w,
            "function Apis.{}Async(\n\t{parameters}\n): Types.{return_type}",
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
        writeln!(w, "\t\t\"{url}\",")?;
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

fn write_entry_footer(w: &mut dyn Write, api_name: &str) -> anyhow::Result<()> {
    writeln!(w, "return {api_name}Api")?;
    writeln!(w, "")?;

    Ok(())
}

fn write_apis_footer(w: &mut dyn Write) -> anyhow::Result<()> {
    writeln!(w, "return Apis")?;
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
