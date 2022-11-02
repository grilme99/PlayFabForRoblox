--!strict
--[=[
	# AuthenticationApi

	The Authentication APIs provide a convenient way to convert classic authentication 
	responses into entity authentication models. These APIs will provide you with 
	the entity authentication token needed for subsequent Entity API calls. Manage 
	API keys for authenticating any entity. The game_server API is designed to create 
	uniquely identifiable game_server entities. The game_server Entity token can 
	be used to call Matchmaking Lobby and Pubsub for server scenarios. 

	API Version: 1.221024.0
]=]

local PlayFabInternal = require(script.Parent.PlayFabInternal)
local Types = require(script.Types)

local AuthenticationApi = require(script.Apis)

function AuthenticationApi.SetSettings(settings: PlayFabInternal.ISettings)
	PlayFabInternal.SetSettings(settings)
end

export type ApiErrorWrapper = Types.ApiErrorWrapper
export type AuthenticateCustomIdRequest = Types.AuthenticateCustomIdRequest
export type AuthenticateCustomIdResult = Types.AuthenticateCustomIdResult
export type DeleteRequest = Types.DeleteRequest
export type EmptyResponse = Types.EmptyResponse
export type EntityKey = Types.EntityKey
export type EntityLineage = Types.EntityLineage
export type EntityTokenResponse = Types.EntityTokenResponse
export type GetEntityTokenRequest = Types.GetEntityTokenRequest
export type GetEntityTokenResponse = Types.GetEntityTokenResponse
export type IdentifiedDeviceType = Types.IdentifiedDeviceType
export type LoginIdentityProvider = Types.LoginIdentityProvider
export type ValidateEntityTokenRequest = Types.ValidateEntityTokenRequest
export type ValidateEntityTokenResponse = Types.ValidateEntityTokenResponse

return AuthenticationApi

