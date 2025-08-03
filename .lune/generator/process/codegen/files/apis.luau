local ir = require("../../ir")

local Constants = require("../constants")
local NO_EDIT_HEADER = Constants.NO_EDIT_HEADER

local Indent = require("../utility/Indent")
local resolveReferenceName = require("../utility/resolveReferenceName")
local writeLuaComment = require("../utility/writeLuaComment")
type Indent = Indent.Indent

local function writeRequestComment(path: ir.Path, indent: Indent): string
    local src = ""

    if path.description then
        src ..= path.description .. "\n\n"
    end

    -- Add the description for the request parameter, as it usually has more
    -- details.
    local paramDescription = path.parameters and path.parameters[1].description
    if paramDescription then
        src ..= paramDescription .. "\n\n"
    end

    if path.externalDocs then
        src ..= `For more information, see the [External Documentation]({path.externalDocs}).`
    end

    if path.errorDocs then
        src ..= "\n\n"
        src ..= "### Errors\n"
        for _, errorDoc in path.errorDocs do
            src ..= `- {errorDoc}\n`
        end
    end

    return writeLuaComment(src, indent)
end

local function getAuthParam(path: ir.Path): string?
    local security = path.security and path.security.name
    if security == "X-SecretKey" then
        -- The secret key is defined as a setting externally, so it doesn't
        -- need to be passed as a parameter.
        return nil
    elseif security == "X-EntityToken" then
        return "entityToken"
    elseif security == "X-Authorization" then
        return "sessionTicket"
    else
        error(`Unknown security type "{security}" for path "{path.id}"`)
    end
end

local function writeRequest(spec: ir.Spec, path: ir.Path, indent: Indent): string
    local src = ""

    -- In the playfab API, every request path has exactly one parameter.
    if path.parameters == nil or #path.parameters ~= 1 then
        error(`Path "{path.id}" must have exactly one parameter.`)
    end

    local referenceRequest = resolveReferenceName(spec, path.parameters[1].schema)
    if referenceRequest == nil then
        error(`Could not resolve reference for request parameter in path "{path.id}".`)
    end

    local successResponse = path.responses["200"]
    if successResponse == nil or successResponse.schema == nil then
        error(`Path "{path.id}" must have a "200" response defined.`)
    end

    local referenceResponse = resolveReferenceName(spec, (successResponse :: any).schema.properties.data)
    if referenceResponse == nil then
        error(`Could not resolve reference for response schema in path "{path.id}".`)
    end

    local comment = writeRequestComment(path, indent) .. "\n"
    local authParam = getAuthParam(path)

    src ..= `{comment}{indent:get()}function Apis.{path.id}(request: Types.{referenceRequest}`
    if authParam then
        src ..= `, {authParam}: string`
    end
    src ..= `): Result<Types.{referenceResponse}, string>\n`

    indent:push()

    src ..= `{indent:get()}return makeApiCall(\n`
    indent:push()

    src ..= `{indent:get()}"{path.path}",\n`
    src ..= `{indent:get()}request`

    if path.security then
        src ..= `,\n`
        src ..= `{indent:get()}"{path.security.name}"`

        if authParam then
            src ..= ",\n"
            src ..= `{indent:get()}{authParam}\n`
        else
            src ..= `\n`
        end
    else
        src ..= `\n`
    end

    indent:pop()
    src ..= `{indent:get()})\n`

    indent:pop()
    src ..= "end"

    return src
end

local function generateApis(spec: ir.Spec): string
    local src = ""
    local indent = Indent.new()

    src ..= writeLuaComment(NO_EDIT_HEADER, indent)
    src ..= "\n\n"

    src ..= "local Types = require(script.Parent.Types)\n\n"

    src ..= "local Common = require(script.Parent.Parent.PlayFabCommon)\n"
    src ..= "local makeApiCall = Common.makeApiCall\n"
    src ..= "type Result<T, E> = Common.Result<T, E>\n\n"

    src ..= "local Apis = {}\n\n"

    for _, path in spec.paths do
        src ..= writeRequest(spec, path, indent)
        src ..= "\n\n"
    end

    src ..= "return Apis\n"

    return src
end

return {
    generateApis = generateApis,
}
