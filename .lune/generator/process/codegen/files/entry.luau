local ir = require("../../ir")

local Constants = require("../constants")
local NO_EDIT_HEADER = Constants.NO_EDIT_HEADER

local Indent = require("../utility/Indent")
local writeLuaComment = require("../utility/writeLuaComment")

local function writeTypeImports(spec: ir.Spec): string
    local src = "local Types = require(script.Types)\n"

    for name, _ in spec.definitions do
        src ..= `export type {name} = Types.{name}\n`
    end

    return src
end

local function generateEntry(spec: ir.Spec)
    local src = ""
    local indent = Indent.new()

    src ..= writeLuaComment(NO_EDIT_HEADER, indent)
    src ..= "\n\n"

    src ..= writeTypeImports(spec)

    src ..= "\n"
    src ..= "local Apis = require(script.Apis)\n"
    src ..= "return table.freeze(Apis)\n"

    return src
end

return {
    generateEntry = generateEntry,
}
