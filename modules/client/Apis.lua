--!strict

local PlayFabInternal = require(script.Parent.Parent.PlayFabInternal)
local Types = require(script.Parent.Types)

local Apis = {}

--- https://docs.microsoft.com/rest/api/playfab/client/trading/accepttrade
function Apis.AcceptTradeAsync(
	sessionTicket: string, 
	request: Types.AcceptTradeRequest
): Types.AcceptTradeResponse
	return PlayFabInternal.MakeApiCall(
		"/Client/AcceptTrade",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/friend-list-management/addfriend
function Apis.AddFriendAsync(
	sessionTicket: string, 
	request: Types.AddFriendRequest
): Types.AddFriendResult
	return PlayFabInternal.MakeApiCall(
		"/Client/AddFriend",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/account-management/addgenericid
function Apis.AddGenericIDAsync(
	sessionTicket: string, 
	request: Types.AddGenericIDRequest
): Types.AddGenericIDResult
	return PlayFabInternal.MakeApiCall(
		"/Client/AddGenericID",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- This API adds a contact email to the player's profile. If the player's profile 
--- already contains a contact email, it will update the contact email to the email 
--- address specified. 
---
--- https://docs.microsoft.com/rest/api/playfab/client/account-management/addorupdatecontactemail
function Apis.AddOrUpdateContactEmailAsync(
	sessionTicket: string, 
	request: Types.AddOrUpdateContactEmailRequest
): Types.AddOrUpdateContactEmailResult
	return PlayFabInternal.MakeApiCall(
		"/Client/AddOrUpdateContactEmail",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/shared-group-data/addsharedgroupmembers
function Apis.AddSharedGroupMembersAsync(
	sessionTicket: string, 
	request: Types.AddSharedGroupMembersRequest
): Types.AddSharedGroupMembersResult
	return PlayFabInternal.MakeApiCall(
		"/Client/AddSharedGroupMembers",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- This API must be enabled for use as an option in the game manager website. It 
--- is disabled by default. 
---
--- https://docs.microsoft.com/rest/api/playfab/client/player-item-management/adduservirtualcurrency
function Apis.AddUserVirtualCurrencyAsync(
	sessionTicket: string, 
	request: Types.AddUserVirtualCurrencyRequest
): Types.ModifyUserVirtualCurrencyResult
	return PlayFabInternal.MakeApiCall(
		"/Client/AddUserVirtualCurrency",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/account-management/addusernamepassword
function Apis.AddUsernamePasswordAsync(
	sessionTicket: string, 
	request: Types.AddUsernamePasswordRequest
): Types.AddUsernamePasswordResult
	return PlayFabInternal.MakeApiCall(
		"/Client/AddUsernamePassword",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- More information can be found on configuring your game for the Google Cloud 
--- Messaging service in the Google developer documentation, here: http://developer.android.com/google/gcm/client.html. 
--- The steps to configure and send Push Notifications is described in the PlayFab 
--- tutorials, here: https://docs.microsoft.com/gaming/playfab/features/engagement/push-notifications/quickstart. 
---
--- https://docs.microsoft.com/rest/api/playfab/client/platform-specific-methods/androiddevicepushnotificationregistration
function Apis.AndroidDevicePushNotificationRegistrationAsync(
	sessionTicket: string, 
	request: Types.AndroidDevicePushNotificationRegistrationRequest
): Types.AndroidDevicePushNotificationRegistrationResult
	return PlayFabInternal.MakeApiCall(
		"/Client/AndroidDevicePushNotificationRegistration",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- If you have an ad attribution partner enabled, this will post an install to 
--- their service to track the device. It uses the given device id to match based 
--- on clicks on ads. 
---
--- https://docs.microsoft.com/rest/api/playfab/client/advertising/attributeinstall
function Apis.AttributeInstallAsync(
	sessionTicket: string, 
	request: Types.AttributeInstallRequest
): Types.AttributeInstallResult
	return PlayFabInternal.MakeApiCall(
		"/Client/AttributeInstall",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/trading/canceltrade
function Apis.CancelTradeAsync(
	sessionTicket: string, 
	request: Types.CancelTradeRequest
): Types.CancelTradeResponse
	return PlayFabInternal.MakeApiCall(
		"/Client/CancelTrade",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- The final step in the purchasing process, this API finalizes the purchase with 
--- the payment provider, where applicable, adding virtual goods to the player inventory 
--- (including random drop table resolution and recursive addition of bundled items) 
--- and adjusting virtual currency balances for funds used or added. Note that this 
--- is a pull operation, and should be polled regularly when a purchase is in progress. 
--- Please note that the processing time for inventory grants and purchases increases 
--- fractionally the more items are in the inventory, and the more items are in 
--- the grant/purchase operation. 
---
--- https://docs.microsoft.com/rest/api/playfab/client/player-item-management/confirmpurchase
function Apis.ConfirmPurchaseAsync(
	sessionTicket: string, 
	request: Types.ConfirmPurchaseRequest
): Types.ConfirmPurchaseResult
	return PlayFabInternal.MakeApiCall(
		"/Client/ConfirmPurchase",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/player-item-management/consumeitem
function Apis.ConsumeItemAsync(
	sessionTicket: string, 
	request: Types.ConsumeItemRequest
): Types.ConsumeItemResult
	return PlayFabInternal.MakeApiCall(
		"/Client/ConsumeItem",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/platform-specific-methods/consumemicrosoftstoreentitlements
function Apis.ConsumeMicrosoftStoreEntitlementsAsync(
	sessionTicket: string, 
	request: Types.ConsumeMicrosoftStoreEntitlementsRequest
): Types.ConsumeMicrosoftStoreEntitlementsResponse
	return PlayFabInternal.MakeApiCall(
		"/Client/ConsumeMicrosoftStoreEntitlements",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/platform-specific-methods/consumeps5entitlements
function Apis.ConsumePS5EntitlementsAsync(
	sessionTicket: string, 
	request: Types.ConsumePS5EntitlementsRequest
): Types.ConsumePS5EntitlementsResult
	return PlayFabInternal.MakeApiCall(
		"/Client/ConsumePS5Entitlements",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/platform-specific-methods/consumepsnentitlements
function Apis.ConsumePSNEntitlementsAsync(
	sessionTicket: string, 
	request: Types.ConsumePSNEntitlementsRequest
): Types.ConsumePSNEntitlementsResult
	return PlayFabInternal.MakeApiCall(
		"/Client/ConsumePSNEntitlements",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/platform-specific-methods/consumexboxentitlements
function Apis.ConsumeXboxEntitlementsAsync(
	sessionTicket: string, 
	request: Types.ConsumeXboxEntitlementsRequest
): Types.ConsumeXboxEntitlementsResult
	return PlayFabInternal.MakeApiCall(
		"/Client/ConsumeXboxEntitlements",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- If SharedGroupId is specified, the service will attempt to create a group with 
--- that identifier, and will return an error if it is already in use. If no SharedGroupId 
--- is specified, a random identifier will be assigned. 
---
--- https://docs.microsoft.com/rest/api/playfab/client/shared-group-data/createsharedgroup
function Apis.CreateSharedGroupAsync(
	sessionTicket: string, 
	request: Types.CreateSharedGroupRequest
): Types.CreateSharedGroupResult
	return PlayFabInternal.MakeApiCall(
		"/Client/CreateSharedGroup",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/server-side-cloud-script/executecloudscript
function Apis.ExecuteCloudScriptAsync(
	sessionTicket: string, 
	request: Types.ExecuteCloudScriptRequest
): Types.ExecuteCloudScriptResult
	return PlayFabInternal.MakeApiCall(
		"/Client/ExecuteCloudScript",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/account-management/getaccountinfo
function Apis.GetAccountInfoAsync(
	sessionTicket: string, 
	request: Types.GetAccountInfoRequest
): Types.GetAccountInfoResult
	return PlayFabInternal.MakeApiCall(
		"/Client/GetAccountInfo",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- Returns a list of ad placements for the calling player. Each ad placement may 
--- include a reward if there was at least one valid reward for the player as well 
--- as the number of plays remaining and when the play count resets. 
---
--- https://docs.microsoft.com/rest/api/playfab/client/advertising/getadplacements
function Apis.GetAdPlacementsAsync(
	sessionTicket: string, 
	request: Types.GetAdPlacementsRequest
): Types.GetAdPlacementsResult
	return PlayFabInternal.MakeApiCall(
		"/Client/GetAdPlacements",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- Returns a list of every character that currently belongs to a user. 
---
--- https://docs.microsoft.com/rest/api/playfab/client/characters/getalluserscharacters
function Apis.GetAllUsersCharactersAsync(
	sessionTicket: string, 
	request: Types.ListUsersCharactersRequest
): Types.ListUsersCharactersResult
	return PlayFabInternal.MakeApiCall(
		"/Client/GetAllUsersCharacters",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/title-wide-data-management/getcatalogitems
function Apis.GetCatalogItemsAsync(
	sessionTicket: string, 
	request: Types.GetCatalogItemsRequest
): Types.GetCatalogItemsResult
	return PlayFabInternal.MakeApiCall(
		"/Client/GetCatalogItems",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- Data is stored as JSON key-value pairs. If the Keys parameter is provided, the 
--- data object returned will only contain the data specific to the indicated Keys. 
--- Otherwise, the full set of custom character data will be returned. 
---
--- https://docs.microsoft.com/rest/api/playfab/client/character-data/getcharacterdata
function Apis.GetCharacterDataAsync(
	sessionTicket: string, 
	request: Types.GetCharacterDataRequest
): Types.GetCharacterDataResult
	return PlayFabInternal.MakeApiCall(
		"/Client/GetCharacterData",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- All items currently in the character inventory will be returned, irrespective 
--- of how they were acquired (via purchasing, grants, coupons, etc.). Items that 
--- are expired, fully consumed, or are no longer valid are not considered to be 
--- in the user's current inventory, and so will not be not included. Also returns 
--- their virtual currency balances. 
---
--- https://docs.microsoft.com/rest/api/playfab/client/player-item-management/getcharacterinventory
function Apis.GetCharacterInventoryAsync(
	sessionTicket: string, 
	request: Types.GetCharacterInventoryRequest
): Types.GetCharacterInventoryResult
	return PlayFabInternal.MakeApiCall(
		"/Client/GetCharacterInventory",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/characters/getcharacterleaderboard
function Apis.GetCharacterLeaderboardAsync(
	sessionTicket: string, 
	request: Types.GetCharacterLeaderboardRequest
): Types.GetCharacterLeaderboardResult
	return PlayFabInternal.MakeApiCall(
		"/Client/GetCharacterLeaderboard",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- Data is stored as JSON key-value pairs. If the Keys parameter is provided, the 
--- data object returned will only contain the data specific to the indicated Keys. 
--- Otherwise, the full set of custom character data will be returned. 
---
--- https://docs.microsoft.com/rest/api/playfab/client/character-data/getcharacterreadonlydata
function Apis.GetCharacterReadOnlyDataAsync(
	sessionTicket: string, 
	request: Types.GetCharacterDataRequest
): Types.GetCharacterDataResult
	return PlayFabInternal.MakeApiCall(
		"/Client/GetCharacterReadOnlyData",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/characters/getcharacterstatistics
function Apis.GetCharacterStatisticsAsync(
	sessionTicket: string, 
	request: Types.GetCharacterStatisticsRequest
): Types.GetCharacterStatisticsResult
	return PlayFabInternal.MakeApiCall(
		"/Client/GetCharacterStatistics",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/content/getcontentdownloadurl
function Apis.GetContentDownloadUrlAsync(
	sessionTicket: string, 
	request: Types.GetContentDownloadUrlRequest
): Types.GetContentDownloadUrlResult
	return PlayFabInternal.MakeApiCall(
		"/Client/GetContentDownloadUrl",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/matchmaking/getcurrentgames
function Apis.GetCurrentGamesAsync(
	sessionTicket: string, 
	request: Types.CurrentGamesRequest
): Types.CurrentGamesResult
	return PlayFabInternal.MakeApiCall(
		"/Client/GetCurrentGames",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/player-data-management/getfriendleaderboard
function Apis.GetFriendLeaderboardAsync(
	sessionTicket: string, 
	request: Types.GetFriendLeaderboardRequest
): Types.GetLeaderboardResult
	return PlayFabInternal.MakeApiCall(
		"/Client/GetFriendLeaderboard",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/player-data-management/getfriendleaderboardaroundplayer
function Apis.GetFriendLeaderboardAroundPlayerAsync(
	sessionTicket: string, 
	request: Types.GetFriendLeaderboardAroundPlayerRequest
): Types.GetFriendLeaderboardAroundPlayerResult
	return PlayFabInternal.MakeApiCall(
		"/Client/GetFriendLeaderboardAroundPlayer",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/friend-list-management/getfriendslist
function Apis.GetFriendsListAsync(
	sessionTicket: string, 
	request: Types.GetFriendsListRequest
): Types.GetFriendsListResult
	return PlayFabInternal.MakeApiCall(
		"/Client/GetFriendsList",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/matchmaking/getgameserverregions
function Apis.GetGameServerRegionsAsync(
	sessionTicket: string, 
	request: Types.GameServerRegionsRequest
): Types.GameServerRegionsResult
	return PlayFabInternal.MakeApiCall(
		"/Client/GetGameServerRegions",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/player-data-management/getleaderboard
function Apis.GetLeaderboardAsync(
	sessionTicket: string, 
	request: Types.GetLeaderboardRequest
): Types.GetLeaderboardResult
	return PlayFabInternal.MakeApiCall(
		"/Client/GetLeaderboard",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/characters/getleaderboardaroundcharacter
function Apis.GetLeaderboardAroundCharacterAsync(
	sessionTicket: string, 
	request: Types.GetLeaderboardAroundCharacterRequest
): Types.GetLeaderboardAroundCharacterResult
	return PlayFabInternal.MakeApiCall(
		"/Client/GetLeaderboardAroundCharacter",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/player-data-management/getleaderboardaroundplayer
function Apis.GetLeaderboardAroundPlayerAsync(
	sessionTicket: string, 
	request: Types.GetLeaderboardAroundPlayerRequest
): Types.GetLeaderboardAroundPlayerResult
	return PlayFabInternal.MakeApiCall(
		"/Client/GetLeaderboardAroundPlayer",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/characters/getleaderboardforusercharacters
function Apis.GetLeaderboardForUserCharactersAsync(
	sessionTicket: string, 
	request: Types.GetLeaderboardForUsersCharactersRequest
): Types.GetLeaderboardForUsersCharactersResult
	return PlayFabInternal.MakeApiCall(
		"/Client/GetLeaderboardForUserCharacters",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/player-item-management/getpaymenttoken
function Apis.GetPaymentTokenAsync(
	sessionTicket: string, 
	request: Types.GetPaymentTokenRequest
): Types.GetPaymentTokenResult
	return PlayFabInternal.MakeApiCall(
		"/Client/GetPaymentToken",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/authentication/getphotonauthenticationtoken
function Apis.GetPhotonAuthenticationTokenAsync(
	sessionTicket: string, 
	request: Types.GetPhotonAuthenticationTokenRequest
): Types.GetPhotonAuthenticationTokenResult
	return PlayFabInternal.MakeApiCall(
		"/Client/GetPhotonAuthenticationToken",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/account-management/getplayfabidsfromfacebookids
function Apis.GetPlayFabIDsFromFacebookIDsAsync(
	sessionTicket: string, 
	request: Types.GetPlayFabIDsFromFacebookIDsRequest
): Types.GetPlayFabIDsFromFacebookIDsResult
	return PlayFabInternal.MakeApiCall(
		"/Client/GetPlayFabIDsFromFacebookIDs",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/account-management/getplayfabidsfromfacebookinstantgamesids
function Apis.GetPlayFabIDsFromFacebookInstantGamesIdsAsync(
	sessionTicket: string, 
	request: Types.GetPlayFabIDsFromFacebookInstantGamesIdsRequest
): Types.GetPlayFabIDsFromFacebookInstantGamesIdsResult
	return PlayFabInternal.MakeApiCall(
		"/Client/GetPlayFabIDsFromFacebookInstantGamesIds",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/account-management/getplayfabidsfromgamecenterids
function Apis.GetPlayFabIDsFromGameCenterIDsAsync(
	sessionTicket: string, 
	request: Types.GetPlayFabIDsFromGameCenterIDsRequest
): Types.GetPlayFabIDsFromGameCenterIDsResult
	return PlayFabInternal.MakeApiCall(
		"/Client/GetPlayFabIDsFromGameCenterIDs",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/account-management/getplayfabidsfromgenericids
function Apis.GetPlayFabIDsFromGenericIDsAsync(
	sessionTicket: string, 
	request: Types.GetPlayFabIDsFromGenericIDsRequest
): Types.GetPlayFabIDsFromGenericIDsResult
	return PlayFabInternal.MakeApiCall(
		"/Client/GetPlayFabIDsFromGenericIDs",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/account-management/getplayfabidsfromgoogleids
function Apis.GetPlayFabIDsFromGoogleIDsAsync(
	sessionTicket: string, 
	request: Types.GetPlayFabIDsFromGoogleIDsRequest
): Types.GetPlayFabIDsFromGoogleIDsResult
	return PlayFabInternal.MakeApiCall(
		"/Client/GetPlayFabIDsFromGoogleIDs",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/account-management/getplayfabidsfromgoogleplaygamesplayerids
function Apis.GetPlayFabIDsFromGooglePlayGamesPlayerIDsAsync(
	sessionTicket: string, 
	request: Types.GetPlayFabIDsFromGooglePlayGamesPlayerIDsRequest
): Types.GetPlayFabIDsFromGooglePlayGamesPlayerIDsResult
	return PlayFabInternal.MakeApiCall(
		"/Client/GetPlayFabIDsFromGooglePlayGamesPlayerIDs",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/account-management/getplayfabidsfromkongregateids
function Apis.GetPlayFabIDsFromKongregateIDsAsync(
	sessionTicket: string, 
	request: Types.GetPlayFabIDsFromKongregateIDsRequest
): Types.GetPlayFabIDsFromKongregateIDsResult
	return PlayFabInternal.MakeApiCall(
		"/Client/GetPlayFabIDsFromKongregateIDs",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/account-management/getplayfabidsfromnintendoserviceaccountids
function Apis.GetPlayFabIDsFromNintendoServiceAccountIdsAsync(
	sessionTicket: string, 
	request: Types.GetPlayFabIDsFromNintendoServiceAccountIdsRequest
): Types.GetPlayFabIDsFromNintendoServiceAccountIdsResult
	return PlayFabInternal.MakeApiCall(
		"/Client/GetPlayFabIDsFromNintendoServiceAccountIds",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/account-management/getplayfabidsfromnintendoswitchdeviceids
function Apis.GetPlayFabIDsFromNintendoSwitchDeviceIdsAsync(
	sessionTicket: string, 
	request: Types.GetPlayFabIDsFromNintendoSwitchDeviceIdsRequest
): Types.GetPlayFabIDsFromNintendoSwitchDeviceIdsResult
	return PlayFabInternal.MakeApiCall(
		"/Client/GetPlayFabIDsFromNintendoSwitchDeviceIds",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/account-management/getplayfabidsfrompsnaccountids
function Apis.GetPlayFabIDsFromPSNAccountIDsAsync(
	sessionTicket: string, 
	request: Types.GetPlayFabIDsFromPSNAccountIDsRequest
): Types.GetPlayFabIDsFromPSNAccountIDsResult
	return PlayFabInternal.MakeApiCall(
		"/Client/GetPlayFabIDsFromPSNAccountIDs",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/account-management/getplayfabidsfromsteamids
function Apis.GetPlayFabIDsFromSteamIDsAsync(
	sessionTicket: string, 
	request: Types.GetPlayFabIDsFromSteamIDsRequest
): Types.GetPlayFabIDsFromSteamIDsResult
	return PlayFabInternal.MakeApiCall(
		"/Client/GetPlayFabIDsFromSteamIDs",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/account-management/getplayfabidsfromtwitchids
function Apis.GetPlayFabIDsFromTwitchIDsAsync(
	sessionTicket: string, 
	request: Types.GetPlayFabIDsFromTwitchIDsRequest
): Types.GetPlayFabIDsFromTwitchIDsResult
	return PlayFabInternal.MakeApiCall(
		"/Client/GetPlayFabIDsFromTwitchIDs",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/account-management/getplayfabidsfromxboxliveids
function Apis.GetPlayFabIDsFromXboxLiveIDsAsync(
	sessionTicket: string, 
	request: Types.GetPlayFabIDsFromXboxLiveIDsRequest
): Types.GetPlayFabIDsFromXboxLiveIDsResult
	return PlayFabInternal.MakeApiCall(
		"/Client/GetPlayFabIDsFromXboxLiveIDs",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/account-management/getplayercombinedinfo
function Apis.GetPlayerCombinedInfoAsync(
	sessionTicket: string, 
	request: Types.GetPlayerCombinedInfoRequest
): Types.GetPlayerCombinedInfoResult
	return PlayFabInternal.MakeApiCall(
		"/Client/GetPlayerCombinedInfo",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- This API allows for access to details regarding a user in the PlayFab service, 
--- usually for purposes of customer support. Note that data returned may be Personally 
--- Identifying Information (PII), such as email address, and so care should be 
--- taken in how this data is stored and managed. Since this call will always return 
--- the relevant information for users who have accessed the title, the recommendation 
--- is to not store this data locally. 
---
--- https://docs.microsoft.com/rest/api/playfab/client/account-management/getplayerprofile
function Apis.GetPlayerProfileAsync(
	sessionTicket: string, 
	request: Types.GetPlayerProfileRequest
): Types.GetPlayerProfileResult
	return PlayFabInternal.MakeApiCall(
		"/Client/GetPlayerProfile",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/playstream/getplayersegments
function Apis.GetPlayerSegmentsAsync(
	sessionTicket: string, 
	request: Types.GetPlayerSegmentsRequest
): Types.GetPlayerSegmentsResult
	return PlayFabInternal.MakeApiCall(
		"/Client/GetPlayerSegments",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/player-data-management/getplayerstatisticversions
function Apis.GetPlayerStatisticVersionsAsync(
	sessionTicket: string, 
	request: Types.GetPlayerStatisticVersionsRequest
): Types.GetPlayerStatisticVersionsResult
	return PlayFabInternal.MakeApiCall(
		"/Client/GetPlayerStatisticVersions",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/player-data-management/getplayerstatistics
function Apis.GetPlayerStatisticsAsync(
	sessionTicket: string, 
	request: Types.GetPlayerStatisticsRequest
): Types.GetPlayerStatisticsResult
	return PlayFabInternal.MakeApiCall(
		"/Client/GetPlayerStatistics",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- This API will return a list of canonical tags which includes both namespace 
--- and tag's name. If namespace is not provided, the result is a list of all canonical 
--- tags. TagName can be used for segmentation and Namespace is limited to 128 characters. 
---
--- https://docs.microsoft.com/rest/api/playfab/client/playstream/getplayertags
function Apis.GetPlayerTagsAsync(
	sessionTicket: string, 
	request: Types.GetPlayerTagsRequest
): Types.GetPlayerTagsResult
	return PlayFabInternal.MakeApiCall(
		"/Client/GetPlayerTags",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/trading/getplayertrades
function Apis.GetPlayerTradesAsync(
	sessionTicket: string, 
	request: Types.GetPlayerTradesRequest
): Types.GetPlayerTradesResponse
	return PlayFabInternal.MakeApiCall(
		"/Client/GetPlayerTrades",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- This API is designed to return publisher-specific values which can be read, 
--- but not written to, by the client. This data is shared across all titles assigned 
--- to a particular publisher, and can be used for cross-game coordination. Only 
--- titles assigned to a publisher can use this API. For more information email 
--- helloplayfab@microsoft.com. Note that there may up to a minute delay in between 
--- updating title data and this API call returning the newest value. 
---
--- https://docs.microsoft.com/rest/api/playfab/client/title-wide-data-management/getpublisherdata
function Apis.GetPublisherDataAsync(
	sessionTicket: string, 
	request: Types.GetPublisherDataRequest
): Types.GetPublisherDataResult
	return PlayFabInternal.MakeApiCall(
		"/Client/GetPublisherData",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/player-item-management/getpurchase
function Apis.GetPurchaseAsync(
	sessionTicket: string, 
	request: Types.GetPurchaseRequest
): Types.GetPurchaseResult
	return PlayFabInternal.MakeApiCall(
		"/Client/GetPurchase",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/shared-group-data/getsharedgroupdata
function Apis.GetSharedGroupDataAsync(
	sessionTicket: string, 
	request: Types.GetSharedGroupDataRequest
): Types.GetSharedGroupDataResult
	return PlayFabInternal.MakeApiCall(
		"/Client/GetSharedGroupData",
		request,
		"X-Authorization",
		sessionTicket
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
--- https://docs.microsoft.com/rest/api/playfab/client/title-wide-data-management/getstoreitems
function Apis.GetStoreItemsAsync(
	sessionTicket: string, 
	request: Types.GetStoreItemsRequest
): Types.GetStoreItemsResult
	return PlayFabInternal.MakeApiCall(
		"/Client/GetStoreItems",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- This query retrieves the current time from one of the servers in PlayFab. Please 
--- note that due to clock drift between servers, there is a potential variance 
--- of up to 5 seconds. 
---
--- https://docs.microsoft.com/rest/api/playfab/client/title-wide-data-management/gettime
function Apis.GetTimeAsync(
	sessionTicket: string, 
	request: Types.GetTimeRequest
): Types.GetTimeResult
	return PlayFabInternal.MakeApiCall(
		"/Client/GetTime",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- This API is designed to return title specific values which can be read, but 
--- not written to, by the client. For example, a developer could choose to store 
--- values which modify the user experience, such as enemy spawn rates, weapon strengths, 
--- movement speeds, etc. This allows a developer to update the title without the 
--- need to create, test, and ship a new build. If the player belongs to an experiment 
--- variant that uses title data overrides, the overrides are applied automatically 
--- and returned with the title data. Note that there may up to a minute delay in 
--- between updating title data and this API call returning the newest value. 
---
--- https://docs.microsoft.com/rest/api/playfab/client/title-wide-data-management/gettitledata
function Apis.GetTitleDataAsync(
	sessionTicket: string, 
	request: Types.GetTitleDataRequest
): Types.GetTitleDataResult
	return PlayFabInternal.MakeApiCall(
		"/Client/GetTitleData",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/title-wide-data-management/gettitlenews
function Apis.GetTitleNewsAsync(
	sessionTicket: string, 
	request: Types.GetTitleNewsRequest
): Types.GetTitleNewsResult
	return PlayFabInternal.MakeApiCall(
		"/Client/GetTitleNews",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- An RSA CSP blob to be used to encrypt the payload of account creation requests 
--- when that API requires a signature header. For example if Client/LoginWithCustomId 
--- requires signature headers but the player does not have an account yet follow 
--- these steps: 1) Call Client/GetTitlePublicKey with one of the title's shared 
--- secrets. 2) Convert the Base64 encoded CSP blob to a byte array and create an 
--- RSA signing object. 3) Encrypt the UTF8 encoded JSON body of the registration 
--- request and place the Base64 encoded result into the EncryptedRequest and with 
--- the TitleId field, all other fields can be left empty when performing the API 
--- request. 4) Client receives authentication token as normal. Future requests 
--- to LoginWithCustomId will require the X-PlayFab-Signature header. 
---
--- https://docs.microsoft.com/rest/api/playfab/client/authentication/gettitlepublickey
function Apis.GetTitlePublicKeyAsync(
	request: Types.GetTitlePublicKeyRequest
): Types.GetTitlePublicKeyResult
	return PlayFabInternal.MakeApiCall(
		"/Client/GetTitlePublicKey",
		request,
		nil,
		nil
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/trading/gettradestatus
function Apis.GetTradeStatusAsync(
	sessionTicket: string, 
	request: Types.GetTradeStatusRequest
): Types.GetTradeStatusResponse
	return PlayFabInternal.MakeApiCall(
		"/Client/GetTradeStatus",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- Data is stored as JSON key-value pairs. Every time the data is updated via any 
--- source, the version counter is incremented. If the Version parameter is provided, 
--- then this call will only return data if the current version on the system is 
--- greater than the value provided. If the Keys parameter is provided, the data 
--- object returned will only contain the data specific to the indicated Keys. Otherwise, 
--- the full set of custom user data will be returned. 
---
--- https://docs.microsoft.com/rest/api/playfab/client/player-data-management/getuserdata
function Apis.GetUserDataAsync(
	sessionTicket: string, 
	request: Types.GetUserDataRequest
): Types.GetUserDataResult
	return PlayFabInternal.MakeApiCall(
		"/Client/GetUserData",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/player-item-management/getuserinventory
function Apis.GetUserInventoryAsync(
	sessionTicket: string, 
	request: Types.GetUserInventoryRequest
): Types.GetUserInventoryResult
	return PlayFabInternal.MakeApiCall(
		"/Client/GetUserInventory",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- Data is stored as JSON key-value pairs. If the Keys parameter is provided, the 
--- data object returned will only contain the data specific to the indicated Keys. 
--- Otherwise, the full set of custom user data will be returned. 
---
--- https://docs.microsoft.com/rest/api/playfab/client/player-data-management/getuserpublisherdata
function Apis.GetUserPublisherDataAsync(
	sessionTicket: string, 
	request: Types.GetUserDataRequest
): Types.GetUserDataResult
	return PlayFabInternal.MakeApiCall(
		"/Client/GetUserPublisherData",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- Data is stored as JSON key-value pairs. If the Keys parameter is provided, the 
--- data object returned will only contain the data specific to the indicated Keys. 
--- Otherwise, the full set of custom user data will be returned. 
---
--- https://docs.microsoft.com/rest/api/playfab/client/player-data-management/getuserpublisherreadonlydata
function Apis.GetUserPublisherReadOnlyDataAsync(
	sessionTicket: string, 
	request: Types.GetUserDataRequest
): Types.GetUserDataResult
	return PlayFabInternal.MakeApiCall(
		"/Client/GetUserPublisherReadOnlyData",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- Data is stored as JSON key-value pairs. Every time the data is updated via any 
--- source, the version counter is incremented. If the Version parameter is provided, 
--- then this call will only return data if the current version on the system is 
--- greater than the value provided. If the Keys parameter is provided, the data 
--- object returned will only contain the data specific to the indicated Keys. Otherwise, 
--- the full set of custom user data will be returned. 
---
--- https://docs.microsoft.com/rest/api/playfab/client/player-data-management/getuserreadonlydata
function Apis.GetUserReadOnlyDataAsync(
	sessionTicket: string, 
	request: Types.GetUserDataRequest
): Types.GetUserDataResult
	return PlayFabInternal.MakeApiCall(
		"/Client/GetUserReadOnlyData",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- Grants a character to the user of the type specified by the item ID. The user 
--- must already have an instance of this item in their inventory in order to allow 
--- character creation. This item can come from a purchase or grant, which must 
--- be done before calling to create the character. 
---
--- https://docs.microsoft.com/rest/api/playfab/client/characters/grantcharactertouser
function Apis.GrantCharacterToUserAsync(
	sessionTicket: string, 
	request: Types.GrantCharacterToUserRequest
): Types.GrantCharacterToUserResult
	return PlayFabInternal.MakeApiCall(
		"/Client/GrantCharacterToUser",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/account-management/linkandroiddeviceid
function Apis.LinkAndroidDeviceIDAsync(
	sessionTicket: string, 
	request: Types.LinkAndroidDeviceIDRequest
): Types.LinkAndroidDeviceIDResult
	return PlayFabInternal.MakeApiCall(
		"/Client/LinkAndroidDeviceID",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/account-management/linkapple
function Apis.LinkAppleAsync(
	sessionTicket: string, 
	request: Types.LinkAppleRequest
): Types.EmptyResult
	return PlayFabInternal.MakeApiCall(
		"/Client/LinkApple",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/account-management/linkcustomid
function Apis.LinkCustomIDAsync(
	sessionTicket: string, 
	request: Types.LinkCustomIDRequest
): Types.LinkCustomIDResult
	return PlayFabInternal.MakeApiCall(
		"/Client/LinkCustomID",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- Facebook sign-in is accomplished using the Facebook User Access Token. More 
--- information on the Token can be found in the Facebook developer documentation 
--- (https://developers.facebook.com/docs/facebook-login/access-tokens/). In Unity, 
--- for example, the Token is available as AccessToken in the Facebook SDK ScriptableObject 
--- FB. Note that titles should never re-use the same Facebook applications between 
--- PlayFab Title IDs, as Facebook provides unique user IDs per application and 
--- doing so can result in issues with the Facebook ID for the user in their PlayFab 
--- account information. If you must re-use an application in a new PlayFab Title 
--- ID, please be sure to first unlink all accounts from Facebook, or delete all 
--- users in the first Title ID. 
---
--- https://docs.microsoft.com/rest/api/playfab/client/account-management/linkfacebookaccount
function Apis.LinkFacebookAccountAsync(
	sessionTicket: string, 
	request: Types.LinkFacebookAccountRequest
): Types.LinkFacebookAccountResult
	return PlayFabInternal.MakeApiCall(
		"/Client/LinkFacebookAccount",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/account-management/linkfacebookinstantgamesid
function Apis.LinkFacebookInstantGamesIdAsync(
	sessionTicket: string, 
	request: Types.LinkFacebookInstantGamesIdRequest
): Types.LinkFacebookInstantGamesIdResult
	return PlayFabInternal.MakeApiCall(
		"/Client/LinkFacebookInstantGamesId",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/account-management/linkgamecenteraccount
function Apis.LinkGameCenterAccountAsync(
	sessionTicket: string, 
	request: Types.LinkGameCenterAccountRequest
): Types.LinkGameCenterAccountResult
	return PlayFabInternal.MakeApiCall(
		"/Client/LinkGameCenterAccount",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- Google sign-in is accomplished by obtaining a Google OAuth 2.0 credential using 
--- the Google sign-in for Android APIs on the device and passing it to this API. 
---
--- https://docs.microsoft.com/rest/api/playfab/client/account-management/linkgoogleaccount
function Apis.LinkGoogleAccountAsync(
	sessionTicket: string, 
	request: Types.LinkGoogleAccountRequest
): Types.LinkGoogleAccountResult
	return PlayFabInternal.MakeApiCall(
		"/Client/LinkGoogleAccount",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- Google Play Games sign-in is accomplished by obtaining a Google OAuth 2.0 credential 
--- using the Google Play Games sign-in for Android APIs on the device and passing 
--- it to this API. 
---
--- https://docs.microsoft.com/rest/api/playfab/client/account-management/linkgoogleplaygamesservicesaccount
function Apis.LinkGooglePlayGamesServicesAccountAsync(
	sessionTicket: string, 
	request: Types.LinkGooglePlayGamesServicesAccountRequest
): Types.LinkGooglePlayGamesServicesAccountResult
	return PlayFabInternal.MakeApiCall(
		"/Client/LinkGooglePlayGamesServicesAccount",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/account-management/linkiosdeviceid
function Apis.LinkIOSDeviceIDAsync(
	sessionTicket: string, 
	request: Types.LinkIOSDeviceIDRequest
): Types.LinkIOSDeviceIDResult
	return PlayFabInternal.MakeApiCall(
		"/Client/LinkIOSDeviceID",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/account-management/linkkongregate
function Apis.LinkKongregateAsync(
	sessionTicket: string, 
	request: Types.LinkKongregateAccountRequest
): Types.LinkKongregateAccountResult
	return PlayFabInternal.MakeApiCall(
		"/Client/LinkKongregate",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/account-management/linknintendoserviceaccount
function Apis.LinkNintendoServiceAccountAsync(
	sessionTicket: string, 
	request: Types.LinkNintendoServiceAccountRequest
): Types.EmptyResult
	return PlayFabInternal.MakeApiCall(
		"/Client/LinkNintendoServiceAccount",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/account-management/linknintendoswitchdeviceid
function Apis.LinkNintendoSwitchDeviceIdAsync(
	sessionTicket: string, 
	request: Types.LinkNintendoSwitchDeviceIdRequest
): Types.LinkNintendoSwitchDeviceIdResult
	return PlayFabInternal.MakeApiCall(
		"/Client/LinkNintendoSwitchDeviceId",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/account-management/linkopenidconnect
function Apis.LinkOpenIdConnectAsync(
	sessionTicket: string, 
	request: Types.LinkOpenIdConnectRequest
): Types.EmptyResult
	return PlayFabInternal.MakeApiCall(
		"/Client/LinkOpenIdConnect",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/account-management/linkpsnaccount
function Apis.LinkPSNAccountAsync(
	sessionTicket: string, 
	request: Types.LinkPSNAccountRequest
): Types.LinkPSNAccountResult
	return PlayFabInternal.MakeApiCall(
		"/Client/LinkPSNAccount",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- Steam authentication is accomplished with the Steam Session Ticket. More information 
--- on the Ticket can be found in the Steamworks SDK, here: https://partner.steamgames.com/documentation/auth 
--- (requires sign-in). NOTE: For Steam authentication to work, the title must be 
--- configured with the Steam Application ID and Publisher Key in the PlayFab Game 
--- Manager (under Properties). Information on creating a Publisher Key (referred 
--- to as the Secret Key in PlayFab) for your title can be found here: https://partner.steamgames.com/documentation/webapi#publisherkey. 
---
--- https://docs.microsoft.com/rest/api/playfab/client/account-management/linksteamaccount
function Apis.LinkSteamAccountAsync(
	sessionTicket: string, 
	request: Types.LinkSteamAccountRequest
): Types.LinkSteamAccountResult
	return PlayFabInternal.MakeApiCall(
		"/Client/LinkSteamAccount",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/account-management/linktwitch
function Apis.LinkTwitchAsync(
	sessionTicket: string, 
	request: Types.LinkTwitchAccountRequest
): Types.LinkTwitchAccountResult
	return PlayFabInternal.MakeApiCall(
		"/Client/LinkTwitch",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/account-management/linkxboxaccount
function Apis.LinkXboxAccountAsync(
	sessionTicket: string, 
	request: Types.LinkXboxAccountRequest
): Types.LinkXboxAccountResult
	return PlayFabInternal.MakeApiCall(
		"/Client/LinkXboxAccount",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- On Android devices, the recommendation is to use the Settings.Secure.ANDROID_ID 
--- as the AndroidDeviceId, as described in this blog post (http://android-developers.blogspot.com/2011/03/identifying-app-installations.html). 
--- More information on this identifier can be found in the Android documentation 
--- (http://developer.android.com/reference/android/provider/Settings.Secure.html). 
--- If this is the first time a user has signed in with the Android device and CreateAccount 
--- is set to true, a new PlayFab account will be created and linked to the Android 
--- device ID. In this case, no email or username will be associated with the PlayFab 
--- account. Otherwise, if no PlayFab account is linked to the Android device, an 
--- error indicating this will be returned, so that the title can guide the user 
--- through creation of a PlayFab account. Please note that while multiple devices 
--- of this type can be linked to a single user account, only the one most recently 
--- used to login (or most recently linked) will be reflected in the user's account 
--- information. We will be updating to show all linked devices in a future release. 
---
--- https://docs.microsoft.com/rest/api/playfab/client/authentication/loginwithandroiddeviceid
function Apis.LoginWithAndroidDeviceIDAsync(
	request: Types.LoginWithAndroidDeviceIDRequest
): Types.LoginResult
	return PlayFabInternal.MakeApiCall(
		"/Client/LoginWithAndroidDeviceID",
		request,
		nil,
		nil
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/authentication/loginwithapple
function Apis.LoginWithAppleAsync(
	request: Types.LoginWithAppleRequest
): Types.LoginResult
	return PlayFabInternal.MakeApiCall(
		"/Client/LoginWithApple",
		request,
		nil,
		nil
	)
end

--- It is highly recommended that developers ensure that it is extremely unlikely 
--- that a customer could generate an ID which is already in use by another customer. 
--- If this is the first time a user has signed in with the Custom ID and CreateAccount 
--- is set to true, a new PlayFab account will be created and linked to the Custom 
--- ID. In this case, no email or username will be associated with the PlayFab account. 
--- Otherwise, if no PlayFab account is linked to the Custom ID, an error indicating 
--- this will be returned, so that the title can guide the user through creation 
--- of a PlayFab account. 
---
--- https://docs.microsoft.com/rest/api/playfab/client/authentication/loginwithcustomid
function Apis.LoginWithCustomIDAsync(
	request: Types.LoginWithCustomIDRequest
): Types.LoginResult
	return PlayFabInternal.MakeApiCall(
		"/Client/LoginWithCustomID",
		request,
		nil,
		nil
	)
end

--- Email address and password lengths are provided for information purposes. The 
--- server will validate that data passed in conforms to the field definition and 
--- report errors appropriately. It is recommended that developers not perform this 
--- validation locally, so that future updates do not require client updates. 
---
--- https://docs.microsoft.com/rest/api/playfab/client/authentication/loginwithemailaddress
function Apis.LoginWithEmailAddressAsync(
	request: Types.LoginWithEmailAddressRequest
): Types.LoginResult
	return PlayFabInternal.MakeApiCall(
		"/Client/LoginWithEmailAddress",
		request,
		nil,
		nil
	)
end

--- Facebook sign-in is accomplished using the Facebook User Access Token. More 
--- information on the Token can be found in the Facebook developer documentation 
--- (https://developers.facebook.com/docs/facebook-login/access-tokens/). In Unity, 
--- for example, the Token is available as AccessToken in the Facebook SDK ScriptableObject 
--- FB. If this is the first time a user has signed in with the Facebook account 
--- and CreateAccount is set to true, a new PlayFab account will be created and 
--- linked to the provided account's Facebook ID. In this case, no email or username 
--- will be associated with the PlayFab account. Otherwise, if no PlayFab account 
--- is linked to the Facebook account, an error indicating this will be returned, 
--- so that the title can guide the user through creation of a PlayFab account. 
--- Note that titles should never re-use the same Facebook applications between 
--- PlayFab Title IDs, as Facebook provides unique user IDs per application and 
--- doing so can result in issues with the Facebook ID for the user in their PlayFab 
--- account information. If you must re-use an application in a new PlayFab Title 
--- ID, please be sure to first unlink all accounts from Facebook, or delete all 
--- users in the first Title ID. 
---
--- https://docs.microsoft.com/rest/api/playfab/client/authentication/loginwithfacebook
function Apis.LoginWithFacebookAsync(
	request: Types.LoginWithFacebookRequest
): Types.LoginResult
	return PlayFabInternal.MakeApiCall(
		"/Client/LoginWithFacebook",
		request,
		nil,
		nil
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/authentication/loginwithfacebookinstantgamesid
function Apis.LoginWithFacebookInstantGamesIdAsync(
	request: Types.LoginWithFacebookInstantGamesIdRequest
): Types.LoginResult
	return PlayFabInternal.MakeApiCall(
		"/Client/LoginWithFacebookInstantGamesId",
		request,
		nil,
		nil
	)
end

--- The Game Center player identifier (https://developer.apple.com/library/ios/documentation/Accounts/Reference/ACAccountClassRef/index.html#//apple_ref/occ/instp/ACAccount/identifier) 
--- is a generated string which is stored on the local device. As with device identifiers, 
--- care must be taken to never expose a player's Game Center identifier to end 
--- users, as that could result in a user's account being compromised. If this is 
--- the first time a user has signed in with Game Center and CreateAccount is set 
--- to true, a new PlayFab account will be created and linked to the Game Center 
--- identifier. In this case, no email or username will be associated with the PlayFab 
--- account. Otherwise, if no PlayFab account is linked to the Game Center account, 
--- an error indicating this will be returned, so that the title can guide the user 
--- through creation of a PlayFab account. 
---
--- https://docs.microsoft.com/rest/api/playfab/client/authentication/loginwithgamecenter
function Apis.LoginWithGameCenterAsync(
	request: Types.LoginWithGameCenterRequest
): Types.LoginResult
	return PlayFabInternal.MakeApiCall(
		"/Client/LoginWithGameCenter",
		request,
		nil,
		nil
	)
end

--- Google sign-in is accomplished by obtaining a Google OAuth 2.0 credential using 
--- the Google sign-in for Android APIs on the device and passing it to this API. 
--- If this is the first time a user has signed in with the Google account and CreateAccount 
--- is set to true, a new PlayFab account will be created and linked to the Google 
--- account. Otherwise, if no PlayFab account is linked to the Google account, an 
--- error indicating this will be returned, so that the title can guide the user 
--- through creation of a PlayFab account. The current (recommended) method for 
--- obtaining a Google account credential in an Android application is to call GoogleSignInAccount.getServerAuthCode() 
--- and send the auth code as the ServerAuthCode parameter of this API. Before doing 
--- this, you must create an OAuth 2.0 web application client ID in the Google API 
--- Console and configure its client ID and secret in the PlayFab Game Manager Google 
--- Add-on for your title. This method does not require prompting of the user for 
--- additional Google account permissions, resulting in a user experience with the 
--- least possible friction. For more information about obtaining the server auth 
--- code, see https://developers.google.com/identity/sign-in/android/offline-access. 
--- The previous (deprecated) method was to obtain an OAuth access token by calling 
--- GetAccessToken() on the client and passing it as the AccessToken parameter to 
--- this API. for the with the Google OAuth 2.0 Access Token. More information on 
--- this change can be found in the Google developer documentation (https://android-developers.googleblog.com/2016/01/play-games-permissions-are-changing-in.html). 
---
--- https://docs.microsoft.com/rest/api/playfab/client/authentication/loginwithgoogleaccount
function Apis.LoginWithGoogleAccountAsync(
	request: Types.LoginWithGoogleAccountRequest
): Types.LoginResult
	return PlayFabInternal.MakeApiCall(
		"/Client/LoginWithGoogleAccount",
		request,
		nil,
		nil
	)
end

--- Google Play Games sign-in is accomplished by obtaining a Google OAuth 2.0 credential 
--- using the Google Play Games sign-in for Android APIs on the device and passing 
--- it to this API. If this is the first time a user has signed in with the Google 
--- Play Games account and CreateAccount is set to true, a new PlayFab account will 
--- be created and linked to the Google Play Games account. Otherwise, if no PlayFab 
--- account is linked to the Google Play Games account, an error indicating this 
--- will be returned, so that the title can guide the user through creation of a 
--- PlayFab account. The current (recommended) method for obtaining a Google Play 
--- Games account credential in an Android application is to call GamesSignInClient.requestServerSideAccess() 
--- and send the auth code as the ServerAuthCode parameter of this API. Before doing 
--- this, you must create an OAuth 2.0 web application client ID in the Google API 
--- Console and configure its client ID and secret in the PlayFab Game Manager Google 
--- Add-on for your title. This method does not require prompting of the user for 
--- additional Google account permissions, resulting in a user experience with the 
--- least possible friction. For more information about obtaining the server auth 
--- code, see https://developers.google.com/games/services/android/signin. 
---
--- https://docs.microsoft.com/rest/api/playfab/client/authentication/loginwithgoogleplaygamesservices
function Apis.LoginWithGooglePlayGamesServicesAsync(
	request: Types.LoginWithGooglePlayGamesServicesRequest
): Types.LoginResult
	return PlayFabInternal.MakeApiCall(
		"/Client/LoginWithGooglePlayGamesServices",
		request,
		nil,
		nil
	)
end

--- On iOS devices, the identifierForVendor (https://developer.apple.com/library/ios/documentation/UIKit/Reference/UIDevice_Class/index.html#//apple_ref/occ/instp/UIDevice/identifierForVendor) 
--- must be used as the DeviceId, as the UIDevice uniqueIdentifier has been deprecated 
--- as of iOS 5, and use of the advertisingIdentifier for this purpose will result 
--- in failure of Apple's certification process. If this is the first time a user 
--- has signed in with the iOS device and CreateAccount is set to true, a new PlayFab 
--- account will be created and linked to the vendor-specific iOS device ID. In 
--- this case, no email or username will be associated with the PlayFab account. 
--- Otherwise, if no PlayFab account is linked to the iOS device, an error indicating 
--- this will be returned, so that the title can guide the user through creation 
--- of a PlayFab account. Please note that while multiple devices of this type can 
--- be linked to a single user account, only the one most recently used to login 
--- (or most recently linked) will be reflected in the user's account information. 
--- We will be updating to show all linked devices in a future release. 
---
--- https://docs.microsoft.com/rest/api/playfab/client/authentication/loginwithiosdeviceid
function Apis.LoginWithIOSDeviceIDAsync(
	request: Types.LoginWithIOSDeviceIDRequest
): Types.LoginResult
	return PlayFabInternal.MakeApiCall(
		"/Client/LoginWithIOSDeviceID",
		request,
		nil,
		nil
	)
end

--- More details regarding Kongregate and their game authentication system can be 
--- found at http://developers.kongregate.com/docs/virtual-goods/authentication. 
--- Developers must provide the Kongregate user ID and auth token that are generated 
--- using the Kongregate client library. PlayFab will combine these identifiers 
--- with the title's unique Kongregate app ID to log the player into the Kongregate 
--- system. If CreateAccount is set to true and there is not already a user matched 
--- to this Kongregate ID, then PlayFab will create a new account for this user 
--- and link the ID. In this case, no email or username will be associated with 
--- the PlayFab account. If there is already a different PlayFab user linked with 
--- this account, then an error will be returned. 
---
--- https://docs.microsoft.com/rest/api/playfab/client/authentication/loginwithkongregate
function Apis.LoginWithKongregateAsync(
	request: Types.LoginWithKongregateRequest
): Types.LoginResult
	return PlayFabInternal.MakeApiCall(
		"/Client/LoginWithKongregate",
		request,
		nil,
		nil
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/authentication/loginwithnintendoserviceaccount
function Apis.LoginWithNintendoServiceAccountAsync(
	request: Types.LoginWithNintendoServiceAccountRequest
): Types.LoginResult
	return PlayFabInternal.MakeApiCall(
		"/Client/LoginWithNintendoServiceAccount",
		request,
		nil,
		nil
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/authentication/loginwithnintendoswitchdeviceid
function Apis.LoginWithNintendoSwitchDeviceIdAsync(
	request: Types.LoginWithNintendoSwitchDeviceIdRequest
): Types.LoginResult
	return PlayFabInternal.MakeApiCall(
		"/Client/LoginWithNintendoSwitchDeviceId",
		request,
		nil,
		nil
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/authentication/loginwithopenidconnect
function Apis.LoginWithOpenIdConnectAsync(
	request: Types.LoginWithOpenIdConnectRequest
): Types.LoginResult
	return PlayFabInternal.MakeApiCall(
		"/Client/LoginWithOpenIdConnect",
		request,
		nil,
		nil
	)
end

--- If this is the first time a user has signed in with the PlayStation :tm: Network 
--- account and CreateAccount is set to true, a new PlayFab account will be created 
--- and linked to the PlayStation :tm: Network account. In this case, no email or 
--- username will be associated with the PlayFab account. Otherwise, if no PlayFab 
--- account is linked to the PlayStation :tm: Network account, an error indicating 
--- this will be returned, so that the title can guide the user through creation 
--- of a PlayFab account. 
---
--- https://docs.microsoft.com/rest/api/playfab/client/authentication/loginwithpsn
function Apis.LoginWithPSNAsync(
	request: Types.LoginWithPSNRequest
): Types.LoginResult
	return PlayFabInternal.MakeApiCall(
		"/Client/LoginWithPSN",
		request,
		nil,
		nil
	)
end

--- Username and password lengths are provided for information purposes. The server 
--- will validate that data passed in conforms to the field definition and report 
--- errors appropriately. It is recommended that developers not perform this validation 
--- locally, so that future updates to the username or password do not require client 
--- updates. 
---
--- https://docs.microsoft.com/rest/api/playfab/client/authentication/loginwithplayfab
function Apis.LoginWithPlayFabAsync(
	request: Types.LoginWithPlayFabRequest
): Types.LoginResult
	return PlayFabInternal.MakeApiCall(
		"/Client/LoginWithPlayFab",
		request,
		nil,
		nil
	)
end

--- Steam sign-in is accomplished with the Steam Session Ticket. More information 
--- on the Ticket can be found in the Steamworks SDK, here: https://partner.steamgames.com/documentation/auth 
--- (requires sign-in). NOTE: For Steam authentication to work, the title must be 
--- configured with the Steam Application ID and Web API Key in the PlayFab Game 
--- Manager (under Steam in the Add-ons Marketplace). You can obtain a Web API Key 
--- from the Permissions page of any Group associated with your App ID in the Steamworks 
--- site. If this is the first time a user has signed in with the Steam account 
--- and CreateAccount is set to true, a new PlayFab account will be created and 
--- linked to the provided account's Steam ID. In this case, no email or username 
--- will be associated with the PlayFab account. Otherwise, if no PlayFab account 
--- is linked to the Steam account, an error indicating this will be returned, so 
--- that the title can guide the user through creation of a PlayFab account. 
---
--- https://docs.microsoft.com/rest/api/playfab/client/authentication/loginwithsteam
function Apis.LoginWithSteamAsync(
	request: Types.LoginWithSteamRequest
): Types.LoginResult
	return PlayFabInternal.MakeApiCall(
		"/Client/LoginWithSteam",
		request,
		nil,
		nil
	)
end

--- More details regarding Twitch and their authentication system can be found at 
--- https://github.com/justintv/Twitch-API/blob/master/authentication.md. Developers 
--- must provide the Twitch access token that is generated using one of the Twitch 
--- authentication flows. PlayFab will use the title's unique Twitch Client ID to 
--- authenticate the token and log in to the PlayFab system. If CreateAccount is 
--- set to true and there is not already a user matched to the Twitch username that 
--- generated the token, then PlayFab will create a new account for this user and 
--- link the ID. In this case, no email or username will be associated with the 
--- PlayFab account. If there is already a different PlayFab user linked with this 
--- account, then an error will be returned. 
---
--- https://docs.microsoft.com/rest/api/playfab/client/authentication/loginwithtwitch
function Apis.LoginWithTwitchAsync(
	request: Types.LoginWithTwitchRequest
): Types.LoginResult
	return PlayFabInternal.MakeApiCall(
		"/Client/LoginWithTwitch",
		request,
		nil,
		nil
	)
end

--- If this is the first time a user has signed in with the Xbox Live account and 
--- CreateAccount is set to true, a new PlayFab account will be created and linked 
--- to the Xbox Live account. In this case, no email or username will be associated 
--- with the PlayFab account. Otherwise, if no PlayFab account is linked to the 
--- Xbox Live account, an error indicating this will be returned, so that the title 
--- can guide the user through creation of a PlayFab account. 
---
--- https://docs.microsoft.com/rest/api/playfab/client/authentication/loginwithxbox
function Apis.LoginWithXboxAsync(
	request: Types.LoginWithXboxRequest
): Types.LoginResult
	return PlayFabInternal.MakeApiCall(
		"/Client/LoginWithXbox",
		request,
		nil,
		nil
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/matchmaking/matchmake
function Apis.MatchmakeAsync(
	sessionTicket: string, 
	request: Types.MatchmakeRequest
): Types.MatchmakeResult
	return PlayFabInternal.MakeApiCall(
		"/Client/Matchmake",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/trading/opentrade
function Apis.OpenTradeAsync(
	sessionTicket: string, 
	request: Types.OpenTradeRequest
): Types.OpenTradeResponse
	return PlayFabInternal.MakeApiCall(
		"/Client/OpenTrade",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- This is the second step in the purchasing process, initiating the purchase transaction 
--- with the payment provider (if applicable). For payment provider scenarios, the 
--- title should next present the user with the payment provider'sinterface for 
--- payment. Once the player has completed the payment with the provider, the title 
--- should call ConfirmPurchase tofinalize the process and add the appropriate items 
--- to the player inventory. 
---
--- https://docs.microsoft.com/rest/api/playfab/client/player-item-management/payforpurchase
function Apis.PayForPurchaseAsync(
	sessionTicket: string, 
	request: Types.PayForPurchaseRequest
): Types.PayForPurchaseResult
	return PlayFabInternal.MakeApiCall(
		"/Client/PayForPurchase",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- Please note that the processing time for inventory grants and purchases increases 
--- fractionally the more items are in the inventory, and the more items are in 
--- the grant/purchase operation (with each item in a bundle being a distinct add). 
---
--- https://docs.microsoft.com/rest/api/playfab/client/player-item-management/purchaseitem
function Apis.PurchaseItemAsync(
	sessionTicket: string, 
	request: Types.PurchaseItemRequest
): Types.PurchaseItemResult
	return PlayFabInternal.MakeApiCall(
		"/Client/PurchaseItem",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- Coupon codes can be created for any item, or set of items, in the catalog for 
--- the title. This operation causes the coupon to be consumed, and the specific 
--- items to be awarded to the user. Attempting to re-use an already consumed code, 
--- or a code which has not yet been created in the service, will result in an error. 
---
--- https://docs.microsoft.com/rest/api/playfab/client/player-item-management/redeemcoupon
function Apis.RedeemCouponAsync(
	sessionTicket: string, 
	request: Types.RedeemCouponRequest
): Types.RedeemCouponResult
	return PlayFabInternal.MakeApiCall(
		"/Client/RedeemCoupon",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/platform-specific-methods/refreshpsnauthtoken
function Apis.RefreshPSNAuthTokenAsync(
	sessionTicket: string, 
	request: Types.RefreshPSNAuthTokenRequest
): Types.EmptyResponse
	return PlayFabInternal.MakeApiCall(
		"/Client/RefreshPSNAuthToken",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- The steps to configure and send Push Notifications is described in the PlayFab 
--- tutorials, here: https://docs.microsoft.com/gaming/playfab/features/engagement/push-notifications/quickstart 
---
--- https://docs.microsoft.com/rest/api/playfab/client/platform-specific-methods/registerforiospushnotification
function Apis.RegisterForIOSPushNotificationAsync(
	sessionTicket: string, 
	request: Types.RegisterForIOSPushNotificationRequest
): Types.RegisterForIOSPushNotificationResult
	return PlayFabInternal.MakeApiCall(
		"/Client/RegisterForIOSPushNotification",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/authentication/registerplayfabuser
function Apis.RegisterPlayFabUserAsync(
	request: Types.RegisterPlayFabUserRequest
): Types.RegisterPlayFabUserResult
	return PlayFabInternal.MakeApiCall(
		"/Client/RegisterPlayFabUser",
		request,
		nil,
		nil
	)
end

--- This API removes an existing contact email from the player's profile. 
---
--- https://docs.microsoft.com/rest/api/playfab/client/account-management/removecontactemail
function Apis.RemoveContactEmailAsync(
	sessionTicket: string, 
	request: Types.RemoveContactEmailRequest
): Types.RemoveContactEmailResult
	return PlayFabInternal.MakeApiCall(
		"/Client/RemoveContactEmail",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/friend-list-management/removefriend
function Apis.RemoveFriendAsync(
	sessionTicket: string, 
	request: Types.RemoveFriendRequest
): Types.RemoveFriendResult
	return PlayFabInternal.MakeApiCall(
		"/Client/RemoveFriend",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/account-management/removegenericid
function Apis.RemoveGenericIDAsync(
	sessionTicket: string, 
	request: Types.RemoveGenericIDRequest
): Types.RemoveGenericIDResult
	return PlayFabInternal.MakeApiCall(
		"/Client/RemoveGenericID",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/shared-group-data/removesharedgroupmembers
function Apis.RemoveSharedGroupMembersAsync(
	sessionTicket: string, 
	request: Types.RemoveSharedGroupMembersRequest
): Types.RemoveSharedGroupMembersResult
	return PlayFabInternal.MakeApiCall(
		"/Client/RemoveSharedGroupMembers",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- Given a Placement ID and a Reward ID from the GetAdPlacements API call records 
--- a player's ad activity. 
---
--- https://docs.microsoft.com/rest/api/playfab/client/advertising/reportadactivity
function Apis.ReportAdActivityAsync(
	sessionTicket: string, 
	request: Types.ReportAdActivityRequest
): Types.ReportAdActivityResult
	return PlayFabInternal.MakeApiCall(
		"/Client/ReportAdActivity",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- Any arbitrary information collected by the device 
---
--- https://docs.microsoft.com/rest/api/playfab/client/analytics/reportdeviceinfo
function Apis.ReportDeviceInfoAsync(
	sessionTicket: string, 
	request: Types.DeviceInfoRequest
): Types.EmptyResponse
	return PlayFabInternal.MakeApiCall(
		"/Client/ReportDeviceInfo",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/account-management/reportplayer
function Apis.ReportPlayerAsync(
	sessionTicket: string, 
	request: Types.ReportPlayerClientRequest
): Types.ReportPlayerClientResult
	return PlayFabInternal.MakeApiCall(
		"/Client/ReportPlayer",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- The title should obtain a refresh receipt via restoreCompletedTransactions in 
--- the SKPaymentQueue of the Apple StoreKit and pass that in to this call. The 
--- resultant receipt contains new receipt instances for all non-consumable goods 
--- previously purchased by the user. This API call iterates through every purchase 
--- in the receipt and restores the items if they still exist in the catalog and 
--- can be validated. 
---
--- https://docs.microsoft.com/rest/api/playfab/client/platform-specific-methods/restoreiospurchases
function Apis.RestoreIOSPurchasesAsync(
	sessionTicket: string, 
	request: Types.RestoreIOSPurchasesRequest
): Types.RestoreIOSPurchasesResult
	return PlayFabInternal.MakeApiCall(
		"/Client/RestoreIOSPurchases",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- Given a Placement ID and a Reward ID from the GetAdPlacements API call will 
--- grant the reward to the player. This API call does not require that ReportAdActivity 
--- is called. The grant is performed in real-time, at the end of the call all items 
--- will have been granted. 
---
--- https://docs.microsoft.com/rest/api/playfab/client/advertising/rewardadactivity
function Apis.RewardAdActivityAsync(
	sessionTicket: string, 
	request: Types.RewardAdActivityRequest
): Types.RewardAdActivityResult
	return PlayFabInternal.MakeApiCall(
		"/Client/RewardAdActivity",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- If the account in question is a "temporary" account (for example, one that was 
--- created via a call to LoginFromIOSDeviceID), thisfunction will have no effect. 
--- Only PlayFab accounts which have valid email addresses will be able to receive 
--- a password reset email using this API. 
---
--- https://docs.microsoft.com/rest/api/playfab/client/account-management/sendaccountrecoveryemail
function Apis.SendAccountRecoveryEmailAsync(
	request: Types.SendAccountRecoveryEmailRequest
): Types.SendAccountRecoveryEmailResult
	return PlayFabInternal.MakeApiCall(
		"/Client/SendAccountRecoveryEmail",
		request,
		nil,
		nil
	)
end

--- This operation is not additive. It will completely replace the tag list for 
--- the specified user. Please note that only users in the PlayFab friends list 
--- can be assigned tags. Attempting to set a tag on a friend only included in the 
--- friends list from a social site integration (such as Facebook or Steam) will 
--- return the AccountNotFound error. 
---
--- https://docs.microsoft.com/rest/api/playfab/client/friend-list-management/setfriendtags
function Apis.SetFriendTagsAsync(
	sessionTicket: string, 
	request: Types.SetFriendTagsRequest
): Types.SetFriendTagsResult
	return PlayFabInternal.MakeApiCall(
		"/Client/SetFriendTags",
		request,
		"X-Authorization",
		sessionTicket
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
--- https://docs.microsoft.com/rest/api/playfab/client/authentication/setplayersecret
function Apis.SetPlayerSecretAsync(
	sessionTicket: string, 
	request: Types.SetPlayerSecretRequest
): Types.SetPlayerSecretResult
	return PlayFabInternal.MakeApiCall(
		"/Client/SetPlayerSecret",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- This is the first step in the purchasing process. For security purposes, once 
--- the order (or "cart") has been created, additional inventory objects may no 
--- longer be added. In addition, inventory objects will be locked to the current 
--- prices, regardless of any subsequent changes at the catalog level which may 
--- occur during the next two steps. 
---
--- https://docs.microsoft.com/rest/api/playfab/client/player-item-management/startpurchase
function Apis.StartPurchaseAsync(
	sessionTicket: string, 
	request: Types.StartPurchaseRequest
): Types.StartPurchaseResult
	return PlayFabInternal.MakeApiCall(
		"/Client/StartPurchase",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- This API must be enabled for use as an option in the game manager website. It 
--- is disabled by default. 
---
--- https://docs.microsoft.com/rest/api/playfab/client/player-item-management/subtractuservirtualcurrency
function Apis.SubtractUserVirtualCurrencyAsync(
	sessionTicket: string, 
	request: Types.SubtractUserVirtualCurrencyRequest
): Types.ModifyUserVirtualCurrencyResult
	return PlayFabInternal.MakeApiCall(
		"/Client/SubtractUserVirtualCurrency",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/account-management/unlinkandroiddeviceid
function Apis.UnlinkAndroidDeviceIDAsync(
	sessionTicket: string, 
	request: Types.UnlinkAndroidDeviceIDRequest
): Types.UnlinkAndroidDeviceIDResult
	return PlayFabInternal.MakeApiCall(
		"/Client/UnlinkAndroidDeviceID",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/account-management/unlinkapple
function Apis.UnlinkAppleAsync(
	sessionTicket: string, 
	request: Types.UnlinkAppleRequest
): Types.EmptyResponse
	return PlayFabInternal.MakeApiCall(
		"/Client/UnlinkApple",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/account-management/unlinkcustomid
function Apis.UnlinkCustomIDAsync(
	sessionTicket: string, 
	request: Types.UnlinkCustomIDRequest
): Types.UnlinkCustomIDResult
	return PlayFabInternal.MakeApiCall(
		"/Client/UnlinkCustomID",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/account-management/unlinkfacebookaccount
function Apis.UnlinkFacebookAccountAsync(
	sessionTicket: string, 
	request: Types.UnlinkFacebookAccountRequest
): Types.UnlinkFacebookAccountResult
	return PlayFabInternal.MakeApiCall(
		"/Client/UnlinkFacebookAccount",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/account-management/unlinkfacebookinstantgamesid
function Apis.UnlinkFacebookInstantGamesIdAsync(
	sessionTicket: string, 
	request: Types.UnlinkFacebookInstantGamesIdRequest
): Types.UnlinkFacebookInstantGamesIdResult
	return PlayFabInternal.MakeApiCall(
		"/Client/UnlinkFacebookInstantGamesId",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/account-management/unlinkgamecenteraccount
function Apis.UnlinkGameCenterAccountAsync(
	sessionTicket: string, 
	request: Types.UnlinkGameCenterAccountRequest
): Types.UnlinkGameCenterAccountResult
	return PlayFabInternal.MakeApiCall(
		"/Client/UnlinkGameCenterAccount",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/account-management/unlinkgoogleaccount
function Apis.UnlinkGoogleAccountAsync(
	sessionTicket: string, 
	request: Types.UnlinkGoogleAccountRequest
): Types.UnlinkGoogleAccountResult
	return PlayFabInternal.MakeApiCall(
		"/Client/UnlinkGoogleAccount",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/account-management/unlinkgoogleplaygamesservicesaccount
function Apis.UnlinkGooglePlayGamesServicesAccountAsync(
	sessionTicket: string, 
	request: Types.UnlinkGooglePlayGamesServicesAccountRequest
): Types.UnlinkGooglePlayGamesServicesAccountResult
	return PlayFabInternal.MakeApiCall(
		"/Client/UnlinkGooglePlayGamesServicesAccount",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/account-management/unlinkiosdeviceid
function Apis.UnlinkIOSDeviceIDAsync(
	sessionTicket: string, 
	request: Types.UnlinkIOSDeviceIDRequest
): Types.UnlinkIOSDeviceIDResult
	return PlayFabInternal.MakeApiCall(
		"/Client/UnlinkIOSDeviceID",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/account-management/unlinkkongregate
function Apis.UnlinkKongregateAsync(
	sessionTicket: string, 
	request: Types.UnlinkKongregateAccountRequest
): Types.UnlinkKongregateAccountResult
	return PlayFabInternal.MakeApiCall(
		"/Client/UnlinkKongregate",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/account-management/unlinknintendoserviceaccount
function Apis.UnlinkNintendoServiceAccountAsync(
	sessionTicket: string, 
	request: Types.UnlinkNintendoServiceAccountRequest
): Types.EmptyResponse
	return PlayFabInternal.MakeApiCall(
		"/Client/UnlinkNintendoServiceAccount",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/account-management/unlinknintendoswitchdeviceid
function Apis.UnlinkNintendoSwitchDeviceIdAsync(
	sessionTicket: string, 
	request: Types.UnlinkNintendoSwitchDeviceIdRequest
): Types.UnlinkNintendoSwitchDeviceIdResult
	return PlayFabInternal.MakeApiCall(
		"/Client/UnlinkNintendoSwitchDeviceId",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/account-management/unlinkopenidconnect
function Apis.UnlinkOpenIdConnectAsync(
	sessionTicket: string, 
	request: Types.UnlinkOpenIdConnectRequest
): Types.EmptyResponse
	return PlayFabInternal.MakeApiCall(
		"/Client/UnlinkOpenIdConnect",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/account-management/unlinkpsnaccount
function Apis.UnlinkPSNAccountAsync(
	sessionTicket: string, 
	request: Types.UnlinkPSNAccountRequest
): Types.UnlinkPSNAccountResult
	return PlayFabInternal.MakeApiCall(
		"/Client/UnlinkPSNAccount",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/account-management/unlinksteamaccount
function Apis.UnlinkSteamAccountAsync(
	sessionTicket: string, 
	request: Types.UnlinkSteamAccountRequest
): Types.UnlinkSteamAccountResult
	return PlayFabInternal.MakeApiCall(
		"/Client/UnlinkSteamAccount",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/account-management/unlinktwitch
function Apis.UnlinkTwitchAsync(
	sessionTicket: string, 
	request: Types.UnlinkTwitchAccountRequest
): Types.UnlinkTwitchAccountResult
	return PlayFabInternal.MakeApiCall(
		"/Client/UnlinkTwitch",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/account-management/unlinkxboxaccount
function Apis.UnlinkXboxAccountAsync(
	sessionTicket: string, 
	request: Types.UnlinkXboxAccountRequest
): Types.UnlinkXboxAccountResult
	return PlayFabInternal.MakeApiCall(
		"/Client/UnlinkXboxAccount",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- Specify the container and optionally the catalogVersion for the container to 
--- open 
---
--- https://docs.microsoft.com/rest/api/playfab/client/player-item-management/unlockcontainerinstance
function Apis.UnlockContainerInstanceAsync(
	sessionTicket: string, 
	request: Types.UnlockContainerInstanceRequest
): Types.UnlockContainerItemResult
	return PlayFabInternal.MakeApiCall(
		"/Client/UnlockContainerInstance",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- Specify the type of container to open and optionally the catalogVersion for 
--- the container to open 
---
--- https://docs.microsoft.com/rest/api/playfab/client/player-item-management/unlockcontaineritem
function Apis.UnlockContainerItemAsync(
	sessionTicket: string, 
	request: Types.UnlockContainerItemRequest
): Types.UnlockContainerItemResult
	return PlayFabInternal.MakeApiCall(
		"/Client/UnlockContainerItem",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/account-management/updateavatarurl
function Apis.UpdateAvatarUrlAsync(
	sessionTicket: string, 
	request: Types.UpdateAvatarUrlRequest
): Types.EmptyResponse
	return PlayFabInternal.MakeApiCall(
		"/Client/UpdateAvatarUrl",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- This function performs an additive update of the arbitrary strings containing 
--- the custom data for the character. In updating the custom data object, keys 
--- which already exist in the object will have their values overwritten, while 
--- keys with null values will be removed. New keys will be added, with the given 
--- values. No other key-value pairs will be changed apart from those specified 
--- in the call. 
---
--- https://docs.microsoft.com/rest/api/playfab/client/character-data/updatecharacterdata
function Apis.UpdateCharacterDataAsync(
	sessionTicket: string, 
	request: Types.UpdateCharacterDataRequest
): Types.UpdateCharacterDataResult
	return PlayFabInternal.MakeApiCall(
		"/Client/UpdateCharacterData",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- Enable this option with the 'Allow Client to Post Player Statistics' option 
--- in PlayFab GameManager for your title. However, this is not best practice, as 
--- this data will no longer be safely controlled by the server. This operation 
--- is additive. Character Statistics not currently defined will be added, while 
--- those already defined will be updated with the given values. All other user 
--- statistics will remain unchanged. Character statistics are used by the character-leaderboard 
--- apis, and accessible for custom game-logic. 
---
--- https://docs.microsoft.com/rest/api/playfab/client/characters/updatecharacterstatistics
function Apis.UpdateCharacterStatisticsAsync(
	sessionTicket: string, 
	request: Types.UpdateCharacterStatisticsRequest
): Types.UpdateCharacterStatisticsResult
	return PlayFabInternal.MakeApiCall(
		"/Client/UpdateCharacterStatistics",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- Enable this option with the 'Allow Client to Post Player Statistics' option 
--- in PlayFab GameManager for your title. However, this is not best practice, as 
--- this data will no longer be safely controlled by the server. This operation 
--- is additive. Statistics not currently defined will be added, while those already 
--- defined will be updated with the given values. All other user statistics will 
--- remain unchanged. Note that if the statistic is intended to have a reset period, 
--- the UpdatePlayerStatisticDefinition API call can be used to define that reset 
--- period. Once a statistic has been versioned (reset), the now-previous version 
--- can still be written to for up a short, pre-defined period (currently 10 seconds), 
--- using the Version parameter in this call. 
---
--- https://docs.microsoft.com/rest/api/playfab/client/player-data-management/updateplayerstatistics
function Apis.UpdatePlayerStatisticsAsync(
	sessionTicket: string, 
	request: Types.UpdatePlayerStatisticsRequest
): Types.UpdatePlayerStatisticsResult
	return PlayFabInternal.MakeApiCall(
		"/Client/UpdatePlayerStatistics",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- Note that in the case of multiple calls to write to the same shared group data 
--- keys, the last write received by the PlayFab service will determine the value 
--- available to subsequent read operations. For scenarios requiring coordination 
--- of data updates, it is recommended that titles make use of user data with read 
--- permission set to public, or a combination of user data and shared group data. 
---
--- https://docs.microsoft.com/rest/api/playfab/client/shared-group-data/updatesharedgroupdata
function Apis.UpdateSharedGroupDataAsync(
	sessionTicket: string, 
	request: Types.UpdateSharedGroupDataRequest
): Types.UpdateSharedGroupDataResult
	return PlayFabInternal.MakeApiCall(
		"/Client/UpdateSharedGroupData",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- This function performs an additive update of the arbitrary strings containing 
--- the custom data for the user. In updating the custom data object, keys which 
--- already exist in the object will have their values overwritten, while keys with 
--- null values will be removed. New keys will be added, with the given values. 
--- No other key-value pairs will be changed apart from those specified in the call. 
---
--- https://docs.microsoft.com/rest/api/playfab/client/player-data-management/updateuserdata
function Apis.UpdateUserDataAsync(
	sessionTicket: string, 
	request: Types.UpdateUserDataRequest
): Types.UpdateUserDataResult
	return PlayFabInternal.MakeApiCall(
		"/Client/UpdateUserData",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- This function performs an additive update of the arbitrary strings containing 
--- the custom data for the user. In updating the custom data object, keys which 
--- already exist in the object will have their values overwritten, while keys with 
--- null values will be removed. New keys will be added, with the given values. 
--- No other key-value pairs will be changed apart from those specified in the call. 
---
--- https://docs.microsoft.com/rest/api/playfab/client/player-data-management/updateuserpublisherdata
function Apis.UpdateUserPublisherDataAsync(
	sessionTicket: string, 
	request: Types.UpdateUserDataRequest
): Types.UpdateUserDataResult
	return PlayFabInternal.MakeApiCall(
		"/Client/UpdateUserPublisherData",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- In addition to the PlayFab username, titles can make use of a DisplayName which 
--- is also a unique identifier, but specific to the title. This allows for unique 
--- names which more closely match the theme or genre of a title, for example. 
---
--- https://docs.microsoft.com/rest/api/playfab/client/account-management/updateusertitledisplayname
function Apis.UpdateUserTitleDisplayNameAsync(
	sessionTicket: string, 
	request: Types.UpdateUserTitleDisplayNameRequest
): Types.UpdateUserTitleDisplayNameResult
	return PlayFabInternal.MakeApiCall(
		"/Client/UpdateUserTitleDisplayName",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/platform-specific-methods/validateamazoniapreceipt
function Apis.ValidateAmazonIAPReceiptAsync(
	sessionTicket: string, 
	request: Types.ValidateAmazonReceiptRequest
): Types.ValidateAmazonReceiptResult
	return PlayFabInternal.MakeApiCall(
		"/Client/ValidateAmazonIAPReceipt",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- The packageName and productId are defined in the GooglePlay store. The productId 
--- must match the ItemId of the inventory item in the PlayFab catalog for the title. 
--- This enables the PlayFab service to securely validate that the purchase is for 
--- the correct item, in order to prevent uses from passing valid receipts as being 
--- for more expensive items (passing a receipt for a 99-cent purchase as being 
--- for a $19.99 purchase, for example). Each receipt may be validated only once 
--- to avoid granting the same item over and over from a single purchase. 
---
--- https://docs.microsoft.com/rest/api/playfab/client/platform-specific-methods/validategoogleplaypurchase
function Apis.ValidateGooglePlayPurchaseAsync(
	sessionTicket: string, 
	request: Types.ValidateGooglePlayPurchaseRequest
): Types.ValidateGooglePlayPurchaseResult
	return PlayFabInternal.MakeApiCall(
		"/Client/ValidateGooglePlayPurchase",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- The CurrencyCode and PurchasePrice must match the price which was set up for 
--- the item in the Apple store. In addition, The ItemId of the inventory in the 
--- PlayFab Catalog must match the Product ID as it was set up in the Apple store. 
--- This enables the PlayFab service to securely validate that the purchase is for 
--- the correct item, in order to prevent uses from passing valid receipts as being 
--- for more expensive items (passing a receipt for a 99-cent purchase as being 
--- for a $19.99 purchase, for example). 
---
--- https://docs.microsoft.com/rest/api/playfab/client/platform-specific-methods/validateiosreceipt
function Apis.ValidateIOSReceiptAsync(
	sessionTicket: string, 
	request: Types.ValidateIOSReceiptRequest
): Types.ValidateIOSReceiptResult
	return PlayFabInternal.MakeApiCall(
		"/Client/ValidateIOSReceipt",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/platform-specific-methods/validatewindowsstorereceipt
function Apis.ValidateWindowsStoreReceiptAsync(
	sessionTicket: string, 
	request: Types.ValidateWindowsReceiptRequest
): Types.ValidateWindowsReceiptResult
	return PlayFabInternal.MakeApiCall(
		"/Client/ValidateWindowsStoreReceipt",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- This API is designed to write a multitude of different client-defined events 
--- into PlayStream. It supports a flexible JSON schema, which allowsfor arbitrary 
--- key-value pairs to describe any character-based event. The created event will 
--- be locked to the authenticated title and player.  
---
--- https://docs.microsoft.com/rest/api/playfab/client/analytics/writecharacterevent
function Apis.WriteCharacterEventAsync(
	sessionTicket: string, 
	request: Types.WriteClientCharacterEventRequest
): Types.WriteEventResponse
	return PlayFabInternal.MakeApiCall(
		"/Client/WriteCharacterEvent",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- This API is designed to write a multitude of different event types into PlayStream. 
--- It supports a flexible JSON schema, which allowsfor arbitrary key-value pairs 
--- to describe any player-based event. The created event will be locked to the 
--- authenticated title and player.  
---
--- https://docs.microsoft.com/rest/api/playfab/client/analytics/writeplayerevent
function Apis.WritePlayerEventAsync(
	sessionTicket: string, 
	request: Types.WriteClientPlayerEventRequest
): Types.WriteEventResponse
	return PlayFabInternal.MakeApiCall(
		"/Client/WritePlayerEvent",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- This API is designed to write a multitude of different client-defined events 
--- into PlayStream. It supports a flexible JSON schema, which allowsfor arbitrary 
--- key-value pairs to describe any title-based event. The created event will be 
--- locked to the authenticated title.  
---
--- https://docs.microsoft.com/rest/api/playfab/client/analytics/writetitleevent
function Apis.WriteTitleEventAsync(
	sessionTicket: string, 
	request: Types.WriteTitleEventRequest
): Types.WriteEventResponse
	return PlayFabInternal.MakeApiCall(
		"/Client/WriteTitleEvent",
		request,
		"X-Authorization",
		sessionTicket
	)
end

return Apis

