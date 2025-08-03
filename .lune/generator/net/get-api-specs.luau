local net = require("@lune/net")
local serde = require("@lune/serde")

local NetworkTypes = require("./types")
local Result = require("../vendor/result")
local createSpinner = require("../../utility/createSpinner")

local API_SPEC_URL = "https://raw.githubusercontent.com/PlayFab/API_Specs/master"
local TOC_PATH = "TOC.json"

type ApiDocument = NetworkTypes.ApiDocument
type TocResponse = NetworkTypes.TocResponse
type SwaggerSpec = NetworkTypes.SwaggerSpec

type Result<T, E> = Result.Result<T, E>

type Map<K, V> = { [K]: V }
export type ApiSpecs = {
    toc: TocResponse,
    apiCount: number,
    apis: Map<string, SwaggerSpec>,
}

local function extractAPIName(str: string): string
    return str:match("PlayFab/(.-)%.swagger%.json") or ""
end

local function pascalToKebab(name: string): string
    local converted = name:gsub("([A-Z])", function(char)
        return "-" .. char:lower()
    end)
    return (converted:sub(1, 1) == "-") and converted:sub(2) or converted
end

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
    local spinner = createSpinner()
    spinner.setText("Fetching table of contents")
    spinner.start()

    return getTableOfContentsAsync():andThen(function(toc: TocResponse)
        -- Fetch all of the API specs
        local apiSpecs = {}
        local apiCount = 0

        for _, doc in toc.documents do
            -- Skip non-swagger formats because all others are legacy.
            if doc.format ~= "Swagger" then
                continue
            end

            local apiName = extractAPIName(doc.relPath)
            local apiNameFormatted = pascalToKebab(apiName)

            -- local cachedSpec = swaggerCache.getCachedSwaggerSpec(apiNameFormatted, doc)

            spinner.setText(`Fetching API spec: {apiName} ({apiCount + 1}/{#toc.documents})`)

            local apiSpec, err = getApiSpecAsync(doc.relPath):unpack()
            if err then
                return Result.Err(err)
            end

            apiSpecs[apiNameFormatted] = apiSpec
            apiCount += 1

            break
        end

        spinner.stop()
        return Result.Ok({
            toc = toc,
            apiCount = apiCount,
            apis = apiSpecs,
        })
    end)
end

return getApiSpecsAsync
