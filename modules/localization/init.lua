--!strict
--[=[
	# LocalizationApi

	The Localization APIs give you the tools needed to manage language setup in 
	your title. 

	API Version: 1.221024.0
]=]

local PlayFabInternal = require(script.Parent.PlayFabInternal)
local Types = require(script.Types)

local LocalizationApi = require(script.Apis)

function LocalizationApi.SetSettings(settings: PlayFabInternal.ISettings)
	PlayFabInternal.SetSettings(settings)
end

export type ApiErrorWrapper = Types.ApiErrorWrapper
export type GetLanguageListRequest = Types.GetLanguageListRequest
export type GetLanguageListResponse = Types.GetLanguageListResponse

return LocalizationApi

