local netTypes = require("../net/types")
type SwaggerSpec = netTypes.SwaggerSpec
type SwaggerLicense = netTypes.SwaggerLicense

local Result = require("../vendor/result")
type Result<T, E> = Result.Result<T, E>

local ACCEPTABLE_LICENSES = {
    "Apache 2.0",
    "Apache-2.0",
}

local function validateLicense(license: SwaggerLicense?): Result<nil, string>
    if license == nil then
        return Result.Err("License information is missing in the Swagger spec.")
    end

    if license.name == nil or license.name == "" then
        return Result.Err("License name is missing in the Swagger spec.")
    end

    if not table.find(ACCEPTABLE_LICENSES, license.name) then
        return Result.Err(
            `Unsupported license: {license.name}. Supported licenses are: {table.concat(ACCEPTABLE_LICENSES, ", ")}`
        )
    end

    return Result.Ok(nil)
end

local function validateSwaggerSpec(spec: SwaggerSpec): Result<nil, string>
    if spec.swagger ~= "2.0" then
        return Result.Err("Unsupported Swagger version. Expected 2.0.")
    end

    if spec.info == nil then
        return Result.Err("Info section is missing in the Swagger spec.")
    end

    if spec.info.version == nil or spec.info.version == "" then
        return Result.Err("API version is missing in the Swagger spec.")
    end

    if spec.info.title == nil or spec.info.title == "" then
        return Result.Err("API title is missing in the Swagger spec.")
    end

    if spec.paths == nil or next(spec.paths) == nil then
        return Result.Err("Paths section is missing or empty in the Swagger spec.")
    end

    if spec.definitions == nil or next(spec.definitions) == nil then
        return Result.Err("Definitions section is missing or empty in the Swagger spec.")
    end

    local licenseValidation = validateLicense(spec.info.license)
    if licenseValidation:isErr() then
        return licenseValidation
    end

    return Result.Ok(nil)
end

return {
    validateSwaggerSpec = validateSwaggerSpec,
}
