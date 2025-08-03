local serde = require("@lune/serde")

local ir = require("../../ir")

local function generateRojoProject(spec: ir.Spec)
    local project = serde.encode("json", {
        name = spec.info.name,
        tree = {
            ["$path"] = "src",
        },
    }, true)

    return project
end

return {
    generateRojoProject = generateRojoProject,
}
