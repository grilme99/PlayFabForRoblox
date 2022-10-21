--!strict

local PlayFabInternal = require(script.Parent.Parent.PlayFabInternal)
local Types = require(script.Parent.Types)

local Apis = {}

--- https://docs.microsoft.com/rest/api/playfab/localization/localization/getlanguagelist
function Apis.GetLanguageListAsync(
	entityToken: string, 
	request: Types.GetLanguageListRequest
): Types.GetLanguageListResponse
	return PlayFabInternal.MakeApiCall(
		"/Locale/GetLanguageList",
		request,
		"X-EntityToken",
		entityToken
	)
end

return Apis

