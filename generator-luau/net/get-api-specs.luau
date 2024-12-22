local net = require("@lune/net")
local serde = require("@lune/serde")
local stdio = require("@lune/stdio")

local NetworkTypes = require("./types")
local Result = require("../vendor/result")

local API_SPEC_URL = "https://raw.githubusercontent.com/PlayFab/API_Specs/master"
local TOC_PATH = "TOC.json"

type ApiDocument = NetworkTypes.ApiDocument
type TocResponse = NetworkTypes.TocResponse
type SwaggerSpec = NetworkTypes.SwaggerSpec

type Result<T, E> = Result.Result<T, E>

type Array<T> = { T }
export type ApiSpecs = {
	toc: TocResponse,
	apis: Array<ApiDocument>,
}

-- Gets the table of contents (TOC) for the PlayFab API specs
local function getTableOfContentsAsync(): Result<TocResponse, string>
	local req = net.request({
		url = `{API_SPEC_URL}/{TOC_PATH}`,
		method = "GET",
	})

	if not req.ok then
		return Result.Err("Failed to fetch table of contents (TOC.json)")
	end

	local toc = serde.decode("json", req.body)
	return Result.Ok(toc)
end

local function getApiSpecAsync(relativePath: string): Result<SwaggerSpec, string>
	local req = net.request({
		url = `{API_SPEC_URL}/{relativePath}`,
		method = "GET",
	})

	if not req.ok then
		return Result.Err(`Failed to fetch API spec: {relativePath}`)
	end

	local apiSpec = serde.decode("json", req.body)
	return Result.Ok(apiSpec)
end

local function getApiSpecsAsync(): Result<ApiSpecs, string>
	return getTableOfContentsAsync():andThen(function(toc: TocResponse)
		stdio.write(stdio.style("dim"))
		stdio.write(stdio.style("bold"))
		print(`  Fetched table of contents (found {#toc.documents} API documents)`)

		-- Fetch all of the API specs
		local apiSpecs = {}
		for _, doc in toc.documents do
			-- Skip non-swagger formats because all others are legacy.
			if doc.format ~= "Swagger" then
				continue
			end

			local apiSpec, err = getApiSpecAsync(doc.relPath):unpack()
			if err then
				return Result.Err(err)
			end

			print(`  Fetched API spec: {apiSpec.info.title}`)
			table.insert(apiSpecs, apiSpec)
		end

		stdio.write(stdio.style("reset"))
		return Result.Ok({
			toc = toc,
			apis = apiSpecs,
		})
	end)
end

return getApiSpecsAsync
