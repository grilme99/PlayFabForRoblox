local serde = require("@lune/serde")

local ir = require("../../ir")

local Constants = require("../constants")
local NO_EDIT_HEADER = Constants.NO_EDIT_HEADER

local function generateWally(spec: ir.Spec)
    local toml = serde.encode("toml", {
        package = {
            name = `playfab-luau/{spec.info.name}`,
            description = spec.info.description,
            version = `3.{spec.info.version}.0`,
            license = "Apache-2.0",
            authors = { "Brooke Rhodes <hello@brooke.sh>" },
            registry = "https://github.com/UpliftGames/wally-index",
            realm = "shared",
        },
        dependencies = {
            PlayFabCommon = "playfab-luau/sdk-common@^3.0.0",
        },
    }, true)

    return `# {NO_EDIT_HEADER}\n\n{toml}`
end

return {
    generateWally = generateWally,
}
