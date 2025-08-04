local process = require("@lune/process")
local stdio = require("@lune/stdio")

local getApiSpecsAsync = require("@self/net/get-api-specs")
local processModule = require("@self/process/process")
local rojo = require("@self/rojo")

local utility = require("@self/utility")
local tableHasValue = utility.tableHasValue

local Result = require("@self/vendor/result")
type Result<T, E> = Result.Result<T, E>

local function main(): Result<nil, string>
    local args = process.args

    -- Parse arguments
    local _publishPackages = tableHasValue(args, "--publish-packages")
    local help = tableHasValue(args, "--help")

    if help then
        print("Usage: lune run generator -- [--publish-packages] [--help]")
        print("Options:")
        print("  --publish-packages: Publish packages to Wally and Pesde for Lua and NPM for TypeScript")
        print("  --help: Display this help message")
        return Result.Ok(nil)
    end

    local apiSpecs, err = getApiSpecsAsync():unpack()
    if err then
        return Result.Err(err)
    end

    rojo.generateRojoProject(apiSpecs)

    for apiName, api in apiSpecs.apis do
        -- local success, result = buildPackage({
        --     name = apiName,
        --     title = api.info.title,
        --     version = api.info.version,
        --     description = api.info.description,
        -- }):unpack()

        -- if not success then
        --     return Result.Err(result)
        -- end

        local processResult = processModule.processSpec(apiName, api)
        if processResult:isErr() then
            return Result.Err(`Failed to process API {apiName}: {processResult:unwrapErr()}`)
        end

        -- break
    end

    return Result.Ok(nil)
end

local _, err = main():unpack()
if err then
    stdio.write(stdio.color("red"))
    stdio.write(stdio.style("bold"))

    print("An error occurred:")
    print(err)

    stdio.write(stdio.style("reset"))
    return true
end
