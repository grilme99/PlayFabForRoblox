--[[
	This file was generated on 2025-08-03 at 00:04 UTC. Do not edit directly.

]]

--[[
	Create or return a game_server entity token. Caller must be a title entity.

]]
export type AuthenticateCustomIdRequest = {
	--[[
		The customId used to create and retrieve game_server entity tokens. This is
		unique at the title level. CustomId must be between 32 and 100 characters.

	]]
	CustomId: string,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

--[[
	Combined entity type and ID structure which uniquely identifies a single
	entity.

]]
export type EntityKey = {
	--[[
		Unique ID of the entity.

	]]
	Id: string,
	--[[
		Entity type. See
		https://docs.microsoft.com/gaming/playfab/features/data/entities/available-built-in-entity-types

	]]
	Type: string?,
}

export type EntityLineage = {
	--[[
		The Title Player Account Id of the associated entity.

	]]
	TitlePlayerAccountId: string?,
	--[[
		The Master Player Account Id of the associated entity.

	]]
	MasterPlayerAccountId: string?,
	--[[
		The Group Id of the associated entity.

	]]
	GroupId: string?,
	--[[
		The Namespace Id of the associated entity.

	]]
	NamespaceId: string?,
	--[[
		The Character Id of the associated entity.

	]]
	CharacterId: string?,
	--[[
		The Title Id of the associated entity.

	]]
	TitleId: string?,
}

export type EmptyResponse = {
	-- No properties defined in spec
	[string]: any
}

--[[
	Delete a game_server entity. The caller can be the game_server entity
	attempting to delete itself. Or a title entity attempting to delete
	game_server entities for this title.

]]
export type DeleteRequest = {
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

--[[
	Given an entity token, validates that it hasn't expired or been revoked and
	will return details of the owner.

]]
export type ValidateEntityTokenRequest = {
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		Client EntityToken

	]]
	EntityToken: string,
}

export type AuthenticateCustomIdResult = {
	EntityToken: EntityTokenResponse?,
	--[[
		True if the account was newly created on this authentication.

	]]
	NewlyCreated: boolean,
}

--[[
	The basic wrapper around every failed API response

]]
export type ApiErrorWrapper = {
	--[[
		Detailed description of individual issues with the request object

	]]
	errorDetails: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		Numerical HTTP code

	]]
	code: number,
	--[[
		String HTTP code

	]]
	status: string?,
	--[[
		Numerical PlayFab error code

	]]
	errorCode: number,
	--[[
		Playfab error code

	]]
	error: string?,
	--[[
		Description for the PlayFab errorCode

	]]
	errorMessage: string?,
}

export type ValidateEntityTokenResponse = {
	Lineage: EntityLineage?,
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey?,
	IdentifiedDeviceType: IdentifiedDeviceType?,
	IdentityProvider: LoginIdentityProvider?,
	--[[
		The ID issued by the identity provider, e.g. a XUID on Xbox Live

	]]
	IdentityProviderIssuedId: string?,
}

export type LoginIdentityProvider = 
	| "Unknown"
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
	| "XboxMobileStore"
	| "King"
	| "BattleNet"

export type IdentifiedDeviceType = 
	| "Unknown"
	| "XboxOne"
	| "Scarlett"
	| "WindowsOneCore"
	| "WindowsOneCoreMobile"
	| "Win32"
	| "android"
	| "iOS"
	| "PlayStation"
	| "Nintendo"

export type GetEntityTokenResponse = {
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey?,
	--[[
		The time the token will expire, if it is an expiring token, in UTC.

	]]
	TokenExpiration: string?,
	--[[
		The token used to set X-EntityToken for all entity based API calls.

	]]
	EntityToken: string?,
}

export type EntityTokenResponse = {
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey?,
	--[[
		The time the token will expire, if it is an expiring token, in UTC.

	]]
	TokenExpiration: string?,
	--[[
		The token used to set X-EntityToken for all entity based API calls.

	]]
	EntityToken: string?,
}

--[[
	This API must be called with X-SecretKey, X-Authentication or X-EntityToken
	headers. An optional EntityKey may be included to attempt to set the
	resulting EntityToken to a specific entity, however the entity must be a
	relation of the caller, such as the master_player_account of a character. If
	sending X-EntityToken the account will be marked as freshly logged in and
	will issue a new token. If using X-Authentication or X-EntityToken the
	header must still be valid and cannot be expired or revoked.

]]
export type GetEntityTokenRequest = {
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}



return nil
