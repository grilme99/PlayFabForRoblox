--!strict
--[=[
	# LocalizationApi

	The Localization APIs give you the tools needed to manage language setup in 
	your title. 

	API Version: 1.220926.6
]=]

local PlayFabInternal = require(script.Parent.PlayFabInternal)

local LocalizationApi = {}

function LocalizationApi.SetSettings(settings: PlayFabInternal.ISettings)
	PlayFabInternal.SetSettings(settings)
end

--- The basic wrapper around every failed API response 
export type ApiErrorWrapper = {
	--- Numerical HTTP code 
	code: number,
	--- Playfab error code 
	error: string?,
	--- Numerical PlayFab error code 
	errorCode: number,
	--- Detailed description of individual issues with the request object 
	errorDetails: {[any]: any}?,
	--- Description for the PlayFab errorCode 
	errorMessage: string?,
	--- String HTTP code 
	status: string?,
}

export type GetLanguageListRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
}

export type GetLanguageListResponse = {
	--- The list of allowed languages, in BCP47 two-letter format 
	LanguageList: {any}?,
}


--- https://docs.microsoft.com/rest/api/playfab/localization/localization/getlanguagelist
function LocalizationApi.GetLanguageListAsync(
	entityToken: string, 
	request: GetLanguageListRequest
): GetLanguageListResponse
	return PlayFabInternal.MakeApiCall(
		"/Locale/GetLanguageList",
		request,
		"X-EntityToken",
		entityToken
	)
end

return LocalizationApi

