-- PlayFab Admin API
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

local PlayFabAdminApi = {
    settings = PlayFabSettings.settings
}

--[[
    Abort an ongoing task instance.
    https://docs.microsoft.com/rest/api/playfab/admin/scheduledtask/aborttaskinstance
--]]
function PlayFabAdminApi:AbortTaskInstance(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Admin/AbortTaskInstance", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Update news item to include localized version
    https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/addlocalizednews
--]]
function PlayFabAdminApi:AddLocalizedNews(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Admin/AddLocalizedNews", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Adds a new news item to the title's news feed
    https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/addnews
--]]
function PlayFabAdminApi:AddNews(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Admin/AddNews", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Adds a given tag to a player profile. The tag's namespace is automatically generated based on the source of the tag.
    https://docs.microsoft.com/rest/api/playfab/admin/playstream/addplayertag
--]]
function PlayFabAdminApi:AddPlayerTag(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Admin/AddPlayerTag", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Adds the game server executable specified (previously uploaded - see GetServerBuildUploadUrl) to the set of those a
    client is permitted to request in a call to StartGame
    https://docs.microsoft.com/rest/api/playfab/admin/custom-server-management/addserverbuild
--]]
function PlayFabAdminApi:AddServerBuild(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Admin/AddServerBuild", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Increments the specified virtual currency by the stated amount
    https://docs.microsoft.com/rest/api/playfab/admin/player-item-management/adduservirtualcurrency
--]]
function PlayFabAdminApi:AddUserVirtualCurrency(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Admin/AddUserVirtualCurrency", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Adds one or more virtual currencies to the set defined for the title. Virtual Currencies have a maximum value of
    2,147,483,647 when granted to a player. Any value over that will be discarded.
    https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/addvirtualcurrencytypes
--]]
function PlayFabAdminApi:AddVirtualCurrencyTypes(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Admin/AddVirtualCurrencyTypes", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Bans users by PlayFab ID with optional IP address, or MAC address for the provided game.
    https://docs.microsoft.com/rest/api/playfab/admin/account-management/banusers
--]]
function PlayFabAdminApi:BanUsers(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Admin/BanUsers", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Checks the global count for the limited edition item.
    https://docs.microsoft.com/rest/api/playfab/admin/player-item-management/checklimitededitionitemavailability
--]]
function PlayFabAdminApi:CheckLimitedEditionItemAvailability(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Admin/CheckLimitedEditionItemAvailability", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Create an ActionsOnPlayersInSegment task, which iterates through all players in a segment to execute action.
    https://docs.microsoft.com/rest/api/playfab/admin/scheduledtask/createactionsonplayersinsegmenttask
--]]
function PlayFabAdminApi:CreateActionsOnPlayersInSegmentTask(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Admin/CreateActionsOnPlayersInSegmentTask", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Create a CloudScript task, which can run a CloudScript on a schedule.
    https://docs.microsoft.com/rest/api/playfab/admin/scheduledtask/createcloudscripttask
--]]
function PlayFabAdminApi:CreateCloudScriptTask(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Admin/CreateCloudScriptTask", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Create a Insights Scheduled Scaling task, which can scale Insights Performance Units on a schedule
    https://docs.microsoft.com/rest/api/playfab/admin/scheduledtask/createinsightsscheduledscalingtask
--]]
function PlayFabAdminApi:CreateInsightsScheduledScalingTask(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Admin/CreateInsightsScheduledScalingTask", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Registers a relationship between a title and an Open ID Connect provider.
    https://docs.microsoft.com/rest/api/playfab/admin/authentication/createopenidconnection
--]]
function PlayFabAdminApi:CreateOpenIdConnection(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Admin/CreateOpenIdConnection", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Creates a new Player Shared Secret Key. It may take up to 5 minutes for this key to become generally available after
    this API returns.
    https://docs.microsoft.com/rest/api/playfab/admin/authentication/createplayersharedsecret
--]]
function PlayFabAdminApi:CreatePlayerSharedSecret(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Admin/CreatePlayerSharedSecret", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Adds a new player statistic configuration to the title, optionally allowing the developer to specify a reset interval
    and an aggregation method.
    https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/createplayerstatisticdefinition
--]]
function PlayFabAdminApi:CreatePlayerStatisticDefinition(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Admin/CreatePlayerStatisticDefinition", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Delete a content file from the title. When deleting a file that does not exist, it returns success.
    https://docs.microsoft.com/rest/api/playfab/admin/content/deletecontent
--]]
function PlayFabAdminApi:DeleteContent(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Admin/DeleteContent", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Removes a master player account entirely from all titles and deletes all associated data
    https://docs.microsoft.com/rest/api/playfab/admin/account-management/deletemasterplayeraccount
--]]
function PlayFabAdminApi:DeleteMasterPlayerAccount(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Admin/DeleteMasterPlayerAccount", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Removes a relationship between a title and an OpenID Connect provider.
    https://docs.microsoft.com/rest/api/playfab/admin/authentication/deleteopenidconnection
--]]
function PlayFabAdminApi:DeleteOpenIdConnection(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Admin/DeleteOpenIdConnection", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Removes a user's player account from a title and deletes all associated data
    https://docs.microsoft.com/rest/api/playfab/admin/account-management/deleteplayer
--]]
function PlayFabAdminApi:DeletePlayer(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Admin/DeletePlayer", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Deletes an existing Player Shared Secret Key. It may take up to 5 minutes for this delete to be reflected after this API
    returns.
    https://docs.microsoft.com/rest/api/playfab/admin/authentication/deleteplayersharedsecret
--]]
function PlayFabAdminApi:DeletePlayerSharedSecret(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Admin/DeletePlayerSharedSecret", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Deletes an existing virtual item store
    https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/deletestore
--]]
function PlayFabAdminApi:DeleteStore(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Admin/DeleteStore", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Delete a task.
    https://docs.microsoft.com/rest/api/playfab/admin/scheduledtask/deletetask
--]]
function PlayFabAdminApi:DeleteTask(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Admin/DeleteTask", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Permanently deletes a title and all associated configuration
    https://docs.microsoft.com/rest/api/playfab/admin/account-management/deletetitle
--]]
function PlayFabAdminApi:DeleteTitle(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Admin/DeleteTitle", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Deletes a specified set of title data overrides.
    https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/deletetitledataoverride
--]]
function PlayFabAdminApi:DeleteTitleDataOverride(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Admin/DeleteTitleDataOverride", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Exports all associated data of a master player account
    https://docs.microsoft.com/rest/api/playfab/admin/account-management/exportmasterplayerdata
--]]
function PlayFabAdminApi:ExportMasterPlayerData(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Admin/ExportMasterPlayerData", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Get information about a ActionsOnPlayersInSegment task instance.
    https://docs.microsoft.com/rest/api/playfab/admin/scheduledtask/getactionsonplayersinsegmenttaskinstance
--]]
function PlayFabAdminApi:GetActionsOnPlayersInSegmentTaskInstance(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Admin/GetActionsOnPlayersInSegmentTaskInstance", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Retrieves an array of player segment definitions. Results from this can be used in subsequent API calls such as
    GetPlayersInSegment which requires a Segment ID. While segment names can change the ID for that segment will not change.
    https://docs.microsoft.com/rest/api/playfab/admin/playstream/getallsegments
--]]
function PlayFabAdminApi:GetAllSegments(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Admin/GetAllSegments", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Retrieves the specified version of the title's catalog of virtual goods, including all defined properties
    https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/getcatalogitems
--]]
function PlayFabAdminApi:GetCatalogItems(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Admin/GetCatalogItems", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Gets the contents and information of a specific Cloud Script revision.
    https://docs.microsoft.com/rest/api/playfab/admin/server-side-cloud-script/getcloudscriptrevision
--]]
function PlayFabAdminApi:GetCloudScriptRevision(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Admin/GetCloudScriptRevision", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Get detail information about a CloudScript task instance.
    https://docs.microsoft.com/rest/api/playfab/admin/scheduledtask/getcloudscripttaskinstance
--]]
function PlayFabAdminApi:GetCloudScriptTaskInstance(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Admin/GetCloudScriptTaskInstance", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Lists all the current cloud script versions. For each version, information about the current published and latest
    revisions is also listed.
    https://docs.microsoft.com/rest/api/playfab/admin/server-side-cloud-script/getcloudscriptversions
--]]
function PlayFabAdminApi:GetCloudScriptVersions(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Admin/GetCloudScriptVersions", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    List all contents of the title and get statistics such as size
    https://docs.microsoft.com/rest/api/playfab/admin/content/getcontentlist
--]]
function PlayFabAdminApi:GetContentList(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Admin/GetContentList", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Retrieves the pre-signed URL for uploading a content file. A subsequent HTTP PUT to the returned URL uploads the
    content. Also, please be aware that the Content service is specifically PlayFab's CDN offering, for which standard CDN
    rates apply.
    https://docs.microsoft.com/rest/api/playfab/admin/content/getcontentuploadurl
--]]
function PlayFabAdminApi:GetContentUploadUrl(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Admin/GetContentUploadUrl", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Retrieves a download URL for the requested report
    https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/getdatareport
--]]
function PlayFabAdminApi:GetDataReport(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Admin/GetDataReport", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Retrieves the details for a specific completed session, including links to standard out and standard error logs
    https://docs.microsoft.com/rest/api/playfab/admin/matchmaking/getmatchmakergameinfo
--]]
function PlayFabAdminApi:GetMatchmakerGameInfo(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Admin/GetMatchmakerGameInfo", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Retrieves the details of defined game modes for the specified game server executable
    https://docs.microsoft.com/rest/api/playfab/admin/matchmaking/getmatchmakergamemodes
--]]
function PlayFabAdminApi:GetMatchmakerGameModes(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Admin/GetMatchmakerGameModes", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Get the list of titles that the player has played
    https://docs.microsoft.com/rest/api/playfab/admin/account-management/getplayedtitlelist
--]]
function PlayFabAdminApi:GetPlayedTitleList(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Admin/GetPlayedTitleList", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Gets a player's ID from an auth token.
    https://docs.microsoft.com/rest/api/playfab/admin/account-management/getplayeridfromauthtoken
--]]
function PlayFabAdminApi:GetPlayerIdFromAuthToken(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Admin/GetPlayerIdFromAuthToken", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Retrieves the player's profile
    https://docs.microsoft.com/rest/api/playfab/admin/account-management/getplayerprofile
--]]
function PlayFabAdminApi:GetPlayerProfile(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Admin/GetPlayerProfile", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    List all segments that a player currently belongs to at this moment in time.
    https://docs.microsoft.com/rest/api/playfab/admin/playstream/getplayersegments
--]]
function PlayFabAdminApi:GetPlayerSegments(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Admin/GetPlayerSegments", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Returns all Player Shared Secret Keys including disabled and expired.
    https://docs.microsoft.com/rest/api/playfab/admin/authentication/getplayersharedsecrets
--]]
function PlayFabAdminApi:GetPlayerSharedSecrets(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Admin/GetPlayerSharedSecrets", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Allows for paging through all players in a given segment. This API creates a snapshot of all player profiles that match
    the segment definition at the time of its creation and lives through the Total Seconds to Live, refreshing its life span
    on each subsequent use of the Continuation Token. Profiles that change during the course of paging will not be reflected
    in the results. AB Test segments are currently not supported by this operation. NOTE: This API is limited to being
    called 30 times in one minute. You will be returned an error if you exceed this threshold.
    https://docs.microsoft.com/rest/api/playfab/admin/playstream/getplayersinsegment
--]]
function PlayFabAdminApi:GetPlayersInSegment(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Admin/GetPlayersInSegment", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Retrieves the configuration information for all player statistics defined in the title, regardless of whether they have
    a reset interval.
    https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/getplayerstatisticdefinitions
--]]
function PlayFabAdminApi:GetPlayerStatisticDefinitions(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Admin/GetPlayerStatisticDefinitions", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Retrieves the information on the available versions of the specified statistic.
    https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/getplayerstatisticversions
--]]
function PlayFabAdminApi:GetPlayerStatisticVersions(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Admin/GetPlayerStatisticVersions", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Get all tags with a given Namespace (optional) from a player profile.
    https://docs.microsoft.com/rest/api/playfab/admin/playstream/getplayertags
--]]
function PlayFabAdminApi:GetPlayerTags(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Admin/GetPlayerTags", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Gets the requested policy.
    https://docs.microsoft.com/rest/api/playfab/admin/authentication/getpolicy
--]]
function PlayFabAdminApi:GetPolicy(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Admin/GetPolicy", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Retrieves the key-value store of custom publisher settings
    https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/getpublisherdata
--]]
function PlayFabAdminApi:GetPublisherData(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Admin/GetPublisherData", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Retrieves the random drop table configuration for the title
    https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/getrandomresulttables
--]]
function PlayFabAdminApi:GetRandomResultTables(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Admin/GetRandomResultTables", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Retrieves the build details for the specified game server executable
    https://docs.microsoft.com/rest/api/playfab/admin/custom-server-management/getserverbuildinfo
--]]
function PlayFabAdminApi:GetServerBuildInfo(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Admin/GetServerBuildInfo", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Retrieves the pre-authorized URL for uploading a game server package containing a build (does not enable the build for
    use - see AddServerBuild)
    https://docs.microsoft.com/rest/api/playfab/admin/custom-server-management/getserverbuilduploadurl
--]]
function PlayFabAdminApi:GetServerBuildUploadUrl(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Admin/GetServerBuildUploadUrl", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Retrieves the set of items defined for the specified store, including all prices defined
    https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/getstoreitems
--]]
function PlayFabAdminApi:GetStoreItems(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Admin/GetStoreItems", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Query for task instances by task, status, or time range.
    https://docs.microsoft.com/rest/api/playfab/admin/scheduledtask/gettaskinstances
--]]
function PlayFabAdminApi:GetTaskInstances(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Admin/GetTaskInstances", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Get definition information on a specified task or all tasks within a title.
    https://docs.microsoft.com/rest/api/playfab/admin/scheduledtask/gettasks
--]]
function PlayFabAdminApi:GetTasks(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Admin/GetTasks", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Retrieves the key-value store of custom title settings which can be read by the client
    https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/gettitledata
--]]
function PlayFabAdminApi:GetTitleData(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Admin/GetTitleData", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Retrieves the key-value store of custom title settings which cannot be read by the client
    https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/gettitleinternaldata
--]]
function PlayFabAdminApi:GetTitleInternalData(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Admin/GetTitleInternalData", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Retrieves the relevant details for a specified user, based upon a match against a supplied unique identifier
    https://docs.microsoft.com/rest/api/playfab/admin/account-management/getuseraccountinfo
--]]
function PlayFabAdminApi:GetUserAccountInfo(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Admin/GetUserAccountInfo", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Gets all bans for a user.
    https://docs.microsoft.com/rest/api/playfab/admin/account-management/getuserbans
--]]
function PlayFabAdminApi:GetUserBans(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Admin/GetUserBans", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Retrieves the title-specific custom data for the user which is readable and writable by the client
    https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/getuserdata
--]]
function PlayFabAdminApi:GetUserData(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Admin/GetUserData", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Retrieves the title-specific custom data for the user which cannot be accessed by the client
    https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/getuserinternaldata
--]]
function PlayFabAdminApi:GetUserInternalData(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Admin/GetUserInternalData", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Retrieves the specified user's current inventory of virtual goods
    https://docs.microsoft.com/rest/api/playfab/admin/player-item-management/getuserinventory
--]]
function PlayFabAdminApi:GetUserInventory(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Admin/GetUserInventory", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Retrieves the publisher-specific custom data for the user which is readable and writable by the client
    https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/getuserpublisherdata
--]]
function PlayFabAdminApi:GetUserPublisherData(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Admin/GetUserPublisherData", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Retrieves the publisher-specific custom data for the user which cannot be accessed by the client
    https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/getuserpublisherinternaldata
--]]
function PlayFabAdminApi:GetUserPublisherInternalData(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Admin/GetUserPublisherInternalData", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Retrieves the publisher-specific custom data for the user which can only be read by the client
    https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/getuserpublisherreadonlydata
--]]
function PlayFabAdminApi:GetUserPublisherReadOnlyData(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Admin/GetUserPublisherReadOnlyData", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Retrieves the title-specific custom data for the user which can only be read by the client
    https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/getuserreadonlydata
--]]
function PlayFabAdminApi:GetUserReadOnlyData(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Admin/GetUserReadOnlyData", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Adds the specified items to the specified user inventories
    https://docs.microsoft.com/rest/api/playfab/admin/player-item-management/grantitemstousers
--]]
function PlayFabAdminApi:GrantItemsToUsers(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Admin/GrantItemsToUsers", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Increases the global count for the given scarce resource.
    https://docs.microsoft.com/rest/api/playfab/admin/player-item-management/incrementlimitededitionitemavailability
--]]
function PlayFabAdminApi:IncrementLimitedEditionItemAvailability(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Admin/IncrementLimitedEditionItemAvailability", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Resets the indicated statistic, removing all player entries for it and backing up the old values.
    https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/incrementplayerstatisticversion
--]]
function PlayFabAdminApi:IncrementPlayerStatisticVersion(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Admin/IncrementPlayerStatisticVersion", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Retrieves a list of all Open ID Connect providers registered to a title.
    https://docs.microsoft.com/rest/api/playfab/admin/authentication/listopenidconnection
--]]
function PlayFabAdminApi:ListOpenIdConnection(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Admin/ListOpenIdConnection", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Retrieves the build details for all game server executables which are currently defined for the title
    https://docs.microsoft.com/rest/api/playfab/admin/custom-server-management/listserverbuilds
--]]
function PlayFabAdminApi:ListServerBuilds(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Admin/ListServerBuilds", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Retuns the list of all defined virtual currencies for the title
    https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/listvirtualcurrencytypes
--]]
function PlayFabAdminApi:ListVirtualCurrencyTypes(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Admin/ListVirtualCurrencyTypes", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Updates the game server mode details for the specified game server executable
    https://docs.microsoft.com/rest/api/playfab/admin/matchmaking/modifymatchmakergamemodes
--]]
function PlayFabAdminApi:ModifyMatchmakerGameModes(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Admin/ModifyMatchmakerGameModes", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Updates the build details for the specified game server executable
    https://docs.microsoft.com/rest/api/playfab/admin/custom-server-management/modifyserverbuild
--]]
function PlayFabAdminApi:ModifyServerBuild(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Admin/ModifyServerBuild", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Attempts to process an order refund through the original real money payment provider.
    https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/refundpurchase
--]]
function PlayFabAdminApi:RefundPurchase(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Admin/RefundPurchase", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Remove a given tag from a player profile. The tag's namespace is automatically generated based on the source of the tag.
    https://docs.microsoft.com/rest/api/playfab/admin/playstream/removeplayertag
--]]
function PlayFabAdminApi:RemovePlayerTag(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Admin/RemovePlayerTag", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Removes the game server executable specified from the set of those a client is permitted to request in a call to
    StartGame
    https://docs.microsoft.com/rest/api/playfab/admin/custom-server-management/removeserverbuild
--]]
function PlayFabAdminApi:RemoveServerBuild(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Admin/RemoveServerBuild", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Removes one or more virtual currencies from the set defined for the title.
    https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/removevirtualcurrencytypes
--]]
function PlayFabAdminApi:RemoveVirtualCurrencyTypes(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Admin/RemoveVirtualCurrencyTypes", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Completely removes all statistics for the specified character, for the current game
    https://docs.microsoft.com/rest/api/playfab/admin/characters/resetcharacterstatistics
--]]
function PlayFabAdminApi:ResetCharacterStatistics(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Admin/ResetCharacterStatistics", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Reset a player's password for a given title.
    https://docs.microsoft.com/rest/api/playfab/admin/account-management/resetpassword
--]]
function PlayFabAdminApi:ResetPassword(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Admin/ResetPassword", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Completely removes all statistics for the specified user, for the current game
    https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/resetuserstatistics
--]]
function PlayFabAdminApi:ResetUserStatistics(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Admin/ResetUserStatistics", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Attempts to resolve a dispute with the original order's payment provider.
    https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/resolvepurchasedispute
--]]
function PlayFabAdminApi:ResolvePurchaseDispute(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Admin/ResolvePurchaseDispute", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Revoke all active bans for a user.
    https://docs.microsoft.com/rest/api/playfab/admin/account-management/revokeallbansforuser
--]]
function PlayFabAdminApi:RevokeAllBansForUser(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Admin/RevokeAllBansForUser", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Revoke all active bans specified with BanId.
    https://docs.microsoft.com/rest/api/playfab/admin/account-management/revokebans
--]]
function PlayFabAdminApi:RevokeBans(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Admin/RevokeBans", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Revokes access to an item in a user's inventory
    https://docs.microsoft.com/rest/api/playfab/admin/player-item-management/revokeinventoryitem
--]]
function PlayFabAdminApi:RevokeInventoryItem(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Admin/RevokeInventoryItem", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Revokes access for up to 25 items across multiple users and characters.
    https://docs.microsoft.com/rest/api/playfab/admin/player-item-management/revokeinventoryitems
--]]
function PlayFabAdminApi:RevokeInventoryItems(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Admin/RevokeInventoryItems", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Run a task immediately regardless of its schedule.
    https://docs.microsoft.com/rest/api/playfab/admin/scheduledtask/runtask
--]]
function PlayFabAdminApi:RunTask(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Admin/RunTask", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Forces an email to be sent to the registered email address for the user's account, with a link allowing the user to
    change the password.If an account recovery email template ID is provided, an email using the custom email template will
    be used.
    https://docs.microsoft.com/rest/api/playfab/admin/account-management/sendaccountrecoveryemail
--]]
function PlayFabAdminApi:SendAccountRecoveryEmail(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Admin/SendAccountRecoveryEmail", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Creates the catalog configuration of all virtual goods for the specified catalog version
    https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/setcatalogitems
--]]
function PlayFabAdminApi:SetCatalogItems(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Admin/SetCatalogItems", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Sets or resets the player's secret. Player secrets are used to sign API requests.
    https://docs.microsoft.com/rest/api/playfab/admin/authentication/setplayersecret
--]]
function PlayFabAdminApi:SetPlayerSecret(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Admin/SetPlayerSecret", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Sets the currently published revision of a title Cloud Script
    https://docs.microsoft.com/rest/api/playfab/admin/server-side-cloud-script/setpublishedrevision
--]]
function PlayFabAdminApi:SetPublishedRevision(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Admin/SetPublishedRevision", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Updates the key-value store of custom publisher settings
    https://docs.microsoft.com/rest/api/playfab/admin/shared-group-data/setpublisherdata
--]]
function PlayFabAdminApi:SetPublisherData(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Admin/SetPublisherData", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Sets all the items in one virtual store
    https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/setstoreitems
--]]
function PlayFabAdminApi:SetStoreItems(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Admin/SetStoreItems", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Creates and updates the key-value store of custom title settings which can be read by the client
    https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/settitledata
--]]
function PlayFabAdminApi:SetTitleData(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Admin/SetTitleData", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Set and delete key-value pairs in a title data override instance.
    https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/settitledataandoverrides
--]]
function PlayFabAdminApi:SetTitleDataAndOverrides(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Admin/SetTitleDataAndOverrides", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Updates the key-value store of custom title settings which cannot be read by the client
    https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/settitleinternaldata
--]]
function PlayFabAdminApi:SetTitleInternalData(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Admin/SetTitleInternalData", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Sets the Amazon Resource Name (ARN) for iOS and Android push notifications. Documentation on the exact restrictions can
    be found at: http://docs.aws.amazon.com/sns/latest/api/API_CreatePlatformApplication.html. Currently, Amazon device
    Messaging is not supported.
    https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/setuppushnotification
--]]
function PlayFabAdminApi:SetupPushNotification(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Admin/SetupPushNotification", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Decrements the specified virtual currency by the stated amount
    https://docs.microsoft.com/rest/api/playfab/admin/player-item-management/subtractuservirtualcurrency
--]]
function PlayFabAdminApi:SubtractUserVirtualCurrency(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Admin/SubtractUserVirtualCurrency", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Updates information of a list of existing bans specified with Ban Ids.
    https://docs.microsoft.com/rest/api/playfab/admin/account-management/updatebans
--]]
function PlayFabAdminApi:UpdateBans(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Admin/UpdateBans", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Updates the catalog configuration for virtual goods in the specified catalog version
    https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/updatecatalogitems
--]]
function PlayFabAdminApi:UpdateCatalogItems(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Admin/UpdateCatalogItems", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Creates a new Cloud Script revision and uploads source code to it. Note that at this time, only one file should be
    submitted in the revision.
    https://docs.microsoft.com/rest/api/playfab/admin/server-side-cloud-script/updatecloudscript
--]]
function PlayFabAdminApi:UpdateCloudScript(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Admin/UpdateCloudScript", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Modifies data and credentials for an existing relationship between a title and an Open ID Connect provider
    https://docs.microsoft.com/rest/api/playfab/admin/authentication/updateopenidconnection
--]]
function PlayFabAdminApi:UpdateOpenIdConnection(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Admin/UpdateOpenIdConnection", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Updates a existing Player Shared Secret Key. It may take up to 5 minutes for this update to become generally available
    after this API returns.
    https://docs.microsoft.com/rest/api/playfab/admin/authentication/updateplayersharedsecret
--]]
function PlayFabAdminApi:UpdatePlayerSharedSecret(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Admin/UpdatePlayerSharedSecret", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Updates a player statistic configuration for the title, optionally allowing the developer to specify a reset interval.
    https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/updateplayerstatisticdefinition
--]]
function PlayFabAdminApi:UpdatePlayerStatisticDefinition(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Admin/UpdatePlayerStatisticDefinition", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Changes a policy for a title
    https://docs.microsoft.com/rest/api/playfab/admin/authentication/updatepolicy
--]]
function PlayFabAdminApi:UpdatePolicy(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Admin/UpdatePolicy", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Updates the random drop table configuration for the title
    https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/updaterandomresulttables
--]]
function PlayFabAdminApi:UpdateRandomResultTables(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Admin/UpdateRandomResultTables", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Updates an existing virtual item store with new or modified items
    https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/updatestoreitems
--]]
function PlayFabAdminApi:UpdateStoreItems(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Admin/UpdateStoreItems", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Update an existing task.
    https://docs.microsoft.com/rest/api/playfab/admin/scheduledtask/updatetask
--]]
function PlayFabAdminApi:UpdateTask(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Admin/UpdateTask", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Updates the title-specific custom data for the user which is readable and writable by the client
    https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/updateuserdata
--]]
function PlayFabAdminApi:UpdateUserData(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Admin/UpdateUserData", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Updates the title-specific custom data for the user which cannot be accessed by the client
    https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/updateuserinternaldata
--]]
function PlayFabAdminApi:UpdateUserInternalData(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Admin/UpdateUserInternalData", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Updates the publisher-specific custom data for the user which is readable and writable by the client
    https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/updateuserpublisherdata
--]]
function PlayFabAdminApi:UpdateUserPublisherData(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Admin/UpdateUserPublisherData", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Updates the publisher-specific custom data for the user which cannot be accessed by the client
    https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/updateuserpublisherinternaldata
--]]
function PlayFabAdminApi:UpdateUserPublisherInternalData(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Admin/UpdateUserPublisherInternalData", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Updates the publisher-specific custom data for the user which can only be read by the client
    https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/updateuserpublisherreadonlydata
--]]
function PlayFabAdminApi:UpdateUserPublisherReadOnlyData(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Admin/UpdateUserPublisherReadOnlyData", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Updates the title-specific custom data for the user which can only be read by the client
    https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/updateuserreadonlydata
--]]
function PlayFabAdminApi:UpdateUserReadOnlyData(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Admin/UpdateUserReadOnlyData", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Updates the title specific display name for a user
    https://docs.microsoft.com/rest/api/playfab/admin/account-management/updateusertitledisplayname
--]]
function PlayFabAdminApi:UpdateUserTitleDisplayName(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Admin/UpdateUserTitleDisplayName", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

return PlayFabAdminApi
