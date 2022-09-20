#![feature(string_remove_matches)]

mod api_generator;
mod domain;
mod playfab_api;
mod util;

use std::borrow::Cow;
use std::collections::HashMap;
use std::env;
use std::fs::File;
use std::io::Write;
use std::path::{Path, PathBuf};

use anyhow::Context;
use clap::Parser;
use clap_verbosity_flag::{InfoLevel, Verbosity};
use console::style;
use convert_case::{Case, Casing};
use log::Level;

use crate::api_generator::ApiGenerator;
use crate::domain::PlayFabAPI;
use crate::playfab_api::SwaggerSpec;

const README_CONTENTS: [&str; 5] = [
    "PlayFab is a complete backend platform for live games with managed game services, real-time analytics, and \
    LiveOps. This SDK provides complete access to the entire PlayFab API on Roblox.",

    "Each API scope (client, server, admin, matchmaking, etc) is split into its own Wally package to help reduce the \
    overall bundle size (see reference below). PlayFab APIs are **big**, so only import the packages you actually need.",

    "-----",

    "# API Reference",
    "Documentation for all PlayFab APIs are available on the Microsoft website (linked for each package below)."
];

#[derive(Parser, Debug)]
#[clap(version, about, trailing_var_arg = true)]
#[clap(name = "PlayFab SDK Generator")]
pub struct Options {
    /// Enables more verbose logging.
    #[clap(flatten)]
    pub verbosity: Verbosity<InfoLevel>,

    #[clap(long, takes_value = true)]
    pub codegen_path: PathBuf,

    #[clap(long)]
    pub publish_packages: bool,
}

#[tokio::main]
async fn main() -> anyhow::Result<()> {
    let options = Options::parse();

    env_logger::Builder::new()
        .filter_level(options.verbosity.log_level_filter())
        .format(|buf, record| {
            let prefix = match record.level() {
                Level::Trace => style(""), // Not sure what to use here
                Level::Debug => style(""), // Or here
                Level::Info => style("i").bold().cyan(),
                Level::Warn => style("!").bold().yellow(),
                Level::Error => style("!!").bold().red(),
            };

            writeln!(buf, "{prefix} {}", record.args())
        })
        .init();

    let path = resolve_path(&options.codegen_path);
    let publish_packages: &bool = &options.publish_packages;

    let api_specs = playfab_api::collect_api_specs()
        .await
        .context("Failed to collect API specs")?;

    let mut actual_specs: HashMap<PlayFabAPI, SwaggerSpec> = HashMap::new();

    for api in api_specs {
        let api_spec = playfab_api::get_api_spec(&api)
            .await
            .context("Failed to get API spec")?;

        let name = PlayFabAPI(clean_api_name(api.name));

        let modules_path = path.join("modules");
        let generator =
            ApiGenerator::new(&name, &api_spec, &modules_path, publish_packages.to_owned());

        generator
            .create_module()
            .await
            .context("Failed to create module for PlayFab API")?;

        actual_specs.insert(name, api_spec);
    }

    generate_readme(&path, actual_specs).context("Failed to generate README.md")?;

    Ok(())
}

fn clean_api_name(name: String) -> String {
    let mut new_name = name.clone();
    new_name.remove_matches("PlayFab");
    new_name.remove_matches("Api");

    new_name
}

fn resolve_path(path: &Path) -> Cow<'_, Path> {
    if path.is_absolute() {
        Cow::Borrowed(path)
    } else {
        Cow::Owned(env::current_dir().unwrap().join(path))
    }
}

fn generate_readme(
    codegen_path: &Cow<Path>,
    api_specs: HashMap<PlayFabAPI, SwaggerSpec>,
) -> anyhow::Result<()> {
    let mut w = File::create(codegen_path.join("README.md"))?;

    for line in README_CONTENTS {
        let lines = util::truncate_string(line);
        for part in lines {
            writeln!(w, "{part}")?;
        }

        writeln!(w, "")?;
    }

    // Packages table
    writeln!(w, "| API | Wally Package | Description |")?;
    writeln!(w, "| --- | ------------- | ----------- |")?;

    for (name, api) in api_specs {
        let info = &api.info;

        let docs = format!(
            "https://learn.microsoft.com/en-gb/rest/api/playfab/{}",
            name.0.to_ascii_lowercase()
        );
        let api_name = format!("[{}]({docs})", *name);

        let name = name.to_case(Case::Kebab);
        let version = util::get_package_version(&api);
        let wally_package = format!("`grilme99/playfab-{name}@{version}`");

        let description = &info.description;

        writeln!(w, "| {api_name} | {wally_package} | {description} |")?;
    }

    writeln!(w, "")?;

    log::info!("Created README.md");
    Ok(())
}
