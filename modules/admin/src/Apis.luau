--[[
	This file was generated on 2025-08-03 at 00:04 UTC. Do not edit directly.

]]

local Types = require(script.Parent.Types)

local Common = require(script.Parent.Parent.PlayFabCommon)
local makeApiCall = Common.makeApiCall
type Result<T, E> = Common.Result<T, E>

local Apis = {}

--[[
	Retrieves a download URL for the requested report

	Gets the download URL for the requested report data (in CSV form). The
	reports available through this API call are those available in the Game
	Manager, in the Analytics->Reports tab.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/getdatareport).

	### Errors
	- DataNotAvailable
	- InvalidParams
	- InvalidReportDate
	- InvalidReportName
	- ReportDataNotRetrievedSuccessfully
	- ReportNotProcessed

]]
function Apis.GetDataReport(request: Types.GetDataReportRequest): Result<Types.GetDataReportResult, string>
	return makeApiCall(
		"/Admin/GetDataReport",
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
	Documentation](https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/updateplayercustomproperties).

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
		"/Admin/UpdatePlayerCustomProperties",
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
	Documentation](https://docs.microsoft.com/rest/api/playfab/admin/account-management/revokeallbansforuser).

	### Errors
	- UserisNotValid

]]
function Apis.RevokeAllBansForUser(request: Types.RevokeAllBansForUserRequest): Result<Types.RevokeAllBansForUserResult, string>
	return makeApiCall(
		"/Admin/RevokeAllBansForUser",
		request,
		"X-SecretKey"
	)
end

--[[
	Adds a new player statistic configuration to the title, optionally allowing
	the developer to specify a reset interval and an aggregation method.

	Statistics are numeric values, with each statistic in the title also
	generating a leaderboard. The ResetInterval enables automatically resetting
	leaderboards on a specified interval. Upon reset, the statistic updates to a
	new version with no values (effectively removing all players from the
	leaderboard). The previous version's statistic values are also archived for
	retrieval, if needed (see GetPlayerStatisticVersions). Statistics not
	created via a call to CreatePlayerStatisticDefinition by default have a
	VersionChangeInterval of Never, meaning they do not reset on a schedule, but
	they can be set to do so via a call to UpdatePlayerStatisticDefinition. Once
	a statistic has been reset (sometimes referred to as versioned or
	incremented), the now-previous version can still be written to for up a
	short, pre-defined period (currently 10 seconds), to prevent issues with
	levels completing around the time of the reset. Also, once reset, the
	historical statistics for players in the title may be retrieved using the
	URL specified in the version information (GetPlayerStatisticVersions). The
	AggregationMethod determines what action is taken when a new statistic value
	is submitted - always update with the new value (Last), use the highest of
	the old and new values (Max), use the smallest (Min), or add them together
	(Sum).

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/createplayerstatisticdefinition).

	### Errors
	- StatisticCountLimitExceeded
	- StatisticNameConflict

]]
function Apis.CreatePlayerStatisticDefinition(request: Types.CreatePlayerStatisticDefinitionRequest): Result<Types.CreatePlayerStatisticDefinitionResult, string>
	return makeApiCall(
		"/Admin/CreatePlayerStatisticDefinition",
		request,
		"X-SecretKey"
	)
end

--[[
	Updates a player statistic configuration for the title, optionally allowing
	the developer to specify a reset interval.

	Statistics are numeric values, with each statistic in the title also
	generating a leaderboard. The ResetInterval enables automatically resetting
	leaderboards on a specified interval. Upon reset, the statistic updates to a
	new version with no values (effectively removing all players from the
	leaderboard). The previous version's statistic values are also archived for
	retrieval, if needed (see GetPlayerStatisticVersions). Statistics not
	created via a call to CreatePlayerStatisticDefinition by default have a
	VersionChangeInterval of Never, meaning they do not reset on a schedule, but
	they can be set to do so via a call to UpdatePlayerStatisticDefinition. Once
	a statistic has been reset (sometimes referred to as versioned or
	incremented), the now-previous version can still be written to for up a
	short, pre-defined period (currently 10 seconds), to prevent issues with
	levels completing around the time of the reset. Also, once reset, the
	historical statistics for players in the title may be retrieved using the
	URL specified in the version information (GetPlayerStatisticVersions). The
	AggregationMethod determines what action is taken when a new statistic value
	is submitted - always update with the new value (Last), use the highest of
	the old and new values (Max), use the smallest (Min), or add them together
	(Sum).

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/updateplayerstatisticdefinition).

	### Errors
	- StatisticNotFound
	- StatisticUpdateInProgress

]]
function Apis.UpdatePlayerStatisticDefinition(request: Types.UpdatePlayerStatisticDefinitionRequest): Result<Types.UpdatePlayerStatisticDefinitionResult, string>
	return makeApiCall(
		"/Admin/UpdatePlayerStatisticDefinition",
		request,
		"X-SecretKey"
	)
end

--[[
	_NOTE: This is a Legacy Economy API, and is in bugfix-only mode. All new
	Economy features are being developed only for version 2._ Adds one or more
	virtual currencies to the set defined for the title. Virtual Currencies have
	a maximum value of 2,147,483,647 when granted to a player. Any value over
	that will be discarded.

	This operation is additive. Any new currencies defined in the array will be
	added to the set of those available for the title, while any CurrencyCode
	identifiers matching existing ones in the game will be overwritten with the
	new values.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/addvirtualcurrencytypes).

	### Errors
	- InvalidVirtualCurrencyCode
	- VirtualCurrencyCodeExists
	- VirtualCurrencyCountLimitExceeded

]]
function Apis.AddVirtualCurrencyTypes(request: Types.AddVirtualCurrencyTypesRequest): Result<Types.BlankResult, string>
	return makeApiCall(
		"/Admin/AddVirtualCurrencyTypes",
		request,
		"X-SecretKey"
	)
end

--[[
	Get detail information of a segment and its associated definition(s) and
	action(s) for a title.

	Given input segment ids, return list of segments.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/admin/segments/getsegments).

	### Errors
	- GetSegmentsRateLimitExceeded
	- UnknownError

]]
function Apis.GetSegments(request: Types.GetSegmentsRequest): Result<Types.GetSegmentsResponse, string>
	return makeApiCall(
		"/Admin/GetSegments",
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
	Documentation](https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/updateuserpublisherinternaldata).

	### Errors
	- PublisherNotSet

]]
function Apis.UpdateUserPublisherInternalData(request: Types.UpdateUserInternalDataRequest): Result<Types.UpdateUserDataResult, string>
	return makeApiCall(
		"/Admin/UpdateUserPublisherInternalData",
		request,
		"X-SecretKey"
	)
end

--[[
	_NOTE: This is a Legacy Economy API, and is in bugfix-only mode. All new
	Economy features are being developed only for version 2._ Decrements the
	specified virtual currency by the stated amount

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/admin/player-item-management/subtractuservirtualcurrency).

	### Errors
	- InvalidVirtualCurrency
	- VirtualCurrencyCurrentlyUnavailable

]]
function Apis.SubtractUserVirtualCurrency(request: Types.SubtractUserVirtualCurrencyRequest): Result<Types.ModifyUserVirtualCurrencyResult, string>
	return makeApiCall(
		"/Admin/SubtractUserVirtualCurrency",
		request,
		"X-SecretKey"
	)
end

--[[
	List all segments that a player currently belongs to at this moment in time.



	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/admin/playstream/getplayersegments).

	### Errors
	- SegmentNotFound

]]
function Apis.GetPlayerSegments(request: Types.GetPlayersSegmentsRequest): Result<Types.GetPlayerSegmentsResult, string>
	return makeApiCall(
		"/Admin/GetPlayerSegments",
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
	Documentation](https://docs.microsoft.com/rest/api/playfab/admin/playstream/addplayertag).

	### Errors
	- PlayerTagCountLimitExceeded

]]
function Apis.AddPlayerTag(request: Types.AddPlayerTagRequest): Result<Types.AddPlayerTagResult, string>
	return makeApiCall(
		"/Admin/AddPlayerTag",
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
	Documentation](https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/getuserpublisherinternaldata).

]]
function Apis.GetUserPublisherInternalData(request: Types.GetUserDataRequest): Result<Types.GetUserDataResult, string>
	return makeApiCall(
		"/Admin/GetUserPublisherInternalData",
		request,
		"X-SecretKey"
	)
end

--[[
	Deletes a player's subscription

	This API lets developers delete a membership subscription.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/admin/account-management/deletemembershipsubscription).

	### Errors
	- MembershipNotFound

]]
function Apis.DeleteMembershipSubscription(request: Types.DeleteMembershipSubscriptionRequest): Result<Types.DeleteMembershipSubscriptionResult, string>
	return makeApiCall(
		"/Admin/DeleteMembershipSubscription",
		request,
		"X-SecretKey"
	)
end

--[[
	_NOTE: This is a Legacy Economy API, and is in bugfix-only mode. All new
	Economy features are being developed only for version 2._ Increases the
	global count for the given scarce resource.

	This operation will increment the global counter for the number of these
	items available. This number cannot be decremented, except by actual grants.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/admin/player-item-management/incrementlimitededitionitemavailability).

	### Errors
	- RequestAlreadyRunning

]]
function Apis.IncrementLimitedEditionItemAvailability(request: Types.IncrementLimitedEditionItemAvailabilityRequest): Result<Types.IncrementLimitedEditionItemAvailabilityResult, string>
	return makeApiCall(
		"/Admin/IncrementLimitedEditionItemAvailability",
		request,
		"X-SecretKey"
	)
end

--[[
	_NOTE: This is a Legacy Economy API, and is in bugfix-only mode. All new
	Economy features are being developed only for version 2._ Retrieves the
	random drop table configuration for the title

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/getrandomresulttables).

]]
function Apis.GetRandomResultTables(request: Types.GetRandomResultTablesRequest): Result<Types.GetRandomResultTablesResult, string>
	return makeApiCall(
		"/Admin/GetRandomResultTables",
		request,
		"X-SecretKey"
	)
end

--[[
	Creates a new player segment by defining the conditions on player
	properties. Also, create actions to target the player segments for a title.

	Send all the segment details part of CreateSegmentRequest

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/admin/segments/createsegment).

	### Errors
	- InvalidSegment
	- NameNotAvailable
	- SegmentManagementInvalidInput
	- SegmentManagementInvalidSegmentId
	- SegmentManagementInvalidSegmentName
	- SegmentManagementNoExpressionTree
	- SegmentManagementSegmentCountOverLimit
	- SegmentManagementTriggerActionCountOverLimit
	- UnknownError

]]
function Apis.CreateSegment(request: Types.CreateSegmentRequest): Result<Types.CreateSegmentResponse, string>
	return makeApiCall(
		"/Admin/CreateSegment",
		request,
		"X-SecretKey"
	)
end

--[[
	Gets all bans for a user.

	Get all bans for a user, including inactive and expired bans.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/admin/account-management/getuserbans).

	### Errors
	- UserisNotValid

]]
function Apis.GetUserBans(request: Types.GetUserBansRequest): Result<Types.GetUserBansResult, string>
	return makeApiCall(
		"/Admin/GetUserBans",
		request,
		"X-SecretKey"
	)
end

--[[
	Delete a task.

	After a task is deleted, for tracking purposes, the task instances belonging
	to this task will still remain. They will become orphaned and does not
	belongs to any task. Executions of any in-progress task instances will
	continue. If the task specified does not exist, the deletion is considered a
	success.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/admin/scheduledtask/deletetask).

]]
function Apis.DeleteTask(request: Types.DeleteTaskRequest): Result<Types.EmptyResponse, string>
	return makeApiCall(
		"/Admin/DeleteTask",
		request,
		"X-SecretKey"
	)
end

--[[
	_NOTE: This is a Legacy Economy API, and is in bugfix-only mode. All new
	Economy features are being developed only for version 2._ Updates an
	existing virtual item store with new or modified items

	When used for SetStoreItems, this operation is not additive. Using it will
	cause the indicated virtual store to be created from scratch. If there is an
	existing store with the same storeId, it will be deleted and replaced with
	only the items specified in this call. When used for UpdateStoreItems, this
	operation is additive. Items with ItemId values not currently in the store
	will be added, while those with ItemId values matching items currently in
	the catalog will overwrite those items with the given values. In both cases,
	a store contains an array of references to items defined in the catalog,
	along with the prices for the item, in both real world and virtual
	currencies. These prices act as an override to any prices defined in the
	catalog. In this way, the base definitions of the items may be defined in
	the catalog, with all associated properties, while the pricing can be set
	for each store, as needed. This allows for subsets of goods to be defined
	for different purposes (in order to simplify showing some, but not all
	catalog items to users, based upon different characteristics), along with
	unique prices. Note that all prices defined in the catalog and store
	definitions for the item are considered valid, and that a compromised client
	can be made to send a request for an item based upon any of these
	definitions. If no price is specified in the store for an item, the price
	set in the catalog should be displayed to the user.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/updatestoreitems).

	### Errors
	- CatalogNotConfigured
	- InvalidItemId
	- InvalidJSONContent

]]
function Apis.UpdateStoreItems(request: Types.UpdateStoreItemsRequest): Result<Types.UpdateStoreItemsResult, string>
	return makeApiCall(
		"/Admin/UpdateStoreItems",
		request,
		"X-SecretKey"
	)
end

--[[
	_NOTE: This is a Legacy Economy API, and is in bugfix-only mode. All new
	Economy features are being developed only for version 2._ Updates the random
	drop table configuration for the title

	This operation is additive. Tables with TableId values not currently defined
	will be added, while those with TableId values matching Tables currently in
	the catalog will be overwritten with the given values.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/updaterandomresulttables).

	### Errors
	- InvalidDropTable
	- InvalidJSONContent

]]
function Apis.UpdateRandomResultTables(request: Types.UpdateRandomResultTablesRequest): Result<Types.UpdateRandomResultTablesResult, string>
	return makeApiCall(
		"/Admin/UpdateRandomResultTables",
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
	Documentation](https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/updateuserpublisherreadonlydata).

	### Errors
	- PublisherNotSet

]]
function Apis.UpdateUserPublisherReadOnlyData(request: Types.UpdateUserDataRequest): Result<Types.UpdateUserDataResult, string>
	return makeApiCall(
		"/Admin/UpdateUserPublisherReadOnlyData",
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
	Documentation](https://docs.microsoft.com/rest/api/playfab/admin/playstream/getallsegments).

]]
function Apis.GetAllSegments(request: Types.GetAllSegmentsRequest): Result<Types.GetAllSegmentsResult, string>
	return makeApiCall(
		"/Admin/GetAllSegments",
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
	Documentation](https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/getuserinternaldata).

]]
function Apis.GetUserInternalData(request: Types.GetUserDataRequest): Result<Types.GetUserDataResult, string>
	return makeApiCall(
		"/Admin/GetUserInternalData",
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
	Documentation](https://docs.microsoft.com/rest/api/playfab/admin/playstream/getplayertags).

]]
function Apis.GetPlayerTags(request: Types.GetPlayerTagsRequest): Result<Types.GetPlayerTagsResult, string>
	return makeApiCall(
		"/Admin/GetPlayerTags",
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
	Documentation](https://docs.microsoft.com/rest/api/playfab/admin/playstream/getplayersinsegment).

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
		"/Admin/GetPlayersInSegment",
		request,
		"X-SecretKey"
	)
end

--[[
	Updates the title specific display name for a user

	In addition to the PlayFab username, titles can make use of a DisplayName
	which is also a unique identifier, but specific to the title. This allows
	for unique names which more closely match the theme or genre of a title, for
	example. This API enables changing that name, whether due to a customer
	request, an offensive name choice, etc.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/admin/account-management/updateusertitledisplayname).

	### Errors
	- InsufficientFunds
	- NameNotAvailable

]]
function Apis.UpdateUserTitleDisplayName(request: Types.UpdateUserTitleDisplayNameRequest): Result<Types.UpdateUserTitleDisplayNameResult, string>
	return makeApiCall(
		"/Admin/UpdateUserTitleDisplayName",
		request,
		"X-SecretKey"
	)
end

--[[
	Retrieves the key-value store of custom title settings which can be read by
	the client

	This API method is designed to return title specific values which can be
	read by the client. For example, a developer could choose to store values
	which modify the user experience, such as enemy spawn rates, weapon
	strengths, movement speeds, etc. This allows a developer to update the title
	without the need to create, test, and ship a new build. If an override label
	is specified in the request, the overrides are applied automatically and
	returned with the title data. Note that due to caching, there may up to a
	minute delay in between updating title data and a query returning the newest
	value.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/gettitledata).

]]
function Apis.GetTitleData(request: Types.GetTitleDataRequest): Result<Types.GetTitleDataResult, string>
	return makeApiCall(
		"/Admin/GetTitleData",
		request,
		"X-SecretKey"
	)
end

--[[
	Create a Insights Scheduled Scaling task, which can scale Insights
	Performance Units on a schedule

	Task name is unique within a title. Using a task name that's already taken
	will cause a name conflict error. Too many create-task requests within a
	short time will cause a create conflict error.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/admin/scheduledtask/createinsightsscheduledscalingtask).

	### Errors
	- InvalidScheduledTaskName
	- InvalidTaskSchedule
	- ScheduledTaskCreateConflict
	- ScheduledTaskNameConflict
	- TitleNotOnUpdatedPricingPlan

]]
function Apis.CreateInsightsScheduledScalingTask(request: Types.CreateInsightsScheduledScalingTaskRequest): Result<Types.CreateTaskResult, string>
	return makeApiCall(
		"/Admin/CreateInsightsScheduledScalingTask",
		request,
		"X-SecretKey"
	)
end

--[[
	Creates a new Player Shared Secret Key. It may take up to 5 minutes for this
	key to become generally available after this API returns.

	Player Shared Secret Keys are used for the call to Client/GetTitlePublicKey,
	which exchanges the shared secret for an RSA CSP blob to be used to encrypt
	the payload of account creation requests when that API requires a signature
	header.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/admin/authentication/createplayersharedsecret).

]]
function Apis.CreatePlayerSharedSecret(request: Types.CreatePlayerSharedSecretRequest): Result<Types.CreatePlayerSharedSecretResult, string>
	return makeApiCall(
		"/Admin/CreatePlayerSharedSecret",
		request,
		"X-SecretKey"
	)
end

--[[
	Retrieves a title-specific custom property value for a player.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/getplayercustomproperty).

	### Errors
	- PlayerCustomPropertiesPropertyDoesNotExist

]]
function Apis.GetPlayerCustomProperty(request: Types.GetPlayerCustomPropertyRequest): Result<Types.GetPlayerCustomPropertyResult, string>
	return makeApiCall(
		"/Admin/GetPlayerCustomProperty",
		request,
		"X-SecretKey"
	)
end

--[[
	Deletes title-specific custom properties for a player

	Deletes custom properties for the specified player. The list of provided
	property names must be non-empty.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/deleteplayercustomproperties).

	### Errors
	- PlayerCustomPropertiesVersionMismatch

]]
function Apis.DeletePlayerCustomProperties(request: Types.DeletePlayerCustomPropertiesRequest): Result<Types.DeletePlayerCustomPropertiesResult, string>
	return makeApiCall(
		"/Admin/DeletePlayerCustomProperties",
		request,
		"X-SecretKey"
	)
end

--[[
	Create a CloudScript task, which can run a CloudScript on a schedule.

	Task name is unique within a title. Using a task name that's already taken
	will cause a name conflict error. Too many create-task requests within a
	short time will cause a create conflict error.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/admin/scheduledtask/createcloudscripttask).

	### Errors
	- InvalidScheduledTaskName
	- InvalidTaskSchedule
	- ScheduledTaskCreateConflict
	- ScheduledTaskNameConflict

]]
function Apis.CreateCloudScriptTask(request: Types.CreateCloudScriptTaskRequest): Result<Types.CreateTaskResult, string>
	return makeApiCall(
		"/Admin/CreateCloudScriptTask",
		request,
		"X-SecretKey"
	)
end

--[[
	Retrieves the configuration information for all player statistics defined in
	the title, regardless of whether they have a reset interval.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/getplayerstatisticdefinitions).

]]
function Apis.GetPlayerStatisticDefinitions(request: Types.GetPlayerStatisticDefinitionsRequest): Result<Types.GetPlayerStatisticDefinitionsResult, string>
	return makeApiCall(
		"/Admin/GetPlayerStatisticDefinitions",
		request,
		"X-SecretKey"
	)
end

--[[
	Retrieves title-specific custom property values for a player.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/listplayercustomproperties).

]]
function Apis.ListPlayerCustomProperties(request: Types.ListPlayerCustomPropertiesRequest): Result<Types.ListPlayerCustomPropertiesResult, string>
	return makeApiCall(
		"/Admin/ListPlayerCustomProperties",
		request,
		"X-SecretKey"
	)
end

--[[
	Create an ActionsOnPlayersInSegment task, which iterates through all players
	in a segment to execute action.

	Task name is unique within a title. Using a task name that's already taken
	will cause a name conflict error. Too many create-task requests within a
	short time will cause a create conflict error.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/admin/scheduledtask/createactionsonplayersinsegmenttask).

	### Errors
	- CloudScriptAzureFunctionsArgumentSizeExceeded
	- InvalidJSONContent
	- InvalidParams
	- InvalidScheduledTaskName
	- InvalidTaskSchedule
	- InvalidVirtualCurrencyCode
	- OverLimit
	- PushNotEnabledForAccount
	- PushNotificationTemplateInvalidSyntax
	- PushNotificationTemplateNotFound
	- ScheduledTaskCreateConflict
	- ScheduledTaskNameConflict
	- StatisticNotFound

]]
function Apis.CreateActionsOnPlayersInSegmentTask(request: Types.CreateActionsOnPlayerSegmentTaskRequest): Result<Types.CreateTaskResult, string>
	return makeApiCall(
		"/Admin/CreateActionsOnPlayersInSegmentTask",
		request,
		"X-SecretKey"
	)
end

--[[
	Gets a player's ID from an auth token.

	Gets a player ID from an auth token. The token expires after 30 minutes and
	cannot be used to look up a player when expired.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/admin/account-management/getplayeridfromauthtoken).

	### Errors
	- AuthTokenDoesNotExist

]]
function Apis.GetPlayerIdFromAuthToken(request: Types.GetPlayerIdFromAuthTokenRequest): Result<Types.GetPlayerIdFromAuthTokenResult, string>
	return makeApiCall(
		"/Admin/GetPlayerIdFromAuthToken",
		request,
		"X-SecretKey"
	)
end

--[[
	Updates a existing Player Shared Secret Key. It may take up to 5 minutes for
	this update to become generally available after this API returns.

	Player Shared Secret Keys are used for the call to Client/GetTitlePublicKey,
	which exchanges the shared secret for an RSA CSP blob to be used to encrypt
	the payload of account creation requests when that API requires a signature
	header.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/admin/authentication/updateplayersharedsecret).

]]
function Apis.UpdatePlayerSharedSecret(request: Types.UpdatePlayerSharedSecretRequest): Result<Types.UpdatePlayerSharedSecretResult, string>
	return makeApiCall(
		"/Admin/UpdatePlayerSharedSecret",
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
	Documentation](https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/getuserpublisherreadonlydata).

]]
function Apis.GetUserPublisherReadOnlyData(request: Types.GetUserDataRequest): Result<Types.GetUserDataResult, string>
	return makeApiCall(
		"/Admin/GetUserPublisherReadOnlyData",
		request,
		"X-SecretKey"
	)
end

--[[
	Deletes an existing Player Shared Secret Key. It may take up to 5 minutes
	for this delete to be reflected after this API returns.

	Player Shared Secret Keys are used for the call to Client/GetTitlePublicKey,
	which exchanges the shared secret for an RSA CSP blob to be used to encrypt
	the payload of account creation requests when that API requires a signature
	header.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/admin/authentication/deleteplayersharedsecret).

]]
function Apis.DeletePlayerSharedSecret(request: Types.DeletePlayerSharedSecretRequest): Result<Types.DeletePlayerSharedSecretResult, string>
	return makeApiCall(
		"/Admin/DeletePlayerSharedSecret",
		request,
		"X-SecretKey"
	)
end

--[[
	Retrieves the key-value store of custom publisher settings

	This API is designed to return publisher-specific values which can be read,
	but not written to, by the client. This data is shared across all titles
	assigned to a particular publisher, and can be used for cross-game
	coordination. Only titles assigned to a publisher can use this API. For more
	information email helloplayfab@microsoft.com. This AdminAPI call for getting
	title data guarantees no delay in between update and retrieval of newly set
	data.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/getpublisherdata).

	### Errors
	- PublisherNotSet

]]
function Apis.GetPublisherData(request: Types.GetPublisherDataRequest): Result<Types.GetPublisherDataResult, string>
	return makeApiCall(
		"/Admin/GetPublisherData",
		request,
		"X-SecretKey"
	)
end

--[[
	Deletes PlayStream and telemetry event data associated with the master
	player account from PlayFab storage

	Deletes any PlayStream or telemetry event associated with the player from
	PlayFab. Note, this API queues the data for asynchronous deletion. It may
	take some time before the data is deleted.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/admin/account-management/deletemasterplayereventdata).

]]
function Apis.DeleteMasterPlayerEventData(request: Types.DeleteMasterPlayerEventDataRequest): Result<Types.DeleteMasterPlayerEventDataResult, string>
	return makeApiCall(
		"/Admin/DeleteMasterPlayerEventData",
		request,
		"X-SecretKey"
	)
end

--[[
	_NOTE: This is a Legacy Economy API, and is in bugfix-only mode. All new
	Economy features are being developed only for version 2._ Retrieves the set
	of items defined for the specified store, including all prices defined

	A store contains an array of references to items defined in the catalog,
	along with the prices for the item, in both real world and virtual
	currencies. These prices act as an override to any prices defined in the
	catalog. In this way, the base definitions of the items may be defined in
	the catalog, with all associated properties, while the pricing can be set
	for each store, as needed. This allows for subsets of goods to be defined
	for different purposes (in order to simplify showing some, but not all
	catalog items to users, based upon different characteristics), along with
	unique prices. Note that all prices defined in the catalog and store
	definitions for the item are considered valid, and that a compromised client
	can be made to send a request for an item based upon any of these
	definitions. If no price is specified in the store for an item, the price
	set in the catalog should be displayed to the user.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/getstoreitems).

	### Errors
	- CatalogNotConfigured
	- StoreNotFound

]]
function Apis.GetStoreItems(request: Types.GetStoreItemsRequest): Result<Types.GetStoreItemsResult, string>
	return makeApiCall(
		"/Admin/GetStoreItems",
		request,
		"X-SecretKey"
	)
end

--[[
	_NOTE: This is a Legacy Economy API, and is in bugfix-only mode. All new
	Economy features are being developed only for version 2._ Removes one or
	more virtual currencies from the set defined for the title.

	Virtual currencies to be removed cannot have entries in any catalog nor
	store for the title. Note that this operation will not remove player
	balances for the removed currencies; if a deleted currency is recreated at
	any point, user balances will be in an undefined state.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/removevirtualcurrencytypes).

	### Errors
	- InvalidVirtualCurrencyCode
	- VirtualCurrencyCannotBeDeleted

]]
function Apis.RemoveVirtualCurrencyTypes(request: Types.RemoveVirtualCurrencyTypesRequest): Result<Types.BlankResult, string>
	return makeApiCall(
		"/Admin/RemoveVirtualCurrencyTypes",
		request,
		"X-SecretKey"
	)
end

--[[
	Get definition information on a specified task or all tasks within a title.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/admin/scheduledtask/gettasks).

]]
function Apis.GetTasks(request: Types.GetTasksRequest): Result<Types.GetTasksResult, string>
	return makeApiCall(
		"/Admin/GetTasks",
		request,
		"X-SecretKey"
	)
end

--[[
	Retrieves the result of an export started by ExportPlayersInSegment API. If
	the ExportPlayersInSegment is successful and complete, this API returns the
	IndexUrl from which the index file can be downloaded. The index file has a
	list of urls from which the files containing the player profile data can be
	downloaded. Otherwise, it returns the current 'State' of the export

	Request must contain the ExportId

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/admin/playstream/getsegmentexport).

	### Errors
	- AsyncExportNotInFlight
	- AsyncExportRateLimitExceeded
	- ExportNotFound
	- ExportUnknownError
	- InvalidSegment

]]
function Apis.GetSegmentExport(request: Types.GetPlayersInSegmentExportRequest): Result<Types.GetPlayersInSegmentExportResponse, string>
	return makeApiCall(
		"/Admin/GetSegmentExport",
		request,
		"X-SecretKey"
	)
end

--[[
	Gets the contents and information of a specific Cloud Script revision.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/admin/server-side-cloud-script/getcloudscriptrevision).

	### Errors
	- RevisionNotFound
	- VersionNotFound

]]
function Apis.GetCloudScriptRevision(request: Types.GetCloudScriptRevisionRequest): Result<Types.GetCloudScriptRevisionResult, string>
	return makeApiCall(
		"/Admin/GetCloudScriptRevision",
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
	Documentation](https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/updateuserdata).

]]
function Apis.UpdateUserData(request: Types.UpdateUserDataRequest): Result<Types.UpdateUserDataResult, string>
	return makeApiCall(
		"/Admin/UpdateUserData",
		request,
		"X-SecretKey"
	)
end

--[[
	Removes a relationship between a title and an OpenID Connect provider.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/admin/authentication/deleteopenidconnection).

]]
function Apis.DeleteOpenIdConnection(request: Types.DeleteOpenIdConnectionRequest): Result<Types.EmptyResponse, string>
	return makeApiCall(
		"/Admin/DeleteOpenIdConnection",
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
	Documentation](https://docs.microsoft.com/rest/api/playfab/admin/account-management/revokebans).

]]
function Apis.RevokeBans(request: Types.RevokeBansRequest): Result<Types.RevokeBansResult, string>
	return makeApiCall(
		"/Admin/RevokeBans",
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
	in the user's current inventory, and so will not be not included. There can
	be a delay of up to a half a second for inventory changes to be reflected in
	the GetUserInventory API response.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/admin/player-item-management/getuserinventory).

]]
function Apis.GetUserInventory(request: Types.GetUserInventoryRequest): Result<Types.GetUserInventoryResult, string>
	return makeApiCall(
		"/Admin/GetUserInventory",
		request,
		"X-SecretKey"
	)
end

--[[
	Query for task instances by task, status, or time range.

	Only the most recent 100 task instances are returned, ordered by start time
	descending. The results are generic basic information for task instances. To
	get detail information specific to each task type, use Get*TaskInstance
	based on its corresponding task type.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/admin/scheduledtask/gettaskinstances).

	### Errors
	- TaskNotFound

]]
function Apis.GetTaskInstances(request: Types.GetTaskInstancesRequest): Result<Types.GetTaskInstancesResult, string>
	return makeApiCall(
		"/Admin/GetTaskInstances",
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
	Documentation](https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/updateuserreadonlydata).

]]
function Apis.UpdateUserReadOnlyData(request: Types.UpdateUserDataRequest): Result<Types.UpdateUserDataResult, string>
	return makeApiCall(
		"/Admin/UpdateUserReadOnlyData",
		request,
		"X-SecretKey"
	)
end

--[[
	Permanently deletes a title and all associated configuration

	Deletes all data associated with the title, including catalog, virtual
	currencies, leaderboard statistics, Cloud Script revisions, segment
	definitions, event rules, tasks, add-ons, secret keys, data encryption keys,
	and permission policies. Removes the title from its studio and removes all
	associated developer roles and permissions. Does not delete PlayStream event
	history associated with the title. Note, this API queues the title for
	deletion and returns immediately. It may take several hours or more before
	all title data is fully deleted. All player accounts in the title must be
	deleted before deleting the title. If any player accounts exist, the API
	will return a 'TitleContainsUserAccounts' error. Until the title data is
	fully deleted, attempts to call APIs with the title will fail with the
	'TitleDeleted' error.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/admin/account-management/deletetitle).

	### Errors
	- TitleContainsUserAccounts

]]
function Apis.DeleteTitle(request: Types.DeleteTitleRequest): Result<Types.DeleteTitleResult, string>
	return makeApiCall(
		"/Admin/DeleteTitle",
		request,
		"X-SecretKey"
	)
end

--[[
	_NOTE: This is a Legacy Economy API, and is in bugfix-only mode. All new
	Economy features are being developed only for version 2._ Attempts to
	process an order refund through the original real money payment provider.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/refundpurchase).

]]
function Apis.RefundPurchase(request: Types.RefundPurchaseRequest): Result<Types.RefundPurchaseResponse, string>
	return makeApiCall(
		"/Admin/RefundPurchase",
		request,
		"X-SecretKey"
	)
end

--[[
	Deletes a specified set of title data overrides.

	Will delete all the title data associated with the given override label.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/deletetitledataoverride).

	### Errors
	- TitleDataOverrideNotFound

]]
function Apis.DeleteTitleDataOverride(request: Types.DeleteTitleDataOverrideRequest): Result<Types.DeleteTitleDataOverrideResult, string>
	return makeApiCall(
		"/Admin/DeleteTitleDataOverride",
		request,
		"X-SecretKey"
	)
end

--[[
	Get information about a ActionsOnPlayersInSegment task instance.

	The result includes detail information that's specific to a CloudScript
	task. Only CloudScript tasks configured as "Run Cloud Script function once"
	will be retrieved. To get a list of task instances by task, status, or time
	range, use GetTaskInstances.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/admin/scheduledtask/getactionsonplayersinsegmenttaskinstance).

	### Errors
	- TaskInstanceNotFound

]]
function Apis.GetActionsOnPlayersInSegmentTaskInstance(request: Types.GetTaskInstanceRequest): Result<Types.GetActionsOnPlayersInSegmentTaskInstanceResult, string>
	return makeApiCall(
		"/Admin/GetActionsOnPlayersInSegmentTaskInstance",
		request,
		"X-SecretKey"
	)
end

--[[
	Lists all the current cloud script versions. For each version, information
	about the current published and latest revisions is also listed.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/admin/server-side-cloud-script/getcloudscriptversions).

]]
function Apis.GetCloudScriptVersions(request: Types.GetCloudScriptVersionsRequest): Result<Types.GetCloudScriptVersionsResult, string>
	return makeApiCall(
		"/Admin/GetCloudScriptVersions",
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
	Documentation](https://docs.microsoft.com/rest/api/playfab/admin/player-item-management/grantitemstousers).

	### Errors
	- AccountNotFound
	- CatalogNotConfigured

]]
function Apis.GrantItemsToUsers(request: Types.GrantItemsToUsersRequest): Result<Types.GrantItemsToUsersResult, string>
	return makeApiCall(
		"/Admin/GrantItemsToUsers",
		request,
		"X-SecretKey"
	)
end

--[[
	_NOTE: This is a Legacy Economy API, and is in bugfix-only mode. All new
	Economy features are being developed only for version 2._ Sets all the items
	in one virtual store

	When used for SetStoreItems, this operation is not additive. Using it will
	cause the indicated virtual store to be created from scratch. If there is an
	existing store with the same storeId, it will be deleted and replaced with
	only the items specified in this call. When used for UpdateStoreItems, this
	operation is additive. Items with ItemId values not currently in the store
	will be added, while those with ItemId values matching items currently in
	the catalog will overwrite those items with the given values. In both cases,
	a store contains an array of references to items defined in the catalog,
	along with the prices for the item, in both real world and virtual
	currencies. These prices act as an override to any prices defined in the
	catalog. In this way, the base definitions of the items may be defined in
	the catalog, with all associated properties, while the pricing can be set
	for each store, as needed. This allows for subsets of goods to be defined
	for different purposes (in order to simplify showing some, but not all
	catalog items to users, based upon different characteristics), along with
	unique prices. Note that all prices defined in the catalog and store
	definitions for the item are considered valid, and that a compromised client
	can be made to send a request for an item based upon any of these
	definitions. If no price is specified in the store for an item, the price
	set in the catalog should be displayed to the user.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/setstoreitems).

	### Errors
	- CatalogNotConfigured
	- InvalidItemId
	- InvalidJSONContent

]]
function Apis.SetStoreItems(request: Types.UpdateStoreItemsRequest): Result<Types.UpdateStoreItemsResult, string>
	return makeApiCall(
		"/Admin/SetStoreItems",
		request,
		"X-SecretKey"
	)
end

--[[
	Returns all Player Shared Secret Keys including disabled and expired.

	Player Shared Secret Keys are used for the call to Client/GetTitlePublicKey,
	which exchanges the shared secret for an RSA CSP blob to be used to encrypt
	the payload of account creation requests when that API requires a signature
	header.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/admin/authentication/getplayersharedsecrets).

]]
function Apis.GetPlayerSharedSecrets(request: Types.GetPlayerSharedSecretsRequest): Result<Types.GetPlayerSharedSecretsResult, string>
	return makeApiCall(
		"/Admin/GetPlayerSharedSecrets",
		request,
		"X-SecretKey"
	)
end

--[[
	Retrieves the relevant details for a specified user, based upon a match
	against a supplied unique identifier

	This API allows for access to details regarding a user in the PlayFab
	service, usually for purposes of customer support. Note that data returned
	may be Personally Identifying Information (PII), such as email address, and
	so care should be taken in how this data is stored and managed. Since this
	call will always return the relevant information for users who have accessed
	the title, the recommendation is to not store this data locally.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/admin/account-management/getuseraccountinfo).

	### Errors
	- TitleNotActivated

]]
function Apis.GetUserAccountInfo(request: Types.LookupUserAccountInfoRequest): Result<Types.LookupUserAccountInfoResult, string>
	return makeApiCall(
		"/Admin/GetUserAccountInfo",
		request,
		"X-SecretKey"
	)
end

--[[
	Get the list of titles that the player has played

	Useful for identifying titles of which the player's data will be deleted by
	DeleteMasterPlayer.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/admin/account-management/getplayedtitlelist).

]]
function Apis.GetPlayedTitleList(request: Types.GetPlayedTitleListRequest): Result<Types.GetPlayedTitleListResult, string>
	return makeApiCall(
		"/Admin/GetPlayedTitleList",
		request,
		"X-SecretKey"
	)
end

--[[
	_NOTE: This is a Legacy Economy API, and is in bugfix-only mode. All new
	Economy features are being developed only for version 2._ Creates the
	catalog configuration of all virtual goods for the specified catalog version

	When used for SetCatalogItems, this operation is not additive. Using it will
	cause the indicated catalog version to be created from scratch. If there is
	an existing catalog with the version number in question, it will be deleted
	and replaced with only the items specified in this call. When used for
	UpdateCatalogItems, this operation is additive. Items with ItemId values not
	currently in the catalog will be added, while those with ItemId values
	matching items currently in the catalog will overwrite those items with the
	given values.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/setcatalogitems).

	### Errors
	- InvalidDropTable
	- InvalidItemId
	- InvalidItemProperties
	- InvalidJSONContent

]]
function Apis.SetCatalogItems(request: Types.UpdateCatalogItemsRequest): Result<Types.UpdateCatalogItemsResult, string>
	return makeApiCall(
		"/Admin/SetCatalogItems",
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
	Documentation](https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/getuserdata).

]]
function Apis.GetUserData(request: Types.GetUserDataRequest): Result<Types.GetUserDataResult, string>
	return makeApiCall(
		"/Admin/GetUserData",
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
	Documentation](https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/updateuserpublisherdata).

	### Errors
	- PublisherNotSet

]]
function Apis.UpdateUserPublisherData(request: Types.UpdateUserDataRequest): Result<Types.UpdateUserDataResult, string>
	return makeApiCall(
		"/Admin/UpdateUserPublisherData",
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
	Documentation](https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/getuserpublisherdata).

]]
function Apis.GetUserPublisherData(request: Types.GetUserDataRequest): Result<Types.GetUserDataResult, string>
	return makeApiCall(
		"/Admin/GetUserPublisherData",
		request,
		"X-SecretKey"
	)
end

--[[
	List all contents of the title and get statistics such as size

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/admin/content/getcontentlist).

	### Errors
	- ContentS3OriginBucketNotConfigured

]]
function Apis.GetContentList(request: Types.GetContentListRequest): Result<Types.GetContentListResult, string>
	return makeApiCall(
		"/Admin/GetContentList",
		request,
		"X-SecretKey"
	)
end

--[[
	Sets the currently published revision of a title Cloud Script

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/admin/server-side-cloud-script/setpublishedrevision).

	### Errors
	- RevisionNotFound
	- VersionNotFound

]]
function Apis.SetPublishedRevision(request: Types.SetPublishedRevisionRequest): Result<Types.SetPublishedRevisionResult, string>
	return makeApiCall(
		"/Admin/SetPublishedRevision",
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
	Documentation](https://docs.microsoft.com/rest/api/playfab/admin/account-management/updatebans).

]]
function Apis.UpdateBans(request: Types.UpdateBansRequest): Result<Types.UpdateBansResult, string>
	return makeApiCall(
		"/Admin/UpdateBans",
		request,
		"X-SecretKey"
	)
end

--[[
	_NOTE: This is a Legacy Economy API, and is in bugfix-only mode. All new
	Economy features are being developed only for version 2._ Deletes an
	existing virtual item store

	This non-reversible operation will permanently delete the requested store.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/deletestore).

	### Errors
	- CatalogNotConfigured
	- StoreNotFound

]]
function Apis.DeleteStore(request: Types.DeleteStoreRequest): Result<Types.DeleteStoreResult, string>
	return makeApiCall(
		"/Admin/DeleteStore",
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
	Documentation](https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/getuserreadonlydata).

]]
function Apis.GetUserReadOnlyData(request: Types.GetUserDataRequest): Result<Types.GetUserDataResult, string>
	return makeApiCall(
		"/Admin/GetUserReadOnlyData",
		request,
		"X-SecretKey"
	)
end

--[[
	Gets the requested policy.

	Views the requested policy. Today, the only supported policy is 'ApiPolicy'.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/admin/authentication/getpolicy).

]]
function Apis.GetPolicy(request: Types.GetPolicyRequest): Result<Types.GetPolicyResponse, string>
	return makeApiCall(
		"/Admin/GetPolicy",
		request,
		"X-SecretKey"
	)
end

--[[
	Starts an export for the player profiles in a segment. This API creates a
	snapshot of all the player profiles which match the segment definition at
	the time of the API call. Profiles which change while an export is in
	progress will not be reflected in the results.

	Request must contain the Segment ID

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/admin/playstream/exportplayersinsegment).

	### Errors
	- AsyncExportNotInFlight
	- AsyncExportRateLimitExceeded
	- ExportUnknownError
	- InvalidSegment
	- SegmentNotFound

]]
function Apis.ExportPlayersInSegment(request: Types.ExportPlayersInSegmentRequest): Result<Types.ExportPlayersInSegmentResult, string>
	return makeApiCall(
		"/Admin/ExportPlayersInSegment",
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
	Documentation](https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/updateuserinternaldata).

]]
function Apis.UpdateUserInternalData(request: Types.UpdateUserInternalDataRequest): Result<Types.UpdateUserDataResult, string>
	return makeApiCall(
		"/Admin/UpdateUserInternalData",
		request,
		"X-SecretKey"
	)
end

--[[
	Registers a relationship between a title and an Open ID Connect provider.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/admin/authentication/createopenidconnection).

	### Errors
	- ValueAlreadyExists

]]
function Apis.CreateOpenIdConnection(request: Types.CreateOpenIdConnectionRequest): Result<Types.EmptyResponse, string>
	return makeApiCall(
		"/Admin/CreateOpenIdConnection",
		request,
		"X-SecretKey"
	)
end

--[[
	Get detail information about a CloudScript task instance.

	The result includes detail information that's specific to a CloudScript
	task. Only CloudScript tasks configured as "Run Cloud Script function once"
	will be retrieved. To get a list of task instances by task, status, or time
	range, use GetTaskInstances.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/admin/scheduledtask/getcloudscripttaskinstance).

	### Errors
	- TaskInstanceNotFound

]]
function Apis.GetCloudScriptTaskInstance(request: Types.GetTaskInstanceRequest): Result<Types.GetCloudScriptTaskInstanceResult, string>
	return makeApiCall(
		"/Admin/GetCloudScriptTaskInstance",
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
	Documentation](https://docs.microsoft.com/rest/api/playfab/admin/account-management/getplayerprofile).

	### Errors
	- PlayerNotInGame

]]
function Apis.GetPlayerProfile(request: Types.GetPlayerProfileRequest): Result<Types.GetPlayerProfileResult, string>
	return makeApiCall(
		"/Admin/GetPlayerProfile",
		request,
		"X-SecretKey"
	)
end

--[[
	Delete a content file from the title. When deleting a file that does not
	exist, it returns success.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/admin/content/deletecontent).

]]
function Apis.DeleteContent(request: Types.DeleteContentRequest): Result<Types.BlankResult, string>
	return makeApiCall(
		"/Admin/DeleteContent",
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
	Documentation](https://docs.microsoft.com/rest/api/playfab/admin/account-management/banusers).

	### Errors
	- UserisNotValid

]]
function Apis.BanUsers(request: Types.BanUsersRequest): Result<Types.BanUsersResult, string>
	return makeApiCall(
		"/Admin/BanUsers",
		request,
		"X-SecretKey"
	)
end

--[[
	Removes a master player account entirely from all titles and deletes all
	associated data

	Deletes all data associated with the master player account, including data
	from all titles the player has played, such as statistics, custom data,
	inventory, purchases, virtual currency balances, characters, group
	memberships, publisher data, credential data, account linkages, friends
	list, PlayStream event data, and telemetry event data. Removes the player
	from all leaderboards and player search indexes. Note, this API queues the
	player for deletion and returns a receipt immediately. Record the receipt ID
	for future reference. It may take some time before all player data is fully
	deleted. Upon completion of the deletion, an email will be sent to the
	notification email address configured for the title confirming the deletion.
	Until the player data is fully deleted, attempts to recreate the player with
	the same user account in the same title will fail with the 'AccountDeleted'
	error. It is highly recommended to know the impact of the deletion by
	calling GetPlayedTitleList, before calling this API.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/admin/account-management/deletemasterplayeraccount).

]]
function Apis.DeleteMasterPlayerAccount(request: Types.DeleteMasterPlayerAccountRequest): Result<Types.DeleteMasterPlayerAccountResult, string>
	return makeApiCall(
		"/Admin/DeleteMasterPlayerAccount",
		request,
		"X-SecretKey"
	)
end

--[[
	Updates an existing player segment and its associated definition(s) and
	action(s) for a title.

	Update segment properties data which are planning to update

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/admin/segments/updatesegment).

	### Errors
	- InvalidSegment
	- NameNotAvailable
	- SegmentManagementInvalidInput
	- SegmentManagementInvalidSegmentId
	- SegmentManagementInvalidSegmentName
	- SegmentManagementNoExpressionTree
	- SegmentManagementSegmentCountOverLimit
	- SegmentManagementTriggerActionCountOverLimit
	- UnknownError
	- UpdateSegmentRateLimitExceeded

]]
function Apis.UpdateSegment(request: Types.UpdateSegmentRequest): Result<Types.UpdateSegmentResponse, string>
	return makeApiCall(
		"/Admin/UpdateSegment",
		request,
		"X-SecretKey"
	)
end

--[[
	Deletes an existing player segment and its associated action(s) for a title.

	Send segment id planning to delete part of DeleteSegmentRequest object

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/admin/segments/deletesegment).

	### Errors
	- SegmentManagementInvalidSegmentId
	- UnknownError

]]
function Apis.DeleteSegment(request: Types.DeleteSegmentRequest): Result<Types.DeleteSegmentsResponse, string>
	return makeApiCall(
		"/Admin/DeleteSegment",
		request,
		"X-SecretKey"
	)
end

--[[
	Resets the indicated statistic, removing all player entries for it and
	backing up the old values.

	Statistics are numeric values, with each statistic in the title also
	generating a leaderboard. When this call is made on a given statistic, this
	forces a reset of that statistic. Upon reset, the statistic updates to a new
	version with no values (effectively removing all players from the
	leaderboard). The previous version's statistic values are also archived for
	retrieval, if needed (see GetPlayerStatisticVersions). Statistics not
	created via a call to CreatePlayerStatisticDefinition by default have a
	VersionChangeInterval of Never, meaning they do not reset on a schedule, but
	they can be set to do so via a call to UpdatePlayerStatisticDefinition. Once
	a statistic has been reset (sometimes referred to as versioned or
	incremented), the now-previous version can still be written to for up a
	short, pre-defined period (currently 10 seconds), to prevent issues with
	levels completing around the time of the reset. Also, once reset, the
	historical statistics for players in the title may be retrieved using the
	URL specified in the version information (GetPlayerStatisticVersions).

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/incrementplayerstatisticversion).

	### Errors
	- StatisticNotFound
	- StatisticUpdateInProgress
	- StatisticVersionIncrementRateExceeded

]]
function Apis.IncrementPlayerStatisticVersion(request: Types.IncrementPlayerStatisticVersionRequest): Result<Types.IncrementPlayerStatisticVersionResult, string>
	return makeApiCall(
		"/Admin/IncrementPlayerStatisticVersion",
		request,
		"X-SecretKey"
	)
end

--[[
	Retrieves a list of all Open ID Connect providers registered to a title.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/admin/authentication/listopenidconnection).

]]
function Apis.ListOpenIdConnection(request: Types.ListOpenIdConnectionRequest): Result<Types.ListOpenIdConnectionResponse, string>
	return makeApiCall(
		"/Admin/ListOpenIdConnection",
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
	Documentation](https://docs.microsoft.com/rest/api/playfab/admin/playstream/removeplayertag).

]]
function Apis.RemovePlayerTag(request: Types.RemovePlayerTagRequest): Result<Types.RemovePlayerTagResult, string>
	return makeApiCall(
		"/Admin/RemovePlayerTag",
		request,
		"X-SecretKey"
	)
end

--[[
	Completely removes all statistics for the specified character, for the
	current game

	Note that this action cannot be un-done. All statistics for this character
	will be deleted, removing the user from all leaderboards for the game.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/admin/characters/resetcharacterstatistics).

]]
function Apis.ResetCharacterStatistics(request: Types.ResetCharacterStatisticsRequest): Result<Types.ResetCharacterStatisticsResult, string>
	return makeApiCall(
		"/Admin/ResetCharacterStatistics",
		request,
		"X-SecretKey"
	)
end

--[[
	Reset a player's password for a given title.

	Resets a player's password taking in a new password based and validating the
	user based off of a token sent to the playerto their email. The token
	expires after 30 minutes.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/admin/account-management/resetpassword).

	### Errors
	- AuthTokenAlreadyUsedToResetPassword
	- AuthTokenDoesNotExist
	- AuthTokenExpired
	- InvalidAuthToken
	- NoContactEmailAddressFound

]]
function Apis.ResetPassword(request: Types.ResetPasswordRequest): Result<Types.ResetPasswordResult, string>
	return makeApiCall(
		"/Admin/ResetPassword",
		request,
		"X-SecretKey"
	)
end

--[[
	_NOTE: This is a Legacy Economy API, and is in bugfix-only mode. All new
	Economy features are being developed only for version 2._ Attempts to
	resolve a dispute with the original order's payment provider.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/resolvepurchasedispute).

]]
function Apis.ResolvePurchaseDispute(request: Types.ResolvePurchaseDisputeRequest): Result<Types.ResolvePurchaseDisputeResponse, string>
	return makeApiCall(
		"/Admin/ResolvePurchaseDispute",
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
	Documentation](https://docs.microsoft.com/rest/api/playfab/admin/player-item-management/revokeinventoryitem).

	### Errors
	- ItemNotFound

]]
function Apis.RevokeInventoryItem(request: Types.RevokeInventoryItemRequest): Result<Types.RevokeInventoryResult, string>
	return makeApiCall(
		"/Admin/RevokeInventoryItem",
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
	Documentation](https://docs.microsoft.com/rest/api/playfab/admin/player-item-management/revokeinventoryitems).

	### Errors
	- ItemNotFound

]]
function Apis.RevokeInventoryItems(request: Types.RevokeInventoryItemsRequest): Result<Types.RevokeInventoryItemsResult, string>
	return makeApiCall(
		"/Admin/RevokeInventoryItems",
		request,
		"X-SecretKey"
	)
end

--[[
	Creates a new Cloud Script revision and uploads source code to it. Note that
	at this time, only one file should be submitted in the revision.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/admin/server-side-cloud-script/updatecloudscript).

	### Errors
	- JavascriptException
	- TitleDeleted

]]
function Apis.UpdateCloudScript(request: Types.UpdateCloudScriptRequest): Result<Types.UpdateCloudScriptResult, string>
	return makeApiCall(
		"/Admin/UpdateCloudScript",
		request,
		"X-SecretKey"
	)
end

--[[
	Forces an email to be sent to the registered email address for the user's
	account, with a link allowing the user to change the password.If an account
	recovery email template ID is provided, an email using the custom email
	template will be used.

	If the account in question is a "temporary" account (for example, one that
	was created via a call to LoginFromIOSDeviceID), thisfunction will have no
	effect. Only PlayFab accounts which have valid email addresses will be able
	to receive a password reset email using this API.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/admin/account-management/sendaccountrecoveryemail).

	### Errors
	- EmailRecipientBlacklisted
	- InvalidEmailAddress
	- NoContactEmailAddressFound
	- SmtpAddonNotEnabled

]]
function Apis.SendAccountRecoveryEmail(request: Types.SendAccountRecoveryEmailRequest): Result<Types.SendAccountRecoveryEmailResult, string>
	return makeApiCall(
		"/Admin/SendAccountRecoveryEmail",
		request,
		"X-SecretKey"
	)
end

--[[
	Retrieves the key-value store of custom title settings which cannot be read
	by the client

	This API method is designed to return title specific values which can be
	read by the client. For example, a developer could choose to store values
	which modify the user experience, such as enemy spawn rates, weapon
	strengths, movement speeds, etc. This allows a developer to update the title
	without the need to create, test, and ship a new build. If an override label
	is specified in the request, the overrides are applied automatically and
	returned with the title data. Note that due to caching, there may up to a
	minute delay in between updating title data and a query returning the newest
	value.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/gettitleinternaldata).

]]
function Apis.GetTitleInternalData(request: Types.GetTitleDataRequest): Result<Types.GetTitleDataResult, string>
	return makeApiCall(
		"/Admin/GetTitleInternalData",
		request,
		"X-SecretKey"
	)
end

--[[
	Retrieves the information on the available versions of the specified
	statistic.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/getplayerstatisticversions).

	### Errors
	- StatisticNotFound

]]
function Apis.GetPlayerStatisticVersions(request: Types.GetPlayerStatisticVersionsRequest): Result<Types.GetPlayerStatisticVersionsResult, string>
	return makeApiCall(
		"/Admin/GetPlayerStatisticVersions",
		request,
		"X-SecretKey"
	)
end

--[[
	Run a task immediately regardless of its schedule.

	The returned task instance ID can be used to query for task execution
	status.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/admin/scheduledtask/runtask).

	### Errors
	- TaskNotFound

]]
function Apis.RunTask(request: Types.RunTaskRequest): Result<Types.RunTaskResult, string>
	return makeApiCall(
		"/Admin/RunTask",
		request,
		"X-SecretKey"
	)
end

--[[
	_NOTE: This is a Legacy Economy API, and is in bugfix-only mode. All new
	Economy features are being developed only for version 2._ Updates the
	catalog configuration for virtual goods in the specified catalog version

	When used for SetCatalogItems, this operation is not additive. Using it will
	cause the indicated catalog version to be created from scratch. If there is
	an existing catalog with the version number in question, it will be deleted
	and replaced with only the items specified in this call. When used for
	UpdateCatalogItems, this operation is additive. Items with ItemId values not
	currently in the catalog will be added, while those with ItemId values
	matching items currently in the catalog will overwrite those items with the
	given values.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/updatecatalogitems).

	### Errors
	- InvalidDropTable
	- InvalidItemProperties
	- InvalidJSONContent

]]
function Apis.UpdateCatalogItems(request: Types.UpdateCatalogItemsRequest): Result<Types.UpdateCatalogItemsResult, string>
	return makeApiCall(
		"/Admin/UpdateCatalogItems",
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
	Documentation](https://docs.microsoft.com/rest/api/playfab/admin/shared-group-data/setpublisherdata).

	### Errors
	- PublisherNotSet

]]
function Apis.SetPublisherData(request: Types.SetPublisherDataRequest): Result<Types.SetPublisherDataResult, string>
	return makeApiCall(
		"/Admin/SetPublisherData",
		request,
		"X-SecretKey"
	)
end

--[[
	Update news item to include localized version

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/addlocalizednews).

	### Errors
	- TitleDefaultLanguageNotSet
	- TitleNewsDuplicateLanguage
	- TitleNewsInvalidLanguage
	- TitleNewsNotFound

]]
function Apis.AddLocalizedNews(request: Types.AddLocalizedNewsRequest): Result<Types.AddLocalizedNewsResult, string>
	return makeApiCall(
		"/Admin/AddLocalizedNews",
		request,
		"X-SecretKey"
	)
end

--[[
	Changes a policy for a title

	Updates permissions for your title. Policies affect what is allowed to
	happen on your title. Your policy is a collection of statements that,
	together, govern particular area for your title. Today, the only allowed
	policy is called 'ApiPolicy' and it governs what API calls are allowed. To
	verify that you have the latest version always download the current policy
	from GetPolicy before uploading a new policy. PlayFab updates the base
	policy periodically and will automatically apply it to the uploaded policy.
	Overwriting the combined policy blindly may result in unexpected API errors.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/admin/authentication/updatepolicy).

]]
function Apis.UpdatePolicy(request: Types.UpdatePolicyRequest): Result<Types.UpdatePolicyResponse, string>
	return makeApiCall(
		"/Admin/UpdatePolicy",
		request,
		"X-SecretKey"
	)
end

--[[
	Updates the key-value store of custom title settings which cannot be read by
	the client. These values can be used to tweak settings used by game servers
	and Cloud Scripts without the need to update and re-deploy.

	This operation is additive. If a Key does not exist in the current dataset,
	it will be added with the specified Value. If it already exists, the Value
	for that key will be overwritten with the new Value.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/settitleinternaldata).

	### Errors
	- DataLengthExceeded
	- TooManyKeys

]]
function Apis.SetTitleInternalData(request: Types.SetTitleDataRequest): Result<Types.SetTitleDataResult, string>
	return makeApiCall(
		"/Admin/SetTitleInternalData",
		request,
		"X-SecretKey"
	)
end

--[[
	_NOTE: This is a Legacy Economy API, and is in bugfix-only mode. All new
	Economy features are being developed only for version 2._ Increments the
	specified virtual currency by the stated amount

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/admin/player-item-management/adduservirtualcurrency).

	### Errors
	- InvalidVirtualCurrency
	- VirtualCurrencyCurrentlyUnavailable

]]
function Apis.AddUserVirtualCurrency(request: Types.AddUserVirtualCurrencyRequest): Result<Types.ModifyUserVirtualCurrencyResult, string>
	return makeApiCall(
		"/Admin/AddUserVirtualCurrency",
		request,
		"X-SecretKey"
	)
end

--[[
	Set and delete key-value pairs in a title data override instance.

	Will set the given key values in the specified override or the primary title
	data based on whether the label is provided or not.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/settitledataandoverrides).

	### Errors
	- DataLengthExceeded
	- DuplicateKeys
	- InvalidParams
	- TooManyKeys

]]
function Apis.SetTitleDataAndOverrides(request: Types.SetTitleDataAndOverridesRequest): Result<Types.SetTitleDataAndOverridesResult, string>
	return makeApiCall(
		"/Admin/SetTitleDataAndOverrides",
		request,
		"X-SecretKey"
	)
end

--[[
	Abort an ongoing task instance.

	If the task instance has already completed, there will be no-op.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/admin/scheduledtask/aborttaskinstance).

	### Errors
	- TaskInstanceNotFound

]]
function Apis.AbortTaskInstance(request: Types.AbortTaskInstanceRequest): Result<Types.EmptyResponse, string>
	return makeApiCall(
		"/Admin/AbortTaskInstance",
		request,
		"X-SecretKey"
	)
end

--[[
	Sets or resets the player's secret. Player secrets are used to sign API
	requests.

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
	Documentation](https://docs.microsoft.com/rest/api/playfab/admin/authentication/setplayersecret).

]]
function Apis.SetPlayerSecret(request: Types.SetPlayerSecretRequest): Result<Types.SetPlayerSecretResult, string>
	return makeApiCall(
		"/Admin/SetPlayerSecret",
		request,
		"X-SecretKey"
	)
end

--[[
	Modifies data and credentials for an existing relationship between a title
	and an Open ID Connect provider

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/admin/authentication/updateopenidconnection).

]]
function Apis.UpdateOpenIdConnection(request: Types.UpdateOpenIdConnectionRequest): Result<Types.EmptyResponse, string>
	return makeApiCall(
		"/Admin/UpdateOpenIdConnection",
		request,
		"X-SecretKey"
	)
end

--[[
	Sets the override expiration for a membership subscription

	This API lets developers set overrides for membership expirations,
	independent of any subscriptions setting it.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/admin/account-management/setmembershipoverride).

	### Errors
	- MembershipNotFound

]]
function Apis.SetMembershipOverride(request: Types.SetMembershipOverrideRequest): Result<Types.SetMembershipOverrideResult, string>
	return makeApiCall(
		"/Admin/SetMembershipOverride",
		request,
		"X-SecretKey"
	)
end

--[[
	_NOTE: This is a Legacy Economy API, and is in bugfix-only mode. All new
	Economy features are being developed only for version 2._ Checks the global
	count for the limited edition item.

	This returns the total number of these items available.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/admin/player-item-management/checklimitededitionitemavailability).

]]
function Apis.CheckLimitedEditionItemAvailability(request: Types.CheckLimitedEditionItemAvailabilityRequest): Result<Types.CheckLimitedEditionItemAvailabilityResult, string>
	return makeApiCall(
		"/Admin/CheckLimitedEditionItemAvailability",
		request,
		"X-SecretKey"
	)
end

--[[
	Retrieves the pre-signed URL for uploading a content file. A subsequent HTTP
	PUT to the returned URL uploads the content. Also, please be aware that the
	Content service is specifically PlayFab's CDN offering, for which standard
	CDN rates apply.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/admin/content/getcontentuploadurl).

	### Errors
	- BillingInformationRequired
	- ContentQuotaExceeded
	- NotAuthorized

]]
function Apis.GetContentUploadUrl(request: Types.GetContentUploadUrlRequest): Result<Types.GetContentUploadUrlResult, string>
	return makeApiCall(
		"/Admin/GetContentUploadUrl",
		request,
		"X-SecretKey"
	)
end

--[[
	Sets the Amazon Resource Name (ARN) for iOS and Android push notifications.
	Documentation on the exact restrictions can be found at:
	http://docs.aws.amazon.com/sns/latest/api/API_CreatePlatformApplication.html.
	Currently, Amazon device Messaging is not supported.

	When using the Apple Push Notification service (APNS) or the development
	version (APNS_SANDBOX), the APNS Private Key should be used as the
	Credential in this call. With Google Cloud Messaging (GCM), the Android API
	Key should be used. The current ARN (if one exists) can be overwritten by
	setting the OverwriteOldARN boolean to true.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/setuppushnotification).

	### Errors
	- PushServiceError
	- ValueAlreadyExists

]]
function Apis.SetupPushNotification(request: Types.SetupPushNotificationRequest): Result<Types.SetupPushNotificationResult, string>
	return makeApiCall(
		"/Admin/SetupPushNotification",
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
	will fail with the 'AccountDeleted' error.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/admin/account-management/deleteplayer).

]]
function Apis.DeletePlayer(request: Types.DeletePlayerRequest): Result<Types.DeletePlayerResult, string>
	return makeApiCall(
		"/Admin/DeletePlayer",
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
	Documentation](https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/getcatalogitems).

]]
function Apis.GetCatalogItems(request: Types.GetCatalogItemsRequest): Result<Types.GetCatalogItemsResult, string>
	return makeApiCall(
		"/Admin/GetCatalogItems",
		request,
		"X-SecretKey"
	)
end

--[[
	_NOTE: This is a Legacy Economy API, and is in bugfix-only mode. All new
	Economy features are being developed only for version 2._ Retuns the list of
	all defined virtual currencies for the title

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/listvirtualcurrencytypes).

]]
function Apis.ListVirtualCurrencyTypes(request: Types.ListVirtualCurrencyTypesRequest): Result<Types.ListVirtualCurrencyTypesResult, string>
	return makeApiCall(
		"/Admin/ListVirtualCurrencyTypes",
		request,
		"X-SecretKey"
	)
end

--[[
	Creates and updates the key-value store of custom title settings which can
	be read by the client. For example, a developer could choose to store values
	which modify the user experience, such as enemy spawn rates, weapon
	strengths, movement speeds, etc. This allows a developer to update the title
	without the need to create, test, and ship a new build.

	This operation is additive. If a Key does not exist in the current dataset,
	it will be added with the specified Value. If it already exists, the Value
	for that key will be overwritten with the new Value.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/settitledata).

	### Errors
	- DataLengthExceeded
	- TooManyKeys

]]
function Apis.SetTitleData(request: Types.SetTitleDataRequest): Result<Types.SetTitleDataResult, string>
	return makeApiCall(
		"/Admin/SetTitleData",
		request,
		"X-SecretKey"
	)
end

--[[
	Completely removes all statistics for the specified user, for the current
	game

	Note that this action cannot be un-done. All statistics for this user will
	be deleted, removing the user from all leaderboards for the game.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/resetuserstatistics).

]]
function Apis.ResetUserStatistics(request: Types.ResetUserStatisticsRequest): Result<Types.ResetUserStatisticsResult, string>
	return makeApiCall(
		"/Admin/ResetUserStatistics",
		request,
		"X-SecretKey"
	)
end

--[[
	Adds a new news item to the title's news feed

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/addnews).

	### Errors
	- TitleNewsItemCountLimitExceeded

]]
function Apis.AddNews(request: Types.AddNewsRequest): Result<Types.AddNewsResult, string>
	return makeApiCall(
		"/Admin/AddNews",
		request,
		"X-SecretKey"
	)
end

--[[
	Exports all associated data of a master player account

	Exports all data associated with the master player account, including data
	from all titles the player has played, such as statistics, custom data,
	inventory, purchases, virtual currency balances, characters, group
	memberships, publisher data, credential data, account linkages, friends
	list, PlayStream event data, and telemetry event data. Note, this API queues
	the player for export and returns a receipt immediately. Record the receipt
	ID for future reference. It may take some time before the export is
	available for download. Upon completion of the export, an email containing
	the URL to download the export dump will be sent to the notification email
	address configured for the title.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/admin/account-management/exportmasterplayerdata).

	### Errors
	- EmailAddressNotAvailable

]]
function Apis.ExportMasterPlayerData(request: Types.ExportMasterPlayerDataRequest): Result<Types.ExportMasterPlayerDataResult, string>
	return makeApiCall(
		"/Admin/ExportMasterPlayerData",
		request,
		"X-SecretKey"
	)
end

--[[
	Update an existing task.

	Note that when calling this API, all properties of the task have to be
	provided, including properties that you do not want to change. Parameters
	not specified would be set to default value. If the task name in the update
	request is new, a task rename operation will be executed before updating
	other fields of the task. WARNING: Renaming of a task may break logics where
	the task name is used as an identifier.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/admin/scheduledtask/updatetask).

	### Errors
	- CloudScriptAzureFunctionsArgumentSizeExceeded
	- InvalidJSONContent
	- InvalidParams
	- InvalidScheduledTaskName
	- InvalidScheduledTaskParameter
	- InvalidScheduledTaskType
	- InvalidTaskSchedule
	- InvalidVirtualCurrencyCode
	- OverLimit
	- PushNotEnabledForAccount
	- PushNotificationTemplateInvalidSyntax
	- PushNotificationTemplateNotFound
	- ScheduledTaskCreateConflict
	- ScheduledTaskNameConflict
	- StatisticNotFound
	- TaskNotFound

]]
function Apis.UpdateTask(request: Types.UpdateTaskRequest): Result<Types.EmptyResponse, string>
	return makeApiCall(
		"/Admin/UpdateTask",
		request,
		"X-SecretKey"
	)
end

return Apis
