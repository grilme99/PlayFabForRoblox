local netTypes = require("../net/types")
type SwaggerSpec = netTypes.SwaggerSpec

local Result = require("../vendor/result")
type Result<T, E> = Result.Result<T, E>

local codegen = require("./codegen")
local ir = require("./ir")
local validate = require("./validate")

local function processSpec(apiName: string, rawSpec: SwaggerSpec): Result<nil, string>
    local validationResult = validate.validateSwaggerSpec(rawSpec)
    if validationResult:isErr() then
        return Result.Err(`Validation failed: {validationResult:unwrapErr()}`)
    end

    local spec = ir.convertSwaggerSpec(apiName, rawSpec)

    local codegenResult = codegen.buildPackage(spec)
    if codegenResult:isErr() then
        return Result.Err(`Code generation failed: {codegenResult:unwrapErr()}`)
    end

    return Result.Ok(nil)
end

return {
    processSpec = processSpec,
}
