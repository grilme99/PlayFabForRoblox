-- PlayFab Client API
-- You should not require this file directly
-- All api calls are documented here: https://docs.microsoft.com/gaming/playfab/api-references/

local Promise = require(script.Parent.Promise)
local IPlayFabHttps = require(script.Parent.IPlayFabHttps)
local PlayFabSettings = require(script.Parent.PlayFabSettings)

local PlayFabClientApi = {
    settings = PlayFabSettings.settings
}

--[[
    Accepts an open trade (one that has not yet been accepted or cancelled), if the locally signed-in player is in the
    allowed player list for the trade, or it is open to all players. If the call is successful, the offered and accepted
    items will be swapped between the two players' inventories.
    https://docs.microsoft.com/rest/api/playfab/client/trading/accepttrade
--]]
function PlayFabClientApi:AcceptTrade(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/AcceptTrade", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Adds the PlayFab user, based upon a match against a supplied unique identifier, to the friend list of the local user. At
    least one of FriendPlayFabId,FriendUsername,FriendEmail, or FriendTitleDisplayName should be initialized.
    https://docs.microsoft.com/rest/api/playfab/client/friend-list-management/addfriend
--]]
function PlayFabClientApi:AddFriend(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/AddFriend", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Adds the specified generic service identifier to the player's PlayFab account. This is designed to allow for a PlayFab
    ID lookup of any arbitrary service identifier a title wants to add. This identifier should never be used as
    authentication credentials, as the intent is that it is easily accessible by other players.
    https://docs.microsoft.com/rest/api/playfab/client/account-management/addgenericid
--]]
function PlayFabClientApi:AddGenericID(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/AddGenericID", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Adds or updates a contact email to the player's profile.
    https://docs.microsoft.com/rest/api/playfab/client/account-management/addorupdatecontactemail
--]]
function PlayFabClientApi:AddOrUpdateContactEmail(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/AddOrUpdateContactEmail", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Adds users to the set of those able to update both the shared data, as well as the set of users in the group. Only users
    in the group can add new members. Shared Groups are designed for sharing data between a very small number of players,
    please see our guide: https://docs.microsoft.com/gaming/playfab/features/social/groups/using-shared-group-data
    https://docs.microsoft.com/rest/api/playfab/client/shared-group-data/addsharedgroupmembers
--]]
function PlayFabClientApi:AddSharedGroupMembers(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/AddSharedGroupMembers", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Adds playfab username/password auth to an existing account created via an anonymous auth method, e.g. automatic device
    ID login.
    https://docs.microsoft.com/rest/api/playfab/client/account-management/addusernamepassword
--]]
function PlayFabClientApi:AddUsernamePassword(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/AddUsernamePassword", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Increments the user's balance of the specified virtual currency by the stated amount
    https://docs.microsoft.com/rest/api/playfab/client/player-item-management/adduservirtualcurrency
--]]
function PlayFabClientApi:AddUserVirtualCurrency(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/AddUserVirtualCurrency", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Registers the Android device to receive push notifications
    https://docs.microsoft.com/rest/api/playfab/client/platform-specific-methods/androiddevicepushnotificationregistration
--]]
function PlayFabClientApi:AndroidDevicePushNotificationRegistration(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/AndroidDevicePushNotificationRegistration", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Attributes an install for advertisment.
    https://docs.microsoft.com/rest/api/playfab/client/advertising/attributeinstall
--]]
function PlayFabClientApi:AttributeInstall(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/AttributeInstall", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Cancels an open trade (one that has not yet been accepted or cancelled). Note that only the player who created the trade
    can cancel it via this API call, to prevent griefing of the trade system (cancelling trades in order to prevent other
    players from accepting them, for trades that can be claimed by more than one player).
    https://docs.microsoft.com/rest/api/playfab/client/trading/canceltrade
--]]
function PlayFabClientApi:CancelTrade(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/CancelTrade", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Confirms with the payment provider that the purchase was approved (if applicable) and adjusts inventory and virtual
    currency balances as appropriate
    https://docs.microsoft.com/rest/api/playfab/client/player-item-management/confirmpurchase
--]]
function PlayFabClientApi:ConfirmPurchase(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/ConfirmPurchase", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Consume uses of a consumable item. When all uses are consumed, it will be removed from the player's inventory.
    https://docs.microsoft.com/rest/api/playfab/client/player-item-management/consumeitem
--]]
function PlayFabClientApi:ConsumeItem(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/ConsumeItem", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Grants the player's current entitlements from Microsoft Store's Collection API
    https://docs.microsoft.com/rest/api/playfab/client/platform-specific-methods/consumemicrosoftstoreentitlements
--]]
function PlayFabClientApi:ConsumeMicrosoftStoreEntitlements(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/ConsumeMicrosoftStoreEntitlements", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Checks for any new consumable entitlements. If any are found, they are consumed and added as PlayFab items
    https://docs.microsoft.com/rest/api/playfab/client/platform-specific-methods/consumepsnentitlements
--]]
function PlayFabClientApi:ConsumePSNEntitlements(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/ConsumePSNEntitlements", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Grants the player's current entitlements from Xbox Live, consuming all availble items in Xbox and granting them to the
    player's PlayFab inventory. This call is idempotent and will not grant previously granted items to the player.
    https://docs.microsoft.com/rest/api/playfab/client/platform-specific-methods/consumexboxentitlements
--]]
function PlayFabClientApi:ConsumeXboxEntitlements(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/ConsumeXboxEntitlements", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Requests the creation of a shared group object, containing key/value pairs which may be updated by all members of the
    group. Upon creation, the current user will be the only member of the group. Shared Groups are designed for sharing data
    between a very small number of players, please see our guide:
    https://docs.microsoft.com/gaming/playfab/features/social/groups/using-shared-group-data
    https://docs.microsoft.com/rest/api/playfab/client/shared-group-data/createsharedgroup
--]]
function PlayFabClientApi:CreateSharedGroup(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/CreateSharedGroup", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Executes a CloudScript function, with the 'currentPlayerId' set to the PlayFab ID of the authenticated player.
    https://docs.microsoft.com/rest/api/playfab/client/server-side-cloud-script/executecloudscript
--]]
function PlayFabClientApi:ExecuteCloudScript(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/ExecuteCloudScript", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Retrieves the user's PlayFab account details
    https://docs.microsoft.com/rest/api/playfab/client/account-management/getaccountinfo
--]]
function PlayFabClientApi:GetAccountInfo(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/GetAccountInfo", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Returns a list of ad placements and a reward for each
    https://docs.microsoft.com/rest/api/playfab/client/advertising/getadplacements
--]]
function PlayFabClientApi:GetAdPlacements(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/GetAdPlacements", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Lists all of the characters that belong to a specific user. CharacterIds are not globally unique; characterId must be
    evaluated with the parent PlayFabId to guarantee uniqueness.
    https://docs.microsoft.com/rest/api/playfab/client/characters/getalluserscharacters
--]]
function PlayFabClientApi:GetAllUsersCharacters(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/GetAllUsersCharacters", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Retrieves the specified version of the title's catalog of virtual goods, including all defined properties
    https://docs.microsoft.com/rest/api/playfab/client/title-wide-data-management/getcatalogitems
--]]
function PlayFabClientApi:GetCatalogItems(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/GetCatalogItems", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Retrieves the title-specific custom data for the character which is readable and writable by the client
    https://docs.microsoft.com/rest/api/playfab/client/character-data/getcharacterdata
--]]
function PlayFabClientApi:GetCharacterData(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/GetCharacterData", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Retrieves the specified character's current inventory of virtual goods
    https://docs.microsoft.com/rest/api/playfab/client/player-item-management/getcharacterinventory
--]]
function PlayFabClientApi:GetCharacterInventory(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/GetCharacterInventory", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Retrieves a list of ranked characters for the given statistic, starting from the indicated point in the leaderboard
    https://docs.microsoft.com/rest/api/playfab/client/characters/getcharacterleaderboard
--]]
function PlayFabClientApi:GetCharacterLeaderboard(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/GetCharacterLeaderboard", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Retrieves the title-specific custom data for the character which can only be read by the client
    https://docs.microsoft.com/rest/api/playfab/client/character-data/getcharacterreadonlydata
--]]
function PlayFabClientApi:GetCharacterReadOnlyData(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/GetCharacterReadOnlyData", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Retrieves the details of all title-specific statistics for the user
    https://docs.microsoft.com/rest/api/playfab/client/characters/getcharacterstatistics
--]]
function PlayFabClientApi:GetCharacterStatistics(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/GetCharacterStatistics", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    This API retrieves a pre-signed URL for accessing a content file for the title. A subsequent HTTP GET to the returned
    URL will attempt to download the content. A HEAD query to the returned URL will attempt to retrieve the metadata of the
    content. Note that a successful result does not guarantee the existence of this content - if it has not been uploaded,
    the query to retrieve the data will fail. See this post for more information:
    https://community.playfab.com/hc/community/posts/205469488-How-to-upload-files-to-PlayFab-s-Content-Service. Also,
    please be aware that the Content service is specifically PlayFab's CDN offering, for which standard CDN rates apply.
    https://docs.microsoft.com/rest/api/playfab/client/content/getcontentdownloadurl
--]]
function PlayFabClientApi:GetContentDownloadUrl(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/GetContentDownloadUrl", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Get details about all current running game servers matching the given parameters.
    https://docs.microsoft.com/rest/api/playfab/client/matchmaking/getcurrentgames
--]]
function PlayFabClientApi:GetCurrentGames(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/GetCurrentGames", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Retrieves a list of ranked friends of the current player for the given statistic, starting from the indicated point in
    the leaderboard
    https://docs.microsoft.com/rest/api/playfab/client/player-data-management/getfriendleaderboard
--]]
function PlayFabClientApi:GetFriendLeaderboard(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/GetFriendLeaderboard", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Retrieves a list of ranked friends of the current player for the given statistic, centered on the requested PlayFab
    user. If PlayFabId is empty or null will return currently logged in user.
    https://docs.microsoft.com/rest/api/playfab/client/player-data-management/getfriendleaderboardaroundplayer
--]]
function PlayFabClientApi:GetFriendLeaderboardAroundPlayer(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/GetFriendLeaderboardAroundPlayer", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Retrieves the current friend list for the local user, constrained to users who have PlayFab accounts. Friends from
    linked accounts (Facebook, Steam) are also included. You may optionally exclude some linked services' friends.
    https://docs.microsoft.com/rest/api/playfab/client/friend-list-management/getfriendslist
--]]
function PlayFabClientApi:GetFriendsList(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/GetFriendsList", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Get details about the regions hosting game servers matching the given parameters.
    https://docs.microsoft.com/rest/api/playfab/client/matchmaking/getgameserverregions
--]]
function PlayFabClientApi:GetGameServerRegions(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/GetGameServerRegions", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Retrieves a list of ranked users for the given statistic, starting from the indicated point in the leaderboard
    https://docs.microsoft.com/rest/api/playfab/client/player-data-management/getleaderboard
--]]
function PlayFabClientApi:GetLeaderboard(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/GetLeaderboard", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Retrieves a list of ranked characters for the given statistic, centered on the requested Character ID
    https://docs.microsoft.com/rest/api/playfab/client/characters/getleaderboardaroundcharacter
--]]
function PlayFabClientApi:GetLeaderboardAroundCharacter(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/GetLeaderboardAroundCharacter", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Retrieves a list of ranked users for the given statistic, centered on the requested player. If PlayFabId is empty or
    null will return currently logged in user.
    https://docs.microsoft.com/rest/api/playfab/client/player-data-management/getleaderboardaroundplayer
--]]
function PlayFabClientApi:GetLeaderboardAroundPlayer(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/GetLeaderboardAroundPlayer", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Retrieves a list of all of the user's characters for the given statistic.
    https://docs.microsoft.com/rest/api/playfab/client/characters/getleaderboardforusercharacters
--]]
function PlayFabClientApi:GetLeaderboardForUserCharacters(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/GetLeaderboardForUserCharacters", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    For payments flows where the provider requires playfab (the fulfiller) to initiate the transaction, but the client
    completes the rest of the flow. In the Xsolla case, the token returned here will be passed to Xsolla by the client to
    create a cart. Poll GetPurchase using the returned OrderId once you've completed the payment.
    https://docs.microsoft.com/rest/api/playfab/client/player-item-management/getpaymenttoken
--]]
function PlayFabClientApi:GetPaymentToken(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/GetPaymentToken", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Gets a Photon custom authentication token that can be used to securely join the player into a Photon room. See
    https://docs.microsoft.com/gaming/playfab/features/multiplayer/photon/quickstart for more details.
    https://docs.microsoft.com/rest/api/playfab/client/authentication/getphotonauthenticationtoken
--]]
function PlayFabClientApi:GetPhotonAuthenticationToken(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/GetPhotonAuthenticationToken", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Retrieves all of the user's different kinds of info.
    https://docs.microsoft.com/rest/api/playfab/client/account-management/getplayercombinedinfo
--]]
function PlayFabClientApi:GetPlayerCombinedInfo(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/GetPlayerCombinedInfo", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Retrieves the player's profile
    https://docs.microsoft.com/rest/api/playfab/client/account-management/getplayerprofile
--]]
function PlayFabClientApi:GetPlayerProfile(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/GetPlayerProfile", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    List all segments that a player currently belongs to at this moment in time.
    https://docs.microsoft.com/rest/api/playfab/client/playstream/getplayersegments
--]]
function PlayFabClientApi:GetPlayerSegments(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/GetPlayerSegments", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Retrieves the indicated statistics (current version and values for all statistics, if none are specified), for the local
    player.
    https://docs.microsoft.com/rest/api/playfab/client/player-data-management/getplayerstatistics
--]]
function PlayFabClientApi:GetPlayerStatistics(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/GetPlayerStatistics", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Retrieves the information on the available versions of the specified statistic.
    https://docs.microsoft.com/rest/api/playfab/client/player-data-management/getplayerstatisticversions
--]]
function PlayFabClientApi:GetPlayerStatisticVersions(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/GetPlayerStatisticVersions", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Get all tags with a given Namespace (optional) from a player profile.
    https://docs.microsoft.com/rest/api/playfab/client/playstream/getplayertags
--]]
function PlayFabClientApi:GetPlayerTags(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/GetPlayerTags", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Gets all trades the player has either opened or accepted, optionally filtered by trade status.
    https://docs.microsoft.com/rest/api/playfab/client/trading/getplayertrades
--]]
function PlayFabClientApi:GetPlayerTrades(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/GetPlayerTrades", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Retrieves the unique PlayFab identifiers for the given set of Facebook identifiers.
    https://docs.microsoft.com/rest/api/playfab/client/account-management/getplayfabidsfromfacebookids
--]]
function PlayFabClientApi:GetPlayFabIDsFromFacebookIDs(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/GetPlayFabIDsFromFacebookIDs", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Retrieves the unique PlayFab identifiers for the given set of Facebook Instant Game identifiers.
    https://docs.microsoft.com/rest/api/playfab/client/account-management/getplayfabidsfromfacebookinstantgamesids
--]]
function PlayFabClientApi:GetPlayFabIDsFromFacebookInstantGamesIds(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/GetPlayFabIDsFromFacebookInstantGamesIds", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Retrieves the unique PlayFab identifiers for the given set of Game Center identifiers (referenced in the Game Center
    Programming Guide as the Player Identifier).
    https://docs.microsoft.com/rest/api/playfab/client/account-management/getplayfabidsfromgamecenterids
--]]
function PlayFabClientApi:GetPlayFabIDsFromGameCenterIDs(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/GetPlayFabIDsFromGameCenterIDs", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Retrieves the unique PlayFab identifiers for the given set of generic service identifiers. A generic identifier is the
    service name plus the service-specific ID for the player, as specified by the title when the generic identifier was
    added to the player account.
    https://docs.microsoft.com/rest/api/playfab/client/account-management/getplayfabidsfromgenericids
--]]
function PlayFabClientApi:GetPlayFabIDsFromGenericIDs(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/GetPlayFabIDsFromGenericIDs", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Retrieves the unique PlayFab identifiers for the given set of Google identifiers. The Google identifiers are the IDs for
    the user accounts, available as "id" in the Google+ People API calls.
    https://docs.microsoft.com/rest/api/playfab/client/account-management/getplayfabidsfromgoogleids
--]]
function PlayFabClientApi:GetPlayFabIDsFromGoogleIDs(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/GetPlayFabIDsFromGoogleIDs", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Retrieves the unique PlayFab identifiers for the given set of Kongregate identifiers. The Kongregate identifiers are the
    IDs for the user accounts, available as "user_id" from the Kongregate API methods(ex:
    http://developers.kongregate.com/docs/client/getUserId).
    https://docs.microsoft.com/rest/api/playfab/client/account-management/getplayfabidsfromkongregateids
--]]
function PlayFabClientApi:GetPlayFabIDsFromKongregateIDs(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/GetPlayFabIDsFromKongregateIDs", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Retrieves the unique PlayFab identifiers for the given set of Nintendo Switch identifiers.
    https://docs.microsoft.com/rest/api/playfab/client/account-management/getplayfabidsfromnintendoswitchdeviceids
--]]
function PlayFabClientApi:GetPlayFabIDsFromNintendoSwitchDeviceIds(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/GetPlayFabIDsFromNintendoSwitchDeviceIds", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Retrieves the unique PlayFab identifiers for the given set of PlayStation Network identifiers.
    https://docs.microsoft.com/rest/api/playfab/client/account-management/getplayfabidsfrompsnaccountids
--]]
function PlayFabClientApi:GetPlayFabIDsFromPSNAccountIDs(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/GetPlayFabIDsFromPSNAccountIDs", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Retrieves the unique PlayFab identifiers for the given set of Steam identifiers. The Steam identifiers are the profile
    IDs for the user accounts, available as SteamId in the Steamworks Community API calls.
    https://docs.microsoft.com/rest/api/playfab/client/account-management/getplayfabidsfromsteamids
--]]
function PlayFabClientApi:GetPlayFabIDsFromSteamIDs(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/GetPlayFabIDsFromSteamIDs", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Retrieves the unique PlayFab identifiers for the given set of Twitch identifiers. The Twitch identifiers are the IDs for
    the user accounts, available as "_id" from the Twitch API methods (ex:
    https://github.com/justintv/Twitch-API/blob/master/v3_resources/users.md#get-usersuser).
    https://docs.microsoft.com/rest/api/playfab/client/account-management/getplayfabidsfromtwitchids
--]]
function PlayFabClientApi:GetPlayFabIDsFromTwitchIDs(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/GetPlayFabIDsFromTwitchIDs", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Retrieves the unique PlayFab identifiers for the given set of XboxLive identifiers.
    https://docs.microsoft.com/rest/api/playfab/client/account-management/getplayfabidsfromxboxliveids
--]]
function PlayFabClientApi:GetPlayFabIDsFromXboxLiveIDs(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/GetPlayFabIDsFromXboxLiveIDs", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Retrieves the key-value store of custom publisher settings
    https://docs.microsoft.com/rest/api/playfab/client/title-wide-data-management/getpublisherdata
--]]
function PlayFabClientApi:GetPublisherData(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/GetPublisherData", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Retrieves a purchase along with its current PlayFab status. Returns inventory items from the purchase that are still
    active.
    https://docs.microsoft.com/rest/api/playfab/client/player-item-management/getpurchase
--]]
function PlayFabClientApi:GetPurchase(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/GetPurchase", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Retrieves data stored in a shared group object, as well as the list of members in the group. Non-members of the group
    may use this to retrieve group data, including membership, but they will not receive data for keys marked as private.
    Shared Groups are designed for sharing data between a very small number of players, please see our guide:
    https://docs.microsoft.com/gaming/playfab/features/social/groups/using-shared-group-data
    https://docs.microsoft.com/rest/api/playfab/client/shared-group-data/getsharedgroupdata
--]]
function PlayFabClientApi:GetSharedGroupData(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/GetSharedGroupData", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Retrieves the set of items defined for the specified store, including all prices defined
    https://docs.microsoft.com/rest/api/playfab/client/title-wide-data-management/getstoreitems
--]]
function PlayFabClientApi:GetStoreItems(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/GetStoreItems", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Retrieves the current server time
    https://docs.microsoft.com/rest/api/playfab/client/title-wide-data-management/gettime
--]]
function PlayFabClientApi:GetTime(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/GetTime", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Retrieves the key-value store of custom title settings
    https://docs.microsoft.com/rest/api/playfab/client/title-wide-data-management/gettitledata
--]]
function PlayFabClientApi:GetTitleData(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/GetTitleData", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Retrieves the title news feed, as configured in the developer portal
    https://docs.microsoft.com/rest/api/playfab/client/title-wide-data-management/gettitlenews
--]]
function PlayFabClientApi:GetTitleNews(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/GetTitleNews", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Returns the title's base 64 encoded RSA CSP blob.
    https://docs.microsoft.com/rest/api/playfab/client/authentication/gettitlepublickey
--]]
function PlayFabClientApi:GetTitlePublicKey(request)
    return Promise.new(function(resolve, reject)
            IPlayFabHttps.MakePlayFabApiCall("/Client/GetTitlePublicKey", request or {}, nil, nil, resolve, reject)
    end)
end

--[[
    Gets the current status of an existing trade.
    https://docs.microsoft.com/rest/api/playfab/client/trading/gettradestatus
--]]
function PlayFabClientApi:GetTradeStatus(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/GetTradeStatus", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Retrieves the title-specific custom data for the user which is readable and writable by the client
    https://docs.microsoft.com/rest/api/playfab/client/player-data-management/getuserdata
--]]
function PlayFabClientApi:GetUserData(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/GetUserData", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Retrieves the user's current inventory of virtual goods
    https://docs.microsoft.com/rest/api/playfab/client/player-item-management/getuserinventory
--]]
function PlayFabClientApi:GetUserInventory(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/GetUserInventory", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Retrieves the publisher-specific custom data for the user which is readable and writable by the client
    https://docs.microsoft.com/rest/api/playfab/client/player-data-management/getuserpublisherdata
--]]
function PlayFabClientApi:GetUserPublisherData(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/GetUserPublisherData", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Retrieves the publisher-specific custom data for the user which can only be read by the client
    https://docs.microsoft.com/rest/api/playfab/client/player-data-management/getuserpublisherreadonlydata
--]]
function PlayFabClientApi:GetUserPublisherReadOnlyData(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/GetUserPublisherReadOnlyData", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Retrieves the title-specific custom data for the user which can only be read by the client
    https://docs.microsoft.com/rest/api/playfab/client/player-data-management/getuserreadonlydata
--]]
function PlayFabClientApi:GetUserReadOnlyData(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/GetUserReadOnlyData", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Requests a challenge from the server to be signed by Windows Hello Passport service to authenticate.
    https://docs.microsoft.com/rest/api/playfab/client/authentication/getwindowshellochallenge
--]]
function PlayFabClientApi:GetWindowsHelloChallenge(request)
    return Promise.new(function(resolve, reject)
            IPlayFabHttps.MakePlayFabApiCall("/Client/GetWindowsHelloChallenge", request or {}, nil, nil, resolve, reject)
    end)
end

--[[
    Grants the specified character type to the user. CharacterIds are not globally unique; characterId must be evaluated
    with the parent PlayFabId to guarantee uniqueness.
    https://docs.microsoft.com/rest/api/playfab/client/characters/grantcharactertouser
--]]
function PlayFabClientApi:GrantCharacterToUser(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/GrantCharacterToUser", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Links the Android device identifier to the user's PlayFab account
    https://docs.microsoft.com/rest/api/playfab/client/account-management/linkandroiddeviceid
--]]
function PlayFabClientApi:LinkAndroidDeviceID(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/LinkAndroidDeviceID", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Links the Apple account associated with the token to the user's PlayFab account.
    https://docs.microsoft.com/rest/api/playfab/client/account-management/linkapple
--]]
function PlayFabClientApi:LinkApple(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/LinkApple", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Links the custom identifier, generated by the title, to the user's PlayFab account
    https://docs.microsoft.com/rest/api/playfab/client/account-management/linkcustomid
--]]
function PlayFabClientApi:LinkCustomID(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/LinkCustomID", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Links the Facebook account associated with the provided Facebook access token to the user's PlayFab account
    https://docs.microsoft.com/rest/api/playfab/client/account-management/linkfacebookaccount
--]]
function PlayFabClientApi:LinkFacebookAccount(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/LinkFacebookAccount", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Links the Facebook Instant Games Id to the user's PlayFab account
    https://docs.microsoft.com/rest/api/playfab/client/account-management/linkfacebookinstantgamesid
--]]
function PlayFabClientApi:LinkFacebookInstantGamesId(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/LinkFacebookInstantGamesId", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Links the Game Center account associated with the provided Game Center ID to the user's PlayFab account
    https://docs.microsoft.com/rest/api/playfab/client/account-management/linkgamecenteraccount
--]]
function PlayFabClientApi:LinkGameCenterAccount(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/LinkGameCenterAccount", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Links the currently signed-in user account to their Google account, using their Google account credentials
    https://docs.microsoft.com/rest/api/playfab/client/account-management/linkgoogleaccount
--]]
function PlayFabClientApi:LinkGoogleAccount(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/LinkGoogleAccount", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Links the vendor-specific iOS device identifier to the user's PlayFab account
    https://docs.microsoft.com/rest/api/playfab/client/account-management/linkiosdeviceid
--]]
function PlayFabClientApi:LinkIOSDeviceID(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/LinkIOSDeviceID", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Links the Kongregate identifier to the user's PlayFab account
    https://docs.microsoft.com/rest/api/playfab/client/account-management/linkkongregate
--]]
function PlayFabClientApi:LinkKongregate(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/LinkKongregate", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Links the Nintendo account associated with the token to the user's PlayFab account.
    https://docs.microsoft.com/rest/api/playfab/client/account-management/linknintendoserviceaccount
--]]
function PlayFabClientApi:LinkNintendoServiceAccount(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/LinkNintendoServiceAccount", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Links the NintendoSwitchDeviceId to the user's PlayFab account
    https://docs.microsoft.com/rest/api/playfab/client/account-management/linknintendoswitchdeviceid
--]]
function PlayFabClientApi:LinkNintendoSwitchDeviceId(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/LinkNintendoSwitchDeviceId", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Links an OpenID Connect account to a user's PlayFab account, based on an existing relationship between a title and an
    Open ID Connect provider and the OpenId Connect JWT from that provider.
    https://docs.microsoft.com/rest/api/playfab/client/account-management/linkopenidconnect
--]]
function PlayFabClientApi:LinkOpenIdConnect(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/LinkOpenIdConnect", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Links the PlayStation Network account associated with the provided access code to the user's PlayFab account
    https://docs.microsoft.com/rest/api/playfab/client/account-management/linkpsnaccount
--]]
function PlayFabClientApi:LinkPSNAccount(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/LinkPSNAccount", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Links the Steam account associated with the provided Steam authentication ticket to the user's PlayFab account
    https://docs.microsoft.com/rest/api/playfab/client/account-management/linksteamaccount
--]]
function PlayFabClientApi:LinkSteamAccount(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/LinkSteamAccount", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Links the Twitch account associated with the token to the user's PlayFab account.
    https://docs.microsoft.com/rest/api/playfab/client/account-management/linktwitch
--]]
function PlayFabClientApi:LinkTwitch(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/LinkTwitch", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Link Windows Hello authentication to the current PlayFab Account
    https://docs.microsoft.com/rest/api/playfab/client/account-management/linkwindowshello
--]]
function PlayFabClientApi:LinkWindowsHello(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/LinkWindowsHello", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Links the Xbox Live account associated with the provided access code to the user's PlayFab account
    https://docs.microsoft.com/rest/api/playfab/client/account-management/linkxboxaccount
--]]
function PlayFabClientApi:LinkXboxAccount(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/LinkXboxAccount", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Signs the user in using the Android device identifier, returning a session identifier that can subsequently be used for
    API calls which require an authenticated user
    https://docs.microsoft.com/rest/api/playfab/client/authentication/loginwithandroiddeviceid
--]]
function PlayFabClientApi:LoginWithAndroidDeviceID(request)
    return Promise.new(function(resolve, reject)
         request.TitleId = PlayFabSettings.settings.titleId
        IPlayFabHttps.MakePlayFabApiCall("/Client/LoginWithAndroidDeviceID", request or {}, nil, nil, resolve, reject)
    end)
end

--[[
    Signs in the user with a Sign in with Apple identity token.
    https://docs.microsoft.com/rest/api/playfab/client/authentication/loginwithapple
--]]
function PlayFabClientApi:LoginWithApple(request)
    return Promise.new(function(resolve, reject)
         request.TitleId = PlayFabSettings.settings.titleId
        IPlayFabHttps.MakePlayFabApiCall("/Client/LoginWithApple", request or {}, nil, nil, resolve, reject)
    end)
end

--[[
    Signs the user in using a custom unique identifier generated by the title, returning a session identifier that can
    subsequently be used for API calls which require an authenticated user
    https://docs.microsoft.com/rest/api/playfab/client/authentication/loginwithcustomid
--]]
function PlayFabClientApi:LoginWithCustomID(request)
    return Promise.new(function(resolve, reject)
         request.TitleId = PlayFabSettings.settings.titleId
        IPlayFabHttps.MakePlayFabApiCall("/Client/LoginWithCustomID", request or {}, nil, nil, resolve, reject)
    end)
end

--[[
    Signs the user into the PlayFab account, returning a session identifier that can subsequently be used for API calls
    which require an authenticated user. Unlike most other login API calls, LoginWithEmailAddress does not permit the
    creation of new accounts via the CreateAccountFlag. Email addresses may be used to create accounts via
    RegisterPlayFabUser.
    https://docs.microsoft.com/rest/api/playfab/client/authentication/loginwithemailaddress
--]]
function PlayFabClientApi:LoginWithEmailAddress(request)
    return Promise.new(function(resolve, reject)
         request.TitleId = PlayFabSettings.settings.titleId
        IPlayFabHttps.MakePlayFabApiCall("/Client/LoginWithEmailAddress", request or {}, nil, nil, resolve, reject)
    end)
end

--[[
    Signs the user in using a Facebook access token, returning a session identifier that can subsequently be used for API
    calls which require an authenticated user
    https://docs.microsoft.com/rest/api/playfab/client/authentication/loginwithfacebook
--]]
function PlayFabClientApi:LoginWithFacebook(request)
    return Promise.new(function(resolve, reject)
         request.TitleId = PlayFabSettings.settings.titleId
        IPlayFabHttps.MakePlayFabApiCall("/Client/LoginWithFacebook", request or {}, nil, nil, resolve, reject)
    end)
end

--[[
    Signs the user in using a Facebook Instant Games ID, returning a session identifier that can subsequently be used for
    API calls which require an authenticated user. Requires Facebook Instant Games to be configured.
    https://docs.microsoft.com/rest/api/playfab/client/authentication/loginwithfacebookinstantgamesid
--]]
function PlayFabClientApi:LoginWithFacebookInstantGamesId(request)
    return Promise.new(function(resolve, reject)
         request.TitleId = PlayFabSettings.settings.titleId
        IPlayFabHttps.MakePlayFabApiCall("/Client/LoginWithFacebookInstantGamesId", request or {}, nil, nil, resolve, reject)
    end)
end

--[[
    Signs the user in using an iOS Game Center player identifier, returning a session identifier that can subsequently be
    used for API calls which require an authenticated user
    https://docs.microsoft.com/rest/api/playfab/client/authentication/loginwithgamecenter
--]]
function PlayFabClientApi:LoginWithGameCenter(request)
    return Promise.new(function(resolve, reject)
         request.TitleId = PlayFabSettings.settings.titleId
        IPlayFabHttps.MakePlayFabApiCall("/Client/LoginWithGameCenter", request or {}, nil, nil, resolve, reject)
    end)
end

--[[
    Signs the user in using their Google account credentials
    https://docs.microsoft.com/rest/api/playfab/client/authentication/loginwithgoogleaccount
--]]
function PlayFabClientApi:LoginWithGoogleAccount(request)
    return Promise.new(function(resolve, reject)
         request.TitleId = PlayFabSettings.settings.titleId
        IPlayFabHttps.MakePlayFabApiCall("/Client/LoginWithGoogleAccount", request or {}, nil, nil, resolve, reject)
    end)
end

--[[
    Signs the user in using the vendor-specific iOS device identifier, returning a session identifier that can subsequently
    be used for API calls which require an authenticated user
    https://docs.microsoft.com/rest/api/playfab/client/authentication/loginwithiosdeviceid
--]]
function PlayFabClientApi:LoginWithIOSDeviceID(request)
    return Promise.new(function(resolve, reject)
         request.TitleId = PlayFabSettings.settings.titleId
        IPlayFabHttps.MakePlayFabApiCall("/Client/LoginWithIOSDeviceID", request or {}, nil, nil, resolve, reject)
    end)
end

--[[
    Signs the user in using a Kongregate player account.
    https://docs.microsoft.com/rest/api/playfab/client/authentication/loginwithkongregate
--]]
function PlayFabClientApi:LoginWithKongregate(request)
    return Promise.new(function(resolve, reject)
         request.TitleId = PlayFabSettings.settings.titleId
        IPlayFabHttps.MakePlayFabApiCall("/Client/LoginWithKongregate", request or {}, nil, nil, resolve, reject)
    end)
end

--[[
    Signs in the user with a Nintendo service account token.
    https://docs.microsoft.com/rest/api/playfab/client/authentication/loginwithnintendoserviceaccount
--]]
function PlayFabClientApi:LoginWithNintendoServiceAccount(request)
    return Promise.new(function(resolve, reject)
         request.TitleId = PlayFabSettings.settings.titleId
        IPlayFabHttps.MakePlayFabApiCall("/Client/LoginWithNintendoServiceAccount", request or {}, nil, nil, resolve, reject)
    end)
end

--[[
    Signs the user in using a Nintendo Switch Device ID, returning a session identifier that can subsequently be used for
    API calls which require an authenticated user
    https://docs.microsoft.com/rest/api/playfab/client/authentication/loginwithnintendoswitchdeviceid
--]]
function PlayFabClientApi:LoginWithNintendoSwitchDeviceId(request)
    return Promise.new(function(resolve, reject)
         request.TitleId = PlayFabSettings.settings.titleId
        IPlayFabHttps.MakePlayFabApiCall("/Client/LoginWithNintendoSwitchDeviceId", request or {}, nil, nil, resolve, reject)
    end)
end

--[[
    Logs in a user with an Open ID Connect JWT created by an existing relationship between a title and an Open ID Connect
    provider.
    https://docs.microsoft.com/rest/api/playfab/client/authentication/loginwithopenidconnect
--]]
function PlayFabClientApi:LoginWithOpenIdConnect(request)
    return Promise.new(function(resolve, reject)
         request.TitleId = PlayFabSettings.settings.titleId
        IPlayFabHttps.MakePlayFabApiCall("/Client/LoginWithOpenIdConnect", request or {}, nil, nil, resolve, reject)
    end)
end

--[[
    Signs the user into the PlayFab account, returning a session identifier that can subsequently be used for API calls
    which require an authenticated user. Unlike most other login API calls, LoginWithPlayFab does not permit the creation of
    new accounts via the CreateAccountFlag. Username/Password credentials may be used to create accounts via
    RegisterPlayFabUser, or added to existing accounts using AddUsernamePassword.
    https://docs.microsoft.com/rest/api/playfab/client/authentication/loginwithplayfab
--]]
function PlayFabClientApi:LoginWithPlayFab(request)
    return Promise.new(function(resolve, reject)
         request.TitleId = PlayFabSettings.settings.titleId
        IPlayFabHttps.MakePlayFabApiCall("/Client/LoginWithPlayFab", request or {}, nil, nil, resolve, reject)
    end)
end

--[[
    Signs the user in using a PlayStation Network authentication code, returning a session identifier that can subsequently
    be used for API calls which require an authenticated user
    https://docs.microsoft.com/rest/api/playfab/client/authentication/loginwithpsn
--]]
function PlayFabClientApi:LoginWithPSN(request)
    return Promise.new(function(resolve, reject)
         request.TitleId = PlayFabSettings.settings.titleId
        IPlayFabHttps.MakePlayFabApiCall("/Client/LoginWithPSN", request or {}, nil, nil, resolve, reject)
    end)
end

--[[
    Signs the user in using a Steam authentication ticket, returning a session identifier that can subsequently be used for
    API calls which require an authenticated user
    https://docs.microsoft.com/rest/api/playfab/client/authentication/loginwithsteam
--]]
function PlayFabClientApi:LoginWithSteam(request)
    return Promise.new(function(resolve, reject)
         request.TitleId = PlayFabSettings.settings.titleId
        IPlayFabHttps.MakePlayFabApiCall("/Client/LoginWithSteam", request or {}, nil, nil, resolve, reject)
    end)
end

--[[
    Signs the user in using a Twitch access token.
    https://docs.microsoft.com/rest/api/playfab/client/authentication/loginwithtwitch
--]]
function PlayFabClientApi:LoginWithTwitch(request)
    return Promise.new(function(resolve, reject)
         request.TitleId = PlayFabSettings.settings.titleId
        IPlayFabHttps.MakePlayFabApiCall("/Client/LoginWithTwitch", request or {}, nil, nil, resolve, reject)
    end)
end

--[[
    Completes the Windows Hello login flow by returning the signed value of the challange from GetWindowsHelloChallenge.
    Windows Hello has a 2 step client to server authentication scheme. Step one is to request from the server a challenge
    string. Step two is to request the user sign the string via Windows Hello and then send the signed value back to the
    server.
    https://docs.microsoft.com/rest/api/playfab/client/authentication/loginwithwindowshello
--]]
function PlayFabClientApi:LoginWithWindowsHello(request)
    return Promise.new(function(resolve, reject)
         request.TitleId = PlayFabSettings.settings.titleId
        IPlayFabHttps.MakePlayFabApiCall("/Client/LoginWithWindowsHello", request or {}, nil, nil, resolve, reject)
    end)
end

--[[
    Signs the user in using a Xbox Live Token, returning a session identifier that can subsequently be used for API calls
    which require an authenticated user
    https://docs.microsoft.com/rest/api/playfab/client/authentication/loginwithxbox
--]]
function PlayFabClientApi:LoginWithXbox(request)
    return Promise.new(function(resolve, reject)
         request.TitleId = PlayFabSettings.settings.titleId
        IPlayFabHttps.MakePlayFabApiCall("/Client/LoginWithXbox", request or {}, nil, nil, resolve, reject)
    end)
end

--[[
    Attempts to locate a game session matching the given parameters. If the goal is to match the player into a specific
    active session, only the LobbyId is required. Otherwise, the BuildVersion, GameMode, and Region are all required
    parameters. Note that parameters specified in the search are required (they are not weighting factors). If a slot is
    found in a server instance matching the parameters, the slot will be assigned to that player, removing it from the
    availabe set. In that case, the information on the game session will be returned, otherwise the Status returned will be
    GameNotFound.
    https://docs.microsoft.com/rest/api/playfab/client/matchmaking/matchmake
--]]
function PlayFabClientApi:Matchmake(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/Matchmake", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Opens a new outstanding trade. Note that a given item instance may only be in one open trade at a time.
    https://docs.microsoft.com/rest/api/playfab/client/trading/opentrade
--]]
function PlayFabClientApi:OpenTrade(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/OpenTrade", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Selects a payment option for purchase order created via StartPurchase
    https://docs.microsoft.com/rest/api/playfab/client/player-item-management/payforpurchase
--]]
function PlayFabClientApi:PayForPurchase(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/PayForPurchase", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Buys a single item with virtual currency. You must specify both the virtual currency to use to purchase, as well as what
    the client believes the price to be. This lets the server fail the purchase if the price has changed.
    https://docs.microsoft.com/rest/api/playfab/client/player-item-management/purchaseitem
--]]
function PlayFabClientApi:PurchaseItem(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/PurchaseItem", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Adds the virtual goods associated with the coupon to the user's inventory. Coupons can be generated via the
    Economy->Catalogs tab in the PlayFab Game Manager.
    https://docs.microsoft.com/rest/api/playfab/client/player-item-management/redeemcoupon
--]]
function PlayFabClientApi:RedeemCoupon(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/RedeemCoupon", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Uses the supplied OAuth code to refresh the internally cached player PSN auth token
    https://docs.microsoft.com/rest/api/playfab/client/platform-specific-methods/refreshpsnauthtoken
--]]
function PlayFabClientApi:RefreshPSNAuthToken(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/RefreshPSNAuthToken", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Registers the iOS device to receive push notifications
    https://docs.microsoft.com/rest/api/playfab/client/platform-specific-methods/registerforiospushnotification
--]]
function PlayFabClientApi:RegisterForIOSPushNotification(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/RegisterForIOSPushNotification", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Registers a new Playfab user account, returning a session identifier that can subsequently be used for API calls which
    require an authenticated user. You must supply either a username or an email address.
    https://docs.microsoft.com/rest/api/playfab/client/authentication/registerplayfabuser
--]]
function PlayFabClientApi:RegisterPlayFabUser(request)
    return Promise.new(function(resolve, reject)
         request.TitleId = PlayFabSettings.settings.titleId
        IPlayFabHttps.MakePlayFabApiCall("/Client/RegisterPlayFabUser", request or {}, nil, nil, resolve, reject)
    end)
end

--[[
    Registers a new PlayFab user account using Windows Hello authentication, returning a session ticket that can
    subsequently be used for API calls which require an authenticated user
    https://docs.microsoft.com/rest/api/playfab/client/authentication/registerwithwindowshello
--]]
function PlayFabClientApi:RegisterWithWindowsHello(request)
    return Promise.new(function(resolve, reject)
         request.TitleId = PlayFabSettings.settings.titleId
        IPlayFabHttps.MakePlayFabApiCall("/Client/RegisterWithWindowsHello", request or {}, nil, nil, resolve, reject)
    end)
end

--[[
    Removes a contact email from the player's profile.
    https://docs.microsoft.com/rest/api/playfab/client/account-management/removecontactemail
--]]
function PlayFabClientApi:RemoveContactEmail(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/RemoveContactEmail", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Removes a specified user from the friend list of the local user
    https://docs.microsoft.com/rest/api/playfab/client/friend-list-management/removefriend
--]]
function PlayFabClientApi:RemoveFriend(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/RemoveFriend", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Removes the specified generic service identifier from the player's PlayFab account.
    https://docs.microsoft.com/rest/api/playfab/client/account-management/removegenericid
--]]
function PlayFabClientApi:RemoveGenericID(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/RemoveGenericID", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Removes users from the set of those able to update the shared data and the set of users in the group. Only users in the
    group can remove members. If as a result of the call, zero users remain with access, the group and its associated data
    will be deleted. Shared Groups are designed for sharing data between a very small number of players, please see our
    guide: https://docs.microsoft.com/gaming/playfab/features/social/groups/using-shared-group-data
    https://docs.microsoft.com/rest/api/playfab/client/shared-group-data/removesharedgroupmembers
--]]
function PlayFabClientApi:RemoveSharedGroupMembers(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/RemoveSharedGroupMembers", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Report player's ad activity
    https://docs.microsoft.com/rest/api/playfab/client/advertising/reportadactivity
--]]
function PlayFabClientApi:ReportAdActivity(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/ReportAdActivity", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Write a PlayStream event to describe the provided player device information. This API method is not designed to be
    called directly by developers. Each PlayFab client SDK will eventually report this information automatically.
    https://docs.microsoft.com/rest/api/playfab/client/analytics/reportdeviceinfo
--]]
function PlayFabClientApi:ReportDeviceInfo(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/ReportDeviceInfo", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Submit a report for another player (due to bad bahavior, etc.), so that customer service representatives for the title
    can take action concerning potentially toxic players.
    https://docs.microsoft.com/rest/api/playfab/client/account-management/reportplayer
--]]
function PlayFabClientApi:ReportPlayer(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/ReportPlayer", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Restores all in-app purchases based on the given restore receipt
    https://docs.microsoft.com/rest/api/playfab/client/platform-specific-methods/restoreiospurchases
--]]
function PlayFabClientApi:RestoreIOSPurchases(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/RestoreIOSPurchases", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Reward player's ad activity
    https://docs.microsoft.com/rest/api/playfab/client/advertising/rewardadactivity
--]]
function PlayFabClientApi:RewardAdActivity(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/RewardAdActivity", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Forces an email to be sent to the registered email address for the user's account, with a link allowing the user to
    change the password.If an account recovery email template ID is provided, an email using the custom email template will
    be used.
    https://docs.microsoft.com/rest/api/playfab/client/account-management/sendaccountrecoveryemail
--]]
function PlayFabClientApi:SendAccountRecoveryEmail(request)
    return Promise.new(function(resolve, reject)
            IPlayFabHttps.MakePlayFabApiCall("/Client/SendAccountRecoveryEmail", request or {}, nil, nil, resolve, reject)
    end)
end

--[[
    Updates the tag list for a specified user in the friend list of the local user
    https://docs.microsoft.com/rest/api/playfab/client/friend-list-management/setfriendtags
--]]
function PlayFabClientApi:SetFriendTags(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/SetFriendTags", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Sets the player's secret if it is not already set. Player secrets are used to sign API requests. To reset a player's
    secret use the Admin or Server API method SetPlayerSecret.
    https://docs.microsoft.com/rest/api/playfab/client/authentication/setplayersecret
--]]
function PlayFabClientApi:SetPlayerSecret(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/SetPlayerSecret", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Start a new game server with a given configuration, add the current player and return the connection information.
    https://docs.microsoft.com/rest/api/playfab/client/matchmaking/startgame
--]]
function PlayFabClientApi:StartGame(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/StartGame", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Creates an order for a list of items from the title catalog
    https://docs.microsoft.com/rest/api/playfab/client/player-item-management/startpurchase
--]]
function PlayFabClientApi:StartPurchase(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/StartPurchase", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Decrements the user's balance of the specified virtual currency by the stated amount. It is possible to make a VC
    balance negative with this API.
    https://docs.microsoft.com/rest/api/playfab/client/player-item-management/subtractuservirtualcurrency
--]]
function PlayFabClientApi:SubtractUserVirtualCurrency(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/SubtractUserVirtualCurrency", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Unlinks the related Android device identifier from the user's PlayFab account
    https://docs.microsoft.com/rest/api/playfab/client/account-management/unlinkandroiddeviceid
--]]
function PlayFabClientApi:UnlinkAndroidDeviceID(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/UnlinkAndroidDeviceID", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Unlinks the related Apple account from the user's PlayFab account.
    https://docs.microsoft.com/rest/api/playfab/client/account-management/unlinkapple
--]]
function PlayFabClientApi:UnlinkApple(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/UnlinkApple", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Unlinks the related custom identifier from the user's PlayFab account
    https://docs.microsoft.com/rest/api/playfab/client/account-management/unlinkcustomid
--]]
function PlayFabClientApi:UnlinkCustomID(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/UnlinkCustomID", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Unlinks the related Facebook account from the user's PlayFab account
    https://docs.microsoft.com/rest/api/playfab/client/account-management/unlinkfacebookaccount
--]]
function PlayFabClientApi:UnlinkFacebookAccount(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/UnlinkFacebookAccount", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Unlinks the related Facebook Instant Game Ids from the user's PlayFab account
    https://docs.microsoft.com/rest/api/playfab/client/account-management/unlinkfacebookinstantgamesid
--]]
function PlayFabClientApi:UnlinkFacebookInstantGamesId(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/UnlinkFacebookInstantGamesId", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Unlinks the related Game Center account from the user's PlayFab account
    https://docs.microsoft.com/rest/api/playfab/client/account-management/unlinkgamecenteraccount
--]]
function PlayFabClientApi:UnlinkGameCenterAccount(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/UnlinkGameCenterAccount", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Unlinks the related Google account from the user's PlayFab account
    (https://developers.google.com/android/reference/com/google/android/gms/auth/GoogleAuthUtil#public-methods).
    https://docs.microsoft.com/rest/api/playfab/client/account-management/unlinkgoogleaccount
--]]
function PlayFabClientApi:UnlinkGoogleAccount(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/UnlinkGoogleAccount", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Unlinks the related iOS device identifier from the user's PlayFab account
    https://docs.microsoft.com/rest/api/playfab/client/account-management/unlinkiosdeviceid
--]]
function PlayFabClientApi:UnlinkIOSDeviceID(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/UnlinkIOSDeviceID", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Unlinks the related Kongregate identifier from the user's PlayFab account
    https://docs.microsoft.com/rest/api/playfab/client/account-management/unlinkkongregate
--]]
function PlayFabClientApi:UnlinkKongregate(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/UnlinkKongregate", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Unlinks the related Nintendo account from the user's PlayFab account.
    https://docs.microsoft.com/rest/api/playfab/client/account-management/unlinknintendoserviceaccount
--]]
function PlayFabClientApi:UnlinkNintendoServiceAccount(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/UnlinkNintendoServiceAccount", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Unlinks the related NintendoSwitchDeviceId from the user's PlayFab account
    https://docs.microsoft.com/rest/api/playfab/client/account-management/unlinknintendoswitchdeviceid
--]]
function PlayFabClientApi:UnlinkNintendoSwitchDeviceId(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/UnlinkNintendoSwitchDeviceId", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Unlinks an OpenID Connect account from a user's PlayFab account, based on the connection ID of an existing relationship
    between a title and an Open ID Connect provider.
    https://docs.microsoft.com/rest/api/playfab/client/account-management/unlinkopenidconnect
--]]
function PlayFabClientApi:UnlinkOpenIdConnect(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/UnlinkOpenIdConnect", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Unlinks the related PSN account from the user's PlayFab account
    https://docs.microsoft.com/rest/api/playfab/client/account-management/unlinkpsnaccount
--]]
function PlayFabClientApi:UnlinkPSNAccount(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/UnlinkPSNAccount", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Unlinks the related Steam account from the user's PlayFab account
    https://docs.microsoft.com/rest/api/playfab/client/account-management/unlinksteamaccount
--]]
function PlayFabClientApi:UnlinkSteamAccount(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/UnlinkSteamAccount", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Unlinks the related Twitch account from the user's PlayFab account.
    https://docs.microsoft.com/rest/api/playfab/client/account-management/unlinktwitch
--]]
function PlayFabClientApi:UnlinkTwitch(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/UnlinkTwitch", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Unlink Windows Hello authentication from the current PlayFab Account
    https://docs.microsoft.com/rest/api/playfab/client/account-management/unlinkwindowshello
--]]
function PlayFabClientApi:UnlinkWindowsHello(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/UnlinkWindowsHello", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Unlinks the related Xbox Live account from the user's PlayFab account
    https://docs.microsoft.com/rest/api/playfab/client/account-management/unlinkxboxaccount
--]]
function PlayFabClientApi:UnlinkXboxAccount(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/UnlinkXboxAccount", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Opens the specified container, with the specified key (when required), and returns the contents of the opened container.
    If the container (and key when relevant) are consumable (RemainingUses > 0), their RemainingUses will be decremented,
    consistent with the operation of ConsumeItem.
    https://docs.microsoft.com/rest/api/playfab/client/player-item-management/unlockcontainerinstance
--]]
function PlayFabClientApi:UnlockContainerInstance(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/UnlockContainerInstance", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Searches target inventory for an ItemInstance matching the given CatalogItemId, if necessary unlocks it using an
    appropriate key, and returns the contents of the opened container. If the container (and key when relevant) are
    consumable (RemainingUses > 0), their RemainingUses will be decremented, consistent with the operation of ConsumeItem.
    https://docs.microsoft.com/rest/api/playfab/client/player-item-management/unlockcontaineritem
--]]
function PlayFabClientApi:UnlockContainerItem(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/UnlockContainerItem", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Update the avatar URL of the player
    https://docs.microsoft.com/rest/api/playfab/client/account-management/updateavatarurl
--]]
function PlayFabClientApi:UpdateAvatarUrl(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/UpdateAvatarUrl", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Creates and updates the title-specific custom data for the user's character which is readable and writable by the client
    https://docs.microsoft.com/rest/api/playfab/client/character-data/updatecharacterdata
--]]
function PlayFabClientApi:UpdateCharacterData(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/UpdateCharacterData", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Updates the values of the specified title-specific statistics for the specific character. By default, clients are not
    permitted to update statistics. Developers may override this setting in the Game Manager > Settings > API Features.
    https://docs.microsoft.com/rest/api/playfab/client/characters/updatecharacterstatistics
--]]
function PlayFabClientApi:UpdateCharacterStatistics(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/UpdateCharacterStatistics", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Updates the values of the specified title-specific statistics for the user. By default, clients are not permitted to
    update statistics. Developers may override this setting in the Game Manager > Settings > API Features.
    https://docs.microsoft.com/rest/api/playfab/client/player-data-management/updateplayerstatistics
--]]
function PlayFabClientApi:UpdatePlayerStatistics(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/UpdatePlayerStatistics", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Adds, updates, and removes data keys for a shared group object. If the permission is set to Public, all fields updated
    or added in this call will be readable by users not in the group. By default, data permissions are set to Private.
    Regardless of the permission setting, only members of the group can update the data. Shared Groups are designed for
    sharing data between a very small number of players, please see our guide:
    https://docs.microsoft.com/gaming/playfab/features/social/groups/using-shared-group-data
    https://docs.microsoft.com/rest/api/playfab/client/shared-group-data/updatesharedgroupdata
--]]
function PlayFabClientApi:UpdateSharedGroupData(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/UpdateSharedGroupData", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Creates and updates the title-specific custom data for the user which is readable and writable by the client
    https://docs.microsoft.com/rest/api/playfab/client/player-data-management/updateuserdata
--]]
function PlayFabClientApi:UpdateUserData(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/UpdateUserData", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Creates and updates the publisher-specific custom data for the user which is readable and writable by the client
    https://docs.microsoft.com/rest/api/playfab/client/player-data-management/updateuserpublisherdata
--]]
function PlayFabClientApi:UpdateUserPublisherData(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/UpdateUserPublisherData", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Updates the title specific display name for the user
    https://docs.microsoft.com/rest/api/playfab/client/account-management/updateusertitledisplayname
--]]
function PlayFabClientApi:UpdateUserTitleDisplayName(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/UpdateUserTitleDisplayName", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Validates with Amazon that the receipt for an Amazon App Store in-app purchase is valid and that it matches the
    purchased catalog item
    https://docs.microsoft.com/rest/api/playfab/client/platform-specific-methods/validateamazoniapreceipt
--]]
function PlayFabClientApi:ValidateAmazonIAPReceipt(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/ValidateAmazonIAPReceipt", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Validates a Google Play purchase and gives the corresponding item to the player.
    https://docs.microsoft.com/rest/api/playfab/client/platform-specific-methods/validategoogleplaypurchase
--]]
function PlayFabClientApi:ValidateGooglePlayPurchase(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/ValidateGooglePlayPurchase", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Validates with the Apple store that the receipt for an iOS in-app purchase is valid and that it matches the purchased
    catalog item
    https://docs.microsoft.com/rest/api/playfab/client/platform-specific-methods/validateiosreceipt
--]]
function PlayFabClientApi:ValidateIOSReceipt(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/ValidateIOSReceipt", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Validates with Windows that the receipt for an Windows App Store in-app purchase is valid and that it matches the
    purchased catalog item
    https://docs.microsoft.com/rest/api/playfab/client/platform-specific-methods/validatewindowsstorereceipt
--]]
function PlayFabClientApi:ValidateWindowsStoreReceipt(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/ValidateWindowsStoreReceipt", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Writes a character-based event into PlayStream.
    https://docs.microsoft.com/rest/api/playfab/client/analytics/writecharacterevent
--]]
function PlayFabClientApi:WriteCharacterEvent(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/WriteCharacterEvent", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Writes a player-based event into PlayStream.
    https://docs.microsoft.com/rest/api/playfab/client/analytics/writeplayerevent
--]]
function PlayFabClientApi:WritePlayerEvent(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/WritePlayerEvent", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

--[[
    Writes a title-based event into PlayStream.
    https://docs.microsoft.com/rest/api/playfab/client/analytics/writetitleevent
--]]
function PlayFabClientApi:WriteTitleEvent(sessionTicket, request)
    return Promise.new(function(resolve, reject)
         if (not sessionTicket) then reject("Must provide a sessionTicket to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Client/WriteTitleEvent", request or {}, "X-Authorization", sessionTicket, resolve, reject)
    end)
end

return PlayFabClientApi
