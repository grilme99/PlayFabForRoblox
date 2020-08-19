-- Compiled with https://roblox-ts.github.io v0.3.2
-- August 19, 2020, 5:16 PM British Summer Time

local TS = _G[script];
local exports = {};
local HttpService = TS.import(script, TS.getModule(script, "services")).HttpService;
local settings = TS.import(script, script.Parent, "Settings").default;
local GetFullUrl = function(urlPath)
	local fullUrl = "https://" .. settings.settings.titleId .. settings._internalSettings.productionUrl .. urlPath;
	local getParams = settings._internalSettings.requestGetParams;
	local firstParam = true;
	TS.array_forEach(TS.Object_keys(getParams), function(key)
		local value = getParams[key];
		if firstParam then
			fullUrl = fullUrl .. ('?');
			firstParam = false;
		else
			fullUrl = fullUrl .. ('&');
		end;
		fullUrl = fullUrl .. (key .. '=' .. value);
	end);
	return fullUrl;
end;
local MakePlayFabApiCall = TS.async(function(path, requestBody, authKey, authValue)
	local fullUrl = GetFullUrl(path);
	local encodedBody = HttpService:JSONEncode(requestBody);
	local headers = {};
	headers['X-ReportErrorAsSuccess'] = 'true';
	headers['X-PlayFabSDK'] = settings._internalSettings.sdkVersionString;
	headers['Content-Type'] = 'application/json';
	if authKey and (authValue ~= "" and authValue) then
		headers[authKey] = authValue;
	end;
	local success, response = pcall(function()
		return HttpService:RequestAsync({
			Url = fullUrl;
			Method = 'POST';
			Headers = headers;
			Body = encodedBody;
		});
	end);
	if success then
		response = response;
		if response.Success then
			local responseBody = HttpService:JSONDecode(response.Body);
			if responseBody and (responseBody.code == 200) and (responseBody.data) then
				return responseBody.data;
			else
				error(response.StatusMessage);
			end;
		else
			error(response.StatusMessage);
		end;
	else
		error(tostring(response));
	end;
end);
exports.default = MakePlayFabApiCall;
exports.GetFullUrl = GetFullUrl;
return exports;
