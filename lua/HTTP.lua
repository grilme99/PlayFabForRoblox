local HttpService = game:GetService("HttpService")
local Promise = require(script.Parent.Promise)
local Settings = require(script.Parent.Settings)

local function GetFullUrl(urlPath)
	local fullUrl = "https://" .. Settings.settings.titleId .. Settings._internalSettings.productionUrl .. urlPath
	local getParams = Settings._internalSettings.requestGetParams
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

local MakePlayFabApiCall = Promise.promisify(function(path, requestBody, authKey, authValue)
	local fullUrl = GetFullUrl(path)
	local encodedBody = HttpService:JSONEncode(requestBody)
	local headers = {
		["X-ReportErrorAsSuccess"] = "true",
		["X-PlayFabSDK"] = Settings._internalSettings.sdkVersionString,
		["Content-Type"] = "application/json",
	}

	if authKey and authValue ~= "" and authValue then
		headers[authKey] = authValue
	end

	local success, response = pcall(HttpService.RequestAsync, HttpService, {
		Url = fullUrl,
		Method = "POST",
		Headers = headers,
		Body = encodedBody,
	})

	if success then
		if response.Success then
			local responseBody = HttpService:JSONDecode(response.Body)
			if responseBody and responseBody.code == 200 and responseBody.data then
				return responseBody.data
			else
				error(response.StatusMessage)
			end
		else
			error(response.StatusMessage)
		end
	else
		error(tostring(response))
	end
end)

return {
	GetFullUrl = GetFullUrl,
	MakePlayFabApiCall = MakePlayFabApiCall,
}