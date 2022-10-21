--!strict

local PlayFabInternal = require(script.Parent.Parent.PlayFabInternal)
local Types = require(script.Parent.Types)

local Apis = {}

--- https://docs.microsoft.com/rest/api/playfab/server/player-item-management/addcharactervirtualcurrency
function Apis.AddCharacterVirtualCurrencyAsync(
	secretKey: string, 
	request: Types.AddCharacterVirtualCurrencyRequest
): Types.ModifyCharacterVirtualCurrencyResult
	return PlayFabInternal.MakeApiCall(
		"/Server/AddCharacterVirtualCurrency",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/friend-list-management/addfriend
function Apis.AddFriendAsync(
	secretKey: string, 
	request: Types.AddFriendRequest
): Types.EmptyResponse
	return PlayFabInternal.MakeApiCall(
		"/Server/AddFriend",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/account-management/addgenericid
function Apis.AddGenericIDAsync(
	secretKey: string, 
	request: Types.AddGenericIDRequest
): Types.EmptyResult
	return PlayFabInternal.MakeApiCall(
		"/Server/AddGenericID",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- This API will trigger a player_tag_added event and add a tag with the given 
--- TagName and PlayFabID to the corresponding player profile. TagName can be used 
--- for segmentation and it is limited to 256 characters. Also there is a limit 
--- on the number of tags a title can have. 
---
--- https://docs.microsoft.com/rest/api/playfab/server/playstream/addplayertag
function Apis.AddPlayerTagAsync(
	secretKey: string, 
	request: Types.AddPlayerTagRequest
): Types.AddPlayerTagResult
	return PlayFabInternal.MakeApiCall(
		"/Server/AddPlayerTag",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/shared-group-data/addsharedgroupmembers
function Apis.AddSharedGroupMembersAsync(
	secretKey: string, 
	request: Types.AddSharedGroupMembersRequest
): Types.AddSharedGroupMembersResult
	return PlayFabInternal.MakeApiCall(
		"/Server/AddSharedGroupMembers",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/player-item-management/adduservirtualcurrency
function Apis.AddUserVirtualCurrencyAsync(
	secretKey: string, 
	request: Types.AddUserVirtualCurrencyRequest
): Types.ModifyUserVirtualCurrencyResult
	return PlayFabInternal.MakeApiCall(
		"/Server/AddUserVirtualCurrency",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- Note that data returned may be Personally Identifying Information (PII), such 
--- as email address, and so care should be taken in how this data is stored and 
--- managed. Since this call will always return the relevant information for users 
--- who have accessed the title, the recommendation is to not store this data locally. 
---
--- https://docs.microsoft.com/rest/api/playfab/server/authentication/authenticatesessionticket
function Apis.AuthenticateSessionTicketAsync(
	secretKey: string, 
	request: Types.AuthenticateSessionTicketRequest
): Types.AuthenticateSessionTicketResult
	return PlayFabInternal.MakeApiCall(
		"/Server/AuthenticateSessionTicket",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/platform-specific-methods/awardsteamachievement
function Apis.AwardSteamAchievementAsync(
	secretKey: string, 
	request: Types.AwardSteamAchievementRequest
): Types.AwardSteamAchievementResult
	return PlayFabInternal.MakeApiCall(
		"/Server/AwardSteamAchievement",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- The existence of each user will not be verified. When banning by IP or MAC address, 
--- multiple players may be affected, so use this feature with caution. Returns 
--- information about the new bans. 
---
--- https://docs.microsoft.com/rest/api/playfab/server/account-management/banusers
function Apis.BanUsersAsync(
	secretKey: string, 
	request: Types.BanUsersRequest
): Types.BanUsersResult
	return PlayFabInternal.MakeApiCall(
		"/Server/BanUsers",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/player-item-management/consumeitem
function Apis.ConsumeItemAsync(
	secretKey: string, 
	request: Types.ConsumeItemRequest
): Types.ConsumeItemResult
	return PlayFabInternal.MakeApiCall(
		"/Server/ConsumeItem",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- If SharedGroupId is specified, the service will attempt to create a group with 
--- that identifier, and will return an error if it is already in use. If no SharedGroupId 
--- is specified, a random identifier will be assigned. 
---
--- https://docs.microsoft.com/rest/api/playfab/server/shared-group-data/createsharedgroup
function Apis.CreateSharedGroupAsync(
	secretKey: string, 
	request: Types.CreateSharedGroupRequest
): Types.CreateSharedGroupResult
	return PlayFabInternal.MakeApiCall(
		"/Server/CreateSharedGroup",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- This function will delete the specified character from the list allowed by the 
--- user, and will also delete any inventory or VC currently held by that character. 
--- It will NOT delete any statistics associated for this character, in order to 
--- preserve leaderboard integrity. 
---
--- https://docs.microsoft.com/rest/api/playfab/server/characters/deletecharacterfromuser
function Apis.DeleteCharacterFromUserAsync(
	secretKey: string, 
	request: Types.DeleteCharacterFromUserRequest
): Types.DeleteCharacterFromUserResult
	return PlayFabInternal.MakeApiCall(
		"/Server/DeleteCharacterFromUser",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- Deletes all data associated with the player, including statistics, custom data, 
--- inventory, purchases, virtual currency balances, characters and shared group 
--- memberships. Removes the player from all leaderboards and player search indexes. 
--- Does not delete PlayStream event history associated with the player. Does not 
--- delete the publisher user account that created the player in the title nor associated 
--- data such as username, password, email address, account linkages, or friends 
--- list. Note, this API queues the player for deletion and returns immediately. 
--- It may take several minutes or more before all player data is fully deleted. 
--- Until the player data is fully deleted, attempts to recreate the player with 
--- the same user account in the same title will fail with the 'AccountDeleted' 
--- error. This API must be enabled for use as an option in the game manager website. 
--- It is disabled by default. 
---
--- https://docs.microsoft.com/rest/api/playfab/server/account-management/deleteplayer
function Apis.DeletePlayerAsync(
	secretKey: string, 
	request: Types.DeletePlayerRequest
): Types.DeletePlayerResult
	return PlayFabInternal.MakeApiCall(
		"/Server/DeletePlayer",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/account-management/deletepushnotificationtemplate
function Apis.DeletePushNotificationTemplateAsync(
	secretKey: string, 
	request: Types.DeletePushNotificationTemplateRequest
): Types.DeletePushNotificationTemplateResult
	return PlayFabInternal.MakeApiCall(
		"/Server/DeletePushNotificationTemplate",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/shared-group-data/deletesharedgroup
function Apis.DeleteSharedGroupAsync(
	secretKey: string, 
	request: Types.DeleteSharedGroupRequest
): Types.EmptyResponse
	return PlayFabInternal.MakeApiCall(
		"/Server/DeleteSharedGroup",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/matchmaking/deregistergame
function Apis.DeregisterGameAsync(
	secretKey: string, 
	request: Types.DeregisterGameRequest
): Types.DeregisterGameResponse
	return PlayFabInternal.MakeApiCall(
		"/Server/DeregisterGame",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/player-item-management/evaluaterandomresulttable
function Apis.EvaluateRandomResultTableAsync(
	secretKey: string, 
	request: Types.EvaluateRandomResultTableRequest
): Types.EvaluateRandomResultTableResult
	return PlayFabInternal.MakeApiCall(
		"/Server/EvaluateRandomResultTable",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/server-side-cloud-script/executecloudscript
function Apis.ExecuteCloudScriptAsync(
	secretKey: string, 
	request: Types.ExecuteCloudScriptServerRequest
): Types.ExecuteCloudScriptResult
	return PlayFabInternal.MakeApiCall(
		"/Server/ExecuteCloudScript",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- Request has no paramaters. 
---
--- https://docs.microsoft.com/rest/api/playfab/server/playstream/getallsegments
function Apis.GetAllSegmentsAsync(
	secretKey: string, 
	request: Types.GetAllSegmentsRequest
): Types.GetAllSegmentsResult
	return PlayFabInternal.MakeApiCall(
		"/Server/GetAllSegments",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- Returns a list of every character that currently belongs to a user. 
---
--- https://docs.microsoft.com/rest/api/playfab/server/characters/getalluserscharacters
function Apis.GetAllUsersCharactersAsync(
	secretKey: string, 
	request: Types.ListUsersCharactersRequest
): Types.ListUsersCharactersResult
	return PlayFabInternal.MakeApiCall(
		"/Server/GetAllUsersCharacters",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/title-wide-data-management/getcatalogitems
function Apis.GetCatalogItemsAsync(
	secretKey: string, 
	request: Types.GetCatalogItemsRequest
): Types.GetCatalogItemsResult
	return PlayFabInternal.MakeApiCall(
		"/Server/GetCatalogItems",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- Data is stored as JSON key-value pairs. If the Keys parameter is provided, the 
--- data object returned will only contain the data specific to the indicated Keys. 
--- Otherwise, the full set of custom user data will be returned. 
---
--- https://docs.microsoft.com/rest/api/playfab/server/character-data/getcharacterdata
function Apis.GetCharacterDataAsync(
	secretKey: string, 
	request: Types.GetCharacterDataRequest
): Types.GetCharacterDataResult
	return PlayFabInternal.MakeApiCall(
		"/Server/GetCharacterData",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- Data is stored as JSON key-value pairs. If the Keys parameter is provided, the 
--- data object returned will only contain the data specific to the indicated Keys. 
--- Otherwise, the full set of custom user data will be returned. 
---
--- https://docs.microsoft.com/rest/api/playfab/server/character-data/getcharacterinternaldata
function Apis.GetCharacterInternalDataAsync(
	secretKey: string, 
	request: Types.GetCharacterDataRequest
): Types.GetCharacterDataResult
	return PlayFabInternal.MakeApiCall(
		"/Server/GetCharacterInternalData",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- All items currently in the character inventory will be returned, irrespective 
--- of how they were acquired (via purchasing, grants, coupons, etc.). Items that 
--- are expired, fully consumed, or are no longer valid are not considered to be 
--- in the user's current inventory, and so will not be not included. Also returns 
--- their virtual currency balances. 
---
--- https://docs.microsoft.com/rest/api/playfab/server/player-item-management/getcharacterinventory
function Apis.GetCharacterInventoryAsync(
	secretKey: string, 
	request: Types.GetCharacterInventoryRequest
): Types.GetCharacterInventoryResult
	return PlayFabInternal.MakeApiCall(
		"/Server/GetCharacterInventory",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/characters/getcharacterleaderboard
function Apis.GetCharacterLeaderboardAsync(
	secretKey: string, 
	request: Types.GetCharacterLeaderboardRequest
): Types.GetCharacterLeaderboardResult
	return PlayFabInternal.MakeApiCall(
		"/Server/GetCharacterLeaderboard",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- Data is stored as JSON key-value pairs. If the Keys parameter is provided, the 
--- data object returned will only contain the data specific to the indicated Keys. 
--- Otherwise, the full set of custom data will be returned. 
---
--- https://docs.microsoft.com/rest/api/playfab/server/character-data/getcharacterreadonlydata
function Apis.GetCharacterReadOnlyDataAsync(
	secretKey: string, 
	request: Types.GetCharacterDataRequest
): Types.GetCharacterDataResult
	return PlayFabInternal.MakeApiCall(
		"/Server/GetCharacterReadOnlyData",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- Character statistics are similar to user statistics in that they are numeric 
--- values which may only be updated by a server operation, in order to minimize 
--- the opportunity for unauthorized changes. In addition to being available for 
--- use by the title, the statistics are used for all leaderboard operations in 
--- PlayFab. 
---
--- https://docs.microsoft.com/rest/api/playfab/server/characters/getcharacterstatistics
function Apis.GetCharacterStatisticsAsync(
	secretKey: string, 
	request: Types.GetCharacterStatisticsRequest
): Types.GetCharacterStatisticsResult
	return PlayFabInternal.MakeApiCall(
		"/Server/GetCharacterStatistics",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/content/getcontentdownloadurl
function Apis.GetContentDownloadUrlAsync(
	secretKey: string, 
	request: Types.GetContentDownloadUrlRequest
): Types.GetContentDownloadUrlResult
	return PlayFabInternal.MakeApiCall(
		"/Server/GetContentDownloadUrl",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/player-data-management/getfriendleaderboard
function Apis.GetFriendLeaderboardAsync(
	secretKey: string, 
	request: Types.GetFriendLeaderboardRequest
): Types.GetLeaderboardResult
	return PlayFabInternal.MakeApiCall(
		"/Server/GetFriendLeaderboard",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/friend-list-management/getfriendslist
function Apis.GetFriendsListAsync(
	secretKey: string, 
	request: Types.GetFriendsListRequest
): Types.GetFriendsListResult
	return PlayFabInternal.MakeApiCall(
		"/Server/GetFriendsList",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/player-data-management/getleaderboard
function Apis.GetLeaderboardAsync(
	secretKey: string, 
	request: Types.GetLeaderboardRequest
): Types.GetLeaderboardResult
	return PlayFabInternal.MakeApiCall(
		"/Server/GetLeaderboard",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/characters/getleaderboardaroundcharacter
function Apis.GetLeaderboardAroundCharacterAsync(
	secretKey: string, 
	request: Types.GetLeaderboardAroundCharacterRequest
): Types.GetLeaderboardAroundCharacterResult
	return PlayFabInternal.MakeApiCall(
		"/Server/GetLeaderboardAroundCharacter",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/player-data-management/getleaderboardarounduser
function Apis.GetLeaderboardAroundUserAsync(
	secretKey: string, 
	request: Types.GetLeaderboardAroundUserRequest
): Types.GetLeaderboardAroundUserResult
	return PlayFabInternal.MakeApiCall(
		"/Server/GetLeaderboardAroundUser",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/characters/getleaderboardforusercharacters
function Apis.GetLeaderboardForUserCharactersAsync(
	secretKey: string, 
	request: Types.GetLeaderboardForUsersCharactersRequest
): Types.GetLeaderboardForUsersCharactersResult
	return PlayFabInternal.MakeApiCall(
		"/Server/GetLeaderboardForUserCharacters",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/account-management/getplayfabidsfromfacebookids
function Apis.GetPlayFabIDsFromFacebookIDsAsync(
	secretKey: string, 
	request: Types.GetPlayFabIDsFromFacebookIDsRequest
): Types.GetPlayFabIDsFromFacebookIDsResult
	return PlayFabInternal.MakeApiCall(
		"/Server/GetPlayFabIDsFromFacebookIDs",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/account-management/getplayfabidsfromfacebookinstantgamesids
function Apis.GetPlayFabIDsFromFacebookInstantGamesIdsAsync(
	secretKey: string, 
	request: Types.GetPlayFabIDsFromFacebookInstantGamesIdsRequest
): Types.GetPlayFabIDsFromFacebookInstantGamesIdsResult
	return PlayFabInternal.MakeApiCall(
		"/Server/GetPlayFabIDsFromFacebookInstantGamesIds",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/account-management/getplayfabidsfromgenericids
function Apis.GetPlayFabIDsFromGenericIDsAsync(
	secretKey: string, 
	request: Types.GetPlayFabIDsFromGenericIDsRequest
): Types.GetPlayFabIDsFromGenericIDsResult
	return PlayFabInternal.MakeApiCall(
		"/Server/GetPlayFabIDsFromGenericIDs",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/account-management/getplayfabidsfromnintendoserviceaccountids
function Apis.GetPlayFabIDsFromNintendoServiceAccountIdsAsync(
	secretKey: string, 
	request: Types.GetPlayFabIDsFromNintendoServiceAccountIdsRequest
): Types.GetPlayFabIDsFromNintendoServiceAccountIdsResult
	return PlayFabInternal.MakeApiCall(
		"/Server/GetPlayFabIDsFromNintendoServiceAccountIds",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/account-management/getplayfabidsfromnintendoswitchdeviceids
function Apis.GetPlayFabIDsFromNintendoSwitchDeviceIdsAsync(
	secretKey: string, 
	request: Types.GetPlayFabIDsFromNintendoSwitchDeviceIdsRequest
): Types.GetPlayFabIDsFromNintendoSwitchDeviceIdsResult
	return PlayFabInternal.MakeApiCall(
		"/Server/GetPlayFabIDsFromNintendoSwitchDeviceIds",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/account-management/getplayfabidsfrompsnaccountids
function Apis.GetPlayFabIDsFromPSNAccountIDsAsync(
	secretKey: string, 
	request: Types.GetPlayFabIDsFromPSNAccountIDsRequest
): Types.GetPlayFabIDsFromPSNAccountIDsResult
	return PlayFabInternal.MakeApiCall(
		"/Server/GetPlayFabIDsFromPSNAccountIDs",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/account-management/getplayfabidsfromsteamids
function Apis.GetPlayFabIDsFromSteamIDsAsync(
	secretKey: string, 
	request: Types.GetPlayFabIDsFromSteamIDsRequest
): Types.GetPlayFabIDsFromSteamIDsResult
	return PlayFabInternal.MakeApiCall(
		"/Server/GetPlayFabIDsFromSteamIDs",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/account-management/getplayfabidsfromtwitchids
function Apis.GetPlayFabIDsFromTwitchIDsAsync(
	secretKey: string, 
	request: Types.GetPlayFabIDsFromTwitchIDsRequest
): Types.GetPlayFabIDsFromTwitchIDsResult
	return PlayFabInternal.MakeApiCall(
		"/Server/GetPlayFabIDsFromTwitchIDs",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/account-management/getplayfabidsfromxboxliveids
function Apis.GetPlayFabIDsFromXboxLiveIDsAsync(
	secretKey: string, 
	request: Types.GetPlayFabIDsFromXboxLiveIDsRequest
): Types.GetPlayFabIDsFromXboxLiveIDsResult
	return PlayFabInternal.MakeApiCall(
		"/Server/GetPlayFabIDsFromXboxLiveIDs",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/player-data-management/getplayercombinedinfo
function Apis.GetPlayerCombinedInfoAsync(
	secretKey: string, 
	request: Types.GetPlayerCombinedInfoRequest
): Types.GetPlayerCombinedInfoResult
	return PlayFabInternal.MakeApiCall(
		"/Server/GetPlayerCombinedInfo",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- This API allows for access to details regarding a user in the PlayFab service, 
--- usually for purposes of customer support. Note that data returned may be Personally 
--- Identifying Information (PII), such as email address, and so care should be 
--- taken in how this data is stored and managed. Since this call will always return 
--- the relevant information for users who have accessed the title, the recommendation 
--- is to not store this data locally. 
---
--- https://docs.microsoft.com/rest/api/playfab/server/account-management/getplayerprofile
function Apis.GetPlayerProfileAsync(
	secretKey: string, 
	request: Types.GetPlayerProfileRequest
): Types.GetPlayerProfileResult
	return PlayFabInternal.MakeApiCall(
		"/Server/GetPlayerProfile",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/playstream/getplayersegments
function Apis.GetPlayerSegmentsAsync(
	secretKey: string, 
	request: Types.GetPlayersSegmentsRequest
): Types.GetPlayerSegmentsResult
	return PlayFabInternal.MakeApiCall(
		"/Server/GetPlayerSegments",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/player-data-management/getplayerstatisticversions
function Apis.GetPlayerStatisticVersionsAsync(
	secretKey: string, 
	request: Types.GetPlayerStatisticVersionsRequest
): Types.GetPlayerStatisticVersionsResult
	return PlayFabInternal.MakeApiCall(
		"/Server/GetPlayerStatisticVersions",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/player-data-management/getplayerstatistics
function Apis.GetPlayerStatisticsAsync(
	secretKey: string, 
	request: Types.GetPlayerStatisticsRequest
): Types.GetPlayerStatisticsResult
	return PlayFabInternal.MakeApiCall(
		"/Server/GetPlayerStatistics",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- This API will return a list of canonical tags which includes both namespace 
--- and tag's name. If namespace is not provided, the result is a list of all canonical 
--- tags. TagName can be used for segmentation and Namespace is limited to 128 characters. 
---
--- https://docs.microsoft.com/rest/api/playfab/server/playstream/getplayertags
function Apis.GetPlayerTagsAsync(
	secretKey: string, 
	request: Types.GetPlayerTagsRequest
): Types.GetPlayerTagsResult
	return PlayFabInternal.MakeApiCall(
		"/Server/GetPlayerTags",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- Initial request must contain at least a Segment ID. Subsequent requests must 
--- contain the Segment ID as well as the Continuation Token. Failure to send the 
--- Continuation Token will result in a new player segment list being generated. 
--- Each time the Continuation Token is passed in the length of the Total Seconds 
--- to Live is refreshed. If too much time passes between requests to the point 
--- that a subsequent request is past the Total Seconds to Live an error will be 
--- returned and paging will be terminated. This API is resource intensive and should 
--- not be used in scenarios which might generate high request volumes. Only one 
--- request to this API at a time should be made per title. Concurrent requests 
--- to the API may be rejected with the APIConcurrentRequestLimitExceeded error. 
---
--- https://docs.microsoft.com/rest/api/playfab/server/playstream/getplayersinsegment
function Apis.GetPlayersInSegmentAsync(
	secretKey: string, 
	request: Types.GetPlayersInSegmentRequest
): Types.GetPlayersInSegmentResult
	return PlayFabInternal.MakeApiCall(
		"/Server/GetPlayersInSegment",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- This API is designed to return publisher-specific values which can be read, 
--- but not written to, by the client. This data is shared across all titles assigned 
--- to a particular publisher, and can be used for cross-game coordination. Only 
--- titles assigned to a publisher can use this API. For more information email 
--- helloplayfab@microsoft.com. Note that there may up to a minute delay in between 
--- updating title data and this API call returning the newest value. 
---
--- https://docs.microsoft.com/rest/api/playfab/server/title-wide-data-management/getpublisherdata
function Apis.GetPublisherDataAsync(
	secretKey: string, 
	request: Types.GetPublisherDataRequest
): Types.GetPublisherDataResult
	return PlayFabInternal.MakeApiCall(
		"/Server/GetPublisherData",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/player-item-management/getrandomresulttables
function Apis.GetRandomResultTablesAsync(
	secretKey: string, 
	request: Types.GetRandomResultTablesRequest
): Types.GetRandomResultTablesResult
	return PlayFabInternal.MakeApiCall(
		"/Server/GetRandomResultTables",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/account-management/getservercustomidsfromplayfabids
function Apis.GetServerCustomIDsFromPlayFabIDsAsync(
	secretKey: string, 
	request: Types.GetServerCustomIDsFromPlayFabIDsRequest
): Types.GetServerCustomIDsFromPlayFabIDsResult
	return PlayFabInternal.MakeApiCall(
		"/Server/GetServerCustomIDsFromPlayFabIDs",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/shared-group-data/getsharedgroupdata
function Apis.GetSharedGroupDataAsync(
	secretKey: string, 
	request: Types.GetSharedGroupDataRequest
): Types.GetSharedGroupDataResult
	return PlayFabInternal.MakeApiCall(
		"/Server/GetSharedGroupData",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- A store contains an array of references to items defined in one or more catalog 
--- versions of the game, along with the prices for the item, in both real world 
--- and virtual currencies. These prices act as an override to any prices defined 
--- in the catalog. In this way, the base definitions of the items may be defined 
--- in the catalog, with all associated properties, while the pricing can be set 
--- for each store, as needed. This allows for subsets of goods to be defined for 
--- different purposes (in order to simplify showing some, but not all catalog items 
--- to users, based upon different characteristics), along with unique prices. Note 
--- that all prices defined in the catalog and store definitions for the item are 
--- considered valid, and that a compromised client can be made to send a request 
--- for an item based upon any of these definitions. If no price is specified in 
--- the store for an item, the price set in the catalog should be displayed to the 
--- user. 
---
--- https://docs.microsoft.com/rest/api/playfab/server/title-wide-data-management/getstoreitems
function Apis.GetStoreItemsAsync(
	secretKey: string, 
	request: Types.GetStoreItemsServerRequest
): Types.GetStoreItemsResult
	return PlayFabInternal.MakeApiCall(
		"/Server/GetStoreItems",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- This query retrieves the current time from one of the servers in PlayFab. Please 
--- note that due to clock drift between servers, there is a potential variance 
--- of up to 5 seconds. 
---
--- https://docs.microsoft.com/rest/api/playfab/server/title-wide-data-management/gettime
function Apis.GetTimeAsync(
	secretKey: string, 
	request: Types.GetTimeRequest
): Types.GetTimeResult
	return PlayFabInternal.MakeApiCall(
		"/Server/GetTime",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- This API is designed to return title specific values which can be read, but 
--- not written to, by the client. For example, a developer could choose to store 
--- values which modify the user experience, such as enemy spawn rates, weapon strengths, 
--- movement speeds, etc. This allows a developer to update the title without the 
--- need to create, test, and ship a new build. If an override label is specified 
--- in the request, the overrides are applied automatically and returned with the 
--- title data. Note that there may up to a minute delay in between updating title 
--- data and this API call returning the newest value. 
---
--- https://docs.microsoft.com/rest/api/playfab/server/title-wide-data-management/gettitledata
function Apis.GetTitleDataAsync(
	secretKey: string, 
	request: Types.GetTitleDataRequest
): Types.GetTitleDataResult
	return PlayFabInternal.MakeApiCall(
		"/Server/GetTitleData",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- This API is designed to return title specific values which are accessible only 
--- to the server. This can be used to tweak settings on game servers and Cloud 
--- Scripts without needed to update and re-deploy them. Note that there may up 
--- to a minute delay in between updating title data and this API call returning 
--- the newest value. 
---
--- https://docs.microsoft.com/rest/api/playfab/server/title-wide-data-management/gettitleinternaldata
function Apis.GetTitleInternalDataAsync(
	secretKey: string, 
	request: Types.GetTitleDataRequest
): Types.GetTitleDataResult
	return PlayFabInternal.MakeApiCall(
		"/Server/GetTitleInternalData",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/title-wide-data-management/gettitlenews
function Apis.GetTitleNewsAsync(
	secretKey: string, 
	request: Types.GetTitleNewsRequest
): Types.GetTitleNewsResult
	return PlayFabInternal.MakeApiCall(
		"/Server/GetTitleNews",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- This API allows for access to details regarding a user in the PlayFab service, 
--- usually for purposes of customer support. Note that data returned may be Personally 
--- Identifying Information (PII), such as email address, and so care should be 
--- taken in how this data is stored and managed. Since this call will always return 
--- the relevant information for users who have accessed the title, the recommendation 
--- is to not store this data locally. 
---
--- https://docs.microsoft.com/rest/api/playfab/server/account-management/getuseraccountinfo
function Apis.GetUserAccountInfoAsync(
	secretKey: string, 
	request: Types.GetUserAccountInfoRequest
): Types.GetUserAccountInfoResult
	return PlayFabInternal.MakeApiCall(
		"/Server/GetUserAccountInfo",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- Get all bans for a user, including inactive and expired bans.  
---
--- https://docs.microsoft.com/rest/api/playfab/server/account-management/getuserbans
function Apis.GetUserBansAsync(
	secretKey: string, 
	request: Types.GetUserBansRequest
): Types.GetUserBansResult
	return PlayFabInternal.MakeApiCall(
		"/Server/GetUserBans",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- Data is stored as JSON key-value pairs. If the Keys parameter is provided, the 
--- data object returned will only contain the data specific to the indicated Keys. 
--- Otherwise, the full set of custom user data will be returned. 
---
--- https://docs.microsoft.com/rest/api/playfab/server/player-data-management/getuserdata
function Apis.GetUserDataAsync(
	secretKey: string, 
	request: Types.GetUserDataRequest
): Types.GetUserDataResult
	return PlayFabInternal.MakeApiCall(
		"/Server/GetUserData",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- Data is stored as JSON key-value pairs. If the Keys parameter is provided, the 
--- data object returned will only contain the data specific to the indicated Keys. 
--- Otherwise, the full set of custom user data will be returned. 
---
--- https://docs.microsoft.com/rest/api/playfab/server/player-data-management/getuserinternaldata
function Apis.GetUserInternalDataAsync(
	secretKey: string, 
	request: Types.GetUserDataRequest
): Types.GetUserDataResult
	return PlayFabInternal.MakeApiCall(
		"/Server/GetUserInternalData",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- All items currently in the user inventory will be returned, irrespective of 
--- how they were acquired (via purchasing, grants, coupons, etc.). Items that are 
--- expired, fully consumed, or are no longer valid are not considered to be in 
--- the user's current inventory, and so will not be not included. 
---
--- https://docs.microsoft.com/rest/api/playfab/server/player-item-management/getuserinventory
function Apis.GetUserInventoryAsync(
	secretKey: string, 
	request: Types.GetUserInventoryRequest
): Types.GetUserInventoryResult
	return PlayFabInternal.MakeApiCall(
		"/Server/GetUserInventory",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- Data is stored as JSON key-value pairs. If the Keys parameter is provided, the 
--- data object returned will only contain the data specific to the indicated Keys. 
--- Otherwise, the full set of custom user data will be returned. 
---
--- https://docs.microsoft.com/rest/api/playfab/server/player-data-management/getuserpublisherdata
function Apis.GetUserPublisherDataAsync(
	secretKey: string, 
	request: Types.GetUserDataRequest
): Types.GetUserDataResult
	return PlayFabInternal.MakeApiCall(
		"/Server/GetUserPublisherData",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- Data is stored as JSON key-value pairs. If the Keys parameter is provided, the 
--- data object returned will only contain the data specific to the indicated Keys. 
--- Otherwise, the full set of custom user data will be returned. 
---
--- https://docs.microsoft.com/rest/api/playfab/server/player-data-management/getuserpublisherinternaldata
function Apis.GetUserPublisherInternalDataAsync(
	secretKey: string, 
	request: Types.GetUserDataRequest
): Types.GetUserDataResult
	return PlayFabInternal.MakeApiCall(
		"/Server/GetUserPublisherInternalData",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- Data is stored as JSON key-value pairs. If the Keys parameter is provided, the 
--- data object returned will only contain the data specific to the indicated Keys. 
--- Otherwise, the full set of custom user data will be returned. 
---
--- https://docs.microsoft.com/rest/api/playfab/server/player-data-management/getuserpublisherreadonlydata
function Apis.GetUserPublisherReadOnlyDataAsync(
	secretKey: string, 
	request: Types.GetUserDataRequest
): Types.GetUserDataResult
	return PlayFabInternal.MakeApiCall(
		"/Server/GetUserPublisherReadOnlyData",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- Data is stored as JSON key-value pairs. If the Keys parameter is provided, the 
--- data object returned will only contain the data specific to the indicated Keys. 
--- Otherwise, the full set of custom user data will be returned. 
---
--- https://docs.microsoft.com/rest/api/playfab/server/player-data-management/getuserreadonlydata
function Apis.GetUserReadOnlyDataAsync(
	secretKey: string, 
	request: Types.GetUserDataRequest
): Types.GetUserDataResult
	return PlayFabInternal.MakeApiCall(
		"/Server/GetUserReadOnlyData",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- Grants a character to the user of the type and name specified in the request. 
---
--- https://docs.microsoft.com/rest/api/playfab/server/characters/grantcharactertouser
function Apis.GrantCharacterToUserAsync(
	secretKey: string, 
	request: Types.GrantCharacterToUserRequest
): Types.GrantCharacterToUserResult
	return PlayFabInternal.MakeApiCall(
		"/Server/GrantCharacterToUser",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- This function directly adds inventory items to the character's inventories. 
--- As a result of this operations, the user will not be charged any transaction 
--- fee, regardless of the inventory item catalog definition. Please note that the 
--- processing time for inventory grants and purchases increases fractionally the 
--- more items are in the inventory, and the more items are in the grant/purchase 
--- operation. 
---
--- https://docs.microsoft.com/rest/api/playfab/server/player-item-management/grantitemstocharacter
function Apis.GrantItemsToCharacterAsync(
	secretKey: string, 
	request: Types.GrantItemsToCharacterRequest
): Types.GrantItemsToCharacterResult
	return PlayFabInternal.MakeApiCall(
		"/Server/GrantItemsToCharacter",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- This function directly adds inventory items to the user's inventories. As a 
--- result of this operations, the user will not be charged any transaction fee, 
--- regardless of the inventory item catalog definition. Please note that the processing 
--- time for inventory grants and purchases increases fractionally the more items 
--- are in the inventory, and the more items are in the grant/purchase operation. 
---
--- https://docs.microsoft.com/rest/api/playfab/server/player-item-management/grantitemstouser
function Apis.GrantItemsToUserAsync(
	secretKey: string, 
	request: Types.GrantItemsToUserRequest
): Types.GrantItemsToUserResult
	return PlayFabInternal.MakeApiCall(
		"/Server/GrantItemsToUser",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- This function directly adds inventory items to user inventories. As a result 
--- of this operations, the user will not be charged any transaction fee, regardless 
--- of the inventory item catalog definition. Please note that the processing time 
--- for inventory grants and purchases increases fractionally the more items are 
--- in the inventory, and the more items are in the grant/purchase operation. 
---
--- https://docs.microsoft.com/rest/api/playfab/server/player-item-management/grantitemstousers
function Apis.GrantItemsToUsersAsync(
	secretKey: string, 
	request: Types.GrantItemsToUsersRequest
): Types.GrantItemsToUsersResult
	return PlayFabInternal.MakeApiCall(
		"/Server/GrantItemsToUsers",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/account-management/linknintendoserviceaccount
function Apis.LinkNintendoServiceAccountAsync(
	secretKey: string, 
	request: Types.LinkNintendoServiceAccountRequest
): Types.EmptyResult
	return PlayFabInternal.MakeApiCall(
		"/Server/LinkNintendoServiceAccount",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/account-management/linknintendoswitchdeviceid
function Apis.LinkNintendoSwitchDeviceIdAsync(
	secretKey: string, 
	request: Types.LinkNintendoSwitchDeviceIdRequest
): Types.LinkNintendoSwitchDeviceIdResult
	return PlayFabInternal.MakeApiCall(
		"/Server/LinkNintendoSwitchDeviceId",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/account-management/linkpsnaccount
function Apis.LinkPSNAccountAsync(
	secretKey: string, 
	request: Types.LinkPSNAccountRequest
): Types.LinkPSNAccountResult
	return PlayFabInternal.MakeApiCall(
		"/Server/LinkPSNAccount",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/account-management/linkservercustomid
function Apis.LinkServerCustomIdAsync(
	secretKey: string, 
	request: Types.LinkServerCustomIdRequest
): Types.LinkServerCustomIdResult
	return PlayFabInternal.MakeApiCall(
		"/Server/LinkServerCustomId",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/account-management/linkxboxaccount
function Apis.LinkXboxAccountAsync(
	secretKey: string, 
	request: Types.LinkXboxAccountRequest
): Types.LinkXboxAccountResult
	return PlayFabInternal.MakeApiCall(
		"/Server/LinkXboxAccount",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/authentication/loginwithservercustomid
function Apis.LoginWithServerCustomIdAsync(
	secretKey: string, 
	request: Types.LoginWithServerCustomIdRequest
): Types.ServerLoginResult
	return PlayFabInternal.MakeApiCall(
		"/Server/LoginWithServerCustomId",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- If this is the first time a user has signed in with the Steam ID and CreateAccount 
--- is set to true, a new PlayFab account will be created and linked to the Steam 
--- account. In this case, no email or username will be associated with the PlayFab 
--- account. Otherwise, if no PlayFab account is linked to the Steam account, an 
--- error indicating this will be returned, so that the title can guide the user 
--- through creation of a PlayFab account. Steam users that are not logged into 
--- the Steam Client app will only have their Steam username synced, other data, 
--- such as currency and country will not be available until they login while the 
--- Client is open. 
---
--- https://docs.microsoft.com/rest/api/playfab/server/authentication/loginwithsteamid
function Apis.LoginWithSteamIdAsync(
	secretKey: string, 
	request: Types.LoginWithSteamIdRequest
): Types.ServerLoginResult
	return PlayFabInternal.MakeApiCall(
		"/Server/LoginWithSteamId",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- If this is the first time a user has signed in with the Xbox Live account and 
--- CreateAccount is set to true, a new PlayFab account will be created and linked 
--- to the Xbox Live account. In this case, no email or username will be associated 
--- with the PlayFab account. Otherwise, if no PlayFab account is linked to the 
--- Xbox Live account, an error indicating this will be returned, so that the title 
--- can guide the user through creation of a PlayFab account. 
---
--- https://docs.microsoft.com/rest/api/playfab/server/authentication/loginwithxbox
function Apis.LoginWithXboxAsync(
	secretKey: string, 
	request: Types.LoginWithXboxRequest
): Types.ServerLoginResult
	return PlayFabInternal.MakeApiCall(
		"/Server/LoginWithXbox",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- If this is the first time a user has signed in with the Xbox ID and CreateAccount 
--- is set to true, a new PlayFab account will be created and linked to the Xbox 
--- Live account. In this case, no email or username will be associated with the 
--- PlayFab account. Otherwise, if no PlayFab account is linked to the Xbox Live 
--- account, an error indicating this will be returned, so that the title can guide 
--- the user through creation of a PlayFab account. 
---
--- https://docs.microsoft.com/rest/api/playfab/server/authentication/loginwithxboxid
function Apis.LoginWithXboxIdAsync(
	secretKey: string, 
	request: Types.LoginWithXboxIdRequest
): Types.ServerLoginResult
	return PlayFabInternal.MakeApiCall(
		"/Server/LoginWithXboxId",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- This function can both add and remove uses of an inventory item. If the number 
--- of uses drops below zero, the item will be removed from active inventory. 
---
--- https://docs.microsoft.com/rest/api/playfab/server/player-item-management/modifyitemuses
function Apis.ModifyItemUsesAsync(
	secretKey: string, 
	request: Types.ModifyItemUsesRequest
): Types.ModifyItemUsesResult
	return PlayFabInternal.MakeApiCall(
		"/Server/ModifyItemUses",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- Transfers an item from a character to another character that is owned by the 
--- same user. This will remove the item from the character's inventory (until and 
--- unless it is moved back), and will enable the other character to make use of 
--- the item instead. 
---
--- https://docs.microsoft.com/rest/api/playfab/server/player-item-management/moveitemtocharacterfromcharacter
function Apis.MoveItemToCharacterFromCharacterAsync(
	secretKey: string, 
	request: Types.MoveItemToCharacterFromCharacterRequest
): Types.MoveItemToCharacterFromCharacterResult
	return PlayFabInternal.MakeApiCall(
		"/Server/MoveItemToCharacterFromCharacter",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- Transfers an item from a user to a character she owns. This will remove the 
--- item from the user's inventory (until and unless it is moved back), and will 
--- enable the character to make use of the item instead. 
---
--- https://docs.microsoft.com/rest/api/playfab/server/player-item-management/moveitemtocharacterfromuser
function Apis.MoveItemToCharacterFromUserAsync(
	secretKey: string, 
	request: Types.MoveItemToCharacterFromUserRequest
): Types.MoveItemToCharacterFromUserResult
	return PlayFabInternal.MakeApiCall(
		"/Server/MoveItemToCharacterFromUser",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- Transfers an item from a character to the owning user. This will remove the 
--- item from the character's inventory (until and unless it is moved back), and 
--- will enable the user to make use of the item instead. 
---
--- https://docs.microsoft.com/rest/api/playfab/server/player-item-management/moveitemtouserfromcharacter
function Apis.MoveItemToUserFromCharacterAsync(
	secretKey: string, 
	request: Types.MoveItemToUserFromCharacterRequest
): Types.MoveItemToUserFromCharacterResult
	return PlayFabInternal.MakeApiCall(
		"/Server/MoveItemToUserFromCharacter",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/matchmaking/notifymatchmakerplayerleft
function Apis.NotifyMatchmakerPlayerLeftAsync(
	secretKey: string, 
	request: Types.NotifyMatchmakerPlayerLeftRequest
): Types.NotifyMatchmakerPlayerLeftResult
	return PlayFabInternal.MakeApiCall(
		"/Server/NotifyMatchmakerPlayerLeft",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- Coupon codes can be created for any item, or set of items, in the catalog for 
--- the title. This operation causes the coupon to be consumed, and the specific 
--- items to be awarded to the user. Attempting to re-use an already consumed code, 
--- or a code which has not yet been created in the service, will result in an error. 
---
--- https://docs.microsoft.com/rest/api/playfab/server/player-item-management/redeemcoupon
function Apis.RedeemCouponAsync(
	secretKey: string, 
	request: Types.RedeemCouponRequest
): Types.RedeemCouponResult
	return PlayFabInternal.MakeApiCall(
		"/Server/RedeemCoupon",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- This function is used by a Game Server Instance to validate with the PlayFab 
--- service that a user has been registered as connected to the server. The Ticket 
--- is provided to the client either as a result of a call to StartGame or Matchmake, 
--- each of which return a Ticket specific to the Game Server Instance. This function 
--- will fail in any case where the Ticket presented is not valid for the specific 
--- Game Server Instance making the call. Note that data returned may be Personally 
--- Identifying Information (PII), such as email address, and so care should be 
--- taken in how this data is stored and managed. Since this call will always return 
--- the relevant information for users who have accessed the title, the recommendation 
--- is to not store this data locally. 
---
--- https://docs.microsoft.com/rest/api/playfab/server/matchmaking/redeemmatchmakerticket
function Apis.RedeemMatchmakerTicketAsync(
	secretKey: string, 
	request: Types.RedeemMatchmakerTicketRequest
): Types.RedeemMatchmakerTicketResult
	return PlayFabInternal.MakeApiCall(
		"/Server/RedeemMatchmakerTicket",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/matchmaking/refreshgameserverinstanceheartbeat
function Apis.RefreshGameServerInstanceHeartbeatAsync(
	secretKey: string, 
	request: Types.RefreshGameServerInstanceHeartbeatRequest
): Types.RefreshGameServerInstanceHeartbeatResult
	return PlayFabInternal.MakeApiCall(
		"/Server/RefreshGameServerInstanceHeartbeat",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/matchmaking/registergame
function Apis.RegisterGameAsync(
	secretKey: string, 
	request: Types.RegisterGameRequest
): Types.RegisterGameResponse
	return PlayFabInternal.MakeApiCall(
		"/Server/RegisterGame",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/friend-list-management/removefriend
function Apis.RemoveFriendAsync(
	secretKey: string, 
	request: Types.RemoveFriendRequest
): Types.EmptyResponse
	return PlayFabInternal.MakeApiCall(
		"/Server/RemoveFriend",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/account-management/removegenericid
function Apis.RemoveGenericIDAsync(
	secretKey: string, 
	request: Types.RemoveGenericIDRequest
): Types.EmptyResult
	return PlayFabInternal.MakeApiCall(
		"/Server/RemoveGenericID",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- This API will trigger a player_tag_removed event and remove a tag with the given 
--- TagName and PlayFabID from the corresponding player profile. TagName can be 
--- used for segmentation and it is limited to 256 characters 
---
--- https://docs.microsoft.com/rest/api/playfab/server/playstream/removeplayertag
function Apis.RemovePlayerTagAsync(
	secretKey: string, 
	request: Types.RemovePlayerTagRequest
): Types.RemovePlayerTagResult
	return PlayFabInternal.MakeApiCall(
		"/Server/RemovePlayerTag",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/shared-group-data/removesharedgroupmembers
function Apis.RemoveSharedGroupMembersAsync(
	secretKey: string, 
	request: Types.RemoveSharedGroupMembersRequest
): Types.RemoveSharedGroupMembersResult
	return PlayFabInternal.MakeApiCall(
		"/Server/RemoveSharedGroupMembers",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/player-item-management/reportplayer
function Apis.ReportPlayerAsync(
	secretKey: string, 
	request: Types.ReportPlayerServerRequest
): Types.ReportPlayerServerResult
	return PlayFabInternal.MakeApiCall(
		"/Server/ReportPlayer",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- Setting the active state of all non-expired bans for a user to Inactive. Expired 
--- bans with an Active state will be ignored, however. Returns information about 
--- applied updates only. 
---
--- https://docs.microsoft.com/rest/api/playfab/server/account-management/revokeallbansforuser
function Apis.RevokeAllBansForUserAsync(
	secretKey: string, 
	request: Types.RevokeAllBansForUserRequest
): Types.RevokeAllBansForUserResult
	return PlayFabInternal.MakeApiCall(
		"/Server/RevokeAllBansForUser",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- Setting the active state of all bans requested to Inactive regardless of whether 
--- that ban has already expired. BanIds that do not exist will be skipped. Returns 
--- information about applied updates only.  
---
--- https://docs.microsoft.com/rest/api/playfab/server/account-management/revokebans
function Apis.RevokeBansAsync(
	secretKey: string, 
	request: Types.RevokeBansRequest
): Types.RevokeBansResult
	return PlayFabInternal.MakeApiCall(
		"/Server/RevokeBans",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- In cases where the inventory item in question is a "crate", and the items it 
--- contained have already been dispensed, this will not revoke access or otherwise 
--- remove the items which were dispensed. 
---
--- https://docs.microsoft.com/rest/api/playfab/server/player-item-management/revokeinventoryitem
function Apis.RevokeInventoryItemAsync(
	secretKey: string, 
	request: Types.RevokeInventoryItemRequest
): Types.RevokeInventoryResult
	return PlayFabInternal.MakeApiCall(
		"/Server/RevokeInventoryItem",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- In cases where the inventory item in question is a "crate", and the items it 
--- contained have already been dispensed, this will not revoke access or otherwise 
--- remove the items which were dispensed. 
---
--- https://docs.microsoft.com/rest/api/playfab/server/player-item-management/revokeinventoryitems
function Apis.RevokeInventoryItemsAsync(
	secretKey: string, 
	request: Types.RevokeInventoryItemsRequest
): Types.RevokeInventoryItemsResult
	return PlayFabInternal.MakeApiCall(
		"/Server/RevokeInventoryItems",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/account-management/savepushnotificationtemplate
function Apis.SavePushNotificationTemplateAsync(
	secretKey: string, 
	request: Types.SavePushNotificationTemplateRequest
): Types.SavePushNotificationTemplateResult
	return PlayFabInternal.MakeApiCall(
		"/Server/SavePushNotificationTemplate",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- PlayFab accounts which have valid email address or username will be able to 
--- receive a password reset email using this API.The email sent must be an account 
--- recovery email template. The username or email can be passed in to send the 
--- email 
---
--- https://docs.microsoft.com/rest/api/playfab/server/account-management/sendcustomaccountrecoveryemail
function Apis.SendCustomAccountRecoveryEmailAsync(
	secretKey: string, 
	request: Types.SendCustomAccountRecoveryEmailRequest
): Types.SendCustomAccountRecoveryEmailResult
	return PlayFabInternal.MakeApiCall(
		"/Server/SendCustomAccountRecoveryEmail",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- Sends an email for only players that have contact emails associated with them. 
--- Takes in an email template ID specifyingthe email template to send. 
---
--- https://docs.microsoft.com/rest/api/playfab/server/account-management/sendemailfromtemplate
function Apis.SendEmailFromTemplateAsync(
	secretKey: string, 
	request: Types.SendEmailFromTemplateRequest
): Types.SendEmailFromTemplateResult
	return PlayFabInternal.MakeApiCall(
		"/Server/SendEmailFromTemplate",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/account-management/sendpushnotification
function Apis.SendPushNotificationAsync(
	secretKey: string, 
	request: Types.SendPushNotificationRequest
): Types.SendPushNotificationResult
	return PlayFabInternal.MakeApiCall(
		"/Server/SendPushNotification",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/account-management/sendpushnotificationfromtemplate
function Apis.SendPushNotificationFromTemplateAsync(
	secretKey: string, 
	request: Types.SendPushNotificationFromTemplateRequest
): Types.SendPushNotificationResult
	return PlayFabInternal.MakeApiCall(
		"/Server/SendPushNotificationFromTemplate",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- This operation is not additive. It will completely replace the tag list for 
--- the specified user. Please note that only users in the PlayFab friends list 
--- can be assigned tags. Attempting to set a tag on a friend only included in the 
--- friends list from a social site integration (such as Facebook or Steam) will 
--- return the AccountNotFound error. 
---
--- https://docs.microsoft.com/rest/api/playfab/server/friend-list-management/setfriendtags
function Apis.SetFriendTagsAsync(
	secretKey: string, 
	request: Types.SetFriendTagsRequest
): Types.EmptyResponse
	return PlayFabInternal.MakeApiCall(
		"/Server/SetFriendTags",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/matchmaking/setgameserverinstancedata
function Apis.SetGameServerInstanceDataAsync(
	secretKey: string, 
	request: Types.SetGameServerInstanceDataRequest
): Types.SetGameServerInstanceDataResult
	return PlayFabInternal.MakeApiCall(
		"/Server/SetGameServerInstanceData",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/matchmaking/setgameserverinstancestate
function Apis.SetGameServerInstanceStateAsync(
	secretKey: string, 
	request: Types.SetGameServerInstanceStateRequest
): Types.SetGameServerInstanceStateResult
	return PlayFabInternal.MakeApiCall(
		"/Server/SetGameServerInstanceState",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/matchmaking/setgameserverinstancetags
function Apis.SetGameServerInstanceTagsAsync(
	secretKey: string, 
	request: Types.SetGameServerInstanceTagsRequest
): Types.SetGameServerInstanceTagsResult
	return PlayFabInternal.MakeApiCall(
		"/Server/SetGameServerInstanceTags",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- APIs that require signatures require that the player have a configured Player 
--- Secret Key that is used to sign all requests. Players that don't have a secret 
--- will be blocked from making API calls until it is configured. To create a signature 
--- header add a SHA256 hashed string containing UTF8 encoded JSON body as it will 
--- be sent to the server, the current time in UTC formatted to ISO 8601, and the 
--- players secret formatted as 'body.date.secret'. Place the resulting hash into 
--- the header X-PlayFab-Signature, along with a header X-PlayFab-Timestamp of the 
--- same UTC timestamp used in the signature. 
---
--- https://docs.microsoft.com/rest/api/playfab/server/authentication/setplayersecret
function Apis.SetPlayerSecretAsync(
	secretKey: string, 
	request: Types.SetPlayerSecretRequest
): Types.SetPlayerSecretResult
	return PlayFabInternal.MakeApiCall(
		"/Server/SetPlayerSecret",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- This API is designed to store publisher-specific values which can be read, but 
--- not written to, by the client. This data is shared across all titles assigned 
--- to a particular publisher, and can be used for cross-game coordination. Only 
--- titles assigned to a publisher can use this API. This operation is additive. 
--- If a Key does not exist in the current dataset, it will be added with the specified 
--- Value. If it already exists, the Value for that key will be overwritten with 
--- the new Value. For more information email helloplayfab@microsoft.com 
---
--- https://docs.microsoft.com/rest/api/playfab/server/title-wide-data-management/setpublisherdata
function Apis.SetPublisherDataAsync(
	secretKey: string, 
	request: Types.SetPublisherDataRequest
): Types.SetPublisherDataResult
	return PlayFabInternal.MakeApiCall(
		"/Server/SetPublisherData",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- This API is designed to store title specific values which can be read, but not 
--- written to, by the client. For example, a developer could choose to store values 
--- which modify the user experience, such as enemy spawn rates, weapon strengths, 
--- movement speeds, etc. This allows a developer to update the title without the 
--- need to create, test, and ship a new build. This operation is additive. If a 
--- Key does not exist in the current dataset, it will be added with the specified 
--- Value. If it already exists, the Value for that key will be overwritten with 
--- the new Value. 
---
--- https://docs.microsoft.com/rest/api/playfab/server/title-wide-data-management/settitledata
function Apis.SetTitleDataAsync(
	secretKey: string, 
	request: Types.SetTitleDataRequest
): Types.SetTitleDataResult
	return PlayFabInternal.MakeApiCall(
		"/Server/SetTitleData",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- This API is designed to store title specific values which are accessible only 
--- to the server. This can be used to tweak settings on game servers and Cloud 
--- Scripts without needed to update and re-deploy them. This operation is additive. 
--- If a Key does not exist in the current dataset, it will be added with the specified 
--- Value. If it already exists, the Value for that key will be overwritten with 
--- the new Value. 
---
--- https://docs.microsoft.com/rest/api/playfab/server/title-wide-data-management/settitleinternaldata
function Apis.SetTitleInternalDataAsync(
	secretKey: string, 
	request: Types.SetTitleDataRequest
): Types.SetTitleDataResult
	return PlayFabInternal.MakeApiCall(
		"/Server/SetTitleInternalData",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/player-item-management/subtractcharactervirtualcurrency
function Apis.SubtractCharacterVirtualCurrencyAsync(
	secretKey: string, 
	request: Types.SubtractCharacterVirtualCurrencyRequest
): Types.ModifyCharacterVirtualCurrencyResult
	return PlayFabInternal.MakeApiCall(
		"/Server/SubtractCharacterVirtualCurrency",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/player-item-management/subtractuservirtualcurrency
function Apis.SubtractUserVirtualCurrencyAsync(
	secretKey: string, 
	request: Types.SubtractUserVirtualCurrencyRequest
): Types.ModifyUserVirtualCurrencyResult
	return PlayFabInternal.MakeApiCall(
		"/Server/SubtractUserVirtualCurrency",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/account-management/unlinknintendoserviceaccount
function Apis.UnlinkNintendoServiceAccountAsync(
	secretKey: string, 
	request: Types.UnlinkNintendoServiceAccountRequest
): Types.EmptyResponse
	return PlayFabInternal.MakeApiCall(
		"/Server/UnlinkNintendoServiceAccount",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/account-management/unlinknintendoswitchdeviceid
function Apis.UnlinkNintendoSwitchDeviceIdAsync(
	secretKey: string, 
	request: Types.UnlinkNintendoSwitchDeviceIdRequest
): Types.UnlinkNintendoSwitchDeviceIdResult
	return PlayFabInternal.MakeApiCall(
		"/Server/UnlinkNintendoSwitchDeviceId",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/account-management/unlinkpsnaccount
function Apis.UnlinkPSNAccountAsync(
	secretKey: string, 
	request: Types.UnlinkPSNAccountRequest
): Types.UnlinkPSNAccountResult
	return PlayFabInternal.MakeApiCall(
		"/Server/UnlinkPSNAccount",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/account-management/unlinkservercustomid
function Apis.UnlinkServerCustomIdAsync(
	secretKey: string, 
	request: Types.UnlinkServerCustomIdRequest
): Types.UnlinkServerCustomIdResult
	return PlayFabInternal.MakeApiCall(
		"/Server/UnlinkServerCustomId",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/account-management/unlinkxboxaccount
function Apis.UnlinkXboxAccountAsync(
	secretKey: string, 
	request: Types.UnlinkXboxAccountRequest
): Types.UnlinkXboxAccountResult
	return PlayFabInternal.MakeApiCall(
		"/Server/UnlinkXboxAccount",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- Specify the container and optionally the catalogVersion for the container to 
--- open 
---
--- https://docs.microsoft.com/rest/api/playfab/server/player-item-management/unlockcontainerinstance
function Apis.UnlockContainerInstanceAsync(
	secretKey: string, 
	request: Types.UnlockContainerInstanceRequest
): Types.UnlockContainerItemResult
	return PlayFabInternal.MakeApiCall(
		"/Server/UnlockContainerInstance",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- Specify the type of container to open and optionally the catalogVersion for 
--- the container to open 
---
--- https://docs.microsoft.com/rest/api/playfab/server/player-item-management/unlockcontaineritem
function Apis.UnlockContainerItemAsync(
	secretKey: string, 
	request: Types.UnlockContainerItemRequest
): Types.UnlockContainerItemResult
	return PlayFabInternal.MakeApiCall(
		"/Server/UnlockContainerItem",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/account-management/updateavatarurl
function Apis.UpdateAvatarUrlAsync(
	secretKey: string, 
	request: Types.UpdateAvatarUrlRequest
): Types.EmptyResponse
	return PlayFabInternal.MakeApiCall(
		"/Server/UpdateAvatarUrl",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- For each ban, only updates the values that are set. Leave any value to null 
--- for no change. If a ban could not be found, the rest are still applied. Returns 
--- information about applied updates only. 
---
--- https://docs.microsoft.com/rest/api/playfab/server/account-management/updatebans
function Apis.UpdateBansAsync(
	secretKey: string, 
	request: Types.UpdateBansRequest
): Types.UpdateBansResult
	return PlayFabInternal.MakeApiCall(
		"/Server/UpdateBans",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- This function performs an additive update of the arbitrary JSON object containing 
--- the custom data for the user. In updating the custom data object, keys which 
--- already exist in the object will have their values overwritten, while keys with 
--- null values will be removed. No other key-value pairs will be changed apart 
--- from those specified in the call. 
---
--- https://docs.microsoft.com/rest/api/playfab/server/character-data/updatecharacterdata
function Apis.UpdateCharacterDataAsync(
	secretKey: string, 
	request: Types.UpdateCharacterDataRequest
): Types.UpdateCharacterDataResult
	return PlayFabInternal.MakeApiCall(
		"/Server/UpdateCharacterData",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- This function performs an additive update of the arbitrary JSON object containing 
--- the custom data for the user. In updating the custom data object, keys which 
--- already exist in the object will have their values overwritten, keys with null 
--- values will be removed. No other key-value pairs will be changed apart from 
--- those specified in the call. 
---
--- https://docs.microsoft.com/rest/api/playfab/server/character-data/updatecharacterinternaldata
function Apis.UpdateCharacterInternalDataAsync(
	secretKey: string, 
	request: Types.UpdateCharacterDataRequest
): Types.UpdateCharacterDataResult
	return PlayFabInternal.MakeApiCall(
		"/Server/UpdateCharacterInternalData",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- This function performs an additive update of the arbitrary JSON object containing 
--- the custom data for the user. In updating the custom data object, keys which 
--- already exist in the object will have their values overwritten, keys with null 
--- values will be removed. No other key-value pairs will be changed apart from 
--- those specified in the call. 
---
--- https://docs.microsoft.com/rest/api/playfab/server/character-data/updatecharacterreadonlydata
function Apis.UpdateCharacterReadOnlyDataAsync(
	secretKey: string, 
	request: Types.UpdateCharacterDataRequest
): Types.UpdateCharacterDataResult
	return PlayFabInternal.MakeApiCall(
		"/Server/UpdateCharacterReadOnlyData",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- Character statistics are similar to user statistics in that they are numeric 
--- values which may only be updated by a server operation, in order to minimize 
--- the opportunity for unauthorized changes. In addition to being available for 
--- use by the title, the statistics are used for all leaderboard operations in 
--- PlayFab. 
---
--- https://docs.microsoft.com/rest/api/playfab/server/characters/updatecharacterstatistics
function Apis.UpdateCharacterStatisticsAsync(
	secretKey: string, 
	request: Types.UpdateCharacterStatisticsRequest
): Types.UpdateCharacterStatisticsResult
	return PlayFabInternal.MakeApiCall(
		"/Server/UpdateCharacterStatistics",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- This operation is additive. Statistics not currently defined will be added, 
--- while those already defined will be updated with the given values. All other 
--- user statistics will remain unchanged. 
---
--- https://docs.microsoft.com/rest/api/playfab/server/player-data-management/updateplayerstatistics
function Apis.UpdatePlayerStatisticsAsync(
	secretKey: string, 
	request: Types.UpdatePlayerStatisticsRequest
): Types.UpdatePlayerStatisticsResult
	return PlayFabInternal.MakeApiCall(
		"/Server/UpdatePlayerStatistics",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- Note that in the case of multiple calls to write to the same shared group data 
--- keys, the last write received by the PlayFab service will determine the value 
--- available to subsequent read operations. For scenarios requiring coordination 
--- of data updates, it is recommended that titles make use of user data with read 
--- permission set to public, or a combination of user data and shared group data. 
---
--- https://docs.microsoft.com/rest/api/playfab/server/shared-group-data/updatesharedgroupdata
function Apis.UpdateSharedGroupDataAsync(
	secretKey: string, 
	request: Types.UpdateSharedGroupDataRequest
): Types.UpdateSharedGroupDataResult
	return PlayFabInternal.MakeApiCall(
		"/Server/UpdateSharedGroupData",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- This function performs an additive update of the arbitrary JSON object containing 
--- the custom data for the user. In updating the custom data object, keys which 
--- already exist in the object will have their values overwritten, while keys with 
--- null values will be removed. No other key-value pairs will be changed apart 
--- from those specified in the call. 
---
--- https://docs.microsoft.com/rest/api/playfab/server/player-data-management/updateuserdata
function Apis.UpdateUserDataAsync(
	secretKey: string, 
	request: Types.UpdateUserDataRequest
): Types.UpdateUserDataResult
	return PlayFabInternal.MakeApiCall(
		"/Server/UpdateUserData",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- This function performs an additive update of the arbitrary JSON object containing 
--- the custom data for the user. In updating the custom data object, keys which 
--- already exist in the object will have their values overwritten, keys with null 
--- values will be removed. No other key-value pairs will be changed apart from 
--- those specified in the call. 
---
--- https://docs.microsoft.com/rest/api/playfab/server/player-data-management/updateuserinternaldata
function Apis.UpdateUserInternalDataAsync(
	secretKey: string, 
	request: Types.UpdateUserInternalDataRequest
): Types.UpdateUserDataResult
	return PlayFabInternal.MakeApiCall(
		"/Server/UpdateUserInternalData",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- This function performs an additive update of the arbitrary JSON object containing 
--- the custom data for the item instance which belongs to the specified user. In 
--- updating the custom data object, keys which already exist in the object will 
--- have their values overwritten, while keys with null values will be removed. 
--- No other key-value pairs will be changed apart from those specified in the call. 
---
--- https://docs.microsoft.com/rest/api/playfab/server/player-item-management/updateuserinventoryitemcustomdata
function Apis.UpdateUserInventoryItemCustomDataAsync(
	secretKey: string, 
	request: Types.UpdateUserInventoryItemDataRequest
): Types.EmptyResponse
	return PlayFabInternal.MakeApiCall(
		"/Server/UpdateUserInventoryItemCustomData",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- This function performs an additive update of the arbitrary JSON object containing 
--- the custom data for the user. In updating the custom data object, keys which 
--- already exist in the object will have their values overwritten, while keys with 
--- null values will be removed. No other key-value pairs will be changed apart 
--- from those specified in the call. 
---
--- https://docs.microsoft.com/rest/api/playfab/server/player-data-management/updateuserpublisherdata
function Apis.UpdateUserPublisherDataAsync(
	secretKey: string, 
	request: Types.UpdateUserDataRequest
): Types.UpdateUserDataResult
	return PlayFabInternal.MakeApiCall(
		"/Server/UpdateUserPublisherData",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- This function performs an additive update of the arbitrary JSON object containing 
--- the custom data for the user. In updating the custom data object, keys which 
--- already exist in the object will have their values overwritten, keys with null 
--- values will be removed. No other key-value pairs will be changed apart from 
--- those specified in the call. 
---
--- https://docs.microsoft.com/rest/api/playfab/server/player-data-management/updateuserpublisherinternaldata
function Apis.UpdateUserPublisherInternalDataAsync(
	secretKey: string, 
	request: Types.UpdateUserInternalDataRequest
): Types.UpdateUserDataResult
	return PlayFabInternal.MakeApiCall(
		"/Server/UpdateUserPublisherInternalData",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- This function performs an additive update of the arbitrary JSON object containing 
--- the custom data for the user. In updating the custom data object, keys which 
--- already exist in the object will have their values overwritten, keys with null 
--- values will be removed. No other key-value pairs will be changed apart from 
--- those specified in the call. 
---
--- https://docs.microsoft.com/rest/api/playfab/server/player-data-management/updateuserpublisherreadonlydata
function Apis.UpdateUserPublisherReadOnlyDataAsync(
	secretKey: string, 
	request: Types.UpdateUserDataRequest
): Types.UpdateUserDataResult
	return PlayFabInternal.MakeApiCall(
		"/Server/UpdateUserPublisherReadOnlyData",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- This function performs an additive update of the arbitrary JSON object containing 
--- the custom data for the user. In updating the custom data object, keys which 
--- already exist in the object will have their values overwritten, keys with null 
--- values will be removed. No other key-value pairs will be changed apart from 
--- those specified in the call. 
---
--- https://docs.microsoft.com/rest/api/playfab/server/player-data-management/updateuserreadonlydata
function Apis.UpdateUserReadOnlyDataAsync(
	secretKey: string, 
	request: Types.UpdateUserDataRequest
): Types.UpdateUserDataResult
	return PlayFabInternal.MakeApiCall(
		"/Server/UpdateUserReadOnlyData",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- This API is designed to write a multitude of different event types into PlayStream. 
--- It supports a flexible JSON schema, which allowsfor arbitrary key-value pairs 
--- to describe any character-based event. The created event will be locked to the 
--- authenticated title.  
---
--- https://docs.microsoft.com/rest/api/playfab/server/analytics/writecharacterevent
function Apis.WriteCharacterEventAsync(
	secretKey: string, 
	request: Types.WriteServerCharacterEventRequest
): Types.WriteEventResponse
	return PlayFabInternal.MakeApiCall(
		"/Server/WriteCharacterEvent",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- This API is designed to write a multitude of different event types into PlayStream. 
--- It supports a flexible JSON schema, which allowsfor arbitrary key-value pairs 
--- to describe any player-based event. The created event will be locked to the 
--- authenticated title.  
---
--- https://docs.microsoft.com/rest/api/playfab/server/analytics/writeplayerevent
function Apis.WritePlayerEventAsync(
	secretKey: string, 
	request: Types.WriteServerPlayerEventRequest
): Types.WriteEventResponse
	return PlayFabInternal.MakeApiCall(
		"/Server/WritePlayerEvent",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- This API is designed to write a multitude of different event types into PlayStream. 
--- It supports a flexible JSON schema, which allowsfor arbitrary key-value pairs 
--- to describe any title-based event. The created event will be locked to the authenticated 
--- title.  
---
--- https://docs.microsoft.com/rest/api/playfab/server/analytics/writetitleevent
function Apis.WriteTitleEventAsync(
	secretKey: string, 
	request: Types.WriteTitleEventRequest
): Types.WriteEventResponse
	return PlayFabInternal.MakeApiCall(
		"/Server/WriteTitleEvent",
		request,
		"X-SecretKey",
		secretKey
	)
end

return Apis

