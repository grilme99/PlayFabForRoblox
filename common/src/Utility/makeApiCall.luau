local PackageRoot = script.Parent.Parent

local HttpService = require(PackageRoot.HttpService)
local Settings = require(PackageRoot.Settings)
local VERSION = require(PackageRoot.VERSION)
local getFullUrl = require(PackageRoot.Utility.getFullUrl)

local Types = require(PackageRoot.Types)
type Result<T, E> = Types.Result<T, E>

local function makeApiCall(path: string, requestBody: any, authKey: string?, authValue: string?): Result<any, string>
    local fullUrl = getFullUrl(path)
    local headers = {
        ["X-ReportErrorAsSuccess"] = "false",
        ["X-PlayFabSDK"] = VERSION,
        ["Content-Type"] = "application/json",
    }

    if authKey and authValue ~= "" and authValue then
        headers[authKey] = authValue
    end

    requestBody.TitleID = Settings.titleId
    local encodeSuccess, encodedBody = pcall(HttpService.JSONEncode, HttpService, requestBody)
    if not encodeSuccess then
        return {
            ok = false,
            error = "Failed to encode JSON: " .. encodedBody,
        }
    end

    local success, response = pcall(HttpService.RequestAsync, HttpService, {
        Url = fullUrl,
        Method = "POST",
        Headers = headers,
        Body = encodedBody,
    })

    if not success then
        return {
            ok = false,
            error = "Failed to make request. Response:" .. response,
        }
    end

    if response.Success then
        local decodeSuccess, responseBody = pcall(HttpService.JSONDecode, HttpService, response.Body)
        if not decodeSuccess then
            return {
                ok = false,
                error = `Failed to decode JSON (body: {response.Body}): {responseBody}`,
            }
        end

        if responseBody and responseBody.code == 200 and responseBody.data then
            return {
                ok = true,
                value = responseBody.data,
            }
        else
            return {
                ok = false,
                error = responseBody.errorDetails
                    or responseBody.errorMessage
                    or responseBody.errorCode
                    or "Unknown PlayFab error",
            }
        end
    else
        return {
            ok = false,
            error = `Request failed with status '{response.StatusMessage}' and body: {response.Body}`,
        }
    end
end

return makeApiCall
