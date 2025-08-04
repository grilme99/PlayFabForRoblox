local netTypes = require("../net/types")
type SwaggerSpec = netTypes.SwaggerSpec
type SwaggerDefinition = netTypes.SwaggerDefinition
type SwaggerParameter = netTypes.SwaggerParameter
type SwaggerResponse = netTypes.SwaggerResponse
type SwaggerSecurityDefinition = netTypes.SwaggerSecurityDefinition
type SwaggerPath = netTypes.SwaggerPath

type Array<T> = { T }
type Map<K, V> = { [K]: V }

export type Spec = {
    info: SpecInfo,
    paths: Map<string, Path>,
    definitions: Map<string, Definition>,
    parameters: Map<string, Parameter>,
    responses: Map<string, Response>,
    securityDefinitions: Map<string, SecurityDefinition>,
}

export type SpecInfo = {
    name: string,
    title: string,
    description: string,
    version: string,
}

export type Path = {
    id: string,
    path: string,
    tags: Array<string>?,
    description: string?,
    externalDocs: string?,
    parameters: Array<Parameter>?,
    security: SecurityDefinition?,
    responses: Map<string, Response>,
    requestDetails: string?,
    errorDocs: Array<string>?,
}

type BaseDefinition = {
    description: string?,
    isClass: boolean?,
}

export type Definition_Object = BaseDefinition & {
    type: "object",
    properties: Map<string, Definition>,
    required: Array<string>?,
}

export type Definition_Array = BaseDefinition & {
    type: "array",
    items: Definition,
}

export type Definition_String = BaseDefinition & {
    type: "string",
    enum: Array<string>?,
}

export type Definition_Primitive = BaseDefinition & {
    type: "integer" | "number" | "boolean",
}

export type Definition = Definition_Object | Definition_Array | Definition_String | Definition_Primitive

export type Parameter = {
    name: string,
    description: string?,
    schema: Definition,
}

export type Response = {
    description: string,
    schema: Definition?,
}

export type SecurityDefinition = {
    name: string,
    description: string,
}

-- chatgpt carried from here on in

---------------------------------------------------------------------
-- Helpers -----------------------------------------------------------
---------------------------------------------------------------------

-- Parses a Swagger $ref string (eg. "#/definitions/MyType")
-- Returns category and name parts.
local function parseRef(ref: string): (string, string)
    local parts = string.split(ref, "/")
    if #parts < 3 or parts[1] ~= "#" then
        error(("Unsupported $ref: %s"):format(ref))
    end
    -- parts[2] == category ("definitions" | "parameters" | etc.)
    -- parts[3 .. n]  join back together in case name itself contains "/" (rare).
    local category = parts[2]
    local name = table.concat(parts, "/", 3)
    return category, name
end

---------------------------------------------------------------------
-- Core conversion ---------------------------------------------------
---------------------------------------------------------------------

local function convertSwaggerSpec(apiName: string, swagger: SwaggerSpec): Spec
    -----------------------------------------------------------------
    -- Local conversion context so helpers can share caches ----------
    -----------------------------------------------------------------
    local ctx = {
        swagger = swagger,
        defCache = {} :: Map<string, Definition>,
        paramCache = {} :: Map<string, Parameter>,
        respCache = {} :: Map<string, Response>,
        secCache = {} :: Map<string, SecurityDefinition>,
    }

    -------------------------------------------------------------
    -- Definition ------------------------------------------------
    -------------------------------------------------------------
    local function convertDefinition(swDef: SwaggerDefinition, name: string?): Definition
        if name and ctx.defCache[name] then
            -- already converted (or currently converting via placeholder)
            return ctx.defCache[name]
        end

        -- placeholder so circular refs keep identity
        local placeholder = {} :: any
        if name then
            ctx.defCache[name] = placeholder
        end

        local base: BaseDefinition = {
            description = swDef.description,
            isClass = nil,
        }

        local def: BaseDefinition
        if swDef["type"] == "object" or swDef.properties then
            local props: Map<string, Definition> = {}
            if swDef.properties then
                for propName, prop in swDef.properties do
                    if (prop :: any)["$ref"] then
                        -- property is a ref
                        local _, refName = parseRef((prop :: any)["$ref"])
                        props[propName] = convertDefinition(ctx.swagger.definitions[refName], refName)
                    else
                        props[propName] = convertDefinition(prop :: SwaggerDefinition)
                    end
                end
            end
            def = {
                type = "object",
                description = base.description,
                isClass = base.isClass,
                properties = props,
                required = swDef.required,
            }
        elseif swDef["type"] == "array" then
            local items = swDef.items
            local itemDef: Definition
            if items == nil then
                error("Array definition without items block")
            end
            if (items :: any)["$ref"] then
                local _, refName = parseRef((items :: any)["$ref"])
                itemDef = convertDefinition(ctx.swagger.definitions[refName], refName)
            else
                itemDef = convertDefinition(items :: SwaggerDefinition)
            end
            def = {
                type = "array",
                description = base.description,
                isClass = base.isClass,
                items = itemDef,
            }
        elseif swDef["type"] == "string" then
            def = {
                type = "string",
                description = base.description,
                isClass = base.isClass,
                enum = swDef.enum,
            }
        elseif swDef["type"] == "integer" or swDef["type"] == "number" or swDef["type"] == "boolean" then
            def = {
                type = swDef["type"] :: "integer" | "number" | "boolean",
                description = base.description,
                isClass = base.isClass,
            }
        else
            error(("Unsupported definition type: %s"):format(tostring(swDef["type"])))
        end

        -- hydrate placeholder if we created one
        if name then
            for k, v in def :: any do
                placeholder[k] = v
            end
            return placeholder :: Definition
        else
            return def :: any
        end
    end

    local function resolveDefinitionRef(ref: string): Definition
        local category, refName = parseRef(ref)
        if category ~= "definitions" then
            error(("Expected definitions ref but got: %s"):format(category))
        end
        local swDef = ctx.swagger.definitions[refName]
        if not swDef then
            error(("Missing referenced definition: %s"):format(refName))
        end
        return convertDefinition(swDef, refName)
    end

    -------------------------------------------------------------
    -- Parameter -------------------------------------------------
    -------------------------------------------------------------
    local function convertParameter(swParam: any): Parameter
        -- Handle parameter $ref indirection
        if swParam["$ref"] then
            local _, refName = parseRef(swParam["$ref"])
            if ctx.paramCache[refName] then
                return ctx.paramCache[refName]
            end
            local target = ctx.swagger.parameters[refName]
            if not target then
                error(("Missing referenced parameter: %s"):format(refName))
            end
            local result = convertParameter(target)
            ctx.paramCache[refName] = result
            return result
        end

        local schemaRef = (swParam :: SwaggerParameter).schema["$ref"]
        local param: Parameter = {
            name = swParam.name,
            description = swParam.description,
            schema = resolveDefinitionRef(schemaRef),
        }
        return param
    end

    -------------------------------------------------------------
    -- Response --------------------------------------------------
    -------------------------------------------------------------
    local function convertResponse(swResp: any): Response
        if swResp["$ref"] then
            local _, refName = parseRef(swResp["$ref"])
            if ctx.respCache[refName] then
                return ctx.respCache[refName]
            end
            local target = ctx.swagger.responses[refName]
            if not target then
                error(("Missing referenced response: %s"):format(refName))
            end
            local result = convertResponse(target)
            ctx.respCache[refName] = result
            return result
        end

        local schema: Definition? = nil
        if swResp.schema then
            if (swResp.schema :: any)["$ref"] then
                schema = resolveDefinitionRef((swResp.schema :: any)["$ref"])
            else
                schema = convertDefinition(swResp.schema :: SwaggerDefinition)
            end
        end

        return {
            description = swResp.description,
            schema = schema,
        }
    end

    -------------------------------------------------------------
    -- SecurityDefinition ---------------------------------------
    -------------------------------------------------------------
    local function convertSecurityDefinitionByName(secName: string): SecurityDefinition
        if ctx.secCache[secName] then
            return ctx.secCache[secName]
        end
        local swSec = ctx.swagger.securityDefinitions[secName]
        if not swSec then
            error(("Missing security definition: %s"):format(secName))
        end
        local sec: SecurityDefinition = {
            name = swSec.name,
            description = swSec.description or "",
        }
        ctx.secCache[secName] = sec
        return sec
    end

    -------------------------------------------------------------
    -- Path ------------------------------------------------------
    -------------------------------------------------------------
    local function convertPath(pathStr: string, swPath: SwaggerPath): Path
        local post = swPath.post

        -- security: only first map key used (PlayFab paths use max 1 scheme)
        local secDef: SecurityDefinition? = nil
        if post.security and #post.security > 0 then
            for secName, _ in post.security[1] do
                secDef = convertSecurityDefinitionByName(secName)
                break
            end
        end

        -- parameters
        local params: Array<Parameter>? = nil
        if post.parameters and #post.parameters > 0 then
            params = {}
            for _, p in post.parameters do
                table.insert(params :: any, convertParameter(p))
            end
        end

        -- responses
        local respMap: Map<string, Response> = {}
        for code, resp in post.responses do
            respMap[code] = convertResponse(resp)
        end

        local errorDocs = post["x-ms-docs-errors"]
        local extDocsUrl = post.externalDocs and post.externalDocs.url or nil

        return {
            id = post.operationId,
            path = pathStr,
            tags = post.tags,
            description = post.description,
            externalDocs = extDocsUrl,
            parameters = params,
            security = secDef,
            responses = respMap,
            requestDetails = nil, -- PlayFab swagger doesn't expose a specific field
            errorDocs = errorDocs,
        }
    end

    -------------------------------------------------------------
    -- Kick‑off conversions -------------------------------------
    -------------------------------------------------------------

    -- Definitions first so other pieces can reuse caches deterministically.
    for name, swDef in swagger.definitions do
        if not ctx.defCache[name] then
            convertDefinition(swDef, name)
        end
    end

    -- Parameters map (top‑level)
    local paramMap: Map<string, Parameter> = {}
    for name, swParam in swagger.parameters do
        paramMap[name] = convertParameter(swParam)
    end

    -- Responses map (top‑level)
    local respMap: Map<string, Response> = {}
    for name, swResp in swagger.responses do
        respMap[name] = convertResponse(swResp)
    end

    -- Security definitions map
    local secMap: Map<string, SecurityDefinition> = {}
    for name, _ in swagger.securityDefinitions do
        secMap[name] = convertSecurityDefinitionByName(name)
    end

    -- Paths map
    local pathsMap: Map<string, Path> = {}
    for p, swPath in swagger.paths do
        pathsMap[p] = convertPath(p, swPath)
    end

    -- General info
    local info: SpecInfo = {
        name = apiName,
        title = swagger.info.title,
        description = swagger.info.description,
        version = swagger.info.version,
    }

    local ir: Spec = {
        info = info,
        paths = pathsMap,
        definitions = ctx.defCache,
        parameters = paramMap,
        responses = respMap,
        securityDefinitions = secMap,
    }

    return ir
end

return {
    convertSwaggerSpec = convertSwaggerSpec,
}
