--!strict

local PlayFabInternal = require(script.Parent.PlayFabInternal)
local Types = require(script.Parent.Types)

local Apis = {}

--- Creates a multiplayer lobby. The caller is the lobby creator. Caller may be 
--- a server or player entity. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/lobby/createlobby
function Apis.CreateLobbyAsync(
	entityToken: string, 
	request: Types.CreateLobbyRequest
): Types.CreateLobbyResult
	return PlayFabInternal.MakeApiCall(
		"/Lobby/CreateLobby",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Delete a lobby. This method is only callable by servers. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/lobby/deletelobby
function Apis.DeleteLobbyAsync(
	entityToken: string, 
	request: Types.DeleteLobbyRequest
): Types.LobbyEmptyResult
	return PlayFabInternal.MakeApiCall(
		"/Lobby/DeleteLobby",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Find lobbies which match certain criteria and contain friends of the caller. 
--- Friends optionally include Steam, Facebook and Xbox friends. Returns a maximum 
--- of 50 instances for client calls. This method is not callable by servers. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/lobby/findfriendlobbies
function Apis.FindFriendLobbiesAsync(
	entityToken: string, 
	request: Types.FindFriendLobbiesRequest
): Types.FindFriendLobbiesResult
	return PlayFabInternal.MakeApiCall(
		"/Lobby/FindFriendLobbies",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Find lobbies which match certain criteria. Returns a maximum of 500 entries 
--- for server callers, and 50 entries for client callers. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/lobby/findlobbies
function Apis.FindLobbiesAsync(
	entityToken: string, 
	request: Types.FindLobbiesRequest
): Types.FindLobbiesResult
	return PlayFabInternal.MakeApiCall(
		"/Lobby/FindLobbies",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/multiplayer/lobby/getlobby
function Apis.GetLobbyAsync(
	entityToken: string, 
	request: Types.GetLobbyRequest
): Types.GetLobbyResult
	return PlayFabInternal.MakeApiCall(
		"/Lobby/GetLobby",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Invite a player to a lobby the caller is already a member of. Only players may 
--- call this. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/lobby/invitetolobby
function Apis.InviteToLobbyAsync(
	entityToken: string, 
	request: Types.InviteToLobbyRequest
): Types.LobbyEmptyResult
	return PlayFabInternal.MakeApiCall(
		"/Lobby/InviteToLobby",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/multiplayer/lobby/joinarrangedlobby
function Apis.JoinArrangedLobbyAsync(
	entityToken: string, 
	request: Types.JoinArrangedLobbyRequest
): Types.JoinLobbyResult
	return PlayFabInternal.MakeApiCall(
		"/Lobby/JoinArrangedLobby",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/multiplayer/lobby/joinlobby
function Apis.JoinLobbyAsync(
	entityToken: string, 
	request: Types.JoinLobbyRequest
): Types.JoinLobbyResult
	return PlayFabInternal.MakeApiCall(
		"/Lobby/JoinLobby",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Leave a lobby. Members will also be automatically unsubscribed from the lobby. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/lobby/leavelobby
function Apis.LeaveLobbyAsync(
	entityToken: string, 
	request: Types.LeaveLobbyRequest
): Types.LobbyEmptyResult
	return PlayFabInternal.MakeApiCall(
		"/Lobby/LeaveLobby",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Remove another member from a lobby. Owners and servers may remove any member 
--- from a lobby. Members cannot remove themselves but they can use LeaveLobby instead. 
--- Members are also unsubscribed from the lobby. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/lobby/removemember
function Apis.RemoveMemberAsync(
	entityToken: string, 
	request: Types.RemoveMemberFromLobbyRequest
): Types.LobbyEmptyResult
	return PlayFabInternal.MakeApiCall(
		"/Lobby/RemoveMember",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Subscribe to lobby resource notifications. Lobby subscriptions have two types; 
--- LobbyChange and LobbyInvite. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/lobby/subscribetolobbyresource
function Apis.SubscribeToLobbyResourceAsync(
	entityToken: string, 
	request: Types.SubscribeToLobbyResourceRequest
): Types.SubscribeToLobbyResourceResult
	return PlayFabInternal.MakeApiCall(
		"/Lobby/SubscribeToLobbyResource",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Unsubscribe from lobby notifications. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/lobby/unsubscribefromlobbyresource
function Apis.UnsubscribeFromLobbyResourceAsync(
	entityToken: string, 
	request: Types.UnsubscribeFromLobbyResourceRequest
): Types.LobbyEmptyResult
	return PlayFabInternal.MakeApiCall(
		"/Lobby/UnsubscribeFromLobbyResource",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/multiplayer/lobby/updatelobby
function Apis.UpdateLobbyAsync(
	entityToken: string, 
	request: Types.UpdateLobbyRequest
): Types.LobbyEmptyResult
	return PlayFabInternal.MakeApiCall(
		"/Lobby/UpdateLobby",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Cancels all tickets of which the player is a member in a given queue that are 
--- not cancelled or matched. This API is useful if you lose track of what tickets 
--- the player is a member of (if the title crashes for instance) and want to "reset". 
--- The Entity field is optional if the caller is a player and defaults to that 
--- player. Players may not cancel tickets for other people. The Entity field is 
--- required if the caller is a server (authenticated as the title). 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/matchmaking/cancelallmatchmakingticketsforplayer
function Apis.CancelAllMatchmakingTicketsForPlayerAsync(
	entityToken: string, 
	request: Types.CancelAllMatchmakingTicketsForPlayerRequest
): Types.CancelAllMatchmakingTicketsForPlayerResult
	return PlayFabInternal.MakeApiCall(
		"/Match/CancelAllMatchmakingTicketsForPlayer",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Cancels all backfill tickets of which the player is a member in a given queue 
--- that are not cancelled or matched. This API is useful if you lose track of what 
--- tickets the player is a member of (if the server crashes for instance) and want 
--- to "reset". 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/matchmaking/cancelallserverbackfillticketsforplayer
function Apis.CancelAllServerBackfillTicketsForPlayerAsync(
	entityToken: string, 
	request: Types.CancelAllServerBackfillTicketsForPlayerRequest
): Types.CancelAllServerBackfillTicketsForPlayerResult
	return PlayFabInternal.MakeApiCall(
		"/Match/CancelAllServerBackfillTicketsForPlayer",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Only servers and ticket members can cancel a ticket. The ticket can be in five 
--- different states when it is cancelled. 1: the ticket is waiting for members 
--- to join it, and it has not started matching. If the ticket is cancelled at this 
--- stage, it will never match. 2: the ticket is matching. If the ticket is cancelled, 
--- it will stop matching. 3: the ticket is matched. A matched ticket cannot be 
--- cancelled. 4: the ticket is already cancelled and nothing happens. 5: the ticket 
--- is waiting for a server. If the ticket is cancelled, server allocation will 
--- be stopped. A server may still be allocated due to a race condition, but that 
--- will not be reflected in the ticket. There may be race conditions between the 
--- ticket getting matched and the client making a cancellation request. The client 
--- must handle the possibility that the cancel request fails if a match is found 
--- before the cancellation request is processed. We do not allow resubmitting a 
--- cancelled ticket because players must consent to enter matchmaking again. Create 
--- a new ticket instead. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/matchmaking/cancelmatchmakingticket
function Apis.CancelMatchmakingTicketAsync(
	entityToken: string, 
	request: Types.CancelMatchmakingTicketRequest
): Types.CancelMatchmakingTicketResult
	return PlayFabInternal.MakeApiCall(
		"/Match/CancelMatchmakingTicket",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Only servers can cancel a backfill ticket. The ticket can be in three different 
--- states when it is cancelled. 1: the ticket is matching. If the ticket is cancelled, 
--- it will stop matching. 2: the ticket is matched. A matched ticket cannot be 
--- cancelled. 3: the ticket is already cancelled and nothing happens. There may 
--- be race conditions between the ticket getting matched and the server making 
--- a cancellation request. The server must handle the possibility that the cancel 
--- request fails if a match is found before the cancellation request is processed. 
--- We do not allow resubmitting a cancelled ticket. Create a new ticket instead. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/matchmaking/cancelserverbackfillticket
function Apis.CancelServerBackfillTicketAsync(
	entityToken: string, 
	request: Types.CancelServerBackfillTicketRequest
): Types.CancelServerBackfillTicketResult
	return PlayFabInternal.MakeApiCall(
		"/Match/CancelServerBackfillTicket",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- The client specifies the creator's attributes and optionally a list of other 
--- users to match with. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/matchmaking/creatematchmakingticket
function Apis.CreateMatchmakingTicketAsync(
	entityToken: string, 
	request: Types.CreateMatchmakingTicketRequest
): Types.CreateMatchmakingTicketResult
	return PlayFabInternal.MakeApiCall(
		"/Match/CreateMatchmakingTicket",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- The server specifies all the members, their teams and their attributes, and 
--- the server details if applicable. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/matchmaking/createserverbackfillticket
function Apis.CreateServerBackfillTicketAsync(
	entityToken: string, 
	request: Types.CreateServerBackfillTicketRequest
): Types.CreateServerBackfillTicketResult
	return PlayFabInternal.MakeApiCall(
		"/Match/CreateServerBackfillTicket",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- The server specifies all the members and their attributes. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/matchmaking/createservermatchmakingticket
function Apis.CreateServerMatchmakingTicketAsync(
	entityToken: string, 
	request: Types.CreateServerMatchmakingTicketRequest
): Types.CreateMatchmakingTicketResult
	return PlayFabInternal.MakeApiCall(
		"/Match/CreateServerMatchmakingTicket",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- When matchmaking has successfully matched together a collection of tickets, 
--- it produces a 'match' with an Id. The match contains all of the players that 
--- were matched together, and their team assigments. Only servers and ticket members 
--- can get the match. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/matchmaking/getmatch
function Apis.GetMatchAsync(
	entityToken: string, 
	request: Types.GetMatchRequest
): Types.GetMatchResult
	return PlayFabInternal.MakeApiCall(
		"/Match/GetMatch",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Gets the current configuration for a queue. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/matchmaking-admin/getmatchmakingqueue
function Apis.GetMatchmakingQueueAsync(
	entityToken: string, 
	request: Types.GetMatchmakingQueueRequest
): Types.GetMatchmakingQueueResult
	return PlayFabInternal.MakeApiCall(
		"/Match/GetMatchmakingQueue",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- The ticket includes the invited players, their attributes if they have joined, 
--- the ticket status, the match Id when applicable, etc. Only servers, the ticket 
--- creator and the invited players can get the ticket. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/matchmaking/getmatchmakingticket
function Apis.GetMatchmakingTicketAsync(
	entityToken: string, 
	request: Types.GetMatchmakingTicketRequest
): Types.GetMatchmakingTicketResult
	return PlayFabInternal.MakeApiCall(
		"/Match/GetMatchmakingTicket",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Returns the matchmaking statistics for a queue. These include the number of 
--- players matching and the statistics related to the time to match statistics 
--- in seconds (average and percentiles). Statistics are refreshed once every 5 
--- minutes. Servers can access all statistics no matter what the ClientStatisticsVisibility 
--- is configured to. Clients can access statistics according to the ClientStatisticsVisibility. 
--- Client requests are forbidden if all visibility fields are false. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/matchmaking/getqueuestatistics
function Apis.GetQueueStatisticsAsync(
	entityToken: string, 
	request: Types.GetQueueStatisticsRequest
): Types.GetQueueStatisticsResult
	return PlayFabInternal.MakeApiCall(
		"/Match/GetQueueStatistics",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- The ticket includes the players, their attributes, their teams, the ticket status, 
--- the match Id and the server details when applicable, etc. Only servers can get 
--- the ticket. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/matchmaking/getserverbackfillticket
function Apis.GetServerBackfillTicketAsync(
	entityToken: string, 
	request: Types.GetServerBackfillTicketRequest
): Types.GetServerBackfillTicketResult
	return PlayFabInternal.MakeApiCall(
		"/Match/GetServerBackfillTicket",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Add the player to a matchmaking ticket and specify all of its matchmaking attributes. 
--- Players can join a ticket if and only if their EntityKeys are already listed 
--- in the ticket's Members list. The matchmaking service automatically starts matching 
--- the ticket against other matchmaking tickets once all players have joined the 
--- ticket. It is not possible to join a ticket once it has started matching. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/matchmaking/joinmatchmakingticket
function Apis.JoinMatchmakingTicketAsync(
	entityToken: string, 
	request: Types.JoinMatchmakingTicketRequest
): Types.JoinMatchmakingTicketResult
	return PlayFabInternal.MakeApiCall(
		"/Match/JoinMatchmakingTicket",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Gets a list of all the matchmaking queue configurations for the title. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/matchmaking-admin/listmatchmakingqueues
function Apis.ListMatchmakingQueuesAsync(
	entityToken: string, 
	request: Types.ListMatchmakingQueuesRequest
): Types.ListMatchmakingQueuesResult
	return PlayFabInternal.MakeApiCall(
		"/Match/ListMatchmakingQueues",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- If the caller is a title, the EntityKey in the request is required. If the caller 
--- is a player, then it is optional. If it is provided it must match the caller's 
--- entity. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/matchmaking/listmatchmakingticketsforplayer
function Apis.ListMatchmakingTicketsForPlayerAsync(
	entityToken: string, 
	request: Types.ListMatchmakingTicketsForPlayerRequest
): Types.ListMatchmakingTicketsForPlayerResult
	return PlayFabInternal.MakeApiCall(
		"/Match/ListMatchmakingTicketsForPlayer",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- List all server backfill ticket Ids the user is a member of. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/matchmaking/listserverbackfillticketsforplayer
function Apis.ListServerBackfillTicketsForPlayerAsync(
	entityToken: string, 
	request: Types.ListServerBackfillTicketsForPlayerRequest
): Types.ListServerBackfillTicketsForPlayerResult
	return PlayFabInternal.MakeApiCall(
		"/Match/ListServerBackfillTicketsForPlayer",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Deletes the configuration for a queue. This will permanently delete the configuration 
--- and players will no longer be able to match in the queue. All outstanding matchmaking 
--- tickets will be cancelled. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/matchmaking-admin/removematchmakingqueue
function Apis.RemoveMatchmakingQueueAsync(
	entityToken: string, 
	request: Types.RemoveMatchmakingQueueRequest
): Types.RemoveMatchmakingQueueResult
	return PlayFabInternal.MakeApiCall(
		"/Match/RemoveMatchmakingQueue",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Use this API to create or update matchmaking queue configurations. The queue 
--- configuration defines the matchmaking rules. The matchmaking service will match 
--- tickets together according to the configured rules. Queue resources are not 
--- spun up by calling this API. Queues are created when the first ticket is submitted. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/matchmaking-admin/setmatchmakingqueue
function Apis.SetMatchmakingQueueAsync(
	entityToken: string, 
	request: Types.SetMatchmakingQueueRequest
): Types.SetMatchmakingQueueResult
	return PlayFabInternal.MakeApiCall(
		"/Match/SetMatchmakingQueue",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Subscribe to match resource notifications. Match subscriptions have two types; 
--- MatchInvite and MatchTicketStatusChange 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/matchmaking/subscribetomatchmakingresource
function Apis.SubscribeToMatchmakingResourceAsync(
	entityToken: string, 
	request: Types.SubscribeToMatchResourceRequest
): Types.SubscribeToMatchResourceResult
	return PlayFabInternal.MakeApiCall(
		"/Match/SubscribeToMatchmakingResource",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Unsubscribe from a Match resource's notifications. For MatchInvite, players 
--- are expected to unsubscribe once they can no longer accept invites. For MatchTicketStatusChange, 
--- players are expected to unsusbcribe once the ticket has reached a canceled or 
--- matched state. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/matchmaking/unsubscribefrommatchmakingresource
function Apis.UnsubscribeFromMatchmakingResourceAsync(
	entityToken: string, 
	request: Types.UnsubscribeFromMatchResourceRequest
): Types.UnsubscribeFromMatchResourceResult
	return PlayFabInternal.MakeApiCall(
		"/Match/UnsubscribeFromMatchmakingResource",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Creates a multiplayer server build alias and returns the created alias. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/createbuildalias
function Apis.CreateBuildAliasAsync(
	entityToken: string, 
	request: Types.CreateBuildAliasRequest
): Types.BuildAliasDetailsResponse
	return PlayFabInternal.MakeApiCall(
		"/MultiplayerServer/CreateBuildAlias",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Creates a multiplayer server build with a custom container and returns information 
--- about the build creation request. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/createbuildwithcustomcontainer
function Apis.CreateBuildWithCustomContainerAsync(
	entityToken: string, 
	request: Types.CreateBuildWithCustomContainerRequest
): Types.CreateBuildWithCustomContainerResponse
	return PlayFabInternal.MakeApiCall(
		"/MultiplayerServer/CreateBuildWithCustomContainer",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Creates a multiplayer server build with a managed container and returns information 
--- about the build creation request. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/createbuildwithmanagedcontainer
function Apis.CreateBuildWithManagedContainerAsync(
	entityToken: string, 
	request: Types.CreateBuildWithManagedContainerRequest
): Types.CreateBuildWithManagedContainerResponse
	return PlayFabInternal.MakeApiCall(
		"/MultiplayerServer/CreateBuildWithManagedContainer",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Creates a multiplayer server build with the game server running as a process 
--- and returns information about the build creation request. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/createbuildwithprocessbasedserver
function Apis.CreateBuildWithProcessBasedServerAsync(
	entityToken: string, 
	request: Types.CreateBuildWithProcessBasedServerRequest
): Types.CreateBuildWithProcessBasedServerResponse
	return PlayFabInternal.MakeApiCall(
		"/MultiplayerServer/CreateBuildWithProcessBasedServer",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Creates a remote user to log on to a VM for a multiplayer server build in a 
--- specific region. Returns user credential information necessary to log on. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/createremoteuser
function Apis.CreateRemoteUserAsync(
	entityToken: string, 
	request: Types.CreateRemoteUserRequest
): Types.CreateRemoteUserResponse
	return PlayFabInternal.MakeApiCall(
		"/MultiplayerServer/CreateRemoteUser",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Creates a request to change a title's multiplayer server quotas. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/createtitlemultiplayerserversquotachange
function Apis.CreateTitleMultiplayerServersQuotaChangeAsync(
	entityToken: string, 
	request: Types.CreateTitleMultiplayerServersQuotaChangeRequest
): Types.CreateTitleMultiplayerServersQuotaChangeResponse
	return PlayFabInternal.MakeApiCall(
		"/MultiplayerServer/CreateTitleMultiplayerServersQuotaChange",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Deletes a multiplayer server game asset for a title. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/deleteasset
function Apis.DeleteAssetAsync(
	entityToken: string, 
	request: Types.DeleteAssetRequest
): Types.EmptyResponse
	return PlayFabInternal.MakeApiCall(
		"/MultiplayerServer/DeleteAsset",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Deletes a multiplayer server build. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/deletebuild
function Apis.DeleteBuildAsync(
	entityToken: string, 
	request: Types.DeleteBuildRequest
): Types.EmptyResponse
	return PlayFabInternal.MakeApiCall(
		"/MultiplayerServer/DeleteBuild",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Deletes a multiplayer server build alias. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/deletebuildalias
function Apis.DeleteBuildAliasAsync(
	entityToken: string, 
	request: Types.DeleteBuildAliasRequest
): Types.EmptyResponse
	return PlayFabInternal.MakeApiCall(
		"/MultiplayerServer/DeleteBuildAlias",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Removes a multiplayer server build's region. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/deletebuildregion
function Apis.DeleteBuildRegionAsync(
	entityToken: string, 
	request: Types.DeleteBuildRegionRequest
): Types.EmptyResponse
	return PlayFabInternal.MakeApiCall(
		"/MultiplayerServer/DeleteBuildRegion",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Deletes a multiplayer server game certificate. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/deletecertificate
function Apis.DeleteCertificateAsync(
	entityToken: string, 
	request: Types.DeleteCertificateRequest
): Types.EmptyResponse
	return PlayFabInternal.MakeApiCall(
		"/MultiplayerServer/DeleteCertificate",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Removes the specified container image repository. After this operation, a 'docker 
--- pull' will fail for all the tags of the specified image. Morever, ListContainerImages 
--- will not return the specified image. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/deletecontainerimagerepository
function Apis.DeleteContainerImageRepositoryAsync(
	entityToken: string, 
	request: Types.DeleteContainerImageRequest
): Types.EmptyResponse
	return PlayFabInternal.MakeApiCall(
		"/MultiplayerServer/DeleteContainerImageRepository",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Deletes a remote user to log on to a VM for a multiplayer server build in a 
--- specific region. Returns user credential information necessary to log on. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/deleteremoteuser
function Apis.DeleteRemoteUserAsync(
	entityToken: string, 
	request: Types.DeleteRemoteUserRequest
): Types.EmptyResponse
	return PlayFabInternal.MakeApiCall(
		"/MultiplayerServer/DeleteRemoteUser",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Enables the multiplayer server feature for a title and returns the enabled status. 
--- The enabled status can be Initializing, Enabled, and Disabled. It can up to 
--- 20 minutes or more for the title to be enabled for the feature. On average, 
--- it can take up to 20 minutes for the title to be enabled for the feature. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/enablemultiplayerserversfortitle
function Apis.EnableMultiplayerServersForTitleAsync(
	entityToken: string, 
	request: Types.EnableMultiplayerServersForTitleRequest
): Types.EnableMultiplayerServersForTitleResponse
	return PlayFabInternal.MakeApiCall(
		"/MultiplayerServer/EnableMultiplayerServersForTitle",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Gets a URL that can be used to download the specified asset. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/getassetdownloadurl
function Apis.GetAssetDownloadUrlAsync(
	entityToken: string, 
	request: Types.GetAssetDownloadUrlRequest
): Types.GetAssetDownloadUrlResponse
	return PlayFabInternal.MakeApiCall(
		"/MultiplayerServer/GetAssetDownloadUrl",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Gets the URL to upload assets to. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/getassetuploadurl
function Apis.GetAssetUploadUrlAsync(
	entityToken: string, 
	request: Types.GetAssetUploadUrlRequest
): Types.GetAssetUploadUrlResponse
	return PlayFabInternal.MakeApiCall(
		"/MultiplayerServer/GetAssetUploadUrl",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Returns the details about a multiplayer server build. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/getbuild
function Apis.GetBuildAsync(
	entityToken: string, 
	request: Types.GetBuildRequest
): Types.GetBuildResponse
	return PlayFabInternal.MakeApiCall(
		"/MultiplayerServer/GetBuild",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Returns the details about a multiplayer server build alias. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/getbuildalias
function Apis.GetBuildAliasAsync(
	entityToken: string, 
	request: Types.GetBuildAliasRequest
): Types.BuildAliasDetailsResponse
	return PlayFabInternal.MakeApiCall(
		"/MultiplayerServer/GetBuildAlias",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Gets credentials to the container registry where game developers can upload 
--- custom container images to before creating a new build. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/getcontainerregistrycredentials
function Apis.GetContainerRegistryCredentialsAsync(
	entityToken: string, 
	request: Types.GetContainerRegistryCredentialsRequest
): Types.GetContainerRegistryCredentialsResponse
	return PlayFabInternal.MakeApiCall(
		"/MultiplayerServer/GetContainerRegistryCredentials",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Gets multiplayer server session details for a build in a specific region. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/getmultiplayerserverdetails
function Apis.GetMultiplayerServerDetailsAsync(
	entityToken: string, 
	request: Types.GetMultiplayerServerDetailsRequest
): Types.GetMultiplayerServerDetailsResponse
	return PlayFabInternal.MakeApiCall(
		"/MultiplayerServer/GetMultiplayerServerDetails",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Gets multiplayer server logs for a specific server id in a region. The logs 
--- are available only after a server has terminated. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/getmultiplayerserverlogs
function Apis.GetMultiplayerServerLogsAsync(
	entityToken: string, 
	request: Types.GetMultiplayerServerLogsRequest
): Types.GetMultiplayerServerLogsResponse
	return PlayFabInternal.MakeApiCall(
		"/MultiplayerServer/GetMultiplayerServerLogs",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Gets multiplayer server logs for a specific server id in a region. The logs 
--- are available only after a server has terminated. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/getmultiplayersessionlogsbysessionid
function Apis.GetMultiplayerSessionLogsBySessionIdAsync(
	entityToken: string, 
	request: Types.GetMultiplayerSessionLogsBySessionIdRequest
): Types.GetMultiplayerServerLogsResponse
	return PlayFabInternal.MakeApiCall(
		"/MultiplayerServer/GetMultiplayerSessionLogsBySessionId",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Gets a remote login endpoint to a VM that is hosting a multiplayer server build 
--- in a specific region. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/getremoteloginendpoint
function Apis.GetRemoteLoginEndpointAsync(
	entityToken: string, 
	request: Types.GetRemoteLoginEndpointRequest
): Types.GetRemoteLoginEndpointResponse
	return PlayFabInternal.MakeApiCall(
		"/MultiplayerServer/GetRemoteLoginEndpoint",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Gets the status of whether a title is enabled for the multiplayer server feature. 
--- The enabled status can be Initializing, Enabled, and Disabled. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/gettitleenabledformultiplayerserversstatus
function Apis.GetTitleEnabledForMultiplayerServersStatusAsync(
	entityToken: string, 
	request: Types.GetTitleEnabledForMultiplayerServersStatusRequest
): Types.GetTitleEnabledForMultiplayerServersStatusResponse
	return PlayFabInternal.MakeApiCall(
		"/MultiplayerServer/GetTitleEnabledForMultiplayerServersStatus",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Gets a title's server quota change request. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/gettitlemultiplayerserversquotachange
function Apis.GetTitleMultiplayerServersQuotaChangeAsync(
	entityToken: string, 
	request: Types.GetTitleMultiplayerServersQuotaChangeRequest
): Types.GetTitleMultiplayerServersQuotaChangeResponse
	return PlayFabInternal.MakeApiCall(
		"/MultiplayerServer/GetTitleMultiplayerServersQuotaChange",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Gets the quotas for a title in relation to multiplayer servers. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/gettitlemultiplayerserversquotas
function Apis.GetTitleMultiplayerServersQuotasAsync(
	entityToken: string, 
	request: Types.GetTitleMultiplayerServersQuotasRequest
): Types.GetTitleMultiplayerServersQuotasResponse
	return PlayFabInternal.MakeApiCall(
		"/MultiplayerServer/GetTitleMultiplayerServersQuotas",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Returns a list of archived multiplayer servers for a build in a specific region. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/listarchivedmultiplayerservers
function Apis.ListArchivedMultiplayerServersAsync(
	entityToken: string, 
	request: Types.ListMultiplayerServersRequest
): Types.ListMultiplayerServersResponse
	return PlayFabInternal.MakeApiCall(
		"/MultiplayerServer/ListArchivedMultiplayerServers",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Returns a list of multiplayer server game asset summaries for a title. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/listassetsummaries
function Apis.ListAssetSummariesAsync(
	entityToken: string, 
	request: Types.ListAssetSummariesRequest
): Types.ListAssetSummariesResponse
	return PlayFabInternal.MakeApiCall(
		"/MultiplayerServer/ListAssetSummaries",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Returns a list of summarized details of all multiplayer server builds for a 
--- title. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/listbuildaliases
function Apis.ListBuildAliasesAsync(
	entityToken: string, 
	request: Types.ListBuildAliasesRequest
): Types.ListBuildAliasesResponse
	return PlayFabInternal.MakeApiCall(
		"/MultiplayerServer/ListBuildAliases",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Returns a list of summarized details of all multiplayer server builds for a 
--- title. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/listbuildsummariesv2
function Apis.ListBuildSummariesV2Async(
	entityToken: string, 
	request: Types.ListBuildSummariesRequest
): Types.ListBuildSummariesResponse
	return PlayFabInternal.MakeApiCall(
		"/MultiplayerServer/ListBuildSummariesV2",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Returns a list of multiplayer server game certificates for a title. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/listcertificatesummaries
function Apis.ListCertificateSummariesAsync(
	entityToken: string, 
	request: Types.ListCertificateSummariesRequest
): Types.ListCertificateSummariesResponse
	return PlayFabInternal.MakeApiCall(
		"/MultiplayerServer/ListCertificateSummaries",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Returns a list of the tags for a particular container image that exists in the 
--- container registry for a title. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/listcontainerimagetags
function Apis.ListContainerImageTagsAsync(
	entityToken: string, 
	request: Types.ListContainerImageTagsRequest
): Types.ListContainerImageTagsResponse
	return PlayFabInternal.MakeApiCall(
		"/MultiplayerServer/ListContainerImageTags",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Returns a list of the container images that have been uploaded to the container 
--- registry for a title. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/listcontainerimages
function Apis.ListContainerImagesAsync(
	entityToken: string, 
	request: Types.ListContainerImagesRequest
): Types.ListContainerImagesResponse
	return PlayFabInternal.MakeApiCall(
		"/MultiplayerServer/ListContainerImages",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Returns a list of multiplayer servers for a build in a specific region. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/listmultiplayerservers
function Apis.ListMultiplayerServersAsync(
	entityToken: string, 
	request: Types.ListMultiplayerServersRequest
): Types.ListMultiplayerServersResponse
	return PlayFabInternal.MakeApiCall(
		"/MultiplayerServer/ListMultiplayerServers",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Returns a list of quality of service servers for party. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/listpartyqosservers
function Apis.ListPartyQosServersAsync(
	request: Types.ListPartyQosServersRequest
): Types.ListPartyQosServersResponse
	return PlayFabInternal.MakeApiCall(
		"/MultiplayerServer/ListPartyQosServers",
		request,
		nil,
		nil
	)
end

--- Returns a list of quality of service servers for a title. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/listqosserversfortitle
function Apis.ListQosServersForTitleAsync(
	entityToken: string, 
	request: Types.ListQosServersForTitleRequest
): Types.ListQosServersForTitleResponse
	return PlayFabInternal.MakeApiCall(
		"/MultiplayerServer/ListQosServersForTitle",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- List all server quota change requests for a title. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/listtitlemultiplayerserversquotachanges
function Apis.ListTitleMultiplayerServersQuotaChangesAsync(
	entityToken: string, 
	request: Types.ListTitleMultiplayerServersQuotaChangesRequest
): Types.ListTitleMultiplayerServersQuotaChangesResponse
	return PlayFabInternal.MakeApiCall(
		"/MultiplayerServer/ListTitleMultiplayerServersQuotaChanges",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Returns a list of virtual machines for a title. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/listvirtualmachinesummaries
function Apis.ListVirtualMachineSummariesAsync(
	entityToken: string, 
	request: Types.ListVirtualMachineSummariesRequest
): Types.ListVirtualMachineSummariesResponse
	return PlayFabInternal.MakeApiCall(
		"/MultiplayerServer/ListVirtualMachineSummaries",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Requests a multiplayer server session from a particular build in any of the 
--- given preferred regions. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/requestmultiplayerserver
function Apis.RequestMultiplayerServerAsync(
	entityToken: string, 
	request: Types.RequestMultiplayerServerRequest
): Types.RequestMultiplayerServerResponse
	return PlayFabInternal.MakeApiCall(
		"/MultiplayerServer/RequestMultiplayerServer",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Gets new credentials to the container registry where game developers can upload 
--- custom container images to before creating a new build. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/rollovercontainerregistrycredentials
function Apis.RolloverContainerRegistryCredentialsAsync(
	entityToken: string, 
	request: Types.RolloverContainerRegistryCredentialsRequest
): Types.RolloverContainerRegistryCredentialsResponse
	return PlayFabInternal.MakeApiCall(
		"/MultiplayerServer/RolloverContainerRegistryCredentials",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Executes the shutdown callback from the GSDK and terminates the multiplayer 
--- server session. The callback in the GSDK will allow for graceful shutdown with 
--- a 15 minute timeoutIf graceful shutdown has not been completed before 15 minutes 
--- have elapsed, the multiplayer server session will be forcefully terminated on 
--- it's own. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/shutdownmultiplayerserver
function Apis.ShutdownMultiplayerServerAsync(
	entityToken: string, 
	request: Types.ShutdownMultiplayerServerRequest
): Types.EmptyResponse
	return PlayFabInternal.MakeApiCall(
		"/MultiplayerServer/ShutdownMultiplayerServer",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Removes the specified tag from the image. After this operation, a 'docker pull' 
--- will fail for the specified image and tag combination. Morever, ListContainerImageTags 
--- will not return the specified tag. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/untagcontainerimage
function Apis.UntagContainerImageAsync(
	entityToken: string, 
	request: Types.UntagContainerImageRequest
): Types.EmptyResponse
	return PlayFabInternal.MakeApiCall(
		"/MultiplayerServer/UntagContainerImage",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Creates a multiplayer server build alias and returns the created alias. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/updatebuildalias
function Apis.UpdateBuildAliasAsync(
	entityToken: string, 
	request: Types.UpdateBuildAliasRequest
): Types.BuildAliasDetailsResponse
	return PlayFabInternal.MakeApiCall(
		"/MultiplayerServer/UpdateBuildAlias",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Updates a multiplayer server build's name. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/updatebuildname
function Apis.UpdateBuildNameAsync(
	entityToken: string, 
	request: Types.UpdateBuildNameRequest
): Types.EmptyResponse
	return PlayFabInternal.MakeApiCall(
		"/MultiplayerServer/UpdateBuildName",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Updates a multiplayer server build's region. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/updatebuildregion
function Apis.UpdateBuildRegionAsync(
	entityToken: string, 
	request: Types.UpdateBuildRegionRequest
): Types.EmptyResponse
	return PlayFabInternal.MakeApiCall(
		"/MultiplayerServer/UpdateBuildRegion",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Updates a multiplayer server build's regions. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/updatebuildregions
function Apis.UpdateBuildRegionsAsync(
	entityToken: string, 
	request: Types.UpdateBuildRegionsRequest
): Types.EmptyResponse
	return PlayFabInternal.MakeApiCall(
		"/MultiplayerServer/UpdateBuildRegions",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Uploads a multiplayer server game certificate. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/uploadcertificate
function Apis.UploadCertificateAsync(
	entityToken: string, 
	request: Types.UploadCertificateRequest
): Types.EmptyResponse
	return PlayFabInternal.MakeApiCall(
		"/MultiplayerServer/UploadCertificate",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- SignalR clients make this request to initiate their connection to the PubSubHub 
--- SignalR service. Clients will interpret the response and make a persistent websocket 
--- connection to the service with the details. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/pubsub/negotiate
function Apis.NegotiateAsync(
	entityToken: string, 
	request: Types.PubSubNegotiateRequest
): Types.PubSubNegotiateResult
	return PlayFabInternal.MakeApiCall(
		"/PubSub/Negotiate",
		request,
		"X-EntityToken",
		entityToken
	)
end

return Apis

