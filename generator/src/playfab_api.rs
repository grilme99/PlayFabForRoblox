//! Handles interaction with the PlayFab API

use std::collections::BTreeMap;

use serde::Deserialize;

const API_SPEC_URL: &str = "https://raw.githubusercontent.com/PlayFab/API_Specs/master";
const TOC_PATH: &str = "TOC.json";

#[derive(Deserialize, Debug)]
pub struct TocResponse {
    pub documents: Vec<APiDocument>,
}

#[derive(Deserialize, Debug)]
#[serde(rename_all = "camelCase")]
pub struct APiDocument {
    pub name: String,
    pub rel_path: String,
}

#[derive(Deserialize, Debug)]
pub struct SwaggerSpec {
    pub info: SwaggerInfo,
    pub paths: BTreeMap<String, SwaggerPath>,
    pub definitions: BTreeMap<String, SwaggerTypeDefinition>,
}

#[derive(Deserialize, Debug)]
pub struct SwaggerInfo {
    pub version: String,
    pub description: String,
}

#[derive(Deserialize, Debug)]
pub struct SwaggerPath {
    // All PlayFab requests should only be POST requests, so this is fine
    pub post: SwaggerPathPost,
}

#[derive(Deserialize, Debug)]
#[serde(rename_all = "camelCase")]
pub struct SwaggerPathPost {
    pub operation_id: String,
    pub tags: Vec<String>,
    pub description: String,
    pub external_docs: ExternalDocs,
}

#[derive(Deserialize, Debug)]
pub struct ExternalDocs {
    pub url: String,
}

#[derive(Deserialize, Debug)]
pub struct SwaggerTypeDefinition {
    pub description: Option<String>,
    #[serde(rename = "type")]
    pub def_type: String,
    pub properties: Option<BTreeMap<String, SwaggerDefinitionProperty>>,
    pub required: Option<Vec<String>>,
    #[serde(rename = "enum")]
    pub def_enum: Option<Vec<String>>
}

#[derive(Deserialize, Debug)]
pub struct SwaggerDefinitionProperty {
    pub description: Option<String>,
    #[serde(rename = "type")]
    pub def_type: String,
    #[serde(rename = "$ref")]
    pub def_ref: Option<String>,
    pub items: Option<SwaggerDefinitionItems>,
}

#[derive(Deserialize, Debug)]
pub struct SwaggerDefinitionItems {
    #[serde(rename = "$ref")]
    pub def_ref: Option<String>,
}

pub async fn collect_api_specs() -> anyhow::Result<Vec<APiDocument>> {
    let toc: TocResponse = reqwest::get(format!("{}/{}", API_SPEC_URL, TOC_PATH))
        .await?
        .json::<TocResponse>()
        .await?;

    // Get each API spec in parallel
    let documents: Vec<APiDocument> = toc
        .documents
        .into_iter()
        .filter(|i| i.rel_path.starts_with("Swagger/"))
        .collect();

    log::info!("Got {} API specs", &documents.len());

    Ok(documents)
}

pub async fn get_api_spec(doc: &APiDocument) -> anyhow::Result<SwaggerSpec> {
    log::debug!("Fetching API spec for {}", doc.name);

    let path = &doc.rel_path[8..];
    let swagger_spec = reqwest::get(format!("{}/Swagger/{}", API_SPEC_URL, path))
        .await?
        .json::<SwaggerSpec>()
        .await?;

    log::debug!("Got API response for {}", doc.name);

    Ok(swagger_spec)
}
