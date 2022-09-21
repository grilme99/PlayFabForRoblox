--!strict
--[=[
	# LeaderboardsApi

	Manage entity statistics Manage entity statistics. 
]=]

local PlayFabInternal = require(script.Parent.PlayFabInternal)

local LeaderboardsApi = {}

function LeaderboardsApi.SetSettings(settings: PlayFabInternal.ISettings)
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


return LeaderboardsApi

