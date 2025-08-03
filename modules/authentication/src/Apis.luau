--[[
	This file was generated on 2025-08-03 at 00:04 UTC. Do not edit directly.

]]

local Types = require(script.Parent.Types)

local Common = require(script.Parent.Parent.PlayFabCommon)
local makeApiCall = Common.makeApiCall
type Result<T, E> = Common.Result<T, E>

local Apis = {}

--[[
	Create a game_server entity token and return a new or existing game_server
	entity.

	Create or return a game_server entity token. Caller must be a title entity.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/authentication/authentication/authenticategameserverwithcustomid).

]]
function Apis.AuthenticateGameServerWithCustomId(request: Types.AuthenticateCustomIdRequest, entityToken: string): Result<Types.AuthenticateCustomIdResult, string>
	return makeApiCall(
		"/GameServerIdentity/AuthenticateGameServerWithCustomId",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Method for a server to validate a client provided EntityToken. Only callable
	by the title entity.

	Given an entity token, validates that it hasn't expired or been revoked and
	will return details of the owner.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/authentication/authentication/validateentitytoken).

]]
function Apis.ValidateEntityToken(request: Types.ValidateEntityTokenRequest, entityToken: string): Result<Types.ValidateEntityTokenResponse, string>
	return makeApiCall(
		"/Authentication/ValidateEntityToken",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Method to exchange a legacy AuthenticationTicket or title SecretKey for an
	Entity Token or to refresh a still valid Entity Token.

	This API must be called with X-SecretKey, X-Authentication or X-EntityToken
	headers. An optional EntityKey may be included to attempt to set the
	resulting EntityToken to a specific entity, however the entity must be a
	relation of the caller, such as the master_player_account of a character. If
	sending X-EntityToken the account will be marked as freshly logged in and
	will issue a new token. If using X-Authentication or X-EntityToken the
	header must still be valid and cannot be expired or revoked.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/authentication/authentication/getentitytoken).

	### Errors
	- EncryptionKeyBroken
	- NoValidCertificateForAad

]]
function Apis.GetEntityToken(request: Types.GetEntityTokenRequest): Result<Types.GetEntityTokenResponse, string>
	return makeApiCall(
		"/Authentication/GetEntityToken",
		request,
		"None"
	)
end

--[[
	Delete a game_server entity.

	Delete a game_server entity. The caller can be the game_server entity
	attempting to delete itself. Or a title entity attempting to delete
	game_server entities for this title.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/authentication/authentication/delete).

]]
function Apis.Delete(request: Types.DeleteRequest, entityToken: string): Result<Types.EmptyResponse, string>
	return makeApiCall(
		"/GameServerIdentity/Delete",
		request,
		"X-EntityToken",
		entityToken
	)
end

return Apis
