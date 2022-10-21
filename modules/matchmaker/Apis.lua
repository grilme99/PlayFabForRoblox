--!strict

local PlayFabInternal = require(script.Parent.PlayFabInternal)
local Types = require(script.Parent.Types)

local Apis = {}

--- This API allows the external match-making service to confirm that the user has 
--- a valid Session Ticket for the title, in order to securely enable match-making. 
--- The client passes the user's Session Ticket to the external match-making service, 
--- which then passes the Session Ticket in as the AuthorizationTicket in this call. 
---
--- https://docs.microsoft.com/rest/api/playfab/matchmaker/matchmaking/authuser
function Apis.AuthUserAsync(
	secretKey: string, 
	request: Types.AuthUserRequest
): Types.AuthUserResponse
	return PlayFabInternal.MakeApiCall(
		"/Matchmaker/AuthUser",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/matchmaker/matchmaking/playerjoined
function Apis.PlayerJoinedAsync(
	secretKey: string, 
	request: Types.PlayerJoinedRequest
): Types.PlayerJoinedResponse
	return PlayFabInternal.MakeApiCall(
		"/Matchmaker/PlayerJoined",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/matchmaker/matchmaking/playerleft
function Apis.PlayerLeftAsync(
	secretKey: string, 
	request: Types.PlayerLeftRequest
): Types.PlayerLeftResponse
	return PlayFabInternal.MakeApiCall(
		"/Matchmaker/PlayerLeft",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/matchmaker/matchmaking/userinfo
function Apis.UserInfoAsync(
	secretKey: string, 
	request: Types.UserInfoRequest
): Types.UserInfoResponse
	return PlayFabInternal.MakeApiCall(
		"/Matchmaker/UserInfo",
		request,
		"X-SecretKey",
		secretKey
	)
end

return Apis

