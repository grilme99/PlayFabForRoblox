--[[
	This file was generated on 2025-08-03 at 00:04 UTC. Do not edit directly.

]]

local Types = require(script.Parent.Types)

local Common = require(script.Parent.Parent.PlayFabCommon)
local makeApiCall = Common.makeApiCall
type Result<T, E> = Common.Result<T, E>

local Apis = {}

--[[
	Retrieves the key-value store of custom publisher settings

	This API is designed to return publisher-specific values which can be read,
	but not written to, by the client. This data is shared across all titles
	assigned to a particular publisher, and can be used for cross-game
	coordination. Only titles assigned to a publisher can use this API. For more
	information email helloplayfab@microsoft.com. Note that there may up to a
	minute delay in between updating title data and this API call returning the
	newest value.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/title-wide-data-management/getpublisherdata).

	### Errors
	- PublisherNotSet

]]
function Apis.GetPublisherData(request: Types.GetPublisherDataRequest): Result<Types.GetPublisherDataResult, string>
	return makeApiCall(
		"/Server/GetPublisherData",
		request,
		"X-SecretKey"
	)
end

--[[
	Updates the title-specific custom data for the user's character which can
	only be read by the client

	This function performs an additive update of the arbitrary JSON object
	containing the custom data for the user. In updating the custom data object,
	keys which already exist in the object will have their values overwritten,
	while keys with null values will be removed. No other key-value pairs will
	be changed apart from those specified in the call.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/character-data/updatecharacterreadonlydata).

	### Errors
	- CharacterNotFound
	- UserisNotValid

]]
function Apis.UpdateCharacterReadOnlyData(request: Types.UpdateCharacterDataRequest): Result<Types.UpdateCharacterDataResult, string>
	return makeApiCall(
		"/Server/UpdateCharacterReadOnlyData",
		request,
		"X-SecretKey"
	)
end

--[[
	Sends an iOS/Android Push Notification template to a specific user, if that
	user's device has been configured for Push Notifications in PlayFab. If a
	user has linked both Android and iOS devices, both will be notified.

	Represents the request for sending a push notification template to a
	recipient.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/account-management/sendpushnotificationfromtemplate).

	### Errors
	- PushNotEnabledForAccount
	- PushNotificationTemplateNotFound
	- PushServiceError

]]
function Apis.SendPushNotificationFromTemplate(request: Types.SendPushNotificationFromTemplateRequest): Result<Types.SendPushNotificationResult, string>
	return makeApiCall(
		"/Server/SendPushNotificationFromTemplate",
		request,
		"X-SecretKey"
	)
end

--[[
	Securely login a game client from an external server backend using a custom
	identifier for that player. Server Custom ID and Client Custom ID are
	mutually exclusive and cannot be used to retrieve the same player account.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/authentication/loginwithservercustomid).

	### Errors
	- EvaluationModePlayerCountExceeded

]]
function Apis.LoginWithServerCustomId(request: Types.LoginWithServerCustomIdRequest): Result<Types.ServerLoginResult, string>
	return makeApiCall(
		"/Server/LoginWithServerCustomId",
		request,
		"X-SecretKey"
	)
end

--[[
	Saves push notification template for title

	Represents the save push notification template request.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/account-management/savepushnotificationtemplate).

	### Errors
	- InvalidLocalizedPushNotificationLanguage
	- MissingLocalizedPushNotificationMessage
	- PushNotificationTemplateAndroidPayloadMissingNotificationBody
	- PushNotificationTemplateContainsInvalidAndroidPayload
	- PushNotificationTemplateContainsInvalidIosPayload
	- PushNotificationTemplateInvalidPayload
	- PushNotificationTemplateInvalidSyntax
	- PushNotificationTemplateIosPayloadMissingNotificationBody
	- PushNotificationTemplateMissingDefaultVersion
	- PushNotificationTemplateMissingName
	- PushNotificationTemplateMissingPlatformPayload
	- PushNotificationTemplateNoCustomPayloadForV1
	- PushNotificationTemplatePayloadContainsInvalidJson
	- TitleDefaultLanguageNotSet

]]
function Apis.SavePushNotificationTemplate(request: Types.SavePushNotificationTemplateRequest): Result<Types.SavePushNotificationTemplateResult, string>
	return makeApiCall(
		"/Server/SavePushNotificationTemplate",
		request,
		"X-SecretKey"
	)
end

--[[
	Unlinks the related NintendoSwitchDeviceId from the user's PlayFab account

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/account-management/unlinknintendoswitchdeviceid).

	### Errors
	- AccountNotLinked
	- NintendoSwitchDeviceIdNotLinked

]]
function Apis.UnlinkNintendoSwitchDeviceId(request: Types.UnlinkNintendoSwitchDeviceIdRequest): Result<Types.UnlinkNintendoSwitchDeviceIdResult, string>
	return makeApiCall(
		"/Server/UnlinkNintendoSwitchDeviceId",
		request,
		"X-SecretKey"
	)
end

--[[
	Updates the title-specific custom data for the user which cannot be accessed
	by the client

	This function performs an additive update of the arbitrary JSON object
	containing the custom data for the user. In updating the custom data object,
	keys which already exist in the object will have their values overwritten,
	keys with null values will be removed. No other key-value pairs will be
	changed apart from those specified in the call.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/player-data-management/updateuserinternaldata).

]]
function Apis.UpdateUserInternalData(request: Types.UpdateUserInternalDataRequest): Result<Types.UpdateUserDataResult, string>
	return makeApiCall(
		"/Server/UpdateUserInternalData",
		request,
		"X-SecretKey"
	)
end

--[[
	Retrieves the key-value store of custom title settings

	This API is designed to return title specific values which can be read, but
	not written to, by the client. For example, a developer could choose to
	store values which modify the user experience, such as enemy spawn rates,
	weapon strengths, movement speeds, etc. This allows a developer to update
	the title without the need to create, test, and ship a new build. If an
	override label is specified in the request, the overrides are applied
	automatically and returned with the title data. Note that there may up to a
	minute delay in between updating title data and this API call returning the
	newest value.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/title-wide-data-management/gettitledata).

]]
function Apis.GetTitleData(request: Types.GetTitleDataRequest): Result<Types.GetTitleDataResult, string>
	return makeApiCall(
		"/Server/GetTitleData",
		request,
		"X-SecretKey"
	)
end

--[[
	Lists all of the characters that belong to a specific user. CharacterIds are
	not globally unique; characterId must be evaluated with the parent PlayFabId
	to guarantee uniqueness.

	Returns a list of every character that currently belongs to a user.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/characters/getalluserscharacters).

]]
function Apis.GetAllUsersCharacters(request: Types.ListUsersCharactersRequest): Result<Types.ListUsersCharactersResult, string>
	return makeApiCall(
		"/Server/GetAllUsersCharacters",
		request,
		"X-SecretKey"
	)
end

--[[
	_NOTE: This is a Legacy Economy API, and is in bugfix-only mode. All new
	Economy features are being developed only for version 2._ Consume uses of a
	consumable item. When all uses are consumed, it will be removed from the
	player's inventory.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/player-item-management/consumeitem).

	### Errors
	- CharacterNotFound
	- InvalidItemProperties
	- ItemNotFound
	- NoRemainingUses

]]
function Apis.ConsumeItem(request: Types.ConsumeItemRequest): Result<Types.ConsumeItemResult, string>
	return makeApiCall(
		"/Server/ConsumeItem",
		request,
		"X-SecretKey"
	)
end

--[[
	Removes the specified generic service identifier from the player's PlayFab
	account.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/account-management/removegenericid).

	### Errors
	- AccountNotLinked
	- IdentifierNotLinked

]]
function Apis.RemoveGenericID(request: Types.RemoveGenericIDRequest): Result<Types.EmptyResult, string>
	return makeApiCall(
		"/Server/RemoveGenericID",
		request,
		"X-SecretKey"
	)
end

--[[
	_NOTE: This is a Legacy Economy API, and is in bugfix-only mode. All new
	Economy features are being developed only for version 2._ Increments the
	character's balance of the specified virtual currency by the stated amount

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/player-item-management/addcharactervirtualcurrency).

	### Errors
	- InvalidVirtualCurrency

]]
function Apis.AddCharacterVirtualCurrency(request: Types.AddCharacterVirtualCurrencyRequest): Result<Types.ModifyCharacterVirtualCurrencyResult, string>
	return makeApiCall(
		"/Server/AddCharacterVirtualCurrency",
		request,
		"X-SecretKey"
	)
end

--[[
	_NOTE: This is a Legacy Economy API, and is in bugfix-only mode. All new
	Economy features are being developed only for version 2._ Retrieves the
	configuration information for the specified random results tables for the
	title, including all ItemId values and weights

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/player-item-management/getrandomresulttables).

	### Errors
	- CatalogNotConfigured
	- InvalidDropTable

]]
function Apis.GetRandomResultTables(request: Types.GetRandomResultTablesRequest): Result<Types.GetRandomResultTablesResult, string>
	return makeApiCall(
		"/Server/GetRandomResultTables",
		request,
		"X-SecretKey"
	)
end

--[[
	Retrieves the information on the available versions of the specified
	statistic.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/player-data-management/getplayerstatisticversions).

	### Errors
	- StatisticNotFound

]]
function Apis.GetPlayerStatisticVersions(request: Types.GetPlayerStatisticVersionsRequest): Result<Types.GetPlayerStatisticVersionsResult, string>
	return makeApiCall(
		"/Server/GetPlayerStatisticVersions",
		request,
		"X-SecretKey"
	)
end

--[[
	Retrieves the unique PlayFab identifiers for the given set of Nintendo
	Service Account identifiers.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/account-management/getplayfabidsfromnintendoserviceaccountids).

]]
function Apis.GetPlayFabIDsFromNintendoServiceAccountIds(request: Types.GetPlayFabIDsFromNintendoServiceAccountIdsRequest): Result<Types.GetPlayFabIDsFromNintendoServiceAccountIdsResult, string>
	return makeApiCall(
		"/Server/GetPlayFabIDsFromNintendoServiceAccountIds",
		request,
		"X-SecretKey"
	)
end

--[[
	Updates the publisher-specific custom data for the user which can only be
	read by the client

	This function performs an additive update of the arbitrary JSON object
	containing the custom data for the user. In updating the custom data object,
	keys which already exist in the object will have their values overwritten,
	while keys with null values will be removed. No other key-value pairs will
	be changed apart from those specified in the call.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/player-data-management/updateuserpublisherreadonlydata).

	### Errors
	- PublisherNotSet

]]
function Apis.UpdateUserPublisherReadOnlyData(request: Types.UpdateUserDataRequest): Result<Types.UpdateUserDataResult, string>
	return makeApiCall(
		"/Server/UpdateUserPublisherReadOnlyData",
		request,
		"X-SecretKey"
	)
end

--[[
	Updates the tag list for a specified user in the friend list of another user

	This operation is not additive. It will completely replace the tag list for
	the specified user. Please note that only users in the PlayFab friends list
	can be assigned tags. Attempting to set a tag on a friend only included in
	the friends list from a social site integration (such as Facebook or Steam)
	will return the AccountNotFound error.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/friend-list-management/setfriendtags).

]]
function Apis.SetFriendTags(request: Types.SetFriendTagsRequest): Result<Types.EmptyResponse, string>
	return makeApiCall(
		"/Server/SetFriendTags",
		request,
		"X-SecretKey"
	)
end

--[[
	Writes a title-based event into PlayStream.

	This API is designed to write a multitude of different event types into
	PlayStream. It supports a flexible JSON schema, which allowsfor arbitrary
	key-value pairs to describe any title-based event. The created event will be
	locked to the authenticated title.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/analytics/writetitleevent).

	### Errors
	- InvalidEventField
	- NoWritePermissionsForEvent

]]
function Apis.WriteTitleEvent(request: Types.WriteTitleEventRequest): Result<Types.WriteEventResponse, string>
	return makeApiCall(
		"/Server/WriteTitleEvent",
		request,
		"X-SecretKey"
	)
end

--[[
	Retrieves the details of all title-specific statistics for the specific
	character

	Character statistics are similar to user statistics in that they are numeric
	values which may only be updated by a server operation, in order to minimize
	the opportunity for unauthorized changes. In addition to being available for
	use by the title, the statistics are used for all leaderboard operations in
	PlayFab.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/characters/getcharacterstatistics).

	### Errors
	- CharacterNotFound

]]
function Apis.GetCharacterStatistics(request: Types.GetCharacterStatisticsRequest): Result<Types.GetCharacterStatisticsResult, string>
	return makeApiCall(
		"/Server/GetCharacterStatistics",
		request,
		"X-SecretKey"
	)
end

--[[
	_NOTE: This is a Legacy Economy API, and is in bugfix-only mode. All new
	Economy features are being developed only for version 2._ Retrieves the set
	of items defined for the specified store, including all prices defined, for
	the specified player

	A store contains an array of references to items defined in one or more
	catalog versions of the game, along with the prices for the item, in both
	real world and virtual currencies. These prices act as an override to any
	prices defined in the catalog. In this way, the base definitions of the
	items may be defined in the catalog, with all associated properties, while
	the pricing can be set for each store, as needed. This allows for subsets of
	goods to be defined for different purposes (in order to simplify showing
	some, but not all catalog items to users, based upon different
	characteristics), along with unique prices. Note that all prices defined in
	the catalog and store definitions for the item are considered valid, and
	that a compromised client can be made to send a request for an item based
	upon any of these definitions. If no price is specified in the store for an
	item, the price set in the catalog should be displayed to the user.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/title-wide-data-management/getstoreitems).

	### Errors
	- CatalogNotConfigured
	- StoreNotFound

]]
function Apis.GetStoreItems(request: Types.GetStoreItemsServerRequest): Result<Types.GetStoreItemsResult, string>
	return makeApiCall(
		"/Server/GetStoreItems",
		request,
		"X-SecretKey"
	)
end

--[[
	_NOTE: This is a Legacy Economy API, and is in bugfix-only mode. All new
	Economy features are being developed only for version 2._ Updates the
	key-value pair data tagged to the specified item, which is read-only from
	the client.

	This function performs an additive update of the arbitrary JSON object
	containing the custom data for the item instance which belongs to the
	specified user. In updating the custom data object, keys which already exist
	in the object will have their values overwritten, while keys with null
	values will be removed. No other key-value pairs will be changed apart from
	those specified in the call.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/player-item-management/updateuserinventoryitemcustomdata).

]]
function Apis.UpdateUserInventoryItemCustomData(request: Types.UpdateUserInventoryItemDataRequest): Result<Types.EmptyResponse, string>
	return makeApiCall(
		"/Server/UpdateUserInventoryItemCustomData",
		request,
		"X-SecretKey"
	)
end

--[[
	Retrieves the title-specific custom data for the user which is readable and
	writable by the client

	Data is stored as JSON key-value pairs. If the Keys parameter is provided,
	the data object returned will only contain the data specific to the
	indicated Keys. Otherwise, the full set of custom user data will be
	returned.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/character-data/getcharacterdata).

	### Errors
	- CharacterNotFound
	- UserisNotValid

]]
function Apis.GetCharacterData(request: Types.GetCharacterDataRequest): Result<Types.GetCharacterDataResult, string>
	return makeApiCall(
		"/Server/GetCharacterData",
		request,
		"X-SecretKey"
	)
end

--[[
	Updates the title-specific custom data for the user's character which cannot
	be accessed by the client

	This function performs an additive update of the arbitrary JSON object
	containing the custom data for the user. In updating the custom data object,
	keys which already exist in the object will have their values overwritten,
	while keys with null values will be removed. No other key-value pairs will
	be changed apart from those specified in the call.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/character-data/updatecharacterinternaldata).

	### Errors
	- CharacterNotFound
	- UserisNotValid

]]
function Apis.UpdateCharacterInternalData(request: Types.UpdateCharacterDataRequest): Result<Types.UpdateCharacterDataResult, string>
	return makeApiCall(
		"/Server/UpdateCharacterInternalData",
		request,
		"X-SecretKey"
	)
end

--[[
	_NOTE: This is a Legacy Economy API, and is in bugfix-only mode. All new
	Economy features are being developed only for version 2._ Modifies the
	number of remaining uses of a player's inventory item

	This function can both add and remove uses of an inventory item. If the
	number of uses drops below zero, the item will be removed from active
	inventory.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/player-item-management/modifyitemuses).

	### Errors
	- InvalidItemProperties
	- NoRemainingUses

]]
function Apis.ModifyItemUses(request: Types.ModifyItemUsesRequest): Result<Types.ModifyItemUsesResult, string>
	return makeApiCall(
		"/Server/ModifyItemUses",
		request,
		"X-SecretKey"
	)
end

--[[
	Updates the key-value store of custom publisher settings

	This API is designed to store publisher-specific values which can be read,
	but not written to, by the client. This data is shared across all titles
	assigned to a particular publisher, and can be used for cross-game
	coordination. Only titles assigned to a publisher can use this API. This
	operation is additive. If a Key does not exist in the current dataset, it
	will be added with the specified Value. If it already exists, the Value for
	that key will be overwritten with the new Value. For more information email
	helloplayfab@microsoft.com

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/title-wide-data-management/setpublisherdata).

	### Errors
	- PublisherNotSet

]]
function Apis.SetPublisherData(request: Types.SetPublisherDataRequest): Result<Types.SetPublisherDataResult, string>
	return makeApiCall(
		"/Server/SetPublisherData",
		request,
		"X-SecretKey"
	)
end

--[[
	Retrieves a list of ranked characters for the given statistic, centered on
	the requested user

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/characters/getleaderboardaroundcharacter).

]]
function Apis.GetLeaderboardAroundCharacter(request: Types.GetLeaderboardAroundCharacterRequest): Result<Types.GetLeaderboardAroundCharacterResult, string>
	return makeApiCall(
		"/Server/GetLeaderboardAroundCharacter",
		request,
		"X-SecretKey"
	)
end

--[[
	Updates the values of the specified title-specific statistics for the user

	This operation is additive. Statistics not currently defined will be added,
	while those already defined will be updated with the given values. All other
	user statistics will remain unchanged.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/player-data-management/updateplayerstatistics).

	### Errors
	- DuplicateStatisticName
	- StatisticCountLimitExceeded
	- StatisticNameConflict
	- StatisticNotFound
	- StatisticValueAggregationOverflow
	- StatisticVersionClosedForWrites
	- StatisticVersionInvalid

]]
function Apis.UpdatePlayerStatistics(request: Types.UpdatePlayerStatisticsRequest): Result<Types.UpdatePlayerStatisticsResult, string>
	return makeApiCall(
		"/Server/UpdatePlayerStatistics",
		request,
		"X-SecretKey"
	)
end

--[[
	Bans users by PlayFab ID with optional IP address, or MAC address for the
	provided game.

	The existence of each user will not be verified. When banning by IP or MAC
	address, multiple players may be affected, so use this feature with caution.
	Returns information about the new bans.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/account-management/banusers).

	### Errors
	- UserisNotValid

]]
function Apis.BanUsers(request: Types.BanUsersRequest): Result<Types.BanUsersResult, string>
	return makeApiCall(
		"/Server/BanUsers",
		request,
		"X-SecretKey"
	)
end

--[[
	Updates the title-specific custom property values for a player

	Performs an additive update of the custom properties for the specified
	player. In updating the player's custom properties, properties which already
	exist will have their values overwritten. No other properties will be
	changed apart from those specified in the call.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/player-data-management/updateplayercustomproperties).

	### Errors
	- PlayerCustomPropertiesDuplicatePropertyName
	- PlayerCustomPropertiesPropertyCountTooHigh
	- PlayerCustomPropertiesPropertyNameIsInvalid
	- PlayerCustomPropertiesPropertyNameTooLong
	- PlayerCustomPropertiesStringPropertyValueTooLong
	- PlayerCustomPropertiesValueIsInvalidType
	- PlayerCustomPropertiesVersionMismatch

]]
function Apis.UpdatePlayerCustomProperties(request: Types.UpdatePlayerCustomPropertiesRequest): Result<Types.UpdatePlayerCustomPropertiesResult, string>
	return makeApiCall(
		"/Server/UpdatePlayerCustomProperties",
		request,
		"X-SecretKey"
	)
end

--[[
	Retrieves the title-specific custom data for the user's character which
	cannot be accessed by the client

	Data is stored as JSON key-value pairs. If the Keys parameter is provided,
	the data object returned will only contain the data specific to the
	indicated Keys. Otherwise, the full set of custom user data will be
	returned.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/character-data/getcharacterinternaldata).

	### Errors
	- CharacterNotFound
	- UserisNotValid

]]
function Apis.GetCharacterInternalData(request: Types.GetCharacterDataRequest): Result<Types.GetCharacterDataResult, string>
	return makeApiCall(
		"/Server/GetCharacterInternalData",
		request,
		"X-SecretKey"
	)
end

--[[
	Removes a user's player account from a title and deletes all associated data

	Deletes all data associated with the player, including statistics, custom
	data, inventory, purchases, virtual currency balances, characters and shared
	group memberships. Removes the player from all leaderboards and player
	search indexes. Does not delete PlayStream event history associated with the
	player. Does not delete the publisher user account that created the player
	in the title nor associated data such as username, password, email address,
	account linkages, or friends list. Note, this API queues the player for
	deletion and returns immediately. It may take several minutes or more before
	all player data is fully deleted. Until the player data is fully deleted,
	attempts to recreate the player with the same user account in the same title
	will fail with the 'AccountDeleted' error. This API must be enabled for use
	as an option in the game manager website. It is disabled by default.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/account-management/deleteplayer).

	### Errors
	- APINotEnabledForGameServerAccess

]]
function Apis.DeletePlayer(request: Types.DeletePlayerRequest): Result<Types.DeletePlayerResult, string>
	return makeApiCall(
		"/Server/DeletePlayer",
		request,
		"X-SecretKey"
	)
end

--[[
	Retrieves an array of player segment definitions. Results from this can be
	used in subsequent API calls such as GetPlayersInSegment which requires a
	Segment ID. While segment names can change the ID for that segment will not
	change.

	Request has no paramaters.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/playstream/getallsegments).

]]
function Apis.GetAllSegments(request: Types.GetAllSegmentsRequest): Result<Types.GetAllSegmentsResult, string>
	return makeApiCall(
		"/Server/GetAllSegments",
		request,
		"X-SecretKey"
	)
end

--[[
	Updates the key-value store of custom title settings

	This API is designed to store title specific values which can be read, but
	not written to, by the client. For example, a developer could choose to
	store values which modify the user experience, such as enemy spawn rates,
	weapon strengths, movement speeds, etc. This allows a developer to update
	the title without the need to create, test, and ship a new build. This
	operation is additive. If a Key does not exist in the current dataset, it
	will be added with the specified Value. If it already exists, the Value for
	that key will be overwritten with the new Value.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/title-wide-data-management/settitleinternaldata).

	### Errors
	- DataLengthExceeded
	- TooManyKeys

]]
function Apis.SetTitleInternalData(request: Types.SetTitleDataRequest): Result<Types.SetTitleDataResult, string>
	return makeApiCall(
		"/Server/SetTitleInternalData",
		request,
		"X-SecretKey"
	)
end

--[[
	Removes users from the set of those able to update the shared data and the
	set of users in the group. Only users in the group can remove members. If as
	a result of the call, zero users remain with access, the group and its
	associated data will be deleted. Shared Groups are designed for sharing data
	between a very small number of players, please see our guide:
	https://docs.microsoft.com/gaming/playfab/features/social/groups/using-shared-group-data

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/shared-group-data/removesharedgroupmembers).

	### Errors
	- InvalidSharedGroupId

]]
function Apis.RemoveSharedGroupMembers(request: Types.RemoveSharedGroupMembersRequest): Result<Types.RemoveSharedGroupMembersResult, string>
	return makeApiCall(
		"/Server/RemoveSharedGroupMembers",
		request,
		"X-SecretKey"
	)
end

--[[
	Retrieves a list of ranked friends of the given player for the given
	statistic, starting from the indicated point in the leaderboard

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/player-data-management/getfriendleaderboard).

	### Errors
	- ExpiredXboxLiveToken
	- FacebookAPIError
	- InvalidXboxLiveToken
	- LeaderboardVersionNotAvailable
	- XboxInaccessible
	- XboxServiceTooManyRequests
	- XboxXASSExchangeFailure

]]
function Apis.GetFriendLeaderboard(request: Types.GetFriendLeaderboardRequest): Result<Types.GetLeaderboardResult, string>
	return makeApiCall(
		"/Server/GetFriendLeaderboard",
		request,
		"X-SecretKey"
	)
end

--[[
	Returns whatever info is requested in the response for the user. Note that
	PII (like email address, facebook id) may be returned. All parameters
	default to false.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/player-data-management/getplayercombinedinfo).

]]
function Apis.GetPlayerCombinedInfo(request: Types.GetPlayerCombinedInfoRequest): Result<Types.GetPlayerCombinedInfoResult, string>
	return makeApiCall(
		"/Server/GetPlayerCombinedInfo",
		request,
		"X-SecretKey"
	)
end

--[[
	Updates the publisher-specific custom data for the user which is readable
	and writable by the client

	This function performs an additive update of the arbitrary JSON object
	containing the custom data for the user. In updating the custom data object,
	keys which already exist in the object will have their values overwritten,
	while keys with null values will be removed. No other key-value pairs will
	be changed apart from those specified in the call.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/player-data-management/updateuserpublisherdata).

	### Errors
	- PublisherNotSet

]]
function Apis.UpdateUserPublisherData(request: Types.UpdateUserDataRequest): Result<Types.UpdateUserDataResult, string>
	return makeApiCall(
		"/Server/UpdateUserPublisherData",
		request,
		"X-SecretKey"
	)
end

--[[
	Retrieves a list of ranked users for the given statistic, centered on the
	currently signed-in user

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/player-data-management/getleaderboardarounduser).

	### Errors
	- LeaderboardVersionNotAvailable

]]
function Apis.GetLeaderboardAroundUser(request: Types.GetLeaderboardAroundUserRequest): Result<Types.GetLeaderboardAroundUserResult, string>
	return makeApiCall(
		"/Server/GetLeaderboardAroundUser",
		request,
		"X-SecretKey"
	)
end

--[[
	Adds the specified generic service identifier to the player's PlayFab
	account. This is designed to allow for a PlayFab ID lookup of any arbitrary
	service identifier a title wants to add. This identifier should never be
	used as authentication credentials, as the intent is that it is easily
	accessible by other players.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/account-management/addgenericid).

	### Errors
	- IdentifierAlreadyClaimed
	- UserisNotValid

]]
function Apis.AddGenericID(request: Types.AddGenericIDRequest): Result<Types.EmptyResult, string>
	return makeApiCall(
		"/Server/AddGenericID",
		request,
		"X-SecretKey"
	)
end

--[[
	Links the Xbox Live account associated with the provided access code to the
	user's PlayFab account

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/account-management/linkxboxaccount).

	### Errors
	- AccountAlreadyLinked
	- InvalidXboxLiveToken
	- LinkedAccountAlreadyClaimed

]]
function Apis.LinkXboxAccount(request: Types.LinkXboxAccountRequest): Result<Types.LinkXboxAccountResult, string>
	return makeApiCall(
		"/Server/LinkXboxAccount",
		request,
		"X-SecretKey"
	)
end

--[[
	Deletes a shared group, freeing up the shared group ID to be reused for a
	new group. Shared Groups are designed for sharing data between a very small
	number of players, please see our guide:
	https://docs.microsoft.com/gaming/playfab/features/social/groups/using-shared-group-data

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/shared-group-data/deletesharedgroup).

	### Errors
	- InvalidSharedGroupId

]]
function Apis.DeleteSharedGroup(request: Types.DeleteSharedGroupRequest): Result<Types.EmptyResponse, string>
	return makeApiCall(
		"/Server/DeleteSharedGroup",
		request,
		"X-SecretKey"
	)
end

--[[
	Links the PlayStation :tm: Network account associated with the provided user
	id to the user's PlayFab account

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/account-management/linkpsnid).

	### Errors
	- AccountAlreadyLinked
	- AccountNotFound
	- InvalidNamespaceMismatch
	- InvalidPSNAuthCode
	- InvalidPSNIssuerId
	- LinkedAccountAlreadyClaimed
	- PSNInaccessible

]]
function Apis.LinkPSNId(request: Types.LinkPSNIdRequest): Result<Types.LinkPSNIdResponse, string>
	return makeApiCall(
		"/Server/LinkPSNId",
		request,
		"X-SecretKey"
	)
end

--[[
	Deletes the specific character ID from the specified user.

	This function will delete the specified character from the list allowed by
	the user, and will also delete any inventory or VC currently held by that
	character. It will NOT delete any statistics associated for this character,
	in order to preserve leaderboard integrity.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/characters/deletecharacterfromuser).

	### Errors
	- CharacterNotFound

]]
function Apis.DeleteCharacterFromUser(request: Types.DeleteCharacterFromUserRequest): Result<Types.DeleteCharacterFromUserResult, string>
	return makeApiCall(
		"/Server/DeleteCharacterFromUser",
		request,
		"X-SecretKey"
	)
end

--[[
	Signs the user in using a custom unique identifier generated by the title,
	returning a session identifier that can subsequently be used for API calls
	which require an authenticated user

	It is highly recommended that developers ensure that it is extremely
	unlikely that a customer could generate an ID which is already in use by
	another customer. If this is the first time a user has signed in with the
	Custom ID and CreateAccount is set to true, a new PlayFab account will be
	created and linked to the Custom ID. In this case, no email or username will
	be associated with the PlayFab account. Otherwise, if no PlayFab account is
	linked to the Custom ID, an error indicating this will be returned, so that
	the title can guide the user through creation of a PlayFab account.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/authentication/loginwithcustomid).

	### Errors
	- EvaluationModePlayerCountExceeded
	- RequestViewConstraintParamsNotAllowed

]]
function Apis.LoginWithCustomID(request: Types.LoginWithCustomIDRequest): Result<Types.ServerLoginResult, string>
	return makeApiCall(
		"/Server/LoginWithCustomID",
		request,
		"X-SecretKey"
	)
end

--[[
	Retrieves the title-specific custom data for the user which cannot be
	accessed by the client

	Data is stored as JSON key-value pairs. If the Keys parameter is provided,
	the data object returned will only contain the data specific to the
	indicated Keys. Otherwise, the full set of custom user data will be
	returned.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/player-data-management/getuserinternaldata).

]]
function Apis.GetUserInternalData(request: Types.GetUserDataRequest): Result<Types.GetUserDataResult, string>
	return makeApiCall(
		"/Server/GetUserInternalData",
		request,
		"X-SecretKey"
	)
end

--[[
	_NOTE: This is a Legacy Economy API, and is in bugfix-only mode. All new
	Economy features are being developed only for version 2._ Searches Player or
	Character inventory for any ItemInstance matching the given CatalogItemId,
	if necessary unlocks it using any appropriate key, and returns the contents
	of the opened container. If the container (and key when relevant) are
	consumable (RemainingUses > 0), their RemainingUses will be decremented,
	consistent with the operation of ConsumeItem.

	Specify the type of container to open and optionally the catalogVersion for
	the container to open

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/player-item-management/unlockcontaineritem).

	### Errors
	- CharacterNotFound
	- ContainerKeyInvalid
	- ContainerNotOwned
	- InvalidContainerItem
	- InvalidItemIdInTable
	- InvalidItemProperties
	- KeyNotOwned

]]
function Apis.UnlockContainerItem(request: Types.UnlockContainerItemRequest): Result<Types.UnlockContainerItemResult, string>
	return makeApiCall(
		"/Server/UnlockContainerItem",
		request,
		"X-SecretKey"
	)
end

--[[
	Retrieves the title-specific custom data for the user which can only be read
	by the client

	Data is stored as JSON key-value pairs. If the Keys parameter is provided,
	the data object returned will only contain the data specific to the
	indicated Keys. Otherwise, the full set of custom user data will be
	returned.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/player-data-management/getuserreadonlydata).

]]
function Apis.GetUserReadOnlyData(request: Types.GetUserDataRequest): Result<Types.GetUserDataResult, string>
	return makeApiCall(
		"/Server/GetUserReadOnlyData",
		request,
		"X-SecretKey"
	)
end

--[[
	Retrieves the unique PlayFab identifiers for the given set of XboxLive
	identifiers.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/account-management/getplayfabidsfromxboxliveids).

]]
function Apis.GetPlayFabIDsFromXboxLiveIDs(request: Types.GetPlayFabIDsFromXboxLiveIDsRequest): Result<Types.GetPlayFabIDsFromXboxLiveIDsResult, string>
	return makeApiCall(
		"/Server/GetPlayFabIDsFromXboxLiveIDs",
		request,
		"X-SecretKey"
	)
end

--[[
	Get all tags with a given Namespace (optional) from a player profile.

	This API will return a list of canonical tags which includes both namespace
	and tag's name. If namespace is not provided, the result is a list of all
	canonical tags. TagName can be used for segmentation and Namespace is
	limited to 128 characters.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/playstream/getplayertags).

]]
function Apis.GetPlayerTags(request: Types.GetPlayerTagsRequest): Result<Types.GetPlayerTagsResult, string>
	return makeApiCall(
		"/Server/GetPlayerTags",
		request,
		"X-SecretKey"
	)
end

--[[
	Adds the Friend user to the friendlist of the user with PlayFabId. At least
	one of FriendPlayFabId,FriendUsername,FriendEmail, or FriendTitleDisplayName
	should be initialized.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/friend-list-management/addfriend).

	### Errors
	- UsersAlreadyFriends

]]
function Apis.AddFriend(request: Types.AddFriendRequest): Result<Types.EmptyResponse, string>
	return makeApiCall(
		"/Server/AddFriend",
		request,
		"X-SecretKey"
	)
end

--[[
	Grants the specified character type to the user. CharacterIds are not
	globally unique; characterId must be evaluated with the parent PlayFabId to
	guarantee uniqueness.

	Grants a character to the user of the type and name specified in the
	request.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/characters/grantcharactertouser).

]]
function Apis.GrantCharacterToUser(request: Types.GrantCharacterToUserRequest): Result<Types.GrantCharacterToUserResult, string>
	return makeApiCall(
		"/Server/GrantCharacterToUser",
		request,
		"X-SecretKey"
	)
end

--[[
	Retrieves a list of ranked characters for the given statistic, starting from
	the indicated point in the leaderboard

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/characters/getcharacterleaderboard).

]]
function Apis.GetCharacterLeaderboard(request: Types.GetCharacterLeaderboardRequest): Result<Types.GetCharacterLeaderboardResult, string>
	return makeApiCall(
		"/Server/GetCharacterLeaderboard",
		request,
		"X-SecretKey"
	)
end

--[[
	_NOTE: This is a Legacy Economy API, and is in bugfix-only mode. All new
	Economy features are being developed only for version 2._ Returns the result
	of an evaluation of a Random Result Table - the ItemId from the game Catalog
	which would have been added to the player inventory, if the Random Result
	Table were added via a Bundle or a call to UnlockContainer.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/player-item-management/evaluaterandomresulttable).

	### Errors
	- CatalogNotConfigured
	- InvalidDropTable

]]
function Apis.EvaluateRandomResultTable(request: Types.EvaluateRandomResultTableRequest): Result<Types.EvaluateRandomResultTableResult, string>
	return makeApiCall(
		"/Server/EvaluateRandomResultTable",
		request,
		"X-SecretKey"
	)
end

--[[
	Remove a given tag from a player profile. The tag's namespace is
	automatically generated based on the source of the tag.

	This API will trigger a player_tag_removed event and remove a tag with the
	given TagName and PlayFabID from the corresponding player profile. TagName
	can be used for segmentation and it is limited to 256 characters

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/playstream/removeplayertag).

]]
function Apis.RemovePlayerTag(request: Types.RemovePlayerTagRequest): Result<Types.RemovePlayerTagResult, string>
	return makeApiCall(
		"/Server/RemovePlayerTag",
		request,
		"X-SecretKey"
	)
end

--[[
	Writes a character-based event into PlayStream.

	This API is designed to write a multitude of different event types into
	PlayStream. It supports a flexible JSON schema, which allowsfor arbitrary
	key-value pairs to describe any character-based event. The created event
	will be locked to the authenticated title.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/analytics/writecharacterevent).

	### Errors
	- CharacterNotFound
	- NoWritePermissionsForEvent

]]
function Apis.WriteCharacterEvent(request: Types.WriteServerCharacterEventRequest): Result<Types.WriteEventResponse, string>
	return makeApiCall(
		"/Server/WriteCharacterEvent",
		request,
		"X-SecretKey"
	)
end

--[[
	Links the Nintendo account associated with the Nintendo Service Account
	subject or id to the user's PlayFab account

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/account-management/linknintendoserviceaccountsubject).

	### Errors
	- InvalidIdentityProviderId
	- LinkedIdentifierAlreadyClaimed
	- NintendoSwitchNotEnabledForTitle

]]
function Apis.LinkNintendoServiceAccountSubject(request: Types.LinkNintendoServiceAccountSubjectRequest): Result<Types.EmptyResult, string>
	return makeApiCall(
		"/Server/LinkNintendoServiceAccountSubject",
		request,
		"X-SecretKey"
	)
end

--[[
	Retrieves the current friends for the user with PlayFabId, constrained to
	users who have PlayFab accounts. Friends from linked accounts (Facebook,
	Steam) are also included. You may optionally exclude some linked services'
	friends.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/friend-list-management/getfriendslist).

	### Errors
	- AccountNotFound
	- ExpiredXboxLiveToken
	- FacebookAPIError
	- InvalidSignature
	- InvalidSignatureTime
	- InvalidXboxLiveToken
	- PlayerSecretNotConfigured
	- XboxInaccessible
	- XboxServiceTooManyRequests
	- XboxXASSExchangeFailure

]]
function Apis.GetFriendsList(request: Types.GetFriendsListRequest): Result<Types.GetFriendsListResult, string>
	return makeApiCall(
		"/Server/GetFriendsList",
		request,
		"X-SecretKey"
	)
end

--[[
	_NOTE: This is a Legacy Economy API, and is in bugfix-only mode. All new
	Economy features are being developed only for version 2._ Revokes access for
	up to 25 items across multiple users and characters.

	In cases where the inventory item in question is a "crate", and the items it
	contained have already been dispensed, this will not revoke access or
	otherwise remove the items which were dispensed.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/player-item-management/revokeinventoryitems).

	### Errors
	- ItemNotFound

]]
function Apis.RevokeInventoryItems(request: Types.RevokeInventoryItemsRequest): Result<Types.RevokeInventoryItemsResult, string>
	return makeApiCall(
		"/Server/RevokeInventoryItems",
		request,
		"X-SecretKey"
	)
end

--[[
	Updates the title-specific custom data for the user which can only be read
	by the client

	This function performs an additive update of the arbitrary JSON object
	containing the custom data for the user. In updating the custom data object,
	keys which already exist in the object will have their values overwritten,
	while keys with null values will be removed. No other key-value pairs will
	be changed apart from those specified in the call.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/player-data-management/updateuserreadonlydata).

]]
function Apis.UpdateUserReadOnlyData(request: Types.UpdateUserDataRequest): Result<Types.UpdateUserDataResult, string>
	return makeApiCall(
		"/Server/UpdateUserReadOnlyData",
		request,
		"X-SecretKey"
	)
end

--[[
	Deletes title-specific custom properties for a player

	Deletes custom properties for the specified player. The list of provided
	property names must be non-empty.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/player-data-management/deleteplayercustomproperties).

	### Errors
	- PlayerCustomPropertiesVersionMismatch

]]
function Apis.DeletePlayerCustomProperties(request: Types.DeletePlayerCustomPropertiesRequest): Result<Types.DeletePlayerCustomPropertiesResult, string>
	return makeApiCall(
		"/Server/DeletePlayerCustomProperties",
		request,
		"X-SecretKey"
	)
end

--[[
	Removes the specified friend from the the user's friend list

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/friend-list-management/removefriend).

	### Errors
	- AccountNotFound

]]
function Apis.RemoveFriend(request: Types.RemoveFriendRequest): Result<Types.EmptyResponse, string>
	return makeApiCall(
		"/Server/RemoveFriend",
		request,
		"X-SecretKey"
	)
end

--[[
	Retrieves a title-specific custom property value for a player.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/player-data-management/getplayercustomproperty).

	### Errors
	- PlayerCustomPropertiesPropertyDoesNotExist

]]
function Apis.GetPlayerCustomProperty(request: Types.GetPlayerCustomPropertyRequest): Result<Types.GetPlayerCustomPropertyResult, string>
	return makeApiCall(
		"/Server/GetPlayerCustomProperty",
		request,
		"X-SecretKey"
	)
end

--[[
	Update the avatar URL of the specified player

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/account-management/updateavatarurl).

]]
function Apis.UpdateAvatarUrl(request: Types.UpdateAvatarUrlRequest): Result<Types.EmptyResponse, string>
	return makeApiCall(
		"/Server/UpdateAvatarUrl",
		request,
		"X-SecretKey"
	)
end

--[[
	Links the PlayStation :tm: Network account associated with the provided
	access code to the user's PlayFab account

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/account-management/linkpsnaccount).

	### Errors
	- AccountAlreadyLinked
	- AccountNotFound
	- InvalidNamespaceMismatch
	- InvalidPSNAuthCode
	- InvalidPSNIssuerId
	- LinkedAccountAlreadyClaimed
	- PSNInaccessible
	- RequestViewConstraintParamsNotAllowed

]]
function Apis.LinkPSNAccount(request: Types.LinkPSNAccountRequest): Result<Types.LinkPSNAccountResult, string>
	return makeApiCall(
		"/Server/LinkPSNAccount",
		request,
		"X-SecretKey"
	)
end

--[[
	Retrieves the title-specific custom data for the user's character which can
	only be read by the client

	Data is stored as JSON key-value pairs. If the Keys parameter is provided,
	the data object returned will only contain the data specific to the
	indicated Keys. Otherwise, the full set of custom user data will be
	returned.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/character-data/getcharacterreadonlydata).

	### Errors
	- CharacterNotFound
	- UserisNotValid

]]
function Apis.GetCharacterReadOnlyData(request: Types.GetCharacterDataRequest): Result<Types.GetCharacterDataResult, string>
	return makeApiCall(
		"/Server/GetCharacterReadOnlyData",
		request,
		"X-SecretKey"
	)
end

--[[
	Updates information of a list of existing bans specified with Ban Ids.

	For each ban, only updates the values that are set. Leave any value to null
	for no change. If a ban could not be found, the rest are still applied.
	Returns information about applied updates only.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/account-management/updatebans).

]]
function Apis.UpdateBans(request: Types.UpdateBansRequest): Result<Types.UpdateBansResult, string>
	return makeApiCall(
		"/Server/UpdateBans",
		request,
		"X-SecretKey"
	)
end

--[[
	Retrieves the relevant details for a specified user

	This API allows for access to details regarding a user in the PlayFab
	service, usually for purposes of customer support. Note that data returned
	may be Personally Identifying Information (PII), such as email address, and
	so care should be taken in how this data is stored and managed. Since this
	call will always return the relevant information for users who have accessed
	the title, the recommendation is to not store this data locally.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/account-management/getuseraccountinfo).

]]
function Apis.GetUserAccountInfo(request: Types.GetUserAccountInfoRequest): Result<Types.GetUserAccountInfoResult, string>
	return makeApiCall(
		"/Server/GetUserAccountInfo",
		request,
		"X-SecretKey"
	)
end

--[[
	Deletes push notification template for title

	Represents the request to delete a push notification template.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/account-management/deletepushnotificationtemplate).

	### Errors
	- PushNotificationTemplateNotFound

]]
function Apis.DeletePushNotificationTemplate(request: Types.DeletePushNotificationTemplateRequest): Result<Types.DeletePushNotificationTemplateResult, string>
	return makeApiCall(
		"/Server/DeletePushNotificationTemplate",
		request,
		"X-SecretKey"
	)
end

--[[
	Sets the player's secret if it is not already set. Player secrets are used
	to sign API requests. To reset a player's secret use the Admin or Server API
	method SetPlayerSecret.

	APIs that require signatures require that the player have a configured
	Player Secret Key that is used to sign all requests. Players that don't have
	a secret will be blocked from making API calls until it is configured. To
	create a signature header add a SHA256 hashed string containing UTF8 encoded
	JSON body as it will be sent to the server, the current time in UTC
	formatted to ISO 8601, and the players secret formatted as
	'body.date.secret'. Place the resulting hash into the header
	X-PlayFab-Signature, along with a header X-PlayFab-Timestamp of the same UTC
	timestamp used in the signature.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/authentication/setplayersecret).

	### Errors
	- PlayerSecretAlreadyConfigured

]]
function Apis.SetPlayerSecret(request: Types.SetPlayerSecretRequest): Result<Types.SetPlayerSecretResult, string>
	return makeApiCall(
		"/Server/SetPlayerSecret",
		request,
		"X-SecretKey"
	)
end

--[[
	Validated a client's session ticket, and if successful, returns details for
	that user

	Note that data returned may be Personally Identifying Information (PII),
	such as email address, and so care should be taken in how this data is
	stored and managed. Since this call will always return the relevant
	information for users who have accessed the title, the recommendation is to
	not store this data locally.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/authentication/authenticatesessionticket).

	### Errors
	- InvalidSessionTicket

]]
function Apis.AuthenticateSessionTicket(request: Types.AuthenticateSessionTicketRequest): Result<Types.AuthenticateSessionTicketResult, string>
	return makeApiCall(
		"/Server/AuthenticateSessionTicket",
		request,
		"X-SecretKey"
	)
end

--[[
	Retrieves the player's profile

	This API allows for access to details regarding a user in the PlayFab
	service, usually for purposes of customer support. Note that data returned
	may be Personally Identifying Information (PII), such as email address, and
	so care should be taken in how this data is stored and managed. Since this
	call will always return the relevant information for users who have accessed
	the title, the recommendation is to not store this data locally.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/account-management/getplayerprofile).

	### Errors
	- PlayerNotInGame

]]
function Apis.GetPlayerProfile(request: Types.GetPlayerProfileRequest): Result<Types.GetPlayerProfileResult, string>
	return makeApiCall(
		"/Server/GetPlayerProfile",
		request,
		"X-SecretKey"
	)
end

--[[
	Unlinks the related Battle.net account from the user's PlayFab account.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/account-management/unlinkbattlenetaccount).

	### Errors
	- AccountNotLinked
	- BattleNetNotEnabledForTitle

]]
function Apis.UnlinkBattleNetAccount(request: Types.UnlinkBattleNetAccountRequest): Result<Types.EmptyResponse, string>
	return makeApiCall(
		"/Server/UnlinkBattleNetAccount",
		request,
		"X-SecretKey"
	)
end

--[[
	Allows for paging through all players in a given segment. This API creates a
	snapshot of all player profiles that match the segment definition at the
	time of its creation and lives through the Total Seconds to Live, refreshing
	its life span on each subsequent use of the Continuation Token. Profiles
	that change during the course of paging will not be reflected in the
	results. AB Test segments are currently not supported by this operation.
	NOTE: This API is limited to being called 30 times in one minute. You will
	be returned an error if you exceed this threshold.

	Initial request must contain at least a Segment ID. Subsequent requests must
	contain the Segment ID as well as the Continuation Token. Failure to send
	the Continuation Token will result in a new player segment list being
	generated. Each time the Continuation Token is passed in the length of the
	Total Seconds to Live is refreshed. If too much time passes between requests
	to the point that a subsequent request is past the Total Seconds to Live an
	error will be returned and paging will be terminated. This API is resource
	intensive and should not be used in scenarios which might generate high
	request volumes. Only one request to this API at a time should be made per
	title. Concurrent requests to the API may be rejected with the
	APIConcurrentRequestLimitExceeded error.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/playstream/getplayersinsegment).

	### Errors
	- ExpiredContinuationToken
	- GetPlayersInSegmentRateLimitExceeded
	- InternalServerError
	- InvalidContinuationToken
	- InvalidSearchTerm
	- InvalidSegment
	- SegmentNotFound

]]
function Apis.GetPlayersInSegment(request: Types.GetPlayersInSegmentRequest): Result<Types.GetPlayersInSegmentResult, string>
	return makeApiCall(
		"/Server/GetPlayersInSegment",
		request,
		"X-SecretKey"
	)
end

--[[
	_NOTE: This is a Legacy Economy API, and is in bugfix-only mode. All new
	Economy features are being developed only for version 2._ Retrieves the
	specified version of the title's catalog of virtual goods, including all
	defined properties

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/title-wide-data-management/getcatalogitems).

]]
function Apis.GetCatalogItems(request: Types.GetCatalogItemsRequest): Result<Types.GetCatalogItemsResult, string>
	return makeApiCall(
		"/Server/GetCatalogItems",
		request,
		"X-SecretKey"
	)
end

--[[
	Retrieves a list of ranked users for the given statistic, starting from the
	indicated point in the leaderboard

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/player-data-management/getleaderboard).

	### Errors
	- LeaderboardVersionNotAvailable

]]
function Apis.GetLeaderboard(request: Types.GetLeaderboardRequest): Result<Types.GetLeaderboardResult, string>
	return makeApiCall(
		"/Server/GetLeaderboard",
		request,
		"X-SecretKey"
	)
end

--[[
	Retrieves the unique PlayFab identifiers for the given set of PlayStation
	:tm: Network identifiers.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/account-management/getplayfabidsfrompsnonlineids).

]]
function Apis.GetPlayFabIDsFromPSNOnlineIDs(request: Types.GetPlayFabIDsFromPSNOnlineIDsRequest): Result<Types.GetPlayFabIDsFromPSNOnlineIDsResult, string>
	return makeApiCall(
		"/Server/GetPlayFabIDsFromPSNOnlineIDs",
		request,
		"X-SecretKey"
	)
end

--[[
	Retrieves the current server time

	This query retrieves the current time from one of the servers in PlayFab.
	Please note that due to clock drift between servers, there is a potential
	variance of up to 5 seconds.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/title-wide-data-management/gettime).

	### Errors
	- PublisherNotSet

]]
function Apis.GetTime(request: Types.GetTimeRequest): Result<Types.GetTimeResult, string>
	return makeApiCall(
		"/Server/GetTime",
		request,
		"X-SecretKey"
	)
end

--[[
	Retrieves the unique PlayFab identifiers for the given set of PlayStation
	:tm: Network identifiers.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/account-management/getplayfabidsfrompsnaccountids).

]]
function Apis.GetPlayFabIDsFromPSNAccountIDs(request: Types.GetPlayFabIDsFromPSNAccountIDsRequest): Result<Types.GetPlayFabIDsFromPSNAccountIDsResult, string>
	return makeApiCall(
		"/Server/GetPlayFabIDsFromPSNAccountIDs",
		request,
		"X-SecretKey"
	)
end

--[[
	Retrieves the associated PlayFab account identifiers for the given set of
	server custom identifiers.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/account-management/getservercustomidsfromplayfabids).

]]
function Apis.GetServerCustomIDsFromPlayFabIDs(request: Types.GetServerCustomIDsFromPlayFabIDsRequest): Result<Types.GetServerCustomIDsFromPlayFabIDsResult, string>
	return makeApiCall(
		"/Server/GetServerCustomIDsFromPlayFabIDs",
		request,
		"X-SecretKey"
	)
end

--[[
	List all segments that a player currently belongs to at this moment in time.



	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/playstream/getplayersegments).

]]
function Apis.GetPlayerSegments(request: Types.GetPlayersSegmentsRequest): Result<Types.GetPlayerSegmentsResult, string>
	return makeApiCall(
		"/Server/GetPlayerSegments",
		request,
		"X-SecretKey"
	)
end

--[[
	_NOTE: This is a Legacy Economy API, and is in bugfix-only mode. All new
	Economy features are being developed only for version 2._ Adds the specified
	items to the specified user inventories

	This function directly adds inventory items to user inventories. As a result
	of this operations, the user will not be charged any transaction fee,
	regardless of the inventory item catalog definition. Please note that the
	processing time for inventory grants and purchases increases fractionally
	the more items are in the inventory, and the more items are in the
	grant/purchase operation.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/player-item-management/grantitemstousers).

	### Errors
	- AccountNotFound
	- CatalogNotConfigured

]]
function Apis.GrantItemsToUsers(request: Types.GrantItemsToUsersRequest): Result<Types.GrantItemsToUsersResult, string>
	return makeApiCall(
		"/Server/GrantItemsToUsers",
		request,
		"X-SecretKey"
	)
end

--[[
	Retrieves the publisher-specific custom data for the user which cannot be
	accessed by the client

	Data is stored as JSON key-value pairs. If the Keys parameter is provided,
	the data object returned will only contain the data specific to the
	indicated Keys. Otherwise, the full set of custom user data will be
	returned.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/player-data-management/getuserpublisherinternaldata).

	### Errors
	- PublisherNotSet

]]
function Apis.GetUserPublisherInternalData(request: Types.GetUserDataRequest): Result<Types.GetUserDataResult, string>
	return makeApiCall(
		"/Server/GetUserPublisherInternalData",
		request,
		"X-SecretKey"
	)
end

--[[
	Retrieves the title news feed, as configured in the developer portal

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/title-wide-data-management/gettitlenews).

]]
function Apis.GetTitleNews(request: Types.GetTitleNewsRequest): Result<Types.GetTitleNewsResult, string>
	return makeApiCall(
		"/Server/GetTitleNews",
		request,
		"X-SecretKey"
	)
end

--[[
	Retrieves the publisher-specific custom data for the user which can only be
	read by the client

	Data is stored as JSON key-value pairs. If the Keys parameter is provided,
	the data object returned will only contain the data specific to the
	indicated Keys. Otherwise, the full set of custom user data will be
	returned.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/player-data-management/getuserpublisherreadonlydata).

	### Errors
	- PublisherNotSet

]]
function Apis.GetUserPublisherReadOnlyData(request: Types.GetUserDataRequest): Result<Types.GetUserDataResult, string>
	return makeApiCall(
		"/Server/GetUserPublisherReadOnlyData",
		request,
		"X-SecretKey"
	)
end

--[[
	Unlinks the related Xbox Live account from the user's PlayFab account

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/account-management/unlinkxboxaccount).

	### Errors
	- AccountNotLinked
	- InvalidXboxLiveToken

]]
function Apis.UnlinkXboxAccount(request: Types.UnlinkXboxAccountRequest): Result<Types.UnlinkXboxAccountResult, string>
	return makeApiCall(
		"/Server/UnlinkXboxAccount",
		request,
		"X-SecretKey"
	)
end

--[[
	_NOTE: This is a Legacy Economy API, and is in bugfix-only mode. All new
	Economy features are being developed only for version 2._ Decrements the
	character's balance of the specified virtual currency by the stated amount.
	It is possible to make a VC balance negative with this API.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/player-item-management/subtractcharactervirtualcurrency).

	### Errors
	- InvalidVirtualCurrency

]]
function Apis.SubtractCharacterVirtualCurrency(request: Types.SubtractCharacterVirtualCurrencyRequest): Result<Types.ModifyCharacterVirtualCurrencyResult, string>
	return makeApiCall(
		"/Server/SubtractCharacterVirtualCurrency",
		request,
		"X-SecretKey"
	)
end

--[[
	Sends an iOS/Android Push Notification to a specific user, if that user's
	device has been configured for Push Notifications in PlayFab. If a user has
	linked both Android and iOS devices, both will be notified.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/account-management/sendpushnotification).

	### Errors
	- PushNotEnabledForAccount
	- PushServiceError

]]
function Apis.SendPushNotification(request: Types.SendPushNotificationRequest): Result<Types.SendPushNotificationResult, string>
	return makeApiCall(
		"/Server/SendPushNotification",
		request,
		"X-SecretKey"
	)
end

--[[
	Adds a given tag to a player profile. The tag's namespace is automatically
	generated based on the source of the tag.

	This API will trigger a player_tag_added event and add a tag with the given
	TagName and PlayFabID to the corresponding player profile. TagName can be
	used for segmentation and it is limited to 256 characters. Also there is a
	limit on the number of tags a title can have.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/playstream/addplayertag).

	### Errors
	- PlayerTagCountLimitExceeded

]]
function Apis.AddPlayerTag(request: Types.AddPlayerTagRequest): Result<Types.AddPlayerTagResult, string>
	return makeApiCall(
		"/Server/AddPlayerTag",
		request,
		"X-SecretKey"
	)
end

--[[
	Submit a report about a player (due to bad bahavior, etc.) on behalf of
	another player, so that customer service representatives for the title can
	take action concerning potentially toxic players.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/player-item-management/reportplayer).

]]
function Apis.ReportPlayer(request: Types.ReportPlayerServerRequest): Result<Types.ReportPlayerServerResult, string>
	return makeApiCall(
		"/Server/ReportPlayer",
		request,
		"X-SecretKey"
	)
end

--[[
	Retrieves the unique PlayFab identifiers for the given set of Facebook
	Instant Games identifiers.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/account-management/getplayfabidsfromfacebookinstantgamesids).

]]
function Apis.GetPlayFabIDsFromFacebookInstantGamesIds(request: Types.GetPlayFabIDsFromFacebookInstantGamesIdsRequest): Result<Types.GetPlayFabIDsFromFacebookInstantGamesIdsResult, string>
	return makeApiCall(
		"/Server/GetPlayFabIDsFromFacebookInstantGamesIds",
		request,
		"X-SecretKey"
	)
end

--[[
	Retrieves the unique PlayFab identifiers for the given set of Nintendo
	Switch Device identifiers.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/account-management/getplayfabidsfromnintendoswitchdeviceids).

]]
function Apis.GetPlayFabIDsFromNintendoSwitchDeviceIds(request: Types.GetPlayFabIDsFromNintendoSwitchDeviceIdsRequest): Result<Types.GetPlayFabIDsFromNintendoSwitchDeviceIdsResult, string>
	return makeApiCall(
		"/Server/GetPlayFabIDsFromNintendoSwitchDeviceIds",
		request,
		"X-SecretKey"
	)
end

--[[
	_NOTE: This is a Legacy Economy API, and is in bugfix-only mode. All new
	Economy features are being developed only for version 2._ Retrieves the
	specified character's current inventory of virtual goods

	All items currently in the character inventory will be returned,
	irrespective of how they were acquired (via purchasing, grants, coupons,
	etc.). Items that are expired, fully consumed, or are no longer valid are
	not considered to be in the user's current inventory, and so will not be not
	included. Also returns their virtual currency balances.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/player-item-management/getcharacterinventory).

	### Errors
	- CharacterNotFound

]]
function Apis.GetCharacterInventory(request: Types.GetCharacterInventoryRequest): Result<Types.GetCharacterInventoryResult, string>
	return makeApiCall(
		"/Server/GetCharacterInventory",
		request,
		"X-SecretKey"
	)
end

--[[
	Updates the values of the specified title-specific statistics for the
	specific character

	Character statistics are similar to user statistics in that they are numeric
	values which may only be updated by a server operation, in order to minimize
	the opportunity for unauthorized changes. In addition to being available for
	use by the title, the statistics are used for all leaderboard operations in
	PlayFab.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/characters/updatecharacterstatistics).

	### Errors
	- CharacterNotFound
	- InvalidCharacterStatistics

]]
function Apis.UpdateCharacterStatistics(request: Types.UpdateCharacterStatisticsRequest): Result<Types.UpdateCharacterStatisticsResult, string>
	return makeApiCall(
		"/Server/UpdateCharacterStatistics",
		request,
		"X-SecretKey"
	)
end

--[[
	Retrieves the unique PlayFab identifiers for the given set of generic
	service identifiers. A generic identifier is the service name plus the
	service-specific ID for the player, as specified by the title when the
	generic identifier was added to the player account.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/account-management/getplayfabidsfromgenericids).

]]
function Apis.GetPlayFabIDsFromGenericIDs(request: Types.GetPlayFabIDsFromGenericIDsRequest): Result<Types.GetPlayFabIDsFromGenericIDsResult, string>
	return makeApiCall(
		"/Server/GetPlayFabIDsFromGenericIDs",
		request,
		"X-SecretKey"
	)
end

--[[
	Retrieves the unique PlayFab identifiers for the given set of Steam
	identifiers. The Steam identifiers are the profile IDs for the user
	accounts, available as SteamId in the Steamworks Community API calls.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/account-management/getplayfabidsfromsteamids).

]]
function Apis.GetPlayFabIDsFromSteamIDs(request: Types.GetPlayFabIDsFromSteamIDsRequest): Result<Types.GetPlayFabIDsFromSteamIDsResult, string>
	return makeApiCall(
		"/Server/GetPlayFabIDsFromSteamIDs",
		request,
		"X-SecretKey"
	)
end

--[[
	Retrieves the unique PlayFab identifiers for the given set of Twitch
	identifiers. The Twitch identifiers are the IDs for the user accounts,
	available as "_id" from the Twitch API methods (ex:
	https://github.com/justintv/Twitch-API/blob/master/v3_resources/users.md#get-usersuser).

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/account-management/getplayfabidsfromtwitchids).

]]
function Apis.GetPlayFabIDsFromTwitchIDs(request: Types.GetPlayFabIDsFromTwitchIDsRequest): Result<Types.GetPlayFabIDsFromTwitchIDsResult, string>
	return makeApiCall(
		"/Server/GetPlayFabIDsFromTwitchIDs",
		request,
		"X-SecretKey"
	)
end

--[[
	Retrieves the current version and values for the indicated statistics, for
	the local player.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/player-data-management/getplayerstatistics).

]]
function Apis.GetPlayerStatistics(request: Types.GetPlayerStatisticsRequest): Result<Types.GetPlayerStatisticsResult, string>
	return makeApiCall(
		"/Server/GetPlayerStatistics",
		request,
		"X-SecretKey"
	)
end

--[[
	Unlinks the related Nintendo account from the user's PlayFab account

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/account-management/unlinknintendoserviceaccount).

	### Errors
	- AccountNotLinked
	- NintendoSwitchNotEnabledForTitle

]]
function Apis.UnlinkNintendoServiceAccount(request: Types.UnlinkNintendoServiceAccountRequest): Result<Types.EmptyResponse, string>
	return makeApiCall(
		"/Server/UnlinkNintendoServiceAccount",
		request,
		"X-SecretKey"
	)
end

--[[
	Retrieves the key-value store of custom internal title settings

	This API is designed to return title specific values which can be read, but
	not written to, by the client. For example, a developer could choose to
	store values which modify the user experience, such as enemy spawn rates,
	weapon strengths, movement speeds, etc. This allows a developer to update
	the title without the need to create, test, and ship a new build. If an
	override label is specified in the request, the overrides are applied
	automatically and returned with the title data. Note that there may up to a
	minute delay in between updating title data and this API call returning the
	newest value.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/title-wide-data-management/gettitleinternaldata).

]]
function Apis.GetTitleInternalData(request: Types.GetTitleDataRequest): Result<Types.GetTitleDataResult, string>
	return makeApiCall(
		"/Server/GetTitleInternalData",
		request,
		"X-SecretKey"
	)
end

--[[
	Unlinks the related PlayStation :tm: Network account from the user's PlayFab
	account

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/account-management/unlinkpsnaccount).

	### Errors
	- AccountNotLinked

]]
function Apis.UnlinkPSNAccount(request: Types.UnlinkPSNAccountRequest): Result<Types.UnlinkPSNAccountResult, string>
	return makeApiCall(
		"/Server/UnlinkPSNAccount",
		request,
		"X-SecretKey"
	)
end

--[[
	Updates the key-value store of custom title settings

	This API is designed to store title specific values which can be read, but
	not written to, by the client. For example, a developer could choose to
	store values which modify the user experience, such as enemy spawn rates,
	weapon strengths, movement speeds, etc. This allows a developer to update
	the title without the need to create, test, and ship a new build. This
	operation is additive. If a Key does not exist in the current dataset, it
	will be added with the specified Value. If it already exists, the Value for
	that key will be overwritten with the new Value.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/title-wide-data-management/settitledata).

	### Errors
	- DataLengthExceeded
	- TooManyKeys

]]
function Apis.SetTitleData(request: Types.SetTitleDataRequest): Result<Types.SetTitleDataResult, string>
	return makeApiCall(
		"/Server/SetTitleData",
		request,
		"X-SecretKey"
	)
end

--[[
	_NOTE: This is a Legacy Economy API, and is in bugfix-only mode. All new
	Economy features are being developed only for version 2._ Adds the virtual
	goods associated with the coupon to the user's inventory. Coupons can be
	generated via the Economy->Catalogs tab in the PlayFab Game Manager.

	Coupon codes can be created for any item, or set of items, in the catalog
	for the title. This operation causes the coupon to be consumed, and the
	specific items to be awarded to the user. Attempting to re-use an already
	consumed code, or a code which has not yet been created in the service, will
	result in an error.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/player-item-management/redeemcoupon).

	### Errors
	- CatalogNotConfigured
	- CharacterNotFound
	- CouponAlreadyRedeemed
	- CouponCodeNotFound

]]
function Apis.RedeemCoupon(request: Types.RedeemCouponRequest): Result<Types.RedeemCouponResult, string>
	return makeApiCall(
		"/Server/RedeemCoupon",
		request,
		"X-SecretKey"
	)
end

--[[
	_NOTE: This is a Legacy Economy API, and is in bugfix-only mode. All new
	Economy features are being developed only for version 2._ Retrieves the
	specified user's current inventory of virtual goods

	All items currently in the user inventory will be returned, irrespective of
	how they were acquired (via purchasing, grants, coupons, etc.). Items that
	are expired, fully consumed, or are no longer valid are not considered to be
	in the user's current inventory, and so will not be not included.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/player-item-management/getuserinventory).

]]
function Apis.GetUserInventory(request: Types.GetUserInventoryRequest): Result<Types.GetUserInventoryResult, string>
	return makeApiCall(
		"/Server/GetUserInventory",
		request,
		"X-SecretKey"
	)
end

--[[
	This API retrieves a pre-signed URL for accessing a content file for the
	title. A subsequent HTTP GET to the returned URL will attempt to download
	the content. A HEAD query to the returned URL will attempt to retrieve the
	metadata of the content. Note that a successful result does not guarantee
	the existence of this content - if it has not been uploaded, the query to
	retrieve the data will fail. See this post for more information:
	https://community.playfab.com/hc/community/posts/205469488-How-to-upload-files-to-PlayFab-s-Content-Service.
	Also, please be aware that the Content service is specifically PlayFab's CDN
	offering, for which standard CDN rates apply.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/content/getcontentdownloadurl).

]]
function Apis.GetContentDownloadUrl(request: Types.GetContentDownloadUrlRequest): Result<Types.GetContentDownloadUrlResult, string>
	return makeApiCall(
		"/Server/GetContentDownloadUrl",
		request,
		"X-SecretKey"
	)
end

--[[
	_NOTE: This is a Legacy Economy API, and is in bugfix-only mode. All new
	Economy features are being developed only for version 2._ Adds the specified
	items to the specified user's inventory

	This function directly adds inventory items to the user's inventories. As a
	result of this operations, the user will not be charged any transaction fee,
	regardless of the inventory item catalog definition. Please note that the
	processing time for inventory grants and purchases increases fractionally
	the more items are in the inventory, and the more items are in the
	grant/purchase operation.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/player-item-management/grantitemstouser).

	### Errors
	- AccountNotFound
	- CatalogNotConfigured

]]
function Apis.GrantItemsToUser(request: Types.GrantItemsToUserRequest): Result<Types.GrantItemsToUserResult, string>
	return makeApiCall(
		"/Server/GrantItemsToUser",
		request,
		"X-SecretKey"
	)
end

--[[
	Retrieves the unique PlayFab identifiers for the given set of Battle.net
	account identifiers.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/account-management/getplayfabidsfrombattlenetaccountids).

]]
function Apis.GetPlayFabIDsFromBattleNetAccountIds(request: Types.GetPlayFabIDsFromBattleNetAccountIdsRequest): Result<Types.GetPlayFabIDsFromBattleNetAccountIdsResult, string>
	return makeApiCall(
		"/Server/GetPlayFabIDsFromBattleNetAccountIds",
		request,
		"X-SecretKey"
	)
end

--[[
	Retrieves a list of all of the user's characters for the given statistic.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/characters/getleaderboardforusercharacters).

]]
function Apis.GetLeaderboardForUserCharacters(request: Types.GetLeaderboardForUsersCharactersRequest): Result<Types.GetLeaderboardForUsersCharactersResult, string>
	return makeApiCall(
		"/Server/GetLeaderboardForUserCharacters",
		request,
		"X-SecretKey"
	)
end

--[[
	Writes a player-based event into PlayStream.

	This API is designed to write a multitude of different event types into
	PlayStream. It supports a flexible JSON schema, which allowsfor arbitrary
	key-value pairs to describe any player-based event. The created event will
	be locked to the authenticated title.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/analytics/writeplayerevent).

	### Errors
	- InvalidEventField
	- NoWritePermissionsForEvent
	- UserisNotValid

]]
function Apis.WritePlayerEvent(request: Types.WriteServerPlayerEventRequest): Result<Types.WriteEventResponse, string>
	return makeApiCall(
		"/Server/WritePlayerEvent",
		request,
		"X-SecretKey"
	)
end

--[[
	Links the NintendoSwitchDeviceId to the user's PlayFab account

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/account-management/linknintendoswitchdeviceid).

	### Errors
	- LinkedAccountAlreadyClaimed

]]
function Apis.LinkNintendoSwitchDeviceId(request: Types.LinkNintendoSwitchDeviceIdRequest): Result<Types.LinkNintendoSwitchDeviceIdResult, string>
	return makeApiCall(
		"/Server/LinkNintendoSwitchDeviceId",
		request,
		"X-SecretKey"
	)
end

--[[
	Awards the specified users the specified Steam achievements

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/platform-specific-methods/awardsteamachievement).

	### Errors
	- UserisNotValid

]]
function Apis.AwardSteamAchievement(request: Types.AwardSteamAchievementRequest): Result<Types.AwardSteamAchievementResult, string>
	return makeApiCall(
		"/Server/AwardSteamAchievement",
		request,
		"X-SecretKey"
	)
end

--[[
	Links the custom server identifier, generated by the title, to the user's
	PlayFab account.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/account-management/linkservercustomid).

	### Errors
	- AccountNotFound
	- LinkedIdentifierAlreadyClaimed

]]
function Apis.LinkServerCustomId(request: Types.LinkServerCustomIdRequest): Result<Types.LinkServerCustomIdResult, string>
	return makeApiCall(
		"/Server/LinkServerCustomId",
		request,
		"X-SecretKey"
	)
end

--[[
	Sign in the user with a Battle.net identity token

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/authentication/loginwithbattlenet).

	### Errors
	- AccountNotFound
	- BattleNetNotEnabledForTitle
	- EncryptionKeyMissing
	- EvaluationModePlayerCountExceeded
	- InvalidAuthToken
	- InvalidSignature
	- InvalidSignatureTime
	- InvalidTitleId
	- PlayerSecretAlreadyConfigured
	- PlayerSecretNotConfigured
	- RequestViewConstraintParamsNotAllowed

]]
function Apis.LoginWithBattleNet(request: Types.LoginWithBattleNetRequest): Result<Types.ServerLoginResult, string>
	return makeApiCall(
		"/Server/LoginWithBattleNet",
		request,
		"X-SecretKey"
	)
end

--[[
	Gets all bans for a user.

	Get all bans for a user, including inactive and expired bans.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/account-management/getuserbans).

	### Errors
	- UserisNotValid

]]
function Apis.GetUserBans(request: Types.GetUserBansRequest): Result<Types.GetUserBansResult, string>
	return makeApiCall(
		"/Server/GetUserBans",
		request,
		"X-SecretKey"
	)
end

--[[
	Links the Steam account associated with the provided Steam ID to the user's
	PlayFab account

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/account-management/linksteamid).

	### Errors
	- AccountAlreadyLinked
	- InvalidSteamTicket
	- LinkedAccountAlreadyClaimed
	- SteamNotEnabledForTitle
	- SteamUserNotFound

]]
function Apis.LinkSteamId(request: Types.LinkSteamIdRequest): Result<Types.LinkSteamIdResult, string>
	return makeApiCall(
		"/Server/LinkSteamId",
		request,
		"X-SecretKey"
	)
end

--[[
	Retrieves the publisher-specific custom data for the user which is readable
	and writable by the client

	Data is stored as JSON key-value pairs. If the Keys parameter is provided,
	the data object returned will only contain the data specific to the
	indicated Keys. Otherwise, the full set of custom user data will be
	returned.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/player-data-management/getuserpublisherdata).

	### Errors
	- PublisherNotSet

]]
function Apis.GetUserPublisherData(request: Types.GetUserDataRequest): Result<Types.GetUserDataResult, string>
	return makeApiCall(
		"/Server/GetUserPublisherData",
		request,
		"X-SecretKey"
	)
end

--[[
	Signs the user in using the iOS device identifier, returning a session
	identifier that can subsequently be used for API calls which require an
	authenticated user

	On iOS devices, the identifierForVendor
	(https://developer.apple.com/library/ios/documentation/UIKit/Reference/UIDevice_Class/index.html#//apple_ref/occ/instp/UIDevice/identifierForVendor)
	must be used as the DeviceId, as the UIDevice uniqueIdentifier has been
	deprecated as of iOS 5, and use of the advertisingIdentifier for this
	purpose will result in failure of Apple's certification process. If this is
	the first time a user has signed in with the iOS device and CreateAccount is
	set to true, a new PlayFab account will be created and linked to the
	vendor-specific iOS device ID. In this case, no email or username will be
	associated with the PlayFab account. Otherwise, if no PlayFab account is
	linked to the iOS device, an error indicating this will be returned, so that
	the title can guide the user through creation of a PlayFab account.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/authentication/loginwithiosdeviceid).

	### Errors
	- EvaluationModePlayerCountExceeded
	- RequestViewConstraintParamsNotAllowed

]]
function Apis.LoginWithIOSDeviceID(request: Types.LoginWithIOSDeviceIDRequest): Result<Types.ServerLoginResult, string>
	return makeApiCall(
		"/Server/LoginWithIOSDeviceID",
		request,
		"X-SecretKey"
	)
end

--[[
	Signs the user in using an Steam ID, returning a session identifier that can
	subsequently be used for API calls which require an authenticated user

	If this is the first time a user has signed in with the Steam ID and
	CreateAccount is set to true, a new PlayFab account will be created and
	linked to the Steam account. In this case, no email or username will be
	associated with the PlayFab account. Otherwise, if no PlayFab account is
	linked to the Steam account, an error indicating this will be returned, so
	that the title can guide the user through creation of a PlayFab account.
	Steam users that are not logged into the Steam Client app will only have
	their Steam username synced, other data, such as currency and country will
	not be available until they login while the Client is open.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/authentication/loginwithsteamid).

	### Errors
	- EvaluationModePlayerCountExceeded
	- InvalidSignature
	- InvalidSignatureTime
	- InvalidSteamUsername
	- RequestViewConstraintParamsNotAllowed
	- SteamNotEnabledForTitle
	- SteamUserNotFound

]]
function Apis.LoginWithSteamId(request: Types.LoginWithSteamIdRequest): Result<Types.ServerLoginResult, string>
	return makeApiCall(
		"/Server/LoginWithSteamId",
		request,
		"X-SecretKey"
	)
end

--[[
	Signs the user in using a Xbox Live Token from an external server backend,
	returning a session identifier that can subsequently be used for API calls
	which require an authenticated user

	If this is the first time a user has signed in with the Xbox Live account
	and CreateAccount is set to true, a new PlayFab account will be created and
	linked to the Xbox Live account. In this case, no email or username will be
	associated with the PlayFab account. Otherwise, if no PlayFab account is
	linked to the Xbox Live account, an error indicating this will be returned,
	so that the title can guide the user through creation of a PlayFab account.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/authentication/loginwithxbox).

	### Errors
	- EvaluationModePlayerCountExceeded
	- ExpiredXboxLiveToken
	- InvalidXboxLiveToken
	- RequestViewConstraintParamsNotAllowed
	- XboxInaccessible
	- XboxRejectedXSTSExchangeRequest
	- XboxXASSExchangeFailure

]]
function Apis.LoginWithXbox(request: Types.LoginWithXboxRequest): Result<Types.ServerLoginResult, string>
	return makeApiCall(
		"/Server/LoginWithXbox",
		request,
		"X-SecretKey"
	)
end

--[[
	Retrieves title-specific custom property values for a player.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/player-data-management/listplayercustomproperties).

]]
function Apis.ListPlayerCustomProperties(request: Types.ListPlayerCustomPropertiesRequest): Result<Types.ListPlayerCustomPropertiesResult, string>
	return makeApiCall(
		"/Server/ListPlayerCustomProperties",
		request,
		"X-SecretKey"
	)
end

--[[
	_NOTE: This is a Legacy Economy API, and is in bugfix-only mode. All new
	Economy features are being developed only for version 2._ Decrements the
	user's balance of the specified virtual currency by the stated amount. It is
	possible to make a VC balance negative with this API.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/player-item-management/subtractuservirtualcurrency).

	### Errors
	- InvalidVirtualCurrency
	- VirtualCurrencyCurrentlyUnavailable

]]
function Apis.SubtractUserVirtualCurrency(request: Types.SubtractUserVirtualCurrencyRequest): Result<Types.ModifyUserVirtualCurrencyResult, string>
	return makeApiCall(
		"/Server/SubtractUserVirtualCurrency",
		request,
		"X-SecretKey"
	)
end

--[[
	Retrieves the unique PlayFab identifiers for the given set of Facebook
	identifiers.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/account-management/getplayfabidsfromfacebookids).

]]
function Apis.GetPlayFabIDsFromFacebookIDs(request: Types.GetPlayFabIDsFromFacebookIDsRequest): Result<Types.GetPlayFabIDsFromFacebookIDsResult, string>
	return makeApiCall(
		"/Server/GetPlayFabIDsFromFacebookIDs",
		request,
		"X-SecretKey"
	)
end

--[[
	Signs the user in using an Xbox ID and Sandbox ID, returning a session
	identifier that can subsequently be used for API calls which require an
	authenticated user

	If this is the first time a user has signed in with the Xbox ID and
	CreateAccount is set to true, a new PlayFab account will be created and
	linked to the Xbox Live account. In this case, no email or username will be
	associated with the PlayFab account. Otherwise, if no PlayFab account is
	linked to the Xbox Live account, an error indicating this will be returned,
	so that the title can guide the user through creation of a PlayFab account.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/authentication/loginwithxboxid).

	### Errors
	- EvaluationModePlayerCountExceeded
	- RequestViewConstraintParamsNotAllowed
	- XboxInaccessible
	- XboxRejectedXSTSExchangeRequest
	- XboxXASSExchangeFailure

]]
function Apis.LoginWithXboxId(request: Types.LoginWithXboxIdRequest): Result<Types.ServerLoginResult, string>
	return makeApiCall(
		"/Server/LoginWithXboxId",
		request,
		"X-SecretKey"
	)
end

--[[
	_NOTE: This is a Legacy Economy API, and is in bugfix-only mode. All new
	Economy features are being developed only for version 2._ Moves an item from
	a user's inventory into their character's inventory.

	Transfers an item from a user to a character she owns. This will remove the
	item from the user's inventory (until and unless it is moved back), and will
	enable the character to make use of the item instead.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/player-item-management/moveitemtocharacterfromuser).

	### Errors
	- CharacterNotFound
	- ItemNotOwned

]]
function Apis.MoveItemToCharacterFromUser(request: Types.MoveItemToCharacterFromUserRequest): Result<Types.MoveItemToCharacterFromUserResult, string>
	return makeApiCall(
		"/Server/MoveItemToCharacterFromUser",
		request,
		"X-SecretKey"
	)
end

--[[
	Updates the title-specific custom data for the user's character which is
	readable and writable by the client

	This function performs an additive update of the arbitrary JSON object
	containing the custom data for the user. In updating the custom data object,
	keys which already exist in the object will have their values overwritten,
	while keys with null values will be removed. No other key-value pairs will
	be changed apart from those specified in the call.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/character-data/updatecharacterdata).

	### Errors
	- CharacterNotFound
	- UserisNotValid

]]
function Apis.UpdateCharacterData(request: Types.UpdateCharacterDataRequest): Result<Types.UpdateCharacterDataResult, string>
	return makeApiCall(
		"/Server/UpdateCharacterData",
		request,
		"X-SecretKey"
	)
end

--[[
	Requests the creation of a shared group object, containing key/value pairs
	which may be updated by all members of the group. When created by a server,
	the group will initially have no members. Shared Groups are designed for
	sharing data between a very small number of players, please see our guide:
	https://docs.microsoft.com/gaming/playfab/features/social/groups/using-shared-group-data

	If SharedGroupId is specified, the service will attempt to create a group
	with that identifier, and will return an error if it is already in use. If
	no SharedGroupId is specified, a random identifier will be assigned.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/shared-group-data/createsharedgroup).

	### Errors
	- InvalidSharedGroupId

]]
function Apis.CreateSharedGroup(request: Types.CreateSharedGroupRequest): Result<Types.CreateSharedGroupResult, string>
	return makeApiCall(
		"/Server/CreateSharedGroup",
		request,
		"X-SecretKey"
	)
end

--[[
	_NOTE: This is a Legacy Economy API, and is in bugfix-only mode. All new
	Economy features are being developed only for version 2._ Increments the
	user's balance of the specified virtual currency by the stated amount

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/player-item-management/adduservirtualcurrency).

	### Errors
	- InvalidVirtualCurrency
	- VirtualCurrencyCurrentlyUnavailable

]]
function Apis.AddUserVirtualCurrency(request: Types.AddUserVirtualCurrencyRequest): Result<Types.ModifyUserVirtualCurrencyResult, string>
	return makeApiCall(
		"/Server/AddUserVirtualCurrency",
		request,
		"X-SecretKey"
	)
end

--[[
	Retrieves the title-specific custom data for the user which is readable and
	writable by the client

	Data is stored as JSON key-value pairs. If the Keys parameter is provided,
	the data object returned will only contain the data specific to the
	indicated Keys. Otherwise, the full set of custom user data will be
	returned.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/player-data-management/getuserdata).

]]
function Apis.GetUserData(request: Types.GetUserDataRequest): Result<Types.GetUserDataResult, string>
	return makeApiCall(
		"/Server/GetUserData",
		request,
		"X-SecretKey"
	)
end

--[[
	Links the Battle.net account associated with the token to the user's PlayFab
	account.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/account-management/linkbattlenetaccount).

	### Errors
	- BattleNetNotEnabledForTitle
	- LinkedIdentifierAlreadyClaimed

]]
function Apis.LinkBattleNetAccount(request: Types.LinkBattleNetAccountRequest): Result<Types.EmptyResult, string>
	return makeApiCall(
		"/Server/LinkBattleNetAccount",
		request,
		"X-SecretKey"
	)
end

--[[
	_NOTE: This is a Legacy Economy API, and is in bugfix-only mode. All new
	Economy features are being developed only for version 2._ Moves an item from
	a character's inventory into the owning user's inventory.

	Transfers an item from a character to the owning user. This will remove the
	item from the character's inventory (until and unless it is moved back), and
	will enable the user to make use of the item instead.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/player-item-management/moveitemtouserfromcharacter).

	### Errors
	- CharacterNotFound
	- ItemNotOwned

]]
function Apis.MoveItemToUserFromCharacter(request: Types.MoveItemToUserFromCharacterRequest): Result<Types.MoveItemToUserFromCharacterResult, string>
	return makeApiCall(
		"/Server/MoveItemToUserFromCharacter",
		request,
		"X-SecretKey"
	)
end

--[[
	_NOTE: This is a Legacy Economy API, and is in bugfix-only mode. All new
	Economy features are being developed only for version 2._ Moves an item from
	a character's inventory into another of the users's character's inventory.

	Transfers an item from a character to another character that is owned by the
	same user. This will remove the item from the character's inventory (until
	and unless it is moved back), and will enable the other character to make
	use of the item instead.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/player-item-management/moveitemtocharacterfromcharacter).

	### Errors
	- CharacterNotFound
	- ItemNotOwned

]]
function Apis.MoveItemToCharacterFromCharacter(request: Types.MoveItemToCharacterFromCharacterRequest): Result<Types.MoveItemToCharacterFromCharacterResult, string>
	return makeApiCall(
		"/Server/MoveItemToCharacterFromCharacter",
		request,
		"X-SecretKey"
	)
end

--[[
	Revoke all active bans for a user.

	Setting the active state of all non-expired bans for a user to Inactive.
	Expired bans with an Active state will be ignored, however. Returns
	information about applied updates only.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/account-management/revokeallbansforuser).

	### Errors
	- UserisNotValid

]]
function Apis.RevokeAllBansForUser(request: Types.RevokeAllBansForUserRequest): Result<Types.RevokeAllBansForUserResult, string>
	return makeApiCall(
		"/Server/RevokeAllBansForUser",
		request,
		"X-SecretKey"
	)
end

--[[
	_NOTE: This is a Legacy Economy API, and is in bugfix-only mode. All new
	Economy features are being developed only for version 2._ Adds the specified
	items to the specified character's inventory

	This function directly adds inventory items to the character's inventories.
	As a result of this operations, the user will not be charged any transaction
	fee, regardless of the inventory item catalog definition. Please note that
	the processing time for inventory grants and purchases increases
	fractionally the more items are in the inventory, and the more items are in
	the grant/purchase operation.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/player-item-management/grantitemstocharacter).

	### Errors
	- CatalogNotConfigured
	- CharacterNotFound

]]
function Apis.GrantItemsToCharacter(request: Types.GrantItemsToCharacterRequest): Result<Types.GrantItemsToCharacterResult, string>
	return makeApiCall(
		"/Server/GrantItemsToCharacter",
		request,
		"X-SecretKey"
	)
end

--[[
	Unlinks the Steam account associated with the provided Steam ID to the
	user's PlayFab account

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/account-management/unlinksteamid).

	### Errors
	- AccountNotLinked

]]
function Apis.UnlinkSteamId(request: Types.UnlinkSteamIdRequest): Result<Types.UnlinkSteamIdResult, string>
	return makeApiCall(
		"/Server/UnlinkSteamId",
		request,
		"X-SecretKey"
	)
end

--[[
	Revoke all active bans specified with BanId.

	Setting the active state of all bans requested to Inactive regardless of
	whether that ban has already expired. BanIds that do not exist will be
	skipped. Returns information about applied updates only.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/account-management/revokebans).

]]
function Apis.RevokeBans(request: Types.RevokeBansRequest): Result<Types.RevokeBansResult, string>
	return makeApiCall(
		"/Server/RevokeBans",
		request,
		"X-SecretKey"
	)
end

--[[
	_NOTE: This is a Legacy Economy API, and is in bugfix-only mode. All new
	Economy features are being developed only for version 2._ Revokes access to
	an item in a user's inventory

	In cases where the inventory item in question is a "crate", and the items it
	contained have already been dispensed, this will not revoke access or
	otherwise remove the items which were dispensed.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/player-item-management/revokeinventoryitem).

	### Errors
	- ItemNotFound

]]
function Apis.RevokeInventoryItem(request: Types.RevokeInventoryItemRequest): Result<Types.RevokeInventoryResult, string>
	return makeApiCall(
		"/Server/RevokeInventoryItem",
		request,
		"X-SecretKey"
	)
end

--[[
	Executes a CloudScript function, with the 'currentPlayerId' set to the
	PlayFab ID of the authenticated player. The PlayFab ID is the entity ID of
	the player's master_player_account entity.



	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/server-side-cloud-script/executecloudscript).

	### Errors
	- CloudScriptAPIRequestCountExceeded
	- CloudScriptAPIRequestError
	- CloudScriptFunctionArgumentSizeExceeded
	- CloudScriptHTTPRequestError
	- CloudScriptNotFound
	- JavascriptException
	- TitleDeleted

]]
function Apis.ExecuteCloudScript(request: Types.ExecuteCloudScriptServerRequest): Result<Types.ExecuteCloudScriptResult, string>
	return makeApiCall(
		"/Server/ExecuteCloudScript",
		request,
		"X-SecretKey"
	)
end

--[[
	Retrieves data stored in a shared group object, as well as the list of
	members in the group. The server can access all public and private group
	data. Shared Groups are designed for sharing data between a very small
	number of players, please see our guide:
	https://docs.microsoft.com/gaming/playfab/features/social/groups/using-shared-group-data

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/shared-group-data/getsharedgroupdata).

	### Errors
	- InvalidSharedGroupId

]]
function Apis.GetSharedGroupData(request: Types.GetSharedGroupDataRequest): Result<Types.GetSharedGroupDataResult, string>
	return makeApiCall(
		"/Server/GetSharedGroupData",
		request,
		"X-SecretKey"
	)
end

--[[
	Signs the user in using the Android device identifier, returning a session
	identifier that can subsequently be used for API calls which require an
	authenticated user

	On Android devices, the recommendation is to use the
	Settings.Secure.ANDROID_ID as the AndroidDeviceId, as described in this blog
	post
	(http://android-developers.blogspot.com/2011/03/identifying-app-installations.html).
	More information on this identifier can be found in the Android
	documentation
	(http://developer.android.com/reference/android/provider/Settings.Secure.html).
	If this is the first time a user has signed in with the Android device and
	CreateAccount is set to true, a new PlayFab account will be created and
	linked to the Android device ID. In this case, no email or username will be
	associated with the PlayFab account. Otherwise, if no PlayFab account is
	linked to the Android device, an error indicating this will be returned, so
	that the title can guide the user through creation of a PlayFab account.
	Please note that while multiple devices of this type can be linked to a
	single user account, only the one most recently used to login (or most
	recently linked) will be reflected in the user's account information. We
	will be updating to show all linked devices in a future release.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/authentication/loginwithandroiddeviceid).

	### Errors
	- EvaluationModePlayerCountExceeded
	- RequestViewConstraintParamsNotAllowed

]]
function Apis.LoginWithAndroidDeviceID(request: Types.LoginWithAndroidDeviceIDRequest): Result<Types.ServerLoginResult, string>
	return makeApiCall(
		"/Server/LoginWithAndroidDeviceID",
		request,
		"X-SecretKey"
	)
end

--[[
	Signs the user in using a PlayStation :tm: Network authentication code,
	returning a session identifier that can subsequently be used for API calls
	which require an authenticated user

	If this is the first time a user has signed in with the PlayStation :tm:
	Network account and CreateAccount is set to true, a new PlayFab account will
	be created and linked to the PlayStation :tm: Network account. In this case,
	no email or username will be associated with the PlayFab account. Otherwise,
	if no PlayFab account is linked to the PlayStation :tm: Network account, an
	error indicating this will be returned, so that the title can guide the user
	through creation of a PlayFab account.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/authentication/loginwithpsn).

	### Errors
	- EncryptionKeyMissing
	- EvaluationModePlayerCountExceeded
	- FeatureNotConfiguredForTitle
	- InvalidPSNAuthCode
	- InvalidPSNIssuerId
	- PlayerSecretAlreadyConfigured
	- PlayerSecretNotConfigured
	- PSNInaccessible
	- RequestViewConstraintParamsNotAllowed

]]
function Apis.LoginWithPSN(request: Types.LoginWithPSNRequest): Result<Types.ServerLoginResult, string>
	return makeApiCall(
		"/Server/LoginWithPSN",
		request,
		"X-SecretKey"
	)
end

--[[
	Retrieves the unique PlayFab identifiers for the given set of Steam
	identifiers. The Steam identifiers are persona names.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/account-management/getplayfabidsfromsteamnames).

]]
function Apis.GetPlayFabIDsFromSteamNames(request: Types.GetPlayFabIDsFromSteamNamesRequest): Result<Types.GetPlayFabIDsFromSteamNamesResult, string>
	return makeApiCall(
		"/Server/GetPlayFabIDsFromSteamNames",
		request,
		"X-SecretKey"
	)
end

--[[
	Sends an email based on an email template to a player's contact email

	Sends an email for only players that have contact emails associated with
	them. Takes in an email template ID specifyingthe email template to send.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/account-management/sendemailfromtemplate).

	### Errors
	- EmailClientCanceledTask
	- EmailClientTimeout
	- EmailTemplateMissing
	- NoContactEmailAddressFound
	- SmtpAddonNotEnabled

]]
function Apis.SendEmailFromTemplate(request: Types.SendEmailFromTemplateRequest): Result<Types.SendEmailFromTemplateResult, string>
	return makeApiCall(
		"/Server/SendEmailFromTemplate",
		request,
		"X-SecretKey"
	)
end

--[[
	Links the Nintendo account associated with the token to the user's PlayFab
	account

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/account-management/linknintendoserviceaccount).

	### Errors
	- InvalidIdentityProviderId
	- LinkedIdentifierAlreadyClaimed
	- NintendoSwitchNotEnabledForTitle

]]
function Apis.LinkNintendoServiceAccount(request: Types.LinkNintendoServiceAccountRequest): Result<Types.EmptyResult, string>
	return makeApiCall(
		"/Server/LinkNintendoServiceAccount",
		request,
		"X-SecretKey"
	)
end

--[[
	Adds users to the set of those able to update both the shared data, as well
	as the set of users in the group. Only users in the group (and the server)
	can add new members. Shared Groups are designed for sharing data between a
	very small number of players, please see our guide:
	https://docs.microsoft.com/gaming/playfab/features/social/groups/using-shared-group-data

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/shared-group-data/addsharedgroupmembers).

	### Errors
	- InvalidSharedGroupId
	- UserAlreadyAdded

]]
function Apis.AddSharedGroupMembers(request: Types.AddSharedGroupMembersRequest): Result<Types.AddSharedGroupMembersResult, string>
	return makeApiCall(
		"/Server/AddSharedGroupMembers",
		request,
		"X-SecretKey"
	)
end

--[[
	_NOTE: This is a Legacy Economy API, and is in bugfix-only mode. All new
	Economy features are being developed only for version 2._ Opens a specific
	container (ContainerItemInstanceId), with a specific key (KeyItemInstanceId,
	when required), and returns the contents of the opened container. If the
	container (and key when relevant) are consumable (RemainingUses > 0), their
	RemainingUses will be decremented, consistent with the operation of
	ConsumeItem.

	Specify the container and optionally the catalogVersion for the container to
	open

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/player-item-management/unlockcontainerinstance).

	### Errors
	- ContainerKeyInvalid
	- ContainerNotOwned
	- InvalidContainerItem
	- InvalidItemIdInTable
	- InvalidItemProperties
	- KeyNotOwned

]]
function Apis.UnlockContainerInstance(request: Types.UnlockContainerInstanceRequest): Result<Types.UnlockContainerItemResult, string>
	return makeApiCall(
		"/Server/UnlockContainerInstance",
		request,
		"X-SecretKey"
	)
end

--[[
	Updates the publisher-specific custom data for the user which cannot be
	accessed by the client

	This function performs an additive update of the arbitrary JSON object
	containing the custom data for the user. In updating the custom data object,
	keys which already exist in the object will have their values overwritten,
	keys with null values will be removed. No other key-value pairs will be
	changed apart from those specified in the call.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/player-data-management/updateuserpublisherinternaldata).

	### Errors
	- PublisherNotSet

]]
function Apis.UpdateUserPublisherInternalData(request: Types.UpdateUserInternalDataRequest): Result<Types.UpdateUserDataResult, string>
	return makeApiCall(
		"/Server/UpdateUserPublisherInternalData",
		request,
		"X-SecretKey"
	)
end

--[[
	Unlinks the custom server identifier from the user's PlayFab account.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/account-management/unlinkservercustomid).

	### Errors
	- AccountNotLinked
	- IdentifierNotLinked

]]
function Apis.UnlinkServerCustomId(request: Types.UnlinkServerCustomIdRequest): Result<Types.UnlinkServerCustomIdResult, string>
	return makeApiCall(
		"/Server/UnlinkServerCustomId",
		request,
		"X-SecretKey"
	)
end

--[[
	Forces an email to be sent to the registered contact email address for the
	user's account based on an account recovery email template

	PlayFab accounts which have valid email address or username will be able to
	receive a password reset email using this API.The email sent must be an
	account recovery email template. The username or email can be passed in to
	send the email

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/account-management/sendcustomaccountrecoveryemail).

	### Errors
	- EmailClientCanceledTask
	- EmailClientTimeout
	- EmailMessageToAddressIsMissing
	- EmailTemplateMissing
	- NoContactEmailAddressFound
	- SmtpAddonNotEnabled

]]
function Apis.SendCustomAccountRecoveryEmail(request: Types.SendCustomAccountRecoveryEmailRequest): Result<Types.SendCustomAccountRecoveryEmailResult, string>
	return makeApiCall(
		"/Server/SendCustomAccountRecoveryEmail",
		request,
		"X-SecretKey"
	)
end

--[[
	Updates the title-specific custom data for the user which is readable and
	writable by the client

	This function performs an additive update of the arbitrary JSON object
	containing the custom data for the user. In updating the custom data object,
	keys which already exist in the object will have their values overwritten,
	while keys with null values will be removed. No other key-value pairs will
	be changed apart from those specified in the call.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/player-data-management/updateuserdata).

]]
function Apis.UpdateUserData(request: Types.UpdateUserDataRequest): Result<Types.UpdateUserDataResult, string>
	return makeApiCall(
		"/Server/UpdateUserData",
		request,
		"X-SecretKey"
	)
end

--[[
	Adds, updates, and removes data keys for a shared group object. If the
	permission is set to Public, all fields updated or added in this call will
	be readable by users not in the group. By default, data permissions are set
	to Private. Regardless of the permission setting, only members of the group
	(and the server) can update the data. Shared Groups are designed for sharing
	data between a very small number of players, please see our guide:
	https://docs.microsoft.com/gaming/playfab/features/social/groups/using-shared-group-data

	Note that in the case of multiple calls to write to the same shared group
	data keys, the last write received by the PlayFab service will determine the
	value available to subsequent read operations. For scenarios requiring
	coordination of data updates, it is recommended that titles make use of user
	data with read permission set to public, or a combination of user data and
	shared group data.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/server/shared-group-data/updatesharedgroupdata).

	### Errors
	- InvalidSharedGroupId
	- InvalidSignature
	- InvalidSignatureTime
	- PlayerSecretNotConfigured

]]
function Apis.UpdateSharedGroupData(request: Types.UpdateSharedGroupDataRequest): Result<Types.UpdateSharedGroupDataResult, string>
	return makeApiCall(
		"/Server/UpdateSharedGroupData",
		request,
		"X-SecretKey"
	)
end

return Apis
