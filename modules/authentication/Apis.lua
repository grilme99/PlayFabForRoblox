--!strict

local PlayFabInternal = require(script.Parent.PlayFabInternal)
local Types = require(script.Parent.Types)

local Apis = {}

--- This API must be called with X-SecretKey, X-Authentication or X-EntityToken 
--- headers. An optional EntityKey may be included to attempt to set the resulting 
--- EntityToken to a specific entity, however the entity must be a relation of the 
--- caller, such as the master_player_account of a character. If sending X-EntityToken 
--- the account will be marked as freshly logged in and will issue a new token. 
--- If using X-Authentication or X-EntityToken the header must still be valid and 
--- cannot be expired or revoked. 
---
--- https://docs.microsoft.com/rest/api/playfab/authentication/authentication/getentitytoken
function Apis.GetEntityTokenAsync(
	request: Types.GetEntityTokenRequest
): Types.GetEntityTokenResponse
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
function Apis.ValidateEntityTokenAsync(
	entityToken: string, 
	request: Types.ValidateEntityTokenRequest
): Types.ValidateEntityTokenResponse
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
function Apis.AuthenticateGameServerWithCustomIdAsync(
	entityToken: string, 
	request: Types.AuthenticateCustomIdRequest
): Types.AuthenticateCustomIdResult
	return PlayFabInternal.MakeApiCall(
		"/GameServerIdentity/AuthenticateGameServerWithCustomId",
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
function Apis.DeleteAsync(
	entityToken: string, 
	request: Types.DeleteRequest
): Types.EmptyResponse
	return PlayFabInternal.MakeApiCall(
		"/GameServerIdentity/Delete",
		request,
		"X-EntityToken",
		entityToken
	)
end

return Apis

