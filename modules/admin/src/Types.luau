--[[
	This file was generated on 2025-08-03 at 00:04 UTC. Do not edit directly.

]]

--[[
	The work to be performed on each entity which can only be of one type.

]]
export type Action = {
	SendEmailContent: SendEmailContent?,
	DeleteInventoryItemV2Content: DeleteInventoryItemV2Content?,
	BanPlayerContent: BanPlayerContent?,
	GrantItemContent: GrantItemContent?,
	ExecuteFunctionContent: ExecuteFunctionContent?,
	ExecuteCloudScriptContent: ExecuteCloudScriptContent?,
	DeletePlayerContent: DeletePlayerContent?,
	PushNotificationContent: PushNotificationContent?,
	SubtractInventoryItemV2Content: SubtractInventoryItemV2Content?,
	IncrementPlayerStatisticContent: IncrementPlayerStatisticContent?,
	AddInventoryItemV2Content: AddInventoryItemV2Content?,
	GrantVirtualCurrencyContent: GrantVirtualCurrencyContent?,
}

--[[
	This operation is additive. Tables with TableId values not currently defined
	will be added, while those with TableId values matching Tables currently in
	the catalog will be overwritten with the given values.

]]
export type UpdateRandomResultTablesRequest = {
	--[[
		which catalog is being updated. If null, update the current default catalog
		version

	]]
	CatalogVersion: string?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		array of random result tables to make available (Note: specifying an existing
		TableId will result in overwriting that table, while any others will be added
		to the available set)

	]]
	Tables: { RandomResultTable }?,
}

export type TaskInstanceBasicSummary = {
	Type: ScheduledTaskType?,
	--[[
		ID of the task instance.

	]]
	TaskInstanceId: string?,
	--[[
		Estimated time remaining in seconds.

	]]
	EstimatedSecondsRemaining: number?,
	--[[
		Identifier by either name or ID. Note that a name may change due to renaming,
		or reused after being deleted. ID is immutable and unique.

	]]
	TaskIdentifier: NameIdentifier?,
	--[[
		UTC timestamp when the task started.

	]]
	StartedAt: string,
	--[[
		UTC timestamp when the task completed.

	]]
	CompletedAt: string?,
	Status: TaskInstanceStatus?,
	--[[
		Error message for last processing attempt, if an error occured.

	]]
	ErrorMessage: string?,
	--[[
		Progress represented as percentage.

	]]
	PercentComplete: number?,
	--[[
		If manually scheduled, ID of user who scheduled the task.

	]]
	ScheduledByUserId: string?,
}

export type AdCampaignAttributionModel = {
	--[[
		UTC time stamp of attribution

	]]
	AttributedAt: string,
	--[[
		Attribution network name

	]]
	Platform: string?,
	--[[
		Attribution campaign identifier

	]]
	CampaignId: string?,
}

--[[
	Useful for identifying titles of which the player's data will be deleted by
	DeleteMasterPlayer.

]]
export type GetPlayedTitleListRequest = {
	--[[
		Unique PlayFab assigned ID of the user on whom the operation will be
		performed.

	]]
	PlayFabId: string,
}

--[[
	This API allows for access to details regarding a user in the PlayFab
	service, usually for purposes of customer support. Note that data returned
	may be Personally Identifying Information (PII), such as email address, and
	so care should be taken in how this data is stored and managed. Since this
	call will always return the relevant information for users who have accessed
	the title, the recommendation is to not store this data locally.

]]
export type LookupUserAccountInfoRequest = {
	--[[
		Title specific username to match against existing user accounts

	]]
	TitleDisplayName: string?,
	--[[
		Unique PlayFab assigned ID of the user on whom the operation will be
		performed.

	]]
	PlayFabId: string?,
	--[[
		PlayFab username for the account (3-20 characters)

	]]
	Username: string?,
	--[[
		User email address attached to their account

	]]
	Email: string?,
}

export type GrantItemSegmentAction = {
	--[[
		Item catalog id.

	]]
	CatelogId: string?,
	--[[
		Item quantity.

	]]
	Quantity: number,
	--[[
		Item id.

	]]
	ItemId: string?,
}

export type PlayerChurnPredictionSegmentFilter = {
	RiskLevel: ChurnRiskLevel?,
	Comparison: SegmentFilterComparison?,
}

export type AddInventoryItemV2Content = {
	--[[
		The stack id for where the item will be granted in the player inventory

	]]
	StackId: string?,
	--[[
		The duration in seconds of the subscription to be granted to a player

	]]
	DurationInSeconds: number?,
	--[[
		Amount of the item to be granted to a player

	]]
	Amount: number?,
	--[[
		The collection id for where the item will be granted in the player inventory

	]]
	CollectionId: string?,
	--[[
		The id of item to be granted to the player

	]]
	ItemId: string?,
}

export type UserSteamInfo = {
	--[[
		Steam identifier

	]]
	SteamId: string?,
	SteamActivationStatus: TitleActivationStatus?,
	--[[
		the country in which the player resides, from Steam data

	]]
	SteamCountry: string?,
	SteamCurrency: Currency?,
	--[[
		Steam display name

	]]
	SteamName: string?,
}

export type RefundPurchaseRequest = {
	--[[
		Unique order ID for the purchase in question.

	]]
	OrderId: string,
	--[[
		Unique PlayFab assigned ID of the user on whom the operation will be
		performed.

	]]
	PlayFabId: string,
	--[[
		The Reason parameter should correspond with the payment providers reason
		field, if they require one such as Facebook. In the case of Facebook this must
		match one of their refund or dispute resolution enums (See:
		https://developers.facebook.com/docs/payments/implementation-guide/handling-disputes-refunds)

	]]
	Reason: string?,
}

export type DeleteOpenIdConnectionRequest = {
	--[[
		unique name of the connection

	]]
	ConnectionId: string,
}

export type DeletePlayerCustomPropertiesResult = {
	--[[
		Indicates the current version of a player's properties that have been set.
		This is incremented after updates and deletes. This version can be provided in
		update and delete calls for concurrency control.

	]]
	PropertiesVersion: number,
	--[[
		PlayFab unique identifier of the user whose properties were deleted.

	]]
	PlayFabId: string?,
	--[[
		The list of properties requested to be deleted.

	]]
	DeletedProperties: { DeletedPropertyDetails }?,
}

--[[
	Deletes custom properties for the specified player. The list of provided
	property names must be non-empty.

]]
export type DeletePlayerCustomPropertiesRequest = {
	--[[
		Optional field used for concurrency control. One can ensure that the delete
		operation will only be performed if the player's properties have not been
		updated by any other clients since the last version.

	]]
	ExpectedPropertiesVersion: number?,
	--[[
		Unique PlayFab assigned ID of the user on whom the operation will be
		performed.

	]]
	PlayFabId: string,
	--[[
		A list of property names denoting which properties should be deleted.

	]]
	PropertyNames: { string },
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type UpdateOpenIdConnectionRequest = {
	IssuerInformation: OpenIdIssuerInformation?,
	--[[
		A name for the connection that identifies it within the title.

	]]
	ConnectionId: string,
	--[[
		The client ID given by the ID provider.

	]]
	ClientId: string?,
	--[[
		The client secret given by the ID provider.

	]]
	ClientSecret: string?,
	--[[
		Ignore 'nonce' claim in identity tokens.

	]]
	IgnoreNonce: boolean?,
	--[[
		The issuer URL or discovery document URL to read issuer information from

	]]
	IssuerDiscoveryUrl: string?,
	--[[
		Override the issuer name for user indexing and lookup.

	]]
	IssuerOverride: string?,
}

export type SubtractUserVirtualCurrencyRequest = {
	--[[
		Amount to be subtracted from the user balance of the specified virtual
		currency.

	]]
	Amount: number,
	--[[
		PlayFab unique identifier of the user whose virtual currency balance is to be
		decreased.

	]]
	PlayFabId: string,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		Name of the virtual currency which is to be decremented.

	]]
	VirtualCurrency: string,
}

export type PlayerStatisticVersion = {
	--[[
		URL for the downloadable archive of player statistic values, if available

	]]
	ArchiveDownloadUrl: string?,
	--[[
		time at which the statistic version was scheduled to become inactive, based on
		the configured ResetInterval

	]]
	ScheduledDeactivationTime: string?,
	--[[
		version of the statistic

	]]
	Version: number,
	--[[
		time when the statistic version became inactive due to statistic version
		incrementing

	]]
	DeactivationTime: string?,
	Status: StatisticVersionStatus?,
	--[[
		time at which the statistic version was scheduled to become active, based on
		the configured ResetInterval

	]]
	ScheduledActivationTime: string?,
	--[[
		time when the statistic version became active

	]]
	ActivationTime: string,
	--[[
		name of the statistic when the version became active

	]]
	StatisticName: string?,
}

export type SubscriptionProviderStatus = 
	| "NoError"
	| "Cancelled"
	| "UnknownError"
	| "BillingError"
	| "ProductUnavailable"
	| "CustomerDidNotAcceptPriceChange"
	| "FreeTrial"
	| "PaymentPending"

export type ScheduledTask = {
	--[[
		Cron expression for the run schedule of the task. The expression should be in
		UTC.

	]]
	Schedule: string?,
	Type: ScheduledTaskType?,
	--[[
		ID of the task

	]]
	TaskId: string?,
	--[[
		Whether the schedule is active. Inactive schedule will not trigger task
		execution.

	]]
	IsActive: boolean,
	--[[
		UTC time of last run

	]]
	LastRunTime: string?,
	--[[
		Name of the task. This is a unique identifier for tasks in the title.

	]]
	Name: string,
	--[[
		UTC time of next run

	]]
	NextRunTime: string?,
	--[[
		Description the task

	]]
	Description: string?,
	--[[
		Task parameter. Different types of task have different parameter structure.
		See each task type's create API documentation for the details.

	]]
	Parameter: {
		-- No properties defined in spec
		[string]: any
	}?,
}

--[[
	Note that this action cannot be un-done. All statistics for this character
	will be deleted, removing the user from all leaderboards for the game.

]]
export type ResetCharacterStatisticsRequest = {
	--[[
		Unique PlayFab assigned ID for a specific character owned by a user

	]]
	CharacterId: string,
	--[[
		Unique PlayFab assigned ID of the user on whom the operation will be
		performed.

	]]
	PlayFabId: string,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

--[[
	A store entry that list a catalog item at a particular price

]]
export type StoreItem = {
	--[[
		Override prices for this item in virtual currencies and "RM" (the base Real
		Money purchase price, in USD pennies)

	]]
	VirtualCurrencyPrices: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		Override prices for this item for specific currencies

	]]
	RealCurrencyPrices: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		Store specific custom data. The data only exists as part of this store; it is
		not transferred to item instances

	]]
	CustomData: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		Intended display position for this item. Note that 0 is the first position

	]]
	DisplayPosition: number?,
	--[[
		Unique identifier of the item as it exists in the catalog - note that this
		must exactly match the ItemId from the catalog

	]]
	ItemId: string,
}

export type AddNewsRequest = {
	--[[
		Default body text of the news.

	]]
	Body: string,
	--[[
		Time this news was published. If not set, defaults to now.

	]]
	Timestamp: string?,
	--[[
		Default title (headline) of the news item.

	]]
	Title: string,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type CustomPropertyNumericSegmentFilter = {
	--[[
		Custom property numeric value.

	]]
	PropertyValue: number,
	Comparison: SegmentFilterComparison?,
	--[[
		Custom property name.

	]]
	PropertyName: string?,
}

export type InsightsScalingTaskParameter = {
	--[[
		Insights Performance Level to scale to.

	]]
	Level: number,
}

export type TitleDataKeyValue = {
	--[[
		Key we want to set a value on (note, this is additive - will only replace an
		existing key's value if they are the same name.) Keys are trimmed of
		whitespace. Keys may not begin with the '!' character.

	]]
	Key: string?,
	--[[
		New value to set. Set to null to remove a value

	]]
	Value: string?,
}

export type RunTaskResult = {
	--[[
		ID of the task instance that is started. This can be used in Get*TaskInstance
		(e.g. GetCloudScriptTaskInstance) API call to retrieve status for the task
		instance.

	]]
	TaskInstanceId: string?,
}

--[[
	Request has no paramaters.

]]
export type GetAllSegmentsRequest = {
	-- No properties defined in spec
	[string]: any
}

export type GetCatalogItemsResult = {
	--[[
		Array of items which can be purchased.

	]]
	Catalog: { CatalogItem }?,
}

export type UserFacebookInfo = {
	--[[
		Facebook identifier

	]]
	FacebookId: string?,
	--[[
		Facebook full name

	]]
	FullName: string?,
}

export type FirstLoginDateSegmentFilter = {
	--[[
		First player login date.

	]]
	LogInDate: string,
	Comparison: SegmentFilterComparison?,
}

export type ItemGrant = {
	--[[
		Unique PlayFab assigned ID of the user on whom the operation will be
		performed.

	]]
	PlayFabId: string,
	--[[
		Key-value pairs to be written to the custom data. Note that keys are trimmed
		of whitespace, are limited in size, and may not begin with a '!' character or
		be null.

	]]
	Data: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		String detailing any additional information concerning this operation.

	]]
	Annotation: string?,
	--[[
		Unique PlayFab assigned ID for a specific character owned by a user

	]]
	CharacterId: string?,
	--[[
		Optional list of Data-keys to remove from UserData. Some SDKs cannot insert
		null-values into Data due to language constraints. Use this to delete the keys
		directly.

	]]
	KeysToRemove: { string }?,
	--[[
		Unique identifier of the catalog item to be granted to the user.

	]]
	ItemId: string,
}

--[[
	Resets a player's password taking in a new password based and validating the
	user based off of a token sent to the playerto their email. The token
	expires after 30 minutes.

]]
export type ResetPasswordRequest = {
	--[[
		The new password for the player.

	]]
	Password: string,
	--[[
		The token of the player requesting the password reset.

	]]
	Token: string,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type UpdateRandomResultTablesResult = {
	-- No properties defined in spec
	[string]: any
}

export type CustomPropertyDateTimeSegmentFilter = {
	--[[
		Custom property datetime value.

	]]
	PropertyValue: string,
	Comparison: SegmentFilterComparison?,
	--[[
		Custom property name.

	]]
	PropertyName: string?,
}

export type GetPlayerIdFromAuthTokenResult = {
	--[[
		The player ID from the token passed in

	]]
	PlayFabId: string?,
}

export type GetPlayerSegmentsResult = {
	--[[
		Array of segments the requested player currently belongs to.

	]]
	Segments: { GetSegmentResult }?,
}

export type UserAndroidDeviceInfo = {
	--[[
		Android device ID

	]]
	AndroidDeviceId: string?,
}

export type LastLoginTimespanSegmentFilter = {
	--[[
		Last player login duration.

	]]
	DurationInMinutes: number,
	Comparison: SegmentFilterComparison?,
}

export type VirtualCurrencyBalanceSegmentFilter = {
	Comparison: SegmentFilterComparison?,
	--[[
		Total amount.

	]]
	Amount: number,
	--[[
		Currency code.

	]]
	CurrencyCode: string?,
}

export type DeleteStoreResult = {
	-- No properties defined in spec
	[string]: any
}

--[[
	This API will trigger a player_tag_added event and add a tag with the given
	TagName and PlayFabID to the corresponding player profile. TagName can be
	used for segmentation and it is limited to 256 characters. Also there is a
	limit on the number of tags a title can have.

]]
export type AddPlayerTagRequest = {
	--[[
		Unique PlayFab assigned ID of the user on whom the operation will be
		performed.

	]]
	PlayFabId: string,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		Unique tag for player profile.

	]]
	TagName: string,
}

export type UserIosDeviceInfo = {
	--[[
		iOS device ID

	]]
	IosDeviceId: string?,
}

export type ExecuteCloudScriptSegmentAction = {
	--[[
		Cloud script function parameter.

	]]
	FunctionParameter: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		Cloud script function.

	]]
	CloudScriptFunction: string?,
	--[[
		Cloud script function parameter json text.

	]]
	FunctionParameterJson: string?,
	--[[
		Generate play stream event.

	]]
	CloudScriptPublishResultsToPlayStream: boolean,
}

--[[
	Data is stored as JSON key-value pairs. If the Keys parameter is provided,
	the data object returned will only contain the data specific to the
	indicated Keys. Otherwise, the full set of custom user data will be
	returned.

]]
export type GetUserDataRequest = {
	--[[
		Specific keys to search for in the custom user data.

	]]
	Keys: { string }?,
	--[[
		The version that currently exists according to the caller. The call will
		return the data for all of the keys if the version in the system is greater
		than this.

	]]
	IfChangedFromDataVersion: number?,
	--[[
		Unique PlayFab assigned ID of the user on whom the operation will be
		performed.

	]]
	PlayFabId: string,
}

export type UserNintendoSwitchAccountIdInfo = {
	--[[
		Nintendo Switch account subject ID

	]]
	NintendoSwitchAccountSubjectId: string?,
}

export type UserBattleNetInfo = {
	--[[
		Battle.net display name

	]]
	BattleNetBattleTag: string?,
	--[[
		Battle.net identifier

	]]
	BattleNetAccountId: string?,
}

--[[
	This operation is additive. If a Key does not exist in the current dataset,
	it will be added with the specified Value. If it already exists, the Value
	for that key will be overwritten with the new Value.

]]
export type SetTitleDataRequest = {
	--[[
		key we want to set a value on (note, this is additive - will only replace an
		existing key's value if they are the same name.) Keys are trimmed of
		whitespace. Keys may not begin with the '!' character.

	]]
	Key: string,
	--[[
		new value to set. Set to null to remove a value

	]]
	Value: string?,
}

export type AddLocalizedNewsRequest = {
	--[[
		Unique id of the updated news item.

	]]
	NewsId: string,
	--[[
		Localized title (headline) of the news item.

	]]
	Title: string,
	--[[
		Localized body text of the news.

	]]
	Body: string,
	--[[
		Language of the news item.

	]]
	Language: string,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type UserDataRecord = {
	--[[
		Data stored for the specified user data key.

	]]
	Value: string?,
	--[[
		Indicates whether a given data key is private (readable only by the player) or
		public (readable by all players). When a player makes a GetUserData request
		about another player, only keys marked Public will be returned.

	]]
	Permission: UserDataPermission?,
	--[[
		Timestamp for when this data was last updated.

	]]
	LastUpdated: string,
}

export type PushNotificationSegmentFilter = {
	PushNotificationDevicePlatform: SegmentPushNotificationDevicePlatform?,
}

export type GetDataReportResult = {
	--[[
		The URL where the requested report can be downloaded. This can be any PlayFab
		generated reports. The full list of reports can be found at:
		https://docs.microsoft.com/en-us/gaming/playfab/features/analytics/reports/quickstart.

	]]
	DownloadUrl: string?,
}

export type PushNotificationRegistrationModel = {
	--[[
		Notification configured endpoint

	]]
	NotificationEndpointARN: string?,
	Platform: PushNotificationPlatform?,
}

export type AdCampaignSegmentFilter = {
	Comparison: SegmentFilterComparison?,
	--[[
		Campaign id.

	]]
	CampaignId: string?,
	--[[
		Campaign source.

	]]
	CampaignSource: string?,
}

--[[
	This API method is designed to return title specific values which can be
	read by the client. For example, a developer could choose to store values
	which modify the user experience, such as enemy spawn rates, weapon
	strengths, movement speeds, etc. This allows a developer to update the title
	without the need to create, test, and ship a new build. If an override label
	is specified in the request, the overrides are applied automatically and
	returned with the title data. Note that due to caching, there may up to a
	minute delay in between updating title data and a query returning the newest
	value.

]]
export type GetTitleDataRequest = {
	--[[
		Specific keys to search for in the title data (leave null to get all keys)

	]]
	Keys: { string }?,
	--[[
		Optional field that specifies the name of an override. This value is ignored
		when used by the game client; otherwise, the overrides are applied
		automatically to the title data.

	]]
	OverrideLabel: string?,
}

--[[
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

]]
export type UpdatePlayerStatisticDefinitionRequest = {
	AggregationMethod: StatisticAggregationMethod?,
	--[[
		unique name of the statistic

	]]
	StatisticName: string,
	VersionChangeInterval: StatisticResetIntervalOption?,
}

export type SegmentPushNotificationDevicePlatform = 
	| "ApplePushNotificationService"
	| "GoogleCloudMessaging"

--[[
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

]]
export type GetStoreItemsRequest = {
	--[[
		Unqiue identifier for the store which is being requested.

	]]
	StoreId: string,
	--[[
		Catalog version to store items from. Use default catalog version if null

	]]
	CatalogVersion: string?,
}

export type DeleteSegmentsResponse = {
	--[[
		Error message.

	]]
	ErrorMessage: string?,
}

--[[
	Statistics are numeric values, with each statistic in the title also
	generating a leaderboard. The ResetInterval defines the period of time at
	which the leaderboard for the statistic will automatically reset. Upon
	reset, the statistic updates to a new version with no values (effectively
	removing all players from the leaderboard). The previous version's statistic
	values are also archived for retrieval, if needed (see
	GetPlayerStatisticVersions). Statistics not created via a call to
	CreatePlayerStatisticDefinition by default have a VersionChangeInterval of
	Never, meaning they do not reset on a schedule, but they can be set to do so
	via a call to UpdatePlayerStatisticDefinition. Once a statistic has been
	reset (sometimes referred to as versioned or incremented), the previous
	version can still be written to for up a short, pre-defined period
	(currently 10 seconds), to prevent issues with levels completing around the
	time of the reset. Also, once reset, the historical statistics for players
	in the title may be retrieved using the URL specified in the version
	information (GetPlayerStatisticVersions). The AggregationMethod defines what
	action is taken when a new statistic value is submitted - always update with
	the new value (Last), use the highest of the old and new values (Max), use
	the smallest (Min), or add them together (Sum).

]]
export type GetPlayerStatisticDefinitionsResult = {
	--[[
		the player statistic definitions for the title

	]]
	Statistics: { PlayerStatisticDefinition }?,
}

--[[
	Please note that the order of the items in the response may not match the
	order of items in the request.

]]
export type GrantItemsToUsersResult = {
	--[[
		Array of items granted to users.

	]]
	ItemGrantResults: { GrantedItemInstance }?,
}

export type AddInventoryItemsV2SegmentAction = {
	--[[
		The stack id for where the item will be granted in the player inventory

	]]
	StackId: string?,
	--[[
		The duration in seconds of the subscription to be granted to a player

	]]
	DurationInSeconds: number?,
	--[[
		Amount of the item to be granted to a player

	]]
	Amount: number?,
	--[[
		The collection id for where the item will be granted in the player inventory

	]]
	CollectionId: string?,
	--[[
		The id of item to be granted to the player

	]]
	ItemId: string?,
}

export type SegmentLoginIdentityProvider = 
	| "Unknown"
	| "PlayFab"
	| "Custom"
	| "GameCenter"
	| "GooglePlay"
	| "Steam"
	| "XBoxLive"
	| "PSN"
	| "Kongregate"
	| "Facebook"
	| "IOSDevice"
	| "AndroidDevice"
	| "Twitch"
	| "WindowsHello"
	| "GameServer"
	| "CustomServer"
	| "NintendoSwitch"
	| "FacebookInstantGames"
	| "OpenIdConnect"
	| "Apple"
	| "NintendoSwitchAccount"
	| "GooglePlayGames"

export type GetContentUploadUrlResult = {
	--[[
		URL for uploading content via HTTP PUT method. The URL requires the
		'x-ms-blob-type' header to have the value 'BlockBlob'. The URL will expire in
		approximately one hour.

	]]
	URL: string?,
}

export type SubtractInventoryItemsV2SegmentAction = {
	--[[
		The stack id for where the item will be removed from the player inventory

	]]
	StackId: string?,
	--[[
		The duration in seconds to be removed from the subscription in the players
		inventory

	]]
	DurationInSeconds: number?,
	--[[
		Amount of the item to removed from the player

	]]
	Amount: number?,
	--[[
		The collection id for where the item will be removed from the player inventory

	]]
	CollectionId: string?,
	--[[
		The id of item to be removed from the player

	]]
	ItemId: string?,
}

export type RevokeInventoryItem = {
	--[[
		Unique PlayFab assigned ID for a specific character owned by a user

	]]
	CharacterId: string?,
	--[[
		Unique PlayFab assigned ID of the user on whom the operation will be
		performed.

	]]
	PlayFabId: string,
	--[[
		Unique PlayFab assigned instance identifier of the item

	]]
	ItemInstanceId: string,
}

export type SegmentTrigger = {
	AddInventoryItemsV2Action: AddInventoryItemsV2SegmentAction?,
	GrantVirtualCurrencyAction: GrantVirtualCurrencySegmentAction?,
	DeletePlayerStatisticAction: DeletePlayerStatisticSegmentAction?,
	BanPlayerAction: BanPlayerSegmentAction?,
	PushNotificationAction: PushNotificationSegmentAction?,
	SubtractInventoryItemsV2Action: SubtractInventoryItemsV2SegmentAction?,
	DeleteInventoryItemsV2Action: DeleteInventoryItemsV2SegmentAction?,
	ExecuteCloudScriptAction: ExecuteCloudScriptSegmentAction?,
	DeletePlayerAction: DeletePlayerSegmentAction?,
	EmailNotificationAction: EmailNotificationSegmentAction?,
	IncrementPlayerStatisticAction: IncrementPlayerStatisticSegmentAction?,
	GrantItemAction: GrantItemSegmentAction?,
	ExecuteAzureFunctionAction: ExecuteAzureFunctionSegmentAction?,
}

export type SetPublishedRevisionResult = {
	-- No properties defined in spec
	[string]: any
}

export type GetCatalogItemsRequest = {
	--[[
		Which catalog is being requested. If null, uses the default catalog.

	]]
	CatalogVersion: string?,
}

--[[
	This API lets developers delete a membership subscription.

]]
export type DeleteMembershipSubscriptionRequest = {
	--[[
		Id of the membership to apply the override expiration date to.

	]]
	MembershipId: string,
	--[[
		Unique PlayFab assigned ID of the user on whom the operation will be
		performed.

	]]
	PlayFabId: string,
	--[[
		Id of the subscription that should be deleted from the membership.

	]]
	SubscriptionId: string,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type CatalogItemBundleInfo = {
	--[[
		unique ItemId values for all items which will be added to the player inventory
		when the bundle is added

	]]
	BundledItems: { string }?,
	--[[
		unique TableId values for all RandomResultTable objects which are part of the
		bundle (random tables will be resolved and add the relevant items to the
		player inventory when the bundle is added)

	]]
	BundledResultTables: { string }?,
	--[[
		virtual currency types and balances which will be added to the player
		inventory when the bundle is added

	]]
	BundledVirtualCurrencies: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type AuthTokenType = 
	| "Email"

--[[
	Send segment id planning to delete part of DeleteSegmentRequest object

]]
export type DeleteSegmentRequest = {
	--[[
		Segment id.

	]]
	SegmentId: string,
}

export type SetMembershipOverrideResult = {
	-- No properties defined in spec
	[string]: any
}

export type CustomPropertyBooleanSegmentFilter = {
	--[[
		Custom property boolean value.

	]]
	PropertyValue: boolean,
	Comparison: SegmentFilterComparison?,
	--[[
		Custom property name.

	]]
	PropertyName: string?,
}

export type GetUserBansResult = {
	--[[
		Information about the bans

	]]
	BanData: { BanInfo }?,
}

export type CustomPropertyDetails = {
	--[[
		The custom property's name.

	]]
	Name: string?,
	--[[
		The custom property's value.

	]]
	Value: {
		-- No properties defined in spec
		[string]: any
	}?,
}

--[[
	Represents a single update ban request.

]]
export type UpdateBanRequest = {
	--[[
		The updated expiration date for the ban. Null for no change.

	]]
	Expires: string?,
	--[[
		Whether to make this ban permanent. Set to true to make this ban permanent.
		This will not modify Active state.

	]]
	Permanent: boolean?,
	--[[
		The updated active state for the ban. Null for no change.

	]]
	Active: boolean?,
	--[[
		The updated IP address for the ban. Null for no change.

	]]
	IPAddress: string?,
	--[[
		The id of the ban to be updated.

	]]
	BanId: string,
	UserFamilyType: UserFamilyType?,
	--[[
		The updated reason for the ban to be updated. Maximum 140 characters. Null for
		no change.

	]]
	Reason: string?,
}

export type UpdateCatalogItemsResult = {
	-- No properties defined in spec
	[string]: any
}

export type GetAllSegmentsResult = {
	--[[
		Array of segments for this title.

	]]
	Segments: { GetSegmentResult }?,
}

export type GetPlayerSharedSecretsResult = {
	--[[
		The player shared secret to use when calling Client/GetTitlePublicKey

	]]
	SharedSecrets: { SharedSecret }?,
}

export type SendEmailContent = {
	--[[
		The email template id of the email template to send.

	]]
	EmailTemplateId: string,
}

export type CloudScriptFile = {
	--[[
		Contents of the Cloud Script javascript. Must be string-escaped javascript.

	]]
	FileContents: string,
	--[[
		Name of the javascript file. These names are not used internally by the
		server, they are only for developer organizational purposes.

	]]
	Filename: string,
}

export type ResolvePurchaseDisputeRequest = {
	--[[
		Unique order ID for the purchase in question.

	]]
	OrderId: string,
	--[[
		Unique PlayFab assigned ID of the user on whom the operation will be
		performed.

	]]
	PlayFabId: string,
	Outcome: ResolutionOutcome,
	--[[
		The Reason parameter should correspond with the payment providers reason
		field, if they require one such as Facebook. In the case of Facebook this must
		match one of their refund or dispute resolution enums (See:
		https://developers.facebook.com/docs/payments/implementation-guide/handling-disputes-refunds)

	]]
	Reason: string?,
}

export type ListVirtualCurrencyTypesRequest = {
	-- No properties defined in spec
	[string]: any
}

--[[
	Deletes any PlayStream or telemetry event associated with the player from
	PlayFab. Note, this API queues the data for asynchronous deletion. It may
	take some time before the data is deleted.

]]
export type DeleteMasterPlayerEventDataRequest = {
	--[[
		Unique PlayFab assigned ID of the user on whom the operation will be
		performed.

	]]
	PlayFabId: string,
}

export type UpdateSegmentResponse = {
	--[[
		Error message.

	]]
	ErrorMessage: string?,
	--[[
		Segment id.

	]]
	SegmentId: string?,
}

export type CloudScriptTaskSummary = {
	--[[
		ID of the task instance.

	]]
	TaskInstanceId: string?,
	Result: ExecuteCloudScriptResult?,
	--[[
		Identifier by either name or ID. Note that a name may change due to renaming,
		or reused after being deleted. ID is immutable and unique.

	]]
	TaskIdentifier: NameIdentifier?,
	--[[
		UTC timestamp when the task started.

	]]
	StartedAt: string,
	--[[
		UTC timestamp when the task completed.

	]]
	CompletedAt: string?,
	Status: TaskInstanceStatus?,
	--[[
		Estimated time remaining in seconds.

	]]
	EstimatedSecondsRemaining: number?,
	--[[
		Progress represented as percentage.

	]]
	PercentComplete: number?,
	--[[
		If manually scheduled, ID of user who scheduled the task.

	]]
	ScheduledByUserId: string?,
}

export type LastLoginDateSegmentFilter = {
	--[[
		Last player login date.

	]]
	LogInDate: string,
	Comparison: SegmentFilterComparison?,
}

export type CreateOpenIdConnectionRequest = {
	IssuerInformation: OpenIdIssuerInformation?,
	--[[
		A name for the connection that identifies it within the title.

	]]
	ConnectionId: string,
	--[[
		The client ID given by the ID provider.

	]]
	ClientId: string,
	--[[
		The client secret given by the ID provider.

	]]
	ClientSecret: string,
	--[[
		Ignore 'nonce' claim in identity tokens.

	]]
	IgnoreNonce: boolean?,
	--[[
		The discovery document URL to read issuer information from. This must be the
		absolute URL to the JSON OpenId Configuration document and must be accessible
		from the internet. If you don't know it, try your issuer URL followed by
		"/.well-known/openid-configuration". For example, if the issuer is
		https://example.com, try https://example.com/.well-known/openid-configuration

	]]
	IssuerDiscoveryUrl: string?,
	--[[
		Override the issuer name for user indexing and lookup.

	]]
	IssuerOverride: string?,
}

export type SetupPushNotificationResult = {
	--[[
		Amazon Resource Name for the created notification topic.

	]]
	ARN: string?,
}

export type PushNotificationContent = {
	--[[
		Text of message to send.

	]]
	Message: string?,
	--[[
		Subject of message to send (may not be displayed in all platforms)

	]]
	Subject: string?,
	--[[
		Id of the push notification template.

	]]
	PushNotificationTemplateId: string?,
}

export type StatisticAggregationMethod = 
	| "Last"
	| "Min"
	| "Max"
	| "Sum"

--[[
	Setting the active state of all non-expired bans for a user to Inactive.
	Expired bans with an Active state will be ignored, however. Returns
	information about applied updates only.

]]
export type RevokeAllBansForUserRequest = {
	--[[
		Unique PlayFab assigned ID of the user on whom the operation will be
		performed.

	]]
	PlayFabId: string,
}

export type ExecuteCloudScriptResult = {
	--[[
		Number of external HTTP requests issued by the CloudScript function

	]]
	HttpRequestsIssued: number,
	--[[
		The name of the function that executed

	]]
	FunctionName: string?,
	--[[
		The object returned from the CloudScript function, if any

	]]
	FunctionResult: {
		-- No properties defined in spec
		[string]: any
	}?,
	ExecutionTimeSeconds: number,
	--[[
		Processor time consumed while executing the function. This does not include
		time spent waiting on API calls or HTTP requests.

	]]
	ProcessorTimeSeconds: number,
	--[[
		Entries logged during the function execution. These include both entries
		logged in the function code using log.info() and log.error() and error entries
		for API and HTTP request failures.

	]]
	Logs: { LogStatement }?,
	--[[
		Flag indicating if the FunctionResult was too large and was subsequently
		dropped from this event. This only occurs if the total event size is larger
		than 350KB.

	]]
	FunctionResultTooLarge: boolean?,
	--[[
		Flag indicating if the logs were too large and were subsequently dropped from
		this event. This only occurs if the total event size is larger than 350KB
		after the FunctionResult was removed.

	]]
	LogsTooLarge: boolean?,
	MemoryConsumedBytes: number,
	--[[
		Number of PlayFab API requests issued by the CloudScript function

	]]
	APIRequestsIssued: number,
	Error: ScriptExecutionError?,
	--[[
		The revision of the CloudScript that executed

	]]
	Revision: number,
}

export type UserGameCenterInfo = {
	--[[
		Gamecenter identifier

	]]
	GameCenterId: string?,
}

export type DeleteInventoryItemsV2SegmentAction = {
	--[[
		The collection id for where the item will be removed from the player inventory

	]]
	CollectionId: string?,
	--[[
		The stack id for where the item will be removed from the player inventory

	]]
	StackId: string?,
	--[[
		The id of item to be removed from the player

	]]
	ItemId: string?,
}

--[[
	Statistics are numeric values, with each statistic in the title also
	generating a leaderboard. The information returned in the results defines
	the state of a specific version of a statistic, including when it was or
	will become the currently active version, when it will (or did) become a
	previous version, and its archival state if it is no longer the active
	version. For a statistic which has been reset, once the archival status is
	Complete, the full set of statistics for all players in the leaderboard for
	that version may be retrieved via the ArchiveDownloadUrl. Statistics which
	have not been reset (incremented/versioned) will only have a single version
	which is not scheduled to reset.

]]
export type GetPlayerStatisticVersionsResult = {
	--[[
		version change history of the statistic

	]]
	StatisticVersions: { PlayerStatisticVersion }?,
}

export type LinkedUserAccountHasEmailSegmentFilter = {
	Comparison: SegmentFilterComparison?,
	LoginProvider: SegmentLoginIdentityProvider?,
}

export type UserTwitchInfo = {
	--[[
		Twitch ID

	]]
	TwitchId: string?,
	--[[
		Twitch Username

	]]
	TwitchUserName: string?,
}

export type ScriptExecutionError = {
	--[[
		Details about the error

	]]
	Message: string?,
	--[[
		Point during the execution of the script at which the error occurred, if any

	]]
	StackTrace: string?,
	--[[
		Error code, such as CloudScriptNotFound, JavascriptException,
		CloudScriptFunctionArgumentSizeExceeded, CloudScriptAPIRequestCountExceeded,
		CloudScriptAPIRequestError, or CloudScriptHTTPRequestError

	]]
	Error: string?,
}

export type SetTitleDataAndOverridesResult = {
	-- No properties defined in spec
	[string]: any
}

export type GetPlayerCustomPropertyResult = {
	--[[
		Indicates the current version of a player's properties that have been set.
		This is incremented after updates and deletes. This version can be provided in
		update and delete calls for concurrency control.

	]]
	PropertiesVersion: number,
	--[[
		PlayFab unique identifier of the user whose properties are being returned.

	]]
	PlayFabId: string?,
	Property: CustomPropertyDetails?,
}

--[[
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

]]
export type UpdateStoreItemsRequest = {
	--[[
		Unique identifier for the store which is to be updated

	]]
	StoreId: string,
	--[[
		Catalog version of the store to update. If null, uses the default catalog.

	]]
	CatalogVersion: string?,
	--[[
		Marketing data about a specific store

	]]
	MarketingData: StoreMarketingModel?,
	--[[
		Array of store items - references to catalog items, with specific pricing - to
		be added

	]]
	Store: { StoreItem }?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type GetRandomResultTablesResult = {
	Tables: RandomResultTableListing?,
}

export type LinkedUserAccountSegmentFilter = {
	LoginProvider: SegmentLoginIdentityProvider?,
}

export type DeletedPropertyDetails = {
	--[[
		The name of the property which was requested to be deleted.

	]]
	Name: string?,
	--[[
		Indicates whether or not the property was deleted. If false, no property with
		that name existed.

	]]
	WasDeleted: boolean,
}

--[[
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

]]
export type DeletePlayerRequest = {
	--[[
		Unique PlayFab assigned ID of the user on whom the operation will be
		performed.

	]]
	PlayFabId: string,
}

export type BanPlayerSegmentAction = {
	--[[
		Ban hours duration.

	]]
	BanHours: number?,
	--[[
		Reason for ban.

	]]
	ReasonForBan: string?,
}

--[[
	Request must contain the ExportId

]]
export type GetPlayersInSegmentExportRequest = {
	--[[
		Unique identifier of the export for the requested Segment.

	]]
	ExportId: string,
}

export type PlayerChurnPreviousPredictionSegmentFilter = {
	RiskLevel: ChurnRiskLevel?,
	Comparison: SegmentFilterComparison?,
}

export type ListPlayerCustomPropertiesResult = {
	--[[
		Indicates the current version of a player's properties that have been set.
		This is incremented after updates and deletes. This version can be provided in
		update and delete calls for concurrency control.

	]]
	PropertiesVersion: number,
	--[[
		PlayFab unique identifier of the user whose properties are being returned.

	]]
	PlayFabId: string?,
	--[[
		Player specific properties and their corresponding values for this title.

	]]
	Properties: { CustomPropertyDetails }?,
}

export type EmailNotificationSegmentAction = {
	--[[
		Email template id.

	]]
	EmailTemplateId: string?,
	--[[
		Email template name.

	]]
	EmailTemplateName: string?,
}

export type ExportPlayersInSegmentResult = {
	--[[
		Unique identifier of the export for the requested Segment.

	]]
	ExportId: string?,
	--[[
		Unique identifier of the requested Segment.

	]]
	SegmentId: string?,
}

export type PlayerProfile = {
	--[[
		PlayFab Player ID

	]]
	PlayerId: string?,
	Origination: LoginIdentityProvider?,
	--[[
		Array of player statistics

	]]
	PlayerStatistics: { PlayerStatistic }?,
	ChurnPrediction: ChurnRiskLevel?,
	--[[
		Dictionary of player's custom properties.

	]]
	CustomProperties: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		Array of third party accounts linked to this player

	]]
	LinkedAccounts: { PlayerLinkedAccount }?,
	--[[
		Array of ad campaigns player has been attributed to

	]]
	AdCampaignAttributions: { AdCampaignAttribution }?,
	--[[
		Dictionary of player's virtual currency balances

	]]
	VirtualCurrencyBalances: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		Array of configured push notification end points

	]]
	PushNotificationRegistrations: { PushNotificationRegistration }?,
	--[[
		Player record created

	]]
	Created: string?,
	--[[
		Dictionary of player's total purchases by currency.

	]]
	ValuesToDate: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		List of player's tags for segmentation.

	]]
	Tags: { string }?,
	--[[
		Array of contact email addresses associated with the player

	]]
	ContactEmailAddresses: { ContactEmailInfo }?,
	--[[
		Last login

	]]
	LastLogin: string?,
	--[[
		Player Display Name

	]]
	DisplayName: string?,
	--[[
		Image URL of the player's avatar.

	]]
	AvatarUrl: string?,
	Locations: PlayerLocation?,
	--[[
		Banned until UTC Date. If permanent ban this is set for 20 years after the
		original ban date.

	]]
	BannedUntil: string?,
	--[[
		Title ID this profile applies to

	]]
	TitleId: string?,
	--[[
		List of player variants for experimentation

	]]
	PlayerExperimentVariants: { string }?,
	--[[
		Dictionary of player's statistics using only the latest version's value

	]]
	Statistics: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		A sum of player's total purchases in USD across all currencies.

	]]
	TotalValueToDateInUSD: number?,
	--[[
		Publisher this player belongs to

	]]
	PublisherId: string?,
}

export type CreateSegmentResponse = {
	--[[
		Error message.

	]]
	ErrorMessage: string?,
	--[[
		Segment id.

	]]
	SegmentId: string?,
}

--[[
	Gets a player ID from an auth token. The token expires after 30 minutes and
	cannot be used to look up a player when expired.

]]
export type GetPlayerIdFromAuthTokenRequest = {
	--[[
		The auth token of the player requesting the password reset.

	]]
	Token: string,
	TokenType: AuthTokenType,
}

export type UserXboxInfo = {
	--[[
		XBox user ID

	]]
	XboxUserId: string?,
	--[[
		XBox user sandbox

	]]
	XboxUserSandbox: string?,
}

export type GetTasksResult = {
	--[[
		Result tasks. Empty if there is no task found.

	]]
	Tasks: { ScheduledTask }?,
}

--[[
	Task name is unique within a title. Using a task name that's already taken
	will cause a name conflict error. Too many create-task requests within a
	short time will cause a create conflict error.

]]
export type CreateCloudScriptTaskRequest = {
	--[[
		Cron expression for the run schedule of the task. The expression should be in
		UTC.

	]]
	Schedule: string?,
	--[[
		Description the task

	]]
	Description: string?,
	--[[
		Name of the task. This is a unique identifier for tasks in the title.

	]]
	Name: string,
	--[[
		Whether the schedule is active. Inactive schedule will not trigger task
		execution.

	]]
	IsActive: boolean,
	Parameter: CloudScriptTaskParameter,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type PushNotificationRegistration = {
	--[[
		Notification configured endpoint

	]]
	NotificationEndpointARN: string?,
	Platform: PushNotificationPlatform?,
}

export type LocationModel = {
	CountryCode: CountryCode?,
	--[[
		City name.

	]]
	City: string?,
	--[[
		Longitude coordinate of the geographic location.

	]]
	Longitude: number?,
	--[[
		Latitude coordinate of the geographic location.

	]]
	Latitude: number?,
	ContinentCode: ContinentCode?,
}

--[[
	The basic wrapper around every failed API response

]]
export type ApiErrorWrapper = {
	--[[
		Detailed description of individual issues with the request object

	]]
	errorDetails: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		Numerical HTTP code

	]]
	code: number,
	--[[
		String HTTP code

	]]
	status: string?,
	--[[
		Numerical PlayFab error code

	]]
	errorCode: number,
	--[[
		Playfab error code

	]]
	error: string?,
	--[[
		Description for the PlayFab errorCode

	]]
	errorMessage: string?,
}

export type SegmentCountryCode = 
	| "AF"
	| "AX"
	| "AL"
	| "DZ"
	| "AS"
	| "AD"
	| "AO"
	| "AI"
	| "AQ"
	| "AG"
	| "AR"
	| "AM"
	| "AW"
	| "AU"
	| "AT"
	| "AZ"
	| "BS"
	| "BH"
	| "BD"
	| "BB"
	| "BY"
	| "BE"
	| "BZ"
	| "BJ"
	| "BM"
	| "BT"
	| "BO"
	| "BQ"
	| "BA"
	| "BW"
	| "BV"
	| "BR"
	| "IO"
	| "BN"
	| "BG"
	| "BF"
	| "BI"
	| "KH"
	| "CM"
	| "CA"
	| "CV"
	| "KY"
	| "CF"
	| "TD"
	| "CL"
	| "CN"
	| "CX"
	| "CC"
	| "CO"
	| "KM"
	| "CG"
	| "CD"
	| "CK"
	| "CR"
	| "CI"
	| "HR"
	| "CU"
	| "CW"
	| "CY"
	| "CZ"
	| "DK"
	| "DJ"
	| "DM"
	| "DO"
	| "EC"
	| "EG"
	| "SV"
	| "GQ"
	| "ER"
	| "EE"
	| "ET"
	| "FK"
	| "FO"
	| "FJ"
	| "FI"
	| "FR"
	| "GF"
	| "PF"
	| "TF"
	| "GA"
	| "GM"
	| "GE"
	| "DE"
	| "GH"
	| "GI"
	| "GR"
	| "GL"
	| "GD"
	| "GP"
	| "GU"
	| "GT"
	| "GG"
	| "GN"
	| "GW"
	| "GY"
	| "HT"
	| "HM"
	| "VA"
	| "HN"
	| "HK"
	| "HU"
	| "IS"
	| "IN"
	| "ID"
	| "IR"
	| "IQ"
	| "IE"
	| "IM"
	| "IL"
	| "IT"
	| "JM"
	| "JP"
	| "JE"
	| "JO"
	| "KZ"
	| "KE"
	| "KI"
	| "KP"
	| "KR"
	| "KW"
	| "KG"
	| "LA"
	| "LV"
	| "LB"
	| "LS"
	| "LR"
	| "LY"
	| "LI"
	| "LT"
	| "LU"
	| "MO"
	| "MK"
	| "MG"
	| "MW"
	| "MY"
	| "MV"
	| "ML"
	| "MT"
	| "MH"
	| "MQ"
	| "MR"
	| "MU"
	| "YT"
	| "MX"
	| "FM"
	| "MD"
	| "MC"
	| "MN"
	| "ME"
	| "MS"
	| "MA"
	| "MZ"
	| "MM"
	| "NA"
	| "NR"
	| "NP"
	| "NL"
	| "NC"
	| "NZ"
	| "NI"
	| "NE"
	| "NG"
	| "NU"
	| "NF"
	| "MP"
	| "NO"
	| "OM"
	| "PK"
	| "PW"
	| "PS"
	| "PA"
	| "PG"
	| "PY"
	| "PE"
	| "PH"
	| "PN"
	| "PL"
	| "PT"
	| "PR"
	| "QA"
	| "RE"
	| "RO"
	| "RU"
	| "RW"
	| "BL"
	| "SH"
	| "KN"
	| "LC"
	| "MF"
	| "PM"
	| "VC"
	| "WS"
	| "SM"
	| "ST"
	| "SA"
	| "SN"
	| "RS"
	| "SC"
	| "SL"
	| "SG"
	| "SX"
	| "SK"
	| "SI"
	| "SB"
	| "SO"
	| "ZA"
	| "GS"
	| "SS"
	| "ES"
	| "LK"
	| "SD"
	| "SR"
	| "SJ"
	| "SZ"
	| "SE"
	| "CH"
	| "SY"
	| "TW"
	| "TJ"
	| "TZ"
	| "TH"
	| "TL"
	| "TG"
	| "TK"
	| "TO"
	| "TT"
	| "TN"
	| "TR"
	| "TM"
	| "TC"
	| "TV"
	| "UG"
	| "UA"
	| "AE"
	| "GB"
	| "US"
	| "UM"
	| "UY"
	| "UZ"
	| "VU"
	| "VE"
	| "VN"
	| "VG"
	| "VI"
	| "WF"
	| "EH"
	| "YE"
	| "ZM"
	| "ZW"

export type StatisticResetIntervalOption = 
	| "Never"
	| "Hour"
	| "Day"
	| "Week"
	| "Month"

export type GetPlayersInSegmentExportResponse = {
	--[[
		Url from which the index file can be downloaded.

	]]
	IndexUrl: string?,
	--[[
		Shows the current status of the export

	]]
	State: string?,
}

export type UserPsnInfo = {
	--[[
		PlayStation :tm: Network account ID

	]]
	PsnAccountId: string?,
	--[[
		PlayStation :tm: Network online ID

	]]
	PsnOnlineId: string?,
}

export type AdCampaignAttribution = {
	--[[
		UTC time stamp of attribution

	]]
	AttributedAt: string,
	--[[
		Attribution network name

	]]
	Platform: string?,
	--[[
		Attribution campaign identifier

	]]
	CampaignId: string?,
}

export type GetContentListRequest = {
	--[[
		Limits the response to keys that begin with the specified prefix. You can use
		prefixes to list contents under a folder, or for a specified version, etc.

	]]
	Prefix: string?,
}

export type ContentInfo = {
	--[[
		Last modified time

	]]
	LastModified: string,
	--[[
		Key of the content

	]]
	Key: string?,
	--[[
		Size of the content in bytes

	]]
	Size: number,
}

export type ContinentCode = 
	| "AF"
	| "AN"
	| "AS"
	| "EU"
	| "NA"
	| "OC"
	| "SA"
	| "Unknown"

--[[
	Containers are inventory items that can hold other items defined in the
	catalog, as well as virtual currency, which is added to the player inventory
	when the container is unlocked, using the UnlockContainerItem API. The items
	can be anything defined in the catalog, as well as RandomResultTable objects
	which will be resolved when the container is unlocked. Containers and their
	keys should be defined as Consumable (having a limited number of uses) in
	their catalog defintiions, unless the intent is for the player to be able to
	re-use them infinitely.

]]
export type CatalogItemContainerInfo = {
	--[[
		unique TableId values for all RandomResultTable objects which are part of the
		container (once unlocked, random tables will be resolved and add the relevant
		items to the player inventory)

	]]
	ResultTableContents: { string }?,
	--[[
		ItemId for the catalog item used to unlock the container, if any (if not
		specified, a call to UnlockContainerItem will open the container, adding the
		contents to the player inventory and currency balances)

	]]
	KeyItemId: string?,
	--[[
		unique ItemId values for all items which will be added to the player
		inventory, once the container has been unlocked

	]]
	ItemContents: { string }?,
	--[[
		virtual currency types and balances which will be added to the player
		inventory when the container is unlocked

	]]
	VirtualCurrencyContents: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type ModifyUserVirtualCurrencyResult = {
	--[[
		Amount added or subtracted from the user's virtual currency. Maximum VC
		balance is Int32 (2,147,483,647). Any increase over this value will be
		discarded.

	]]
	BalanceChange: number,
	--[[
		Balance of the virtual currency after modification.

	]]
	Balance: number,
	--[[
		User currency was subtracted from.

	]]
	PlayFabId: string?,
	--[[
		Name of the virtual currency which was modified.

	]]
	VirtualCurrency: string?,
}

--[[
	Update segment properties data which are planning to update

]]
export type UpdateSegmentRequest = {
	SegmentModel: SegmentModel,
}

export type UserGoogleInfo = {
	--[[
		Email address of the Google account

	]]
	GoogleEmail: string?,
	--[[
		Name of the Google account user

	]]
	GoogleName: string?,
	--[[
		Locale of the Google account

	]]
	GoogleLocale: string?,
	--[[
		Gender information of the Google account

	]]
	GoogleGender: string?,
	--[[
		Google ID

	]]
	GoogleId: string?,
}

export type UserNintendoSwitchDeviceIdInfo = {
	--[[
		Nintendo Switch Device ID

	]]
	NintendoSwitchDeviceId: string?,
}

export type Currency = 
	| "AED"
	| "AFN"
	| "ALL"
	| "AMD"
	| "ANG"
	| "AOA"
	| "ARS"
	| "AUD"
	| "AWG"
	| "AZN"
	| "BAM"
	| "BBD"
	| "BDT"
	| "BGN"
	| "BHD"
	| "BIF"
	| "BMD"
	| "BND"
	| "BOB"
	| "BRL"
	| "BSD"
	| "BTN"
	| "BWP"
	| "BYR"
	| "BZD"
	| "CAD"
	| "CDF"
	| "CHF"
	| "CLP"
	| "CNY"
	| "COP"
	| "CRC"
	| "CUC"
	| "CUP"
	| "CVE"
	| "CZK"
	| "DJF"
	| "DKK"
	| "DOP"
	| "DZD"
	| "EGP"
	| "ERN"
	| "ETB"
	| "EUR"
	| "FJD"
	| "FKP"
	| "GBP"
	| "GEL"
	| "GGP"
	| "GHS"
	| "GIP"
	| "GMD"
	| "GNF"
	| "GTQ"
	| "GYD"
	| "HKD"
	| "HNL"
	| "HRK"
	| "HTG"
	| "HUF"
	| "IDR"
	| "ILS"
	| "IMP"
	| "INR"
	| "IQD"
	| "IRR"
	| "ISK"
	| "JEP"
	| "JMD"
	| "JOD"
	| "JPY"
	| "KES"
	| "KGS"
	| "KHR"
	| "KMF"
	| "KPW"
	| "KRW"
	| "KWD"
	| "KYD"
	| "KZT"
	| "LAK"
	| "LBP"
	| "LKR"
	| "LRD"
	| "LSL"
	| "LYD"
	| "MAD"
	| "MDL"
	| "MGA"
	| "MKD"
	| "MMK"
	| "MNT"
	| "MOP"
	| "MRO"
	| "MUR"
	| "MVR"
	| "MWK"
	| "MXN"
	| "MYR"
	| "MZN"
	| "NAD"
	| "NGN"
	| "NIO"
	| "NOK"
	| "NPR"
	| "NZD"
	| "OMR"
	| "PAB"
	| "PEN"
	| "PGK"
	| "PHP"
	| "PKR"
	| "PLN"
	| "PYG"
	| "QAR"
	| "RON"
	| "RSD"
	| "RUB"
	| "RWF"
	| "SAR"
	| "SBD"
	| "SCR"
	| "SDG"
	| "SEK"
	| "SGD"
	| "SHP"
	| "SLL"
	| "SOS"
	| "SPL"
	| "SRD"
	| "STD"
	| "SVC"
	| "SYP"
	| "SZL"
	| "THB"
	| "TJS"
	| "TMT"
	| "TND"
	| "TOP"
	| "TRY"
	| "TTD"
	| "TVD"
	| "TWD"
	| "TZS"
	| "UAH"
	| "UGX"
	| "USD"
	| "UYU"
	| "UZS"
	| "VEF"
	| "VND"
	| "VUV"
	| "WST"
	| "XAF"
	| "XCD"
	| "XDR"
	| "XOF"
	| "XPF"
	| "YER"
	| "ZAR"
	| "ZMW"
	| "ZWD"

--[[
	Get all bans for a user, including inactive and expired bans.

]]
export type GetUserBansRequest = {
	--[[
		Unique PlayFab assigned ID of the user on whom the operation will be
		performed.

	]]
	PlayFabId: string,
}

export type GetCloudScriptRevisionRequest = {
	--[[
		Version number. If left null, defaults to the latest version

	]]
	Version: number?,
	--[[
		Revision number. If left null, defaults to the latest revision

	]]
	Revision: number?,
}

export type CheckLimitedEditionItemAvailabilityResult = {
	--[[
		The amount of the specified resource remaining.

	]]
	Amount: number,
}

export type DeletePlayerStatisticSegmentAction = {
	--[[
		Statistic name.

	]]
	StatisticName: string?,
}

export type SendAccountRecoveryEmailResult = {
	-- No properties defined in spec
	[string]: any
}

export type RandomResultTableListing = {
	--[[
		Unique name for this drop table

	]]
	TableId: string,
	--[[
		Child nodes that indicate what kind of drop table item this actually is.

	]]
	Nodes: { ResultTableNode },
	--[[
		Catalog version this table is associated with

	]]
	CatalogVersion: string?,
}

--[[
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

]]
export type CreatePlayerStatisticDefinitionRequest = {
	AggregationMethod: StatisticAggregationMethod?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		unique name of the statistic

	]]
	StatisticName: string,
	VersionChangeInterval: StatisticResetIntervalOption?,
}

--[[
	APIs that require signatures require that the player have a configured
	Player Secret Key that is used to sign all requests. Players that don't have
	a secret will be blocked from making API calls until it is configured. To
	create a signature header add a SHA256 hashed string containing UTF8 encoded
	JSON body as it will be sent to the server, the current time in UTC
	formatted to ISO 8601, and the players secret formatted as
	'body.date.secret'. Place the resulting hash into the header
	X-PlayFab-Signature, along with a header X-PlayFab-Timestamp of the same UTC
	timestamp used in the signature.

]]
export type SetPlayerSecretRequest = {
	--[[
		Player secret that is used to verify API request signatures (Enterprise Only).

	]]
	PlayerSecret: string?,
	--[[
		Unique PlayFab assigned ID of the user on whom the operation will be
		performed.

	]]
	PlayFabId: string,
}

export type GetActionsOnPlayersInSegmentTaskInstanceResult = {
	Parameter: ActionsOnPlayersInSegmentTaskParameter?,
	Summary: ActionsOnPlayersInSegmentTaskSummary?,
}

export type SharedSecret = {
	--[[
		The player shared secret to use when calling Client/GetTitlePublicKey

	]]
	SecretKey: string?,
	--[[
		Flag to indicate if this key is disabled

	]]
	Disabled: boolean,
	--[[
		Friendly name for this key

	]]
	FriendlyName: string?,
}

export type AddNewsResult = {
	--[[
		Unique id of the new news item

	]]
	NewsId: string?,
}

export type TagSegmentFilter = {
	--[[
		Tag value.

	]]
	TagValue: string?,
	Comparison: SegmentFilterComparison?,
}

export type BanUsersResult = {
	--[[
		Information on the bans that were applied

	]]
	BanData: { BanInfo }?,
}

export type DeleteContentRequest = {
	--[[
		Key of the content item to be deleted

	]]
	Key: string,
}

--[[
	Request must contain the Segment ID

]]
export type ExportPlayersInSegmentRequest = {
	--[[
		Unique identifier of the requested segment.

	]]
	SegmentId: string,
}

export type GetCloudScriptVersionsRequest = {
	-- No properties defined in spec
	[string]: any
}

--[[
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

]]
export type DeleteMasterPlayerAccountRequest = {
	--[[
		Developer created string to identify a user without PlayFab ID

	]]
	MetaData: string?,
	--[[
		Unique PlayFab assigned ID of the user on whom the operation will be
		performed.

	]]
	PlayFabId: string,
}

export type CatalogItemConsumableInfo = {
	--[[
		duration in seconds for how long the item will remain in the player inventory
		- once elapsed, the item will be removed (recommended minimum value is 5
		seconds, as lower values can cause the item to expire before operations
		depending on this item's details have completed)

	]]
	UsagePeriod: number?,
	--[[
		number of times this object can be used, after which it will be removed from
		the player inventory

	]]
	UsageCount: number?,
	--[[
		all inventory item instances in the player inventory sharing a non-null
		UsagePeriodGroup have their UsagePeriod values added together, and share the
		result - when that period has elapsed, all the items in the group will be
		removed

	]]
	UsagePeriodGroup: string?,
}

export type GrantVirtualCurrencySegmentAction = {
	--[[
		Virtual currency amount.

	]]
	Amount: number,
	--[[
		Virtual currency code.

	]]
	CurrencyCode: string?,
}

export type GetPlayerCustomPropertyRequest = {
	--[[
		Specific property name to search for in the player's properties.

	]]
	PropertyName: string,
	--[[
		Unique PlayFab assigned ID of the user on whom the operation will be
		performed.

	]]
	PlayFabId: string,
}

export type ActionsOnPlayersInSegmentTaskSummary = {
	--[[
		Estimated time remaining in seconds.

	]]
	EstimatedSecondsRemaining: number?,
	--[[
		Flag indicating if the error was fatal, if false job will be retried.

	]]
	ErrorWasFatal: boolean?,
	--[[
		ID of the task instance.

	]]
	TaskInstanceId: string?,
	--[[
		Identifier by either name or ID. Note that a name may change due to renaming,
		or reused after being deleted. ID is immutable and unique.

	]]
	TaskIdentifier: NameIdentifier?,
	--[[
		Total number of players that have had the actions applied to.

	]]
	TotalPlayersProcessed: number?,
	--[[
		Total players in segment when task was started.

	]]
	TotalPlayersInSegment: number?,
	--[[
		UTC timestamp when the task started.

	]]
	StartedAt: string,
	--[[
		If manually scheduled, ID of user who scheduled the task.

	]]
	ScheduledByUserId: string?,
	Status: TaskInstanceStatus?,
	--[[
		Error message for last processing attempt, if an error occured.

	]]
	ErrorMessage: string?,
	--[[
		Progress represented as percentage.

	]]
	PercentComplete: number?,
	--[[
		UTC timestamp when the task completed.

	]]
	CompletedAt: string?,
}

export type EffectType = 
	| "Allow"
	| "Deny"

--[[
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

]]
export type IncrementPlayerStatisticVersionRequest = {
	--[[
		unique name of the statistic

	]]
	StatisticName: string?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type EmptyResponse = {
	-- No properties defined in spec
	[string]: any
}

export type VirtualCurrencyRechargeTime = {
	--[[
		Server timestamp in UTC indicating the next time the virtual currency will be
		incremented.

	]]
	RechargeTime: string,
	--[[
		Time remaining (in seconds) before the next recharge increment of the virtual
		currency.

	]]
	SecondsToRecharge: number,
	--[[
		Maximum value to which the regenerating currency will automatically increment.
		Note that it can exceed this value through use of the AddUserVirtualCurrency
		API call. However, it will not regenerate automatically until it has fallen
		below this value.

	]]
	RechargeMax: number,
}

--[[
	Player Shared Secret Keys are used for the call to Client/GetTitlePublicKey,
	which exchanges the shared secret for an RSA CSP blob to be used to encrypt
	the payload of account creation requests when that API requires a signature
	header.

]]
export type GetPlayerSharedSecretsRequest = {
	-- No properties defined in spec
	[string]: any
}

--[[
	A unique instance of an item in a user's inventory. Note, to retrieve
	additional information for an item such as Tags, Description that are the
	same across all instances of the item, a call to GetCatalogItems is
	required. The ItemID of can be matched to a catalog entry, which contains
	the additional information. Also note that Custom Data is only set when the
	User's specific instance has updated the CustomData via a call to
	UpdateUserInventoryItemCustomData. Other fields such as UnitPrice and
	UnitCurrency are only set when the item was granted via a purchase.

]]
export type ItemInstance = {
	--[[
		Array of unique items that were awarded when this catalog item was purchased.

	]]
	BundleContents: { string }?,
	--[[
		Class name for the inventory item, as defined in the catalog.

	]]
	ItemClass: string?,
	--[[
		Total number of remaining uses, if this is a consumable item.

	]]
	RemainingUses: number?,
	--[[
		Unique identifier for the parent inventory item, as defined in the catalog,
		for object which were added from a bundle or container.

	]]
	BundleParent: string?,
	--[[
		A set of custom key-value pairs on the instance of the inventory item, which
		is not to be confused with the catalog item's custom data.

	]]
	CustomData: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		The number of uses that were added or removed to this item in this call.

	]]
	UsesIncrementedBy: number?,
	--[[
		Catalog version for the inventory item, when this instance was created.

	]]
	CatalogVersion: string?,
	--[[
		Timestamp for when this instance will expire.

	]]
	Expiration: string?,
	--[[
		Currency type for the cost of the catalog item. Not available when granting
		items.

	]]
	UnitCurrency: string?,
	--[[
		Game specific comment associated with this instance when it was added to the
		user inventory.

	]]
	Annotation: string?,
	--[[
		Unique item identifier for this specific instance of the item.

	]]
	ItemInstanceId: string?,
	--[[
		Cost of the catalog item in the given currency. Not available when granting
		items.

	]]
	UnitPrice: number,
	--[[
		CatalogItem.DisplayName at the time this item was purchased.

	]]
	DisplayName: string?,
	--[[
		Timestamp for when this instance was purchased.

	]]
	PurchaseDate: string?,
	--[[
		Unique identifier for the inventory item, as defined in the catalog.

	]]
	ItemId: string?,
}

--[[
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

]]
export type GetPlayersInSegmentRequest = {
	--[[
		Continuation token if retrieving subsequent pages of results.

	]]
	ContinuationToken: string?,
	--[[
		Maximum is 10,000. The value 0 will prevent loading any profiles and return
		only the count of profiles matching this segment.

	]]
	MaxBatchSize: number?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		If set to true, the profiles are loaded asynchronously and the response will
		include a continuation token and approximate profile count until the first
		batch of profiles is loaded. Use this parameter to help avoid network
		timeouts.

	]]
	GetProfilesAsync: boolean?,
	--[[
		Unique identifier for this segment.

	]]
	SegmentId: string,
	--[[
		Number of seconds to keep the continuation token active. After token
		expiration it is not possible to continue paging results. Default is 300 (5
		minutes). Maximum is 5,400 (90 minutes).

	]]
	SecondsToLive: number?,
}

export type GetPlayersInSegmentResult = {
	--[[
		Count of profiles matching this segment.

	]]
	ProfilesInSegment: number,
	--[[
		Array of player profiles in this segment.

	]]
	PlayerProfiles: { PlayerProfile }?,
	--[[
		Continuation token to use to retrieve subsequent pages of results. If token
		returns null there are no more results.

	]]
	ContinuationToken: string?,
}

--[[
	This API will trigger a player_tag_removed event and remove a tag with the
	given TagName and PlayFabID from the corresponding player profile. TagName
	can be used for segmentation and it is limited to 256 characters

]]
export type RemovePlayerTagRequest = {
	--[[
		Unique PlayFab assigned ID of the user on whom the operation will be
		performed.

	]]
	PlayFabId: string,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		Unique tag for player profile.

	]]
	TagName: string,
}

export type GetPublisherDataResult = {
	--[[
		a dictionary object of key / value pairs

	]]
	Data: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type VirtualCurrencyData = {
	--[[
		unique two-character identifier for this currency type (e.g.: "CC")

	]]
	CurrencyCode: string,
	--[[
		friendly name to show in the developer portal, reports, etc.

	]]
	DisplayName: string?,
	--[[
		maximum amount to which the currency will recharge (cannot exceed MaxAmount,
		but can be less)

	]]
	RechargeMax: number?,
	--[[
		rate at which the currency automatically be added to over time, in units per
		day (24 hours)

	]]
	RechargeRate: number?,
	--[[
		amount to automatically grant users upon first login to the title

	]]
	InitialDeposit: number?,
}

export type EmailVerificationStatus = 
	| "Unverified"
	| "Pending"
	| "Confirmed"

--[[
	The result includes detail information that's specific to a CloudScript
	task. Only CloudScript tasks configured as "Run Cloud Script function once"
	will be retrieved. To get a list of task instances by task, status, or time
	range, use GetTaskInstances.

]]
export type GetTaskInstanceRequest = {
	--[[
		ID of the requested task instance.

	]]
	TaskInstanceId: string,
}

export type UserFacebookInstantGamesIdInfo = {
	--[[
		Facebook Instant Games ID

	]]
	FacebookInstantGamesId: string?,
}

export type ResolutionOutcome = 
	| "Revoke"
	| "Reinstate"
	| "Manual"

export type DeletePlayerContent = {
	-- No properties defined in spec
	[string]: any
}

--[[
	All items currently in the user inventory will be returned, irrespective of
	how they were acquired (via purchasing, grants, coupons, etc.). Items that
	are expired, fully consumed, or are no longer valid are not considered to be
	in the user's current inventory, and so will not be not included. There can
	be a delay of up to a half a second for inventory changes to be reflected in
	the GetUserInventory API response.

]]
export type GetUserInventoryRequest = {
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		Unique PlayFab assigned ID of the user on whom the operation will be
		performed.

	]]
	PlayFabId: string,
}

export type UserOrigination = 
	| "Organic"
	| "Steam"
	| "Google"
	| "Amazon"
	| "Facebook"
	| "Kongregate"
	| "GamersFirst"
	| "Unknown"
	| "IOS"
	| "LoadTest"
	| "Android"
	| "PSN"
	| "GameCenter"
	| "CustomId"
	| "XboxLive"
	| "Parse"
	| "Twitch"
	| "ServerCustomId"
	| "NintendoSwitchDeviceId"
	| "FacebookInstantGamesId"
	| "OpenIdConnect"
	| "Apple"
	| "NintendoSwitchAccount"
	| "GooglePlayGames"
	| "XboxMobileStore"
	| "King"
	| "BattleNet"

export type IncrementPlayerStatisticVersionResult = {
	StatisticVersion: PlayerStatisticVersion?,
}

export type RevokeInventoryResult = {
	-- No properties defined in spec
	[string]: any
}

--[[
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

]]
export type DeleteTitleRequest = {
	-- No properties defined in spec
	[string]: any
}

export type BlankResult = {
	-- No properties defined in spec
	[string]: any
}

export type AddUserVirtualCurrencyRequest = {
	--[[
		Amount to be added to the user balance of the specified virtual currency.
		Maximum VC balance is Int32 (2,147,483,647). Any increase over this value will
		be discarded.

	]]
	Amount: number,
	--[[
		PlayFab unique identifier of the user whose virtual currency balance is to be
		increased.

	]]
	PlayFabId: string,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		Name of the virtual currency which is to be incremented.

	]]
	VirtualCurrency: string,
}

export type GetCloudScriptRevisionResult = {
	--[[
		Revision number.

	]]
	Revision: number,
	--[[
		Version number.

	]]
	Version: number,
	--[[
		List of Cloud Script files in this revision.

	]]
	Files: { CloudScriptFile }?,
	--[[
		Time this revision was created

	]]
	CreatedAt: string,
	--[[
		True if this is the currently published revision

	]]
	IsPublished: boolean,
}

export type CloudScriptVersionStatus = {
	--[[
		Most recent revision for this Cloud Script version

	]]
	LatestRevision: number,
	--[[
		Version number

	]]
	Version: number,
	--[[
		Published code revision for this Cloud Script version

	]]
	PublishedRevision: number,
}

export type GetPlayerTagsResult = {
	--[[
		Unique PlayFab assigned ID of the user on whom the operation will be
		performed.

	]]
	PlayFabId: string,
	--[[
		Canonical tags (including namespace and tag's name) for the requested user

	]]
	Tags: { string },
}

--[[
	This function performs an additive update of the arbitrary JSON object
	containing the custom data for the user. In updating the custom data object,
	keys which already exist in the object will have their values overwritten,
	keys with null values will be removed. No other key-value pairs will be
	changed apart from those specified in the call.

]]
export type UpdateUserInternalDataRequest = {
	--[[
		Key-value pairs to be written to the custom data. Note that keys are trimmed
		of whitespace, are limited in size, and may not begin with a '!' character or
		be null.

	]]
	Data: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		Unique PlayFab assigned ID of the user on whom the operation will be
		performed.

	]]
	PlayFabId: string,
	--[[
		Optional list of Data-keys to remove from UserData. Some SDKs cannot insert
		null-values into Data due to language constraints. Use this to delete the keys
		directly.

	]]
	KeysToRemove: { string }?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type DeleteMembershipSubscriptionResult = {
	-- No properties defined in spec
	[string]: any
}

export type GetUserDataResult = {
	--[[
		Indicates the current version of the data that has been set. This is
		incremented with every set call for that type of data (read-only, internal,
		etc). This version can be provided in Get calls to find updated data.

	]]
	DataVersion: number,
	Data: UserDataRecord?,
	--[[
		PlayFab unique identifier of the user whose custom data is being returned.

	]]
	PlayFabId: string?,
}

export type SetTitleDataResult = {
	-- No properties defined in spec
	[string]: any
}

--[[
	Given input segment ids, return list of segments.

]]
export type GetSegmentsRequest = {
	--[[
		Segment ids to filter title segments.

	]]
	SegmentIds: { string },
}

--[[
	Represents a single ban request.

]]
export type BanRequest = {
	--[[
		Unique PlayFab assigned ID of the user on whom the operation will be
		performed.

	]]
	PlayFabId: string,
	UserFamilyType: UserFamilyType?,
	--[[
		The duration in hours for the ban. Leave this blank for a permanent ban.

	]]
	DurationInHours: number?,
	--[[
		IP address to be banned. May affect multiple players.

	]]
	IPAddress: string?,
	--[[
		The reason for this ban. Maximum 140 characters.

	]]
	Reason: string?,
}

--[[
	The existence of each user will not be verified. When banning by IP or MAC
	address, multiple players may be affected, so use this feature with caution.
	Returns information about the new bans.

]]
export type BanUsersRequest = {
	--[[
		List of ban requests to be applied. Maximum 100.

	]]
	Bans: { BanRequest },
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type UserFamilyType = 
	| "None"
	| "Xbox"
	| "Steam"

--[[
	If the task instance has already completed, there will be no-op.

]]
export type AbortTaskInstanceRequest = {
	--[[
		ID of a task instance that is being aborted.

	]]
	TaskInstanceId: string,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

--[[
	This function directly adds inventory items to user inventories. As a result
	of this operations, the user will not be charged any transaction fee,
	regardless of the inventory item catalog definition. Please note that the
	processing time for inventory grants and purchases increases fractionally
	the more items are in the inventory, and the more items are in the
	grant/purchase operation.

]]
export type GrantItemsToUsersRequest = {
	--[[
		Array of items to grant and the users to whom the items are to be granted.

	]]
	ItemGrants: { ItemGrant },
	--[[
		Catalog version from which items are to be granted.

	]]
	CatalogVersion: string?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type GrantVirtualCurrencyContent = {
	--[[
		Amount of currency to be granted to a player

	]]
	CurrencyAmount: number,
	--[[
		Code of the currency to be granted to a player

	]]
	CurrencyCode: string,
}

export type ResolvePurchaseDisputeResponse = {
	--[[
		The order's updated purchase status.

	]]
	PurchaseStatus: string?,
}

export type GetRandomResultTablesRequest = {
	--[[
		catalog version to fetch tables from. Use default catalog version if null

	]]
	CatalogVersion: string?,
}

--[[
	Views the requested policy. Today, the only supported policy is 'ApiPolicy'.

]]
export type GetPolicyRequest = {
	--[[
		The name of the policy to read. Only supported name is 'ApiPolicy'.

	]]
	PolicyName: string?,
}

export type OpenIdConnection = {
	IssuerInformation: OpenIdIssuerInformation?,
	--[[
		A name for the connection to identify it within the title.

	]]
	ConnectionId: string?,
	--[[
		Shows if data about the connection will be loaded from the issuer's discovery
		document

	]]
	DiscoverConfiguration: boolean,
	--[[
		The client ID given by the ID provider.

	]]
	ClientId: string?,
	--[[
		The client secret given by the ID provider.

	]]
	ClientSecret: string?,
	--[[
		Ignore 'nonce' claim in identity tokens.

	]]
	IgnoreNonce: boolean?,
	--[[
		Override the issuer name for user indexing and lookup.

	]]
	IssuerOverride: string?,
}

export type DeleteTitleResult = {
	-- No properties defined in spec
	[string]: any
}

export type IncrementPlayerStatisticSegmentAction = {
	--[[
		Statistic name.

	]]
	StatisticName: string?,
	--[[
		Increment value.

	]]
	IncrementValue: number,
}

--[[
	Note that this action cannot be un-done. All statistics for this user will
	be deleted, removing the user from all leaderboards for the game.

]]
export type ResetUserStatisticsRequest = {
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		Unique PlayFab assigned ID of the user on whom the operation will be
		performed.

	]]
	PlayFabId: string,
}

--[[
	Gets the download URL for the requested report data (in CSV form). The
	reports available through this API call are those available in the Game
	Manager, in the Analytics->Reports tab.

]]
export type GetDataReportRequest = {
	--[[
		Reporting month (UTC)

	]]
	Month: number,
	--[[
		Reporting year (UTC)

	]]
	Day: number,
	--[[
		Reporting year (UTC)

	]]
	Year: number,
	--[[
		Report name

	]]
	ReportName: string,
}

export type SegmentAndDefinition = {
	AllPlayersFilter: AllPlayersSegmentFilter?,
	ChurnPredictionFilter: ChurnPredictionSegmentFilter?,
	PlayerChurnPreviousPredictionFilter: PlayerChurnPreviousPredictionSegmentFilter?,
	CustomPropertyNumericFilter: CustomPropertyNumericSegmentFilter?,
	LocationFilter: LocationSegmentFilter?,
	PlayerChurnPredictionTimeFilter: PlayerChurnPredictionTimeSegmentFilter?,
	CustomPropertyDateTimeFilter: CustomPropertyDateTimeSegmentFilter?,
	PushNotificationFilter: PushNotificationSegmentFilter?,
	LastLoginDateFilter: LastLoginDateSegmentFilter?,
	CustomPropertyBooleanFilter: CustomPropertyBooleanSegmentFilter?,
	PlayerChurnPredictionFilter: PlayerChurnPredictionSegmentFilter?,
	FirstLoginDateFilter: FirstLoginDateSegmentFilter?,
	FirstLoginFilter: FirstLoginTimespanSegmentFilter?,
	LastLoginFilter: LastLoginTimespanSegmentFilter?,
	StatisticFilter: StatisticSegmentFilter?,
	AdCampaignFilter: AdCampaignSegmentFilter?,
	UserOriginationFilter: UserOriginationSegmentFilter?,
	LinkedUserAccountHasEmailFilter: LinkedUserAccountHasEmailSegmentFilter?,
	VirtualCurrencyBalanceFilter: VirtualCurrencyBalanceSegmentFilter?,
	TotalValueToDateInUSDFilter: TotalValueToDateInUSDSegmentFilter?,
	TagFilter: TagSegmentFilter?,
	LinkedUserAccountFilter: LinkedUserAccountSegmentFilter?,
	CustomPropertyStringFilter: CustomPropertyStringSegmentFilter?,
	ValueToDateFilter: ValueToDateSegmentFilter?,
}

export type ListOpenIdConnectionResponse = {
	--[[
		The list of Open ID Connections

	]]
	Connections: { OpenIdConnection }?,
}

--[[
	Only the most recent 100 task instances are returned, ordered by start time
	descending. The results are generic basic information for task instances. To
	get detail information specific to each task type, use Get*TaskInstance
	based on its corresponding task type.

]]
export type GetTaskInstancesRequest = {
	--[[
		Optional range-from filter for task instances' StartedAt timestamp.

	]]
	StartedAtRangeFrom: string?,
	--[[
		Identifier by either name or ID. Note that a name may change due to renaming,
		or reused after being deleted. ID is immutable and unique.

	]]
	TaskIdentifier: NameIdentifier?,
	--[[
		Optional range-to filter for task instances' StartedAt timestamp.

	]]
	StartedAtRangeTo: string?,
	StatusFilter: TaskInstanceStatus?,
}

export type DeleteTitleDataOverrideResult = {
	-- No properties defined in spec
	[string]: any
}

export type GetTitleDataResult = {
	--[[
		a dictionary object of key / value pairs

	]]
	Data: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type PlayerStatistic = {
	--[[
		Statistic ID

	]]
	Id: string?,
	--[[
		Current statistic value

	]]
	StatisticValue: number,
	--[[
		Statistic name

	]]
	Name: string?,
	--[[
		Statistic version (0 if not a versioned statistic)

	]]
	StatisticVersion: number,
}

export type GetPolicyResponse = {
	--[[
		The name of the policy read.

	]]
	PolicyName: string?,
	--[[
		The statements in the requested policy.

	]]
	Statements: { PermissionStatement }?,
	--[[
		Policy version.

	]]
	PolicyVersion: number,
}

export type FirstLoginTimespanSegmentFilter = {
	--[[
		First player login duration.

	]]
	DurationInMinutes: number,
	Comparison: SegmentFilterComparison?,
}

export type StatisticSegmentFilter = {
	Comparison: SegmentFilterComparison?,
	--[[
		Statistic name.

	]]
	Name: string?,
	--[[
		Statistic filter value.

	]]
	FilterValue: string?,
	--[[
		Use current version of statistic?

	]]
	UseCurrentVersion: boolean?,
	--[[
		Statistic version.

	]]
	Version: number?,
}

export type CloudScriptTaskParameter = {
	--[[
		Argument to pass to the CloudScript function.

	]]
	Argument: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		Name of the CloudScript function to execute.

	]]
	FunctionName: string?,
}

--[[
	This API will return a list of canonical tags which includes both namespace
	and tag's name. If namespace is not provided, the result is a list of all
	canonical tags. TagName can be used for segmentation and Namespace is
	limited to 128 characters.

]]
export type GetPlayerTagsRequest = {
	--[[
		Unique PlayFab assigned ID of the user on whom the operation will be
		performed.

	]]
	PlayFabId: string,
	--[[
		Optional namespace to filter results by

	]]
	Namespace: string?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type PushSetupPlatform = 
	| "GCM"
	| "APNS"
	| "APNS_SANDBOX"

export type GenericErrorCodes = 
	| "Success"
	| "UnkownError"
	| "InvalidParams"
	| "AccountNotFound"
	| "AccountBanned"
	| "InvalidUsernameOrPassword"
	| "InvalidTitleId"
	| "InvalidEmailAddress"
	| "EmailAddressNotAvailable"
	| "InvalidUsername"
	| "InvalidPassword"
	| "UsernameNotAvailable"
	| "InvalidSteamTicket"
	| "AccountAlreadyLinked"
	| "LinkedAccountAlreadyClaimed"
	| "InvalidFacebookToken"
	| "AccountNotLinked"
	| "FailedByPaymentProvider"
	| "CouponCodeNotFound"
	| "InvalidContainerItem"
	| "ContainerNotOwned"
	| "KeyNotOwned"
	| "InvalidItemIdInTable"
	| "InvalidReceipt"
	| "ReceiptAlreadyUsed"
	| "ReceiptCancelled"
	| "GameNotFound"
	| "GameModeNotFound"
	| "InvalidGoogleToken"
	| "UserIsNotPartOfDeveloper"
	| "InvalidTitleForDeveloper"
	| "TitleNameConflicts"
	| "UserisNotValid"
	| "ValueAlreadyExists"
	| "BuildNotFound"
	| "PlayerNotInGame"
	| "InvalidTicket"
	| "InvalidDeveloper"
	| "InvalidOrderInfo"
	| "RegistrationIncomplete"
	| "InvalidPlatform"
	| "UnknownError"
	| "SteamApplicationNotOwned"
	| "WrongSteamAccount"
	| "TitleNotActivated"
	| "RegistrationSessionNotFound"
	| "NoSuchMod"
	| "FileNotFound"
	| "DuplicateEmail"
	| "ItemNotFound"
	| "ItemNotOwned"
	| "ItemNotRecycleable"
	| "ItemNotAffordable"
	| "InvalidVirtualCurrency"
	| "WrongVirtualCurrency"
	| "WrongPrice"
	| "NonPositiveValue"
	| "InvalidRegion"
	| "RegionAtCapacity"
	| "ServerFailedToStart"
	| "NameNotAvailable"
	| "InsufficientFunds"
	| "InvalidDeviceID"
	| "InvalidPushNotificationToken"
	| "NoRemainingUses"
	| "InvalidPaymentProvider"
	| "PurchaseInitializationFailure"
	| "DuplicateUsername"
	| "InvalidBuyerInfo"
	| "NoGameModeParamsSet"
	| "BodyTooLarge"
	| "ReservedWordInBody"
	| "InvalidTypeInBody"
	| "InvalidRequest"
	| "ReservedEventName"
	| "InvalidUserStatistics"
	| "NotAuthenticated"
	| "StreamAlreadyExists"
	| "ErrorCreatingStream"
	| "StreamNotFound"
	| "InvalidAccount"
	| "PurchaseDoesNotExist"
	| "InvalidPurchaseTransactionStatus"
	| "APINotEnabledForGameClientAccess"
	| "NoPushNotificationARNForTitle"
	| "BuildAlreadyExists"
	| "BuildPackageDoesNotExist"
	| "CustomAnalyticsEventsNotEnabledForTitle"
	| "InvalidSharedGroupId"
	| "NotAuthorized"
	| "MissingTitleGoogleProperties"
	| "InvalidItemProperties"
	| "InvalidPSNAuthCode"
	| "InvalidItemId"
	| "PushNotEnabledForAccount"
	| "PushServiceError"
	| "ReceiptDoesNotContainInAppItems"
	| "ReceiptContainsMultipleInAppItems"
	| "InvalidBundleID"
	| "JavascriptException"
	| "InvalidSessionTicket"
	| "UnableToConnectToDatabase"
	| "InternalServerError"
	| "InvalidReportDate"
	| "DatabaseThroughputExceeded"
	| "InvalidGameTicket"
	| "ExpiredGameTicket"
	| "GameTicketDoesNotMatchLobby"
	| "LinkedDeviceAlreadyClaimed"
	| "DeviceAlreadyLinked"
	| "DeviceNotLinked"
	| "PartialFailure"
	| "PublisherNotSet"
	| "ServiceUnavailable"
	| "VersionNotFound"
	| "RevisionNotFound"
	| "InvalidPublisherId"
	| "DownstreamServiceUnavailable"
	| "APINotIncludedInTitleUsageTier"
	| "DAULimitExceeded"
	| "APIRequestLimitExceeded"
	| "InvalidAPIEndpoint"
	| "BuildNotAvailable"
	| "ConcurrentEditError"
	| "ContentNotFound"
	| "CharacterNotFound"
	| "CloudScriptNotFound"
	| "ContentQuotaExceeded"
	| "InvalidCharacterStatistics"
	| "PhotonNotEnabledForTitle"
	| "PhotonApplicationNotFound"
	| "PhotonApplicationNotAssociatedWithTitle"
	| "InvalidEmailOrPassword"
	| "FacebookAPIError"
	| "InvalidContentType"
	| "KeyLengthExceeded"
	| "DataLengthExceeded"
	| "TooManyKeys"
	| "FreeTierCannotHaveVirtualCurrency"
	| "MissingAmazonSharedKey"
	| "AmazonValidationError"
	| "InvalidPSNIssuerId"
	| "PSNInaccessible"
	| "ExpiredAuthToken"
	| "FailedToGetEntitlements"
	| "FailedToConsumeEntitlement"
	| "TradeAcceptingUserNotAllowed"
	| "TradeInventoryItemIsAssignedToCharacter"
	| "TradeInventoryItemIsBundle"
	| "TradeStatusNotValidForCancelling"
	| "TradeStatusNotValidForAccepting"
	| "TradeDoesNotExist"
	| "TradeCancelled"
	| "TradeAlreadyFilled"
	| "TradeWaitForStatusTimeout"
	| "TradeInventoryItemExpired"
	| "TradeMissingOfferedAndAcceptedItems"
	| "TradeAcceptedItemIsBundle"
	| "TradeAcceptedItemIsStackable"
	| "TradeInventoryItemInvalidStatus"
	| "TradeAcceptedCatalogItemInvalid"
	| "TradeAllowedUsersInvalid"
	| "TradeInventoryItemDoesNotExist"
	| "TradeInventoryItemIsConsumed"
	| "TradeInventoryItemIsStackable"
	| "TradeAcceptedItemsMismatch"
	| "InvalidKongregateToken"
	| "FeatureNotConfiguredForTitle"
	| "NoMatchingCatalogItemForReceipt"
	| "InvalidCurrencyCode"
	| "NoRealMoneyPriceForCatalogItem"
	| "TradeInventoryItemIsNotTradable"
	| "TradeAcceptedCatalogItemIsNotTradable"
	| "UsersAlreadyFriends"
	| "LinkedIdentifierAlreadyClaimed"
	| "CustomIdNotLinked"
	| "TotalDataSizeExceeded"
	| "DeleteKeyConflict"
	| "InvalidXboxLiveToken"
	| "ExpiredXboxLiveToken"
	| "ResettableStatisticVersionRequired"
	| "NotAuthorizedByTitle"
	| "NoPartnerEnabled"
	| "InvalidPartnerResponse"
	| "APINotEnabledForGameServerAccess"
	| "StatisticNotFound"
	| "StatisticNameConflict"
	| "StatisticVersionClosedForWrites"
	| "StatisticVersionInvalid"
	| "APIClientRequestRateLimitExceeded"
	| "InvalidJSONContent"
	| "InvalidDropTable"
	| "StatisticVersionAlreadyIncrementedForScheduledInterval"
	| "StatisticCountLimitExceeded"
	| "StatisticVersionIncrementRateExceeded"
	| "ContainerKeyInvalid"
	| "CloudScriptExecutionTimeLimitExceeded"
	| "NoWritePermissionsForEvent"
	| "CloudScriptFunctionArgumentSizeExceeded"
	| "CloudScriptAPIRequestCountExceeded"
	| "CloudScriptAPIRequestError"
	| "CloudScriptHTTPRequestError"
	| "InsufficientGuildRole"
	| "GuildNotFound"
	| "OverLimit"
	| "EventNotFound"
	| "InvalidEventField"
	| "InvalidEventName"
	| "CatalogNotConfigured"
	| "OperationNotSupportedForPlatform"
	| "SegmentNotFound"
	| "StoreNotFound"
	| "InvalidStatisticName"
	| "TitleNotQualifiedForLimit"
	| "InvalidServiceLimitLevel"
	| "ServiceLimitLevelInTransition"
	| "CouponAlreadyRedeemed"
	| "GameServerBuildSizeLimitExceeded"
	| "GameServerBuildCountLimitExceeded"
	| "VirtualCurrencyCountLimitExceeded"
	| "VirtualCurrencyCodeExists"
	| "TitleNewsItemCountLimitExceeded"
	| "InvalidTwitchToken"
	| "TwitchResponseError"
	| "ProfaneDisplayName"
	| "UserAlreadyAdded"
	| "InvalidVirtualCurrencyCode"
	| "VirtualCurrencyCannotBeDeleted"
	| "IdentifierAlreadyClaimed"
	| "IdentifierNotLinked"
	| "InvalidContinuationToken"
	| "ExpiredContinuationToken"
	| "InvalidSegment"
	| "InvalidSessionId"
	| "SessionLogNotFound"
	| "InvalidSearchTerm"
	| "TwoFactorAuthenticationTokenRequired"
	| "GameServerHostCountLimitExceeded"
	| "PlayerTagCountLimitExceeded"
	| "RequestAlreadyRunning"
	| "ActionGroupNotFound"
	| "MaximumSegmentBulkActionJobsRunning"
	| "NoActionsOnPlayersInSegmentJob"
	| "DuplicateStatisticName"
	| "ScheduledTaskNameConflict"
	| "ScheduledTaskCreateConflict"
	| "InvalidScheduledTaskName"
	| "InvalidTaskSchedule"
	| "SteamNotEnabledForTitle"
	| "LimitNotAnUpgradeOption"
	| "NoSecretKeyEnabledForCloudScript"
	| "TaskNotFound"
	| "TaskInstanceNotFound"
	| "InvalidIdentityProviderId"
	| "MisconfiguredIdentityProvider"
	| "InvalidScheduledTaskType"
	| "BillingInformationRequired"
	| "LimitedEditionItemUnavailable"
	| "InvalidAdPlacementAndReward"
	| "AllAdPlacementViewsAlreadyConsumed"
	| "GoogleOAuthNotConfiguredForTitle"
	| "GoogleOAuthError"
	| "UserNotFriend"
	| "InvalidSignature"
	| "InvalidPublicKey"
	| "GoogleOAuthNoIdTokenIncludedInResponse"
	| "StatisticUpdateInProgress"
	| "LeaderboardVersionNotAvailable"
	| "StatisticAlreadyHasPrizeTable"
	| "PrizeTableHasOverlappingRanks"
	| "PrizeTableHasMissingRanks"
	| "PrizeTableRankStartsAtZero"
	| "InvalidStatistic"
	| "ExpressionParseFailure"
	| "ExpressionInvokeFailure"
	| "ExpressionTooLong"
	| "DataUpdateRateExceeded"
	| "RestrictedEmailDomain"
	| "EncryptionKeyDisabled"
	| "EncryptionKeyMissing"
	| "EncryptionKeyBroken"
	| "NoSharedSecretKeyConfigured"
	| "SecretKeyNotFound"
	| "PlayerSecretAlreadyConfigured"
	| "APIRequestsDisabledForTitle"
	| "InvalidSharedSecretKey"
	| "PrizeTableHasNoRanks"
	| "ProfileDoesNotExist"
	| "ContentS3OriginBucketNotConfigured"
	| "InvalidEnvironmentForReceipt"
	| "EncryptedRequestNotAllowed"
	| "SignedRequestNotAllowed"
	| "RequestViewConstraintParamsNotAllowed"
	| "BadPartnerConfiguration"
	| "XboxBPCertificateFailure"
	| "XboxXASSExchangeFailure"
	| "InvalidEntityId"
	| "StatisticValueAggregationOverflow"
	| "EmailMessageFromAddressIsMissing"
	| "EmailMessageToAddressIsMissing"
	| "SmtpServerAuthenticationError"
	| "SmtpServerLimitExceeded"
	| "SmtpServerInsufficientStorage"
	| "SmtpServerCommunicationError"
	| "SmtpServerGeneralFailure"
	| "EmailClientTimeout"
	| "EmailClientCanceledTask"
	| "EmailTemplateMissing"
	| "InvalidHostForTitleId"
	| "EmailConfirmationTokenDoesNotExist"
	| "EmailConfirmationTokenExpired"
	| "AccountDeleted"
	| "PlayerSecretNotConfigured"
	| "InvalidSignatureTime"
	| "NoContactEmailAddressFound"
	| "InvalidAuthToken"
	| "AuthTokenDoesNotExist"
	| "AuthTokenExpired"
	| "AuthTokenAlreadyUsedToResetPassword"
	| "MembershipNameTooLong"
	| "MembershipNotFound"
	| "GoogleServiceAccountInvalid"
	| "GoogleServiceAccountParseFailure"
	| "EntityTokenMissing"
	| "EntityTokenInvalid"
	| "EntityTokenExpired"
	| "EntityTokenRevoked"
	| "InvalidProductForSubscription"
	| "XboxInaccessible"
	| "SubscriptionAlreadyTaken"
	| "SmtpAddonNotEnabled"
	| "APIConcurrentRequestLimitExceeded"
	| "XboxRejectedXSTSExchangeRequest"
	| "VariableNotDefined"
	| "TemplateVersionNotDefined"
	| "FileTooLarge"
	| "TitleDeleted"
	| "TitleContainsUserAccounts"
	| "TitleDeletionPlayerCleanupFailure"
	| "EntityFileOperationPending"
	| "NoEntityFileOperationPending"
	| "EntityProfileVersionMismatch"
	| "TemplateVersionTooOld"
	| "MembershipDefinitionInUse"
	| "PaymentPageNotConfigured"
	| "FailedLoginAttemptRateLimitExceeded"
	| "EntityBlockedByGroup"
	| "RoleDoesNotExist"
	| "EntityIsAlreadyMember"
	| "DuplicateRoleId"
	| "GroupInvitationNotFound"
	| "GroupApplicationNotFound"
	| "OutstandingInvitationAcceptedInstead"
	| "OutstandingApplicationAcceptedInstead"
	| "RoleIsGroupDefaultMember"
	| "RoleIsGroupAdmin"
	| "RoleNameNotAvailable"
	| "GroupNameNotAvailable"
	| "EmailReportAlreadySent"
	| "EmailReportRecipientBlacklisted"
	| "EventNamespaceNotAllowed"
	| "EventEntityNotAllowed"
	| "InvalidEntityType"
	| "NullTokenResultFromAad"
	| "InvalidTokenResultFromAad"
	| "NoValidCertificateForAad"
	| "InvalidCertificateForAad"
	| "DuplicateDropTableId"
	| "MultiplayerServerError"
	| "MultiplayerServerTooManyRequests"
	| "MultiplayerServerNoContent"
	| "MultiplayerServerBadRequest"
	| "MultiplayerServerUnauthorized"
	| "MultiplayerServerForbidden"
	| "MultiplayerServerNotFound"
	| "MultiplayerServerConflict"
	| "MultiplayerServerInternalServerError"
	| "MultiplayerServerUnavailable"
	| "ExplicitContentDetected"
	| "PIIContentDetected"
	| "InvalidScheduledTaskParameter"
	| "PerEntityEventRateLimitExceeded"
	| "TitleDefaultLanguageNotSet"
	| "EmailTemplateMissingDefaultVersion"
	| "FacebookInstantGamesIdNotLinked"
	| "InvalidFacebookInstantGamesSignature"
	| "FacebookInstantGamesAuthNotConfiguredForTitle"
	| "EntityProfileConstraintValidationFailed"
	| "TelemetryIngestionKeyPending"
	| "TelemetryIngestionKeyNotFound"
	| "StatisticChildNameInvalid"
	| "DataIntegrityError"
	| "VirtualCurrencyCannotBeSetToOlderVersion"
	| "VirtualCurrencyMustBeWithinIntegerRange"
	| "EmailTemplateInvalidSyntax"
	| "EmailTemplateMissingCallback"
	| "PushNotificationTemplateInvalidPayload"
	| "InvalidLocalizedPushNotificationLanguage"
	| "MissingLocalizedPushNotificationMessage"
	| "PushNotificationTemplateMissingPlatformPayload"
	| "PushNotificationTemplatePayloadContainsInvalidJson"
	| "PushNotificationTemplateContainsInvalidIosPayload"
	| "PushNotificationTemplateContainsInvalidAndroidPayload"
	| "PushNotificationTemplateIosPayloadMissingNotificationBody"
	| "PushNotificationTemplateAndroidPayloadMissingNotificationBody"
	| "PushNotificationTemplateNotFound"
	| "PushNotificationTemplateMissingDefaultVersion"
	| "PushNotificationTemplateInvalidSyntax"
	| "PushNotificationTemplateNoCustomPayloadForV1"
	| "NoLeaderboardForStatistic"
	| "TitleNewsMissingDefaultLanguage"
	| "TitleNewsNotFound"
	| "TitleNewsDuplicateLanguage"
	| "TitleNewsMissingTitleOrBody"
	| "TitleNewsInvalidLanguage"
	| "EmailRecipientBlacklisted"
	| "InvalidGameCenterAuthRequest"
	| "GameCenterAuthenticationFailed"
	| "CannotEnablePartiesForTitle"
	| "PartyError"
	| "PartyRequests"
	| "PartyNoContent"
	| "PartyBadRequest"
	| "PartyUnauthorized"
	| "PartyForbidden"
	| "PartyNotFound"
	| "PartyConflict"
	| "PartyInternalServerError"
	| "PartyUnavailable"
	| "PartyTooManyRequests"
	| "PushNotificationTemplateMissingName"
	| "CannotEnableMultiplayerServersForTitle"
	| "WriteAttemptedDuringExport"
	| "MultiplayerServerTitleQuotaCoresExceeded"
	| "AutomationRuleNotFound"
	| "EntityAPIKeyLimitExceeded"
	| "EntityAPIKeyNotFound"
	| "EntityAPIKeyOrSecretInvalid"
	| "EconomyServiceUnavailable"
	| "EconomyServiceInternalError"
	| "QueryRateLimitExceeded"
	| "EntityAPIKeyCreationDisabledForEntity"
	| "ForbiddenByEntityPolicy"
	| "UpdateInventoryRateLimitExceeded"
	| "StudioCreationRateLimited"
	| "StudioCreationInProgress"
	| "DuplicateStudioName"
	| "StudioNotFound"
	| "StudioDeleted"
	| "StudioDeactivated"
	| "StudioActivated"
	| "TitleCreationRateLimited"
	| "TitleCreationInProgress"
	| "DuplicateTitleName"
	| "TitleActivationRateLimited"
	| "TitleActivationInProgress"
	| "TitleDeactivated"
	| "TitleActivated"
	| "CloudScriptAzureFunctionsExecutionTimeLimitExceeded"
	| "CloudScriptAzureFunctionsArgumentSizeExceeded"
	| "CloudScriptAzureFunctionsReturnSizeExceeded"
	| "CloudScriptAzureFunctionsHTTPRequestError"
	| "VirtualCurrencyBetaGetError"
	| "VirtualCurrencyBetaCreateError"
	| "VirtualCurrencyBetaInitialDepositSaveError"
	| "VirtualCurrencyBetaSaveError"
	| "VirtualCurrencyBetaDeleteError"
	| "VirtualCurrencyBetaRestoreError"
	| "VirtualCurrencyBetaSaveConflict"
	| "VirtualCurrencyBetaUpdateError"
	| "InsightsManagementDatabaseNotFound"
	| "InsightsManagementOperationNotFound"
	| "InsightsManagementErrorPendingOperationExists"
	| "InsightsManagementSetPerformanceLevelInvalidParameter"
	| "InsightsManagementSetStorageRetentionInvalidParameter"
	| "InsightsManagementGetStorageUsageInvalidParameter"
	| "InsightsManagementGetOperationStatusInvalidParameter"
	| "DuplicatePurchaseTransactionId"
	| "EvaluationModePlayerCountExceeded"
	| "GetPlayersInSegmentRateLimitExceeded"
	| "CloudScriptFunctionNameSizeExceeded"
	| "PaidInsightsFeaturesNotEnabled"
	| "CloudScriptAzureFunctionsQueueRequestError"
	| "EvaluationModeTitleCountExceeded"
	| "InsightsManagementTitleNotInFlight"
	| "LimitNotFound"
	| "LimitNotAvailableViaAPI"
	| "InsightsManagementSetStorageRetentionBelowMinimum"
	| "InsightsManagementSetStorageRetentionAboveMaximum"
	| "AppleNotEnabledForTitle"
	| "InsightsManagementNewActiveEventExportLimitInvalid"
	| "InsightsManagementSetPerformanceRateLimited"
	| "PartyRequestsThrottledFromRateLimiter"
	| "XboxServiceTooManyRequests"
	| "NintendoSwitchNotEnabledForTitle"
	| "RequestMultiplayerServersThrottledFromRateLimiter"
	| "TitleDataOverrideNotFound"
	| "DuplicateKeys"
	| "WasNotCreatedWithCloudRoot"
	| "LegacyMultiplayerServersDeprecated"
	| "VirtualCurrencyCurrentlyUnavailable"
	| "SteamUserNotFound"
	| "ElasticSearchOperationFailed"
	| "NotImplemented"
	| "PublisherNotFound"
	| "PublisherDeleted"
	| "ApiDisabledForMigration"
	| "ResourceNameUpdateNotAllowed"
	| "ApiNotEnabledForTitle"
	| "DuplicateTitleNameForPublisher"
	| "AzureTitleCreationInProgress"
	| "TitleConstraintsPublisherDeletion"
	| "InvalidPlayerAccountPoolId"
	| "PlayerAccountPoolNotFound"
	| "PlayerAccountPoolDeleted"
	| "TitleCleanupInProgress"
	| "AzureResourceConcurrentOperationInProgress"
	| "TitlePublisherUpdateNotAllowed"
	| "AzureResourceManagerNotSupportedInStamp"
	| "ApiNotIncludedInAzurePlayFabFeatureSet"
	| "GoogleServiceAccountFailedAuth"
	| "GoogleAPIServiceUnavailable"
	| "GoogleAPIServiceUnknownError"
	| "NoValidIdentityForAad"
	| "PlayerIdentityLinkNotFound"
	| "PhotonApplicationIdAlreadyInUse"
	| "CloudScriptUnableToDeleteProductionRevision"
	| "CustomIdNotFound"
	| "AutomationInvalidInput"
	| "AutomationInvalidRuleName"
	| "AutomationRuleAlreadyExists"
	| "AutomationRuleLimitExceeded"
	| "InvalidGooglePlayGamesServerAuthCode"
	| "PlayStreamConnectionFailed"
	| "InvalidEventContents"
	| "InsightsV1Deprecated"
	| "AnalysisSubscriptionNotFound"
	| "AnalysisSubscriptionFailed"
	| "AnalysisSubscriptionFoundAlready"
	| "AnalysisSubscriptionManagementInvalidInput"
	| "InvalidGameCenterId"
	| "InvalidNintendoSwitchAccountId"
	| "EntityAPIKeysNotSupported"
	| "IpAddressBanned"
	| "EntityLineageBanned"
	| "NamespaceMismatch"
	| "InvalidServiceConfiguration"
	| "InvalidNamespaceMismatch"
	| "LeaderboardColumnLengthMismatch"
	| "InvalidStatisticScore"
	| "LeaderboardColumnsNotSpecified"
	| "LeaderboardMaxSizeTooLarge"
	| "InvalidAttributeStatisticsSpecified"
	| "LeaderboardNotFound"
	| "TokenSigningKeyNotFound"
	| "LeaderboardNameConflict"
	| "LinkedStatisticColumnMismatch"
	| "NoLinkedStatisticToLeaderboard"
	| "StatDefinitionAlreadyLinkedToLeaderboard"
	| "LinkingStatsNotAllowedForEntityType"
	| "LeaderboardCountLimitExceeded"
	| "LeaderboardSizeLimitExceeded"
	| "LeaderboardDefinitionModificationNotAllowedWhileLinked"
	| "StatisticDefinitionModificationNotAllowedWhileLinked"
	| "LeaderboardUpdateNotAllowedWhileLinked"
	| "CloudScriptAzureFunctionsEventHubRequestError"
	| "ExternalEntityNotAllowedForTier"
	| "InvalidBaseTimeForInterval"
	| "EntityTypeMismatchWithStatDefinition"
	| "SpecifiedVersionLeaderboardNotFound"
	| "LeaderboardColumnLengthMismatchWithStatDefinition"
	| "DuplicateColumnNameFound"
	| "LinkedStatisticColumnNotFound"
	| "LinkedStatisticColumnRequired"
	| "MultipleLinkedStatisticsNotAllowed"
	| "DuplicateLinkedStatisticColumnNameFound"
	| "AggregationTypeNotAllowedForMultiColumnStatistic"
	| "MaxQueryableVersionsValueNotAllowedForTier"
	| "StatisticDefinitionHasNullOrEmptyVersionConfiguration"
	| "StatisticColumnLengthMismatch"
	| "InvalidExternalEntityId"
	| "UpdatingStatisticsUsingTransactionIdNotAvailableForFreeTier"
	| "TransactionAlreadyApplied"
	| "ReportDataNotRetrievedSuccessfully"
	| "ResetIntervalCannotBeModified"
	| "VersionIncrementRateExceeded"
	| "InvalidSteamUsername"
	| "InvalidVersionResetForLinkedLeaderboard"
	| "BattleNetNotEnabledForTitle"
	| "ReportNotProcessed"
	| "DataNotAvailable"
	| "InvalidReportName"
	| "ResourceNotModified"
	| "StudioCreationLimitExceeded"
	| "StudioDeletionInitiated"
	| "MatchmakingEntityInvalid"
	| "MatchmakingPlayerAttributesInvalid"
	| "MatchmakingQueueNotFound"
	| "MatchmakingMatchNotFound"
	| "MatchmakingTicketNotFound"
	| "MatchmakingAlreadyJoinedTicket"
	| "MatchmakingTicketAlreadyCompleted"
	| "MatchmakingQueueConfigInvalid"
	| "MatchmakingMemberProfileInvalid"
	| "NintendoSwitchDeviceIdNotLinked"
	| "MatchmakingNotEnabled"
	| "MatchmakingPlayerAttributesTooLarge"
	| "MatchmakingNumberOfPlayersInTicketTooLarge"
	| "MatchmakingAttributeInvalid"
	| "MatchmakingPlayerHasNotJoinedTicket"
	| "MatchmakingRateLimitExceeded"
	| "MatchmakingTicketMembershipLimitExceeded"
	| "MatchmakingUnauthorized"
	| "MatchmakingQueueLimitExceeded"
	| "MatchmakingRequestTypeMismatch"
	| "MatchmakingBadRequest"
	| "PubSubFeatureNotEnabledForTitle"
	| "PubSubTooManyRequests"
	| "PubSubConnectionNotFoundForEntity"
	| "PubSubConnectionHandleInvalid"
	| "PubSubSubscriptionLimitExceeded"
	| "TitleConfigNotFound"
	| "TitleConfigUpdateConflict"
	| "TitleConfigSerializationError"
	| "CatalogApiNotImplemented"
	| "CatalogEntityInvalid"
	| "CatalogTitleIdMissing"
	| "CatalogPlayerIdMissing"
	| "CatalogClientIdentityInvalid"
	| "CatalogOneOrMoreFilesInvalid"
	| "CatalogItemMetadataInvalid"
	| "CatalogItemIdInvalid"
	| "CatalogSearchParameterInvalid"
	| "CatalogFeatureDisabled"
	| "CatalogConfigInvalid"
	| "CatalogItemTypeInvalid"
	| "CatalogBadRequest"
	| "CatalogTooManyRequests"
	| "InvalidCatalogItemConfiguration"
	| "ExportInvalidStatusUpdate"
	| "ExportInvalidPrefix"
	| "ExportBlobContainerDoesNotExist"
	| "ExportNotFound"
	| "ExportCouldNotUpdate"
	| "ExportInvalidStorageType"
	| "ExportAmazonBucketDoesNotExist"
	| "ExportInvalidBlobStorage"
	| "ExportKustoException"
	| "ExportKustoConnectionFailed"
	| "ExportUnknownError"
	| "ExportCantEditPendingExport"
	| "ExportLimitExports"
	| "ExportLimitEvents"
	| "ExportInvalidPartitionStatusModification"
	| "ExportCouldNotCreate"
	| "ExportNoBackingDatabaseFound"
	| "ExportCouldNotDelete"
	| "ExportCannotDetermineEventQuery"
	| "ExportInvalidQuerySchemaModification"
	| "ExportQuerySchemaMissingRequiredColumns"
	| "ExportCannotParseQuery"
	| "ExportControlCommandsNotAllowed"
	| "ExportQueryMissingTableReference"
	| "ExportInsightsV1Deprecated"
	| "ExplorerBasicInvalidQueryName"
	| "ExplorerBasicInvalidQueryDescription"
	| "ExplorerBasicInvalidQueryConditions"
	| "ExplorerBasicInvalidQueryStartDate"
	| "ExplorerBasicInvalidQueryEndDate"
	| "ExplorerBasicInvalidQueryGroupBy"
	| "ExplorerBasicInvalidQueryAggregateType"
	| "ExplorerBasicInvalidQueryAggregateProperty"
	| "ExplorerBasicLoadQueriesError"
	| "ExplorerBasicLoadQueryError"
	| "ExplorerBasicCreateQueryError"
	| "ExplorerBasicDeleteQueryError"
	| "ExplorerBasicUpdateQueryError"
	| "ExplorerBasicSavedQueriesLimit"
	| "ExplorerBasicSavedQueryNotFound"
	| "TenantShardMapperShardNotFound"
	| "TitleNotEnabledForParty"
	| "PartyVersionNotFound"
	| "MultiplayerServerBuildReferencedByMatchmakingQueue"
	| "MultiplayerServerBuildReferencedByBuildAlias"
	| "MultiplayerServerBuildAliasReferencedByMatchmakingQueue"
	| "PartySerializationError"
	| "ExperimentationExperimentStopped"
	| "ExperimentationExperimentRunning"
	| "ExperimentationExperimentNotFound"
	| "ExperimentationExperimentNeverStarted"
	| "ExperimentationExperimentDeleted"
	| "ExperimentationClientTimeout"
	| "ExperimentationInvalidVariantConfiguration"
	| "ExperimentationInvalidVariableConfiguration"
	| "ExperimentInvalidId"
	| "ExperimentationNoScorecard"
	| "ExperimentationTreatmentAssignmentFailed"
	| "ExperimentationTreatmentAssignmentDisabled"
	| "ExperimentationInvalidDuration"
	| "ExperimentationMaxExperimentsReached"
	| "ExperimentationExperimentSchedulingInProgress"
	| "ExperimentationInvalidEndDate"
	| "ExperimentationInvalidStartDate"
	| "ExperimentationMaxDurationExceeded"
	| "ExperimentationExclusionGroupNotFound"
	| "ExperimentationExclusionGroupInsufficientCapacity"
	| "ExperimentationExclusionGroupCannotDelete"
	| "ExperimentationExclusionGroupInvalidTrafficAllocation"
	| "ExperimentationExclusionGroupInvalidName"
	| "ExperimentationLegacyExperimentInvalidOperation"
	| "MaxActionDepthExceeded"
	| "TitleNotOnUpdatedPricingPlan"
	| "SegmentManagementTitleNotInFlight"
	| "SegmentManagementNoExpressionTree"
	| "SegmentManagementTriggerActionCountOverLimit"
	| "SegmentManagementSegmentCountOverLimit"
	| "SegmentManagementInvalidSegmentId"
	| "SegmentManagementInvalidInput"
	| "SegmentManagementInvalidSegmentName"
	| "DeleteSegmentRateLimitExceeded"
	| "CreateSegmentRateLimitExceeded"
	| "UpdateSegmentRateLimitExceeded"
	| "GetSegmentsRateLimitExceeded"
	| "AsyncExportNotInFlight"
	| "AsyncExportNotFound"
	| "AsyncExportRateLimitExceeded"
	| "AnalyticsSegmentCountOverLimit"
	| "SnapshotNotFound"
	| "InventoryApiNotImplemented"
	| "InventoryCollectionDeletionDisallowed"
	| "LobbyDoesNotExist"
	| "LobbyRateLimitExceeded"
	| "LobbyPlayerAlreadyJoined"
	| "LobbyNotJoinable"
	| "LobbyMemberCannotRejoin"
	| "LobbyCurrentPlayersMoreThanMaxPlayers"
	| "LobbyPlayerNotPresent"
	| "LobbyBadRequest"
	| "LobbyPlayerMaxLobbyLimitExceeded"
	| "LobbyNewOwnerMustBeConnected"
	| "LobbyCurrentOwnerStillConnected"
	| "LobbyMemberIsNotOwner"
	| "LobbyServerMismatch"
	| "LobbyServerNotFound"
	| "LobbyDifferentServerAlreadyJoined"
	| "LobbyServerAlreadyJoined"
	| "LobbyIsNotClientOwned"
	| "LobbyDoesNotUseConnections"
	| "EventSamplingInvalidRatio"
	| "EventSamplingInvalidEventNamespace"
	| "EventSamplingInvalidEventName"
	| "EventSamplingRatioNotFound"
	| "TelemetryKeyNotFound"
	| "TelemetryKeyInvalidName"
	| "TelemetryKeyAlreadyExists"
	| "TelemetryKeyInvalid"
	| "TelemetryKeyCountOverLimit"
	| "TelemetryKeyDeactivated"
	| "TelemetryKeyLongInsightsRetentionNotAllowed"
	| "EventSinkConnectionInvalid"
	| "EventSinkConnectionUnauthorized"
	| "EventSinkRegionInvalid"
	| "EventSinkLimitExceeded"
	| "EventSinkSasTokenInvalid"
	| "EventSinkNotFound"
	| "EventSinkNameInvalid"
	| "EventSinkSasTokenPermissionInvalid"
	| "EventSinkSecretInvalid"
	| "EventSinkTenantNotFound"
	| "EventSinkAadNotFound"
	| "EventSinkDatabaseNotFound"
	| "EventSinkTitleUnauthorized"
	| "EventSinkInsufficientRoleAssignment"
	| "EventSinkContainerNotFound"
	| "EventSinkTenantIdInvalid"
	| "EventSinkResourceMisconfigured"
	| "EventSinkAccessDenied"
	| "EventSinkWriteConflict"
	| "EventSinkResourceNotFound"
	| "EventSinkResourceFeatureNotSupported"
	| "EventSinkBucketNameInvalid"
	| "EventSinkResourceUnavailable"
	| "OperationCanceled"
	| "InvalidDisplayNameRandomSuffixLength"
	| "AllowNonUniquePlayerDisplayNamesDisableNotAllowed"
	| "PartitionedEventInvalid"
	| "PartitionedEventCountOverLimit"
	| "ManageEventNamespaceInvalid"
	| "ManageEventNameInvalid"
	| "ManagedEventNotFound"
	| "ManageEventsInvalidRatio"
	| "ManagedEventInvalid"
	| "PlayerCustomPropertiesPropertyNameTooLong"
	| "PlayerCustomPropertiesPropertyNameIsInvalid"
	| "PlayerCustomPropertiesStringPropertyValueTooLong"
	| "PlayerCustomPropertiesValueIsInvalidType"
	| "PlayerCustomPropertiesVersionMismatch"
	| "PlayerCustomPropertiesPropertyCountTooHigh"
	| "PlayerCustomPropertiesDuplicatePropertyName"
	| "PlayerCustomPropertiesPropertyDoesNotExist"
	| "AddonAlreadyExists"
	| "AddonDoesntExist"
	| "CopilotDisabled"
	| "CopilotInvalidRequest"
	| "TrueSkillUnauthorized"
	| "TrueSkillInvalidTitleId"
	| "TrueSkillInvalidScenarioId"
	| "TrueSkillInvalidModelId"
	| "TrueSkillInvalidModelName"
	| "TrueSkillInvalidPlayerIds"
	| "TrueSkillInvalidEntityKey"
	| "TrueSkillInvalidConditionKey"
	| "TrueSkillInvalidConditionValue"
	| "TrueSkillInvalidConditionAffinityWeight"
	| "TrueSkillInvalidEventName"
	| "TrueSkillMatchResultCreated"
	| "TrueSkillMatchResultAlreadySubmitted"
	| "TrueSkillBadPlayerIdInMatchResult"
	| "TrueSkillInvalidBotIdInMatchResult"
	| "TrueSkillDuplicatePlayerInMatchResult"
	| "TrueSkillNoPlayerInMatchResultTeam"
	| "TrueSkillPlayersInMatchResultExceedingLimit"
	| "TrueSkillInvalidPreMatchPartyInMatchResult"
	| "TrueSkillInvalidTimestampInMatchResult"
	| "TrueSkillStartTimeMissingInMatchResult"
	| "TrueSkillEndTimeMissingInMatchResult"
	| "TrueSkillInvalidPlayerSecondsPlayedInMatchResult"
	| "TrueSkillNoTeamInMatchResult"
	| "TrueSkillNotEnoughTeamsInMatchResult"
	| "TrueSkillInvalidRanksInMatchResult"
	| "TrueSkillNoWinnerInMatchResult"
	| "TrueSkillMissingRequiredCondition"
	| "TrueSkillMissingRequiredEvent"
	| "TrueSkillUnknownEventName"
	| "TrueSkillInvalidEventCount"
	| "TrueSkillUnknownConditionKey"
	| "TrueSkillUnknownConditionValue"
	| "TrueSkillScenarioConfigDoesNotExist"
	| "TrueSkillUnknownModelId"
	| "TrueSkillNoModelInScenario"
	| "TrueSkillNotSupportedForTitle"
	| "TrueSkillModelIsNotActive"
	| "TrueSkillUnauthorizedToQueryOtherPlayerSkills"
	| "TrueSkillInvalidMaxIterations"
	| "TrueSkillEndTimeBeforeStartTime"
	| "TrueSkillInvalidJobId"
	| "TrueSkillInvalidMetadataId"
	| "TrueSkillMissingBuildVerison"
	| "TrueSkillJobAlreadyExists"
	| "TrueSkillJobNotFound"
	| "TrueSkillOperationCanceled"
	| "TrueSkillActiveModelLimitExceeded"
	| "TrueSkillTotalModelLimitExceeded"
	| "TrueSkillUnknownInitialModelId"
	| "TrueSkillUnauthorizedForJob"
	| "TrueSkillInvalidScenarioName"
	| "TrueSkillConditionStateIsRequired"
	| "TrueSkillEventStateIsRequired"
	| "TrueSkillDuplicateEvent"
	| "TrueSkillDuplicateCondition"
	| "TrueSkillInvalidAnomalyThreshold"
	| "TrueSkillConditionKeyLimitExceeded"
	| "TrueSkillConditionValuePerKeyLimitExceeded"
	| "TrueSkillInvalidTimestamp"
	| "TrueSkillEventLimitExceeded"
	| "TrueSkillInvalidPlayers"
	| "TrueSkillTrueSkillPlayerNull"
	| "TrueSkillInvalidPlayerId"
	| "TrueSkillInvalidSquadSize"
	| "TrueSkillConditionSetNotInModel"
	| "TrueSkillModelStateInvalidForOperation"
	| "TrueSkillScenarioContainsActiveModel"
	| "TrueSkillInvalidConditionRank"
	| "TrueSkillTotalScenarioLimitExceeded"
	| "TrueSkillInvalidConditionsList"
	| "GameSaveManifestNotFound"
	| "GameSaveManifestVersionAlreadyExists"
	| "GameSaveConflictUpdatingManifest"
	| "GameSaveManifestUpdatesNotAllowed"
	| "GameSaveFileAlreadyExists"
	| "GameSaveManifestVersionNotFinalized"
	| "GameSaveUnknownFileInManifest"
	| "GameSaveFileExceededReportedSize"
	| "GameSaveFileNotUploaded"
	| "GameSaveBadRequest"
	| "GameSaveOperationNotAllowed"
	| "GameSaveDataStorageQuotaExceeded"
	| "GameSaveNewerManifestExists"
	| "GameSaveBaseVersionNotAvailable"
	| "GameSaveManifestVersionQuarantined"
	| "GameSaveManifestUploadProgressUpdateNotAllowed"
	| "GameSaveNotFinalizedManifestNotEligibleAsKnownGood"
	| "GameSaveNoUpdatesRequested"
	| "GameSaveTitleDoesNotExist"
	| "GameSaveOperationNotAllowedForTitle"
	| "GameSaveManifestFilesLimitExceeded"
	| "GameSaveManifestDescriptionUpdateNotAllowed"
	| "GameSaveTitleConfigNotFound"
	| "GameSaveTitleAlreadyOnboarded"
	| "GameSaveServiceNotEnabledForTitle"
	| "GameSaveServiceOnboardingPending"
	| "GameSaveManifestNotEligibleAsConflictingVersion"
	| "GameSaveServiceUnavailable"
	| "GameSaveConflict"
	| "GameSaveManifestNotEligibleForRollback"
	| "StateShareForbidden"
	| "StateShareTitleNotInFlight"
	| "StateShareStateNotFound"
	| "StateShareLinkNotFound"
	| "StateShareStateRedemptionLimitExceeded"
	| "StateShareStateRedemptionLimitNotUpdated"
	| "StateShareCreatedStatesLimitExceeded"
	| "StateShareIdMissingOrMalformed"
	| "PlayerCreationDisabled"
	| "AccountAlreadyExists"
	| "TagInvalid"
	| "TagTooLong"
	| "StatisticColumnAggregationMismatch"
	| "StatisticResetIntervalMismatch"
	| "VersionConfigurationCannotBeSpecifiedForLinkedStat"
	| "VersionConfigurationIsRequired"
	| "InvalidEntityTypeForAggregation"
	| "MultiLevelAggregationNotAllowed"
	| "AggregationTypeNotAllowedForLinkedStat"
	| "StoreMetricsRequestInvalidInput"

export type ResetUserStatisticsResult = {
	-- No properties defined in spec
	[string]: any
}

export type CustomPropertyStringSegmentFilter = {
	--[[
		Custom property string value.

	]]
	PropertyValue: string?,
	Comparison: SegmentFilterComparison?,
	--[[
		Custom property name.

	]]
	PropertyName: string?,
}

export type ContactEmailInfoModel = {
	--[[
		The name of the email info data

	]]
	Name: string?,
	--[[
		The email address

	]]
	EmailAddress: string?,
	VerificationStatus: EmailVerificationStatus?,
}

export type ExecuteFunctionContent = {
	--[[
		Publish results from executing the azure function as playstream event

	]]
	PublishResultsToPlayStream: boolean,
	--[[
		Arguments(JSON) to be passed into the cloudscript azure function

	]]
	CloudScriptFunctionArguments: string,
	--[[
		Cloudscript azure function name

	]]
	CloudScriptFunctionName: string,
}

export type GetPlayersSegmentsRequest = {
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		Unique PlayFab assigned ID of the user on whom the operation will be
		performed.

	]]
	PlayFabId: string,
}

export type UpdateUserDataResult = {
	--[[
		Indicates the current version of the data that has been set. This is
		incremented with every set call for that type of data (read-only, internal,
		etc). This version can be provided in Get calls to find updated data.

	]]
	DataVersion: number,
}

export type UserOpenIdInfo = {
	--[[
		OpenID Connection ID

	]]
	ConnectionId: string?,
	--[[
		OpenID Issuer

	]]
	Issuer: string?,
	--[[
		OpenID Subject

	]]
	Subject: string?,
}

export type GetStoreItemsResult = {
	--[[
		Marketing data about a specific store

	]]
	MarketingData: StoreMarketingModel?,
	--[[
		The ID of this store.

	]]
	StoreId: string?,
	Source: SourceType?,
	--[[
		Array of items which can be purchased from this store.

	]]
	Store: { StoreItem }?,
	--[[
		The base catalog that this store is a part of.

	]]
	CatalogVersion: string?,
}

export type UpdateProperty = {
	--[[
		Name of the custom property. Can contain Unicode letters and digits. They are
		limited in size.

	]]
	Name: string,
	--[[
		Value of the custom property. Limited to booleans, numbers, and strings.

	]]
	Value: {
		-- No properties defined in spec
		[string]: any
	},
}

export type SubscriptionModel = {
	Status: SubscriptionProviderStatus?,
	--[[
		The item id for this subscription from the primary catalog

	]]
	SubscriptionItemId: string?,
	--[[
		The provider for this subscription. Apple or Google Play are supported today.

	]]
	SubscriptionProvider: string?,
	--[[
		When this subscription expires.

	]]
	Expiration: string,
	--[[
		The id for this subscription

	]]
	SubscriptionId: string?,
	--[[
		Whether this subscription is currently active. That is, if Expiration > now.

	]]
	IsActive: boolean,
	--[[
		The time the subscription was orignially purchased

	]]
	InitialSubscriptionTime: string,
}

export type ResultTableNode = {
	ResultItemType: ResultTableNodeType,
	--[[
		Either an ItemId, or the TableId of another random result table

	]]
	ResultItem: string,
	--[[
		How likely this is to be rolled - larger numbers add more weight

	]]
	Weight: number,
}

export type CountryCode = 
	| "AF"
	| "AX"
	| "AL"
	| "DZ"
	| "AS"
	| "AD"
	| "AO"
	| "AI"
	| "AQ"
	| "AG"
	| "AR"
	| "AM"
	| "AW"
	| "AU"
	| "AT"
	| "AZ"
	| "BS"
	| "BH"
	| "BD"
	| "BB"
	| "BY"
	| "BE"
	| "BZ"
	| "BJ"
	| "BM"
	| "BT"
	| "BO"
	| "BQ"
	| "BA"
	| "BW"
	| "BV"
	| "BR"
	| "IO"
	| "BN"
	| "BG"
	| "BF"
	| "BI"
	| "KH"
	| "CM"
	| "CA"
	| "CV"
	| "KY"
	| "CF"
	| "TD"
	| "CL"
	| "CN"
	| "CX"
	| "CC"
	| "CO"
	| "KM"
	| "CG"
	| "CD"
	| "CK"
	| "CR"
	| "CI"
	| "HR"
	| "CU"
	| "CW"
	| "CY"
	| "CZ"
	| "DK"
	| "DJ"
	| "DM"
	| "DO"
	| "EC"
	| "EG"
	| "SV"
	| "GQ"
	| "ER"
	| "EE"
	| "ET"
	| "FK"
	| "FO"
	| "FJ"
	| "FI"
	| "FR"
	| "GF"
	| "PF"
	| "TF"
	| "GA"
	| "GM"
	| "GE"
	| "DE"
	| "GH"
	| "GI"
	| "GR"
	| "GL"
	| "GD"
	| "GP"
	| "GU"
	| "GT"
	| "GG"
	| "GN"
	| "GW"
	| "GY"
	| "HT"
	| "HM"
	| "VA"
	| "HN"
	| "HK"
	| "HU"
	| "IS"
	| "IN"
	| "ID"
	| "IR"
	| "IQ"
	| "IE"
	| "IM"
	| "IL"
	| "IT"
	| "JM"
	| "JP"
	| "JE"
	| "JO"
	| "KZ"
	| "KE"
	| "KI"
	| "KP"
	| "KR"
	| "KW"
	| "KG"
	| "LA"
	| "LV"
	| "LB"
	| "LS"
	| "LR"
	| "LY"
	| "LI"
	| "LT"
	| "LU"
	| "MO"
	| "MK"
	| "MG"
	| "MW"
	| "MY"
	| "MV"
	| "ML"
	| "MT"
	| "MH"
	| "MQ"
	| "MR"
	| "MU"
	| "YT"
	| "MX"
	| "FM"
	| "MD"
	| "MC"
	| "MN"
	| "ME"
	| "MS"
	| "MA"
	| "MZ"
	| "MM"
	| "NA"
	| "NR"
	| "NP"
	| "NL"
	| "NC"
	| "NZ"
	| "NI"
	| "NE"
	| "NG"
	| "NU"
	| "NF"
	| "MP"
	| "NO"
	| "OM"
	| "PK"
	| "PW"
	| "PS"
	| "PA"
	| "PG"
	| "PY"
	| "PE"
	| "PH"
	| "PN"
	| "PL"
	| "PT"
	| "PR"
	| "QA"
	| "RE"
	| "RO"
	| "RU"
	| "RW"
	| "BL"
	| "SH"
	| "KN"
	| "LC"
	| "MF"
	| "PM"
	| "VC"
	| "WS"
	| "SM"
	| "ST"
	| "SA"
	| "SN"
	| "RS"
	| "SC"
	| "SL"
	| "SG"
	| "SX"
	| "SK"
	| "SI"
	| "SB"
	| "SO"
	| "ZA"
	| "GS"
	| "SS"
	| "ES"
	| "LK"
	| "SD"
	| "SR"
	| "SJ"
	| "SZ"
	| "SE"
	| "CH"
	| "SY"
	| "TW"
	| "TJ"
	| "TZ"
	| "TH"
	| "TL"
	| "TG"
	| "TK"
	| "TO"
	| "TT"
	| "TN"
	| "TR"
	| "TM"
	| "TC"
	| "TV"
	| "UG"
	| "UA"
	| "AE"
	| "GB"
	| "US"
	| "UM"
	| "UY"
	| "UZ"
	| "VU"
	| "VE"
	| "VN"
	| "VG"
	| "VI"
	| "WF"
	| "EH"
	| "YE"
	| "ZM"
	| "ZW"
	| "Unknown"

--[[
	Combined entity type and ID structure which uniquely identifies a single
	entity.

]]
export type EntityKey = {
	--[[
		Unique ID of the entity.

	]]
	Id: string,
	--[[
		Entity type. See
		https://docs.microsoft.com/gaming/playfab/features/data/entities/available-built-in-entity-types

	]]
	Type: string?,
}

--[[
	Player Shared Secret Keys are used for the call to Client/GetTitlePublicKey,
	which exchanges the shared secret for an RSA CSP blob to be used to encrypt
	the payload of account creation requests when that API requires a signature
	header.

]]
export type DeletePlayerSharedSecretRequest = {
	--[[
		The shared secret key to delete

	]]
	SecretKey: string?,
}

--[[
	This API allows for access to details regarding a user in the PlayFab
	service, usually for purposes of customer support. Note that data returned
	may be Personally Identifying Information (PII), such as email address, and
	so care should be taken in how this data is stored and managed. Since this
	call will always return the relevant information for users who have accessed
	the title, the recommendation is to not store this data locally.

]]
export type GetPlayerProfileRequest = {
	--[[
		Unique PlayFab assigned ID of the user on whom the operation will be
		performed.

	]]
	PlayFabId: string,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	ProfileConstraints: PlayerProfileViewConstraints?,
}

export type LogStatement = {
	Message: string?,
	--[[
		'Debug', 'Info', or 'Error'

	]]
	Level: string?,
	--[[
		Optional object accompanying the message as contextual information

	]]
	Data: {
		-- No properties defined in spec
		[string]: any
	}?,
}

--[[
	Updates permissions for your title. Policies affect what is allowed to
	happen on your title. Your policy is a collection of statements that,
	together, govern particular area for your title. Today, the only allowed
	policy is called 'ApiPolicy' and it governs what API calls are allowed. To
	verify that you have the latest version always download the current policy
	from GetPolicy before uploading a new policy. PlayFab updates the base
	policy periodically and will automatically apply it to the uploaded policy.
	Overwriting the combined policy blindly may result in unexpected API errors.

]]
export type UpdatePolicyRequest = {
	--[[
		The name of the policy being updated. Only supported name is 'ApiPolicy'

	]]
	PolicyName: string,
	--[[
		The new statements to include in the policy.

	]]
	Statements: { PermissionStatement },
	--[[
		Whether to overwrite or append to the existing policy.

	]]
	OverwritePolicy: boolean,
	--[[
		Version of the policy to update. Must be the latest (as returned by
		GetPolicy).

	]]
	PolicyVersion: number,
}

export type PlayerLinkedAccount = {
	--[[
		Platform user identifier

	]]
	PlatformUserId: string?,
	Platform: LoginIdentityProvider?,
	--[[
		Linked account's username

	]]
	Username: string?,
	--[[
		Linked account's email

	]]
	Email: string?,
}

export type UserPrivateAccountInfo = {
	--[[
		user email address

	]]
	Email: string?,
}

export type GetTasksRequest = {
	--[[
		Identifier by either name or ID. Note that a name may change due to renaming,
		or reused after being deleted. ID is immutable and unique.

	]]
	Identifier: NameIdentifier?,
}

export type GetPlayerStatisticDefinitionsRequest = {
	-- No properties defined in spec
	[string]: any
}

export type AllPlayersSegmentFilter = {
	-- No properties defined in spec
	[string]: any
}

--[[
	Indicates whether a given data key is private (readable only by the player)
	or public (readable by all players). When a player makes a GetUserData
	request about another player, only keys marked Public will be returned.

]]
export type UserDataPermission = 
	| "Private"
	| "Public"

export type UserOriginationSegmentFilter = {
	LoginProvider: SegmentLoginIdentityProvider?,
}

--[[
	Send all the segment details part of CreateSegmentRequest

]]
export type CreateSegmentRequest = {
	SegmentModel: SegmentModel,
}

--[[
	This non-reversible operation will permanently delete the requested store.

]]
export type DeleteStoreRequest = {
	--[[
		catalog version of the store to delete. If null, uses the default catalog.

	]]
	CatalogVersion: string?,
	--[[
		unqiue identifier for the store which is to be deleted

	]]
	StoreId: string,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

--[[
	After a task is deleted, for tracking purposes, the task instances belonging
	to this task will still remain. They will become orphaned and does not
	belongs to any task. Executions of any in-progress task instances will
	continue. If the task specified does not exist, the deletion is considered a
	success.

]]
export type DeleteTaskRequest = {
	--[[
		Identifier by either name or ID. Note that a name may change due to renaming,
		or reused after being deleted. ID is immutable and unique.

	]]
	Identifier: NameIdentifier?,
}

export type StatisticModel = {
	--[[
		Statistic value

	]]
	Value: number,
	--[[
		Statistic name

	]]
	Name: string?,
	--[[
		Statistic version (0 if not a versioned statistic)

	]]
	Version: number,
}

--[[
	For each ban, only updates the values that are set. Leave any value to null
	for no change. If a ban could not be found, the rest are still applied.
	Returns information about applied updates only.

]]
export type UpdateBansRequest = {
	--[[
		List of bans to be updated. Maximum 100.

	]]
	Bans: { UpdateBanRequest },
}

export type DeletePlayerSegmentAction = {
	-- No properties defined in spec
	[string]: any
}

export type UpdatePlayerCustomPropertiesResult = {
	--[[
		Indicates the current version of a player's properties that have been set.
		This is incremented after updates and deletes. This version can be provided in
		update and delete calls for concurrency control.

	]]
	PropertiesVersion: number,
	--[[
		PlayFab unique identifier of the user whose properties were updated.

	]]
	PlayFabId: string?,
}

export type LocationSegmentFilter = {
	CountryCode: SegmentCountryCode?,
}

export type RemovePlayerTagResult = {
	-- No properties defined in spec
	[string]: any
}

export type SubtractInventoryItemV2Content = {
	--[[
		The stack id for where the item will be removed from the player inventory

	]]
	StackId: string?,
	--[[
		The duration in seconds to be removed from the subscription in the players
		inventory

	]]
	DurationInSeconds: number?,
	--[[
		Amount of the item to removed from the player

	]]
	Amount: number?,
	--[[
		The collection id for where the item will be removed from the player inventory

	]]
	CollectionId: string?,
	--[[
		The id of item to be removed from the player

	]]
	ItemId: string?,
}

export type TaskInstanceStatus = 
	| "Succeeded"
	| "Starting"
	| "InProgress"
	| "Failed"
	| "Aborted"
	| "Stalled"

export type UpdatePolicyResponse = {
	--[[
		The name of the policy that was updated.

	]]
	PolicyName: string?,
	--[[
		The statements included in the new version of the policy.

	]]
	Statements: { PermissionStatement }?,
}

export type ResetPasswordResult = {
	-- No properties defined in spec
	[string]: any
}

export type UpdateCloudScriptResult = {
	--[[
		Cloud Script version updated

	]]
	Version: number,
	--[[
		New revision number created

	]]
	Revision: number,
}

export type IncrementLimitedEditionItemAvailabilityResult = {
	-- No properties defined in spec
	[string]: any
}

--[[
	Marketing data about a specific store

]]
export type StoreMarketingModel = {
	--[[
		Display name of a store as it will appear to users.

	]]
	DisplayName: string?,
	--[[
		Tagline for a store.

	]]
	Description: string?,
	--[[
		Custom data about a store.

	]]
	Metadata: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type RandomResultTable = {
	--[[
		Child nodes that indicate what kind of drop table item this actually is.

	]]
	Nodes: { ResultTableNode },
	--[[
		Unique name for this drop table

	]]
	TableId: string,
}

export type DeleteMasterPlayerEventDataResult = {
	-- No properties defined in spec
	[string]: any
}

export type CreatePlayerSharedSecretResult = {
	--[[
		The player shared secret to use when calling Client/GetTitlePublicKey

	]]
	SecretKey: string?,
}

export type RevokeAllBansForUserResult = {
	--[[
		Information on the bans that were revoked.

	]]
	BanData: { BanInfo }?,
}

--[[
	Setting the active state of all bans requested to Inactive regardless of
	whether that ban has already expired. BanIds that do not exist will be
	skipped. Returns information about applied updates only.

]]
export type RevokeBansRequest = {
	--[[
		Ids of the bans to be revoked. Maximum 100.

	]]
	BanIds: { string },
}

--[[
	This function performs an additive update of the arbitrary JSON object
	containing the custom data for the user. In updating the custom data object,
	keys which already exist in the object will have their values overwritten,
	while keys with null values will be removed. No other key-value pairs will
	be changed apart from those specified in the call.

]]
export type UpdateUserDataRequest = {
	--[[
		Unique PlayFab assigned ID of the user on whom the operation will be
		performed.

	]]
	PlayFabId: string,
	--[[
		Indicates whether a given data key is private (readable only by the player) or
		public (readable by all players). When a player makes a GetUserData request
		about another player, only keys marked Public will be returned.

	]]
	Permission: UserDataPermission?,
	--[[
		Key-value pairs to be written to the custom data. Note that keys are trimmed
		of whitespace, are limited in size, and may not begin with a '!' character or
		be null.

	]]
	Data: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		Optional list of Data-keys to remove from UserData. Some SDKs cannot insert
		null-values into Data due to language constraints. Use this to delete the keys
		directly.

	]]
	KeysToRemove: { string }?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type RevokeBansResult = {
	--[[
		Information on the bans that were revoked

	]]
	BanData: { BanInfo }?,
}

export type PlayerLocation = {
	CountryCode: CountryCode,
	--[[
		City of the player's geographic location.

	]]
	City: string?,
	--[[
		Longitude coordinate of the player's geographic location.

	]]
	Longitude: number?,
	--[[
		Latitude coordinate of the player's geographic location.

	]]
	Latitude: number?,
	ContinentCode: ContinentCode,
}

--[[
	In cases where the inventory item in question is a "crate", and the items it
	contained have already been dispensed, this will not revoke access or
	otherwise remove the items which were dispensed.

]]
export type RevokeInventoryItemRequest = {
	--[[
		Unique PlayFab assigned ID for a specific character owned by a user

	]]
	CharacterId: string?,
	--[[
		Unique PlayFab assigned ID of the user on whom the operation will be
		performed.

	]]
	PlayFabId: string,
	--[[
		Unique PlayFab assigned instance identifier of the item

	]]
	ItemInstanceId: string,
}

--[[
	Will delete all the title data associated with the given override label.

]]
export type DeleteTitleDataOverrideRequest = {
	--[[
		Name of the override.

	]]
	OverrideLabel: string,
}

--[[
	In cases where the inventory item in question is a "crate", and the items it
	contained have already been dispensed, this will not revoke access or
	otherwise remove the items which were dispensed.

]]
export type RevokeInventoryItemsRequest = {
	--[[
		Array of player items to revoke, between 1 and 25 items.

	]]
	Items: { RevokeInventoryItem },
}

export type AddPlayerTagResult = {
	-- No properties defined in spec
	[string]: any
}

--[[
	This operation will increment the global counter for the number of these
	items available. This number cannot be decremented, except by actual grants.

]]
export type IncrementLimitedEditionItemAvailabilityRequest = {
	--[[
		Amount to increase availability by.

	]]
	Amount: number,
	--[[
		Which catalog is being updated. If null, uses the default catalog.

	]]
	CatalogVersion: string?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		The item which needs more availability.

	]]
	ItemId: string,
}

export type RevokeItemError = {
	Error: GenericErrorCodes?,
	Item: RevokeInventoryItem?,
}

export type RefundPurchaseResponse = {
	--[[
		The order's updated purchase status.

	]]
	PurchaseStatus: string?,
}

export type PlayerProfileViewConstraints = {
	--[[
		Whether to show push notification registrations. Defaults to false

	]]
	ShowPushNotificationRegistrations: boolean,
	--[[
		Whether to show the linked accounts. Defaults to false

	]]
	ShowLinkedAccounts: boolean,
	--[[
		Whether to show player's experiment variants. Defaults to false

	]]
	ShowExperimentVariants: boolean,
	--[[
		Whether to show the last login time. Defaults to false

	]]
	ShowLastLogin: boolean,
	--[[
		Whether to show player's locations. Defaults to false

	]]
	ShowLocations: boolean,
	--[[
		Whether to show tags. Defaults to false

	]]
	ShowTags: boolean,
	--[[
		Whether to show player's membership information. Defaults to false

	]]
	ShowMemberships: boolean,
	--[[
		Whether to show the values to date. Defaults to false

	]]
	ShowValuesToDate: boolean,
	--[[
		Whether to show player's avatar URL. Defaults to false

	]]
	ShowAvatarUrl: boolean,
	--[[
		Whether to show the display name. Defaults to false

	]]
	ShowDisplayName: boolean,
	--[[
		Whether to show the created date. Defaults to false

	]]
	ShowCreated: boolean,
	--[[
		Whether to show the total value to date in usd. Defaults to false

	]]
	ShowTotalValueToDateInUsd: boolean,
	--[[
		Whether to show origination. Defaults to false

	]]
	ShowOrigination: boolean,
	--[[
		Whether to show contact email addresses. Defaults to false

	]]
	ShowContactEmailAddresses: boolean,
	--[[
		Whether to show the banned until time. Defaults to false

	]]
	ShowBannedUntil: boolean,
	--[[
		Whether to show campaign attributions. Defaults to false

	]]
	ShowCampaignAttributions: boolean,
	--[[
		Reserved for future development

	]]
	ShowStatistics: boolean,
}

export type GetContentListResult = {
	--[[
		Number of content items returned. We currently have a maximum of 1000 items
		limit.

	]]
	ItemCount: number,
	--[[
		List of content items.

	]]
	Contents: { ContentInfo }?,
	--[[
		The total size of listed contents in bytes.

	]]
	TotalSize: number,
}

export type ValueToDateSegmentFilter = {
	Comparison: SegmentFilterComparison?,
	Currency: SegmentCurrency?,
	--[[
		Value to date amount.

	]]
	Amount: string?,
}

export type PushNotificationSegmentAction = {
	--[[
		Push notification template id.

	]]
	PushNotificationTemplateId: string?,
}

export type UserGooglePlayGamesInfo = {
	--[[
		Google Play Games player ID

	]]
	GooglePlayGamesPlayerId: string?,
	--[[
		Display name of the Google Play Games player

	]]
	GooglePlayGamesPlayerDisplayName: string?,
	--[[
		Avatar image url of the Google Play Games player

	]]
	GooglePlayGamesPlayerAvatarImageUrl: string?,
}

export type UpdateCloudScriptRequest = {
	--[[
		PlayFab user ID of the developer initiating the request.

	]]
	DeveloperPlayFabId: string?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		List of Cloud Script files to upload to create the new revision. Must have at
		least one file.

	]]
	Files: { CloudScriptFile },
	--[[
		Immediately publish the new revision

	]]
	Publish: boolean,
}

--[[
	Player Shared Secret Keys are used for the call to Client/GetTitlePublicKey,
	which exchanges the shared secret for an RSA CSP blob to be used to encrypt
	the payload of account creation requests when that API requires a signature
	header.

]]
export type CreatePlayerSharedSecretRequest = {
	--[[
		Friendly name for this key

	]]
	FriendlyName: string?,
}

--[[
	If the account in question is a "temporary" account (for example, one that
	was created via a call to LoginFromIOSDeviceID), thisfunction will have no
	effect. Only PlayFab accounts which have valid email addresses will be able
	to receive a password reset email using this API.

]]
export type SendAccountRecoveryEmailRequest = {
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		The email template id of the account recovery email template to send.

	]]
	EmailTemplateId: string?,
	--[[
		User email address attached to their account

	]]
	Email: string,
}

export type PlayerStatisticDefinition = {
	--[[
		current active version of the statistic, incremented each time the statistic
		resets

	]]
	CurrentVersion: number,
	AggregationMethod: StatisticAggregationMethod?,
	--[[
		unique name of the statistic

	]]
	StatisticName: string?,
	VersionChangeInterval: StatisticResetIntervalOption?,
}

export type SetPlayerSecretResult = {
	-- No properties defined in spec
	[string]: any
}

export type GrantItemContent = {
	--[[
		Quantity of the item to be granted to a player

	]]
	ItemQuantity: number,
	--[[
		The catalog version of the item to be granted to the player

	]]
	CatalogVersion: string?,
	--[[
		The id of item to be granted to the player

	]]
	ItemId: string?,
}

export type StatisticVersionStatus = 
	| "Active"
	| "SnapshotPending"
	| "Snapshot"
	| "ArchivalPending"
	| "Archived"

export type SetPublishedRevisionRequest = {
	--[[
		Revision to make the current published revision

	]]
	Revision: number,
	--[[
		Version number

	]]
	Version: number,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

--[[
	Note that when calling this API, all properties of the task have to be
	provided, including properties that you do not want to change. Parameters
	not specified would be set to default value. If the task name in the update
	request is new, a task rename operation will be executed before updating
	other fields of the task. WARNING: Renaming of a task may break logics where
	the task name is used as an identifier.

]]
export type UpdateTaskRequest = {
	--[[
		Cron expression for the run schedule of the task. The expression should be in
		UTC.

	]]
	Schedule: string?,
	Type: ScheduledTaskType,
	--[[
		Description the task

	]]
	Description: string?,
	--[[
		Identifier by either name or ID. Note that a name may change due to renaming,
		or reused after being deleted. ID is immutable and unique.

	]]
	Identifier: NameIdentifier?,
	--[[
		Whether the schedule is active. Inactive schedule will not trigger task
		execution.

	]]
	IsActive: boolean,
	--[[
		Name of the task. This is a unique identifier for tasks in the title.

	]]
	Name: string,
	--[[
		Parameter object specific to the task type. See each task type's create API
		documentation for details.

	]]
	Parameter: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

--[[
	When using the Apple Push Notification service (APNS) or the development
	version (APNS_SANDBOX), the APNS Private Key should be used as the
	Credential in this call. With Google Cloud Messaging (GCM), the Android API
	Key should be used. The current ARN (if one exists) can be overwritten by
	setting the OverwriteOldARN boolean to true.

]]
export type SetupPushNotificationRequest = {
	Platform: PushSetupPlatform,
	--[[
		for APNS, this is the PlatformPrincipal (SSL Certificate)

	]]
	Key: string?,
	--[[
		Credential is the Private Key for APNS/APNS_SANDBOX, and the API Key for GCM

	]]
	Credential: string,
	--[[
		This field is deprecated and any usage of this will cause the API to fail.

	]]
	Name: string?,
	--[[
		replace any existing ARN with the newly generated one. If this is set to
		false, an error will be returned if notifications have already setup for this
		platform.

	]]
	OverwriteOldARN: boolean,
}

export type SourceType = 
	| "Admin"
	| "BackEnd"
	| "GameClient"
	| "GameServer"
	| "Partner"
	| "Custom"
	| "API"

export type StatisticVersionArchivalStatus = 
	| "NotScheduled"
	| "Scheduled"
	| "Queued"
	| "InProgress"
	| "Complete"

--[[
	This API is designed to return publisher-specific values which can be read,
	but not written to, by the client. This data is shared across all titles
	assigned to a particular publisher, and can be used for cross-game
	coordination. Only titles assigned to a publisher can use this API. For more
	information email helloplayfab@microsoft.com. This AdminAPI call for getting
	title data guarantees no delay in between update and retrieval of newly set
	data.

]]
export type GetPublisherDataRequest = {
	--[[
		array of keys to get back data from the Publisher data blob, set by the admin
		tools

	]]
	Keys: { string },
}

export type ExportMasterPlayerDataResult = {
	--[[
		An email with this job receipt Id containing the export download link will be
		sent to the title notification email address when the export is complete.

	]]
	JobReceiptId: string?,
}

export type ActionsOnPlayersInSegmentTaskParameter = {
	--[[
		List of actions to perform on each player in a segment. Each action object can
		contain only one action type.

	]]
	Actions: { Action }?,
	--[[
		ID of the segment to perform actions on.

	]]
	SegmentId: string,
}

export type ScheduledTaskType = 
	| "CloudScript"
	| "ActionsOnPlayerSegment"
	| "CloudScriptAzureFunctions"
	| "InsightsScheduledScaling"

export type LookupUserAccountInfoResult = {
	UserInfo: UserAccountInfo?,
}

export type DeleteMasterPlayerAccountResult = {
	--[[
		A notification email with this job receipt Id will be sent to the title
		notification email address when deletion is complete.

	]]
	JobReceiptId: string?,
	--[[
		List of titles from which the player's data will be deleted.

	]]
	TitleIds: { string }?,
}

--[[
	This returns the total number of these items available.

]]
export type CheckLimitedEditionItemAvailabilityRequest = {
	--[[
		Which catalog is being updated. If null, uses the default catalog.

	]]
	CatalogVersion: string?,
	--[[
		The item to check for.

	]]
	ItemId: string,
}

--[[
	When used for SetCatalogItems, this operation is not additive. Using it will
	cause the indicated catalog version to be created from scratch. If there is
	an existing catalog with the version number in question, it will be deleted
	and replaced with only the items specified in this call. When used for
	UpdateCatalogItems, this operation is additive. Items with ItemId values not
	currently in the catalog will be added, while those with ItemId values
	matching items currently in the catalog will overwrite those items with the
	given values.

]]
export type UpdateCatalogItemsRequest = {
	--[[
		Should this catalog be set as the default catalog. Defaults to true. If there
		is currently no default catalog, this will always set it.

	]]
	SetAsDefaultCatalog: boolean?,
	--[[
		Which catalog is being updated. If null, uses the default catalog.

	]]
	CatalogVersion: string?,
	--[[
		Array of catalog items to be submitted. Note that while CatalogItem has a
		parameter for CatalogVersion, it is not required and ignored in this call.

	]]
	Catalog: { CatalogItem }?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

--[[
	Player Shared Secret Keys are used for the call to Client/GetTitlePublicKey,
	which exchanges the shared secret for an RSA CSP blob to be used to encrypt
	the payload of account creation requests when that API requires a signature
	header.

]]
export type UpdatePlayerSharedSecretRequest = {
	--[[
		The shared secret key to update

	]]
	SecretKey: string?,
	--[[
		Disable or Enable this key

	]]
	Disabled: boolean,
	--[[
		Friendly name for this key

	]]
	FriendlyName: string?,
}

--[[
	Task name is unique within a title. Using a task name that's already taken
	will cause a name conflict error. Too many create-task requests within a
	short time will cause a create conflict error.

]]
export type CreateActionsOnPlayerSegmentTaskRequest = {
	--[[
		Cron expression for the run schedule of the task. The expression should be in
		UTC.

	]]
	Schedule: string?,
	--[[
		Description the task

	]]
	Description: string?,
	--[[
		Name of the task. This is a unique identifier for tasks in the title.

	]]
	Name: string,
	--[[
		Whether the schedule is active. Inactive schedule will not trigger task
		execution.

	]]
	IsActive: boolean,
	Parameter: ActionsOnPlayersInSegmentTaskParameter,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type ListVirtualCurrencyTypesResult = {
	--[[
		List of virtual currency names defined for this title

	]]
	VirtualCurrencies: { VirtualCurrencyData }?,
}

export type TagModel = {
	--[[
		Full value of the tag, including namespace

	]]
	TagValue: string?,
}

export type LinkedPlatformAccountModel = {
	--[[
		Unique account identifier of the user on the platform

	]]
	PlatformUserId: string?,
	Platform: LoginIdentityProvider?,
	--[[
		Linked account username of the user on the platform, if available

	]]
	Username: string?,
	--[[
		Linked account email of the user on the platform, if available

	]]
	Email: string?,
}

export type PlayerProfileModel = {
	--[[
		PlayFab player account unique identifier

	]]
	PlayerId: string?,
	Origination: LoginIdentityProvider?,
	--[[
		UTC time when the player most recently logged in to the title

	]]
	LastLogin: string?,
	--[[
		List of all authentication systems linked to this player account

	]]
	LinkedAccounts: { LinkedPlatformAccountModel }?,
	--[[
		List of advertising campaigns the player has been attributed to

	]]
	AdCampaignAttributions: { AdCampaignAttributionModel }?,
	--[[
		Publisher this player belongs to

	]]
	PublisherId: string?,
	--[[
		List of configured end points registered for sending the player push
		notifications

	]]
	PushNotificationRegistrations: { PushNotificationRegistrationModel }?,
	--[[
		Player record created

	]]
	Created: string?,
	--[[
		List of the player's lifetime purchase totals, summed by real-money currency

	]]
	ValuesToDate: { ValueToDateModel }?,
	--[[
		List of player's tags for segmentation

	]]
	Tags: { TagModel }?,
	--[[
		List of memberships for the player, along with whether are expired.

	]]
	Memberships: { MembershipModel }?,
	--[[
		Player display name

	]]
	DisplayName: string?,
	--[[
		Sum of the player's purchases made with real-money currencies, converted to US
		dollars equivalent and represented as a whole number of cents (1/100 USD). For
		example, 999 indicates nine dollars and ninety-nine cents.

	]]
	TotalValueToDateInUSD: number?,
	--[[
		List of all contact email info associated with the player account

	]]
	ContactEmailAddresses: { ContactEmailInfoModel }?,
	--[[
		If the player is currently banned, the UTC Date when the ban expires

	]]
	BannedUntil: string?,
	--[[
		Title ID this player profile applies to

	]]
	TitleId: string?,
	--[[
		List of geographic locations from which the player has logged in to the title

	]]
	Locations: { LocationModel }?,
	--[[
		List of leaderboard statistic values for the player

	]]
	Statistics: { StatisticModel }?,
	--[[
		URL of the player's avatar image

	]]
	AvatarUrl: string?,
	--[[
		List of experiment variants for the player. Note that these variants are not
		guaranteed to be up-to-date when returned during login because the player
		profile is updated only after login. Instead, use the
		LoginResult.TreatmentAssignment property during login to get the correct
		variants and variables.

	]]
	ExperimentVariants: { string }?,
}

export type GetPlayerProfileResult = {
	PlayerProfile: PlayerProfileModel?,
}

--[[
	This API is designed to store publisher-specific values which can be read,
	but not written to, by the client. This data is shared across all titles
	assigned to a particular publisher, and can be used for cross-game
	coordination. Only titles assigned to a publisher can use this API. This
	operation is additive. If a Key does not exist in the current dataset, it
	will be added with the specified Value. If it already exists, the Value for
	that key will be overwritten with the new Value. For more information email
	helloplayfab@microsoft.com

]]
export type SetPublisherDataRequest = {
	--[[
		key we want to set a value on (note, this is additive - will only replace an
		existing key's value if they are the same name.) Keys are trimmed of
		whitespace. Keys may not begin with the '!' character.

	]]
	Key: string,
	--[[
		new value to set. Set to null to remove a value

	]]
	Value: string?,
}

export type ResultTableNodeType = 
	| "ItemId"
	| "TableId"

export type UpdatePlayerSharedSecretResult = {
	-- No properties defined in spec
	[string]: any
}

export type UpdatePlayerStatisticDefinitionResult = {
	Statistic: PlayerStatisticDefinition?,
}

export type UserServerCustomIdInfo = {
	--[[
		Custom ID

	]]
	CustomId: string?,
}

--[[
	This API lets developers set overrides for membership expirations,
	independent of any subscriptions setting it.

]]
export type SetMembershipOverrideRequest = {
	--[[
		Id of the membership to apply the override expiration date to.

	]]
	MembershipId: string,
	--[[
		Unique PlayFab assigned ID of the user on whom the operation will be
		performed.

	]]
	PlayFabId: string,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		Expiration time for the membership in DateTime format, will override any
		subscription expirations.

	]]
	ExpirationTime: string,
}

--[[
	Performs an additive update of the custom properties for the specified
	player. In updating the player's custom properties, properties which already
	exist will have their values overwritten. No other properties will be
	changed apart from those specified in the call.

]]
export type UpdatePlayerCustomPropertiesRequest = {
	--[[
		Optional field used for concurrency control. One can ensure that the update
		operation will only be performed if the player's properties have not been
		updated by any other clients since last the version.

	]]
	ExpectedPropertiesVersion: number?,
	--[[
		Unique PlayFab assigned ID of the user on whom the operation will be
		performed.

	]]
	PlayFabId: string,
	--[[
		Collection of properties to be set for a player.

	]]
	Properties: { UpdateProperty },
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

--[[
	Identifier by either name or ID. Note that a name may change due to
	renaming, or reused after being deleted. ID is immutable and unique.

]]
export type NameIdentifier = {
	--[[
		Id Identifier, if present

	]]
	Id: string?,
	--[[
		Name Identifier, if present

	]]
	Name: string?,
}

export type CreatePlayerStatisticDefinitionResult = {
	Statistic: PlayerStatisticDefinition?,
}

export type PermissionStatement = {
	--[[
		The principal this statement will effect. The only supported principal is '*'.

	]]
	Principal: string,
	--[[
		The action this statement effects. The only supported action is 'Execute'.

	]]
	Action: string,
	Effect: EffectType,
	--[[
		The resource this statements effects. The only supported resources look like
		'pfrn:api--*' for all apis, or 'pfrn:api--/Client/ConfirmPurchase' for
		specific apis.

	]]
	Resource: string,
	--[[
		A comment about the statement. Intended solely for bookkeeping and debugging.

	]]
	Comment: string?,
	ApiConditions: ApiCondition?,
}

export type GetUserInventoryResult = {
	--[[
		Array of inventory items belonging to the user.

	]]
	Inventory: { ItemInstance }?,
	--[[
		Unique PlayFab assigned ID of the user on whom the operation will be
		performed.

	]]
	PlayFabId: string?,
	--[[
		Array of virtual currency balance(s) belonging to the user.

	]]
	VirtualCurrency: {
		-- No properties defined in spec
		[string]: any
	}?,
	VirtualCurrencyRechargeTimes: VirtualCurrencyRechargeTime?,
}

export type UpdateStoreItemsResult = {
	-- No properties defined in spec
	[string]: any
}

export type GetContentUploadUrlRequest = {
	--[[
		Key of the content item to upload, usually formatted as a path, e.g.
		images/a.png

	]]
	Key: string,
	--[[
		A standard MIME type describing the format of the contents. The same MIME type
		has to be set in the header when uploading the content. If not specified, the
		MIME type is 'binary/octet-stream' by default.

	]]
	ContentType: string?,
}

export type ChurnRiskLevel = 
	| "NoData"
	| "LowRisk"
	| "MediumRisk"
	| "HighRisk"

export type IncrementPlayerStatisticContent = {
	--[[
		Name of the player statistic to be incremented

	]]
	StatisticName: string,
	--[[
		Amount(in whole number) to increase the player statistic by

	]]
	StatisticChangeBy: number,
}

export type DeletePlayerResult = {
	-- No properties defined in spec
	[string]: any
}

--[[
	A purchasable item from the item catalog

]]
export type CatalogItem = {
	--[[
		text description of item, to show in-game

	]]
	Description: string?,
	--[[
		price of this item in virtual currencies and "RM" (the base Real Money
		purchase price, in USD pennies)

	]]
	VirtualCurrencyPrices: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		override prices for this item for specific currencies

	]]
	RealCurrencyPrices: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		game specific custom data

	]]
	CustomData: string?,
	--[[
		Containers are inventory items that can hold other items defined in the
		catalog, as well as virtual currency, which is added to the player inventory
		when the container is unlocked, using the UnlockContainerItem API. The items
		can be anything defined in the catalog, as well as RandomResultTable objects
		which will be resolved when the container is unlocked. Containers and their
		keys should be defined as Consumable (having a limited number of uses) in
		their catalog defintiions, unless the intent is for the player to be able to
		re-use them infinitely.

	]]
	Container: CatalogItemContainerInfo?,
	--[[
		URL to the item image. For Facebook purchase to display the image on the item
		purchase page, this must be set to an HTTP URL.

	]]
	ItemImageUrl: string?,
	--[[
		class to which the item belongs

	]]
	ItemClass: string?,
	--[[
		list of item tags

	]]
	Tags: { string }?,
	Bundle: CatalogItemBundleInfo?,
	--[[
		if true, then an item instance of this type can be used to grant a character
		to a user.

	]]
	CanBecomeCharacter: boolean,
	--[[
		catalog version for this item

	]]
	CatalogVersion: string?,
	Consumable: CatalogItemConsumableInfo?,
	--[[
		text name for the item, to show in-game

	]]
	DisplayName: string?,
	--[[
		If the item has IsLImitedEdition set to true, and this is the first time this
		ItemId has been defined as a limited edition item, this value determines the
		total number of instances to allocate for the title. Once this limit has been
		reached, no more instances of this ItemId can be created, and attempts to
		purchase or grant it will return a Result of false for that ItemId. If the
		item has already been defined to have a limited edition count, or if this
		value is less than zero, it will be ignored.

	]]
	InitialLimitedEditionCount: number,
	--[[
		BETA: If true, then only a fixed number can ever be granted.

	]]
	IsLimitedEdition: boolean,
	--[[
		if true, then only one item instance of this type will exist and its
		remaininguses will be incremented instead. RemainingUses will cap out at
		Int32.Max (2,147,483,647). All subsequent increases will be discarded

	]]
	IsStackable: boolean,
	--[[
		if true, then an item instance of this type can be traded between players
		using the trading APIs

	]]
	IsTradable: boolean,
	--[[
		unique identifier for this item

	]]
	ItemId: string,
}

--[[
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

]]
export type ExportMasterPlayerDataRequest = {
	--[[
		Unique PlayFab assigned ID of the user on whom the operation will be
		performed.

	]]
	PlayFabId: string,
}

export type SegmentCurrency = 
	| "AED"
	| "AFN"
	| "ALL"
	| "AMD"
	| "ANG"
	| "AOA"
	| "ARS"
	| "AUD"
	| "AWG"
	| "AZN"
	| "BAM"
	| "BBD"
	| "BDT"
	| "BGN"
	| "BHD"
	| "BIF"
	| "BMD"
	| "BND"
	| "BOB"
	| "BRL"
	| "BSD"
	| "BTN"
	| "BWP"
	| "BYR"
	| "BZD"
	| "CAD"
	| "CDF"
	| "CHF"
	| "CLP"
	| "CNY"
	| "COP"
	| "CRC"
	| "CUC"
	| "CUP"
	| "CVE"
	| "CZK"
	| "DJF"
	| "DKK"
	| "DOP"
	| "DZD"
	| "EGP"
	| "ERN"
	| "ETB"
	| "EUR"
	| "FJD"
	| "FKP"
	| "GBP"
	| "GEL"
	| "GGP"
	| "GHS"
	| "GIP"
	| "GMD"
	| "GNF"
	| "GTQ"
	| "GYD"
	| "HKD"
	| "HNL"
	| "HRK"
	| "HTG"
	| "HUF"
	| "IDR"
	| "ILS"
	| "IMP"
	| "INR"
	| "IQD"
	| "IRR"
	| "ISK"
	| "JEP"
	| "JMD"
	| "JOD"
	| "JPY"
	| "KES"
	| "KGS"
	| "KHR"
	| "KMF"
	| "KPW"
	| "KRW"
	| "KWD"
	| "KYD"
	| "KZT"
	| "LAK"
	| "LBP"
	| "LKR"
	| "LRD"
	| "LSL"
	| "LYD"
	| "MAD"
	| "MDL"
	| "MGA"
	| "MKD"
	| "MMK"
	| "MNT"
	| "MOP"
	| "MRO"
	| "MUR"
	| "MVR"
	| "MWK"
	| "MXN"
	| "MYR"
	| "MZN"
	| "NAD"
	| "NGN"
	| "NIO"
	| "NOK"
	| "NPR"
	| "NZD"
	| "OMR"
	| "PAB"
	| "PEN"
	| "PGK"
	| "PHP"
	| "PKR"
	| "PLN"
	| "PYG"
	| "QAR"
	| "RON"
	| "RSD"
	| "RUB"
	| "RWF"
	| "SAR"
	| "SBD"
	| "SCR"
	| "SDG"
	| "SEK"
	| "SGD"
	| "SHP"
	| "SLL"
	| "SOS"
	| "SPL"
	| "SRD"
	| "STD"
	| "SVC"
	| "SYP"
	| "SZL"
	| "THB"
	| "TJS"
	| "TMT"
	| "TND"
	| "TOP"
	| "TRY"
	| "TTD"
	| "TVD"
	| "TWD"
	| "TZS"
	| "UAH"
	| "UGX"
	| "USD"
	| "UYU"
	| "UZS"
	| "VEF"
	| "VND"
	| "VUV"
	| "WST"
	| "XAF"
	| "XCD"
	| "XDR"
	| "XOF"
	| "XPF"
	| "YER"
	| "ZAR"
	| "ZMW"
	| "ZWD"

--[[
	The returned task instance ID can be used to query for task execution
	status.

]]
export type RunTaskRequest = {
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		Identifier by either name or ID. Note that a name may change due to renaming,
		or reused after being deleted. ID is immutable and unique.

	]]
	Identifier: NameIdentifier?,
}

--[[
	Will set the given key values in the specified override or the primary title
	data based on whether the label is provided or not.

]]
export type SetTitleDataAndOverridesRequest = {
	--[[
		Name of the override.

	]]
	OverrideLabel: string?,
	--[[
		List of titleData key-value pairs to set/delete. Use an empty value to delete
		an existing key; use a non-empty value to create/update a key.

	]]
	KeyValues: { TitleDataKeyValue },
}

--[[
	Contains information for a ban.

]]
export type BanInfo = {
	--[[
		The time when this ban was applied.

	]]
	Created: string?,
	--[[
		Unique PlayFab assigned ID of the user on whom the operation will be
		performed.

	]]
	PlayFabId: string?,
	--[[
		The IP address on which the ban was applied. May affect multiple players.

	]]
	IPAddress: string?,
	--[[
		The active state of this ban. Expired bans may still have this value set to
		true but they will have no effect.

	]]
	Active: boolean,
	--[[
		The family type of the user that is included in the ban.

	]]
	UserFamilyType: string?,
	--[[
		The unique Ban Id associated with this ban.

	]]
	BanId: string?,
	--[[
		The time when this ban expires. Permanent bans do not have expiration date.

	]]
	Expires: string?,
	--[[
		The reason why this ban was applied.

	]]
	Reason: string?,
}

export type GetCloudScriptTaskInstanceResult = {
	Parameter: CloudScriptTaskParameter?,
	Summary: CloudScriptTaskSummary?,
}

export type UserTitleInfo = {
	--[[
		timestamp indicating when the user was first associated with this game (this
		can differ significantly from when the user first registered with PlayFab)

	]]
	Created: string,
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	TitlePlayerAccount: EntityKey?,
	--[[
		URL to the player's avatar.

	]]
	AvatarUrl: string?,
	--[[
		name of the user, as it is displayed in-game

	]]
	DisplayName: string?,
	Origination: UserOrigination?,
	--[[
		timestamp indicating when the user first signed into this game (this can
		differ from the Created timestamp, as other events, such as issuing a beta key
		to the user, can associate the title to the user)

	]]
	FirstLogin: string?,
	--[[
		boolean indicating whether or not the user is currently banned for a title

	]]
	isBanned: boolean?,
	--[[
		timestamp for the last user login for this title

	]]
	LastLogin: string?,
}

export type ResetCharacterStatisticsResult = {
	-- No properties defined in spec
	[string]: any
}

export type AddLocalizedNewsResult = {
	-- No properties defined in spec
	[string]: any
}

export type SegmentFilterComparison = 
	| "GreaterThan"
	| "LessThan"
	| "EqualTo"
	| "NotEqualTo"
	| "GreaterThanOrEqual"
	| "LessThanOrEqual"
	| "Exists"
	| "Contains"
	| "NotContains"

--[[
	This operation is additive. Any new currencies defined in the array will be
	added to the set of those available for the title, while any CurrencyCode
	identifiers matching existing ones in the game will be overwritten with the
	new values.

]]
export type AddVirtualCurrencyTypesRequest = {
	--[[
		List of virtual currencies and their initial deposits (the amount a user is
		granted when signing in for the first time) to the title

	]]
	VirtualCurrencies: { VirtualCurrencyData },
}

export type UserAccountInfo = {
	BattleNetAccountInfo: UserBattleNetInfo?,
	XboxInfo: UserXboxInfo?,
	KongregateInfo: UserKongregateInfo?,
	CustomIdInfo: UserCustomIdInfo?,
	--[[
		User account name in the PlayFab service

	]]
	Username: string?,
	NintendoSwitchDeviceIdInfo: UserNintendoSwitchDeviceIdInfo?,
	FacebookInfo: UserFacebookInfo?,
	AppleAccountInfo: UserAppleIdInfo?,
	--[[
		Timestamp indicating when the user account was created

	]]
	Created: string,
	--[[
		Unique identifier for the user account

	]]
	PlayFabId: string?,
	GooglePlayGamesInfo: UserGooglePlayGamesInfo?,
	TitleInfo: UserTitleInfo?,
	TwitchInfo: UserTwitchInfo?,
	PsnInfo: UserPsnInfo?,
	AndroidDeviceInfo: UserAndroidDeviceInfo?,
	GameCenterInfo: UserGameCenterInfo?,
	ServerCustomIdInfo: UserServerCustomIdInfo?,
	SteamInfo: UserSteamInfo?,
	--[[
		OpenID Connect information, if any OpenID Connect accounts have been linked

	]]
	OpenIdInfo: { UserOpenIdInfo }?,
	IosDeviceInfo: UserIosDeviceInfo?,
	NintendoSwitchAccountInfo: UserNintendoSwitchAccountIdInfo?,
	PrivateInfo: UserPrivateAccountInfo?,
	GoogleInfo: UserGoogleInfo?,
	FacebookInstantGamesIdInfo: UserFacebookInstantGamesIdInfo?,
}

export type UserAppleIdInfo = {
	--[[
		Apple subject ID

	]]
	AppleSubjectId: string?,
}

export type UpdateUserTitleDisplayNameResult = {
	--[[
		current title display name for the user (this will be the original display
		name if the rename attempt failed)

	]]
	DisplayName: string?,
}

export type DeletePlayerSharedSecretResult = {
	-- No properties defined in spec
	[string]: any
}

export type CreateTaskResult = {
	--[[
		ID of the task

	]]
	TaskId: string?,
}

export type GetPlayedTitleListResult = {
	--[[
		List of titles the player has played

	]]
	TitleIds: { string }?,
}

--[[
	In addition to the PlayFab username, titles can make use of a DisplayName
	which is also a unique identifier, but specific to the title. This allows
	for unique names which more closely match the theme or genre of a title, for
	example. This API enables changing that name, whether due to a customer
	request, an offensive name choice, etc.

]]
export type UpdateUserTitleDisplayNameRequest = {
	--[[
		PlayFab unique identifier of the user whose title specific display name is to
		be changed

	]]
	PlayFabId: string,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		New title display name for the user - must be between 3 and 25 characters

	]]
	DisplayName: string,
}

export type SetPublisherDataResult = {
	-- No properties defined in spec
	[string]: any
}

export type GetCloudScriptVersionsResult = {
	--[[
		List of versions

	]]
	Versions: { CloudScriptVersionStatus }?,
}

export type ApiCondition = {
	HasSignatureOrEncryption: Conditionals?,
}

export type MembershipModel = {
	--[[
		The id of the membership

	]]
	MembershipId: string?,
	--[[
		The list of subscriptions that this player has for this membership

	]]
	Subscriptions: { SubscriptionModel }?,
	--[[
		The time this membership expires

	]]
	MembershipExpiration: string,
	--[[
		Whether the override expiration is set.

	]]
	OverrideIsSet: boolean?,
	--[[
		Whether this membership is active. That is, whether the MembershipExpiration
		time has been reached.

	]]
	IsActive: boolean,
	--[[
		Membership expirations can be explicitly overridden (via game manager or the
		admin api). If this membership has been overridden, this will be the new
		expiration time.

	]]
	OverrideExpiration: string?,
}

export type GetPlayerStatisticVersionsRequest = {
	--[[
		unique name of the statistic

	]]
	StatisticName: string?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type SegmentOrDefinition = {
	--[[
		List of segment and definitions.

	]]
	SegmentAndDefinitions: { SegmentAndDefinition }?,
}

export type GetTaskInstancesResult = {
	--[[
		Basic status summaries of the queried task instances. Empty If no task
		instances meets the filter criteria. To get detailed status summary, use
		Get*TaskInstance API according to task type (e.g.
		GetActionsOnPlayersInSegmentTaskInstance).

	]]
	Summaries: { TaskInstanceBasicSummary }?,
}

export type UserKongregateInfo = {
	--[[
		Kongregate Username

	]]
	KongregateName: string?,
	--[[
		Kongregate ID

	]]
	KongregateId: string?,
}

export type ContactEmailInfo = {
	--[[
		The name of the email info data

	]]
	Name: string?,
	--[[
		The email address

	]]
	EmailAddress: string?,
	VerificationStatus: EmailVerificationStatus?,
}

--[[
	Task name is unique within a title. Using a task name that's already taken
	will cause a name conflict error. Too many create-task requests within a
	short time will cause a create conflict error.

]]
export type CreateInsightsScheduledScalingTaskRequest = {
	--[[
		Cron expression for the run schedule of the task. The expression should be in
		UTC.

	]]
	Schedule: string?,
	--[[
		Description the task

	]]
	Description: string?,
	--[[
		Name of the task. This is a unique identifier for tasks in the title.

	]]
	Name: string,
	--[[
		Whether the schedule is active. Inactive schedule will not trigger task
		execution.

	]]
	IsActive: boolean,
	Parameter: InsightsScalingTaskParameter,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type TitleActivationStatus = 
	| "None"
	| "ActivatedTitleKey"
	| "PendingSteam"
	| "ActivatedSteam"
	| "RevokedSteam"

export type GetSegmentResult = {
	--[[
		Unique identifier for this segment.

	]]
	Id: string,
	--[[
		Identifier of the segments AB Test, if it is attached to one.

	]]
	ABTestParent: string?,
	--[[
		Segment name.

	]]
	Name: string?,
}

export type LoginIdentityProvider = 
	| "Unknown"
	| "PlayFab"
	| "Custom"
	| "GameCenter"
	| "GooglePlay"
	| "Steam"
	| "XBoxLive"
	| "PSN"
	| "Kongregate"
	| "Facebook"
	| "IOSDevice"
	| "AndroidDevice"
	| "Twitch"
	| "WindowsHello"
	| "GameServer"
	| "CustomServer"
	| "NintendoSwitch"
	| "FacebookInstantGames"
	| "OpenIdConnect"
	| "Apple"
	| "NintendoSwitchAccount"
	| "GooglePlayGames"
	| "XboxMobileStore"
	| "King"
	| "BattleNet"

export type OpenIdIssuerInformation = {
	--[[
		Authorization endpoint URL to direct users to for signin.

	]]
	AuthorizationUrl: string,
	--[[
		Token endpoint URL for code verification.

	]]
	TokenUrl: string,
	--[[
		The URL of the issuer of the tokens. This must match the exact URL of the
		issuer field in tokens.

	]]
	Issuer: string,
	--[[
		JSON Web Key Set for validating the signature of tokens.

	]]
	JsonWebKeySet: {
		-- No properties defined in spec
		[string]: any
	},
}

export type ChurnPredictionSegmentFilter = {
	RiskLevel: ChurnRiskLevel?,
	Comparison: SegmentFilterComparison?,
}

export type BanPlayerContent = {
	--[[
		Duration(in hours) to ban a player. If not provided, the player will be banned
		permanently.

	]]
	BanDurationHours: number?,
	--[[
		Reason to ban a player

	]]
	BanReason: string?,
}

export type PushNotificationPlatform = 
	| "ApplePushNotificationService"
	| "GoogleCloudMessaging"

export type ValueToDateModel = {
	--[[
		Total value of the purchases in a string representation of decimal monetary
		units. For example, '9.99' indicates nine dollars and ninety-nine cents when
		Currency is 'USD'.

	]]
	TotalValueAsDecimal: string?,
	--[[
		ISO 4217 code of the currency used in the purchases

	]]
	Currency: string?,
	--[[
		Total value of the purchases in a whole number of 1/100 monetary units. For
		example, 999 indicates nine dollars and ninety-nine cents when Currency is
		'USD')

	]]
	TotalValue: number,
}

export type UpdateBansResult = {
	--[[
		Information on the bans that were updated

	]]
	BanData: { BanInfo }?,
}

export type ExecuteCloudScriptContent = {
	--[[
		Arguments(JSON) to be passed into the cloudscript method

	]]
	CloudScriptMethodArguments: string,
	--[[
		Cloudscript method name

	]]
	CloudScriptMethodName: string,
	--[[
		Publish cloudscript results as playstream event

	]]
	PublishResultsToPlayStream: boolean,
}

export type DeleteInventoryItemV2Content = {
	--[[
		The collection id for where the item will be removed from the player inventory

	]]
	CollectionId: string?,
	--[[
		The stack id for where the item will be removed from the player inventory

	]]
	StackId: string?,
	--[[
		The id of item to be removed from the player

	]]
	ItemId: string?,
}

export type RevokeInventoryItemsResult = {
	--[[
		Collection of any errors that occurred during processing.

	]]
	Errors: { RevokeItemError }?,
}

export type TotalValueToDateInUSDSegmentFilter = {
	--[[
		Total value to date USD amount.

	]]
	Amount: string?,
	Comparison: SegmentFilterComparison?,
}

export type UserCustomIdInfo = {
	--[[
		Custom ID

	]]
	CustomId: string?,
}

export type ListPlayerCustomPropertiesRequest = {
	--[[
		Unique PlayFab assigned ID of the user on whom the operation will be
		performed.

	]]
	PlayFabId: string,
}

export type PlayerChurnPredictionTimeSegmentFilter = {
	Comparison: SegmentFilterComparison?,
	--[[
		DurationInDays

	]]
	DurationInDays: number,
}

export type GetSegmentsResponse = {
	--[[
		List of title segments.

	]]
	Segments: { SegmentModel }?,
	--[[
		Error message.

	]]
	ErrorMessage: string?,
}

export type ExecuteAzureFunctionSegmentAction = {
	--[[
		Azure function.

	]]
	AzureFunction: string?,
	--[[
		Azure function parameter.

	]]
	FunctionParameter: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		Generate play stream event.

	]]
	GenerateFunctionExecutedEvents: boolean,
}

export type SegmentModel = {
	--[[
		Segment actions for current left segment players.

	]]
	LeftSegmentActions: { SegmentTrigger }?,
	--[[
		Segment description.

	]]
	Description: string?,
	--[[
		Segment actions for current entered segment players.

	]]
	EnteredSegmentActions: { SegmentTrigger }?,
	--[[
		Segment name.

	]]
	Name: string?,
	--[[
		Segment id in hex.

	]]
	SegmentId: string?,
	--[[
		Segment last updated date time.

	]]
	LastUpdateTime: string,
	--[[
		Segment or definitions. This includes segment and definitions and filters.

	]]
	SegmentOrDefinitions: { SegmentOrDefinition }?,
}

--[[
	Result of granting an item to a user. Note, to retrieve additional
	information for an item such as Tags, Description that are the same across
	all instances of the item, a call to GetCatalogItems is required. The ItemID
	of can be matched to a catalog entry, which contains the additional
	information. Also note that Custom Data is only set when the User's specific
	instance has updated the CustomData via a call to
	UpdateUserInventoryItemCustomData. Other fields such as UnitPrice and
	UnitCurrency are only set when the item was granted via a purchase.

]]
export type GrantedItemInstance = {
	--[[
		Total number of remaining uses, if this is a consumable item.

	]]
	RemainingUses: number?,
	--[[
		Unique identifier for the parent inventory item, as defined in the catalog,
		for object which were added from a bundle or container.

	]]
	BundleParent: string?,
	--[[
		Unique item identifier for this specific instance of the item.

	]]
	ItemInstanceId: string?,
	--[[
		Game specific comment associated with this instance when it was added to the
		user inventory.

	]]
	Annotation: string?,
	--[[
		A set of custom key-value pairs on the instance of the inventory item, which
		is not to be confused with the catalog item's custom data.

	]]
	CustomData: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		Unique identifier for the inventory item, as defined in the catalog.

	]]
	ItemId: string?,
	--[[
		Unique PlayFab assigned ID of the user on whom the operation will be
		performed.

	]]
	PlayFabId: string?,
	--[[
		Class name for the inventory item, as defined in the catalog.

	]]
	ItemClass: string?,
	--[[
		Unique PlayFab assigned ID for a specific character owned by a user

	]]
	CharacterId: string?,
	--[[
		The number of uses that were added or removed to this item in this call.

	]]
	UsesIncrementedBy: number?,
	--[[
		Catalog version for the inventory item, when this instance was created.

	]]
	CatalogVersion: string?,
	--[[
		Currency type for the cost of the catalog item. Not available when granting
		items.

	]]
	UnitCurrency: string?,
	--[[
		CatalogItem.DisplayName at the time this item was purchased.

	]]
	DisplayName: string?,
	--[[
		Timestamp for when this instance will expire.

	]]
	Expiration: string?,
	--[[
		Cost of the catalog item in the given currency. Not available when granting
		items.

	]]
	UnitPrice: number,
	--[[
		Timestamp for when this instance was purchased.

	]]
	PurchaseDate: string?,
	--[[
		Array of unique items that were awarded when this catalog item was purchased.

	]]
	BundleContents: { string }?,
	--[[
		Result of this operation.

	]]
	Result: boolean,
}

--[[
	Virtual currencies to be removed cannot have entries in any catalog nor
	store for the title. Note that this operation will not remove player
	balances for the removed currencies; if a deleted currency is recreated at
	any point, user balances will be in an undefined state.

]]
export type RemoveVirtualCurrencyTypesRequest = {
	--[[
		List of virtual currencies to delete

	]]
	VirtualCurrencies: { VirtualCurrencyData },
}

export type ListOpenIdConnectionRequest = {
	-- No properties defined in spec
	[string]: any
}

export type Conditionals = 
	| "Any"
	| "True"
	| "False"



return nil
