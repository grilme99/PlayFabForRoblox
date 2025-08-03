local ir = require("../../ir")

local Constants = require("../constants")
local NO_EDIT_HEADER = Constants.NO_EDIT_HEADER

local Indent = require("../utility/Indent")
local resolveReferenceName = require("../utility/resolveReferenceName")
local writeLuaComment = require("../utility/writeLuaComment")
type Indent = Indent.Indent

local function writeType(spec: ir.Spec, definition: ir.Definition, indent: Indent): string
    local src = ""

    if definition.type == "object" then
        src ..= "{"
        indent:push()

        local function isRequired(propName: string)
            if definition.required then
                for _, requiredName in definition.required do
                    if requiredName == propName then
                        return true
                    end
                end
            end
            return false
        end

        if definition.properties and next(definition.properties) then
            for name, prop in definition.properties do
                local referenceProp = resolveReferenceName(spec, prop)
                local requiredStr = if isRequired(name) then "" else "?"
                local comment = if prop.description then writeLuaComment(prop.description, indent) .. "\n" else ""

                if referenceProp then
                    src ..= `\n{comment}{indent:get()}{name}: {referenceProp}{requiredStr},`
                else
                    src ..= `\n{comment}{indent:get()}{name}: {writeType(spec, prop, indent)}{requiredStr},`
                end
            end
        else
            src ..= `\n{indent:get()}-- No properties defined in spec`
            src ..= `\n{indent:get()}[string]: any`
        end
        indent:pop()
        src ..= `\n{indent:get()}}`
    elseif definition.type == "array" then
        local referenceItem = resolveReferenceName(spec, definition.items)
        src ..= `\{ {referenceItem or writeType(spec, definition.items, indent)} }`
    elseif definition.type == "string" then
        if definition.enum then
            indent:push()
            for _, value in definition.enum do
                src ..= `\n{indent:get()}| "{value}"`
            end
            indent:pop()
        else
            src ..= "string"
        end
    elseif definition.type == "boolean" then
        src ..= "boolean"
    elseif definition.type == "integer" or definition.type == "number" then
        src ..= "number"
    end

    return src
end

local function writeDefinition(spec: ir.Spec, name: string, definition: ir.Definition, indent: Indent)
    local comment = if definition.description then writeLuaComment(definition.description, indent) .. "\n" else ""
    local src = `{comment}export type {name} = {writeType(spec, definition, indent)}`
    return src
end

local function generateTypes(spec: ir.Spec): string
    local src = ""
    local indent = Indent.new()

    src ..= writeLuaComment(NO_EDIT_HEADER, indent)
    src ..= "\n\n"

    for name, definition in spec.definitions do
        src ..= writeDefinition(spec, name, definition, indent)
        src ..= "\n\n"
    end

    src ..= "\n\nreturn nil\n"

    return src
end

return {
    generateTypes = generateTypes,
}
