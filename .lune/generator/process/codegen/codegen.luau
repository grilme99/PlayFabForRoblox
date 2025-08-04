local fs = require("@lune/fs")
local process = require("@lune/process")

local Result = require("../../vendor/result")
type Result<T, E> = Result.Result<T, E>

local ir = require("../ir")

local apis = require("./files/apis")
local entry = require("./files/entry")
local readme = require("./files/readme")
local rojo = require("./files/rojo")
local types = require("./files/types")
local wally = require("./files/wally")

local function buildPackage(spec: ir.Spec): Result<nil, string>
    local basePath = `modules/{spec.info.name}`

    -- Use scopes to avoid variable shadowing
    do
        local success, err = pcall(fs.writeDir, basePath)
        if not success then
            return Result.Err(`Failed to write package directory ({basePath}):\n\t{err}`)
        end
    end

    -- Create the top-level files
    do
        local success, err = pcall(fs.writeFile, `{basePath}/README.md`, readme.generateReadme(spec))
        if not success then
            return Result.Err(`Failed to write README.md file:\n\t{err}`)
        end
    end
    do
        local success, err = pcall(fs.writeFile, `{basePath}/default.project.json`, rojo.generateRojoProject(spec))
        if not success then
            return Result.Err(`Failed to write default.project.json file:\n\t{err}`)
        end
    end
    do
        local success, err = pcall(fs.writeFile, `{basePath}/wally.toml`, wally.generateWally(spec))
        if not success then
            return Result.Err(`Failed to write wally.toml file:\n\t{err}`)
        end
    end

    -- Create the source files
    do
        local success, err = pcall(fs.writeDir, `{basePath}/src`)
        if not success then
            return Result.Err(`Failed to write source directory ({basePath}/src):\n\t{err}`)
        end
    end
    do
        local success, err = pcall(fs.writeFile, `{basePath}/src/init.luau`, entry.generateEntry(spec))
        if not success then
            return Result.Err(`Failed to write init.luau file:\n\t{err}`)
        end
    end
    do
        local success, err = pcall(fs.writeFile, `{basePath}/src/Apis.luau`, apis.generateApis(spec))
        if not success then
            return Result.Err(`Failed to write apis.luau file:\n\t{err}`)
        end
    end
    do
        local success, err = pcall(fs.writeFile, `{basePath}/src/Types.luau`, types.generateTypes(spec))
        if not success then
            return Result.Err(`Failed to write types.luau file:\n\t{err}`)
        end
    end

    -- Run Stylua to format the generated files
    do
        local result = process.exec("stylua", {
            basePath,
        })

        if not result.ok then
            return Result.Err(`Failed to format generated files with Stylua:\n\t{result.stderr}`)
        end
    end

    return Result.Ok(nil)
end

return {
    buildPackage = buildPackage,
}
