//! Handles generation for a specific PlayFab API (e.g. matchmaking, admin, etc).

use std::borrow::Cow;
use std::fs;
use std::path::{Path, PathBuf};

use anyhow::Context;
use convert_case::{Case, Casing};

use crate::domain::{APIWallyConfig, APIWallyPackage, PlayFabAPI};
use crate::playfab_api::SwaggerSpec;

type ModulesPath<'a> = &'a Cow<'a, Path>;

#[derive(Debug)]
pub struct ApiGenerator<'a> {
    api_name: PlayFabAPI,
    swagger_spec: SwaggerSpec,
    modules_path: ModulesPath<'a>,
}

impl<'a> ApiGenerator<'a> {
    pub fn new(
        api_name: PlayFabAPI,
        swagger_spec: SwaggerSpec,
        modules_path: ModulesPath<'a>,
    ) -> Self {
        Self {
            api_name,
            swagger_spec,
            modules_path,
        }
    }

    /// Main tasks which creates the Wally module, parses API specs, and does codegen.
    pub async fn create_module(&self) -> anyhow::Result<()> {
        self.create_module_files()
            .context("Failed to create module files")?;

        Ok(())
    }

    fn create_module_files(&self) -> anyhow::Result<()> {
        let module_name = &self.api_name.to_case(Case::Snake);
        let module_root = &self.modules_path.join(module_name);

        // Warn if the module already exists
        if module_root.exists() {
            log::warn!("Module {module_name} already exists. This will be overwritten.");
            fs::remove_dir_all(module_root).context("Failed to remove existing directory")?;
        }

        log::debug!("Creating module {module_name:?}");
        fs::create_dir(module_root).context("Failed to create directory")?;

        let name = format!("grilme99/playfab-{}", self.api_name.to_case(Case::Kebab));
        let version = format!("1.{}.0", self.swagger_spec.info.version);

        self.create_wally_config(module_root, &name, &version)
            .context("Failed to create Wally config")?;

        self.create_readme(module_root, &name, &version)
            .context("Failed to create README.md")?;

        self.create_source_file(module_root).context("Failed to create init.lua")?;

        Ok(())
    }

    fn create_wally_config(
        &self,
        module_root: &PathBuf,
        name: &str,
        version: &str,
    ) -> anyhow::Result<()> {
        let info = &self.swagger_spec.info;
        let description = format!(
            "{}. For more info, see: https://github.com/grilme99/RobloxPlayFabSDK",
            info.description,
        );

        let config = APIWallyConfig {
            package: APIWallyPackage {
                name: name.into(),
                description,
                version: version.into(),
                license: "MIT".into(),
                authors: vec!["Brooke Rhodes <brooke@gril.me>".into()],
                registry: "https://github.com/UpliftGames/wally-index".into(),
                realm: "shared".into(),
            },
            dependencies: Default::default(),
        };

        let toml =
            toml::to_string(&config).context("Failed to serialize Wally config into TOML")?;

        fs::write(module_root.join("wally.toml"), toml)
            .context("Failed to write wally.toml file")?;

        Ok(())
    }

    fn create_readme(
        &self,
        module_root: &PathBuf,
        wally_name: &str,
        version: &str,
    ) -> anyhow::Result<()> {
        let name_pascal = self.api_name.to_case(Case::Pascal);
        let module_name = format!("PlayFab{}Api", name_pascal);

        let mut api_description = self.swagger_spec.info.description.to_owned();
        if !api_description.ends_with(".") {
            api_description.push('.');
        }

        let mut contents = String::new();
        contents.push_str(&format!("# PlayFab {} API\n", name_pascal));
        contents.push_str("\n");

        contents.push_str(&api_description);
        contents.push_str("\n\n");

        contents.push_str("All PlayFab APIs are separated into their own Wally and NPM packages to help prevent redundant code.\n");
        contents.push_str("PlayFab APIs are **big**, and only importing the APIs you actually need will help save thousands of lines of code.\n");
        contents.push_str("\n");

        contents.push_str("Wally is the easiest way to manage the PlayFab SDK, and is currently the only supported distribution method.\n");
        contents.push_str("To use this package, add the following to your `wally.toml` file:\n");
        contents.push_str("\n");

        contents.push_str("```toml\n");
        contents.push_str(&format!(
            "{} = \"{}@{}\"\n",
            module_name, wally_name, version,
        ));
        contents.push_str("```\n");
        contents.push_str("\n");

        contents.push_str("More information and documentation is available at:\n");
        contents.push_str("https://github.com/grilme99/RobloxPlayFabSDK\n");

        fs::write(module_root.join("README.md"), contents)
            .context("Failed to write README.md file")?;

        Ok(())
    }

    fn create_source_file(&self, module_root: &PathBuf) -> anyhow::Result<()> {
        fs::write(module_root.join("init.lua"), "-- TODO: Actually implement codegen\n")
            .context("Failed to write init.lua file")?;

        Ok(())
    }
}