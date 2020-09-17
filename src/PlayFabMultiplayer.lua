-- PlayFab Multiplayer API
-- You should not require this file directly
-- All api calls are documented here: https://docs.microsoft.com/gaming/playfab/api-references/

-- Check if the roblox-ts promise implementation exists for Typescript users
local rbxts_include = game.ReplicatedStorage:FindFirstChild('rbxts_include')
local Promise
if (rbxts_include and rbxts_include:FindFirstChild('Promise')) then
    Promise = require(rbxts_include.Promise)
else
    Promise = require(script.Parent.Promise)
end

local IPlayFabHttps = require(script.Parent.IPlayFabHttps)
local PlayFabSettings = require(script.Parent.PlayFabSettings)

local PlayFabMultiplayerApi = {
    settings = PlayFabSettings.settings
}

--[[
    Cancel all active tickets the player is a member of in a given queue.
    https://docs.microsoft.com/rest/api/playfab/multiplayer/matchmaking/cancelallmatchmakingticketsforplayer
--]]
function PlayFabMultiplayerApi:CancelAllMatchmakingTicketsForPlayer(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Match/CancelAllMatchmakingTicketsForPlayer", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

--[[
    Cancel all active backfill tickets the player is a member of in a given queue.
    https://docs.microsoft.com/rest/api/playfab/multiplayer/matchmaking/cancelallserverbackfillticketsforplayer
--]]
function PlayFabMultiplayerApi:CancelAllServerBackfillTicketsForPlayer(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Match/CancelAllServerBackfillTicketsForPlayer", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

--[[
    Cancel a matchmaking ticket.
    https://docs.microsoft.com/rest/api/playfab/multiplayer/matchmaking/cancelmatchmakingticket
--]]
function PlayFabMultiplayerApi:CancelMatchmakingTicket(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Match/CancelMatchmakingTicket", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

--[[
    Cancel a server backfill ticket.
    https://docs.microsoft.com/rest/api/playfab/multiplayer/matchmaking/cancelserverbackfillticket
--]]
function PlayFabMultiplayerApi:CancelServerBackfillTicket(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Match/CancelServerBackfillTicket", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

--[[
    Creates a multiplayer server build alias.
    https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/createbuildalias
--]]
function PlayFabMultiplayerApi:CreateBuildAlias(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/MultiplayerServer/CreateBuildAlias", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

--[[
    Creates a multiplayer server build with a custom container.
    https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/createbuildwithcustomcontainer
--]]
function PlayFabMultiplayerApi:CreateBuildWithCustomContainer(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/MultiplayerServer/CreateBuildWithCustomContainer", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

--[[
    Creates a multiplayer server build with a managed container.
    https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/createbuildwithmanagedcontainer
--]]
function PlayFabMultiplayerApi:CreateBuildWithManagedContainer(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/MultiplayerServer/CreateBuildWithManagedContainer", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

--[[
    Creates a multiplayer server build with the server running as a process.
    https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/createbuildwithprocessbasedserver
--]]
function PlayFabMultiplayerApi:CreateBuildWithProcessBasedServer(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/MultiplayerServer/CreateBuildWithProcessBasedServer", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

--[[
    Create a matchmaking ticket as a client.
    https://docs.microsoft.com/rest/api/playfab/multiplayer/matchmaking/creatematchmakingticket
--]]
function PlayFabMultiplayerApi:CreateMatchmakingTicket(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Match/CreateMatchmakingTicket", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

--[[
    Creates a remote user to log on to a VM for a multiplayer server build.
    https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/createremoteuser
--]]
function PlayFabMultiplayerApi:CreateRemoteUser(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/MultiplayerServer/CreateRemoteUser", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

--[[
    Create a backfill matchmaking ticket as a server. A backfill ticket represents an ongoing game. The matchmaking service
    automatically starts matching the backfill ticket against other matchmaking tickets. Backfill tickets cannot match with
    other backfill tickets.
    https://docs.microsoft.com/rest/api/playfab/multiplayer/matchmaking/createserverbackfillticket
--]]
function PlayFabMultiplayerApi:CreateServerBackfillTicket(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Match/CreateServerBackfillTicket", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

--[[
    Create a matchmaking ticket as a server. The matchmaking service automatically starts matching the ticket against other
    matchmaking tickets.
    https://docs.microsoft.com/rest/api/playfab/multiplayer/matchmaking/createservermatchmakingticket
--]]
function PlayFabMultiplayerApi:CreateServerMatchmakingTicket(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Match/CreateServerMatchmakingTicket", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

--[[
    Deletes a multiplayer server game asset for a title.
    https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/deleteasset
--]]
function PlayFabMultiplayerApi:DeleteAsset(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/MultiplayerServer/DeleteAsset", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

--[[
    Deletes a multiplayer server build.
    https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/deletebuild
--]]
function PlayFabMultiplayerApi:DeleteBuild(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/MultiplayerServer/DeleteBuild", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

--[[
    Deletes a multiplayer server build alias.
    https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/deletebuildalias
--]]
function PlayFabMultiplayerApi:DeleteBuildAlias(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/MultiplayerServer/DeleteBuildAlias", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

--[[
    Removes a multiplayer server build's region.
    https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/deletebuildregion
--]]
function PlayFabMultiplayerApi:DeleteBuildRegion(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/MultiplayerServer/DeleteBuildRegion", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

--[[
    Deletes a multiplayer server game certificate.
    https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/deletecertificate
--]]
function PlayFabMultiplayerApi:DeleteCertificate(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/MultiplayerServer/DeleteCertificate", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

--[[
    Deletes a container image repository.
    https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/deletecontainerimagerepository
--]]
function PlayFabMultiplayerApi:DeleteContainerImageRepository(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/MultiplayerServer/DeleteContainerImageRepository", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

--[[
    Deletes a remote user to log on to a VM for a multiplayer server build.
    https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/deleteremoteuser
--]]
function PlayFabMultiplayerApi:DeleteRemoteUser(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/MultiplayerServer/DeleteRemoteUser", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

--[[
    Enables the multiplayer server feature for a title.
    https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/enablemultiplayerserversfortitle
--]]
function PlayFabMultiplayerApi:EnableMultiplayerServersForTitle(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/MultiplayerServer/EnableMultiplayerServersForTitle", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

--[[
    Gets the URL to upload assets to.
    https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/getassetuploadurl
--]]
function PlayFabMultiplayerApi:GetAssetUploadUrl(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/MultiplayerServer/GetAssetUploadUrl", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

--[[
    Gets a multiplayer server build.
    https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/getbuild
--]]
function PlayFabMultiplayerApi:GetBuild(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/MultiplayerServer/GetBuild", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

--[[
    Gets a multiplayer server build alias.
    https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/getbuildalias
--]]
function PlayFabMultiplayerApi:GetBuildAlias(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/MultiplayerServer/GetBuildAlias", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

--[[
    Gets the credentials to the container registry.
    https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/getcontainerregistrycredentials
--]]
function PlayFabMultiplayerApi:GetContainerRegistryCredentials(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/MultiplayerServer/GetContainerRegistryCredentials", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

--[[
    Get a match.
    https://docs.microsoft.com/rest/api/playfab/multiplayer/matchmaking/getmatch
--]]
function PlayFabMultiplayerApi:GetMatch(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Match/GetMatch", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

--[[
    SDK support is limited to C# and Java for this API. Get a matchmaking queue configuration.
    https://docs.microsoft.com/rest/api/playfab/multiplayer/matchmaking-admin/getmatchmakingqueue
--]]
function PlayFabMultiplayerApi:GetMatchmakingQueue(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Match/GetMatchmakingQueue", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

--[[
    Get a matchmaking ticket by ticket Id.
    https://docs.microsoft.com/rest/api/playfab/multiplayer/matchmaking/getmatchmakingticket
--]]
function PlayFabMultiplayerApi:GetMatchmakingTicket(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Match/GetMatchmakingTicket", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

--[[
    Gets multiplayer server session details for a build.
    https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/getmultiplayerserverdetails
--]]
function PlayFabMultiplayerApi:GetMultiplayerServerDetails(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/MultiplayerServer/GetMultiplayerServerDetails", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

--[[
    Gets multiplayer server logs after a server has terminated.
    https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/getmultiplayerserverlogs
--]]
function PlayFabMultiplayerApi:GetMultiplayerServerLogs(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/MultiplayerServer/GetMultiplayerServerLogs", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

--[[
    Gets multiplayer server logs after a server has terminated.
    https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/getmultiplayersessionlogsbysessionid
--]]
function PlayFabMultiplayerApi:GetMultiplayerSessionLogsBySessionId(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/MultiplayerServer/GetMultiplayerSessionLogsBySessionId", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

--[[
    Get the statistics for a queue.
    https://docs.microsoft.com/rest/api/playfab/multiplayer/matchmaking/getqueuestatistics
--]]
function PlayFabMultiplayerApi:GetQueueStatistics(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Match/GetQueueStatistics", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

--[[
    Gets a remote login endpoint to a VM that is hosting a multiplayer server build.
    https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/getremoteloginendpoint
--]]
function PlayFabMultiplayerApi:GetRemoteLoginEndpoint(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/MultiplayerServer/GetRemoteLoginEndpoint", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

--[[
    Get a matchmaking backfill ticket by ticket Id.
    https://docs.microsoft.com/rest/api/playfab/multiplayer/matchmaking/getserverbackfillticket
--]]
function PlayFabMultiplayerApi:GetServerBackfillTicket(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Match/GetServerBackfillTicket", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

--[[
    Gets the status of whether a title is enabled for the multiplayer server feature.
    https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/gettitleenabledformultiplayerserversstatus
--]]
function PlayFabMultiplayerApi:GetTitleEnabledForMultiplayerServersStatus(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/MultiplayerServer/GetTitleEnabledForMultiplayerServersStatus", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

--[[
    Gets the quotas for a title in relation to multiplayer servers.
    https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/gettitlemultiplayerserversquotas
--]]
function PlayFabMultiplayerApi:GetTitleMultiplayerServersQuotas(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/MultiplayerServer/GetTitleMultiplayerServersQuotas", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

--[[
    Join a matchmaking ticket.
    https://docs.microsoft.com/rest/api/playfab/multiplayer/matchmaking/joinmatchmakingticket
--]]
function PlayFabMultiplayerApi:JoinMatchmakingTicket(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Match/JoinMatchmakingTicket", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

--[[
    Lists archived multiplayer server sessions for a build.
    https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/listarchivedmultiplayerservers
--]]
function PlayFabMultiplayerApi:ListArchivedMultiplayerServers(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/MultiplayerServer/ListArchivedMultiplayerServers", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

--[[
    Lists multiplayer server game assets for a title.
    https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/listassetsummaries
--]]
function PlayFabMultiplayerApi:ListAssetSummaries(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/MultiplayerServer/ListAssetSummaries", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

--[[
    Lists details of all build aliases for a title. Accepts tokens for title and if game client access is enabled, allows
    game client to request list of builds with player entity token.
    https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/listbuildaliases
--]]
function PlayFabMultiplayerApi:ListBuildAliases(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/MultiplayerServer/ListBuildAliases", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

--[[
    Lists summarized details of all multiplayer server builds for a title. Accepts tokens for title and if game client
    access is enabled, allows game client to request list of builds with player entity token.
    https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/listbuildsummaries
--]]
function PlayFabMultiplayerApi:ListBuildSummaries(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/MultiplayerServer/ListBuildSummaries", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

--[[
    Lists multiplayer server game certificates for a title.
    https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/listcertificatesummaries
--]]
function PlayFabMultiplayerApi:ListCertificateSummaries(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/MultiplayerServer/ListCertificateSummaries", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

--[[
    Lists custom container images for a title.
    https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/listcontainerimages
--]]
function PlayFabMultiplayerApi:ListContainerImages(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/MultiplayerServer/ListContainerImages", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

--[[
    Lists the tags for a custom container image.
    https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/listcontainerimagetags
--]]
function PlayFabMultiplayerApi:ListContainerImageTags(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/MultiplayerServer/ListContainerImageTags", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

--[[
    SDK support is limited to C# and Java for this API. List all matchmaking queue configs.
    https://docs.microsoft.com/rest/api/playfab/multiplayer/matchmaking-admin/listmatchmakingqueues
--]]
function PlayFabMultiplayerApi:ListMatchmakingQueues(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Match/ListMatchmakingQueues", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

--[[
    List all matchmaking ticket Ids the user is a member of.
    https://docs.microsoft.com/rest/api/playfab/multiplayer/matchmaking/listmatchmakingticketsforplayer
--]]
function PlayFabMultiplayerApi:ListMatchmakingTicketsForPlayer(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Match/ListMatchmakingTicketsForPlayer", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

--[[
    Lists multiplayer server sessions for a build.
    https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/listmultiplayerservers
--]]
function PlayFabMultiplayerApi:ListMultiplayerServers(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/MultiplayerServer/ListMultiplayerServers", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

--[[
    Lists quality of service servers for party.
    https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/listpartyqosservers
--]]
function PlayFabMultiplayerApi:ListPartyQosServers(request)
    return Promise.new(function(resolve, reject)
            IPlayFabHttps.MakePlayFabApiCall("/MultiplayerServer/ListPartyQosServers", request or {}, nil, nil, resolve, reject)
    end)
end

--[[
    Lists quality of service servers for the title. By default, servers are only returned for regions where a Multiplayer
    Servers build has been deployed.
    https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/listqosserversfortitle
--]]
function PlayFabMultiplayerApi:ListQosServersForTitle(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/MultiplayerServer/ListQosServersForTitle", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

--[[
    List all server backfill ticket Ids the user is a member of.
    https://docs.microsoft.com/rest/api/playfab/multiplayer/matchmaking/listserverbackfillticketsforplayer
--]]
function PlayFabMultiplayerApi:ListServerBackfillTicketsForPlayer(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Match/ListServerBackfillTicketsForPlayer", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

--[[
    Lists virtual machines for a title.
    https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/listvirtualmachinesummaries
--]]
function PlayFabMultiplayerApi:ListVirtualMachineSummaries(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/MultiplayerServer/ListVirtualMachineSummaries", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

--[[
    SDK support is limited to C# and Java for this API. Remove a matchmaking queue config.
    https://docs.microsoft.com/rest/api/playfab/multiplayer/matchmaking-admin/removematchmakingqueue
--]]
function PlayFabMultiplayerApi:RemoveMatchmakingQueue(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Match/RemoveMatchmakingQueue", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

--[[
    Request a multiplayer server session. Accepts tokens for title and if game client access is enabled, allows game client
    to request a server with player entity token.
    https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/requestmultiplayerserver
--]]
function PlayFabMultiplayerApi:RequestMultiplayerServer(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/MultiplayerServer/RequestMultiplayerServer", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

--[[
    Rolls over the credentials to the container registry.
    https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/rollovercontainerregistrycredentials
--]]
function PlayFabMultiplayerApi:RolloverContainerRegistryCredentials(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/MultiplayerServer/RolloverContainerRegistryCredentials", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

--[[
    SDK support is limited to C# and Java for this API. Create or update a matchmaking queue configuration.
    https://docs.microsoft.com/rest/api/playfab/multiplayer/matchmaking-admin/setmatchmakingqueue
--]]
function PlayFabMultiplayerApi:SetMatchmakingQueue(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Match/SetMatchmakingQueue", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

--[[
    Shuts down a multiplayer server session.
    https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/shutdownmultiplayerserver
--]]
function PlayFabMultiplayerApi:ShutdownMultiplayerServer(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/MultiplayerServer/ShutdownMultiplayerServer", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

--[[
    Untags a container image.
    https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/untagcontainerimage
--]]
function PlayFabMultiplayerApi:UntagContainerImage(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/MultiplayerServer/UntagContainerImage", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

--[[
    Creates a multiplayer server build alias.
    https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/updatebuildalias
--]]
function PlayFabMultiplayerApi:UpdateBuildAlias(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/MultiplayerServer/UpdateBuildAlias", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

--[[
    Updates a multiplayer server build's region. If the region is not yet created, it will be created
    https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/updatebuildregion
--]]
function PlayFabMultiplayerApi:UpdateBuildRegion(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/MultiplayerServer/UpdateBuildRegion", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

--[[
    Updates a multiplayer server build's regions.
    https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/updatebuildregions
--]]
function PlayFabMultiplayerApi:UpdateBuildRegions(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/MultiplayerServer/UpdateBuildRegions", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

--[[
    Uploads a multiplayer server game certificate.
    https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/uploadcertificate
--]]
function PlayFabMultiplayerApi:UploadCertificate(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/MultiplayerServer/UploadCertificate", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

return PlayFabMultiplayerApi
