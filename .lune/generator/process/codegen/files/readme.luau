local ir = require("../../ir")

local Constants = require("../constants")
local NO_EDIT_HEADER = Constants.NO_EDIT_HEADER

local function generateReadme(spec: ir.Spec)
    -- TODO: Fill out README
    return table.concat({
        `<!-- {NO_EDIT_HEADER} -->`,
        ``,
        `# {spec.info.name}`,
        ``,
        `> {spec.info.description}`,
        ``,
        `## Installation`,
        ``,
        `## Usage`,
        ``,
        `## License`,
        ``,
    }, "\n")
end

return {
    generateReadme = generateReadme,
}
