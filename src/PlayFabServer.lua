-- PlayFab Server API
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

local PlayFabServerApi = {
    settings = PlayFabSettings.settings
}

--[[
    Increments the character's balance of the specified virtual currency by the stated amount
    https://docs.microsoft.com/rest/api/playfab/server/player-item-management/addcharactervirtualcurrency
--]]
function PlayFabServerApi:AddCharacterVirtualCurrency(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/AddCharacterVirtualCurrency", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Adds the Friend user to the friendlist of the user with PlayFabId. At least one of
    FriendPlayFabId,FriendUsername,FriendEmail, or FriendTitleDisplayName should be initialized.
    https://docs.microsoft.com/rest/api/playfab/server/friend-list-management/addfriend
--]]
function PlayFabServerApi:AddFriend(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/AddFriend", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Adds the specified generic service identifier to the player's PlayFab account. This is designed to allow for a PlayFab
    ID lookup of any arbitrary service identifier a title wants to add. This identifier should never be used as
    authentication credentials, as the intent is that it is easily accessible by other players.
    https://docs.microsoft.com/rest/api/playfab/server/account-management/addgenericid
--]]
function PlayFabServerApi:AddGenericID(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/AddGenericID", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Adds a given tag to a player profile. The tag's namespace is automatically generated based on the source of the tag.
    https://docs.microsoft.com/rest/api/playfab/server/playstream/addplayertag
--]]
function PlayFabServerApi:AddPlayerTag(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/AddPlayerTag", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Adds users to the set of those able to update both the shared data, as well as the set of users in the group. Only users
    in the group (and the server) can add new members. Shared Groups are designed for sharing data between a very small
    number of players, please see our guide:
    https://docs.microsoft.com/gaming/playfab/features/social/groups/using-shared-group-data
    https://docs.microsoft.com/rest/api/playfab/server/shared-group-data/addsharedgroupmembers
--]]
function PlayFabServerApi:AddSharedGroupMembers(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/AddSharedGroupMembers", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Increments the user's balance of the specified virtual currency by the stated amount
    https://docs.microsoft.com/rest/api/playfab/server/player-item-management/adduservirtualcurrency
--]]
function PlayFabServerApi:AddUserVirtualCurrency(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/AddUserVirtualCurrency", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Validated a client's session ticket, and if successful, returns details for that user
    https://docs.microsoft.com/rest/api/playfab/server/authentication/authenticatesessionticket
--]]
function PlayFabServerApi:AuthenticateSessionTicket(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/AuthenticateSessionTicket", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Awards the specified users the specified Steam achievements
    https://docs.microsoft.com/rest/api/playfab/server/platform-specific-methods/awardsteamachievement
--]]
function PlayFabServerApi:AwardSteamAchievement(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/AwardSteamAchievement", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Bans users by PlayFab ID with optional IP address, or MAC address for the provided game.
    https://docs.microsoft.com/rest/api/playfab/server/account-management/banusers
--]]
function PlayFabServerApi:BanUsers(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/BanUsers", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Consume uses of a consumable item. When all uses are consumed, it will be removed from the player's inventory.
    https://docs.microsoft.com/rest/api/playfab/server/player-item-management/consumeitem
--]]
function PlayFabServerApi:ConsumeItem(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/ConsumeItem", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Requests the creation of a shared group object, containing key/value pairs which may be updated by all members of the
    group. When created by a server, the group will initially have no members. Shared Groups are designed for sharing data
    between a very small number of players, please see our guide:
    https://docs.microsoft.com/gaming/playfab/features/social/groups/using-shared-group-data
    https://docs.microsoft.com/rest/api/playfab/server/shared-group-data/createsharedgroup
--]]
function PlayFabServerApi:CreateSharedGroup(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/CreateSharedGroup", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Deletes the specific character ID from the specified user.
    https://docs.microsoft.com/rest/api/playfab/server/characters/deletecharacterfromuser
--]]
function PlayFabServerApi:DeleteCharacterFromUser(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/DeleteCharacterFromUser", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Removes a user's player account from a title and deletes all associated data
    https://docs.microsoft.com/rest/api/playfab/server/account-management/deleteplayer
--]]
function PlayFabServerApi:DeletePlayer(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/DeletePlayer", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Deletes push notification template for title
    https://docs.microsoft.com/rest/api/playfab/server/account-management/deletepushnotificationtemplate
--]]
function PlayFabServerApi:DeletePushNotificationTemplate(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/DeletePushNotificationTemplate", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Deletes a shared group, freeing up the shared group ID to be reused for a new group. Shared Groups are designed for
    sharing data between a very small number of players, please see our guide:
    https://docs.microsoft.com/gaming/playfab/features/social/groups/using-shared-group-data
    https://docs.microsoft.com/rest/api/playfab/server/shared-group-data/deletesharedgroup
--]]
function PlayFabServerApi:DeleteSharedGroup(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/DeleteSharedGroup", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Inform the matchmaker that a Game Server Instance is removed.
    https://docs.microsoft.com/rest/api/playfab/server/matchmaking/deregistergame
--]]
function PlayFabServerApi:DeregisterGame(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/DeregisterGame", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Returns the result of an evaluation of a Random Result Table - the ItemId from the game Catalog which would have been
    added to the player inventory, if the Random Result Table were added via a Bundle or a call to UnlockContainer.
    https://docs.microsoft.com/rest/api/playfab/server/player-item-management/evaluaterandomresulttable
--]]
function PlayFabServerApi:EvaluateRandomResultTable(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/EvaluateRandomResultTable", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Executes a CloudScript function, with the 'currentPlayerId' variable set to the specified PlayFabId parameter value.
    https://docs.microsoft.com/rest/api/playfab/server/server-side-cloud-script/executecloudscript
--]]
function PlayFabServerApi:ExecuteCloudScript(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/ExecuteCloudScript", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Retrieves an array of player segment definitions. Results from this can be used in subsequent API calls such as
    GetPlayersInSegment which requires a Segment ID. While segment names can change the ID for that segment will not change.
    https://docs.microsoft.com/rest/api/playfab/server/playstream/getallsegments
--]]
function PlayFabServerApi:GetAllSegments(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/GetAllSegments", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Lists all of the characters that belong to a specific user. CharacterIds are not globally unique; characterId must be
    evaluated with the parent PlayFabId to guarantee uniqueness.
    https://docs.microsoft.com/rest/api/playfab/server/characters/getalluserscharacters
--]]
function PlayFabServerApi:GetAllUsersCharacters(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/GetAllUsersCharacters", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Retrieves the specified version of the title's catalog of virtual goods, including all defined properties
    https://docs.microsoft.com/rest/api/playfab/server/title-wide-data-management/getcatalogitems
--]]
function PlayFabServerApi:GetCatalogItems(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/GetCatalogItems", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Retrieves the title-specific custom data for the user which is readable and writable by the client
    https://docs.microsoft.com/rest/api/playfab/server/character-data/getcharacterdata
--]]
function PlayFabServerApi:GetCharacterData(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/GetCharacterData", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Retrieves the title-specific custom data for the user's character which cannot be accessed by the client
    https://docs.microsoft.com/rest/api/playfab/server/character-data/getcharacterinternaldata
--]]
function PlayFabServerApi:GetCharacterInternalData(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/GetCharacterInternalData", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Retrieves the specified character's current inventory of virtual goods
    https://docs.microsoft.com/rest/api/playfab/server/player-item-management/getcharacterinventory
--]]
function PlayFabServerApi:GetCharacterInventory(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/GetCharacterInventory", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Retrieves a list of ranked characters for the given statistic, starting from the indicated point in the leaderboard
    https://docs.microsoft.com/rest/api/playfab/server/characters/getcharacterleaderboard
--]]
function PlayFabServerApi:GetCharacterLeaderboard(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/GetCharacterLeaderboard", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Retrieves the title-specific custom data for the user's character which can only be read by the client
    https://docs.microsoft.com/rest/api/playfab/server/character-data/getcharacterreadonlydata
--]]
function PlayFabServerApi:GetCharacterReadOnlyData(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/GetCharacterReadOnlyData", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Retrieves the details of all title-specific statistics for the specific character
    https://docs.microsoft.com/rest/api/playfab/server/characters/getcharacterstatistics
--]]
function PlayFabServerApi:GetCharacterStatistics(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/GetCharacterStatistics", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    This API retrieves a pre-signed URL for accessing a content file for the title. A subsequent HTTP GET to the returned
    URL will attempt to download the content. A HEAD query to the returned URL will attempt to retrieve the metadata of the
    content. Note that a successful result does not guarantee the existence of this content - if it has not been uploaded,
    the query to retrieve the data will fail. See this post for more information:
    https://community.playfab.com/hc/community/posts/205469488-How-to-upload-files-to-PlayFab-s-Content-Service. Also,
    please be aware that the Content service is specifically PlayFab's CDN offering, for which standard CDN rates apply.
    https://docs.microsoft.com/rest/api/playfab/server/content/getcontentdownloadurl
--]]
function PlayFabServerApi:GetContentDownloadUrl(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/GetContentDownloadUrl", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Retrieves a list of ranked friends of the given player for the given statistic, starting from the indicated point in the
    leaderboard
    https://docs.microsoft.com/rest/api/playfab/server/player-data-management/getfriendleaderboard
--]]
function PlayFabServerApi:GetFriendLeaderboard(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/GetFriendLeaderboard", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Retrieves the current friends for the user with PlayFabId, constrained to users who have PlayFab accounts. Friends from
    linked accounts (Facebook, Steam) are also included. You may optionally exclude some linked services' friends.
    https://docs.microsoft.com/rest/api/playfab/server/friend-list-management/getfriendslist
--]]
function PlayFabServerApi:GetFriendsList(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/GetFriendsList", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Retrieves a list of ranked users for the given statistic, starting from the indicated point in the leaderboard
    https://docs.microsoft.com/rest/api/playfab/server/player-data-management/getleaderboard
--]]
function PlayFabServerApi:GetLeaderboard(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/GetLeaderboard", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Retrieves a list of ranked characters for the given statistic, centered on the requested user
    https://docs.microsoft.com/rest/api/playfab/server/characters/getleaderboardaroundcharacter
--]]
function PlayFabServerApi:GetLeaderboardAroundCharacter(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/GetLeaderboardAroundCharacter", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Retrieves a list of ranked users for the given statistic, centered on the currently signed-in user
    https://docs.microsoft.com/rest/api/playfab/server/player-data-management/getleaderboardarounduser
--]]
function PlayFabServerApi:GetLeaderboardAroundUser(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/GetLeaderboardAroundUser", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Retrieves a list of all of the user's characters for the given statistic.
    https://docs.microsoft.com/rest/api/playfab/server/characters/getleaderboardforusercharacters
--]]
function PlayFabServerApi:GetLeaderboardForUserCharacters(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/GetLeaderboardForUserCharacters", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Returns whatever info is requested in the response for the user. Note that PII (like email address, facebook id) may be
    returned. All parameters default to false.
    https://docs.microsoft.com/rest/api/playfab/server/player-data-management/getplayercombinedinfo
--]]
function PlayFabServerApi:GetPlayerCombinedInfo(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/GetPlayerCombinedInfo", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Retrieves the player's profile
    https://docs.microsoft.com/rest/api/playfab/server/account-management/getplayerprofile
--]]
function PlayFabServerApi:GetPlayerProfile(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/GetPlayerProfile", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    List all segments that a player currently belongs to at this moment in time.
    https://docs.microsoft.com/rest/api/playfab/server/playstream/getplayersegments
--]]
function PlayFabServerApi:GetPlayerSegments(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/GetPlayerSegments", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Allows for paging through all players in a given segment. This API creates a snapshot of all player profiles that match
    the segment definition at the time of its creation and lives through the Total Seconds to Live, refreshing its life span
    on each subsequent use of the Continuation Token. Profiles that change during the course of paging will not be reflected
    in the results. AB Test segments are currently not supported by this operation. NOTE: This API is limited to being
    called 30 times in one minute. You will be returned an error if you exceed this threshold.
    https://docs.microsoft.com/rest/api/playfab/server/playstream/getplayersinsegment
--]]
function PlayFabServerApi:GetPlayersInSegment(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/GetPlayersInSegment", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Retrieves the current version and values for the indicated statistics, for the local player.
    https://docs.microsoft.com/rest/api/playfab/server/player-data-management/getplayerstatistics
--]]
function PlayFabServerApi:GetPlayerStatistics(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/GetPlayerStatistics", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Retrieves the information on the available versions of the specified statistic.
    https://docs.microsoft.com/rest/api/playfab/server/player-data-management/getplayerstatisticversions
--]]
function PlayFabServerApi:GetPlayerStatisticVersions(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/GetPlayerStatisticVersions", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Get all tags with a given Namespace (optional) from a player profile.
    https://docs.microsoft.com/rest/api/playfab/server/playstream/getplayertags
--]]
function PlayFabServerApi:GetPlayerTags(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/GetPlayerTags", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Retrieves the unique PlayFab identifiers for the given set of Facebook identifiers.
    https://docs.microsoft.com/rest/api/playfab/server/account-management/getplayfabidsfromfacebookids
--]]
function PlayFabServerApi:GetPlayFabIDsFromFacebookIDs(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/GetPlayFabIDsFromFacebookIDs", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Retrieves the unique PlayFab identifiers for the given set of Facebook Instant Games identifiers.
    https://docs.microsoft.com/rest/api/playfab/server/account-management/getplayfabidsfromfacebookinstantgamesids
--]]
function PlayFabServerApi:GetPlayFabIDsFromFacebookInstantGamesIds(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/GetPlayFabIDsFromFacebookInstantGamesIds", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Retrieves the unique PlayFab identifiers for the given set of generic service identifiers. A generic identifier is the
    service name plus the service-specific ID for the player, as specified by the title when the generic identifier was
    added to the player account.
    https://docs.microsoft.com/rest/api/playfab/server/account-management/getplayfabidsfromgenericids
--]]
function PlayFabServerApi:GetPlayFabIDsFromGenericIDs(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/GetPlayFabIDsFromGenericIDs", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Retrieves the unique PlayFab identifiers for the given set of Nintendo Switch Device identifiers.
    https://docs.microsoft.com/rest/api/playfab/server/account-management/getplayfabidsfromnintendoswitchdeviceids
--]]
function PlayFabServerApi:GetPlayFabIDsFromNintendoSwitchDeviceIds(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/GetPlayFabIDsFromNintendoSwitchDeviceIds", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Retrieves the unique PlayFab identifiers for the given set of PlayStation Network identifiers.
    https://docs.microsoft.com/rest/api/playfab/server/account-management/getplayfabidsfrompsnaccountids
--]]
function PlayFabServerApi:GetPlayFabIDsFromPSNAccountIDs(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/GetPlayFabIDsFromPSNAccountIDs", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Retrieves the unique PlayFab identifiers for the given set of Steam identifiers. The Steam identifiers are the profile
    IDs for the user accounts, available as SteamId in the Steamworks Community API calls.
    https://docs.microsoft.com/rest/api/playfab/server/account-management/getplayfabidsfromsteamids
--]]
function PlayFabServerApi:GetPlayFabIDsFromSteamIDs(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/GetPlayFabIDsFromSteamIDs", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Retrieves the unique PlayFab identifiers for the given set of XboxLive identifiers.
    https://docs.microsoft.com/rest/api/playfab/server/account-management/getplayfabidsfromxboxliveids
--]]
function PlayFabServerApi:GetPlayFabIDsFromXboxLiveIDs(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/GetPlayFabIDsFromXboxLiveIDs", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Retrieves the key-value store of custom publisher settings
    https://docs.microsoft.com/rest/api/playfab/server/title-wide-data-management/getpublisherdata
--]]
function PlayFabServerApi:GetPublisherData(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/GetPublisherData", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Retrieves the configuration information for the specified random results tables for the title, including all ItemId
    values and weights
    https://docs.microsoft.com/rest/api/playfab/server/player-item-management/getrandomresulttables
--]]
function PlayFabServerApi:GetRandomResultTables(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/GetRandomResultTables", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Retrieves the associated PlayFab account identifiers for the given set of server custom identifiers.
    https://docs.microsoft.com/rest/api/playfab/server/account-management/getservercustomidsfromplayfabids
--]]
function PlayFabServerApi:GetServerCustomIDsFromPlayFabIDs(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/GetServerCustomIDsFromPlayFabIDs", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Retrieves data stored in a shared group object, as well as the list of members in the group. The server can access all
    public and private group data. Shared Groups are designed for sharing data between a very small number of players,
    please see our guide: https://docs.microsoft.com/gaming/playfab/features/social/groups/using-shared-group-data
    https://docs.microsoft.com/rest/api/playfab/server/shared-group-data/getsharedgroupdata
--]]
function PlayFabServerApi:GetSharedGroupData(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/GetSharedGroupData", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Retrieves the set of items defined for the specified store, including all prices defined, for the specified player
    https://docs.microsoft.com/rest/api/playfab/server/title-wide-data-management/getstoreitems
--]]
function PlayFabServerApi:GetStoreItems(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/GetStoreItems", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Retrieves the current server time
    https://docs.microsoft.com/rest/api/playfab/server/title-wide-data-management/gettime
--]]
function PlayFabServerApi:GetTime(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/GetTime", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Retrieves the key-value store of custom title settings
    https://docs.microsoft.com/rest/api/playfab/server/title-wide-data-management/gettitledata
--]]
function PlayFabServerApi:GetTitleData(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/GetTitleData", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Retrieves the key-value store of custom internal title settings
    https://docs.microsoft.com/rest/api/playfab/server/title-wide-data-management/gettitleinternaldata
--]]
function PlayFabServerApi:GetTitleInternalData(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/GetTitleInternalData", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Retrieves the title news feed, as configured in the developer portal
    https://docs.microsoft.com/rest/api/playfab/server/title-wide-data-management/gettitlenews
--]]
function PlayFabServerApi:GetTitleNews(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/GetTitleNews", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Retrieves the relevant details for a specified user
    https://docs.microsoft.com/rest/api/playfab/server/account-management/getuseraccountinfo
--]]
function PlayFabServerApi:GetUserAccountInfo(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/GetUserAccountInfo", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Gets all bans for a user.
    https://docs.microsoft.com/rest/api/playfab/server/account-management/getuserbans
--]]
function PlayFabServerApi:GetUserBans(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/GetUserBans", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Retrieves the title-specific custom data for the user which is readable and writable by the client
    https://docs.microsoft.com/rest/api/playfab/server/player-data-management/getuserdata
--]]
function PlayFabServerApi:GetUserData(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/GetUserData", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Retrieves the title-specific custom data for the user which cannot be accessed by the client
    https://docs.microsoft.com/rest/api/playfab/server/player-data-management/getuserinternaldata
--]]
function PlayFabServerApi:GetUserInternalData(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/GetUserInternalData", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Retrieves the specified user's current inventory of virtual goods
    https://docs.microsoft.com/rest/api/playfab/server/player-item-management/getuserinventory
--]]
function PlayFabServerApi:GetUserInventory(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/GetUserInventory", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Retrieves the publisher-specific custom data for the user which is readable and writable by the client
    https://docs.microsoft.com/rest/api/playfab/server/player-data-management/getuserpublisherdata
--]]
function PlayFabServerApi:GetUserPublisherData(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/GetUserPublisherData", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Retrieves the publisher-specific custom data for the user which cannot be accessed by the client
    https://docs.microsoft.com/rest/api/playfab/server/player-data-management/getuserpublisherinternaldata
--]]
function PlayFabServerApi:GetUserPublisherInternalData(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/GetUserPublisherInternalData", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Retrieves the publisher-specific custom data for the user which can only be read by the client
    https://docs.microsoft.com/rest/api/playfab/server/player-data-management/getuserpublisherreadonlydata
--]]
function PlayFabServerApi:GetUserPublisherReadOnlyData(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/GetUserPublisherReadOnlyData", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Retrieves the title-specific custom data for the user which can only be read by the client
    https://docs.microsoft.com/rest/api/playfab/server/player-data-management/getuserreadonlydata
--]]
function PlayFabServerApi:GetUserReadOnlyData(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/GetUserReadOnlyData", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Grants the specified character type to the user. CharacterIds are not globally unique; characterId must be evaluated
    with the parent PlayFabId to guarantee uniqueness.
    https://docs.microsoft.com/rest/api/playfab/server/characters/grantcharactertouser
--]]
function PlayFabServerApi:GrantCharacterToUser(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/GrantCharacterToUser", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Adds the specified items to the specified character's inventory
    https://docs.microsoft.com/rest/api/playfab/server/player-item-management/grantitemstocharacter
--]]
function PlayFabServerApi:GrantItemsToCharacter(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/GrantItemsToCharacter", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Adds the specified items to the specified user's inventory
    https://docs.microsoft.com/rest/api/playfab/server/player-item-management/grantitemstouser
--]]
function PlayFabServerApi:GrantItemsToUser(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/GrantItemsToUser", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Adds the specified items to the specified user inventories
    https://docs.microsoft.com/rest/api/playfab/server/player-item-management/grantitemstousers
--]]
function PlayFabServerApi:GrantItemsToUsers(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/GrantItemsToUsers", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Links the PlayStation Network account associated with the provided access code to the user's PlayFab account
    https://docs.microsoft.com/rest/api/playfab/server/account-management/linkpsnaccount
--]]
function PlayFabServerApi:LinkPSNAccount(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/LinkPSNAccount", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Links the custom server identifier, generated by the title, to the user's PlayFab account.
    https://docs.microsoft.com/rest/api/playfab/server/account-management/linkservercustomid
--]]
function PlayFabServerApi:LinkServerCustomId(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/LinkServerCustomId", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Links the Xbox Live account associated with the provided access code to the user's PlayFab account
    https://docs.microsoft.com/rest/api/playfab/server/account-management/linkxboxaccount
--]]
function PlayFabServerApi:LinkXboxAccount(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/LinkXboxAccount", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Securely login a game client from an external server backend using a custom identifier for that player. Server Custom ID
    and Client Custom ID are mutually exclusive and cannot be used to retrieve the same player account.
    https://docs.microsoft.com/rest/api/playfab/server/authentication/loginwithservercustomid
--]]
function PlayFabServerApi:LoginWithServerCustomId(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/LoginWithServerCustomId", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Signs the user in using a Xbox Live Token from an external server backend, returning a session identifier that can
    subsequently be used for API calls which require an authenticated user
    https://docs.microsoft.com/rest/api/playfab/server/authentication/loginwithxbox
--]]
function PlayFabServerApi:LoginWithXbox(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/LoginWithXbox", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Signs the user in using an Xbox ID and Sandbox ID, returning a session identifier that can subsequently be used for API
    calls which require an authenticated user
    https://docs.microsoft.com/rest/api/playfab/server/authentication/loginwithxboxid
--]]
function PlayFabServerApi:LoginWithXboxId(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/LoginWithXboxId", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Modifies the number of remaining uses of a player's inventory item
    https://docs.microsoft.com/rest/api/playfab/server/player-item-management/modifyitemuses
--]]
function PlayFabServerApi:ModifyItemUses(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/ModifyItemUses", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Moves an item from a character's inventory into another of the users's character's inventory.
    https://docs.microsoft.com/rest/api/playfab/server/player-item-management/moveitemtocharacterfromcharacter
--]]
function PlayFabServerApi:MoveItemToCharacterFromCharacter(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/MoveItemToCharacterFromCharacter", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Moves an item from a user's inventory into their character's inventory.
    https://docs.microsoft.com/rest/api/playfab/server/player-item-management/moveitemtocharacterfromuser
--]]
function PlayFabServerApi:MoveItemToCharacterFromUser(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/MoveItemToCharacterFromUser", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Moves an item from a character's inventory into the owning user's inventory.
    https://docs.microsoft.com/rest/api/playfab/server/player-item-management/moveitemtouserfromcharacter
--]]
function PlayFabServerApi:MoveItemToUserFromCharacter(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/MoveItemToUserFromCharacter", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Informs the PlayFab match-making service that the user specified has left the Game Server Instance
    https://docs.microsoft.com/rest/api/playfab/server/matchmaking/notifymatchmakerplayerleft
--]]
function PlayFabServerApi:NotifyMatchmakerPlayerLeft(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/NotifyMatchmakerPlayerLeft", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Adds the virtual goods associated with the coupon to the user's inventory. Coupons can be generated via the
    Economy->Catalogs tab in the PlayFab Game Manager.
    https://docs.microsoft.com/rest/api/playfab/server/player-item-management/redeemcoupon
--]]
function PlayFabServerApi:RedeemCoupon(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/RedeemCoupon", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Validates a Game Server session ticket and returns details about the user
    https://docs.microsoft.com/rest/api/playfab/server/matchmaking/redeemmatchmakerticket
--]]
function PlayFabServerApi:RedeemMatchmakerTicket(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/RedeemMatchmakerTicket", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Set the state of the indicated Game Server Instance. Also update the heartbeat for the instance.
    https://docs.microsoft.com/rest/api/playfab/server/matchmaking/refreshgameserverinstanceheartbeat
--]]
function PlayFabServerApi:RefreshGameServerInstanceHeartbeat(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/RefreshGameServerInstanceHeartbeat", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Inform the matchmaker that a new Game Server Instance is added.
    https://docs.microsoft.com/rest/api/playfab/server/matchmaking/registergame
--]]
function PlayFabServerApi:RegisterGame(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/RegisterGame", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Removes the specified friend from the the user's friend list
    https://docs.microsoft.com/rest/api/playfab/server/friend-list-management/removefriend
--]]
function PlayFabServerApi:RemoveFriend(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/RemoveFriend", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Removes the specified generic service identifier from the player's PlayFab account.
    https://docs.microsoft.com/rest/api/playfab/server/account-management/removegenericid
--]]
function PlayFabServerApi:RemoveGenericID(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/RemoveGenericID", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Remove a given tag from a player profile. The tag's namespace is automatically generated based on the source of the tag.
    https://docs.microsoft.com/rest/api/playfab/server/playstream/removeplayertag
--]]
function PlayFabServerApi:RemovePlayerTag(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/RemovePlayerTag", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Removes users from the set of those able to update the shared data and the set of users in the group. Only users in the
    group can remove members. If as a result of the call, zero users remain with access, the group and its associated data
    will be deleted. Shared Groups are designed for sharing data between a very small number of players, please see our
    guide: https://docs.microsoft.com/gaming/playfab/features/social/groups/using-shared-group-data
    https://docs.microsoft.com/rest/api/playfab/server/shared-group-data/removesharedgroupmembers
--]]
function PlayFabServerApi:RemoveSharedGroupMembers(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/RemoveSharedGroupMembers", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Submit a report about a player (due to bad bahavior, etc.) on behalf of another player, so that customer service
    representatives for the title can take action concerning potentially toxic players.
    https://docs.microsoft.com/rest/api/playfab/server/player-item-management/reportplayer
--]]
function PlayFabServerApi:ReportPlayer(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/ReportPlayer", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Revoke all active bans for a user.
    https://docs.microsoft.com/rest/api/playfab/server/account-management/revokeallbansforuser
--]]
function PlayFabServerApi:RevokeAllBansForUser(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/RevokeAllBansForUser", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Revoke all active bans specified with BanId.
    https://docs.microsoft.com/rest/api/playfab/server/account-management/revokebans
--]]
function PlayFabServerApi:RevokeBans(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/RevokeBans", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Revokes access to an item in a user's inventory
    https://docs.microsoft.com/rest/api/playfab/server/player-item-management/revokeinventoryitem
--]]
function PlayFabServerApi:RevokeInventoryItem(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/RevokeInventoryItem", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Revokes access for up to 25 items across multiple users and characters.
    https://docs.microsoft.com/rest/api/playfab/server/player-item-management/revokeinventoryitems
--]]
function PlayFabServerApi:RevokeInventoryItems(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/RevokeInventoryItems", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Saves push notification template for title
    https://docs.microsoft.com/rest/api/playfab/server/account-management/savepushnotificationtemplate
--]]
function PlayFabServerApi:SavePushNotificationTemplate(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/SavePushNotificationTemplate", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Forces an email to be sent to the registered contact email address for the user's account based on an account recovery
    email template
    https://docs.microsoft.com/rest/api/playfab/server/account-management/sendcustomaccountrecoveryemail
--]]
function PlayFabServerApi:SendCustomAccountRecoveryEmail(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/SendCustomAccountRecoveryEmail", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Sends an email based on an email template to a player's contact email
    https://docs.microsoft.com/rest/api/playfab/server/account-management/sendemailfromtemplate
--]]
function PlayFabServerApi:SendEmailFromTemplate(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/SendEmailFromTemplate", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Sends an iOS/Android Push Notification to a specific user, if that user's device has been configured for Push
    Notifications in PlayFab. If a user has linked both Android and iOS devices, both will be notified.
    https://docs.microsoft.com/rest/api/playfab/server/account-management/sendpushnotification
--]]
function PlayFabServerApi:SendPushNotification(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/SendPushNotification", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Sends an iOS/Android Push Notification template to a specific user, if that user's device has been configured for Push
    Notifications in PlayFab. If a user has linked both Android and iOS devices, both will be notified.
    https://docs.microsoft.com/rest/api/playfab/server/account-management/sendpushnotificationfromtemplate
--]]
function PlayFabServerApi:SendPushNotificationFromTemplate(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/SendPushNotificationFromTemplate", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Updates the tag list for a specified user in the friend list of another user
    https://docs.microsoft.com/rest/api/playfab/server/friend-list-management/setfriendtags
--]]
function PlayFabServerApi:SetFriendTags(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/SetFriendTags", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Sets the custom data of the indicated Game Server Instance
    https://docs.microsoft.com/rest/api/playfab/server/matchmaking/setgameserverinstancedata
--]]
function PlayFabServerApi:SetGameServerInstanceData(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/SetGameServerInstanceData", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Set the state of the indicated Game Server Instance.
    https://docs.microsoft.com/rest/api/playfab/server/matchmaking/setgameserverinstancestate
--]]
function PlayFabServerApi:SetGameServerInstanceState(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/SetGameServerInstanceState", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Set custom tags for the specified Game Server Instance
    https://docs.microsoft.com/rest/api/playfab/server/matchmaking/setgameserverinstancetags
--]]
function PlayFabServerApi:SetGameServerInstanceTags(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/SetGameServerInstanceTags", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Sets the player's secret if it is not already set. Player secrets are used to sign API requests. To reset a player's
    secret use the Admin or Server API method SetPlayerSecret.
    https://docs.microsoft.com/rest/api/playfab/server/authentication/setplayersecret
--]]
function PlayFabServerApi:SetPlayerSecret(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/SetPlayerSecret", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Updates the key-value store of custom publisher settings
    https://docs.microsoft.com/rest/api/playfab/server/title-wide-data-management/setpublisherdata
--]]
function PlayFabServerApi:SetPublisherData(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/SetPublisherData", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Updates the key-value store of custom title settings
    https://docs.microsoft.com/rest/api/playfab/server/title-wide-data-management/settitledata
--]]
function PlayFabServerApi:SetTitleData(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/SetTitleData", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Updates the key-value store of custom title settings
    https://docs.microsoft.com/rest/api/playfab/server/title-wide-data-management/settitleinternaldata
--]]
function PlayFabServerApi:SetTitleInternalData(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/SetTitleInternalData", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Decrements the character's balance of the specified virtual currency by the stated amount. It is possible to make a VC
    balance negative with this API.
    https://docs.microsoft.com/rest/api/playfab/server/player-item-management/subtractcharactervirtualcurrency
--]]
function PlayFabServerApi:SubtractCharacterVirtualCurrency(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/SubtractCharacterVirtualCurrency", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Decrements the user's balance of the specified virtual currency by the stated amount. It is possible to make a VC
    balance negative with this API.
    https://docs.microsoft.com/rest/api/playfab/server/player-item-management/subtractuservirtualcurrency
--]]
function PlayFabServerApi:SubtractUserVirtualCurrency(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/SubtractUserVirtualCurrency", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Unlinks the related PSN account from the user's PlayFab account
    https://docs.microsoft.com/rest/api/playfab/server/account-management/unlinkpsnaccount
--]]
function PlayFabServerApi:UnlinkPSNAccount(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/UnlinkPSNAccount", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Unlinks the custom server identifier from the user's PlayFab account.
    https://docs.microsoft.com/rest/api/playfab/server/account-management/unlinkservercustomid
--]]
function PlayFabServerApi:UnlinkServerCustomId(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/UnlinkServerCustomId", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Unlinks the related Xbox Live account from the user's PlayFab account
    https://docs.microsoft.com/rest/api/playfab/server/account-management/unlinkxboxaccount
--]]
function PlayFabServerApi:UnlinkXboxAccount(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/UnlinkXboxAccount", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Opens a specific container (ContainerItemInstanceId), with a specific key (KeyItemInstanceId, when required), and
    returns the contents of the opened container. If the container (and key when relevant) are consumable (RemainingUses >
    0), their RemainingUses will be decremented, consistent with the operation of ConsumeItem.
    https://docs.microsoft.com/rest/api/playfab/server/player-item-management/unlockcontainerinstance
--]]
function PlayFabServerApi:UnlockContainerInstance(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/UnlockContainerInstance", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Searches Player or Character inventory for any ItemInstance matching the given CatalogItemId, if necessary unlocks it
    using any appropriate key, and returns the contents of the opened container. If the container (and key when relevant)
    are consumable (RemainingUses > 0), their RemainingUses will be decremented, consistent with the operation of
    ConsumeItem.
    https://docs.microsoft.com/rest/api/playfab/server/player-item-management/unlockcontaineritem
--]]
function PlayFabServerApi:UnlockContainerItem(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/UnlockContainerItem", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Update the avatar URL of the specified player
    https://docs.microsoft.com/rest/api/playfab/server/account-management/updateavatarurl
--]]
function PlayFabServerApi:UpdateAvatarUrl(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/UpdateAvatarUrl", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Updates information of a list of existing bans specified with Ban Ids.
    https://docs.microsoft.com/rest/api/playfab/server/account-management/updatebans
--]]
function PlayFabServerApi:UpdateBans(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/UpdateBans", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Updates the title-specific custom data for the user's character which is readable and writable by the client
    https://docs.microsoft.com/rest/api/playfab/server/character-data/updatecharacterdata
--]]
function PlayFabServerApi:UpdateCharacterData(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/UpdateCharacterData", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Updates the title-specific custom data for the user's character which cannot be accessed by the client
    https://docs.microsoft.com/rest/api/playfab/server/character-data/updatecharacterinternaldata
--]]
function PlayFabServerApi:UpdateCharacterInternalData(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/UpdateCharacterInternalData", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Updates the title-specific custom data for the user's character which can only be read by the client
    https://docs.microsoft.com/rest/api/playfab/server/character-data/updatecharacterreadonlydata
--]]
function PlayFabServerApi:UpdateCharacterReadOnlyData(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/UpdateCharacterReadOnlyData", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Updates the values of the specified title-specific statistics for the specific character
    https://docs.microsoft.com/rest/api/playfab/server/characters/updatecharacterstatistics
--]]
function PlayFabServerApi:UpdateCharacterStatistics(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/UpdateCharacterStatistics", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Updates the values of the specified title-specific statistics for the user
    https://docs.microsoft.com/rest/api/playfab/server/player-data-management/updateplayerstatistics
--]]
function PlayFabServerApi:UpdatePlayerStatistics(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/UpdatePlayerStatistics", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Adds, updates, and removes data keys for a shared group object. If the permission is set to Public, all fields updated
    or added in this call will be readable by users not in the group. By default, data permissions are set to Private.
    Regardless of the permission setting, only members of the group (and the server) can update the data. Shared Groups are
    designed for sharing data between a very small number of players, please see our guide:
    https://docs.microsoft.com/gaming/playfab/features/social/groups/using-shared-group-data
    https://docs.microsoft.com/rest/api/playfab/server/shared-group-data/updatesharedgroupdata
--]]
function PlayFabServerApi:UpdateSharedGroupData(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/UpdateSharedGroupData", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Updates the title-specific custom data for the user which is readable and writable by the client
    https://docs.microsoft.com/rest/api/playfab/server/player-data-management/updateuserdata
--]]
function PlayFabServerApi:UpdateUserData(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/UpdateUserData", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Updates the title-specific custom data for the user which cannot be accessed by the client
    https://docs.microsoft.com/rest/api/playfab/server/player-data-management/updateuserinternaldata
--]]
function PlayFabServerApi:UpdateUserInternalData(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/UpdateUserInternalData", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Updates the key-value pair data tagged to the specified item, which is read-only from the client.
    https://docs.microsoft.com/rest/api/playfab/server/player-item-management/updateuserinventoryitemcustomdata
--]]
function PlayFabServerApi:UpdateUserInventoryItemCustomData(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/UpdateUserInventoryItemCustomData", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Updates the publisher-specific custom data for the user which is readable and writable by the client
    https://docs.microsoft.com/rest/api/playfab/server/player-data-management/updateuserpublisherdata
--]]
function PlayFabServerApi:UpdateUserPublisherData(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/UpdateUserPublisherData", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Updates the publisher-specific custom data for the user which cannot be accessed by the client
    https://docs.microsoft.com/rest/api/playfab/server/player-data-management/updateuserpublisherinternaldata
--]]
function PlayFabServerApi:UpdateUserPublisherInternalData(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/UpdateUserPublisherInternalData", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Updates the publisher-specific custom data for the user which can only be read by the client
    https://docs.microsoft.com/rest/api/playfab/server/player-data-management/updateuserpublisherreadonlydata
--]]
function PlayFabServerApi:UpdateUserPublisherReadOnlyData(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/UpdateUserPublisherReadOnlyData", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Updates the title-specific custom data for the user which can only be read by the client
    https://docs.microsoft.com/rest/api/playfab/server/player-data-management/updateuserreadonlydata
--]]
function PlayFabServerApi:UpdateUserReadOnlyData(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/UpdateUserReadOnlyData", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Writes a character-based event into PlayStream.
    https://docs.microsoft.com/rest/api/playfab/server/analytics/writecharacterevent
--]]
function PlayFabServerApi:WriteCharacterEvent(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/WriteCharacterEvent", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Writes a player-based event into PlayStream.
    https://docs.microsoft.com/rest/api/playfab/server/analytics/writeplayerevent
--]]
function PlayFabServerApi:WritePlayerEvent(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/WritePlayerEvent", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Writes a title-based event into PlayStream.
    https://docs.microsoft.com/rest/api/playfab/server/analytics/writetitleevent
--]]
function PlayFabServerApi:WriteTitleEvent(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Server/WriteTitleEvent", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

return PlayFabServerApi
