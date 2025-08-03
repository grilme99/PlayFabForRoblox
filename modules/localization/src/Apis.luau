--[[
	This file was generated on 2025-08-03 at 00:04 UTC. Do not edit directly.

]]

local Types = require(script.Parent.Types)

local Common = require(script.Parent.Parent.PlayFabCommon)
local makeApiCall = Common.makeApiCall
type Result<T, E> = Common.Result<T, E>

local Apis = {}

--[[
	Retrieves the list of allowed languages, only accessible by title entities

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/localization/localization/getlanguagelist).

]]
function Apis.GetLanguageList(request: Types.GetLanguageListRequest, entityToken: string): Result<Types.GetLanguageListResponse, string>
	return makeApiCall(
		"/Locale/GetLanguageList",
		request,
		"X-EntityToken",
		entityToken
	)
end

return Apis
