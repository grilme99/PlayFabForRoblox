--!strict
--[=[
	# AuthenticationApi

	The Authentication APIs provide a convenient way to convert classic authentication 
	responses into entity authentication models. These APIs will provide you with 
	the entity authentication token needed for subsequent Entity API calls. Manage 
	API keys for authenticating any entity. The game_server API is designed to create 
	uniquely identifiable game_server entities. The game_server Entity token can 
	be used to call Matchmaking Lobby and Pubsub for server scenarios. 
]=]

local PlayFabInternal = require(script.Parent.PlayFabInternal)

local AuthenticationApi = {}

function AuthenticationApi.SetSettings(settings: PlayFabInternal.ISettings)
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

--- Create or return a game_server entity token. Caller must be a title entity. 
export type AuthenticateCustomIdRequest = {
	--- The customId used to create and retrieve game_server entity tokens. This is 
	--- unique at the title level. CustomId must be between 32 and 100 characters. 
	CustomId: string,
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
}

export type AuthenticateCustomIdResult = {
	--- The token generated used to set X-EntityToken for game_server calls. 
	EntityToken: EntityTokenResponse?,
	--- True if the account was newly created on this authentication. 
	NewlyCreated: boolean,
}

--- Delete a game_server entity. The caller can be the game_server entity attempting 
--- to delete itself. Or a title entity attempting to delete game_server entities 
--- for this title. 
export type DeleteRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The game_server entity to be removed. 
	Entity: EntityKey,
}

export type EmptyResponse = {
}

--- Combined entity type and ID structure which uniquely identifies a single entity. 
export type EntityKey = {
	--- Unique ID of the entity. 
	Id: string,
	--- Entity type. See https://docs.microsoft.com/gaming/playfab/features/data/entities/available-built-in-entity-types 
	Type: string?,
}

export type EntityLineage = {
	--- The Character Id of the associated entity. 
	CharacterId: string?,
	--- The Group Id of the associated entity. 
	GroupId: string?,
	--- The Master Player Account Id of the associated entity. 
	MasterPlayerAccountId: string?,
	--- The Namespace Id of the associated entity. 
	NamespaceId: string?,
	--- The Title Id of the associated entity. 
	TitleId: string?,
	--- The Title Player Account Id of the associated entity. 
	TitlePlayerAccountId: string?,
}

export type EntityTokenResponse = {
	--- The entity id and type. 
	Entity: EntityKey?,
	--- The token used to set X-EntityToken for all entity based API calls. 
	EntityToken: string?,
	--- The time the token will expire, if it is an expiring token, in UTC. 
	TokenExpiration: string?,
}

--- This API must be called with X-SecretKey, X-Authentication or X-EntityToken 
--- headers. An optional EntityKey may be included to attempt to set the resulting 
--- EntityToken to a specific entity, however the entity must be a relation of the 
--- caller, such as the master_player_account of a character. If sending X-EntityToken 
--- the account will be marked as freshly logged in and will issue a new token. 
--- If using X-Authentication or X-EntityToken the header must still be valid and 
--- cannot be expired or revoked. 
export type GetEntityTokenRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The optional entity to perform this action on. Defaults to the currently logged 
	--- in entity. 
	Entity: EntityKey?,
}

export type GetEntityTokenResponse = {
	--- The entity id and type. 
	Entity: EntityKey?,
	--- The token used to set X-EntityToken for all entity based API calls. 
	EntityToken: string?,
	--- The time the token will expire, if it is an expiring token, in UTC. 
	TokenExpiration: string?,
}

export type IdentifiedDeviceType = 
	"Unknown"
	| "XboxOne"
	| "Scarlett"

export type LoginIdentityProvider = 
	"Unknown"
	| "PlayFab"
	| "Custom"
	| "GameCenter"
	| "GooglePlay"
	| "Steam"
	| "XBoxLive"
	| "PSN"
	| "Kongregate"
	| "Facebook"
	| "IOSDevice"
	| "AndroidDevice"
	| "Twitch"
	| "WindowsHello"
	| "GameServer"
	| "CustomServer"
	| "NintendoSwitch"
	| "FacebookInstantGames"
	| "OpenIdConnect"
	| "Apple"
	| "NintendoSwitchAccount"
	| "GooglePlayGames"

--- Given an entity token, validates that it hasn't expired or been revoked and 
--- will return details of the owner. 
export type ValidateEntityTokenRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- Client EntityToken 
	EntityToken: string,
}

export type ValidateEntityTokenResponse = {
	--- The entity id and type. 
	Entity: EntityKey?,
	--- The authenticated device for this entity, for the given login 
	IdentifiedDeviceType: string?,
	--- The identity provider for this entity, for the given login 
	IdentityProvider: string?,
	--- The ID issued by the identity provider, e.g. a XUID on Xbox Live 
	IdentityProviderIssuedId: string?,
	--- The lineage of this profile. 
	Lineage: EntityLineage?,
}


--- This API must be called with X-SecretKey, X-Authentication or X-EntityToken 
--- headers. An optional EntityKey may be included to attempt to set the resulting 
--- EntityToken to a specific entity, however the entity must be a relation of the 
--- caller, such as the master_player_account of a character. If sending X-EntityToken 
--- the account will be marked as freshly logged in and will issue a new token. 
--- If using X-Authentication or X-EntityToken the header must still be valid and 
--- cannot be expired or revoked. 
---
--- https://docs.microsoft.com/rest/api/playfab/authentication/authentication/getentitytoken
function AuthenticationApi.GetEntityTokenAsync(
	request: GetEntityTokenRequest
): GetEntityTokenResponse
	return PlayFabInternal.MakeApiCall(
		"/Authentication/GetEntityToken",
		request,
		nil,
		nil
	)
end

--- Given an entity token, validates that it hasn't expired or been revoked and 
--- will return details of the owner. 
---
--- https://docs.microsoft.com/rest/api/playfab/authentication/authentication/validateentitytoken
function AuthenticationApi.ValidateEntityTokenAsync(
	entityToken: string, 
	request: ValidateEntityTokenRequest
): ValidateEntityTokenResponse
	return PlayFabInternal.MakeApiCall(
		"/Authentication/ValidateEntityToken",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Create or return a game_server entity token. Caller must be a title entity. 
---
--- https://docs.microsoft.com/rest/api/playfab/authentication/authentication/authenticategameserverwithcustomid
function AuthenticationApi.AuthenticateGameServerWithCustomIdAsync(
	entityToken: string, 
	request: AuthenticateCustomIdRequest
): AuthenticateCustomIdResult
	return PlayFabInternal.MakeApiCall(
		"/Authentication/AuthenticateGameServerWithCustomId",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Delete a game_server entity. The caller can be the game_server entity attempting 
--- to delete itself. Or a title entity attempting to delete game_server entities 
--- for this title. 
---
--- https://docs.microsoft.com/rest/api/playfab/authentication/authentication/delete
function AuthenticationApi.DeleteAsync(
	entityToken: string, 
	request: DeleteRequest
): EmptyResponse
	return PlayFabInternal.MakeApiCall(
		"/Authentication/Delete",
		request,
		"X-EntityToken",
		entityToken
	)
end

return AuthenticationApi

