--!strict
--[=[
	# MatchmakerApi

	Enables the use of an external match-making service in conjunction with PlayFab 
	hosted Game Server instances. 

	API Version: 1.221010.0
]=]

local PlayFabInternal = require(script.Parent.PlayFabInternal)
local Types = require(script.Parent.Types)
local MatchmakerApi = require(script.Apis)

function MatchmakerApi.SetSettings(settings: PlayFabInternal.ISettings)
	PlayFabInternal.SetSettings(settings)
end

export type ApiErrorWrapper = Types.ApiErrorWrapper
export type AuthUserRequest = Types.AuthUserRequest
export type AuthUserResponse = Types.AuthUserResponse
export type ItemInstance = Types.ItemInstance
export type PlayerJoinedRequest = Types.PlayerJoinedRequest
export type PlayerJoinedResponse = Types.PlayerJoinedResponse
export type PlayerLeftRequest = Types.PlayerLeftRequest
export type PlayerLeftResponse = Types.PlayerLeftResponse
export type UserInfoRequest = Types.UserInfoRequest
export type UserInfoResponse = Types.UserInfoResponse
export type VirtualCurrencyRechargeTime = Types.VirtualCurrencyRechargeTime

return MatchmakerApi

