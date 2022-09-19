use crate::playfab_api::{SwaggerSpec, SwaggerTypeDefinition};
use std::fs::File;
use std::io::Write;
use std::path::PathBuf;

const MAX_LINE_LENGTH: usize = 80;

pub async fn generate_source(
    file_name: PathBuf,
    api_name: &str,
    api_description: &str,
    swagger_spec: &SwaggerSpec,
) -> anyhow::Result<File> {
    let mut buffer = File::create(file_name)?;

    write_module_header(&mut buffer, api_name, api_description)?;

    write_type_definitions(&mut buffer, swagger_spec, api_name)?;

    write_module_footer(&mut buffer, api_name)?;

    Ok(buffer)
}

fn write_module_header(
    w: &mut dyn Write,
    api_name: &str,
    api_description: &str,
) -> anyhow::Result<()> {
    writeln!(w, "--[=[")?;
    writeln!(w, "\t@class {api_name}Api")?;
    writeln!(w, "")?;

    let description_parts = truncate_string(api_description);
    for part in description_parts {
        writeln!(w, "\t{part}")?;
    }

    writeln!(w, "--]=]")?;
    writeln!(w, "")?;

    writeln!(w, "local {api_name}Api = {{}}")?;
    writeln!(w, "")?;

    Ok(())
}

fn write_type_definitions(
    w: &mut dyn Write,
    swagger_spec: &SwaggerSpec,
    api_name: &str,
) -> anyhow::Result<()> {
    let definitions = &swagger_spec.definitions;

    for (name, definition) in definitions {
        match definition.def_type.as_str() {
            "object" => write_type_object(w, name, definition, api_name)?,
            "string" => write_type_string(w, name, definition, api_name)?,
            _ => (),
        };
    }

    Ok(())
}

fn write_type_object(
    w: &mut dyn Write,
    name: &str,
    definition: &SwaggerTypeDefinition,
    api_name: &str,
) -> anyhow::Result<()> {
    let required_properties = match definition.required.to_owned() {
        Some(required) => required,
        None => Vec::new(),
    };

    writeln!(w, "--- @interface I{name}")?;
    writeln!(w, "--- @within {api_name}Api")?;

    if let Some(properties) = &definition.properties {
        for (name, property) in properties {
            write!(w, "--- .{name}")?;

            if let Some(description) = &property.description {
                writeln!(w, " -- {description}")?;
            } else {
                write!(w, "\n")?;
            }
        }
    }

    write_description(w, &definition.description)?;

    writeln!(w, "export type I{name} = {{")?;

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

            writeln!(w, "\t{name}: {}{required},", prop_type)?;
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
    api_name: &str,
) -> anyhow::Result<()> {
    writeln!(w, "--- @type I{name}")?;
    writeln!(w, "--- @within {api_name}Api")?;

    write_description(w, &definition.description)?;

    writeln!(w, "export type I{name} = ")?;

    let mut items = definition.def_enum.as_ref().unwrap().into_iter(); // Safe to unwrap, type string always has an enum

    let first_item = items.next().unwrap();
    writeln!(w, "\t\"{first_item}\"")?;

    while let Some(item) = items.next() {
        writeln!(w, "\t| \"{item}\"")?;
    }

    writeln!(w, "")?;

    Ok(())
}

fn write_description(w: &mut dyn Write, description: &Option<String>) -> anyhow::Result<()> {
    if let Some(description) = description {
        writeln!(w, "---")?;
        let description_parts = truncate_string(description);
        for part in description_parts {
            writeln!(w, "--- {part}")?;
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
        if category == "definitions" {
            if let Some(def_type) = parts.next() {
                return Some(format!("I{def_type}"));
            }
        }
    }

    None
}

/// Splits a string so that each line doesn't go over MAX_LINE_LENGTH
fn truncate_string(str: &str) -> Vec<String> {
    let mut string_parts = Vec::new();

    let mut length = 0;
    let mut line = String::new();

    let mut parts = str.split(" ").peekable();
    while let Some(part) = parts.next() {
        let fixed_part = &format!("{part} ");

        length += fixed_part.len();
        line.push_str(fixed_part);

        // Push string if we're over the threshold of at the end of the iterator
        if length >= MAX_LINE_LENGTH || parts.peek().is_none() {
            string_parts.push(line.clone());
            line.clear();
            length = 0;
        }
    }

    string_parts
}
