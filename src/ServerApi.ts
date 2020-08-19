/// <reference path="ServerApi.d.ts" />

import MakeRequest from './HTTP'
import Settings from './Settings'

/**
 * Increments the character's balance of the specified virtual currency by the stated amount
 * https://docs.microsoft.com/rest/api/playfab/server/player-item-management/addcharactervirtualcurrency
 */
export const AddCharacterVirtualCurrency = async (request: AddCharacterVirtualCurrencyRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<ModifyCharacterVirtualCurrencyResult>('/Server/AddCharacterVirtualCurrency', request, 'X-SecretKey', Settings.settings.secretKey)
    return result
}

/**
 * Adds the Friend user to the friend list of the user with PlayFabId. At least one of
 * FriendPlayFabId,FriendUsername,FriendEmail, or FriendTitleDisplayName should be initialized.
 * https://docs.microsoft.com/rest/api/playfab/server/friend-list-management/addfriend
 */
export const AddFriend = async (request: AddFriendRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<AddFriendResult>('/Server/AddFriend', request, 'X-SecretKey', Settings.settings.secretKey)
    return result
}

/**
 * Adds the specified generic service identifier to the player's PlayFab account. This is designed to allow for a PlayFab
 * ID lookup of any arbitrary service identifier a title wants to add. This identifier should never be used as
 * authentication credentials, as the intent is that it is easily accessible by other players.
 * https://docs.microsoft.com/rest/api/playfab/server/account-management/addgenericid
 */
export const AddGenericID = async (request: AddGenericIDRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<AddGenericIDResult>('/Server/AddGenericID', request, 'X-SecretKey', Settings.settings.secretKey)
    return result
}

/**
 * Adds a given tag to a player profile. The tag's namespace is automatically generated based on the source of the tag.
 * https://docs.microsoft.com/rest/api/playfab/server/playstream/addplayertag
 */
export const AddPlayerTag = async (request: AddPlayerTagRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<AddPlayerTagResult>('/Server/AddPlayerTag', request, 'X-SecretKey', Settings.settings.secretKey)
    return result
}

/**
 * Adds users to the set of those able to update both the shared data, as well as the set of users in the group. Only users
 * in the group (and the server) can add new members. Shared Groups are designed for sharing data between a very small
 * number of players, please see our guide:
 * https://docs.microsoft.com/gaming/playfab/features/social/groups/using-shared-group-data
 * https://docs.microsoft.com/rest/api/playfab/server/shared-group-data/addsharedgroupmembers
 */
export const AddSharedGroupMembers = async (request: AddSharedGroupMembersRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<AddSharedGroupMembersResult>('/Server/AddSharedGroupMembers', request, 'X-SecretKey', Settings.settings.secretKey)
    return result
}

/**
 * Increments the user's balance of the specified virtual currency by the stated amount
 * https://docs.microsoft.com/rest/api/playfab/server/player-item-management/adduservirtualcurrency
 */
export const AddUserVirtualCurrency = async (request: AddUserVirtualCurrencyRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<ModifyUserVirtualCurrencyResult>('/Server/AddUserVirtualCurrency', request, 'X-SecretKey', Settings.settings.secretKey)
    return result
}

/**
 * Validated a client's session ticket, and if successful, returns details for that user
 * https://docs.microsoft.com/rest/api/playfab/server/authentication/authenticatesessionticket
 */
export const AuthenticateSessionTicket = async (request: AuthenticateSessionTicketRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<AuthenticateSessionTicketResult>('/Server/AuthenticateSessionTicket', request, 'X-SecretKey', Settings.settings.secretKey)
    return result
}

/**
 * Bans users by PlayFab ID with optional IP address, or MAC address for the provided game.
 * https://docs.microsoft.com/rest/api/playfab/server/account-management/banusers
 */
export const BanUsers = async (request: BanUsersRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<BanUsersResult>('/Server/BanUsers', request, 'X-SecretKey', Settings.settings.secretKey)
    return result
}

/**
 * Consume uses of a consumable item. When all uses are consumed, it will be removed from the player's inventory.
 * https://docs.microsoft.com/rest/api/playfab/server/player-item-management/consumeitem
 */
export const ConsumeItem = async (request: ConsumeItemRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<ConsumeItemResult>('/Server/ConsumeItem', request, 'X-SecretKey', Settings.settings.secretKey)
    return result
}

/**
 * Requests the creation of a shared group object, containing key/value pairs which may be updated by all members of the
 * group. When created by a server, the group will initially have no members. Shared Groups are designed for sharing data
 * between a very small number of players, please see our guide:
 * https://docs.microsoft.com/gaming/playfab/features/social/groups/using-shared-group-data
 * https://docs.microsoft.com/rest/api/playfab/server/shared-group-data/createsharedgroup
 */
export const CreateSharedGroup = async (request: CreateSharedGroupRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<CreateSharedGroupResult>('/Server/CreateSharedGroup', request, 'X-SecretKey', Settings.settings.secretKey)
    return result
}

/**
 * Deletes the specific character ID from the specified user.
 * https://docs.microsoft.com/rest/api/playfab/server/characters/deletecharacterfromuser
 */
export const DeleteCharacterFromUser = async (request: DeleteCharacterFromUserRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<DeleteCharacterFromUserResult>('/Server/DeleteCharacterFromUser', request, 'X-SecretKey', Settings.settings.secretKey)
    return result
}

/**
 * Removes a user's player account from a title and deletes all associated data
 * https://docs.microsoft.com/rest/api/playfab/server/account-management/deleteplayer
 */
export const DeletePlayer = async (request: DeletePlayerRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<DeletePlayerResult>('/Server/DeletePlayer', request, 'X-SecretKey', Settings.settings.secretKey)
    return result
}

/**
 * Deletes a shared group, freeing up the shared group ID to be reused for a new group. Shared Groups are designed for
 * sharing data between a very small number of players, please see our guide:
 * https://docs.microsoft.com/gaming/playfab/features/social/groups/using-shared-group-data
 * https://docs.microsoft.com/rest/api/playfab/server/shared-group-data/deletesharedgroup
 */
export const DeleteSharedGroup = async (request: DeleteSharedGroupRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<EmptyResponse>('/Server/DeleteSharedGroup', request, 'X-SecretKey', Settings.settings.secretKey)
    return result
}

/**
 * Inform the matchmaker that a Game Server Instance is removed.
 * https://docs.microsoft.com/rest/api/playfab/server/matchmaking/deregistergame
 */
export const DeregisterGame = async (request: DeregisterGameRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<DeregisterGameResponse>('/Server/DeregisterGame', request, 'X-SecretKey', Settings.settings.secretKey)
    return result
}

/**
 * Returns the result of an evaluation of a Random Result Table - the ItemId from the game Catalog which would have been
 * added to the player inventory, if the Random Result Table were added via a Bundle or a call to UnlockContainer.
 * https://docs.microsoft.com/rest/api/playfab/server/player-item-management/evaluaterandomresulttable
 */
export const EvaluateRandomResultTable = async (request: EvaluateRandomResultTableRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<EvaluateRandomResultTableResult>('/Server/EvaluateRandomResultTable', request, 'X-SecretKey', Settings.settings.secretKey)
    return result
}

/**
 * Executes a CloudScript function, with the 'currentPlayerId' variable set to the specified PlayFabId parameter value.
 * https://docs.microsoft.com/rest/api/playfab/server/server-side-cloud-script/executecloudscript
 */
export const ExecuteCloudScript = async (request: ExecuteCloudScriptRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<ExecuteCloudScriptResult>('/Server/ExecuteCloudScript', request, 'X-SecretKey', Settings.settings.secretKey)
    return result
}

/**
 * Retrieves an array of player segment definitions. Results from this can be used in subsequent API calls such as
 * GetPlayersInSegment which requires a Segment ID. While segment names can change the ID for that segment will not change.
 * https://docs.microsoft.com/rest/api/playfab/server/playstream/getallsegments
 */
export const GetAllSegments = async (request: GetAllSegmentsRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<GetAllSegmentsResult>('/Server/GetAllSegments', request, 'X-SecretKey', Settings.settings.secretKey)
    return result
}

/**
 * Lists all of the characters that belong to a specific user. CharacterIds are not globally unique; characterId must be
 * evaluated with the parent PlayFabId to guarantee uniqueness.
 * https://docs.microsoft.com/rest/api/playfab/server/characters/getalluserscharacters
 */
export const GetAllUsersCharacters = async (request: ListUsersCharactersRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<ListUsersCharactersResult>('/Server/GetAllUsersCharacters', request, 'X-SecretKey', Settings.settings.secretKey)
    return result
}

/**
 * Retrieves the specified version of the title's catalog of virtual goods, including all defined properties
 * https://docs.microsoft.com/rest/api/playfab/server/title-wide-data-management/getcatalogitems
 */
export const GetCatalogItems = async (request: GetCatalogItemsRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<GetCatalogItemsResult>('/Server/GetCatalogItems', request, 'X-SecretKey', Settings.settings.secretKey)
    return result
}

/**
 * Retrieves the title-specific custom data for the user which is readable and writable by the client
 * https://docs.microsoft.com/rest/api/playfab/server/character-data/getcharacterdata
 */
export const GetCharacterData = async (request: GetCharacterDataRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<GetCharacterDataResult>('/Server/GetCharacterData', request, 'X-SecretKey', Settings.settings.secretKey)
    return result
}

/**
 * Retrieves the title-specific custom data for the user's character which cannot be accessed by the client
 * https://docs.microsoft.com/rest/api/playfab/server/character-data/getcharacterinternaldata
 */
export const GetCharacterInternalData = async (request: GetCharacterDataRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<GetCharacterDataResult>('/Server/GetCharacterInternalData', request, 'X-SecretKey', Settings.settings.secretKey)
    return result
}

/**
 * Retrieves the specified character's current inventory of virtual goods
 * https://docs.microsoft.com/rest/api/playfab/server/player-item-management/getcharacterinventory
 */
export const GetCharacterInventory = async (request: GetCharacterInventoryRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<GetCharacterInventoryResult>('/Server/GetCharacterInventory', request, 'X-SecretKey', Settings.settings.secretKey)
    return result
}

/**
 * Retrieves a list of ranked characters for the given statistic, starting from the indicated point in the leaderboard
 * https://docs.microsoft.com/rest/api/playfab/server/characters/getcharacterleaderboard
 */
export const GetCharacterLeaderboard = async (request: GetCharacterLeaderboardRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<GetCharacterLeaderboardResult>('/Server/GetCharacterLeaderboard', request, 'X-SecretKey', Settings.settings.secretKey)
    return result
}

/**
 * Retrieves the title-specific custom data for the user's character which can only be read by the client
 * https://docs.microsoft.com/rest/api/playfab/server/character-data/getcharacterreadonlydata
 */
export const GetCharacterReadOnlyData = async (request: GetCharacterDataRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<GetCharacterDataResult>('/Server/GetCharacterReadOnlyData', request, 'X-SecretKey', Settings.settings.secretKey)
    return result
}

/**
 * Retrieves the details of all title-specific statistics for the specific character
 * https://docs.microsoft.com/rest/api/playfab/server/characters/getcharacterstatistics
 */
export const GetCharacterStatistics = async (request: GetCharacterStatisticsRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<GetCharacterStatisticsResult>('/Server/GetCharacterStatistics', request, 'X-SecretKey', Settings.settings.secretKey)
    return result
}

/**
 * This API retrieves a pre-signed URL for accessing a content file for the title. A subsequent HTTP GET to the returned
 * URL will attempt to download the content. A HEAD query to the returned URL will attempt to retrieve the metadata of the
 * content. Note that a successful result does not guarantee the existence of this content - if it has not been uploaded,
 * the query to retrieve the data will fail. See this post for more information:
 * https://community.playfab.com/hc/community/posts/205469488-How-to-upload-files-to-PlayFab-s-Content-Service. Also,
 * please be aware that the Content service is specifically PlayFab's CDN offering, for which standard CDN rates apply.
 * https://docs.microsoft.com/rest/api/playfab/server/content/getcontentdownloadurl
 */
export const GetContentDownloadUrl = async (request: GetContentDownloadUrlRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<GetContentDownloadUrlResult>('/Server/GetContentDownloadUrl', request, 'X-SecretKey', Settings.settings.secretKey)
    return result
}

/**
 * Retrieves a list of ranked friends of the given player for the given statistic, starting from the indicated point in the
 * leaderboard
 * https://docs.microsoft.com/rest/api/playfab/server/player-data-management/getfriendleaderboard
 */
export const GetFriendLeaderboard = async (request: GetFriendLeaderboardRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<GetLeaderboardResult>('/Server/GetFriendLeaderboard', request, 'X-SecretKey', Settings.settings.secretKey)
    return result
}

/**
 * Retrieves the current friends for the user with PlayFabId, constrained to users who have PlayFab accounts. Friends from
 * linked accounts (Facebook, Steam) are also included. You may optionally exclude some linked services' friends.
 * https://docs.microsoft.com/rest/api/playfab/server/friend-list-management/getfriendslist
 */
export const GetFriendsList = async (request: GetFriendsListRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<GetFriendsListResult>('/Server/GetFriendsList', request, 'X-SecretKey', Settings.settings.secretKey)
    return result
}

/**
 * Retrieves a list of ranked users for the given statistic, starting from the indicated point in the leaderboard
 * https://docs.microsoft.com/rest/api/playfab/server/player-data-management/getleaderboard
 */
export const GetLeaderboard = async (request: GetLeaderboardRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<GetLeaderboardResult>('/Server/GetLeaderboard', request, 'X-SecretKey', Settings.settings.secretKey)
    return result
}

/**
 * Retrieves a list of ranked users for the given statistic, centered on the currently signed-in user
 * https://docs.microsoft.com/rest/api/playfab/server/player-data-management/getleaderboardarounduser
 */
export const GetLeaderboardAroundCharacter = async (request: GetLeaderboardAroundCharacterRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<GetLeaderboardAroundCharacterResult>('/Server/GetLeaderboardAroundCharacter', request, 'X-SecretKey', Settings.settings.secretKey)
    return result
}

/**
 * Retrieves a list of all of the user's characters for the given statistic.
 * https://docs.microsoft.com/rest/api/playfab/server/characters/getleaderboardforusercharacters
 */
export const GetLeaderboardForUserCharacters = async (request: GetLeaderboardForUsersCharactersRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<GetLeaderboardForUsersCharactersResult>('/Server/GetLeaderboardForUserCharacters', request, 'X-SecretKey', Settings.settings.secretKey)
    return result
}

/**
 * Returns whatever info is requested in the response for the user. Note that PII (like email address, facebook id) may be
 * returned. All parameters default to false.
 * https://docs.microsoft.com/rest/api/playfab/server/player-data-management/getplayercombinedinfo
 */
export const GetPlayerCombinedInfo = async (request: GetPlayerCombinedInfoRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<GetPlayerCombinedInfoResult>('/Server/GetPlayerCombinedInfo', request, 'X-SecretKey', Settings.settings.secretKey)
    return result
}

/**
 * Retrieves the player's profile
 * https://docs.microsoft.com/rest/api/playfab/server/account-management/getplayerprofile
 */
export const GetPlayerProfile = async (request: GetPlayerProfileRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<GetPlayerProfileResult>('/Server/GetPlayerProfile', request, 'X-SecretKey', Settings.settings.secretKey)
    return result
}

/**
 * List all segments that a player currently belongs to at this moment in time.
 * https://docs.microsoft.com/rest/api/playfab/server/playstream/getplayersegments
 */
export const GetPlayerSegments = async (request: GetPlayerSegmentsRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<GetPlayerSegmentsResult>('/Server/GetPlayerSegments', request, 'X-SecretKey', Settings.settings.secretKey)
    return result
}

/**
 * Allows for paging through all players in a given segment. This API creates a snapshot of all player profiles that match
 * the segment definition at the time of its creation and lives through the Total Seconds to Live, refreshing its life span
 * on each subsequent use of the Continuation Token. Profiles that change during the course of paging will not be reflected
 * in the results. AB Test segments are currently not supported by this operation. NOTE: This API is limited to being
 * called 30 times in one minute. You will be returned an error if you exceed this threshold.
 * https://docs.microsoft.com/rest/api/playfab/server/playstream/getplayersinsegment
 */
export const GetPlayersInSegment = async (request: GetPlayersInSegmentRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<GetPlayersInSegmentResult>('/Server/GetPlayersInSegment', request, 'X-SecretKey', Settings.settings.secretKey)
    return result
}

/**
 * Retrieves the current version and values for the indicated statistics, for the local player.
 * https://docs.microsoft.com/rest/api/playfab/server/player-data-management/getplayerstatistics
 */
export const GetPlayerStatistics = async (request: GetPlayerStatisticsRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<GetPlayerStatisticsResult>('/Server/GetPlayerStatistics', request, 'X-SecretKey', Settings.settings.secretKey)
    return result
}

/**
 * Retrieves the information on the available versions of the specified statistic.
 * https://docs.microsoft.com/rest/api/playfab/server/player-data-management/getplayerstatisticversions
 */
export const GetPlayerStatisticVersions = async (request: GetPlayerStatisticVersionsRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<GetPlayerStatisticVersionsResult>('/Server/GetPlayerStatisticVersions', request, 'X-SecretKey', Settings.settings.secretKey)
    return result
}

/**
 * Get all tags with a given Namespace (optional) from a player profile.
 * https://docs.microsoft.com/rest/api/playfab/server/playstream/getplayertags
 */
export const GetPlayerTags = async (request: GetPlayerTagsRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<GetPlayerTagsResult>('/Server/GetPlayerTags', request, 'X-SecretKey', Settings.settings.secretKey)
    return result
}

/**
 * Retrieves the unique PlayFab identifiers for the given set of generic service identifiers. A generic identifier is the
 * service name plus the service-specific ID for the player, as specified by the title when the generic identifier was
 * added to the player account.
 * https://docs.microsoft.com/rest/api/playfab/server/account-management/getplayfabidsfromgenericids
 */
export const GetPlayFabIDsFromGenericIDs = async (request: GetPlayFabIDsFromGenericIDsRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<GetPlayFabIDsFromGenericIDsResult>('/Server/GetPlayFabIDsFromGenericIDs', request, 'X-SecretKey', Settings.settings.secretKey)
    return result
}

/**
 * Retrieves the key-value store of custom publisher settings
 * https://docs.microsoft.com/rest/api/playfab/server/title-wide-data-management/getpublisherdata
 */
export const GetPublisherData = async (request: GetPublisherDataRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<GetPublisherDataResult>('/Server/GetPublisherData', request, 'X-SecretKey', Settings.settings.secretKey)
    return result
}

/**
 * Retrieves the configuration information for the specified random results tables for the title, including all ItemId
 * values and weights
 * https://docs.microsoft.com/rest/api/playfab/server/player-item-management/getrandomresulttables
 */
export const GetRandomResultTables = async (request: GetRandomResultTablesRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<GetRandomResultTablesResult>('/Server/GetRandomResultTables', request, 'X-SecretKey', Settings.settings.secretKey)
    return result
}

/**
 * Retrieves the associated PlayFab account identifiers for the given set of server custom identifiers.
 * https://docs.microsoft.com/rest/api/playfab/server/account-management/getservercustomidsfromplayfabids
 */
export const GetServerCustomIDsFromPlayFabIDs = async (request: GetServerCustomIDsFromPlayFabIDsRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<GetServerCustomIDsFromPlayFabIDsResult>('/Server/GetServerCustomIDsFromPlayFabIDs', request, 'X-SecretKey', Settings.settings.secretKey)
    return result
}

/**
 * Retrieves data stored in a shared group object, as well as the list of members in the group. The server can access all
 * public and private group data. Shared Groups are designed for sharing data between a very small number of players,
 * please see our guide: https://docs.microsoft.com/gaming/playfab/features/social/groups/using-shared-group-data
 * https://docs.microsoft.com/rest/api/playfab/server/shared-group-data/getsharedgroupdata
 */
export const GetSharedGroupData = async (request: GetSharedGroupDataRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<GetSharedGroupDataResult>('/Server/GetSharedGroupData', request, 'X-SecretKey', Settings.settings.secretKey)
    return result
}

/**
 * Retrieves the set of items defined for the specified store, including all prices defined, for the specified player
 * https://docs.microsoft.com/rest/api/playfab/server/title-wide-data-management/getstoreitems
 */
export const GetStoreItems = async (request: GetStoreItemsRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<GetStoreItemsResult>('/Server/GetStoreItems', request, 'X-SecretKey', Settings.settings.secretKey)
    return result
}

/**
 * Retrieves the current server time
 * https://docs.microsoft.com/rest/api/playfab/server/title-wide-data-management/gettime
 */
export const GetTime = async (request: GetTimeRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<GetTimeResult>('/Server/GetTime', request, 'X-SecretKey', Settings.settings.secretKey)
    return result
}

/**
 * Retrieves the key-value store of custom title settings
 * https://docs.microsoft.com/rest/api/playfab/server/title-wide-data-management/gettitledata
 */
export const GetTitleData = async (request: GetTitleDataRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<GetTitleDataResult>('/Server/GetTitleData', request, 'X-SecretKey', Settings.settings.secretKey)
    return result
}

/**
 * Retrieves the key-value store of custom internal title settings
 * https://docs.microsoft.com/rest/api/playfab/server/title-wide-data-management/gettitleinternaldata
 */
export const GetTitleInternalData = async (request: GetTitleDataRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<GetTitleDataResult>('/Server/GetTitleInternalData', request, 'X-SecretKey', Settings.settings.secretKey)
    return result
}

/**
 * Retrieves the title news feed, as configured in the developer portal
 * https://docs.microsoft.com/rest/api/playfab/server/title-wide-data-management/gettitlenews
 */
export const GetTitleNews = async (request: GetTitleNewsRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<GetTitleNewsResult>('/Server/GetTitleNews', request, 'X-SecretKey', Settings.settings.secretKey)
    return result
}

/**
 * Retrieves the relevant details for a specified user
 * https://docs.microsoft.com/rest/api/playfab/server/account-management/getuseraccountinfo
 */
export const GetUserAccountInfo = async (request: GetUserAccountInfoRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<GetUserAccountInfoResult>('/Server/GetUserAccountInfo', request, 'X-SecretKey', Settings.settings.secretKey)
    return result
}

/**
 * Gets all bans for a user.
 * https://docs.microsoft.com/rest/api/playfab/server/account-management/getuserbans
 */
export const GetUserBans = async (request: GetUserBansRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<GetUserBansResult>('/Server/GetUserBans', request, 'X-SecretKey', Settings.settings.secretKey)
    return result
}

/**
 * Retrieves the title-specific custom data for the user which is readable and writable by the client
 * https://docs.microsoft.com/rest/api/playfab/server/player-data-management/getuserdata
 */
export const GetUserData = async (request: GetUserDataRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<GetUserDataResult>('/Server/GetUserData', request, 'X-SecretKey', Settings.settings.secretKey)
    return result
}

/**
 * Retrieves the title-specific custom data for the user which cannot be accessed by the client
 * https://docs.microsoft.com/rest/api/playfab/server/player-data-management/getuserinternaldata
 */
export const GetUserInternalData = async (request: GetUserDataRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<GetUserDataResult>('/Server/GetUserInternalData', request, 'X-SecretKey', Settings.settings.secretKey)
    return result
}

/**
 * Retrieves the specified user's current inventory of virtual goods
 * https://docs.microsoft.com/rest/api/playfab/server/player-item-management/getuserinventory
 */
export const GetUserInventory = async (request: GetUserInventoryRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<GetUserInventoryResult>('/Server/GetUserInventory', request, 'X-SecretKey', Settings.settings.secretKey)
    return result
}

/**
 * Retrieves the publisher-specific custom data for the user which is readable and writable by the client
 * https://docs.microsoft.com/rest/api/playfab/server/player-data-management/getuserpublisherdata
 */
export const GetUserPublisherData = async (request: GetUserDataRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<GetUserDataResult>('/Server/GetUserPublisherData', request, 'X-SecretKey', Settings.settings.secretKey)
    return result
}

/**
 * Retrieves the publisher-specific custom data for the user which cannot be accessed by the client
 * https://docs.microsoft.com/rest/api/playfab/server/player-data-management/getuserpublisherinternaldata
 */
export const GetUserPublisherInternalData = async (request: GetUserDataRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<GetUserDataResult>('/Server/GetUserPublisherInternalData', request, 'X-SecretKey', Settings.settings.secretKey)
    return result
}

/**
 * Retrieves the publisher-specific custom data for the user which can only be read by the client
 * https://docs.microsoft.com/rest/api/playfab/server/player-data-management/getuserpublisherreadonlydata
 */
export const GetUserPublisherReadOnlyData = async (request: GetUserDataRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<GetUserDataResult>('/Server/GetUserPublisherReadOnlyData', request, 'X-SecretKey', Settings.settings.secretKey)
    return result
}

/**
 * Retrieves the title-specific custom data for the user which can only be read by the client
 * https://docs.microsoft.com/rest/api/playfab/server/player-data-management/getuserreadonlydata
 */
export const GetUserReadOnlyData = async (request: GetUserDataRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<GetUserDataResult>('/Server/GetUserReadOnlyData', request, 'X-SecretKey', Settings.settings.secretKey)
    return result
}

/**
 * Grants the specified character type to the user. CharacterIds are not globally unique; characterId must be evaluated
 * with the parent PlayFabId to guarantee uniqueness.
 * https://docs.microsoft.com/rest/api/playfab/server/characters/grantcharactertouser
 */
export const GrantCharacterToUser = async (request: GrantCharacterToUserRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<GrantCharacterToUserResult>('/Server/GrantCharacterToUser', request, 'X-SecretKey', Settings.settings.secretKey)
    return result
}

/**
 * Adds the specified items to the specified character's inventory
 * https://docs.microsoft.com/rest/api/playfab/server/player-item-management/grantitemstocharacter
 */
export const GrantItemsToCharacter = async (request: GrantItemsToCharacterRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<GrantItemsToCharacterResult>('/Server/GrantItemsToCharacter', request, 'X-SecretKey', Settings.settings.secretKey)
    return result
}

/**
 * Adds the specified items to the specified user's inventory
 * https://docs.microsoft.com/rest/api/playfab/server/player-item-management/grantitemstouser
 */
export const GrantItemsToUser = async (request: GrantItemsToUserRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<GrantItemsToUserResult>('/Server/GrantItemsToUser', request, 'X-SecretKey', Settings.settings.secretKey)
    return result
}

/**
 * Adds the specified items to the specified user inventories
 * https://docs.microsoft.com/rest/api/playfab/server/player-item-management/grantitemstousers
 */
export const GrantItemsToUsers = async (request: GrantItemsToUsersRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<GrantItemsToUsersResult>('/Server/GrantItemsToUsers', request, 'X-SecretKey', Settings.settings.secretKey)
    return result
}

/**
 * Links the custom server identifier, generated by the title, to the user's PlayFab account.
 * https://docs.microsoft.com/rest/api/playfab/server/account-management/linkservercustomid
 */
export const LinkServerCustomId = async (request: LinkServerCustomIdRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<LinkServerCustomIdResult>('/Server/LinkServerCustomId', request, 'X-SecretKey', Settings.settings.secretKey)
    return result
}

/**
 * Securely login a game client from an external server backend using a custom identifier for that player. Server Custom ID
 * and Client Custom ID are mutually exclusive and cannot be used to retrieve the same player account.
 * https://docs.microsoft.com/rest/api/playfab/server/authentication/loginwithservercustomid
 */
export const LoginWithServerCustomId = async (request: LoginWithServerCustomIdRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<LoginWithServerCustomIdRequest>('/Server/LoginWithServerCustomId', request, 'X-SecretKey', Settings.settings.secretKey)
    return result
}

/**
 * Modifies the number of remaining uses of a player's inventory item
 * https://docs.microsoft.com/rest/api/playfab/server/player-item-management/modifyitemuses
 */
export const ModifyItemUses = async (request: ModifyItemUsesRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<ModifyItemUsesResult>('/Server/ModifyItemUses', request, 'X-SecretKey', Settings.settings.secretKey)
    return result
}

/**
 * Moves an item from a character's inventory into another of the user's character's inventory.
 * https://docs.microsoft.com/rest/api/playfab/server/player-item-management/moveitemtocharacterfromcharacter
 */
export const MoveItemToCharacterFromCharacter = async (request: MoveItemToCharacterFromCharacterRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<MoveItemToCharacterFromCharacterResult>('/Server/MoveItemToCharacterFromCharacter', request, 'X-SecretKey', Settings.settings.secretKey)
    return result
}

/**
 * Moves an item from a user's inventory into their character's inventory.
 * https://docs.microsoft.com/rest/api/playfab/server/player-item-management/moveitemtocharacterfromuser
 */
export const MoveItemToCharacterFromUser = async (request: MoveItemToCharacterFromUserRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<MoveItemToCharacterFromUserResult>('/Server/MoveItemToCharacterFromUser', request, 'X-SecretKey', Settings.settings.secretKey)
    return result
}

/**
 * Moves an item from a character's inventory into the owning user's inventory.
 * https://docs.microsoft.com/rest/api/playfab/server/player-item-management/moveitemtouserfromcharacter
 */
export const MoveItemToUserFromCharacter = async (request: MoveItemToUserFromCharacterRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<MoveItemToUserFromCharacterResult>('/Server/MoveItemToUserFromCharacter', request, 'X-SecretKey', Settings.settings.secretKey)
    return result
}

/**
 * Informs the PlayFab match-making service that the user specified has left the Game Server Instance
 * https://docs.microsoft.com/rest/api/playfab/server/matchmaking/notifymatchmakerplayerleft
 */
export const NotifyMatchmakerPlayerLeft = async (request: NotifyMatchmakerPlayerLeftRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<NotifyMatchmakerPlayerLeftResult>('/Server/NotifyMatchmakerPlayerLeft', request, 'X-SecretKey', Settings.settings.secretKey)
    return result
}

/**
 * Adds the virtual goods associated with the coupon to the user's inventory. Coupons can be generated via the
 * Economy->Catalogs tab in the PlayFab Game Manager.
 * https://docs.microsoft.com/rest/api/playfab/server/player-item-management/redeemcoupon
 */
export const RedeemCoupon = async (request: RedeemCouponRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<RedeemCouponResult>('/Server/RedeemCoupon', request, 'X-SecretKey', Settings.settings.secretKey)
    return result
}

/**
 * Validates a Game Server session ticket and returns details about the user
 * https://docs.microsoft.com/rest/api/playfab/server/matchmaking/redeemmatchmakerticket
 */
export const RedeemMatchmakerTicket = async (request: RedeemMatchmakerTicketRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<RedeemMatchmakerTicketResult>('/Server/RedeemMatchmakerTicket', request, 'X-SecretKey', Settings.settings.secretKey)
    return result
}

/**
 * Removes the specified friend from the the user's friend list
 * https://docs.microsoft.com/rest/api/playfab/server/friend-list-management/removefriend
 */
export const RemoveFriend = async (request: RemoveFriendRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<RemoveFriendResult>('/Server/RemoveFriend', request, 'X-SecretKey', Settings.settings.secretKey)
    return result
}

/**
 * Removes the specified generic service identifier from the player's PlayFab account.
 * https://docs.microsoft.com/rest/api/playfab/server/account-management/removegenericid
 */
export const RemoveGenericID = async (request: RemoveGenericIDRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<RemoveGenericIDResult>('/Server/RemoveGenericID', request, 'X-SecretKey', Settings.settings.secretKey)
    return result
}

/**
 * Remove a given tag from a player profile. The tag's namespace is automatically generated based on the source of the tag.
 * https://docs.microsoft.com/rest/api/playfab/server/playstream/removeplayertag
 */
export const RemovePlayerTag = async (request: RemovePlayerTagRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<RemovePlayerTagResult>('/Server/RemovePlayerTag', request, 'X-SecretKey', Settings.settings.secretKey)
    return result
}

/**
 * Removes users from the set of those able to update the shared data and the set of users in the group. Only users in the
 * group can remove members. If as a result of the call, zero users remain with access, the group and its associated data
 * will be deleted. Shared Groups are designed for sharing data between a very small number of players, please see our
 * guide: https://docs.microsoft.com/gaming/playfab/features/social/groups/using-shared-group-data
 * https://docs.microsoft.com/rest/api/playfab/server/shared-group-data/removesharedgroupmembers
 */
export const RemoveSharedGroupMembers = async (request: RemoveSharedGroupMembersRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<RemoveSharedGroupMembersResult>('/Server/RemoveSharedGroupMembers', request, 'X-SecretKey', Settings.settings.secretKey)
    return result
}

/**
 * Submit a report about a player (due to bad bahavior, etc.) on behalf of another player, so that customer service
 * representatives for the title can take action concerning potentially toxic players.
 * https://docs.microsoft.com/rest/api/playfab/server/player-item-management/reportplayer
 */
export const ReportPlayer = async (request: ReportPlayerServerRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<ReportPlayerServerResult>('/Server/ReportPlayer', request, 'X-SecretKey', Settings.settings.secretKey)
    return result
}

/**
 * Revoke all active bans for a user.
 * https://docs.microsoft.com/rest/api/playfab/server/account-management/revokeallbansforuser
 */
export const RevokeAllBansForUser = async (request: RevokeAllBansForUserRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<RevokeAllBansForUserResult>('/Server/RevokeAllBansForUser', request, 'X-SecretKey', Settings.settings.secretKey)
    return result
}

/**
 * Revoke all active bans specified with BanId.
 * https://docs.microsoft.com/rest/api/playfab/server/account-management/revokebans
 */
export const RevokeBans = async (request: RevokeBansRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<RevokeBansResult>('/Server/RevokeBans', request, 'X-SecretKey', Settings.settings.secretKey)
    return result
}

/**
 * Revokes access to an item in a user's inventory
 * https://docs.microsoft.com/rest/api/playfab/server/player-item-management/revokeinventoryitem
 */
export const RevokeInventoryItem = async (request: RevokeInventoryItemRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<RevokeInventoryResult>('/Server/RevokeInventoryItem', request, 'X-SecretKey', Settings.settings.secretKey)
    return result
}

/**
 * Revokes access for up to 25 items across multiple users and characters.
 * https://docs.microsoft.com/rest/api/playfab/server/player-item-management/revokeinventoryitems
 */
export const RevokeInventoryItems = async (request: RevokeInventoryItemsRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<RevokeInventoryItemsResult>('/Server/RevokeInventoryItems', request, 'X-SecretKey', Settings.settings.secretKey)
    return result
}

/**
 * Updates the tag list for a specified user in the friend list of another user
 * https://docs.microsoft.com/rest/api/playfab/server/friend-list-management/setfriendtags
 */
export const SetFriendTags = async (request: SetFriendTagsRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<SetFriendTagsResult>('/Server/SetFriendTags', request, 'X-SecretKey', Settings.settings.secretKey)
    return result
}

/**
 * Sets the player's secret if it is not already set. Player secrets are used to sign API requests. To reset a player's
 * secret use the Admin or Server API method SetPlayerSecret.
 * https://docs.microsoft.com/rest/api/playfab/server/authentication/setplayersecret
 */
export const SetPlayerSecret = async (request: SetPlayerSecretRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<SetPlayerSecretResult>('/Server/SetPlayerSecret', request, 'X-SecretKey', Settings.settings.secretKey)
    return result
}

/**
 * Updates the key-value store of custom publisher settings
 * https://docs.microsoft.com/rest/api/playfab/server/title-wide-data-management/setpublisherdata
 */
export const SetPublisherData = async (request: SetPublisherDataRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<SetPublisherDataResult>('/Server/SetPublisherData', request, 'X-SecretKey', Settings.settings.secretKey)
    return result
}

/**
 * Updates the key-value store of custom title settings
 * https://docs.microsoft.com/rest/api/playfab/server/title-wide-data-management/settitledata
 */
export const SetTitleData = async (request: SetTitleDataRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<SetTitleDataResult>('/Server/SetTitleData', request, 'X-SecretKey', Settings.settings.secretKey)
    return result
}

/**
 * Updates the key-value store of custom title settings
 * https://docs.microsoft.com/rest/api/playfab/server/title-wide-data-management/settitleinternaldata
 */
export const SetTitleInternalData = async (request: SetTitleDataRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<SetTitleDataResult>('/Server/SetTitleInternalData', request, 'X-SecretKey', Settings.settings.secretKey)
    return result
}

/**
 * Decrements the character's balance of the specified virtual currency by the stated amount. It is possible to make a VC
 * balance negative with this API.
 * https://docs.microsoft.com/rest/api/playfab/server/player-item-management/subtractcharactervirtualcurrency
 */
export const SubtractCharacterVirtualCurrency = async (request: SubtractCharacterVirtualCurrencyRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<SubtractCharacterVirtualCurrencyRequest>('/Server/SubtractCharacterVirtualCurrency', request, 'X-SecretKey', Settings.settings.secretKey)
    return result
}

/**
 * Decrements the user's balance of the specified virtual currency by the stated amount. It is possible to make a VC
 * balance negative with this API.
 * https://docs.microsoft.com/rest/api/playfab/server/player-item-management/subtractuservirtualcurrency
 */
export const SubtractUserVirtualCurrency = async (request: SubtractUserVirtualCurrencyRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<SubtractUserVirtualCurrencyRequest>('/Server/SubtractUserVirtualCurrency', request, 'X-SecretKey', Settings.settings.secretKey)
    return result
}

/**
 * Unlinks the custom server identifier from the user's PlayFab account.
 * https://docs.microsoft.com/rest/api/playfab/server/account-management/unlinkservercustomid
 */
export const UnlinkServerCustomId = async (request: UnlinkServerCustomIdRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<UnlinkServerCustomIdResult>('/Server/UnlinkServerCustomId', request, 'X-SecretKey', Settings.settings.secretKey)
    return result
}

/**
 * Opens a specific container (ContainerItemInstanceId), with a specific key (KeyItemInstanceId, when required), and
 * returns the contents of the opened container. If the container (and key when relevant) are consumable (RemainingUses >
 * 0), their RemainingUses will be decremented, consistent with the operation of ConsumeItem.
 * https://docs.microsoft.com/rest/api/playfab/server/player-item-management/unlockcontainerinstance
 */
export const UnlockContainerItem = async (request: UnlockContainerItemRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<UnlockContainerItemResult>('/Server/UnlockContainerItem', request, 'X-SecretKey', Settings.settings.secretKey)
    return result
}

/**
 * Update the avatar URL of the specified player
 * https://docs.microsoft.com/rest/api/playfab/server/account-management/updateavatarurl
 */
export const UpdateAvatarUrl = async (request: UpdateAvatarUrlRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<EmptyResponse>('/Server/UpdateAvatarUrl', request, 'X-SecretKey', Settings.settings.secretKey)
    return result
}

/**
 * Updates information of a list of existing bans specified with Ban Ids.
 * https://docs.microsoft.com/rest/api/playfab/server/account-management/updatebans
 */
export const UpdateBans = async (request: UpdateBansRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<UpdateBansResult>('/Server/UpdateBans', request, 'X-SecretKey', Settings.settings.secretKey)
    return result
}

/**
 * Updates the title-specific custom data for the user's character which is readable and writable by the client
 * https://docs.microsoft.com/rest/api/playfab/server/character-data/updatecharacterdata
 */
export const UpdateCharacterData = async (request: UpdateCharacterDataRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<UpdateCharacterDataResult>('/Server/UpdateCharacterData', request, 'X-SecretKey', Settings.settings.secretKey)
    return result
}

/**
 * Updates the title-specific custom data for the user's character which cannot be accessed by the client
 * https://docs.microsoft.com/rest/api/playfab/server/character-data/updatecharacterinternaldata
 */
export const UpdateCharacterInternalData = async (request: UpdateCharacterDataRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<UpdateCharacterDataResult>('/Server/UpdateCharacterInternalData', request, 'X-SecretKey', Settings.settings.secretKey)
    return result
}

/**
 * Updates the title-specific custom data for the user's character which can only be read by the client
 * https://docs.microsoft.com/rest/api/playfab/server/character-data/updatecharacterreadonlydata
 */
export const UpdateCharacterReadOnlyData = async (request: UpdateCharacterDataRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<UpdateCharacterDataResult>('/Server/UpdateCharacterReadOnlyData', request, 'X-SecretKey', Settings.settings.secretKey)
    return result
}

/**
 * Updates the values of the specified title-specific statistics for the specific character
 * https://docs.microsoft.com/rest/api/playfab/server/characters/updatecharacterstatistics
 */
export const UpdateCharacterStatistics = async (request: UpdateCharacterStatisticsRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<UpdateCharacterStatisticsResult>('/Server/UpdateCharacterStatistics', request, 'X-SecretKey', Settings.settings.secretKey)
    return result
}

/**
 * Updates the values of the specified title-specific statistics for the user
 * https://docs.microsoft.com/rest/api/playfab/server/player-data-management/updateplayerstatistics
 */
export const UpdatePlayerStatistics = async (request: UpdatePlayerStatisticsRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<UpdatePlayerStatisticsResult>('/Server/UpdatePlayerStatistics', request, 'X-SecretKey', Settings.settings.secretKey)
    return result
}

/**
 * Adds, updates, and removes data keys for a shared group object. If the permission is set to Public, all fields updated
 * or added in this call will be readable by users not in the group. By default, data permissions are set to Private.
 * Regardless of the permission setting, only members of the group (and the server) can update the data. Shared Groups are
 * designed for sharing data between a very small number of players, please see our guide:
 * https://docs.microsoft.com/gaming/playfab/features/social/groups/using-shared-group-data
 * https://docs.microsoft.com/rest/api/playfab/server/shared-group-data/updatesharedgroupdata
 */
export const UpdateSharedGroupData = async (request: UpdateSharedGroupDataRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<UpdateSharedGroupDataResult>('/Server/UpdateSharedGroupData', request, 'X-SecretKey', Settings.settings.secretKey)
    return result
}

/**
 * Updates the title-specific custom data for the user which is readable and writable by the client
 * https://docs.microsoft.com/rest/api/playfab/server/player-data-management/updateuserdata
 */
export const UpdateUserData = async (request: UpdateUserDataRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<UpdateUserDataResult>('/Server/UpdateUserData', request, 'X-SecretKey', Settings.settings.secretKey)
    return result
}

/**
 * Updates the title-specific custom data for the user which cannot be accessed by the client
 * https://docs.microsoft.com/rest/api/playfab/server/player-data-management/updateuserinternaldata
 */
export const UpdateUserInternalData = async (request: UpdateUserDataRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<UpdateUserDataResult>('/Server/UpdateUserInternalData', request, 'X-SecretKey', Settings.settings.secretKey)
    return result
}

/**
 * Updates the key-value pair data tagged to the specified item, which is read-only from the client.
 * https://docs.microsoft.com/rest/api/playfab/server/player-item-management/updateuserinventoryitemcustomdata
 */
export const UpdateUserInventoryItemCustomData = async (request: UpdateUserInventoryItemDataRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<EmptyResponse>('/Server/UpdateUserInventoryItemCustomData', request, 'X-SecretKey', Settings.settings.secretKey)
    return result
}

/**
 * Updates the publisher-specific custom data for the user which is readable and writable by the client
 * https://docs.microsoft.com/rest/api/playfab/server/player-data-management/updateuserpublisherdata
 */
export const UpdateUserPublisherData = async (request: UpdateUserDataRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<UpdateUserDataResult>('/Server/UpdateUserPublisherData', request, 'X-SecretKey', Settings.settings.secretKey)
    return result
}

/**
 * Updates the publisher-specific custom data for the user which cannot be accessed by the client
 * https://docs.microsoft.com/rest/api/playfab/server/player-data-management/updateuserpublisherinternaldata
 */
export const UpdateUserPublisherInternalData = async (request: UpdateUserInternalDataRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<UpdateUserDataResult>('/Server/UpdateUserPublisherInternalData', request, 'X-SecretKey', Settings.settings.secretKey)
    return result
}

/**
 * Updates the publisher-specific custom data for the user which can only be read by the client
 * https://docs.microsoft.com/rest/api/playfab/server/player-data-management/updateuserpublisherreadonlydata
 */
export const UpdateUserPublisherReadOnlyData = async (request: UpdateUserDataRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<UpdateUserDataResult>('/Server/UpdateUserPublisherReadOnlyData', request, 'X-SecretKey', Settings.settings.secretKey)
    return result
}

/**
 * Updates the title-specific custom data for the user which can only be read by the client
 * https://docs.microsoft.com/rest/api/playfab/server/player-data-management/updateuserreadonlydata
 */
export const UpdateUserReadOnlyData = async (request: UpdateUserDataRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<UpdateUserDataResult>('/Server/UpdateUserReadOnlyData', request, 'X-SecretKey', Settings.settings.secretKey)
    return result
}

/**
 * Writes a character-based event into PlayStream.
 * https://docs.microsoft.com/rest/api/playfab/server/analytics/writecharacterevent
 */
export const WriteCharacterEvent = async (request: WriteClientCharacterEventRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<WriteEventResponse>('/Server/WriteCharacterEvent', request, 'X-SecretKey', Settings.settings.secretKey)
    return result
}

/**
 * Writes a player-based event into PlayStream.
 * https://docs.microsoft.com/rest/api/playfab/server/analytics/writeplayerevent
 */
export const WritePlayerEvent = async (request: WriteClientPlayerEventRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<WriteEventResponse>('/Server/WritePlayerEvent', request, 'X-SecretKey', Settings.settings.secretKey)
    return result
}

/**
 * Writes a title-based event into PlayStream.
 * https://docs.microsoft.com/rest/api/playfab/server/analytics/writetitleevent
 */
export const WriteTitleEvent = async (request: WriteTitleEventRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<WriteEventResponse>('/Server/WriteTitleEvent', request, 'X-SecretKey', Settings.settings.secretKey)
    return result
}