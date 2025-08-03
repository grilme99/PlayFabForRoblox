local fs = require("@lune/fs")
local serde = require("@lune/serde")

local getApiSpecs = require("./net/get-api-specs")
type ApiSpecs = getApiSpecs.ApiSpecs

local function generateRojoProject(specs: ApiSpecs)
    local project = {
        name = "PlayFab Sourcemap",
        tree = {
            ["$className"] = "DataModel",
            ReplicatedStorage = {
                Packages = {
                    ["$path"] = "Packages",
                    PlayFabCommon = {
                        ["$path"] = "common",
                    },
                },
            },
        },
    }

    -- Populate the packages
    for apiName, _ in specs.apis do
        local tbl = project.tree.ReplicatedStorage.Packages
        tbl[apiName] = {
            ["$path"] = `modules/{apiName}`,
        }
    end

    local contents = serde.encode("json", project, true)
    fs.writeFile("default.project.json", contents)
end

return {
    generateRojoProject = generateRojoProject,
}
