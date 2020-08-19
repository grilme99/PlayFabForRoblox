/// <reference path="ClientApi.d.ts" />

import MakeRequest from './HTTP'
import Settings from './Settings'
import { PlayerData, IsClientLoggedIn } from './PlayFab'

/**
 * Accepts an open trade (one that has not yet been accepted or cancelled), if the locally signed-in player is in the
 * allowed player list for the trade, or it is open to all players. If the call is successful, the offered and accepted
 * items will be swapped between the two players' inventories.
 * https://docs.microsoft.com/rest/api/playfab/client/trading/accepttrade
 */
export const AcceptTrade = async (player: Player, request: AcceptTradeRequest) => {
    const data = PlayerData.get(player)
    if ((!IsClientLoggedIn(player)) || (!data)) throw 'Must be logged in to call this method'
    const result = await MakeRequest<AcceptTradeResponse>('/Client/AcceptTrade', request, 'X-Authorization', data.SessionTicket)
    return result
}

/**
 * Adds the PlayFab user, based upon a match against a supplied unique identifier, to the friend list of the local user. At
 * least one of FriendPlayFabId,FriendUsername,FriendEmail, or FriendTitleDisplayName should be initialized.
 * https://docs.microsoft.com/rest/api/playfab/client/friend-list-management/addfriend
 */
export const AddFriend = async (player: Player, request: AddFriendRequest) => {
    const data = PlayerData.get(player)
    if ((!IsClientLoggedIn(player)) || (!data)) throw 'Must be logged in to call this method'
    const result = await MakeRequest<AddFriendResult>('/Client/AddFriend', request, 'X-Authorization', data.SessionTicket)
    return result
}

/**
 * Adds the specified generic service identifier to the player's PlayFab account. This is designed to allow for a PlayFab
 * ID lookup of any arbitrary service identifier a title wants to add. This identifier should never be used as
 * authentication credentials, as the intent is that it is easily accessible by other players.
 * https://docs.microsoft.com/rest/api/playfab/client/account-management/addgenericid
 */
export const AddGenericID = async (player: Player, request: AddGenericIDRequest) => {
    const data = PlayerData.get(player)
    if ((!IsClientLoggedIn(player)) || (!data)) throw 'Must be logged in to call this method'
    const result = await MakeRequest<AddGenericIDResult>('/Client/AddGenericID', request, 'X-Authorization', data.SessionTicket)
    return result
}

/**
 * Adds users to the set of those able to update both the shared data, as well as the set of users in the group. Only users
 * in the group can add new members. Shared Groups are designed for sharing data between a very small number of players,
 * please see our guide: https://docs.microsoft.com/gaming/playfab/features/social/groups/using-shared-group-data
 * https://docs.microsoft.com/rest/api/playfab/client/shared-group-data/addsharedgroupmembers
 */
export const AddSharedGroupMembers = async (player: Player, request: AddSharedGroupMembersRequest) => {
    const data = PlayerData.get(player)
    if ((!IsClientLoggedIn(player)) || (!data)) throw 'Must be logged in to call this method'
    const result = await MakeRequest<AddSharedGroupMembersResult>('/Client/AddSharedGroupMembers', request, 'X-Authorization', data.SessionTicket)
    return result
}

/**
 * Increments the user's balance of the specified virtual currency by the stated amount
 * https://docs.microsoft.com/rest/api/playfab/client/player-item-management/adduservirtualcurrency
 */
export const AddUserVirtualCurrency = async (player: Player, request: AddUserVirtualCurrencyRequest) => {
    const data = PlayerData.get(player)
    if ((!IsClientLoggedIn(player)) || (!data)) throw 'Must be logged in to call this method'
    const result = await MakeRequest<EmptyResult>('/Client/AddUserVirtualCurrency', request, 'X-Authorization', data.SessionTicket)
    return result
}

/**
 * Cancels an open trade (one that has not yet been accepted or cancelled). Note that only the player who created the trade
 * can cancel it via this API call, to prevent griefing of the trade system (cancelling trades in order to prevent other
 * players from accepting them, for trades that can be claimed by more than one player).
 * https://docs.microsoft.com/rest/api/playfab/client/trading/canceltrade
 */
export const CancelTrade = async (player: Player, request: CancelTradeRequest) => {
    const data = PlayerData.get(player)
    if ((!IsClientLoggedIn(player)) || (!data)) throw 'Must be logged in to call this method'
    const result = await MakeRequest<CancelTradeResponse>('/Client/CancelTrade', request, 'X-Authorization', data.SessionTicket)
    return result
}

/**
 * Confirms with the payment provider that the purchase was approved (if applicable) and adjusts inventory and virtual
 * currency balances as appropriate
 * https://docs.microsoft.com/rest/api/playfab/client/player-item-management/confirmpurchase
 */
export const ConfirmPurchase = async (player: Player, request: ConfirmPurchaseRequest) => {
    const data = PlayerData.get(player)
    if ((!IsClientLoggedIn(player)) || (!data)) throw 'Must be logged in to call this method'
    const result = await MakeRequest<ConfirmPurchaseResult>('/Client/ConfirmPurchase', request, 'X-Authorization', data.SessionTicket)
    return result
}

/**
 * Consume uses of a consumable item. When all uses are consumed, it will be removed from the player's inventory.
 * https://docs.microsoft.com/rest/api/playfab/client/player-item-management/consumeitem
 */
export const ConsumeItem = async (player: Player, request: ConsumeItemRequest) => {
    const data = PlayerData.get(player)
    if ((!IsClientLoggedIn(player)) || (!data)) throw 'Must be logged in to call this method'
    const result = await MakeRequest<ConsumeItemResult>('/Client/ConsumeItem', request, 'X-Authorization', data.SessionTicket)
    return result
}

/**
 * Requests the creation of a shared group object, containing key/value pairs which may be updated by all members of the
 * group. Upon creation, the current user will be the only member of the group. Shared Groups are designed for sharing data
 * between a very small number of players, please see our guide:
 * https://docs.microsoft.com/gaming/playfab/features/social/groups/using-shared-group-data
 * https://docs.microsoft.com/rest/api/playfab/client/shared-group-data/createsharedgroup
 */
export const CreateSharedGroup = async (player: Player, request: CreateSharedGroupRequest) => {
    const data = PlayerData.get(player)
    if ((!IsClientLoggedIn(player)) || (!data)) throw 'Must be logged in to call this method'
    const result = await MakeRequest<CreateSharedGroupResult>('/Client/CreateSharedGroup', request, 'X-Authorization', data.SessionTicket)
    return result
}

/**
 * Executes a CloudScript function, with the 'currentPlayerId' set to the PlayFab ID of the authenticated player.
 * https://docs.microsoft.com/rest/api/playfab/client/server-side-cloud-script/executecloudscript
 */
export const ExecuteCloudScript = async (player: Player, request: ExecuteCloudScriptRequest) => {
    const data = PlayerData.get(player)
    if ((!IsClientLoggedIn(player)) || (!data)) throw 'Must be logged in to call this method'
    const result = await MakeRequest<ExecuteCloudScriptResult>('/Client/ExecuteCloudScript', request, 'X-Authorization', data.SessionTicket)
    return result
}

/**
 * Retrieves the user's PlayFab account details
 * https://docs.microsoft.com/rest/api/playfab/client/account-management/getaccountinfo
 */
export const GetAccountInfo = async (player: Player, request: GetAccountInfoRequest) => {
    const data = PlayerData.get(player)
    if ((!IsClientLoggedIn(player)) || (!data)) throw 'Must be logged in to call this method'
    const result = await MakeRequest<GetAccountInfoResult>('/Client/GetAccountInfo', request, 'X-Authorization', data.SessionTicket)
    return result
}

/**
 * Lists all of the characters that belong to a specific user. CharacterIds are not globally unique; characterId must be
 * evaluated with the parent PlayFabId to guarantee uniqueness.
 * https://docs.microsoft.com/rest/api/playfab/client/characters/getalluserscharacters
 */
export const GetAllUsersCharacters = async (player: Player, request: ListUsersCharactersRequest) => {
    const data = PlayerData.get(player)
    if ((!IsClientLoggedIn(player)) || (!data)) throw 'Must be logged in to call this method'
    const result = await MakeRequest<ListUsersCharactersResult>('/Client/GetAllUsersCharacters', request, 'X-Authorization', data.SessionTicket)
    return result
}

/**
 * Retrieves the specified version of the title's catalog of virtual goods, including all defined properties
 * https://docs.microsoft.com/rest/api/playfab/client/title-wide-data-management/getcatalogitems
 */
export const GetCatalogItems = async (player: Player, request: GetCatalogItemsRequest) => {
    const data = PlayerData.get(player)
    if ((!IsClientLoggedIn(player)) || (!data)) throw 'Must be logged in to call this method'
    const result = await MakeRequest<GetCatalogItemsResult>('/Client/GetCatalogItems', request, 'X-Authorization', data.SessionTicket)
    return result
}

/**
 * Retrieves the title-specific custom data for the character which is readable and writable by the client
 * https://docs.microsoft.com/rest/api/playfab/client/character-data/getcharacterdata
 */
export const GetCharacterData = async (player: Player, request: GetCharacterDataRequest) => {
    const data = PlayerData.get(player)
    if ((!IsClientLoggedIn(player)) || (!data)) throw 'Must be logged in to call this method'
    const result = await MakeRequest<GetCharacterDataResult>('/Client/GetCharacterData', request, 'X-Authorization', data.SessionTicket)
    return result
}

/**
 * Retrieves the specified character's current inventory of virtual goods
 * https://docs.microsoft.com/rest/api/playfab/client/player-item-management/getcharacterinventory
 */
export const GetCharacterInventory = async (player: Player, request: GetCharacterInventoryRequest) => {
    const data = PlayerData.get(player)
    if ((!IsClientLoggedIn(player)) || (!data)) throw 'Must be logged in to call this method'
    const result = await MakeRequest<GetCharacterInventoryResult>('/Client/GetCharacterInventory', request, 'X-Authorization', data.SessionTicket)
    return result
}

/**
 * Retrieves a list of ranked characters for the given statistic, starting from the indicated point in the leaderboard
 * https://docs.microsoft.com/rest/api/playfab/client/characters/getcharacterleaderboard
 */
export const GetCharacterLeaderboard = async (player: Player, request: GetCharacterLeaderboardRequest) => {
    const data = PlayerData.get(player)
    if ((!IsClientLoggedIn(player)) || (!data)) throw 'Must be logged in to call this method'
    const result = await MakeRequest<GetCharacterLeaderboardResult>('/Client/GetCharacterLeaderboard', request, 'X-Authorization', data.SessionTicket)
    return result
}

/**
 * Retrieves the title-specific custom data for the character which can only be read by the client
 * https://docs.microsoft.com/rest/api/playfab/client/character-data/getcharacterreadonlydata
 */
export const GetCharacterReadOnlyData = async (player: Player, request: GetCharacterDataRequest) => {
    const data = PlayerData.get(player)
    if ((!IsClientLoggedIn(player)) || (!data)) throw 'Must be logged in to call this method'
    const result = await MakeRequest<GetCharacterDataResult>('/Client/GetCharacterReadOnlyData', request, 'X-Authorization', data.SessionTicket)
    return result
}

/**
 * Retrieves the details of all title-specific statistics for the user
 * https://docs.microsoft.com/rest/api/playfab/client/characters/getcharacterstatistics
 */
export const GetCharacterStatistics = async (player: Player, request: GetCharacterStatisticsRequest) => {
    const data = PlayerData.get(player)
    if ((!IsClientLoggedIn(player)) || (!data)) throw 'Must be logged in to call this method'
    const result = await MakeRequest<GetCharacterStatisticsResult>('/Client/GetCharacterStatistics', request, 'X-Authorization', data.SessionTicket)
    return result
}

/**
 * This API retrieves a pre-signed URL for accessing a content file for the title. A subsequent HTTP GET to the returned
 * URL will attempt to download the content. A HEAD query to the returned URL will attempt to retrieve the metadata of the
 * content. Note that a successful result does not guarantee the existence of this content - if it has not been uploaded,
 * the query to retrieve the data will fail. See this post for more information:
 * https://community.playfab.com/hc/community/posts/205469488-How-to-upload-files-to-PlayFab-s-Content-Service. Also,
 * please be aware that the Content service is specifically PlayFab's CDN offering, for which standard CDN rates apply.
 * https://docs.microsoft.com/rest/api/playfab/client/content/getcontentdownloadurl
 */
export const GetContentDownloadUrl = async (player: Player, request: GetContentDownloadUrlRequest) => {
    const data = PlayerData.get(player)
    if ((!IsClientLoggedIn(player)) || (!data)) throw 'Must be logged in to call this method'
    const result = await MakeRequest<GetContentDownloadUrlResult>('/Client/GetContentDownloadUrl', request, 'X-Authorization', data.SessionTicket)
    return result
}

/**
 * Retrieves a list of ranked friends of the current player for the given statistic, starting from the indicated point in
 * the leaderboard
 * https://docs.microsoft.com/rest/api/playfab/client/player-data-management/getfriendleaderboard
 */
export const GetFriendLeaderboard = async (player: Player, request: GetFriendLeaderboardRequest) => {
    const data = PlayerData.get(player)
    if ((!IsClientLoggedIn(player)) || (!data)) throw 'Must be logged in to call this method'
    const result = await MakeRequest<GetLeaderboardResult>('/Client/GetFriendLeaderboard', request, 'X-Authorization', data.SessionTicket)
    return result
}

/**
 * Retrieves a list of ranked friends of the current player for the given statistic, centered on the requested PlayFab
 * user. If PlayFabId is empty or null will return currently logged in user.
 * https://docs.microsoft.com/rest/api/playfab/client/player-data-management/getfriendleaderboardaroundplayer
 */
export const GetFriendLeaderboardAroundPlayer = async (player: Player, request: GetFriendLeaderboardAroundPlayerRequest) => {
    const data = PlayerData.get(player)
    if ((!IsClientLoggedIn(player)) || (!data)) throw 'Must be logged in to call this method'
    const result = await MakeRequest<GetFriendLeaderboardAroundPlayerResult>('/Client/GetFriendLeaderboardAroundPlayer', request, 'X-Authorization', data.SessionTicket)
    return result
}

/**
 * Retrieves the current friend list for the local user, constrained to users who have PlayFab accounts. Friends from
 * linked accounts (Facebook, Steam) are also included. You may optionally exclude some linked services' friends.
 * https://docs.microsoft.com/rest/api/playfab/client/friend-list-management/getfriendslist
 */
export const GetFriendsList = async (player: Player, request: GetFriendsListRequest) => {
    const data = PlayerData.get(player)
    if ((!IsClientLoggedIn(player)) || (!data)) throw 'Must be logged in to call this method'
    const result = await MakeRequest<GetFriendsListResult>('/Client/GetFriendsList', request, 'X-Authorization', data.SessionTicket)
    return result
}

/**
 * Retrieves a list of ranked users for the given statistic, starting from the indicated point in the leaderboard
 * https://docs.microsoft.com/rest/api/playfab/client/player-data-management/getleaderboard
 */
export const GetLeaderboard = async (player: Player, request: GetLeaderboardRequest) => {
    const data = PlayerData.get(player)
    if ((!IsClientLoggedIn(player)) || (!data)) throw 'Must be logged in to call this method'
    const result = await MakeRequest<GetLeaderboardResult>('/Client/GetLeaderboard', request, 'X-Authorization', data.SessionTicket)
    return result
}

/**
 * Retrieves a list of ranked characters for the given statistic, centered on the requested Character ID
 * https://docs.microsoft.com/rest/api/playfab/client/characters/getleaderboardaroundcharacter
 */
export const GetLeaderboardAroundCharacter = async (player: Player, request: GetLeaderboardAroundCharacterRequest) => {
    const data = PlayerData.get(player)
    if ((!IsClientLoggedIn(player)) || (!data)) throw 'Must be logged in to call this method'
    const result = await MakeRequest<GetLeaderboardAroundCharacterResult>('/Client/GetLeaderboardAroundCharacter', request, 'X-Authorization', data.SessionTicket)
    return result
}

/**
 * Retrieves a list of ranked users for the given statistic, centered on the requested player. If PlayFabId is empty or
 * null will return currently logged in user.
 * https://docs.microsoft.com/rest/api/playfab/client/player-data-management/getleaderboardaroundplayer
 */
export const GetLeaderboardAroundPlayer = async (player: Player, request: GetLeaderboardAroundPlayerRequest) => {
    const data = PlayerData.get(player)
    if ((!IsClientLoggedIn(player)) || (!data)) throw 'Must be logged in to call this method'
    const result = await MakeRequest<GetLeaderboardAroundPlayerResult>('/Client/GetLeaderboardAroundPlayer', request, 'X-Authorization', data.SessionTicket)
    return result
}

/**
 * Retrieves all of the user's different kinds of info.
 * https://docs.microsoft.com/rest/api/playfab/client/account-management/getplayercombinedinfo
 */
export const GetPlayerCombinedInfo = async (player: Player, request: GetPlayerCombinedInfoRequest) => {
    const data = PlayerData.get(player)
    if ((!IsClientLoggedIn(player)) || (!data)) throw 'Must be logged in to call this method'
    const result = await MakeRequest<GetPlayerCombinedInfoResult>('/Client/GetPlayerCombinedInfo', request, 'X-Authorization', data.SessionTicket)
    return result
}

/**
 * Retrieves the player's profile
 * https://docs.microsoft.com/rest/api/playfab/client/account-management/getplayerprofile
 */
export const GetPlayerProfile = async (player: Player, request: GetPlayerProfileRequest) => {
    const data = PlayerData.get(player)
    if ((!IsClientLoggedIn(player)) || (!data)) throw 'Must be logged in to call this method'
    const result = await MakeRequest<GetPlayerProfileResult>('/Client/GetPlayerProfile', request, 'X-Authorization', data.SessionTicket)
    return result
}

/**
 * List all segments that a player currently belongs to at this moment in time.
 * https://docs.microsoft.com/rest/api/playfab/client/playstream/getplayersegments
 */
export const GetPlayerSegments = async (player: Player, request: GetPlayerSegmentsRequest) => {
    const data = PlayerData.get(player)
    if ((!IsClientLoggedIn(player)) || (!data)) throw 'Must be logged in to call this method'
    const result = await MakeRequest<GetPlayerSegmentsResult>('/Client/GetPlayerSegments', request, 'X-Authorization', data.SessionTicket)
    return result
}

/**
 * Retrieves the indicated statistics (current version and values for all statistics, if none are specified), for the local
 * player.
 * https://docs.microsoft.com/rest/api/playfab/client/player-data-management/getplayerstatistics
 */
export const GetPlayerStatistics = async (player: Player, request: GetPlayerStatisticsRequest) => {
    const data = PlayerData.get(player)
    if ((!IsClientLoggedIn(player)) || (!data)) throw 'Must be logged in to call this method'
    const result = await MakeRequest<GetPlayerStatisticsResult>('/Client/GetPlayerStatistics', request, 'X-Authorization', data.SessionTicket)
    return result
}

/**
 * Retrieves the information on the available versions of the specified statistic.
 * https://docs.microsoft.com/rest/api/playfab/client/player-data-management/getplayerstatisticversions
 */
export const GetPlayerStatisticVersions = async (player: Player, request: GetPlayerStatisticVersionsRequest) => {
    const data = PlayerData.get(player)
    if ((!IsClientLoggedIn(player)) || (!data)) throw 'Must be logged in to call this method'
    const result = await MakeRequest<GetPlayerStatisticVersionsResult>('/Client/GetPlayerStatisticVersions', request, 'X-Authorization', data.SessionTicket)
    return result
}

/**
 * Get all tags with a given Namespace (optional) from a player profile.
 * https://docs.microsoft.com/rest/api/playfab/client/playstream/getplayertags
 */
export const GetPlayerTags = async (player: Player, request: GetPlayerTagsRequest) => {
    const data = PlayerData.get(player)
    if ((!IsClientLoggedIn(player)) || (!data)) throw 'Must be logged in to call this method'
    const result = await MakeRequest<GetPlayerTagsResult>('/Client/GetPlayerTags', request, 'X-Authorization', data.SessionTicket)
    return result
}

/**
 * Gets all trades the player has either opened or accepted, optionally filtered by trade status.
 * https://docs.microsoft.com/rest/api/playfab/client/trading/getplayertrades
 */
export const GetPlayerTrades = async (player: Player, request: GetPlayerTradesRequest) => {
    const data = PlayerData.get(player)
    if ((!IsClientLoggedIn(player)) || (!data)) throw 'Must be logged in to call this method'
    const result = await MakeRequest<GetPlayerTradesResponse>('/Client/GetPlayerTrades', request, 'X-Authorization', data.SessionTicket)
    return result
}

/**
 * Retrieves the unique PlayFab identifiers for the given set of generic service identifiers. A generic identifier is the
 * service name plus the service-specific ID for the player, as specified by the title when the generic identifier was
 * added to the player account.
 * https://docs.microsoft.com/rest/api/playfab/client/account-management/getplayfabidsfromgenericids
 */
export const GetPlayFabIDsFromGenericIDs = async (player: Player, request: GetPlayFabIDsFromGenericIDsRequest) => {
    const data = PlayerData.get(player)
    if ((!IsClientLoggedIn(player)) || (!data)) throw 'Must be logged in to call this method'
    const result = await MakeRequest<GetPlayFabIDsFromGenericIDsResult>('/Client/GetPlayFabIDsFromGenericIDs', request, 'X-Authorization', data.SessionTicket)
    return result
}

/**
 * Retrieves the key-value store of custom publisher settings
 * https://docs.microsoft.com/rest/api/playfab/client/title-wide-data-management/getpublisherdata
 */
export const GetPublisherData = async (player: Player, request: GetPublisherDataRequest) => {
    const data = PlayerData.get(player)
    if ((!IsClientLoggedIn(player)) || (!data)) throw 'Must be logged in to call this method'
    const result = await MakeRequest<GetPublisherDataResult>('/Client/GetPublisherData', request, 'X-Authorization', data.SessionTicket)
    return result
}

/**
 * Retrieves a purchase along with its current PlayFab status. Returns inventory items from the purchase that are still
 * active.
 * https://docs.microsoft.com/rest/api/playfab/client/player-item-management/getpurchase
 */
export const GetPurchase = async (player: Player, request: GetPurchaseRequest) => {
    const data = PlayerData.get(player)
    if ((!IsClientLoggedIn(player)) || (!data)) throw 'Must be logged in to call this method'
    const result = await MakeRequest<GetPurchaseResult>('/Client/GetPurchase', request, 'X-Authorization', data.SessionTicket)
    return result
}

/**
 * Retrieves data stored in a shared group object, as well as the list of members in the group. Non-members of the group
 * may use this to retrieve group data, including membership, but they will not receive data for keys marked as private.
 * Shared Groups are designed for sharing data between a very small number of players, please see our guide:
 * https://docs.microsoft.com/gaming/playfab/features/social/groups/using-shared-group-data
 * https://docs.microsoft.com/rest/api/playfab/client/shared-group-data/getsharedgroupdata
 */
export const GetSharedGroupData = async (player: Player, request: GetSharedGroupDataRequest) => {
    const data = PlayerData.get(player)
    if ((!IsClientLoggedIn(player)) || (!data)) throw 'Must be logged in to call this method'
    const result = await MakeRequest<GetSharedGroupDataResult>('/Client/GetSharedGroupData', request, 'X-Authorization', data.SessionTicket)
    return result
}

/**
 * Retrieves the set of items defined for the specified store, including all prices defined
 * https://docs.microsoft.com/rest/api/playfab/client/title-wide-data-management/getstoreitems
 */
export const GetStoreItems = async (player: Player, request: GetStoreItemsRequest) => {
    const data = PlayerData.get(player)
    if ((!IsClientLoggedIn(player)) || (!data)) throw 'Must be logged in to call this method'
    const result = await MakeRequest<GetStoreItemsResult>('/Client/GetStoreItems', request, 'X-Authorization', data.SessionTicket)
    return result
}

/**
 * Retrieves the current server time
 * https://docs.microsoft.com/rest/api/playfab/client/title-wide-data-management/gettime
 */
export const GetTime = async (player: Player, request: GetTimeRequest) => {
    const data = PlayerData.get(player)
    if ((!IsClientLoggedIn(player)) || (!data)) throw 'Must be logged in to call this method'
    const result = await MakeRequest<GetTimeResult>('/Client/GetTime', request, 'X-Authorization', data.SessionTicket)
    return result
}

/**
 * Retrieves the key-value store of custom title settings
 * https://docs.microsoft.com/rest/api/playfab/client/title-wide-data-management/gettitledata
 */
export const GetTitleData = async (player: Player, request: GetTitleDataRequest) => {
    const data = PlayerData.get(player)
    if ((!IsClientLoggedIn(player)) || (!data)) throw 'Must be logged in to call this method'
    const result = await MakeRequest<GetTitleDataResult>('/Client/GetTitleData', request, 'X-Authorization', data.SessionTicket)
    return result
}

/**
 * Retrieves the title news feed, as configured in the developer portal
 * https://docs.microsoft.com/rest/api/playfab/client/title-wide-data-management/gettitlenews
 */
export const GetTitleNews = async (player: Player, request: GetTitleNewsRequest) => {
    const data = PlayerData.get(player)
    if ((!IsClientLoggedIn(player)) || (!data)) throw 'Must be logged in to call this method'
    const result = await MakeRequest<GetTitleNewsResult>('/Client/GetTitleNews', request, 'X-Authorization', data.SessionTicket)
    return result
}

/**
 * Returns the title's base 64 encoded RSA CSP blob.
 * https://docs.microsoft.com/rest/api/playfab/client/authentication/gettitlepublickey
 */
export const GetTitlePublicKey = async (player: Player, request: GetTitlePublicKeyRequest) => {
    const data = PlayerData.get(player)
    if ((!IsClientLoggedIn(player)) || (!data)) throw 'Must be logged in to call this method'
    const result = await MakeRequest<GetTitlePublicKeyResult>('/Client/GetTitlePublicKey', request, 'X-Authorization', data.SessionTicket)
    return result
}

/**
 * Gets the current status of an existing trade.
 * https://docs.microsoft.com/rest/api/playfab/client/trading/gettradestatus
 */
export const GetTradeStatus = async (player: Player, request: GetTradeStatusRequest) => {
    const data = PlayerData.get(player)
    if ((!IsClientLoggedIn(player)) || (!data)) throw 'Must be logged in to call this method'
    const result = await MakeRequest<GetTradeStatusResponse>('/Client/GetTradeStatus', request, 'X-Authorization', data.SessionTicket)
    return result
}

/**
 * Retrieves the title-specific custom data for the user which is readable and writable by the client
 * https://docs.microsoft.com/rest/api/playfab/client/player-data-management/getuserdata
 */
export const GetUserData = async (player: Player, request: GetUserDataRequest) => {
    const data = PlayerData.get(player)
    if ((!IsClientLoggedIn(player)) || (!data)) throw 'Must be logged in to call this method'
    const result = await MakeRequest<GetUserDataResult>('/Client/GetUserData', request, 'X-Authorization', data.SessionTicket)
    return result
}

/**
 * Retrieves the user's current inventory of virtual goods
 * https://docs.microsoft.com/rest/api/playfab/client/player-item-management/getuserinventory
 */
export const GetUserInventory = async (player: Player, request: GetUserInventoryRequest) => {
    const data = PlayerData.get(player)
    if ((!IsClientLoggedIn(player)) || (!data)) throw 'Must be logged in to call this method'
    const result = await MakeRequest<GetUserInventoryResult>('/Client/GetUserInventory', request, 'X-Authorization', data.SessionTicket)
    return result
}

/**
 * Retrieves the publisher-specific custom data for the user which is readable and writable by the client
 * https://docs.microsoft.com/rest/api/playfab/client/player-data-management/getuserpublisherdata
 */
export const GetUserPublisherData = async (player: Player, request: GetUserDataRequest) => {
    const data = PlayerData.get(player)
    if ((!IsClientLoggedIn(player)) || (!data)) throw 'Must be logged in to call this method'
    const result = await MakeRequest<GetUserDataResult>('/Client/GetUserPublisherData', request, 'X-Authorization', data.SessionTicket)
    return result
}

/**
 * Retrieves the publisher-specific custom data for the user which can only be read by the client
 * https://docs.microsoft.com/rest/api/playfab/client/player-data-management/getuserpublisherreadonlydata
 */
export const GetUserPublisherReadOnlyData = async (player: Player, request: GetUserDataRequest) => {
    const data = PlayerData.get(player)
    if ((!IsClientLoggedIn(player)) || (!data)) throw 'Must be logged in to call this method'
    const result = await MakeRequest<GetUserDataResult>('/Client/GetUserPublisherReadOnlyData', request, 'X-Authorization', data.SessionTicket)
    return result
}

/**
 * Retrieves the title-specific custom data for the user which can only be read by the client
 * https://docs.microsoft.com/rest/api/playfab/client/player-data-management/getuserreadonlydata
 */
export const GetUserReadOnlyData = async (player: Player, request: GetUserDataRequest) => {
    const data = PlayerData.get(player)
    if ((!IsClientLoggedIn(player)) || (!data)) throw 'Must be logged in to call this method'
    const result = await MakeRequest<GetUserDataResult>('/Client/GetUserReadOnlyData', request, 'X-Authorization', data.SessionTicket)
    return result
}

/**
 * Grants the specified character type to the user. CharacterIds are not globally unique; characterId must be evaluated
 * with the parent PlayFabId to guarantee uniqueness.
 * https://docs.microsoft.com/rest/api/playfab/client/characters/grantcharactertouser
 */
export const GrantCharacterToUser = async (player: Player, request: GrantCharacterToUserRequest) => {
    const data = PlayerData.get(player)
    if ((!IsClientLoggedIn(player)) || (!data)) throw 'Must be logged in to call this method'
    const result = await MakeRequest<GrantCharacterToUserResult>('/Client/GrantCharacterToUser', request, 'X-Authorization', data.SessionTicket)
    return result
}

/**
 * Links the custom identifier, generated by the title, to the user's PlayFab account
 * https://docs.microsoft.com/rest/api/playfab/client/account-management/linkcustomid
 */
export const LinkCustomID = async (player: Player, request: LinkCustomIDRequest) => {
    const data = PlayerData.get(player)
    if ((!IsClientLoggedIn(player)) || (!data)) throw 'Must be logged in to call this method'
    const result = await MakeRequest<LinkCustomIDResult>('/Client/LinkCustomID', request, 'X-Authorization', data.SessionTicket)
    return result
}

/**
 * Signs the user in using a custom unique identifier generated by the title, returning a session identifier that can 
 * subsequently be used for API calls which require an authenticated user.
 * https://docs.microsoft.com/rest/api/playfab/client/authentication/loginwithcustomid
 */
export const LoginWithCustomID = async (player: Player, request: LoginWithCustomIDRequest) => {
    if (!request.TitleId) request.TitleId = Settings.settings.titleId
    if (!request.TitleId) throw 'Must be have settings.titleId set to call this method'
    
    const result = await MakeRequest<LoginResult>(
        '/Client/LoginWithCustomID',
        request
    )

    if (!result.SessionTicket) throw 'No session ticket'
    if (!result.EntityToken || !result.EntityToken.EntityToken || !result.EntityToken.TokenExpiration) throw 'No entity token'
    
    PlayerData.set(player, {
        SessionTicket: result.SessionTicket,
        EntityToken: result.EntityToken.EntityToken,
        TokenExpiration: result.EntityToken.TokenExpiration
    })
}

/**
 * Attempts to locate a game session matching the given parameters. If the goal is to match the player into a specific
 * active session, only the LobbyId is required. Otherwise, the BuildVersion, GameMode, and Region are all required
 * parameters. Note that parameters specified in the search are required (they are not weighting factors). If a slot is
 * found in a server instance matching the parameters, the slot will be assigned to that player, removing it from the
 * availabe set. In that case, the information on the game session will be returned, otherwise the Status returned will be
 * GameNotFound.
 * https://docs.microsoft.com/rest/api/playfab/client/matchmaking/matchmake
 */
export const Matchmake = async (player: Player, request: MatchmakeRequest) => {
    const data = PlayerData.get(player)
    if ((!IsClientLoggedIn(player)) || (!data)) throw 'Must be logged in to call this method'
    const result = await MakeRequest<MatchmakeResult>('/Client/Matchmake', request, 'X-Authorization', data.SessionTicket)
    return result
}

/**
 * Opens a new outstanding trade. Note that a given item instance may only be in one open trade at a time.
 * https://docs.microsoft.com/rest/api/playfab/client/trading/opentrade
 */
export const OpenTrade = async (player: Player, request: OpenTradeRequest) => {
    const data = PlayerData.get(player)
    if ((!IsClientLoggedIn(player)) || (!data)) throw 'Must be logged in to call this method'
    const result = await MakeRequest<OpenTradeResponse>('/Client/OpenTrade', request, 'X-Authorization', data.SessionTicket)
    return result
}

/**
 * Selects a payment option for purchase order created via StartPurchase
 * https://docs.microsoft.com/rest/api/playfab/client/player-item-management/payforpurchase
 */
export const PayForPurchase = async (player: Player, request: PayForPurchaseRequest) => {
    const data = PlayerData.get(player)
    if ((!IsClientLoggedIn(player)) || (!data)) throw 'Must be logged in to call this method'
    const result = await MakeRequest<PayForPurchaseResult>('/Client/PayForPurchase', request, 'X-Authorization', data.SessionTicket)
    return result
}

/**
 * Buys a single item with virtual currency. You must specify both the virtual currency to use to purchase, as well as what
 * the client believes the price to be. This lets the server fail the purchase if the price has changed.
 * https://docs.microsoft.com/rest/api/playfab/client/player-item-management/purchaseitem
 */
export const PurchaseItem = async (player: Player, request: PurchaseItemRequest) => {
    const data = PlayerData.get(player)
    if ((!IsClientLoggedIn(player)) || (!data)) throw 'Must be logged in to call this method'
    const result = await MakeRequest<PurchaseItemResult>('/Client/PurchaseItem', request, 'X-Authorization', data.SessionTicket)
    return result
}

/**
 * Adds the virtual goods associated with the coupon to the user's inventory. Coupons can be generated via the
 * Economy->Catalogs tab in the PlayFab Game Manager.
 * https://docs.microsoft.com/rest/api/playfab/client/player-item-management/redeemcoupon
 */
export const RedeemCoupon = async (player: Player, request: RedeemCouponRequest) => {
    const data = PlayerData.get(player)
    if ((!IsClientLoggedIn(player)) || (!data)) throw 'Must be logged in to call this method'
    const result = await MakeRequest<RedeemCouponResult>('/Client/RedeemCoupon', request, 'X-Authorization', data.SessionTicket)
    return result
}

/**
 * Removes a specified user from the friend list of the local user
 * https://docs.microsoft.com/rest/api/playfab/client/friend-list-management/removefriend
 */
export const RemoveFriend = async (player: Player, request: RemoveFriendRequest) => {
    const data = PlayerData.get(player)
    if ((!IsClientLoggedIn(player)) || (!data)) throw 'Must be logged in to call this method'
    const result = await MakeRequest<RemoveFriendResult>('/Client/RemoveFriend', request, 'X-Authorization', data.SessionTicket)
    return result
}

/**
 * Removes the specified generic service identifier from the player's PlayFab account.
 * https://docs.microsoft.com/rest/api/playfab/client/account-management/removegenericid
 */
export const RemoveGenericID = async (player: Player, request: RemoveGenericIDRequest) => {
    const data = PlayerData.get(player)
    if ((!IsClientLoggedIn(player)) || (!data)) throw 'Must be logged in to call this method'
    const result = await MakeRequest<RemoveGenericIDResult>('/Client/RemoveGenericID', request, 'X-Authorization', data.SessionTicket)
    return result
}

/**
 * Removes users from the set of those able to update the shared data and the set of users in the group. Only users in the
 * group can remove members. If as a result of the call, zero users remain with access, the group and its associated data
 * will be deleted. Shared Groups are designed for sharing data between a very small number of players, please see our
 * guide: https://docs.microsoft.com/gaming/playfab/features/social/groups/using-shared-group-data
 * https://docs.microsoft.com/rest/api/playfab/client/shared-group-data/removesharedgroupmembers
 */
export const RemoveSharedGroupMembers = async (player: Player, request: RemoveSharedGroupMembersRequest) => {
    const data = PlayerData.get(player)
    if ((!IsClientLoggedIn(player)) || (!data)) throw 'Must be logged in to call this method'
    const result = await MakeRequest<RemoveSharedGroupMembersResult>('/Client/RemoveSharedGroupMembers', request, 'X-Authorization', data.SessionTicket)
    return result
}

/**
 * Submit a report for another player (due to bad bahavior, etc.), so that customer service representatives for the title
 * can take action concerning potentially toxic players.
 * https://docs.microsoft.com/rest/api/playfab/client/account-management/reportplayer
 */
export const ReportPlayer = async (player: Player, request: ReportPlayerClientRequest) => {
    const data = PlayerData.get(player)
    if ((!IsClientLoggedIn(player)) || (!data)) throw 'Must be logged in to call this method'
    const result = await MakeRequest<ReportPlayerClientResult>('/Client/ReportPlayer', request, 'X-Authorization', data.SessionTicket)
    return result
}

/**
 * Updates the tag list for a specified user in the friend list of the local user
 * https://docs.microsoft.com/rest/api/playfab/client/friend-list-management/setfriendtags
 */
export const SetFriendTags = async (player: Player, request: SetFriendTagsRequest) => {
    const data = PlayerData.get(player)
    if ((!IsClientLoggedIn(player)) || (!data)) throw 'Must be logged in to call this method'
    const result = await MakeRequest<SetFriendTagsResult>('/Client/SetFriendTags', request, 'X-Authorization', data.SessionTicket)
    return result
}

/**
 * Sets the player's secret if it is not already set. Player secrets are used to sign API requests. To reset a player's
 * secret use the Admin or Server API method SetPlayerSecret.
 * https://docs.microsoft.com/rest/api/playfab/client/authentication/setplayersecret
 */
export const SetPlayerSecret = async (player: Player, request: SetPlayerSecretRequest) => {
    const data = PlayerData.get(player)
    if ((!IsClientLoggedIn(player)) || (!data)) throw 'Must be logged in to call this method'
    const result = await MakeRequest<SetPlayerSecretResult>('/Client/SetPlayerSecret', request, 'X-Authorization', data.SessionTicket)
    return result
}

/**
 * Creates an order for a list of items from the title catalog
 * https://docs.microsoft.com/rest/api/playfab/client/player-item-management/startpurchase
 */
export const StartPurchase = async (player: Player, request: StartPurchaseRequest) => {
    const data = PlayerData.get(player)
    if ((!IsClientLoggedIn(player)) || (!data)) throw 'Must be logged in to call this method'
    const result = await MakeRequest<StartPurchaseResult>('/Client/StartPurchase', request, 'X-Authorization', data.SessionTicket)
    return result
}

/**
 * Decrements the user's balance of the specified virtual currency by the stated amount. It is possible to make a VC
 * balance negative with this API.
 * https://docs.microsoft.com/rest/api/playfab/client/player-item-management/subtractuservirtualcurrency
 */
export const SubtractUserVirtualCurrency = async (player: Player, request: SubtractUserVirtualCurrencyRequest) => {
    const data = PlayerData.get(player)
    if ((!IsClientLoggedIn(player)) || (!data)) throw 'Must be logged in to call this method'
    const result = await MakeRequest<ModifyUserVirtualCurrencyResult>('/Client/SubtractUserVirtualCurrency', request, 'X-Authorization', data.SessionTicket)
    return result
}

/**
 * Unlinks the related custom identifier from the user's PlayFab account
 * https://docs.microsoft.com/rest/api/playfab/client/account-management/unlinkcustomid
 */
export const UnlinkCustomID = async (player: Player, request: UnlinkCustomIDRequest) => {
    const data = PlayerData.get(player)
    if ((!IsClientLoggedIn(player)) || (!data)) throw 'Must be logged in to call this method'
    const result = await MakeRequest<UnlinkCustomIDResult>('/Client/UnlinkCustomID', request, 'X-Authorization', data.SessionTicket)
    return result
}

/**
 * Opens the specified container, with the specified key (when required), and returns the contents of the opened container.
 * If the container (and key when relevant) are consumable (RemainingUses > 0), their RemainingUses will be decremented,
 * consistent with the operation of ConsumeItem.
 * https://docs.microsoft.com/rest/api/playfab/client/player-item-management/unlockcontainerinstance
 */
export const UnlockContainerInstance = async (player: Player, request: UnlockContainerInstanceRequest) => {
    const data = PlayerData.get(player)
    if ((!IsClientLoggedIn(player)) || (!data)) throw 'Must be logged in to call this method'
    const result = await MakeRequest<UnlockContainerItemResult>('/Client/UnlockContainerInstance', request, 'X-Authorization', data.SessionTicket)
    return result
}

/**
 * Searches target inventory for an ItemInstance matching the given CatalogItemId, if necessary unlocks it using an
 * appropriate key, and returns the contents of the opened container. If the container (and key when relevant) are
 * consumable (RemainingUses > 0), their RemainingUses will be decremented, consistent with the operation of ConsumeItem.
 * https://docs.microsoft.com/rest/api/playfab/client/player-item-management/unlockcontaineritem
 */
export const UnlockContainerItem = async (player: Player, request: UnlockContainerItemRequest) => {
    const data = PlayerData.get(player)
    if ((!IsClientLoggedIn(player)) || (!data)) throw 'Must be logged in to call this method'
    const result = await MakeRequest<UnlockContainerItemResult>('/Client/UnlockContainerItem', request, 'X-Authorization', data.SessionTicket)
    return result
}

/**
 * Update the avatar URL of the player
 * https://docs.microsoft.com/rest/api/playfab/client/account-management/updateavatarurl
 */
export const UpdateAvatarUrl = async (player: Player, request: UpdateAvatarUrlRequest) => {
    const data = PlayerData.get(player)
    if ((!IsClientLoggedIn(player)) || (!data)) throw 'Must be logged in to call this method'
    const result = await MakeRequest<EmptyResponse>('/Client/UpdateAvatarUrl', request, 'X-Authorization', data.SessionTicket)
    return result
}

/**
 * Creates and updates the title-specific custom data for the user's character which is readable and writable by the client
 * https://docs.microsoft.com/rest/api/playfab/client/character-data/updatecharacterdata
 */
export const UpdateCharacterData = async (player: Player, request: UpdateCharacterDataRequest) => {
    const data = PlayerData.get(player)
    if ((!IsClientLoggedIn(player)) || (!data)) throw 'Must be logged in to call this method'
    const result = await MakeRequest<UpdateCharacterDataResult>('/Client/UpdateCharacterData', request, 'X-Authorization', data.SessionTicket)
    return result
}

/**
 * Updates the values of the specified title-specific statistics for the specific character. By default, clients are not
 * permitted to update statistics. Developers may override this setting in the Game Manager > Settings > API Features.
 * https://docs.microsoft.com/rest/api/playfab/client/characters/updatecharacterstatistics
 */
export const UpdateCharacterStatistics = async (player: Player, request: UpdateCharacterStatisticsRequest) => {
    const data = PlayerData.get(player)
    if ((!IsClientLoggedIn(player)) || (!data)) throw 'Must be logged in to call this method'
    const result = await MakeRequest<UpdateCharacterStatisticsResult>('/Client/UpdateCharacterStatistics', request, 'X-Authorization', data.SessionTicket)
    return result
}

/**
 * Updates the values of the specified title-specific statistics for the user. By default, clients are not permitted to
 * update statistics. Developers may override this setting in the Game Manager > Settings > API Features.
 * https://docs.microsoft.com/rest/api/playfab/client/player-data-management/updateplayerstatistics
*/
export const UpdatePlayerStatistics = async (player: Player, request: UpdatePlayerStatisticsRequest) => {
    const data = PlayerData.get(player)
    if ((!IsClientLoggedIn(player)) || (!data)) throw 'Must be logged in to call this method'
    const result = await MakeRequest<UpdatePlayerStatisticsResult>('/Client/UpdatePlayerStatistics', request, 'X-Authorization', data.SessionTicket)
    return result
}

/**
 * Adds, updates, and removes data keys for a shared group object. If the permission is set to Public, all fields updated
 * or added in this call will be readable by users not in the group. By default, data permissions are set to Private.
 * Regardless of the permission setting, only members of the group can update the data. Shared Groups are designed for
 * sharing data between a very small number of players, please see our guide:
 * https://docs.microsoft.com/gaming/playfab/features/social/groups/using-shared-group-data
 * https://docs.microsoft.com/rest/api/playfab/client/shared-group-data/updatesharedgroupdata
 */
export const UpdateSharedGroupData = async (player: Player, request: UpdateSharedGroupDataRequest) => {
    const data = PlayerData.get(player)
    if ((!IsClientLoggedIn(player)) || (!data)) throw 'Must be logged in to call this method'
    const result = await MakeRequest<UpdateSharedGroupDataResult>('/Client/UpdateSharedGroupData', request, 'X-Authorization', data.SessionTicket)
    return result
}

/**
 * Creates and updates the title-specific custom data for the user which is readable and writable by the client
 * https://docs.microsoft.com/rest/api/playfab/client/player-data-management/updateuserdata
 */
export const UpdateUserData = async (player: Player, request: UpdateUserDataRequest) => {
    const data = PlayerData.get(player)
    if ((!IsClientLoggedIn(player)) || (!data)) throw 'Must be logged in to call this method'
    const result = await MakeRequest<UpdateUserDataResult>('/Client/UpdateUserData', request, 'X-Authorization', data.SessionTicket)
    return result
}

/**
 * Creates and updates the publisher-specific custom data for the user which is readable and writable by the client
 * https://docs.microsoft.com/rest/api/playfab/client/player-data-management/updateuserpublisherdata
 */
export const UpdateUserPublisherData = async (player: Player, request: UpdateUserDataRequest) => {
    const data = PlayerData.get(player)
    if ((!IsClientLoggedIn(player)) || (!data)) throw 'Must be logged in to call this method'
    const result = await MakeRequest<UpdateUserDataResult>('/Client/UpdateUserPublisherData', request, 'X-Authorization', data.SessionTicket)
    return result
}

/**
 * Updates the title specific display name for the user
 * https://docs.microsoft.com/rest/api/playfab/client/account-management/updateusertitledisplayname
 */
export const UpdateUserTitleDisplayName = async (player: Player, request: UpdateUserTitleDisplayNameRequest) => {
    const data = PlayerData.get(player)
    if ((!IsClientLoggedIn(player)) || (!data)) throw 'Must be logged in to call this method'
    const result = await MakeRequest<UpdateUserTitleDisplayNameResult>('/Client/UpdateUserTitleDisplayName', request, 'X-Authorization', data.SessionTicket)
    return result
}

/**
 * Writes a character-based event into PlayStream.
 * https://docs.microsoft.com/rest/api/playfab/client/analytics/writecharacterevent
 */
export const WriteCharacterEvent = async (player: Player, request: WriteClientCharacterEventRequest) => {
    const data = PlayerData.get(player)
    if ((!IsClientLoggedIn(player)) || (!data)) throw 'Must be logged in to call this method'
    const result = await MakeRequest<WriteEventResponse>('/Client/WriteCharacterEvent', request, 'X-Authorization', data.SessionTicket)
    return result
}

/**
 * Writes a player-based event into PlayStream.
 * https://docs.microsoft.com/rest/api/playfab/client/analytics/writeplayerevent
 */
export const WritePlayerEvent = async (player: Player, request: WriteClientPlayerEventRequest) => {
    const data = PlayerData.get(player)
    if ((!IsClientLoggedIn(player)) || (!data)) throw 'Must be logged in to call this method'
    const result = await MakeRequest<WriteEventResponse>('/Client/WritePlayerEvent', request, 'X-Authorization', data.SessionTicket)
    return result
}

/**
 * Writes a title-based event into PlayStream.
 * https://docs.microsoft.com/rest/api/playfab/client/analytics/writetitleevent
 */
export const WriteTitleEvent = async (player: Player, request: WriteTitleEventRequest) => {
    const data = PlayerData.get(player)
    if ((!IsClientLoggedIn(player)) || (!data)) throw 'Must be logged in to call this method'
    const result = await MakeRequest<WriteEventResponse>('/Client/WriteTitleEvent', request, 'X-Authorization', data.SessionTicket)
    return result
}