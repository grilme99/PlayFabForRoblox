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

--- The basic wrapper around every failed API response 
export type ApiErrorWrapper = {
	code: number, --- Numerical HTTP code
	error: string?, --- Playfab error code
	errorCode: number, --- Numerical PlayFab error code
	errorDetails: {[any]: any}?, --- Detailed description of individual issues with the request object
	errorMessage: string?, --- Description for the PlayFab errorCode
	status: string?, --- String HTTP code
}

--- Delete a game_server entity. The caller can be the game_server entity attempting 
--- to delete itself. Or a title entity attempting to delete game_server entities 
--- for this title. 
export type DeleteRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	Entity: EntityKey, --- The game_server entity to be removed.
}

export type EmptyResponse = {
}

--- Combined entity type and ID structure which uniquely identifies a single entity. 
export type EntityKey = {
	Id: string, --- Unique ID of the entity.
	Type: string?, --- Entity type. See https://docs.microsoft.com/gaming/playfab/features/data/entities/available-built-in-entity-types
}

export type EntityLineage = {
	CharacterId: string?, --- The Character Id of the associated entity.
	GroupId: string?, --- The Group Id of the associated entity.
	MasterPlayerAccountId: string?, --- The Master Player Account Id of the associated entity.
	NamespaceId: string?, --- The Namespace Id of the associated entity.
	TitleId: string?, --- The Title Id of the associated entity.
	TitlePlayerAccountId: string?, --- The Title Player Account Id of the associated entity.
}

--- This API must be called with X-SecretKey, X-Authentication or X-EntityToken 
--- headers. An optional EntityKey may be included to attempt to set the resulting 
--- EntityToken to a specific entity, however the entity must be a relation of the 
--- caller, such as the master_player_account of a character. If sending X-EntityToken 
--- the account will be marked as freshly logged in and will issue a new token. 
--- If using X-Authentication or X-EntityToken the header must still be valid and 
--- cannot be expired or revoked. 
export type GetEntityTokenRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	Entity: EntityKey?, --- The optional entity to perform this action on. Defaults to the currently logged in entity.
}

export type GetEntityTokenResponse = {
	Entity: EntityKey?, --- The entity id and type.
	EntityToken: string?, --- The token used to set X-EntityToken for all entity based API calls.
	TokenExpiration: string?, --- The time the token will expire, if it is an expiring token, in UTC.
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
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	EntityToken: string, --- Client EntityToken
}

export type ValidateEntityTokenResponse = {
	Entity: EntityKey?, --- The entity id and type.
	IdentifiedDeviceType: string?, --- The authenticated device for this entity, for the given login
	IdentityProvider: string?, --- The identity provider for this entity, for the given login
	IdentityProviderIssuedId: string?, --- The ID issued by the identity provider, e.g. a XUID on Xbox Live
	Lineage: EntityLineage?, --- The lineage of this profile.
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
): GetEntityTokenResponse | ApiErrorWrapper
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
): ValidateEntityTokenResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Authentication/ValidateEntityToken",
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
): EmptyResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Authentication/Delete",
		request,
		"X-EntityToken",
		entityToken
	)
end

return AuthenticationApi

