--!strict
--[=[
	# LocalizationApi

	The Localization APIs give you the tools needed to manage language setup in 
	your title. 
]=]

local PlayFabInternal = require(script.Parent.PlayFabInternal)

local LocalizationApi = {}

function LocalizationApi.SetSettings(settings: PlayFabInternal.ISettings)
	PlayFabInternal.SetSettings(settings)
end

--- The basic wrapper around every failed API response 
export type ApiErrorWrapper = {
	code: number, --- Numerical HTTP code
	error: string?, --- Playfab error code
	errorCode: number, --- Numerical PlayFab error code
	errorDetails: {[any]: any}?, --- Detailed description of individual issues with the request object
	errorMessage: string?, --- Description for the PlayFab errorCode
	status: string?, --- String HTTP code
}

export type GetLanguageListRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
}

export type GetLanguageListResponse = {
	LanguageList: {any}?, --- The list of allowed languages, in BCP47 two-letter format
}


--- https://docs.microsoft.com/rest/api/playfab/localization/localization/getlanguagelist
function LocalizationApi.GetLanguageListAsync(
	entityToken: string, 
	request: GetLanguageListRequest
): GetLanguageListResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Localization/GetLanguageList",
		request,
		"X-EntityToken",
		entityToken
	)
end

return LocalizationApi

