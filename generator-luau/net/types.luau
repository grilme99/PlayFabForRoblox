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
	info: SwaggerInfo,
	paths: Map<string, SwaggerPath>,
	definitions: Map<string, SwaggerDefinition>,
}

export type SwaggerInfo = {
	version: string,
	title: string,
	description: string,
}

export type SwaggerSecurity = Map<string, {}>
export type SwaggerPath = {
	-- In our case, all PlayFab API paths are POST
	post: {
		operation_id: string,
		tags: Array<string>,
		description: string,
		external_docs: SwaggerExternalDocs,
		security: Array<SwaggerSecurity>,
		parameters: Array<SwaggerParameter>,
		responses: Map<string, SwaggerResponse>,
		["x-seeAlso"]: Array<string>,
		["x-ms-docs-errors"]: Array<string>,
	},
}

export type SwaggerExternalDocs = {
	url: string,
}

type SwaggerRef = { ["$ref"]: string }
export type SwaggerParameter = SwaggerRef
export type SwaggerResponse = SwaggerRef

export type SwaggerDefinition = {
	description: string?,
	["type"]: string,
	properties: Map<string, SwaggerProperty>?,
	required: Array<string>?,
	enum: Array<string>?,
}

export type SwaggerProperty = {
	description: string?,
	["type"]: string,
	["$ref"]: string?,
	items: Array<SwaggerRef>?,
}

return nil
