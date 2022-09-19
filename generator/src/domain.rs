use derive_more::Deref;
use serde::Serialize;

/// Represents a specific PlayFab API (e.g. matchmaking, admin, etc).
#[derive(Debug, Deref)]
pub struct PlayFabAPI(pub String);

#[derive(Debug, Serialize)]
pub struct APIWallyConfig {
    pub package: APIWallyPackage,
    pub dependencies: ApiWallyDependencies,
}

#[derive(Debug, Serialize)]
pub struct APIWallyPackage {
    pub name: String,
    pub description: String,
    pub version: String,
    pub license: String,
    pub authors: Vec<String>,
    pub registry: String,
    pub realm: String,
}

#[derive(Debug, Serialize)]
#[serde(rename_all = "PascalCase")]
pub struct ApiWallyDependencies {
    pub play_fab_internal: String,
}
