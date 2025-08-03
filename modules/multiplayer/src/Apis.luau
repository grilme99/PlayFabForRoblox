--[[
	This file was generated on 2025-08-03 at 00:04 UTC. Do not edit directly.

]]

local Types = require(script.Parent.Types)

local Common = require(script.Parent.Parent.PlayFabCommon)
local makeApiCall = Common.makeApiCall
type Result<T, E> = Common.Result<T, E>

local Apis = {}

--[[
	Creates a multiplayer server build with the server running as a process.

	Creates a multiplayer server build with the game server running as a process
	and returns information about the build creation request.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/createbuildwithprocessbasedserver).

	### Errors
	- APINotEnabledForGameClientAccess
	- MultiplayerServerBadRequest
	- MultiplayerServerConflict
	- MultiplayerServerForbidden
	- MultiplayerServerInternalServerError
	- MultiplayerServerTitleQuotaCoresExceeded
	- MultiplayerServerUnauthorized
	- MultiplayerServerUnavailable

]]
function Apis.CreateBuildWithProcessBasedServer(request: Types.CreateBuildWithProcessBasedServerRequest, entityToken: string): Result<Types.CreateBuildWithProcessBasedServerResponse, string>
	return makeApiCall(
		"/MultiplayerServer/CreateBuildWithProcessBasedServer",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Gets a remote login endpoint to a VM that is hosting a multiplayer server
	build.

	Gets a remote login endpoint to a VM that is hosting a multiplayer server
	build in a specific region.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/getremoteloginendpoint).

	### Errors
	- APINotEnabledForGameClientAccess
	- MultiplayerServerBadRequest
	- MultiplayerServerForbidden
	- MultiplayerServerInternalServerError
	- MultiplayerServerNotFound
	- MultiplayerServerTooManyRequests
	- MultiplayerServerUnauthorized
	- MultiplayerServerUnavailable

]]
function Apis.GetRemoteLoginEndpoint(request: Types.GetRemoteLoginEndpointRequest, entityToken: string): Result<Types.GetRemoteLoginEndpointResponse, string>
	return makeApiCall(
		"/MultiplayerServer/GetRemoteLoginEndpoint",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	SDK support is limited to C# and Java for this API. List all matchmaking
	queue configs.

	Gets a list of all the matchmaking queue configurations for the title.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/multiplayer/matchmaking-admin/listmatchmakingqueues).

]]
function Apis.ListMatchmakingQueues(request: Types.ListMatchmakingQueuesRequest, entityToken: string): Result<Types.ListMatchmakingQueuesResult, string>
	return makeApiCall(
		"/Match/ListMatchmakingQueues",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Update a lobby.

	Request to update a lobby.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/multiplayer/lobby/updatelobby).

	### Errors
	- LobbyBadRequest
	- LobbyCurrentOwnerStillConnected
	- LobbyCurrentPlayersMoreThanMaxPlayers
	- LobbyDoesNotExist
	- LobbyMemberIsNotOwner
	- LobbyNewOwnerMustBeConnected
	- LobbyRateLimitExceeded

]]
function Apis.UpdateLobby(request: Types.UpdateLobbyRequest, entityToken: string): Result<Types.LobbyEmptyResult, string>
	return makeApiCall(
		"/Lobby/UpdateLobby",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Enables the multiplayer server feature for a title.

	Enables the multiplayer server feature for a title and returns the enabled
	status. The enabled status can be Initializing, Enabled, and Disabled. It
	can up to 20 minutes or more for the title to be enabled for the feature. On
	average, it can take up to 20 minutes for the title to be enabled for the
	feature.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/enablemultiplayerserversfortitle).

	### Errors
	- APINotEnabledForGameClientAccess
	- CannotEnableMultiplayerServersForTitle
	- MultiplayerServerBadRequest
	- MultiplayerServerForbidden
	- MultiplayerServerInternalServerError
	- MultiplayerServerUnauthorized
	- MultiplayerServerUnavailable

]]
function Apis.EnableMultiplayerServersForTitle(request: Types.EnableMultiplayerServersForTitleRequest, entityToken: string): Result<Types.EnableMultiplayerServersForTitleResponse, string>
	return makeApiCall(
		"/MultiplayerServer/EnableMultiplayerServersForTitle",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Deletes a container image repository.

	Removes the specified container image repository. After this operation, a
	'docker pull' will fail for all the tags of the specified image. Morever,
	ListContainerImages will not return the specified image.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/deletecontainerimagerepository).

	### Errors
	- APINotEnabledForGameClientAccess
	- MultiplayerServerBadRequest
	- MultiplayerServerForbidden
	- MultiplayerServerInternalServerError
	- MultiplayerServerNotFound
	- MultiplayerServerTooManyRequests
	- MultiplayerServerUnauthorized
	- MultiplayerServerUnavailable

]]
function Apis.DeleteContainerImageRepository(request: Types.DeleteContainerImageRequest, entityToken: string): Result<Types.EmptyResponse, string>
	return makeApiCall(
		"/MultiplayerServer/DeleteContainerImageRepository",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Updates a multiplayer server build's name.

	Updates a multiplayer server build's name.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/updatebuildname).

	### Errors
	- APINotEnabledForGameClientAccess
	- MultiplayerServerBadRequest
	- MultiplayerServerConflict
	- MultiplayerServerForbidden
	- MultiplayerServerInternalServerError
	- MultiplayerServerNotFound
	- MultiplayerServerUnauthorized
	- MultiplayerServerUnavailable

]]
function Apis.UpdateBuildName(request: Types.UpdateBuildNameRequest, entityToken: string): Result<Types.EmptyResponse, string>
	return makeApiCall(
		"/MultiplayerServer/UpdateBuildName",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Creates a remote user to log on to a VM for a multiplayer server build.

	Creates a remote user to log on to a VM for a multiplayer server build in a
	specific region. Returns user credential information necessary to log on.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/createremoteuser).

	### Errors
	- APINotEnabledForGameClientAccess
	- MultiplayerServerBadRequest
	- MultiplayerServerConflict
	- MultiplayerServerForbidden
	- MultiplayerServerInternalServerError
	- MultiplayerServerNotFound
	- MultiplayerServerTooManyRequests
	- MultiplayerServerUnauthorized
	- MultiplayerServerUnavailable

]]
function Apis.CreateRemoteUser(request: Types.CreateRemoteUserRequest, entityToken: string): Result<Types.CreateRemoteUserResponse, string>
	return makeApiCall(
		"/MultiplayerServer/CreateRemoteUser",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Join a lobby.

	Request to join a lobby. Only a client can join a lobby.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/multiplayer/lobby/joinlobby).

	### Errors
	- LobbyBadRequest
	- LobbyDoesNotExist
	- LobbyMemberCannotRejoin
	- LobbyNotJoinable
	- LobbyPlayerAlreadyJoined
	- LobbyPlayerMaxLobbyLimitExceeded
	- LobbyRateLimitExceeded

]]
function Apis.JoinLobby(request: Types.JoinLobbyRequest, entityToken: string): Result<Types.JoinLobbyResult, string>
	return makeApiCall(
		"/Lobby/JoinLobby",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Create a matchmaking ticket as a client.

	The client specifies the creator's attributes and optionally a list of other
	users to match with.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/multiplayer/matchmaking/creatematchmakingticket).

	### Errors
	- MatchmakingAttributeInvalid
	- MatchmakingBadRequest
	- MatchmakingEntityInvalid
	- MatchmakingMemberProfileInvalid
	- MatchmakingNumberOfPlayersInTicketTooLarge
	- MatchmakingPlayerAttributesInvalid
	- MatchmakingPlayerAttributesTooLarge
	- MatchmakingQueueNotFound
	- MatchmakingRateLimitExceeded
	- MatchmakingTicketMembershipLimitExceeded
	- MatchmakingUnauthorized

]]
function Apis.CreateMatchmakingTicket(request: Types.CreateMatchmakingTicketRequest, entityToken: string): Result<Types.CreateMatchmakingTicketResult, string>
	return makeApiCall(
		"/Match/CreateMatchmakingTicket",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	List all server quota change requests for a title.

	List all server quota change requests for a title.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/listtitlemultiplayerserversquotachanges).

	### Errors
	- APINotEnabledForGameClientAccess
	- MultiplayerServerBadRequest
	- MultiplayerServerForbidden
	- MultiplayerServerInternalServerError
	- MultiplayerServerUnauthorized

]]
function Apis.ListTitleMultiplayerServersQuotaChanges(request: Types.ListTitleMultiplayerServersQuotaChangesRequest, entityToken: string): Result<Types.ListTitleMultiplayerServersQuotaChangesResponse, string>
	return makeApiCall(
		"/MultiplayerServer/ListTitleMultiplayerServersQuotaChanges",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Cancel all active backfill tickets the player is a member of in a given
	queue.

	Cancels all backfill tickets of which the player is a member in a given
	queue that are not cancelled or matched. This API is useful if you lose
	track of what tickets the player is a member of (if the server crashes for
	instance) and want to "reset".

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/multiplayer/matchmaking/cancelallserverbackfillticketsforplayer).

	### Errors
	- MatchmakingEntityInvalid
	- MatchmakingQueueNotFound
	- MatchmakingUnauthorized

]]
function Apis.CancelAllServerBackfillTicketsForPlayer(request: Types.CancelAllServerBackfillTicketsForPlayerRequest, entityToken: string): Result<Types.CancelAllServerBackfillTicketsForPlayerResult, string>
	return makeApiCall(
		"/Match/CancelAllServerBackfillTicketsForPlayer",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Send a notification to invite a player to a lobby.

	Request to invite a player to a lobby the caller is already a member of.
	Only a client can invite another player to a lobby.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/multiplayer/lobby/invitetolobby).

	### Errors
	- LobbyBadRequest
	- LobbyDoesNotExist
	- LobbyPlayerNotPresent
	- LobbyRateLimitExceeded

]]
function Apis.InviteToLobby(request: Types.InviteToLobbyRequest, entityToken: string): Result<Types.LobbyEmptyResult, string>
	return makeApiCall(
		"/Lobby/InviteToLobby",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	SDK support is limited to C# and Java for this API. Get a matchmaking queue
	configuration.

	Gets the current configuration for a queue.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/multiplayer/matchmaking-admin/getmatchmakingqueue).

	### Errors
	- MatchmakingQueueNotFound

]]
function Apis.GetMatchmakingQueue(request: Types.GetMatchmakingQueueRequest, entityToken: string): Result<Types.GetMatchmakingQueueResult, string>
	return makeApiCall(
		"/Match/GetMatchmakingQueue",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Rolls over the credentials to the container registry.

	Gets new credentials to the container registry where game developers can
	upload custom container images to before creating a new build.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/rollovercontainerregistrycredentials).

	### Errors
	- APINotEnabledForGameClientAccess
	- MultiplayerServerBadRequest
	- MultiplayerServerForbidden
	- MultiplayerServerInternalServerError
	- MultiplayerServerNotFound
	- MultiplayerServerTooManyRequests
	- MultiplayerServerUnauthorized
	- MultiplayerServerUnavailable

]]
function Apis.RolloverContainerRegistryCredentials(request: Types.RolloverContainerRegistryCredentialsRequest, entityToken: string): Result<Types.RolloverContainerRegistryCredentialsResponse, string>
	return makeApiCall(
		"/MultiplayerServer/RolloverContainerRegistryCredentials",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Deletes a multiplayer server build.

	Deletes a multiplayer server build.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/deletebuild).

	### Errors
	- APINotEnabledForGameClientAccess
	- MultiplayerServerBadRequest
	- MultiplayerServerBuildReferencedByMatchmakingQueue
	- MultiplayerServerForbidden
	- MultiplayerServerInternalServerError
	- MultiplayerServerNotFound
	- MultiplayerServerUnauthorized
	- MultiplayerServerUnavailable

]]
function Apis.DeleteBuild(request: Types.DeleteBuildRequest, entityToken: string): Result<Types.EmptyResponse, string>
	return makeApiCall(
		"/MultiplayerServer/DeleteBuild",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Gets multiplayer server logs after a server has terminated.

	Gets multiplayer server logs for a specific server id in a region. The logs
	are available only after a server has terminated.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/getmultiplayersessionlogsbysessionid).

	### Errors
	- APINotEnabledForGameClientAccess
	- MultiplayerServerBadRequest
	- MultiplayerServerForbidden
	- MultiplayerServerInternalServerError
	- MultiplayerServerNotFound
	- MultiplayerServerTooManyRequests
	- MultiplayerServerUnauthorized
	- MultiplayerServerUnavailable

]]
function Apis.GetMultiplayerSessionLogsBySessionId(request: Types.GetMultiplayerSessionLogsBySessionIdRequest, entityToken: string): Result<Types.GetMultiplayerServerLogsResponse, string>
	return makeApiCall(
		"/MultiplayerServer/GetMultiplayerSessionLogsBySessionId",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Lists quality of service servers for the title. By default, servers are only
	returned for regions where a Multiplayer Servers build has been deployed.

	Returns a list of quality of service servers for a title.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/listqosserversfortitle).

	### Errors
	- APINotEnabledForGameClientAccess
	- MultiplayerServerBadRequest
	- MultiplayerServerForbidden
	- MultiplayerServerInternalServerError
	- MultiplayerServerNotFound
	- MultiplayerServerUnauthorized
	- MultiplayerServerUnavailable

]]
function Apis.ListQosServersForTitle(request: Types.ListQosServersForTitleRequest, entityToken: string): Result<Types.ListQosServersForTitleResponse, string>
	return makeApiCall(
		"/MultiplayerServer/ListQosServersForTitle",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Request a party session.

	Requests a party session from a particular set of builds if build alias
	params is provided, in any of the given preferred regions.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/requestpartyservice).

	### Errors
	- PartyBadRequest
	- PartyInternalServerError
	- PartyNotFound
	- PartyRequestsThrottledFromRateLimiter
	- PartyTooManyRequests
	- PartyUnauthorized
	- PartyUnavailable

]]
function Apis.RequestPartyService(request: Types.RequestPartyServiceRequest, entityToken: string): Result<Types.RequestPartyServiceResponse, string>
	return makeApiCall(
		"/Party/RequestPartyService",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Deletes a remote user to log on to a VM for a multiplayer server build.

	Deletes a remote user to log on to a VM for a multiplayer server build in a
	specific region. Returns user credential information necessary to log on.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/deleteremoteuser).

	### Errors
	- APINotEnabledForGameClientAccess
	- MultiplayerServerBadRequest
	- MultiplayerServerForbidden
	- MultiplayerServerInternalServerError
	- MultiplayerServerNoContent
	- MultiplayerServerNotFound
	- MultiplayerServerTooManyRequests
	- MultiplayerServerUnauthorized
	- MultiplayerServerUnavailable

]]
function Apis.DeleteRemoteUser(request: Types.DeleteRemoteUserRequest, entityToken: string): Result<Types.EmptyResponse, string>
	return makeApiCall(
		"/MultiplayerServer/DeleteRemoteUser",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Deletes a multiplayer server build alias.

	Deletes a multiplayer server build alias.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/deletebuildalias).

	### Errors
	- APINotEnabledForGameClientAccess
	- MultiplayerServerBuildAliasReferencedByMatchmakingQueue
	- MultiplayerServerForbidden
	- MultiplayerServerInternalServerError
	- MultiplayerServerNotFound
	- MultiplayerServerTooManyRequests
	- MultiplayerServerUnauthorized
	- MultiplayerServerUnavailable

]]
function Apis.DeleteBuildAlias(request: Types.DeleteBuildAliasRequest, entityToken: string): Result<Types.EmptyResponse, string>
	return makeApiCall(
		"/MultiplayerServer/DeleteBuildAlias",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Find lobbies which match certain criteria, and which friends are in.

	Request to find friends lobbies. Only a client can find friend lobbies.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/multiplayer/lobby/findfriendlobbies).

	### Errors
	- LobbyBadRequest
	- LobbyRateLimitExceeded

]]
function Apis.FindFriendLobbies(request: Types.FindFriendLobbiesRequest, entityToken: string): Result<Types.FindFriendLobbiesResult, string>
	return makeApiCall(
		"/Lobby/FindFriendLobbies",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Preview: Join a lobby as a server entity. This is restricted to client
	lobbies which are using connections.

	Preview: Request to join a lobby as a server. Only callable by a game_server
	entity and this is restricted to client owned lobbies which are using
	connections.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/multiplayer/lobby/joinlobbyasserver).

	### Errors
	- LobbyBadRequest
	- LobbyDifferentServerAlreadyJoined
	- LobbyDoesNotExist
	- LobbyDoesNotUseConnections
	- LobbyIsNotClientOwned
	- LobbyRateLimitExceeded
	- LobbyServerAlreadyJoined

]]
function Apis.JoinLobbyAsServer(request: Types.JoinLobbyAsServerRequest, entityToken: string): Result<Types.JoinLobbyAsServerResult, string>
	return makeApiCall(
		"/Lobby/JoinLobbyAsServer",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Creates a multiplayer server build with a managed container.

	Creates a multiplayer server build with a managed container and returns
	information about the build creation request.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/createbuildwithmanagedcontainer).

	### Errors
	- APINotEnabledForGameClientAccess
	- MultiplayerServerBadRequest
	- MultiplayerServerConflict
	- MultiplayerServerForbidden
	- MultiplayerServerInternalServerError
	- MultiplayerServerTitleQuotaCoresExceeded
	- MultiplayerServerUnauthorized
	- MultiplayerServerUnavailable

]]
function Apis.CreateBuildWithManagedContainer(request: Types.CreateBuildWithManagedContainerRequest, entityToken: string): Result<Types.CreateBuildWithManagedContainerResponse, string>
	return makeApiCall(
		"/MultiplayerServer/CreateBuildWithManagedContainer",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Gets a multiplayer server build.

	Returns the details about a multiplayer server build.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/getbuild).

	### Errors
	- APINotEnabledForGameClientAccess
	- MultiplayerServerBadRequest
	- MultiplayerServerForbidden
	- MultiplayerServerInternalServerError
	- MultiplayerServerNotFound
	- MultiplayerServerTooManyRequests
	- MultiplayerServerUnauthorized
	- MultiplayerServerUnavailable

]]
function Apis.GetBuild(request: Types.GetBuildRequest, entityToken: string): Result<Types.GetBuildResponse, string>
	return makeApiCall(
		"/MultiplayerServer/GetBuild",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Preview: Update fields related to a joined server in the lobby the server is
	in. Servers can keep a lobby from expiring by being the one to "update" the
	lobby in some way. Servers have no impact on last member leave/last member
	disconnect behavior.

	Preview: Request to update the serverData and serverEntity in case of
	migration. Only a game_server entity can update this information and this is
	restricted to client owned lobbies which are using connections.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/multiplayer/lobby/updatelobbyasserver).

	### Errors
	- LobbyBadRequest
	- LobbyDoesNotExist
	- LobbyRateLimitExceeded
	- LobbyServerMismatch
	- LobbyServerNotFound

]]
function Apis.UpdateLobbyAsServer(request: Types.UpdateLobbyAsServerRequest, entityToken: string): Result<Types.LobbyEmptyResult, string>
	return makeApiCall(
		"/Lobby/UpdateLobbyAsServer",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Cancel a server backfill ticket.

	Only servers can cancel a backfill ticket. The ticket can be in three
	different states when it is cancelled. 1: the ticket is matching. If the
	ticket is cancelled, it will stop matching. 2: the ticket is matched. A
	matched ticket cannot be cancelled. 3: the ticket is already cancelled and
	nothing happens. There may be race conditions between the ticket getting
	matched and the server making a cancellation request. The server must handle
	the possibility that the cancel request fails if a match is found before the
	cancellation request is processed. We do not allow resubmitting a cancelled
	ticket. Create a new ticket instead.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/multiplayer/matchmaking/cancelserverbackfillticket).

	### Errors
	- MatchmakingEntityInvalid
	- MatchmakingQueueNotFound
	- MatchmakingRequestTypeMismatch
	- MatchmakingTicketAlreadyCompleted
	- MatchmakingTicketNotFound
	- MatchmakingUnauthorized

]]
function Apis.CancelServerBackfillTicket(request: Types.CancelServerBackfillTicketRequest, entityToken: string): Result<Types.CancelServerBackfillTicketResult, string>
	return makeApiCall(
		"/Match/CancelServerBackfillTicket",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Gets a multiplayer server build alias.

	Returns the details about a multiplayer server build alias.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/getbuildalias).

	### Errors
	- APINotEnabledForGameClientAccess
	- MultiplayerServerBadRequest
	- MultiplayerServerForbidden
	- MultiplayerServerInternalServerError
	- MultiplayerServerNotFound
	- MultiplayerServerTooManyRequests
	- MultiplayerServerUnauthorized
	- MultiplayerServerUnavailable

]]
function Apis.GetBuildAlias(request: Types.GetBuildAliasRequest, entityToken: string): Result<Types.BuildAliasDetailsResponse, string>
	return makeApiCall(
		"/MultiplayerServer/GetBuildAlias",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Get the statistics for a queue.

	Returns the matchmaking statistics for a queue. These include the number of
	players matching and the statistics related to the time to match statistics
	in seconds (average and percentiles). Statistics are refreshed once every 5
	minutes. Servers can access all statistics no matter what the
	ClientStatisticsVisibility is configured to. Clients can access statistics
	according to the ClientStatisticsVisibility. Client requests are forbidden
	if all visibility fields are false.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/multiplayer/matchmaking/getqueuestatistics).

	### Errors
	- MatchmakingEntityInvalid
	- MatchmakingQueueNotFound
	- MatchmakingRateLimitExceeded
	- MatchmakingUnauthorized

]]
function Apis.GetQueueStatistics(request: Types.GetQueueStatisticsRequest, entityToken: string): Result<Types.GetQueueStatisticsResult, string>
	return makeApiCall(
		"/Match/GetQueueStatistics",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Creates a multiplayer server build alias.

	Creates a multiplayer server build alias and returns the created alias.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/createbuildalias).

	### Errors
	- APINotEnabledForGameClientAccess
	- MultiplayerServerBadRequest
	- MultiplayerServerConflict
	- MultiplayerServerForbidden
	- MultiplayerServerInternalServerError
	- MultiplayerServerNotFound
	- MultiplayerServerUnauthorized
	- MultiplayerServerUnavailable

]]
function Apis.CreateBuildAlias(request: Types.CreateBuildAliasRequest, entityToken: string): Result<Types.BuildAliasDetailsResponse, string>
	return makeApiCall(
		"/MultiplayerServer/CreateBuildAlias",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Lists multiplayer server game certificates for a title.

	Returns a list of multiplayer server game certificates for a title.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/listcertificatesummaries).

	### Errors
	- APINotEnabledForGameClientAccess
	- MultiplayerServerBadRequest
	- MultiplayerServerForbidden
	- MultiplayerServerInternalServerError
	- MultiplayerServerNotFound
	- MultiplayerServerTooManyRequests
	- MultiplayerServerUnauthorized
	- MultiplayerServerUnavailable

]]
function Apis.ListCertificateSummaries(request: Types.ListCertificateSummariesRequest, entityToken: string): Result<Types.ListCertificateSummariesResponse, string>
	return makeApiCall(
		"/MultiplayerServer/ListCertificateSummaries",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Deletes a multiplayer server game secret.

	Deletes a multiplayer server game secret.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/deletesecret).

	### Errors
	- APINotEnabledForGameClientAccess
	- MultiplayerServerBadRequest
	- MultiplayerServerForbidden
	- MultiplayerServerInternalServerError
	- MultiplayerServerNoContent
	- MultiplayerServerNotFound
	- MultiplayerServerTooManyRequests
	- MultiplayerServerUnauthorized
	- MultiplayerServerUnavailable

]]
function Apis.DeleteSecret(request: Types.DeleteSecretRequest, entityToken: string): Result<Types.EmptyResponse, string>
	return makeApiCall(
		"/MultiplayerServer/DeleteSecret",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Cancel all active tickets the player is a member of in a given queue.

	Cancels all tickets of which the player is a member in a given queue that
	are not cancelled or matched. This API is useful if you lose track of what
	tickets the player is a member of (if the title crashes for instance) and
	want to "reset". The Entity field is optional if the caller is a player and
	defaults to that player. Players may not cancel tickets for other people.
	The Entity field is required if the caller is a server (authenticated as the
	title).

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/multiplayer/matchmaking/cancelallmatchmakingticketsforplayer).

	### Errors
	- MatchmakingEntityInvalid
	- MatchmakingQueueNotFound
	- MatchmakingRateLimitExceeded
	- MatchmakingUnauthorized

]]
function Apis.CancelAllMatchmakingTicketsForPlayer(request: Types.CancelAllMatchmakingTicketsForPlayerRequest, entityToken: string): Result<Types.CancelAllMatchmakingTicketsForPlayerResult, string>
	return makeApiCall(
		"/Match/CancelAllMatchmakingTicketsForPlayer",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Negotiate a SignalR Connection to the PubSub service, as the first step of
	establishing the connection. Note: SignalR client implementations expect the
	Hub URL to omit the `/negotiate` portion of this path (ex: HubConnection
	should be passed a URL that ends in `...playfabapi.com/pubsub`). When
	starting the connection, SignalR clients will automatically append
	`/negotiate` to the end of the URL of the hub. The SignalR client will
	interpret the response object to establish a persistent connection to
	PubSub.
	https://docs.microsoft.com/aspnet/core/signalr/dotnet-client#connect-to-a-hub
	https://github.com/dotnet/aspnetcore/blob/main/src/SignalR/docs/specs/TransportProtocols.md#post-endpoint-basenegotiate-request

	SignalR clients make this request to initiate their connection to the
	PubSubHub SignalR service. Clients will interpret the response and make a
	persistent websocket connection to the service with the details.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/multiplayer/pubsub/negotiate).

	### Errors
	- InternalServerError
	- PubSubFeatureNotEnabledForTitle
	- PubSubTooManyRequests
	- ServiceUnavailable

]]
function Apis.Negotiate(request: Types.PubSubNegotiateRequest, entityToken: string): Result<Types.PubSubNegotiateResult, string>
	return makeApiCall(
		"/PubSub/Negotiate",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	SDK support is limited to C# and Java for this API. Create or update a
	matchmaking queue configuration.

	Use this API to create or update matchmaking queue configurations. The queue
	configuration defines the matchmaking rules. The matchmaking service will
	match tickets together according to the configured rules. Queue resources
	are not spun up by calling this API. Queues are created when the first
	ticket is submitted.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/multiplayer/matchmaking-admin/setmatchmakingqueue).

	### Errors
	- MatchmakingQueueConfigInvalid
	- MatchmakingQueueLimitExceeded

]]
function Apis.SetMatchmakingQueue(request: Types.SetMatchmakingQueueRequest, entityToken: string): Result<Types.SetMatchmakingQueueResult, string>
	return makeApiCall(
		"/Match/SetMatchmakingQueue",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Join an Arranged lobby.

	Request to join an arranged lobby. Only a client can join an arranged lobby.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/multiplayer/lobby/joinarrangedlobby).

	### Errors
	- LobbyBadRequest
	- LobbyMemberCannotRejoin
	- LobbyNotJoinable
	- LobbyPlayerAlreadyJoined
	- LobbyPlayerMaxLobbyLimitExceeded
	- LobbyRateLimitExceeded

]]
function Apis.JoinArrangedLobby(request: Types.JoinArrangedLobbyRequest, entityToken: string): Result<Types.JoinLobbyResult, string>
	return makeApiCall(
		"/Lobby/JoinArrangedLobby",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Gets the credentials to the container registry.

	Gets credentials to the container registry where game developers can upload
	custom container images to before creating a new build.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/getcontainerregistrycredentials).

	### Errors
	- APINotEnabledForGameClientAccess
	- MultiplayerServerBadRequest
	- MultiplayerServerForbidden
	- MultiplayerServerInternalServerError
	- MultiplayerServerNotFound
	- MultiplayerServerTooManyRequests
	- MultiplayerServerUnauthorized
	- MultiplayerServerUnavailable

]]
function Apis.GetContainerRegistryCredentials(request: Types.GetContainerRegistryCredentialsRequest, entityToken: string): Result<Types.GetContainerRegistryCredentialsResponse, string>
	return makeApiCall(
		"/MultiplayerServer/GetContainerRegistryCredentials",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Remove a member from a lobby.

	Request to remove a member from a lobby. Owners may remove other members
	from a lobby. Members cannot remove themselves (use LeaveLobby instead).

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/multiplayer/lobby/removemember).

	### Errors
	- LobbyBadRequest
	- LobbyDoesNotExist
	- LobbyPlayerNotPresent
	- LobbyRateLimitExceeded

]]
function Apis.RemoveMember(request: Types.RemoveMemberFromLobbyRequest, entityToken: string): Result<Types.LobbyEmptyResult, string>
	return makeApiCall(
		"/Lobby/RemoveMember",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Preview: Request for server to leave a lobby. This is restricted to client
	owned lobbies which are using connections.

	Preview: Request for server to leave a lobby. Only a game_server entity can
	leave and this is restricted to client owned lobbies which are using
	connections.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/multiplayer/lobby/leavelobbyasserver).

	### Errors
	- LobbyBadRequest
	- LobbyDoesNotExist
	- LobbyDoesNotUseConnections
	- LobbyIsNotClientOwned
	- LobbyRateLimitExceeded
	- LobbyServerMismatch
	- LobbyServerNotFound

]]
function Apis.LeaveLobbyAsServer(request: Types.LeaveLobbyAsServerRequest, entityToken: string): Result<Types.LobbyEmptyResult, string>
	return makeApiCall(
		"/Lobby/LeaveLobbyAsServer",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Untags a container image.

	Removes the specified tag from the image. After this operation, a 'docker
	pull' will fail for the specified image and tag combination. Morever,
	ListContainerImageTags will not return the specified tag.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/untagcontainerimage).

	### Errors
	- APINotEnabledForGameClientAccess
	- MultiplayerServerBadRequest
	- MultiplayerServerForbidden
	- MultiplayerServerInternalServerError
	- MultiplayerServerNotFound
	- MultiplayerServerTooManyRequests
	- MultiplayerServerUnauthorized
	- MultiplayerServerUnavailable

]]
function Apis.UntagContainerImage(request: Types.UntagContainerImageRequest, entityToken: string): Result<Types.EmptyResponse, string>
	return makeApiCall(
		"/MultiplayerServer/UntagContainerImage",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Cancel a matchmaking ticket.

	Only servers and ticket members can cancel a ticket. The ticket can be in
	five different states when it is cancelled. 1: the ticket is waiting for
	members to join it, and it has not started matching. If the ticket is
	cancelled at this stage, it will never match. 2: the ticket is matching. If
	the ticket is cancelled, it will stop matching. 3: the ticket is matched. A
	matched ticket cannot be cancelled. 4: the ticket is already cancelled and
	nothing happens. 5: the ticket is waiting for a server. If the ticket is
	cancelled, server allocation will be stopped. A server may still be
	allocated due to a race condition, but that will not be reflected in the
	ticket. There may be race conditions between the ticket getting matched and
	the client making a cancellation request. The client must handle the
	possibility that the cancel request fails if a match is found before the
	cancellation request is processed. We do not allow resubmitting a cancelled
	ticket because players must consent to enter matchmaking again. Create a new
	ticket instead.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/multiplayer/matchmaking/cancelmatchmakingticket).

	### Errors
	- MatchmakingEntityInvalid
	- MatchmakingPlayerHasNotJoinedTicket
	- MatchmakingQueueNotFound
	- MatchmakingRateLimitExceeded
	- MatchmakingRequestTypeMismatch
	- MatchmakingTicketAlreadyCompleted
	- MatchmakingTicketNotFound
	- MatchmakingUnauthorized

]]
function Apis.CancelMatchmakingTicket(request: Types.CancelMatchmakingTicketRequest, entityToken: string): Result<Types.CancelMatchmakingTicketResult, string>
	return makeApiCall(
		"/Match/CancelMatchmakingTicket",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Get a match.

	When matchmaking has successfully matched together a collection of tickets,
	it produces a 'match' with an Id. The match contains all of the players that
	were matched together, and their team assigments. Only servers and ticket
	members can get the match.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/multiplayer/matchmaking/getmatch).

	### Errors
	- MatchmakingEntityInvalid
	- MatchmakingMatchNotFound
	- MatchmakingQueueNotFound
	- MatchmakingRateLimitExceeded
	- MatchmakingUnauthorized

]]
function Apis.GetMatch(request: Types.GetMatchRequest, entityToken: string): Result<Types.GetMatchResult, string>
	return makeApiCall(
		"/Match/GetMatch",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Gets the URL to upload assets to. A sample pre-authenticated url -
	https://sampleStorageAccount.blob.core.windows.net/gameassets/gameserver.zip?sv=2015-04-05&ss=b&srt=sco&sp=rw&st=startDate&se=endDate&spr=https&sig=sampleSig&api-version=2017-07-29

	Gets the URL to upload assets to.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/getassetuploadurl).

	### Errors
	- APINotEnabledForGameClientAccess
	- MultiplayerServerBadRequest
	- MultiplayerServerConflict
	- MultiplayerServerForbidden
	- MultiplayerServerInternalServerError
	- MultiplayerServerNotFound
	- MultiplayerServerTooManyRequests
	- MultiplayerServerUnauthorized
	- MultiplayerServerUnavailable

]]
function Apis.GetAssetUploadUrl(request: Types.GetAssetUploadUrlRequest, entityToken: string): Result<Types.GetAssetUploadUrlResponse, string>
	return makeApiCall(
		"/MultiplayerServer/GetAssetUploadUrl",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Lists quality of service servers for party.

	Returns a list of quality of service servers for party.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/listpartyqosservers).

	### Errors
	- APINotEnabledForGameClientAccess
	- MultiplayerServerBadRequest
	- MultiplayerServerForbidden
	- MultiplayerServerInternalServerError
	- MultiplayerServerUnauthorized
	- MultiplayerServerUnavailable

]]
function Apis.ListPartyQosServers(request: Types.ListPartyQosServersRequest): Result<Types.ListPartyQosServersResponse, string>
	return makeApiCall(
		"/MultiplayerServer/ListPartyQosServers",
		request,
		"None"
	)
end

--[[
	Subscribe to lobby resource notifications.

	Request to subscribe to lobby resource notifications.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/multiplayer/lobby/subscribetolobbyresource).

	### Errors
	- LobbyBadRequest
	- LobbyDoesNotExist
	- LobbyRateLimitExceeded
	- PubSubConnectionHandleInvalid
	- PubSubConnectionNotFoundForEntity
	- PubSubSubscriptionLimitExceeded

]]
function Apis.SubscribeToLobbyResource(request: Types.SubscribeToLobbyResourceRequest, entityToken: string): Result<Types.SubscribeToLobbyResourceResult, string>
	return makeApiCall(
		"/Lobby/SubscribeToLobbyResource",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Gets the status of whether a title is enabled for the multiplayer server
	feature.

	Gets the status of whether a title is enabled for the multiplayer server
	feature. The enabled status can be Initializing, Enabled, and Disabled.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/gettitleenabledformultiplayerserversstatus).

	### Errors
	- APINotEnabledForGameClientAccess
	- MultiplayerServerBadRequest
	- MultiplayerServerForbidden
	- MultiplayerServerInternalServerError
	- MultiplayerServerNotFound
	- MultiplayerServerUnauthorized
	- MultiplayerServerUnavailable

]]
function Apis.GetTitleEnabledForMultiplayerServersStatus(request: Types.GetTitleEnabledForMultiplayerServersStatusRequest, entityToken: string): Result<Types.GetTitleEnabledForMultiplayerServersStatusResponse, string>
	return makeApiCall(
		"/MultiplayerServer/GetTitleEnabledForMultiplayerServersStatus",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Removes a multiplayer server build's region.

	Removes a multiplayer server build's region.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/deletebuildregion).

	### Errors
	- APINotEnabledForGameClientAccess
	- MultiplayerServerBadRequest
	- MultiplayerServerConflict
	- MultiplayerServerForbidden
	- MultiplayerServerInternalServerError
	- MultiplayerServerNotFound
	- MultiplayerServerUnauthorized
	- MultiplayerServerUnavailable

]]
function Apis.DeleteBuildRegion(request: Types.DeleteBuildRegionRequest, entityToken: string): Result<Types.EmptyResponse, string>
	return makeApiCall(
		"/MultiplayerServer/DeleteBuildRegion",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Get a matchmaking backfill ticket by ticket Id.

	The ticket includes the players, their attributes, their teams, the ticket
	status, the match Id and the server details when applicable, etc. Only
	servers can get the ticket.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/multiplayer/matchmaking/getserverbackfillticket).

	### Errors
	- MatchmakingEntityInvalid
	- MatchmakingQueueNotFound
	- MatchmakingRateLimitExceeded
	- MatchmakingRequestTypeMismatch
	- MatchmakingTicketNotFound
	- MatchmakingUnauthorized

]]
function Apis.GetServerBackfillTicket(request: Types.GetServerBackfillTicketRequest, entityToken: string): Result<Types.GetServerBackfillTicketResult, string>
	return makeApiCall(
		"/Match/GetServerBackfillTicket",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Create a lobby.

	Request to create a lobby. A Server or client can create a lobby.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/multiplayer/lobby/createlobby).

	### Errors
	- LobbyBadRequest
	- LobbyPlayerMaxLobbyLimitExceeded
	- LobbyRateLimitExceeded

]]
function Apis.CreateLobby(request: Types.CreateLobbyRequest, entityToken: string): Result<Types.CreateLobbyResult, string>
	return makeApiCall(
		"/Lobby/CreateLobby",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Join a matchmaking ticket.

	Add the player to a matchmaking ticket and specify all of its matchmaking
	attributes. Players can join a ticket if and only if their EntityKeys are
	already listed in the ticket's Members list. The matchmaking service
	automatically starts matching the ticket against other matchmaking tickets
	once all players have joined the ticket. It is not possible to join a ticket
	once it has started matching.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/multiplayer/matchmaking/joinmatchmakingticket).

	### Errors
	- MatchmakingAlreadyJoinedTicket
	- MatchmakingAttributeInvalid
	- MatchmakingEntityInvalid
	- MatchmakingMemberProfileInvalid
	- MatchmakingPlayerAttributesInvalid
	- MatchmakingPlayerAttributesTooLarge
	- MatchmakingQueueNotFound
	- MatchmakingRateLimitExceeded
	- MatchmakingTicketAlreadyCompleted
	- MatchmakingTicketMembershipLimitExceeded
	- MatchmakingTicketNotFound
	- MatchmakingUnauthorized

]]
function Apis.JoinMatchmakingTicket(request: Types.JoinMatchmakingTicketRequest, entityToken: string): Result<Types.JoinMatchmakingTicketResult, string>
	return makeApiCall(
		"/Match/JoinMatchmakingTicket",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Subscribe to match resource notifications.

	Subscribe to match resource notifications. Match subscriptions have two
	types; MatchInvite and MatchTicketStatusChange

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/multiplayer/matchmaking/subscribetomatchmakingresource).

	### Errors
	- MatchmakingAttributeInvalid
	- MatchmakingBadRequest
	- MatchmakingEntityInvalid
	- MatchmakingTicketNotFound
	- MatchmakingUnauthorized
	- PubSubConnectionHandleInvalid
	- PubSubConnectionNotFoundForEntity
	- PubSubSubscriptionLimitExceeded

]]
function Apis.SubscribeToMatchmakingResource(request: Types.SubscribeToMatchResourceRequest, entityToken: string): Result<Types.SubscribeToMatchResourceResult, string>
	return makeApiCall(
		"/Match/SubscribeToMatchmakingResource",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Unsubscribe from match resource notifications.

	Unsubscribe from a Match resource's notifications. For MatchInvite, players
	are expected to unsubscribe once they can no longer accept invites. For
	MatchTicketStatusChange, players are expected to unsusbcribe once the ticket
	has reached a canceled or matched state.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/multiplayer/matchmaking/unsubscribefrommatchmakingresource).

	### Errors
	- MatchmakingAttributeInvalid
	- MatchmakingBadRequest
	- MatchmakingEntityInvalid
	- MatchmakingTicketNotFound
	- MatchmakingUnauthorized
	- PubSubConnectionHandleInvalid
	- PubSubConnectionNotFoundForEntity

]]
function Apis.UnsubscribeFromMatchmakingResource(request: Types.UnsubscribeFromMatchResourceRequest, entityToken: string): Result<Types.UnsubscribeFromMatchResourceResult, string>
	return makeApiCall(
		"/Match/UnsubscribeFromMatchmakingResource",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Delete a lobby.

	Request to delete a lobby. Only servers can delete lobbies.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/multiplayer/lobby/deletelobby).

	### Errors
	- LobbyBadRequest
	- LobbyDoesNotExist
	- LobbyRateLimitExceeded

]]
function Apis.DeleteLobby(request: Types.DeleteLobbyRequest, entityToken: string): Result<Types.LobbyEmptyResult, string>
	return makeApiCall(
		"/Lobby/DeleteLobby",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Lists details of all build aliases for a title. Accepts tokens for title and
	if game client access is enabled, allows game client to request list of
	builds with player entity token.

	Returns a list of summarized details of all multiplayer server builds for a
	title.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/listbuildaliases).

	### Errors
	- APINotEnabledForGameClientAccess
	- MultiplayerServerBadRequest
	- MultiplayerServerForbidden
	- MultiplayerServerInternalServerError
	- MultiplayerServerNotFound
	- MultiplayerServerUnauthorized
	- MultiplayerServerUnavailable

]]
function Apis.ListBuildAliases(request: Types.ListBuildAliasesRequest, entityToken: string): Result<Types.ListBuildAliasesResponse, string>
	return makeApiCall(
		"/MultiplayerServer/ListBuildAliases",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Lists the tags for a custom container image.

	Returns a list of the tags for a particular container image that exists in
	the container registry for a title.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/listcontainerimagetags).

	### Errors
	- APINotEnabledForGameClientAccess
	- MultiplayerServerBadRequest
	- MultiplayerServerForbidden
	- MultiplayerServerInternalServerError
	- MultiplayerServerNotFound
	- MultiplayerServerTooManyRequests
	- MultiplayerServerUnauthorized
	- MultiplayerServerUnavailable

]]
function Apis.ListContainerImageTags(request: Types.ListContainerImageTagsRequest, entityToken: string): Result<Types.ListContainerImageTagsResponse, string>
	return makeApiCall(
		"/MultiplayerServer/ListContainerImageTags",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Creates a multiplayer server build with a custom container.

	Creates a multiplayer server build with a custom container and returns
	information about the build creation request.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/createbuildwithcustomcontainer).

	### Errors
	- APINotEnabledForGameClientAccess
	- MultiplayerServerBadRequest
	- MultiplayerServerConflict
	- MultiplayerServerForbidden
	- MultiplayerServerInternalServerError
	- MultiplayerServerTitleQuotaCoresExceeded
	- MultiplayerServerUnauthorized
	- MultiplayerServerUnavailable

]]
function Apis.CreateBuildWithCustomContainer(request: Types.CreateBuildWithCustomContainerRequest, entityToken: string): Result<Types.CreateBuildWithCustomContainerResponse, string>
	return makeApiCall(
		"/MultiplayerServer/CreateBuildWithCustomContainer",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Updates a multiplayer server build's regions.

	Updates a multiplayer server build's regions.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/updatebuildregions).

	### Errors
	- APINotEnabledForGameClientAccess
	- MultiplayerServerBadRequest
	- MultiplayerServerConflict
	- MultiplayerServerForbidden
	- MultiplayerServerInternalServerError
	- MultiplayerServerNotFound
	- MultiplayerServerTitleQuotaCoresExceeded
	- MultiplayerServerUnauthorized
	- MultiplayerServerUnavailable

]]
function Apis.UpdateBuildRegions(request: Types.UpdateBuildRegionsRequest, entityToken: string): Result<Types.EmptyResponse, string>
	return makeApiCall(
		"/MultiplayerServer/UpdateBuildRegions",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Lists multiplayer server game secrets for a title.

	Returns a list of multiplayer server game secrets for a title.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/listsecretsummaries).

	### Errors
	- APINotEnabledForGameClientAccess
	- MultiplayerServerBadRequest
	- MultiplayerServerForbidden
	- MultiplayerServerInternalServerError
	- MultiplayerServerNotFound
	- MultiplayerServerTooManyRequests
	- MultiplayerServerUnauthorized
	- MultiplayerServerUnavailable

]]
function Apis.ListSecretSummaries(request: Types.ListSecretSummariesRequest, entityToken: string): Result<Types.ListSecretSummariesResponse, string>
	return makeApiCall(
		"/MultiplayerServer/ListSecretSummaries",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Lists summarized details of all multiplayer server builds for a title.
	Accepts tokens for title and if game client access is enabled, allows game
	client to request list of builds with player entity token.

	Returns a list of summarized details of all multiplayer server builds for a
	title.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/listbuildsummariesv2).

	### Errors
	- APINotEnabledForGameClientAccess
	- MultiplayerServerBadRequest
	- MultiplayerServerForbidden
	- MultiplayerServerInternalServerError
	- MultiplayerServerNotFound
	- MultiplayerServerTooManyRequests
	- MultiplayerServerUnauthorized
	- MultiplayerServerUnavailable

]]
function Apis.ListBuildSummariesV2(request: Types.ListBuildSummariesRequest, entityToken: string): Result<Types.ListBuildSummariesResponse, string>
	return makeApiCall(
		"/MultiplayerServer/ListBuildSummariesV2",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Lists multiplayer server game assets for a title.

	Returns a list of multiplayer server game asset summaries for a title.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/listassetsummaries).

	### Errors
	- APINotEnabledForGameClientAccess
	- MultiplayerServerBadRequest
	- MultiplayerServerForbidden
	- MultiplayerServerInternalServerError
	- MultiplayerServerNotFound
	- MultiplayerServerTooManyRequests
	- MultiplayerServerUnauthorized
	- MultiplayerServerUnavailable

]]
function Apis.ListAssetSummaries(request: Types.ListAssetSummariesRequest, entityToken: string): Result<Types.ListAssetSummariesResponse, string>
	return makeApiCall(
		"/MultiplayerServer/ListAssetSummaries",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Creates a multiplayer server build alias.

	Creates a multiplayer server build alias and returns the created alias.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/updatebuildalias).

	### Errors
	- APINotEnabledForGameClientAccess
	- MultiplayerServerBadRequest
	- MultiplayerServerConflict
	- MultiplayerServerForbidden
	- MultiplayerServerInternalServerError
	- MultiplayerServerNotFound
	- MultiplayerServerUnauthorized
	- MultiplayerServerUnavailable

]]
function Apis.UpdateBuildAlias(request: Types.UpdateBuildAliasRequest, entityToken: string): Result<Types.BuildAliasDetailsResponse, string>
	return makeApiCall(
		"/MultiplayerServer/UpdateBuildAlias",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Creates a request to change a title's multiplayer server quotas.

	Creates a request to change a title's multiplayer server quotas.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/createtitlemultiplayerserversquotachange).

	### Errors
	- APINotEnabledForGameClientAccess
	- MultiplayerServerBadRequest
	- MultiplayerServerForbidden
	- MultiplayerServerInternalServerError
	- MultiplayerServerUnauthorized

]]
function Apis.CreateTitleMultiplayerServersQuotaChange(request: Types.CreateTitleMultiplayerServersQuotaChangeRequest, entityToken: string): Result<Types.CreateTitleMultiplayerServersQuotaChangeResponse, string>
	return makeApiCall(
		"/MultiplayerServer/CreateTitleMultiplayerServersQuotaChange",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Gets multiplayer server logs after a server has terminated.

	Gets multiplayer server logs for a specific server id in a region. The logs
	are available only after a server has terminated.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/getmultiplayerserverlogs).

	### Errors
	- APINotEnabledForGameClientAccess
	- MultiplayerServerBadRequest
	- MultiplayerServerForbidden
	- MultiplayerServerInternalServerError
	- MultiplayerServerNotFound
	- MultiplayerServerTooManyRequests
	- MultiplayerServerUnauthorized
	- MultiplayerServerUnavailable

]]
function Apis.GetMultiplayerServerLogs(request: Types.GetMultiplayerServerLogsRequest, entityToken: string): Result<Types.GetMultiplayerServerLogsResponse, string>
	return makeApiCall(
		"/MultiplayerServer/GetMultiplayerServerLogs",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Deletes a multiplayer server game certificate.

	Deletes a multiplayer server game certificate.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/deletecertificate).

	### Errors
	- APINotEnabledForGameClientAccess
	- MultiplayerServerBadRequest
	- MultiplayerServerForbidden
	- MultiplayerServerInternalServerError
	- MultiplayerServerNoContent
	- MultiplayerServerNotFound
	- MultiplayerServerTooManyRequests
	- MultiplayerServerUnauthorized
	- MultiplayerServerUnavailable

]]
function Apis.DeleteCertificate(request: Types.DeleteCertificateRequest, entityToken: string): Result<Types.EmptyResponse, string>
	return makeApiCall(
		"/MultiplayerServer/DeleteCertificate",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Find all the lobbies that match certain criteria.

	Request to find lobbies.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/multiplayer/lobby/findlobbies).

	### Errors
	- LobbyBadRequest
	- LobbyRateLimitExceeded

]]
function Apis.FindLobbies(request: Types.FindLobbiesRequest, entityToken: string): Result<Types.FindLobbiesResult, string>
	return makeApiCall(
		"/Lobby/FindLobbies",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Get a matchmaking ticket by ticket Id.

	The ticket includes the invited players, their attributes if they have
	joined, the ticket status, the match Id when applicable, etc. Only servers,
	the ticket creator and the invited players can get the ticket.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/multiplayer/matchmaking/getmatchmakingticket).

	### Errors
	- MatchmakingEntityInvalid
	- MatchmakingQueueNotFound
	- MatchmakingRateLimitExceeded
	- MatchmakingRequestTypeMismatch
	- MatchmakingTicketNotFound
	- MatchmakingUnauthorized

]]
function Apis.GetMatchmakingTicket(request: Types.GetMatchmakingTicketRequest, entityToken: string): Result<Types.GetMatchmakingTicketResult, string>
	return makeApiCall(
		"/Match/GetMatchmakingTicket",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Create a matchmaking ticket as a server. The matchmaking service
	automatically starts matching the ticket against other matchmaking tickets.

	The server specifies all the members and their attributes.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/multiplayer/matchmaking/createservermatchmakingticket).

	### Errors
	- MatchmakingAttributeInvalid
	- MatchmakingEntityInvalid
	- MatchmakingMemberProfileInvalid
	- MatchmakingNumberOfPlayersInTicketTooLarge
	- MatchmakingPlayerAttributesInvalid
	- MatchmakingPlayerAttributesTooLarge
	- MatchmakingQueueNotFound
	- MatchmakingRateLimitExceeded
	- MatchmakingTicketMembershipLimitExceeded
	- MatchmakingUnauthorized

]]
function Apis.CreateServerMatchmakingTicket(request: Types.CreateServerMatchmakingTicketRequest, entityToken: string): Result<Types.CreateMatchmakingTicketResult, string>
	return makeApiCall(
		"/Match/CreateServerMatchmakingTicket",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	List all server backfill ticket Ids the user is a member of.

	List all server backfill ticket Ids the user is a member of.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/multiplayer/matchmaking/listserverbackfillticketsforplayer).

	### Errors
	- MatchmakingEntityInvalid
	- MatchmakingQueueNotFound
	- MatchmakingRateLimitExceeded
	- MatchmakingUnauthorized

]]
function Apis.ListServerBackfillTicketsForPlayer(request: Types.ListServerBackfillTicketsForPlayerRequest, entityToken: string): Result<Types.ListServerBackfillTicketsForPlayerResult, string>
	return makeApiCall(
		"/Match/ListServerBackfillTicketsForPlayer",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Updates a multiplayer server build's region. If the region is not yet
	created, it will be created

	Updates a multiplayer server build's region.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/updatebuildregion).

	### Errors
	- APINotEnabledForGameClientAccess
	- MultiplayerServerBadRequest
	- MultiplayerServerConflict
	- MultiplayerServerForbidden
	- MultiplayerServerInternalServerError
	- MultiplayerServerNotFound
	- MultiplayerServerTitleQuotaCoresExceeded
	- MultiplayerServerUnauthorized
	- MultiplayerServerUnavailable

]]
function Apis.UpdateBuildRegion(request: Types.UpdateBuildRegionRequest, entityToken: string): Result<Types.EmptyResponse, string>
	return makeApiCall(
		"/MultiplayerServer/UpdateBuildRegion",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Gets multiplayer server session details for a build.

	Gets multiplayer server session details for a build in a specific region.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/getmultiplayerserverdetails).

	### Errors
	- APINotEnabledForGameClientAccess
	- MultiplayerServerBadRequest
	- MultiplayerServerForbidden
	- MultiplayerServerInternalServerError
	- MultiplayerServerNotFound
	- MultiplayerServerUnauthorized
	- MultiplayerServerUnavailable

]]
function Apis.GetMultiplayerServerDetails(request: Types.GetMultiplayerServerDetailsRequest, entityToken: string): Result<Types.GetMultiplayerServerDetailsResponse, string>
	return makeApiCall(
		"/MultiplayerServer/GetMultiplayerServerDetails",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	SDK support is limited to C# and Java for this API. Remove a matchmaking
	queue config.

	Deletes the configuration for a queue. This will permanently delete the
	configuration and players will no longer be able to match in the queue. All
	outstanding matchmaking tickets will be cancelled.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/multiplayer/matchmaking-admin/removematchmakingqueue).

	### Errors
	- MatchmakingQueueNotFound

]]
function Apis.RemoveMatchmakingQueue(request: Types.RemoveMatchmakingQueueRequest, entityToken: string): Result<Types.RemoveMatchmakingQueueResult, string>
	return makeApiCall(
		"/Match/RemoveMatchmakingQueue",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Gets a title's server quota change request.

	Gets a title's server quota change request.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/gettitlemultiplayerserversquotachange).

	### Errors
	- APINotEnabledForGameClientAccess
	- MultiplayerServerBadRequest
	- MultiplayerServerForbidden
	- MultiplayerServerInternalServerError
	- MultiplayerServerUnauthorized

]]
function Apis.GetTitleMultiplayerServersQuotaChange(request: Types.GetTitleMultiplayerServersQuotaChangeRequest, entityToken: string): Result<Types.GetTitleMultiplayerServersQuotaChangeResponse, string>
	return makeApiCall(
		"/MultiplayerServer/GetTitleMultiplayerServersQuotaChange",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Gets the quotas for a title in relation to multiplayer servers.

	Gets the quotas for a title in relation to multiplayer servers.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/gettitlemultiplayerserversquotas).

	### Errors
	- APINotEnabledForGameClientAccess
	- MultiplayerServerBadRequest
	- MultiplayerServerForbidden
	- MultiplayerServerInternalServerError
	- MultiplayerServerNotFound
	- MultiplayerServerUnauthorized
	- MultiplayerServerUnavailable

]]
function Apis.GetTitleMultiplayerServersQuotas(request: Types.GetTitleMultiplayerServersQuotasRequest, entityToken: string): Result<Types.GetTitleMultiplayerServersQuotasResponse, string>
	return makeApiCall(
		"/MultiplayerServer/GetTitleMultiplayerServersQuotas",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Uploads a multiplayer server game secret.

	Uploads a multiplayer server game secret.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/uploadsecret).

	### Errors
	- APINotEnabledForGameClientAccess
	- MultiplayerServerBadRequest
	- MultiplayerServerConflict
	- MultiplayerServerForbidden
	- MultiplayerServerInternalServerError
	- MultiplayerServerNoContent
	- MultiplayerServerNotFound
	- MultiplayerServerTooManyRequests
	- MultiplayerServerUnauthorized
	- MultiplayerServerUnavailable

]]
function Apis.UploadSecret(request: Types.UploadSecretRequest, entityToken: string): Result<Types.EmptyResponse, string>
	return makeApiCall(
		"/MultiplayerServer/UploadSecret",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Lists archived multiplayer server sessions for a build.

	Returns a list of multiplayer servers for a build in a specific region.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/listarchivedmultiplayerservers).

	### Errors
	- APINotEnabledForGameClientAccess
	- MultiplayerServerBadRequest
	- MultiplayerServerForbidden
	- MultiplayerServerInternalServerError
	- MultiplayerServerNotFound
	- MultiplayerServerUnauthorized
	- MultiplayerServerUnavailable

]]
function Apis.ListArchivedMultiplayerServers(request: Types.ListMultiplayerServersRequest, entityToken: string): Result<Types.ListMultiplayerServersResponse, string>
	return makeApiCall(
		"/MultiplayerServer/ListArchivedMultiplayerServers",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Request a multiplayer server session. Accepts tokens for title and if game
	client access is enabled, allows game client to request a server with player
	entity token.

	Requests a multiplayer server session from a particular build in any of the
	given preferred regions.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/requestmultiplayerserver).

	### Errors
	- APINotEnabledForGameClientAccess
	- MultiplayerServerBadRequest
	- MultiplayerServerForbidden
	- MultiplayerServerInternalServerError
	- MultiplayerServerNotFound
	- MultiplayerServerTooManyRequests
	- MultiplayerServerUnauthorized
	- MultiplayerServerUnavailable

]]
function Apis.RequestMultiplayerServer(request: Types.RequestMultiplayerServerRequest, entityToken: string): Result<Types.RequestMultiplayerServerResponse, string>
	return makeApiCall(
		"/MultiplayerServer/RequestMultiplayerServer",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Get a lobby.

	Request to get a lobby.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/multiplayer/lobby/getlobby).

	### Errors
	- LobbyBadRequest
	- LobbyDoesNotExist
	- LobbyRateLimitExceeded

]]
function Apis.GetLobby(request: Types.GetLobbyRequest, entityToken: string): Result<Types.GetLobbyResult, string>
	return makeApiCall(
		"/Lobby/GetLobby",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Shuts down a multiplayer server session.

	Executes the shutdown callback from the GSDK and terminates the multiplayer
	server session. The callback in the GSDK will allow for graceful shutdown
	with a 15 minute timeoutIf graceful shutdown has not been completed before
	15 minutes have elapsed, the multiplayer server session will be forcefully
	terminated on it's own.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/shutdownmultiplayerserver).

	### Errors
	- APINotEnabledForGameClientAccess
	- MultiplayerServerForbidden
	- MultiplayerServerInternalServerError
	- MultiplayerServerNoContent
	- MultiplayerServerNotFound
	- MultiplayerServerUnauthorized
	- MultiplayerServerUnavailable

]]
function Apis.ShutdownMultiplayerServer(request: Types.ShutdownMultiplayerServerRequest, entityToken: string): Result<Types.EmptyResponse, string>
	return makeApiCall(
		"/MultiplayerServer/ShutdownMultiplayerServer",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Lists custom container images for a title.

	Returns a list of the container images that have been uploaded to the
	container registry for a title.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/listcontainerimages).

	### Errors
	- APINotEnabledForGameClientAccess
	- MultiplayerServerBadRequest
	- MultiplayerServerForbidden
	- MultiplayerServerInternalServerError
	- MultiplayerServerNotFound
	- MultiplayerServerTooManyRequests
	- MultiplayerServerUnauthorized
	- MultiplayerServerUnavailable

]]
function Apis.ListContainerImages(request: Types.ListContainerImagesRequest, entityToken: string): Result<Types.ListContainerImagesResponse, string>
	return makeApiCall(
		"/MultiplayerServer/ListContainerImages",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Create a backfill matchmaking ticket as a server. A backfill ticket
	represents an ongoing game. The matchmaking service automatically starts
	matching the backfill ticket against other matchmaking tickets. Backfill
	tickets cannot match with other backfill tickets.

	The server specifies all the members, their teams and their attributes, and
	the server details if applicable.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/multiplayer/matchmaking/createserverbackfillticket).

	### Errors
	- MatchmakingAttributeInvalid
	- MatchmakingBadRequest
	- MatchmakingEntityInvalid
	- MatchmakingMemberProfileInvalid
	- MatchmakingNumberOfPlayersInTicketTooLarge
	- MatchmakingPlayerAttributesInvalid
	- MatchmakingPlayerAttributesTooLarge
	- MatchmakingQueueNotFound
	- MatchmakingRateLimitExceeded
	- MatchmakingTicketMembershipLimitExceeded
	- MatchmakingUnauthorized

]]
function Apis.CreateServerBackfillTicket(request: Types.CreateServerBackfillTicketRequest, entityToken: string): Result<Types.CreateServerBackfillTicketResult, string>
	return makeApiCall(
		"/Match/CreateServerBackfillTicket",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Unsubscribe from lobby notifications.

	Request to unsubscribe from lobby notifications.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/multiplayer/lobby/unsubscribefromlobbyresource).

	### Errors
	- LobbyBadRequest
	- LobbyDoesNotExist
	- LobbyRateLimitExceeded
	- PubSubConnectionHandleInvalid
	- PubSubConnectionNotFoundForEntity

]]
function Apis.UnsubscribeFromLobbyResource(request: Types.UnsubscribeFromLobbyResourceRequest, entityToken: string): Result<Types.LobbyEmptyResult, string>
	return makeApiCall(
		"/Lobby/UnsubscribeFromLobbyResource",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Gets a URL that can be used to download the specified asset. A sample
	pre-authenticated url -
	https://sampleStorageAccount.blob.core.windows.net/gameassets/gameserver.zip?sv=2015-04-05&ss=b&srt=sco&sp=rw&st=startDate&se=endDate&spr=https&sig=sampleSig&api-version=2017-07-29

	Gets a URL that can be used to download the specified asset.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/getassetdownloadurl).

	### Errors
	- MultiplayerServerBadRequest
	- MultiplayerServerForbidden
	- MultiplayerServerInternalServerError
	- MultiplayerServerNotFound
	- MultiplayerServerTooManyRequests
	- MultiplayerServerUnauthorized
	- MultiplayerServerUnavailable

]]
function Apis.GetAssetDownloadUrl(request: Types.GetAssetDownloadUrlRequest, entityToken: string): Result<Types.GetAssetDownloadUrlResponse, string>
	return makeApiCall(
		"/MultiplayerServer/GetAssetDownloadUrl",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Leave a lobby.

	Request to leave a lobby. Only a client can leave a lobby.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/multiplayer/lobby/leavelobby).

	### Errors
	- LobbyBadRequest
	- LobbyDoesNotExist
	- LobbyPlayerNotPresent
	- LobbyRateLimitExceeded

]]
function Apis.LeaveLobby(request: Types.LeaveLobbyRequest, entityToken: string): Result<Types.LobbyEmptyResult, string>
	return makeApiCall(
		"/Lobby/LeaveLobby",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	List all matchmaking ticket Ids the user is a member of.

	If the caller is a title, the EntityKey in the request is required. If the
	caller is a player, then it is optional. If it is provided it must match the
	caller's entity.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/multiplayer/matchmaking/listmatchmakingticketsforplayer).

	### Errors
	- MatchmakingEntityInvalid
	- MatchmakingQueueNotFound
	- MatchmakingRateLimitExceeded
	- MatchmakingUnauthorized

]]
function Apis.ListMatchmakingTicketsForPlayer(request: Types.ListMatchmakingTicketsForPlayerRequest, entityToken: string): Result<Types.ListMatchmakingTicketsForPlayerResult, string>
	return makeApiCall(
		"/Match/ListMatchmakingTicketsForPlayer",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Lists multiplayer server sessions for a build.

	Returns a list of multiplayer servers for a build in a specific region.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/listmultiplayerservers).

	### Errors
	- APINotEnabledForGameClientAccess
	- MultiplayerServerBadRequest
	- MultiplayerServerForbidden
	- MultiplayerServerInternalServerError
	- MultiplayerServerNotFound
	- MultiplayerServerUnauthorized
	- MultiplayerServerUnavailable

]]
function Apis.ListMultiplayerServers(request: Types.ListMultiplayerServersRequest, entityToken: string): Result<Types.ListMultiplayerServersResponse, string>
	return makeApiCall(
		"/MultiplayerServer/ListMultiplayerServers",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Uploads a multiplayer server game certificate.

	Uploads a multiplayer server game certificate.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/uploadcertificate).

	### Errors
	- APINotEnabledForGameClientAccess
	- MultiplayerServerBadRequest
	- MultiplayerServerConflict
	- MultiplayerServerForbidden
	- MultiplayerServerInternalServerError
	- MultiplayerServerNoContent
	- MultiplayerServerNotFound
	- MultiplayerServerTooManyRequests
	- MultiplayerServerUnauthorized
	- MultiplayerServerUnavailable

]]
function Apis.UploadCertificate(request: Types.UploadCertificateRequest, entityToken: string): Result<Types.EmptyResponse, string>
	return makeApiCall(
		"/MultiplayerServer/UploadCertificate",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Deletes a multiplayer server game asset for a title.

	Deletes a multiplayer server game asset for a title.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/deleteasset).

	### Errors
	- APINotEnabledForGameClientAccess
	- MultiplayerServerBadRequest
	- MultiplayerServerForbidden
	- MultiplayerServerInternalServerError
	- MultiplayerServerNoContent
	- MultiplayerServerNotFound
	- MultiplayerServerTooManyRequests
	- MultiplayerServerUnauthorized
	- MultiplayerServerUnavailable

]]
function Apis.DeleteAsset(request: Types.DeleteAssetRequest, entityToken: string): Result<Types.EmptyResponse, string>
	return makeApiCall(
		"/MultiplayerServer/DeleteAsset",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Lists virtual machines for a title.

	Returns a list of virtual machines for a title.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/listvirtualmachinesummaries).

	### Errors
	- APINotEnabledForGameClientAccess
	- MultiplayerServerBadRequest
	- MultiplayerServerForbidden
	- MultiplayerServerInternalServerError
	- MultiplayerServerNotFound
	- MultiplayerServerUnauthorized
	- MultiplayerServerUnavailable

]]
function Apis.ListVirtualMachineSummaries(request: Types.ListVirtualMachineSummariesRequest, entityToken: string): Result<Types.ListVirtualMachineSummariesResponse, string>
	return makeApiCall(
		"/MultiplayerServer/ListVirtualMachineSummaries",
		request,
		"X-EntityToken",
		entityToken
	)
end

return Apis
