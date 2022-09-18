#![feature(string_remove_matches)]

mod api_generator;
mod domain;
mod playfab_api;

use std::borrow::Cow;
use std::env;
use std::io::Write;
use std::path::{Path, PathBuf};

use anyhow::Context;
use clap::Parser;
use clap_verbosity_flag::{InfoLevel, Verbosity};
use console::style;
use log::Level;

use crate::api_generator::ApiGenerator;
use crate::domain::PlayFabAPI;

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

    for api in api_specs {
        let api_spec = playfab_api::get_api_spec(&api)
            .await
            .context("Failed to get API spec")?;

        let name = PlayFabAPI(clean_api_name(api.name));
        let generator = ApiGenerator::new(name, api_spec, &path, publish_packages.to_owned());

        generator
            .create_module()
            .await
            .context("Failed to create module for PlayFab API")?;
    }

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
