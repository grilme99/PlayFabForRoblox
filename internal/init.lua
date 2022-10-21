--!strict
---@diagnostic disable: undefined-type

local HttpService = game:GetService("HttpService")

export type ISettings = {
	titleId: string,
	secretKey: string,

	-- Probably don't need to edit
	productionUrl: string,
	verticalName: string | nil, --- The name of a customer vertical. This is only for customers running a private cluster. Generally you shouldn't touch this
}

local Settings: ISettings = {
	titleId = "",
	secretKey = "",

	productionUrl = ".playfabapi.com",
	verticalName = nil,
}

local SDK_VERSION_STRING = "RobloxSdk_undefined"
local REQUEST_GET_PARAMS = { ["sdk"] = SDK_VERSION_STRING }

local function GetFullUrl(urlPath: string)
	local fullUrl = "https://" .. Settings.titleId .. Settings.productionUrl .. urlPath
	local getParams = REQUEST_GET_PARAMS
	local firstParam = true
	for key, value in pairs(getParams) do
		if firstParam then
			fullUrl ..= "?"
			firstParam = false
		else
			fullUrl ..= "&"
		end

		fullUrl ..= key .. "=" .. value
	end

	return fullUrl
end

local PlayFabInternal = {}

function PlayFabInternal.SetSettings(settings: ISettings)
	Settings = table.clone(settings)
end

function PlayFabInternal.MakeApiCall(path: string, requestBody: any, authKey: string?, authValue: string?): never
	local fullUrl = GetFullUrl(path)
	local headers = {
		["X-ReportErrorAsSuccess"] = "true",
		["X-PlayFabSDK"] = SDK_VERSION_STRING,
		["Content-Type"] = "application/json",
	}

	if authKey and authValue ~= "" and authValue then
		headers[authKey] = authValue
	end

	requestBody.TitleID = Settings.titleId
	local encodedBody = HttpService:JSONEncode(requestBody)

	local success, response = pcall(HttpService.RequestAsync, HttpService, {
		Url = fullUrl,
		Method = "POST",
		Headers = headers,
		Body = encodedBody,
	})

	-- FIXME: These return types don't fully match what's expected
	if success then
		if response.Success then
			local responseBody = HttpService:JSONDecode(response.Body)
			if responseBody and responseBody.code == 200 and responseBody.data then
				return responseBody.data
			else
				error(response)
			end
		else
			error(response)
		end
	else
		error(tostring(response))
	end
end

return PlayFabInternal
