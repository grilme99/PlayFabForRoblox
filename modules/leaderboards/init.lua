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


return LeaderboardsApi

