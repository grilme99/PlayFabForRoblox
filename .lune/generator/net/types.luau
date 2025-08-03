type Array<T> = { T }
type Map<K, V> = { [K]: V }

export type TocResponse = {
    documents: Array<ApiDocument>,
}

export type ApiDocFormat = "Swagger" | "SdkManualNotes" | "LegacyPlayFabApiSpec" | "LegacyPlayFabModels"

export type ApiDocument = {
    --- Full descriptive name used for describing this document to GUI
    name: string,
    --- Path for the API or Swagger Json. Its basically `apispec/dockey` or
    --- `swagger/<api>.swagger.json`
    pfurl: string,
    --- Relative path from this TOC file, to the indicated file
    relPath: string,
    --- Describes the json format for the file
    format: ApiDocFormat,
}

export type SwaggerSpec = {
    swagger: string,
    info: SwaggerInfo,
    paths: Map<string, SwaggerPath>,
    definitions: Map<string, SwaggerDefinition>,
    parameters: Map<string, SwaggerParameter>,
    responses: Map<string, SwaggerResponse>,
    securityDefinitions: Map<string, SwaggerSecurityDefinition>,
    ["x-ms-docs-errors-mapping"]: Map<string, MsDocsErrorMapping>?,
}

export type SwaggerInfo = {
    version: string,
    title: string,
    description: string,
    license: SwaggerLicense?,
}

export type SwaggerLicense = {
    name: string?,
    url: string?,
}

export type SwaggerSecurityDefinition = {
    type: string,
    name: string,
    description: string?,
}

export type SwaggerSecurity = Map<string, {}>

export type SwaggerPath = {
    -- In our case, all PlayFab API paths are POST
    post: {
        operationId: string,
        tags: Array<string>?,
        description: string?,
        externalDocs: SwaggerExternalDocs?,
        parameters: Array<SwaggerParameter>,
        security: Array<SwaggerSecurity>,
        responses: Map<string, SwaggerResponse>,
        ["x-seeAlso"]: Array<string>?,
        ["x-ms-docs-errors"]: Array<string>?,
    },
}

export type SwaggerExternalDocs = {
    url: string,
}

type SwaggerRef = { ["$ref"]: string }

export type SwaggerParameter = {
    name: string,
    description: string?,
    schema: SwaggerRef,
}

export type SwaggerResponse = {
    description: string,
    schema: SwaggerRef | SwaggerDefinition?,
}

export type SwaggerDefinition = {
    description: string?,
    ["type"]: string,
    ["$ref"]: string?,
    properties: Map<string, SwaggerDefinition>?,
    required: Array<string>?,
    items: Array<SwaggerRef>?,
    enum: Array<string>?,
}

export type MsDocsErrorMapping = {
    name: string?,
    id: number?,
}

return nil
