local HttpService = require(script.HttpService)

local PlayFabCommon = {}

local SDK_VERSION_STRING = "LuauSDK-unknown"

type Map<K, V> = { [K]: V }

export type Result<T, E> = {
	ok: true,
	value: T,
} | {
	ok: false,
	error: E,
}

export type Settings = {
	--[[
        You must set this value for PlayFab to work properly (Found in the
        Game Manager for your title, at the PlayFab website).

        This can either be a `string` or a `Secret`. The latter is returned by
        [`HttpService:GetSecret()`](https://create.roblox.com/docs/reference/engine/classes/HttpService#GetSecret).
        Secrets cannot be replicated to clients, printed to the console, or
        accessed from inside Studio.
    ]]
	titleId: string | Secret,
	--[[
        For security reasons you must never expose this value to the client or
        players - You must set this value for Server-APIs to work properly
        (Found in the Game Manager for your title, at the PlayFab website).

        This can either be a `string` or a `Secret`. The latter is returned by
        [`HttpService:GetSecret()`](https://create.roblox.com/docs/reference/engine/classes/HttpService#GetSecret).
        Secrets cannot be replicated to clients, printed to the console, or
        accessed from inside Studio.
    ]]
	secretKey: string | Secret,

	-- You only need to touch these values if you are an enterprise PlayFab
	-- customer.
	productionUrl: string,
	verticalName: string?,

	-- Mostly internal settings
	requestGetParams: Map<string, string>?,
}

local settings: Settings = {
	titleId = "",
	secretKey = "",

	productionUrl = ".playfabapi.com",
	verticalName = nil,

	requestGetParams = {
		-- TODO: Get the actual SDK version
		sdk = "LuauSdk-unknown",
	},
}
PlayFabCommon.settings = settings

--[[
    Given a URL path, returns the full URL with the title ID and production URL.
    This could return a string or `Secret` object, depending on how the title ID
    is set.
]]
local function getFullUrl(urlPath: string): string | Secret
	local fullUrl: string | Secret
	local titleId = settings.titleId
	if type(titleId) == "string" then
		fullUrl = `https://{titleId}{settings.productionUrl}{urlPath}`
	else
		-- This is a Secret object
		local first = titleId:AddPrefix("https://")
		fullUrl = first:AddSuffix(`{settings.productionUrl}{urlPath}`)
	end

	local getParams = settings.requestGetParams
	local queryString = ""

	if getParams then
		local firstParam = true
		for key, value in getParams do
			if firstParam then
				queryString ..= "?"
				firstParam = false
			else
				queryString ..= "&"
			end

			queryString ..= key .. "=" .. value
		end
	end

	if type(fullUrl) == "string" then
		fullUrl ..= queryString
	else
		fullUrl = fullUrl:AddSuffix(queryString)
	end

	return fullUrl
end
PlayFabCommon.getFullUrl = getFullUrl

local function makeApiCall(path: string, requestBody: any, authKey: string?, authValue: string?): Result<any, string>
	local fullUrl = getFullUrl(path)
	local headers = {
		["X-ReportErrorAsSuccess"] = "false",
		["X-PlayFabSDK"] = SDK_VERSION_STRING,
		["Content-Type"] = "application/json",
	}

	if authKey and authValue ~= "" and authValue then
		headers[authKey] = authValue
	end

	requestBody.TitleID = settings.titleId
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
PlayFabCommon.makeApiCall = makeApiCall

return table.freeze(PlayFabCommon)
