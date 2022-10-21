--!strict
--[=[
	# LeaderboardsApi

	Manage entity statistics Manage entity statistics. 

	API Version: 1.221010.0
]=]

local PlayFabInternal = require(script.Parent.PlayFabInternal)
local Types = require(script.Parent.Types)
local LeaderboardsApi = require(script.Apis)

function LeaderboardsApi.SetSettings(settings: PlayFabInternal.ISettings)
	PlayFabInternal.SetSettings(settings)
end

export type ApiErrorWrapper = Types.ApiErrorWrapper

return LeaderboardsApi

