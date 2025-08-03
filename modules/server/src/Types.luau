--[[
	This file was generated on 2025-08-03 at 00:04 UTC. Do not edit directly.

]]

--[[
	Transfers an item from a character to the owning user. This will remove the
	item from the character's inventory (until and unless it is moved back), and
	will enable the user to make use of the item instead.

]]
export type MoveItemToUserFromCharacterRequest = {
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
		Unique PlayFab assigned instance identifier of the item

	]]
	ItemInstanceId: string,
}

export type ChurnRiskLevel = 
	| "NoData"
	| "LowRisk"
	| "MediumRisk"
	| "HighRisk"

export type CloudScriptRevisionOption = 
	| "Live"
	| "Latest"
	| "Specific"

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

export type GetPlayFabIDsFromXboxLiveIDsRequest = {
	--[[
		The ID of Xbox Live sandbox.

	]]
	Sandbox: string?,
	--[[
		Array of unique Xbox Live account identifiers for which the title needs to get
		PlayFab identifiers. The array cannot exceed 25 in length.

	]]
	XboxLiveAccountIDs: { string },
}

export type WriteEventResponse = {
	--[[
		The unique identifier of the event. The values of this identifier consist of
		ASCII characters and are not constrained to any particular format.

	]]
	EventId: string?,
}

export type PlayerLeaderboardEntry = {
	Profile: PlayerProfileModel?,
	--[[
		PlayFab unique identifier of the user for this leaderboard entry.

	]]
	PlayFabId: string?,
	--[[
		User's overall position in the leaderboard.

	]]
	Position: number,
	--[[
		Title-specific display name of the user for this leaderboard entry.

	]]
	DisplayName: string?,
	--[[
		Specific value of the user's statistic.

	]]
	StatValue: number,
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

export type UnlinkXboxAccountResult = {
	-- No properties defined in spec
	[string]: any
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

--[[
	If SharedGroupId is specified, the service will attempt to create a group
	with that identifier, and will return an error if it is already in use. If
	no SharedGroupId is specified, a random identifier will be assigned.

]]
export type CreateSharedGroupRequest = {
	--[[
		Unique identifier for the shared group (a random identifier will be assigned,
		if one is not specified).

	]]
	SharedGroupId: string?,
}

export type PlayerStatisticVersion = {
	--[[
		time when the statistic version became inactive due to statistic version
		incrementing

	]]
	DeactivationTime: string?,
	--[[
		time at which the statistic version was scheduled to become inactive, based on
		the configured ResetInterval

	]]
	ScheduledDeactivationTime: string?,
	--[[
		name of the statistic when the version became active

	]]
	StatisticName: string?,
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
		version of the statistic

	]]
	Version: number,
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

export type TagModel = {
	--[[
		Full value of the tag, including namespace

	]]
	TagValue: string?,
}

export type LinkServerCustomIdRequest = {
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		Unique PlayFab identifier.

	]]
	PlayFabId: string,
	--[[
		If another user is already linked to the custom ID, unlink the other user and
		re-link.

	]]
	ForceLink: boolean?,
	--[[
		Unique server custom identifier for this player.

	]]
	ServerCustomId: string,
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

--[[
	Represents the save push notification template result.

]]
export type SavePushNotificationTemplateResult = {
	--[[
		Id of the push notification template that was saved.

	]]
	PushNotificationTemplateId: string?,
}

export type GetPlayFabIDsFromNintendoServiceAccountIdsRequest = {
	--[[
		Array of unique Nintendo Switch Account identifiers for which the title needs
		to get PlayFab identifiers. The array cannot exceed 25 in length.

	]]
	NintendoAccountIds: { string },
}

export type GetPlayFabIDsFromTwitchIDsRequest = {
	--[[
		Array of unique Twitch identifiers (Twitch's _id) for which the title needs to
		get PlayFab identifiers. The array cannot exceed 25 in length.

	]]
	TwitchIds: { string },
}

export type NintendoServiceAccountPlayFabIdPair = {
	--[[
		Unique Nintendo Switch Service Account identifier for a user.

	]]
	NintendoServiceAccountId: string?,
	--[[
		Unique PlayFab identifier for a user, or null if no PlayFab account is linked
		to the Nintendo Switch Service Account identifier.

	]]
	PlayFabId: string?,
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

export type RemoveSharedGroupMembersResult = {
	-- No properties defined in spec
	[string]: any
}

export type BattleNetAccountPlayFabIdPair = {
	--[[
		Unique Battle.net account identifier for a user.

	]]
	BattleNetAccountId: string?,
	--[[
		Unique PlayFab identifier for a user, or null if no PlayFab account is linked
		to the Battle.net account identifier.

	]]
	PlayFabId: string?,
}

export type SharedGroupDataRecord = {
	--[[
		PlayFabId of the user to last update this value.

	]]
	LastUpdatedBy: string?,
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
	--[[
		Data stored for the specified group data key.

	]]
	Value: string?,
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

export type RevokeItemError = {
	Error: GenericErrorCodes?,
	Item: RevokeInventoryItem?,
}

export type LinkSteamIdResult = {
	-- No properties defined in spec
	[string]: any
}

export type AwardSteamAchievementItem = {
	--[[
		Unique PlayFab assigned ID of the user on whom the operation will be
		performed.

	]]
	PlayFabId: string,
	--[[
		Result of the award attempt (only valid on response, not on request).

	]]
	Result: boolean,
	--[[
		Unique Steam achievement name.

	]]
	AchievementName: string,
}

export type GetCharacterInventoryResult = {
	--[[
		Array of inventory items belonging to the character.

	]]
	Inventory: { ItemInstance }?,
	--[[
		Unique PlayFab assigned ID of the user on whom the operation will be
		performed.

	]]
	PlayFabId: string?,
	--[[
		Array of virtual currency balance(s) belonging to the character.

	]]
	VirtualCurrency: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		Unique identifier of the character for this inventory.

	]]
	CharacterId: string?,
	VirtualCurrencyRechargeTimes: VirtualCurrencyRechargeTime?,
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

export type AdvancedPushPlatformMsg = {
	--[[
		Stops GoogleCloudMessaging notifications from including both notification and
		data properties and instead only sends the data property.

	]]
	GCMDataOnly: boolean?,
	--[[
		The Json the platform should receive.

	]]
	Json: string,
	Platform: PushNotificationPlatform,
}

export type GetPlayFabIDsFromFacebookInstantGamesIdsRequest = {
	--[[
		Array of unique Facebook Instant Games identifiers for which the title needs
		to get PlayFab identifiers. The array cannot exceed 25 in length.

	]]
	FacebookInstantGamesIds: { string },
}

--[[
	This API is designed to store title specific values which can be read, but
	not written to, by the client. For example, a developer could choose to
	store values which modify the user experience, such as enemy spawn rates,
	weapon strengths, movement speeds, etc. This allows a developer to update
	the title without the need to create, test, and ship a new build. This
	operation is additive. If a Key does not exist in the current dataset, it
	will be added with the specified Value. If it already exists, the Value for
	that key will be overwritten with the new Value.

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

--[[
	For Nintendo Switch Device identifiers which have not been linked to PlayFab
	accounts, null will be returned.

]]
export type GetPlayFabIDsFromNintendoSwitchDeviceIdsResult = {
	--[[
		Mapping of Nintendo Switch Device identifiers to PlayFab identifiers.

	]]
	Data: { NintendoSwitchPlayFabIdPair }?,
}

export type PushNotificationRegistrationModel = {
	--[[
		Notification configured endpoint

	]]
	NotificationEndpointARN: string?,
	Platform: PushNotificationPlatform?,
}

--[[
	This API is designed to return title specific values which can be read, but
	not written to, by the client. For example, a developer could choose to
	store values which modify the user experience, such as enemy spawn rates,
	weapon strengths, movement speeds, etc. This allows a developer to update
	the title without the need to create, test, and ship a new build. If an
	override label is specified in the request, the overrides are applied
	automatically and returned with the title data. Note that there may up to a
	minute delay in between updating title data and this API call returning the
	newest value.

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
	For Nintendo Service Account identifiers which have not been linked to
	PlayFab accounts, null will be returned.

]]
export type GetPlayFabIDsFromNintendoServiceAccountIdsResult = {
	--[[
		Mapping of Nintendo Switch Service Account identifiers to PlayFab identifiers.

	]]
	Data: { NintendoServiceAccountPlayFabIdPair }?,
}

--[[
	Sends an email for only players that have contact emails associated with
	them. Takes in an email template ID specifyingthe email template to send.

]]
export type SendEmailFromTemplateRequest = {
	--[[
		Unique PlayFab assigned ID of the user on whom the operation will be
		performed.

	]]
	PlayFabId: string,
	--[[
		The email template id of the email template to send.

	]]
	EmailTemplateId: string,
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
	For a PlayFab account that isn't associated with a server custom identity,
	ServerCustomId will be null.

]]
export type GetServerCustomIDsFromPlayFabIDsResult = {
	--[[
		Mapping of server custom player identifiers to PlayFab identifiers.

	]]
	Data: { ServerCustomIDPlayFabIDPair }?,
}

export type GetLeaderboardAroundUserRequest = {
	--[[
		Unique PlayFab assigned ID of the user on whom the operation will be
		performed.

	]]
	PlayFabId: string,
	--[[
		Maximum number of entries to retrieve.

	]]
	MaxResultsCount: number,
	--[[
		If set to false, Version is considered null. If true, uses the specified
		Version

	]]
	UseSpecificVersion: boolean?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		The version of the leaderboard to get.

	]]
	Version: number?,
	--[[
		Unique identifier for the title-specific statistic for the leaderboard.

	]]
	StatisticName: string,
	ProfileConstraints: PlayerProfileViewConstraints?,
}

export type GetLeaderboardForUsersCharactersRequest = {
	--[[
		Unique identifier for the title-specific statistic for the leaderboard.

	]]
	StatisticName: string,
	--[[
		Unique PlayFab assigned ID of the user on whom the operation will be
		performed.

	]]
	PlayFabId: string,
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

export type PSNOnlinePlayFabIdPair = {
	--[[
		Unique PlayFab identifier for a user, or null if no PlayFab account is linked
		to the PlayStation :tm: Network identifier.

	]]
	PlayFabId: string?,
	--[[
		Unique PlayStation :tm: Network identifier for a user.

	]]
	PSNOnlineId: string?,
}

--[[
	Character statistics are similar to user statistics in that they are numeric
	values which may only be updated by a server operation, in order to minimize
	the opportunity for unauthorized changes. In addition to being available for
	use by the title, the statistics are used for all leaderboard operations in
	PlayFab.

]]
export type UpdateCharacterStatisticsRequest = {
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
		Statistics to be updated with the provided values.

	]]
	CharacterStatistics: {
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

export type XboxLiveAccountPlayFabIdPair = {
	--[[
		Unique PlayFab identifier for a user, or null if no PlayFab account is linked
		to the Xbox Live identifier.

	]]
	PlayFabId: string?,
	--[[
		Unique Xbox Live identifier for a user.

	]]
	XboxLiveAccountId: string?,
}

export type RedeemCouponResult = {
	--[[
		Items granted to the player as a result of redeeming the coupon.

	]]
	GrantedItems: { ItemInstance }?,
}

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

export type RemoveSharedGroupMembersRequest = {
	--[[
		An array of unique PlayFab assigned ID of the user on whom the operation will
		be performed.

	]]
	PlayFabIds: { string },
	--[[
		Unique identifier for the shared group.

	]]
	SharedGroupId: string,
}

--[[
	This function can both add and remove uses of an inventory item. If the
	number of uses drops below zero, the item will be removed from active
	inventory.

]]
export type ModifyItemUsesRequest = {
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		Number of uses to add to the item. Can be negative to remove uses.

	]]
	UsesToAdd: number,
	--[[
		PlayFab unique identifier of the user whose item is being modified.

	]]
	PlayFabId: string,
	--[[
		Unique instance identifier of the item to be modified.

	]]
	ItemInstanceId: string,
}

export type GetCatalogItemsRequest = {
	--[[
		Which catalog is being requested. If null, uses the default catalog.

	]]
	CatalogVersion: string?,
}

export type UpdateCharacterStatisticsResult = {
	-- No properties defined in spec
	[string]: any
}

--[[
	For Facebook Instant Games identifiers which have not been linked to PlayFab
	accounts, null will be returned.

]]
export type GetPlayFabIDsFromFacebookInstantGamesIdsResult = {
	--[[
		Mapping of Facebook Instant Games identifiers to PlayFab identifiers.

	]]
	Data: { FacebookInstantGamesPlayFabIdPair }?,
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

export type LinkNintendoServiceAccountSubjectRequest = {
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
	--[[
		The Nintendo Service Account subject or id to link to the PlayFab user.

	]]
	Subject: string,
	--[[
		If another user is already linked to a specific Nintendo Service Account,
		unlink the other user and re-link.

	]]
	ForceLink: boolean?,
}

export type GetSharedGroupDataResult = {
	Data: SharedGroupDataRecord?,
	--[[
		List of PlayFabId identifiers for the members of this group, if requested.

	]]
	Members: { string }?,
}

--[[
	This function performs an additive update of the arbitrary JSON object
	containing the custom data for the user. In updating the custom data object,
	keys which already exist in the object will have their values overwritten,
	while keys with null values will be removed. No other key-value pairs will
	be changed apart from those specified in the call.

]]
export type UpdateCharacterDataRequest = {
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
		Unique PlayFab assigned ID for a specific character owned by a user

	]]
	CharacterId: string,
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

export type MoveItemToUserFromCharacterResult = {
	-- No properties defined in spec
	[string]: any
}

export type StatisticNameVersion = {
	--[[
		unique name of the statistic

	]]
	StatisticName: string,
	--[[
		the version of the statistic to be returned

	]]
	Version: number,
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

export type RemoveGenericIDRequest = {
	GenericId: GenericServiceId,
	--[[
		PlayFabId of the user to remove.

	]]
	PlayFabId: string,
}

export type GetAllSegmentsResult = {
	--[[
		Array of segments for this title.

	]]
	Segments: { GetSegmentResult }?,
}

--[[
	Note that if the Random Result Table contains no entries, or does not exist
	for the catalog specified (the Primary catalog if one is not specified), an
	InvalidDropTable error will be returned.

]]
export type EvaluateRandomResultTableResult = {
	--[[
		Unique identifier for the item returned from the Random Result Table
		evaluation, for the given catalog.

	]]
	ResultItemId: string?,
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
	Time is always returned as Coordinated Universal Time (UTC).

]]
export type GetTimeResult = {
	--[[
		Current server time when the request was received, in UTC

	]]
	Time: string,
}

export type AddCharacterVirtualCurrencyRequest = {
	--[[
		PlayFab unique identifier of the user whose virtual currency balance is to be
		incremented.

	]]
	PlayFabId: string,
	--[[
		Amount to be added to the character balance of the specified virtual currency.
		Maximum VC balance is Int32 (2,147,483,647). Any increase over this value will
		be discarded.

	]]
	Amount: number,
	--[[
		Unique PlayFab assigned ID for a specific character owned by a user

	]]
	CharacterId: string,
	--[[
		Name of the virtual currency which is to be incremented.

	]]
	VirtualCurrency: string,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

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

--[[
	If this is the first time a user has signed in with the Xbox ID and
	CreateAccount is set to true, a new PlayFab account will be created and
	linked to the Xbox Live account. In this case, no email or username will be
	associated with the PlayFab account. Otherwise, if no PlayFab account is
	linked to the Xbox Live account, an error indicating this will be returned,
	so that the title can guide the user through creation of a PlayFab account.

]]
export type LoginWithXboxIdRequest = {
	--[[
		The id of Xbox Live sandbox.

	]]
	Sandbox: string,
	InfoRequestParameters: GetPlayerCombinedInfoRequestParams?,
	--[[
		Automatically create a PlayFab account if one is not currently linked to this
		ID.

	]]
	CreateAccount: boolean?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		Unique Xbox identifier for a user.

	]]
	XboxId: string,
}

export type GetCharacterStatisticsResult = {
	--[[
		Unique identifier of the character for the statistics.

	]]
	CharacterId: string?,
	--[[
		Character statistics for the requested user.

	]]
	CharacterStatistics: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		PlayFab unique identifier of the user whose character statistics are being
		returned.

	]]
	PlayFabId: string?,
}

export type GrantItemsToCharacterResult = {
	--[[
		Array of items granted to users.

	]]
	ItemGrantResults: { GrantedItemInstance }?,
}

export type UserAppleIdInfo = {
	--[[
		Apple subject ID

	]]
	AppleSubjectId: string?,
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

export type GetPlayFabIDsFromPSNAccountIDsRequest = {
	--[[
		Id of the PlayStation :tm: Network issuer environment. If null, defaults to
		production environment.

	]]
	IssuerId: number?,
	--[[
		Array of unique PlayStation :tm: Network identifiers for which the title needs
		to get PlayFab identifiers. The array cannot exceed 25 in length.

	]]
	PSNAccountIDs: { string },
}

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

export type GetPlayFabIDsFromPSNOnlineIDsRequest = {
	--[[
		Id of the PlayStation :tm: Network issuer environment. If null, defaults to
		production environment.

	]]
	IssuerId: number?,
	--[[
		Array of unique PlayStation :tm: Network identifiers for which the title needs
		to get PlayFab identifiers. The array cannot exceed 25 in length.

	]]
	PSNOnlineIDs: { string },
}

export type UserGameCenterInfo = {
	--[[
		Gamecenter identifier

	]]
	GameCenterId: string?,
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

export type LinkBattleNetAccountRequest = {
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
	--[[
		The JSON Web Token (JWT) returned by Battle.net after login

	]]
	IdentityToken: string,
	--[[
		If another user is already linked to a specific Battle.net account, unlink the
		other user and re-link.

	]]
	ForceLink: boolean?,
}

export type GetPlayerStatisticVersionsResult = {
	--[[
		version change history of the statistic

	]]
	StatisticVersions: { PlayerStatisticVersion }?,
}

--[[
	This API allows for access to details regarding a user in the PlayFab
	service, usually for purposes of customer support. Note that data returned
	may be Personally Identifying Information (PII), such as email address, and
	so care should be taken in how this data is stored and managed. Since this
	call will always return the relevant information for users who have accessed
	the title, the recommendation is to not store this data locally.

]]
export type GetUserAccountInfoRequest = {
	--[[
		Unique PlayFab assigned ID of the user on whom the operation will be
		performed.

	]]
	PlayFabId: string,
}

export type ListUsersCharactersResult = {
	--[[
		The requested list of characters.

	]]
	Characters: { CharacterResult }?,
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

export type SendPushNotificationRequest = {
	--[[
		Text of message to send.

	]]
	Message: string?,
	--[[
		Subject of message to send (may not be displayed in all platforms)

	]]
	Subject: string?,
	--[[
		Allows you to provide precisely formatted json to target devices. This is an
		advanced feature, allowing you to deliver to custom plugin logic, fields, or
		functionality not natively supported by PlayFab.

	]]
	AdvancedPlatformDelivery: { AdvancedPushPlatformMsg }?,
	Package: PushNotificationPackage?,
	--[[
		PlayFabId of the recipient of the push notification.

	]]
	Recipient: string,
	--[[
		Target Platforms that should receive the Message or Package. If omitted, we
		will send to all available platforms.

	]]
	TargetPlatforms: { PushNotificationPlatform }?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
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

export type GetPlayFabIDsFromSteamNamesRequest = {
	--[[
		Array of unique Steam identifiers for which the title needs to get PlayFab
		identifiers. The array cannot exceed 25 in length.

	]]
	SteamNames: { string },
}

export type AddGenericIDRequest = {
	GenericId: GenericServiceId,
	--[[
		PlayFabId of the user to link.

	]]
	PlayFabId: string,
}

export type LoginWithBattleNetRequest = {
	InfoRequestParameters: GetPlayerCombinedInfoRequestParams?,
	--[[
		Automatically create a PlayFab account if one is not currently linked to this
		ID.

	]]
	CreateAccount: boolean?,
	--[[
		The JSON Web Token (JWT) returned by Battle.net after login

	]]
	IdentityToken: string,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
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
	will fail with the 'AccountDeleted' error. This API must be enabled for use
	as an option in the game manager website. It is disabled by default.

]]
export type DeletePlayerRequest = {
	--[[
		Unique PlayFab assigned ID of the user on whom the operation will be
		performed.

	]]
	PlayFabId: string,
}

--[[
	For generic service identifiers which have not been linked to PlayFab
	accounts, null will be returned.

]]
export type GetPlayFabIDsFromGenericIDsResult = {
	--[[
		Mapping of generic service identifiers to PlayFab identifiers.

	]]
	Data: { GenericPlayFabIdPair }?,
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

export type GetTitleNewsRequest = {
	--[[
		Limits the results to the last n entries. Defaults to 10 if not set.

	]]
	Count: number?,
}

--[[
	Contains the localized push notification content.

]]
export type LocalizedPushNotificationProperties = {
	--[[
		Message of the localized push notification template.

	]]
	Message: string?,
	--[[
		Subject of the localized push notification template.

	]]
	Subject: string?,
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

--[[
	For Twitch identifiers which have not been linked to PlayFab accounts, null
	will be returned.

]]
export type GetPlayFabIDsFromTwitchIDsResult = {
	--[[
		Mapping of Twitch identifiers to PlayFab identifiers.

	]]
	Data: { TwitchPlayFabIdPair }?,
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

export type LinkPSNIdRequest = {
	--[[
		Unique PlayFab assigned ID of the user on whom the operation will be
		performed.

	]]
	PlayFabId: string,
	--[[
		Id of the PlayStation :tm: Network user. Also known as the PSN Account Id.

	]]
	PSNUserId: string,
	--[[
		Id of the PlayStation :tm: Network issuer environment. If null, defaults to
		production environment.

	]]
	IssuerId: number?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		If another user is already linked to the account, unlink the other user and
		re-link.

	]]
	ForceLink: boolean?,
}

export type GetPlayFabIDsFromFacebookIDsRequest = {
	--[[
		Array of unique Facebook identifiers for which the title needs to get PlayFab
		identifiers. The array cannot exceed 25 in length.

	]]
	FacebookIDs: { string },
}

export type SteamPlayFabIdPair = {
	--[[
		Unique Steam identifier for a user.

	]]
	SteamStringId: string?,
	--[[
		Unique PlayFab identifier for a user, or null if no PlayFab account is linked
		to the Steam identifier.

	]]
	PlayFabId: string?,
}

export type EvaluateRandomResultTableRequest = {
	--[[
		The unique identifier of the Random Result Table to use.

	]]
	TableId: string,
	--[[
		Specifies the catalog version that should be used to evaluate the Random
		Result Table. If unspecified, uses default/primary catalog.

	]]
	CatalogVersion: string?,
}

--[[
	This function performs an additive update of the arbitrary JSON object
	containing the custom data for the item instance which belongs to the
	specified user. In updating the custom data object, keys which already exist
	in the object will have their values overwritten, while keys with null
	values will be removed. No other key-value pairs will be changed apart from
	those specified in the call.

]]
export type UpdateUserInventoryItemDataRequest = {
	--[[
		Unique PlayFab assigned ID of the user on whom the operation will be
		performed.

	]]
	PlayFabId: string,
	--[[
		Unique PlayFab assigned instance identifier of the item

	]]
	ItemInstanceId: string,
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
	If any additional services are queried for the user's friends, those friends
	who also have a PlayFab account registered for the title will be returned in
	the results. For Facebook, user has to have logged into the title's Facebook
	app recently, and only friends who also plays this game will be included.
	For Xbox Live, user has to have logged into the Xbox Live recently, and only
	friends who also play this game will be included.

]]
export type GetFriendsListResult = {
	--[[
		Array of friends found.

	]]
	Friends: { FriendInfo }?,
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

--[[
	This function will delete the specified character from the list allowed by
	the user, and will also delete any inventory or VC currently held by that
	character. It will NOT delete any statistics associated for this character,
	in order to preserve leaderboard integrity.

]]
export type DeleteCharacterFromUserRequest = {
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
		If true, the character's inventory will be transferred up to the owning user;
		otherwise, this request will purge those items.

	]]
	SaveCharacterInventory: boolean,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
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

export type DeleteCharacterFromUserResult = {
	-- No properties defined in spec
	[string]: any
}

export type ConsumeItemRequest = {
	--[[
		Unique PlayFab assigned ID of the user on whom the operation will be
		performed.

	]]
	PlayFabId: string,
	--[[
		Number of uses to consume from the item.

	]]
	ConsumeCount: number,
	--[[
		Unique instance identifier of the item to be consumed.

	]]
	ItemInstanceId: string,
	--[[
		Unique PlayFab assigned ID for a specific character owned by a user

	]]
	CharacterId: string?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type FriendInfo = {
	XboxInfo: UserXboxInfo?,
	--[[
		Tags which have been associated with this friend.

	]]
	Tags: { string }?,
	PSNInfo: UserPsnInfo?,
	GameCenterInfo: UserGameCenterInfo?,
	Profile: PlayerProfileModel?,
	FacebookInfo: UserFacebookInfo?,
	--[[
		PlayFab unique identifier for this friend.

	]]
	FriendPlayFabId: string?,
	--[[
		Title-specific display name for this friend.

	]]
	TitleDisplayName: string?,
	--[[
		PlayFab unique username for this friend.

	]]
	Username: string?,
	SteamInfo: UserSteamInfo?,
}

export type StatisticUpdate = {
	--[[
		statistic value for the player

	]]
	Value: number,
	--[[
		unique name of the statistic

	]]
	StatisticName: string,
	--[[
		for updates to an existing statistic value for a player, the version of the
		statistic when it was loaded. Null when setting the statistic value for the
		first time.

	]]
	Version: number?,
}

export type DeleteSharedGroupRequest = {
	--[[
		Unique identifier for the shared group.

	]]
	SharedGroupId: string,
}

export type GetPlayFabIDsFromGenericIDsRequest = {
	--[[
		Array of unique generic service identifiers for which the title needs to get
		PlayFab identifiers. Currently limited to a maximum of 10 in a single request.

	]]
	GenericIDs: { GenericServiceId },
}

export type AuthenticateSessionTicketResult = {
	--[[
		Indicates if token was expired at request time.

	]]
	IsSessionTicketExpired: boolean?,
	UserInfo: UserAccountInfo?,
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

export type SendCustomAccountRecoveryEmailResult = {
	-- No properties defined in spec
	[string]: any
}

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

export type EmptyResult = {
	-- No properties defined in spec
	[string]: any
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

export type CreateSharedGroupResult = {
	--[[
		Unique identifier for the shared group.

	]]
	SharedGroupId: string?,
}

export type PushNotificationPackage = {
	--[[
		Content of the message (all platforms)

	]]
	Message: string,
	--[[
		Title/Subject of the message. Not supported for iOS

	]]
	Title: string,
	--[[
		Icon file to display with the message (Not supported for iOS)

	]]
	Icon: string?,
	--[[
		This must be a JSON formatted object. For use with developer-created custom
		Push Notification plugins

	]]
	CustomData: string?,
	--[[
		Sound file to play with the message (all platforms)

	]]
	Sound: string?,
	--[[
		Numerical badge to display on App icon (iOS only)

	]]
	Badge: number,
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

export type NintendoSwitchPlayFabIdPair = {
	--[[
		Unique Nintendo Switch Device identifier for a user.

	]]
	NintendoSwitchDeviceId: string?,
	--[[
		Unique PlayFab identifier for a user, or null if no PlayFab account is linked
		to the Nintendo Switch Device identifier.

	]]
	PlayFabId: string?,
}

export type LinkPSNAccountResult = {
	-- No properties defined in spec
	[string]: any
}

export type CharacterLeaderboardEntry = {
	--[[
		Title-specific display name of the character for this leaderboard entry.

	]]
	CharacterName: string?,
	--[[
		PlayFab unique identifier of the user for this leaderboard entry.

	]]
	PlayFabId: string?,
	--[[
		Name of the character class for this entry.

	]]
	CharacterType: string?,
	--[[
		Title-specific display name of the user for this leaderboard entry.

	]]
	DisplayName: string?,
	--[[
		PlayFab unique identifier of the character that belongs to the user for this
		leaderboard entry.

	]]
	CharacterId: string?,
	--[[
		User's overall position in the leaderboard.

	]]
	Position: number,
	--[[
		Specific value of the user's statistic.

	]]
	StatValue: number,
}

export type SendEmailFromTemplateResult = {
	-- No properties defined in spec
	[string]: any
}

export type AwardSteamAchievementRequest = {
	--[[
		Array of achievements to grant and the users to whom they are to be granted.

	]]
	Achievements: { AwardSteamAchievementItem },
}

--[[
	This API is designed to write a multitude of different event types into
	PlayStream. It supports a flexible JSON schema, which allowsfor arbitrary
	key-value pairs to describe any title-based event. The created event will be
	locked to the authenticated title.

]]
export type WriteTitleEventRequest = {
	--[[
		Custom event properties. Each property consists of a name (string) and a value
		(JSON object).

	]]
	Body: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		The time (in UTC) associated with this event. The value defaults to the
		current time.

	]]
	Timestamp: string?,
	--[[
		The name of the event, within the namespace scoped to the title. The naming
		convention is up to the caller, but it commonly follows the
		subject_verb_object pattern (e.g. player_logged_in).

	]]
	EventName: string,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type LinkSteamIdRequest = {
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		Unique Steam identifier for a user.

	]]
	SteamId: string,
	--[[
		Unique PlayFab identifier for a user, or null if no PlayFab account is linked
		to the Xbox Live identifier.

	]]
	PlayFabId: string,
	--[[
		If another user is already linked to the account, unlink the other user and
		re-link.

	]]
	ForceLink: boolean?,
}

--[[
	Please note that the order of the items in the response may not match the
	order of items in the request.

]]
export type GrantItemsToUserResult = {
	--[[
		Array of items granted to users.

	]]
	ItemGrantResults: { GrantedItemInstance }?,
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

export type BanUsersResult = {
	--[[
		Information on the bans that were applied

	]]
	BanData: { BanInfo }?,
}

--[[
	Character statistics are similar to user statistics in that they are numeric
	values which may only be updated by a server operation, in order to minimize
	the opportunity for unauthorized changes. In addition to being available for
	use by the title, the statistics are used for all leaderboard operations in
	PlayFab.

]]
export type GetCharacterStatisticsRequest = {
	--[[
		Unique PlayFab assigned ID for a specific character owned by a user

	]]
	CharacterId: string,
	--[[
		Unique PlayFab assigned ID of the user on whom the operation will be
		performed.

	]]
	PlayFabId: string,
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

export type GetUserAccountInfoResult = {
	UserInfo: UserAccountInfo?,
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
	For Battle.net account identifiers which have not been linked to PlayFab
	accounts, null will be returned.

]]
export type GetPlayFabIDsFromBattleNetAccountIdsResult = {
	--[[
		Mapping of Battle.net account identifiers to PlayFab identifiers.

	]]
	Data: { BattleNetAccountPlayFabIdPair }?,
}

export type RemoveFriendRequest = {
	--[[
		PlayFab identifier of the friend account which is to be removed.

	]]
	FriendPlayFabId: string,
	--[[
		Unique PlayFab assigned ID of the user on whom the operation will be
		performed.

	]]
	PlayFabId: string,
}

export type UserFacebookInstantGamesIdInfo = {
	--[[
		Facebook Instant Games ID

	]]
	FacebookInstantGamesId: string?,
}

--[[
	Note: When calling 'GetLeaderboardAround...' APIs, the position of the
	character defaults to 0 when the character does not have the corresponding
	statistic.

]]
export type GetLeaderboardAroundCharacterResult = {
	--[[
		Ordered list of leaderboard entries.

	]]
	Leaderboard: { CharacterLeaderboardEntry }?,
}

--[[
	Note that the Position of the user in the results is for the overall
	leaderboard.

]]
export type GetLeaderboardResult = {
	--[[
		Ordered listing of users and their positions in the requested leaderboard.

	]]
	Leaderboard: { PlayerLeaderboardEntry }?,
	--[[
		The time the next scheduled reset will occur. Null if the leaderboard does not
		reset on a schedule.

	]]
	NextReset: string?,
	--[[
		The version of the leaderboard returned.

	]]
	Version: number,
}

export type GetContentDownloadUrlRequest = {
	--[[
		Key of the content item to fetch, usually formatted as a path, e.g.
		images/a.png

	]]
	Key: string,
	--[[
		HTTP method to fetch item - GET or HEAD. Use HEAD when only fetching metadata.
		Default is GET.

	]]
	HttpMethod: string?,
	--[[
		True to download through CDN. CDN provides higher download bandwidth and lower
		latency. However, if you want the latest, non-cached version of the content
		during development, set this to false. Default is true.

	]]
	ThruCDN: boolean?,
}

export type CharacterResult = {
	--[[
		The name of this character.

	]]
	CharacterName: string?,
	--[[
		The id for this character on this player.

	]]
	CharacterId: string?,
	--[[
		The type-string that was given to this character on creation.

	]]
	CharacterType: string?,
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

export type RevokeInventoryResult = {
	-- No properties defined in spec
	[string]: any
}

--[[
	This API is designed to write a multitude of different event types into
	PlayStream. It supports a flexible JSON schema, which allowsfor arbitrary
	key-value pairs to describe any character-based event. The created event
	will be locked to the authenticated title.

]]
export type WriteServerCharacterEventRequest = {
	--[[
		Unique PlayFab assigned ID of the user on whom the operation will be
		performed.

	]]
	PlayFabId: string,
	--[[
		Custom event properties. Each property consists of a name (string) and a value
		(JSON object).

	]]
	Body: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		The name of the event, within the namespace scoped to the title. The naming
		convention is up to the caller, but it commonly follows the
		subject_verb_object pattern (e.g. player_logged_in).

	]]
	EventName: string,
	--[[
		The time (in UTC) associated with this event. The value defaults to the
		current time.

	]]
	Timestamp: string?,
	--[[
		Unique PlayFab assigned ID for a specific character owned by a user

	]]
	CharacterId: string,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
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

export type RemovePlayerTagResult = {
	-- No properties defined in spec
	[string]: any
}

--[[
	This operation is not additive. It will completely replace the tag list for
	the specified user. Please note that only users in the PlayFab friends list
	can be assigned tags. Attempting to set a tag on a friend only included in
	the friends list from a social site integration (such as Facebook or Steam)
	will return the AccountNotFound error.

]]
export type SetFriendTagsRequest = {
	--[[
		PlayFab identifier of the friend account to which the tag(s) should be
		applied.

	]]
	FriendPlayFabId: string,
	--[[
		PlayFab identifier of the player whose friend is to be updated.

	]]
	PlayFabId: string,
	--[[
		Array of tags to set on the friend account.

	]]
	Tags: { string },
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

export type LinkPSNIdResponse = {
	-- No properties defined in spec
	[string]: any
}

--[[
	For Facebook identifiers which have not been linked to PlayFab accounts,
	null will be returned.

]]
export type GetPlayFabIDsFromFacebookIDsResult = {
	--[[
		Mapping of Facebook identifiers to PlayFab identifiers.

	]]
	Data: { FacebookPlayFabIdPair }?,
}

export type GetFriendsListRequest = {
	--[[
		PlayFab identifier of the player whose friend list to get.

	]]
	PlayFabId: string,
	--[[
		Xbox token if Xbox friends should be included. Requires Xbox be configured on
		PlayFab.

	]]
	XboxToken: string?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	ExternalPlatformFriends: ExternalFriendSources?,
	ProfileConstraints: PlayerProfileViewConstraints?,
}

export type SetTitleDataResult = {
	-- No properties defined in spec
	[string]: any
}

--[[
	For XboxLive identifiers which have not been linked to PlayFab accounts,
	null will be returned.

]]
export type GetPlayFabIDsFromXboxLiveIDsResult = {
	--[[
		Mapping of Xbox Live identifiers to PlayFab identifiers.

	]]
	Data: { XboxLiveAccountPlayFabIdPair }?,
}

export type GetPlayFabIDsFromSteamIDsRequest = {
	--[[
		Array of unique Steam identifiers (Steam profile IDs) for which the title
		needs to get PlayFab identifiers. The array cannot exceed 25 in length.

	]]
	SteamStringIDs: { string }?,
}

--[[
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

]]
export type GetStoreItemsServerRequest = {
	--[[
		Catalog version to store items from. Use default catalog version if null

	]]
	CatalogVersion: string?,
	--[[
		Optional identifier for the player to use in requesting the store information
		- if used, segment overrides will be applied

	]]
	PlayFabId: string?,
	--[[
		Unqiue identifier for the store which is being requested

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

export type UserFamilyType = 
	| "None"
	| "Xbox"
	| "Steam"

--[[
	This query retrieves the current time from one of the servers in PlayFab.
	Please note that due to clock drift between servers, there is a potential
	variance of up to 5 seconds.

]]
export type GetTimeRequest = {
	-- No properties defined in spec
	[string]: any
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

--[[
	Note that in the case of multiple calls to write to the same shared group
	data keys, the last write received by the PlayFab service will determine the
	value available to subsequent read operations. For scenarios requiring
	coordination of data updates, it is recommended that titles make use of user
	data with read permission set to public, or a combination of user data and
	shared group data.

]]
export type UpdateSharedGroupDataRequest = {
	--[[
		Indicates whether a given data key is private (readable only by the player) or
		public (readable by all players). When a player makes a GetUserData request
		about another player, only keys marked Public will be returned.

	]]
	Permission: UserDataPermission?,
	--[[
		Unique identifier for the shared group.

	]]
	SharedGroupId: string,
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

--[[
	If this is the first time a user has signed in with the Steam ID and
	CreateAccount is set to true, a new PlayFab account will be created and
	linked to the Steam account. In this case, no email or username will be
	associated with the PlayFab account. Otherwise, if no PlayFab account is
	linked to the Steam account, an error indicating this will be returned, so
	that the title can guide the user through creation of a PlayFab account.
	Steam users that are not logged into the Steam Client app will only have
	their Steam username synced, other data, such as currency and country will
	not be available until they login while the Client is open.

]]
export type LoginWithSteamIdRequest = {
	InfoRequestParameters: GetPlayerCombinedInfoRequestParams?,
	--[[
		Automatically create a PlayFab account if one is not currently linked to this
		ID.

	]]
	CreateAccount: boolean?,
	--[[
		Unique Steam identifier for a user.

	]]
	SteamId: string,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
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

export type UpdateCharacterDataResult = {
	--[[
		Indicates the current version of the data that has been set. This is
		incremented with every set call for that type of data (read-only, internal,
		etc). This version can be provided in Get calls to find updated data.

	]]
	DataVersion: number,
}

export type UnlinkBattleNetAccountRequest = {
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

export type SetPublisherDataResult = {
	-- No properties defined in spec
	[string]: any
}

export type EmptyResponse = {
	-- No properties defined in spec
	[string]: any
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

--[[
	All items currently in the user inventory will be returned, irrespective of
	how they were acquired (via purchasing, grants, coupons, etc.). Items that
	are expired, fully consumed, or are no longer valid are not considered to be
	in the user's current inventory, and so will not be not included.

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

export type GetLeaderboardRequest = {
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		Maximum number of entries to retrieve.

	]]
	MaxResultsCount: number,
	--[[
		First entry in the leaderboard to be retrieved.

	]]
	StartPosition: number,
	--[[
		The version of the leaderboard to get.

	]]
	Version: number?,
	--[[
		Unique identifier for the title-specific statistic for the leaderboard.

	]]
	StatisticName: string,
	--[[
		If set to false, Version is considered null. If true, uses the specified
		Version

	]]
	UseSpecificVersion: boolean?,
	ProfileConstraints: PlayerProfileViewConstraints?,
}

export type FacebookPlayFabIdPair = {
	--[[
		Unique Facebook identifier for a user.

	]]
	FacebookId: string?,
	--[[
		Unique PlayFab identifier for a user, or null if no PlayFab account is linked
		to the Facebook identifier.

	]]
	PlayFabId: string?,
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

export type ModifyCharacterVirtualCurrencyResult = {
	--[[
		Balance of the virtual currency after modification.

	]]
	Balance: number,
	--[[
		Name of the virtual currency which was modified.

	]]
	VirtualCurrency: string?,
}

--[[
	Grants a character to the user of the type and name specified in the
	request.

]]
export type GrantCharacterToUserRequest = {
	--[[
		Non-unique display name of the character being granted (1-40 characters in
		length).

	]]
	CharacterName: string,
	--[[
		Unique PlayFab assigned ID of the user on whom the operation will be
		performed.

	]]
	PlayFabId: string,
	--[[
		Type of the character being granted; statistics can be sliced based on this
		value.

	]]
	CharacterType: string,
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
	Represents the save push notification template request.

]]
export type SavePushNotificationTemplateRequest = {
	--[[
		Name of the push notification template.

	]]
	Name: string,
	--[[
		Android JSON for the notification template.

	]]
	AndroidPayload: string?,
	--[[
		IOS JSON for the notification template.

	]]
	IOSPayload: string?,
	--[[
		Contains the localized push notification content.

	]]
	LocalizedPushNotificationTemplates: LocalizedPushNotificationProperties?,
	--[[
		Id of the push notification template.

	]]
	Id: string?,
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

export type DeletePushNotificationTemplateResult = {
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

--[[
	This function directly adds inventory items to the user's inventories. As a
	result of this operations, the user will not be charged any transaction fee,
	regardless of the inventory item catalog definition. Please note that the
	processing time for inventory grants and purchases increases fractionally
	the more items are in the inventory, and the more items are in the
	grant/purchase operation.

]]
export type GrantItemsToUserRequest = {
	--[[
		Unique PlayFab assigned ID of the user on whom the operation will be
		performed.

	]]
	PlayFabId: string,
	--[[
		String detailing any additional information concerning this operation.

	]]
	Annotation: string?,
	--[[
		Array of itemIds to grant to the user.

	]]
	ItemIds: { string },
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

export type GetLeaderboardAroundCharacterRequest = {
	--[[
		Unique PlayFab assigned ID of the user on whom the operation will be
		performed.

	]]
	PlayFabId: string,
	--[[
		Unique PlayFab assigned ID for a specific character owned by a user

	]]
	CharacterId: string,
	--[[
		Unique identifier for the title-specific statistic for the leaderboard.

	]]
	StatisticName: string,
	--[[
		Maximum number of entries to retrieve.

	]]
	MaxResultsCount: number,
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

export type LinkNintendoServiceAccountRequest = {
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
	--[[
		The JSON Web token (JWT) returned by Nintendo after login. Used to validate
		the request and find the user ID (Nintendo Switch subject) to link with.

	]]
	IdentityToken: string,
	--[[
		If another user is already linked to a specific Nintendo Switch account,
		unlink the other user and re-link.

	]]
	ForceLink: boolean?,
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

export type LinkNintendoSwitchDeviceIdRequest = {
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
	--[[
		Nintendo Switch unique identifier for the user's device.

	]]
	NintendoSwitchDeviceId: string,
	--[[
		If another user is already linked to the Nintendo Switch Device ID, unlink the
		other user and re-link.

	]]
	ForceLink: boolean?,
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

export type LinkNintendoSwitchDeviceIdResult = {
	-- No properties defined in spec
	[string]: any
}

export type UpdatePlayerStatisticsResult = {
	-- No properties defined in spec
	[string]: any
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

export type LinkPSNAccountRequest = {
	--[[
		Unique PlayFab assigned ID of the user on whom the operation will be
		performed.

	]]
	PlayFabId: string,
	--[[
		Authentication code provided by the PlayStation :tm: Network.

	]]
	AuthCode: string,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		Id of the PlayStation :tm: Network issuer environment. If null, defaults to
		production environment.

	]]
	IssuerId: number?,
	--[[
		Redirect URI supplied to PlayStation :tm: Network when requesting an auth code

	]]
	RedirectUri: string,
	--[[
		If another user is already linked to the account, unlink the other user and
		re-link.

	]]
	ForceLink: boolean?,
}

export type GetCharacterDataResult = {
	--[[
		Indicates the current version of the data that has been set. This is
		incremented with every set call for that type of data (read-only, internal,
		etc). This version can be provided in Get calls to find updated data.

	]]
	DataVersion: number,
	--[[
		Unique PlayFab assigned ID of the user on whom the operation will be
		performed.

	]]
	PlayFabId: string?,
	Data: UserDataRecord?,
	--[[
		Unique PlayFab assigned ID for a specific character owned by a user

	]]
	CharacterId: string?,
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
	For PlayStation :tm: Network identifiers which have not been linked to
	PlayFab accounts, null will be returned.

]]
export type GetPlayFabIDsFromPSNAccountIDsResult = {
	--[[
		Mapping of PlayStation :tm: Network identifiers to PlayFab identifiers.

	]]
	Data: { PSNAccountPlayFabIdPair }?,
}

export type LinkServerCustomIdResult = {
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

export type AwardSteamAchievementResult = {
	--[[
		Array of achievements granted.

	]]
	AchievementResults: { AwardSteamAchievementItem }?,
}

export type ServerCustomIDPlayFabIDPair = {
	--[[
		Unique PlayFab identifier.

	]]
	PlayFabId: string?,
	--[[
		Unique server custom identifier for this player.

	]]
	ServerCustomId: string?,
}

--[[
	The items and vc found within the container. These will be added and stacked
	in your inventory as appropriate.

]]
export type UnlockContainerItemResult = {
	--[[
		Unique instance identifier of the container unlocked.

	]]
	UnlockedItemInstanceId: string?,
	--[[
		Unique instance identifier of the key used to unlock the container, if
		applicable.

	]]
	UnlockedWithItemInstanceId: string?,
	--[[
		Items granted to the player as a result of unlocking the container.

	]]
	GrantedItems: { ItemInstance }?,
	--[[
		Virtual currency granted to the player as a result of unlocking the container.

	]]
	VirtualCurrency: {
		-- No properties defined in spec
		[string]: any
	}?,
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

--[[
	Represents the request for sending a push notification template to a
	recipient.

]]
export type SendPushNotificationFromTemplateRequest = {
	--[[
		PlayFabId of the push notification recipient.

	]]
	Recipient: string,
	--[[
		Id of the push notification template.

	]]
	PushNotificationTemplateId: string,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type TwitchPlayFabIdPair = {
	--[[
		Unique Twitch identifier for a user.

	]]
	TwitchId: string?,
	--[[
		Unique PlayFab identifier for a user, or null if no PlayFab account is linked
		to the Twitch identifier.

	]]
	PlayFabId: string?,
}

export type TitleActivationStatus = 
	| "None"
	| "ActivatedTitleKey"
	| "PendingSteam"
	| "ActivatedSteam"
	| "RevokedSteam"

export type AddSharedGroupMembersResult = {
	-- No properties defined in spec
	[string]: any
}

export type UnlinkSteamIdResult = {
	-- No properties defined in spec
	[string]: any
}

export type LinkXboxAccountRequest = {
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		Unique PlayFab identifier for a user, or null if no PlayFab account is linked
		to the Xbox Live identifier.

	]]
	PlayFabId: string,
	--[[
		If another user is already linked to the account, unlink the other user and
		re-link.

	]]
	ForceLink: boolean?,
	--[[
		Token provided by the Xbox Live SDK/XDK method
		GetTokenAndSignatureAsync("POST", "https://playfabapi.com/", "").

	]]
	XboxToken: string,
}

--[[
	This API is designed to return publisher-specific values which can be read,
	but not written to, by the client. This data is shared across all titles
	assigned to a particular publisher, and can be used for cross-game
	coordination. Only titles assigned to a publisher can use this API. For more
	information email helloplayfab@microsoft.com. Note that there may up to a
	minute delay in between updating title data and this API call returning the
	newest value.

]]
export type GetPublisherDataRequest = {
	--[[
		array of keys to get back data from the Publisher data blob, set by the admin
		tools

	]]
	Keys: { string },
}

export type GetRandomResultTablesRequest = {
	--[[
		Specifies the catalog version that should be used to retrieve the Random
		Result Tables. If unspecified, uses default/primary catalog.

	]]
	CatalogVersion: string?,
	--[[
		The unique identifier of the Random Result Table to use.

	]]
	TableIDs: { string },
}

--[[
	Specify the type of container to open and optionally the catalogVersion for
	the container to open

]]
export type UnlockContainerItemRequest = {
	--[[
		Unique PlayFab assigned ID of the user on whom the operation will be
		performed.

	]]
	PlayFabId: string,
	--[[
		Specifies the catalog version that should be used to determine container
		contents. If unspecified, uses default/primary catalog.

	]]
	CatalogVersion: string?,
	--[[
		Unique PlayFab assigned ID for a specific character owned by a user

	]]
	CharacterId: string?,
	--[[
		Catalog ItemId of the container type to unlock.

	]]
	ContainerItemId: string,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type ModifyItemUsesResult = {
	--[[
		Unique instance identifier of the item with uses consumed.

	]]
	ItemInstanceId: string?,
	--[[
		Number of uses remaining on the item.

	]]
	RemainingUses: number,
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

export type SendPushNotificationResult = {
	-- No properties defined in spec
	[string]: any
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

--[[
	Returns a list of every character that currently belongs to a user.

]]
export type ListUsersCharactersRequest = {
	--[[
		Unique PlayFab assigned ID of the user on whom the operation will be
		performed.

	]]
	PlayFabId: string,
}

export type GetTitleNewsResult = {
	--[[
		Array of localized news items.

	]]
	News: { TitleNewsItem }?,
}

--[[
	It is highly recommended that developers ensure that it is extremely
	unlikely that a customer could generate an ID which is already in use by
	another customer. If this is the first time a user has signed in with the
	Custom ID and CreateAccount is set to true, a new PlayFab account will be
	created and linked to the Custom ID. In this case, no email or username will
	be associated with the PlayFab account. Otherwise, if no PlayFab account is
	linked to the Custom ID, an error indicating this will be returned, so that
	the title can guide the user through creation of a PlayFab account.

]]
export type LoginWithCustomIDRequest = {
	InfoRequestParameters: GetPlayerCombinedInfoRequestParams?,
	--[[
		Automatically create a PlayFab account if one is not currently linked to this
		ID.

	]]
	CreateAccount: boolean?,
	--[[
		Custom unique identifier for the user, generated by the title.

	]]
	CustomId: string,
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

export type GetSharedGroupDataRequest = {
	--[[
		Specific keys to retrieve from the shared group (if not specified, all keys
		will be returned, while an empty array indicates that no keys should be
		returned).

	]]
	Keys: { string }?,
	--[[
		If true, return the list of all members of the shared group.

	]]
	GetMembers: boolean?,
	--[[
		Unique identifier for the shared group.

	]]
	SharedGroupId: string,
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

export type DeletePlayerResult = {
	-- No properties defined in spec
	[string]: any
}

export type SourceType = 
	| "Admin"
	| "BackEnd"
	| "GameClient"
	| "GameServer"
	| "Partner"
	| "Custom"
	| "API"

--[[
	Data is stored as JSON key-value pairs. If the Keys parameter is provided,
	the data object returned will only contain the data specific to the
	indicated Keys. Otherwise, the full set of custom user data will be
	returned.

]]
export type GetCharacterDataRequest = {
	--[[
		Specific keys to search for in the custom user data.

	]]
	Keys: { string }?,
	--[[
		Unique PlayFab assigned ID for a specific character owned by a user

	]]
	CharacterId: string,
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

export type AddPlayerTagResult = {
	-- No properties defined in spec
	[string]: any
}

export type GetPlayerCombinedInfoResultPayload = {
	--[[
		List of characters for the user.

	]]
	CharacterList: { CharacterResult }?,
	--[[
		The version of the Read-Only UserData that was returned.

	]]
	UserReadOnlyDataVersion: number,
	AccountInfo: UserAccountInfo?,
	--[[
		Inventories for each character for the user.

	]]
	CharacterInventories: { CharacterInventory }?,
	UserReadOnlyData: UserDataRecord?,
	PlayerProfile: PlayerProfileModel?,
	--[[
		Dictionary of virtual currency balance(s) belonging to the user.

	]]
	UserVirtualCurrency: {
		-- No properties defined in spec
		[string]: any
	}?,
	UserData: UserDataRecord?,
	--[[
		Title data for this title.

	]]
	TitleData: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		List of statistics for this player.

	]]
	PlayerStatistics: { StatisticValue }?,
	--[[
		Array of inventory items in the user's current inventory.

	]]
	UserInventory: { ItemInstance }?,
	UserVirtualCurrencyRechargeTimes: VirtualCurrencyRechargeTime?,
	--[[
		The version of the UserData that was returned.

	]]
	UserDataVersion: number,
}

export type UnlinkServerCustomIdRequest = {
	--[[
		Unique PlayFab identifier.

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
		Unique server custom identifier for this player.

	]]
	ServerCustomId: string,
}

--[[
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

]]
export type LoginWithIOSDeviceIDRequest = {
	--[[
		Specific Operating System version for the user's device.

	]]
	OS: string?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		Specific model of the user's device.

	]]
	DeviceModel: string?,
	--[[
		Automatically create a PlayFab account if one is not currently linked to this
		ID.

	]]
	CreateAccount: boolean?,
	InfoRequestParameters: GetPlayerCombinedInfoRequestParams?,
	--[[
		Vendor-specific iOS identifier for the user's device.

	]]
	DeviceId: string,
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

export type Variable = {
	--[[
		Name of the variable.

	]]
	Name: string,
	--[[
		Value of the variable.

	]]
	Value: string?,
}

--[[
	If this is the first time a user has signed in with the PlayStation :tm:
	Network account and CreateAccount is set to true, a new PlayFab account will
	be created and linked to the PlayStation :tm: Network account. In this case,
	no email or username will be associated with the PlayFab account. Otherwise,
	if no PlayFab account is linked to the PlayStation :tm: Network account, an
	error indicating this will be returned, so that the title can guide the user
	through creation of a PlayFab account.

]]
export type LoginWithPSNRequest = {
	--[[
		Id of the PlayStation :tm: Network issuer environment. If null, defaults to
		production environment.

	]]
	IssuerId: number?,
	--[[
		Auth code provided by the PlayStation :tm: Network OAuth provider.

	]]
	AuthCode: string,
	InfoRequestParameters: GetPlayerCombinedInfoRequestParams?,
	--[[
		Automatically create a PlayFab account if one is not currently linked to this
		ID.

	]]
	CreateAccount: boolean?,
	--[[
		Redirect URI supplied to PlayStation :tm: Network when requesting an auth code

	]]
	RedirectUri: string,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type GetPlayerCombinedInfoRequestParams = {
	--[[
		Whether to get the player's virtual currency balances. Defaults to false

	]]
	GetUserVirtualCurrency: boolean,
	--[[
		Whether to get player statistics. Defaults to false.

	]]
	GetPlayerStatistics: boolean,
	--[[
		Whether to get title data. Defaults to false.

	]]
	GetTitleData: boolean,
	--[[
		Whether to get the player's custom data. Defaults to false

	]]
	GetUserData: boolean,
	--[[
		Specific keys to search for in the custom data. Leave null to get all keys.
		Has no effect if GetTitleData is false

	]]
	TitleDataKeys: { string }?,
	--[[
		Whether to get the player's inventory. Defaults to false

	]]
	GetUserInventory: boolean,
	--[[
		Specific statistics to retrieve. Leave null to get all keys. Has no effect if
		GetPlayerStatistics is false

	]]
	PlayerStatisticNames: { string }?,
	--[[
		Whether to get the list of characters. Defaults to false.

	]]
	GetCharacterList: boolean,
	--[[
		Whether to get player profile. Defaults to false. Has no effect for a new
		player.

	]]
	GetPlayerProfile: boolean,
	--[[
		Whether to get the player's read only data. Defaults to false

	]]
	GetUserReadOnlyData: boolean,
	--[[
		Specific keys to search for in the custom data. Leave null to get all keys.
		Has no effect if GetUserReadOnlyData is false

	]]
	UserReadOnlyDataKeys: { string }?,
	--[[
		Whether to get the player's account Info. Defaults to false

	]]
	GetUserAccountInfo: boolean,
	--[[
		Whether to get character inventories. Defaults to false.

	]]
	GetCharacterInventories: boolean,
	--[[
		Specific keys to search for in the custom data. Leave null to get all keys.
		Has no effect if GetUserData is false

	]]
	UserDataKeys: { string }?,
	ProfileConstraints: PlayerProfileViewConstraints?,
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

export type LoginWithServerCustomIdRequest = {
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	InfoRequestParameters: GetPlayerCombinedInfoRequestParams?,
	--[[
		Player secret that is used to verify API request signatures (Enterprise Only).

	]]
	PlayerSecret: string?,
	--[[
		Automatically create a PlayFab account if one is not currently linked to this
		ID.

	]]
	CreateAccount: boolean?,
	--[[
		The backend server identifier for this player.

	]]
	ServerCustomId: string,
}

--[[
	If this is the first time a user has signed in with the Xbox Live account
	and CreateAccount is set to true, a new PlayFab account will be created and
	linked to the Xbox Live account. In this case, no email or username will be
	associated with the PlayFab account. Otherwise, if no PlayFab account is
	linked to the Xbox Live account, an error indicating this will be returned,
	so that the title can guide the user through creation of a PlayFab account.

]]
export type LoginWithXboxRequest = {
	InfoRequestParameters: GetPlayerCombinedInfoRequestParams?,
	--[[
		Automatically create a PlayFab account if one is not currently linked to this
		ID.

	]]
	CreateAccount: boolean?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		Token provided by the Xbox Live SDK/XDK method
		GetTokenAndSignatureAsync("POST", "https://playfabapi.com/", "").

	]]
	XboxToken: string,
}

export type GetContentDownloadUrlResult = {
	--[[
		URL for downloading content via HTTP GET or HEAD method. The URL will expire
		in approximately one hour.

	]]
	URL: string?,
}

--[[
	Note that data returned may be Personally Identifying Information (PII),
	such as email address, and so care should be taken in how this data is
	stored and managed. Since this call will always return the relevant
	information for users who have accessed the title, the recommendation is to
	not store this data locally.

]]
export type AuthenticateSessionTicketRequest = {
	--[[
		Session ticket as issued by a PlayFab client login API.

	]]
	SessionTicket: string,
}

export type LinkXboxAccountResult = {
	-- No properties defined in spec
	[string]: any
}

export type SubtractCharacterVirtualCurrencyRequest = {
	--[[
		Unique PlayFab assigned ID of the user on whom the operation will be
		performed.

	]]
	PlayFabId: string,
	--[[
		Amount to be subtracted from the user balance of the specified virtual
		currency.

	]]
	Amount: number,
	--[[
		Unique PlayFab assigned ID for a specific character owned by a user

	]]
	CharacterId: string,
	--[[
		Name of the virtual currency which is to be decremented.

	]]
	VirtualCurrency: string,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
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

--[[
	Transfers an item from a user to a character she owns. This will remove the
	item from the user's inventory (until and unless it is moved back), and will
	enable the character to make use of the item instead.

]]
export type MoveItemToCharacterFromUserRequest = {
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
		Unique PlayFab assigned instance identifier of the item

	]]
	ItemInstanceId: string,
}

export type GetPlayerCombinedInfoResult = {
	InfoResultPayload: GetPlayerCombinedInfoResultPayload?,
	--[[
		Unique PlayFab assigned ID of the user on whom the operation will be
		performed.

	]]
	PlayFabId: string?,
}

export type UserSettings = {
	--[[
		Boolean for whether this player should report OnFocus play-time tracking.

	]]
	GatherFocusInfo: boolean,
	--[[
		Boolean for whether this player is eligible for gathering device info.

	]]
	GatherDeviceInfo: boolean,
	--[[
		Boolean for whether this player is eligible for ad tracking.

	]]
	NeedsAttribution: boolean,
}

export type MoveItemToCharacterFromUserResult = {
	-- No properties defined in spec
	[string]: any
}

--[[
	In addition to being available for use by the title, the statistics are used
	for all leaderboard operations in PlayFab.

]]
export type GetPlayerStatisticsResult = {
	--[[
		PlayFab unique identifier of the user whose statistics are being returned

	]]
	PlayFabId: string?,
	--[[
		User statistics for the requested user.

	]]
	Statistics: { StatisticValue }?,
}

--[[
	Note that the Position of the character in the results is for the overall
	leaderboard.

]]
export type GetCharacterLeaderboardResult = {
	--[[
		Ordered list of leaderboard entries.

	]]
	Leaderboard: { CharacterLeaderboardEntry }?,
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

export type ServerLoginResult = {
	--[[
		Player's unique PlayFabId.

	]]
	PlayFabId: string?,
	SettingsForUser: UserSettings?,
	--[[
		True if the master_player_account was newly created on this login.

	]]
	NewlyCreated: boolean,
	InfoResultPayload: GetPlayerCombinedInfoResultPayload?,
	TreatmentAssignment: TreatmentAssignment?,
	--[[
		Unique token authorizing the user and game at the server level, for the
		current session.

	]]
	SessionTicket: string?,
	--[[
		The time of this user's previous login. If there was no previous login, then
		it's DateTime.MinValue

	]]
	LastLoginTime: string?,
	EntityToken: EntityTokenResponse?,
}

export type PSNAccountPlayFabIdPair = {
	--[[
		Unique PlayFab identifier for a user, or null if no PlayFab account is linked
		to the PlayStation :tm: Network identifier.

	]]
	PlayFabId: string?,
	--[[
		Unique PlayStation :tm: Network identifier for a user.

	]]
	PSNAccountId: string?,
}

--[[
	For Steam identifiers which have not been linked to PlayFab accounts, null
	will be returned.

]]
export type GetPlayFabIDsFromSteamNamesResult = {
	--[[
		Mapping of Steam identifiers to PlayFab identifiers.

	]]
	Data: { SteamNamePlayFabIdPair }?,
}

--[[
	Coupon codes can be created for any item, or set of items, in the catalog
	for the title. This operation causes the coupon to be consumed, and the
	specific items to be awarded to the user. Attempting to re-use an already
	consumed code, or a code which has not yet been created in the service, will
	result in an error.

]]
export type RedeemCouponRequest = {
	--[[
		Unique PlayFab assigned ID of the user on whom the operation will be
		performed.

	]]
	PlayFabId: string,
	--[[
		Catalog version of the coupon.

	]]
	CatalogVersion: string?,
	--[[
		Optional identifier for the Character that should receive the item. If null,
		item is added to the player

	]]
	CharacterId: string?,
	--[[
		Generated coupon code to redeem.

	]]
	CouponCode: string,
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
	Players are currently limited to five reports per day. Attempts by a single
	user account to submit reports beyond five will result in Updated being
	returned as false.

]]
export type ReportPlayerServerResult = {
	--[[
		The number of remaining reports which may be filed today by this reporting
		player.

	]]
	SubmissionsRemaining: number,
}

export type ReportPlayerServerRequest = {
	--[[
		Unique PlayFab identifier of the reported player.

	]]
	ReporteeId: string,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		Optional additional comment by reporting player.

	]]
	Comment: string?,
	--[[
		PlayFabId of the reporting player.

	]]
	ReporterId: string,
}

export type RevokeBansResult = {
	--[[
		Information on the bans that were revoked

	]]
	BanData: { BanInfo }?,
}

--[[
	Note that if a specified Random Result Table contains no entries, or does
	not exist in the catalog, an InvalidDropTable error will be returned.

]]
export type GetRandomResultTablesResult = {
	Tables: RandomResultTableListing?,
}

export type TitleNewsItem = {
	--[[
		Unique identifier of news item.

	]]
	NewsId: string?,
	--[[
		Date and time when the news item was posted.

	]]
	Timestamp: string,
	--[[
		Title of the news item.

	]]
	Title: string?,
	--[[
		News item body.

	]]
	Body: string?,
}

--[[
	PlayFab accounts which have valid email address or username will be able to
	receive a password reset email using this API.The email sent must be an
	account recovery email template. The username or email can be passed in to
	send the email

]]
export type SendCustomAccountRecoveryEmailRequest = {
	--[[
		The user's username requesting an account recovery.

	]]
	Username: string?,
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
	EmailTemplateId: string,
	--[[
		User email address attached to their account

	]]
	Email: string?,
}

export type GetPlayFabIDsFromBattleNetAccountIdsRequest = {
	--[[
		Array of unique Battle.net account identifiers for which the title needs to
		get PlayFab identifiers. The array cannot exceed 10 in length.

	]]
	BattleNetAccountIds: { string },
}

export type EntityTokenResponse = {
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey?,
	--[[
		The time the token will expire, if it is an expiring token, in UTC.

	]]
	TokenExpiration: string?,
	--[[
		The token used to set X-EntityToken for all entity based API calls.

	]]
	EntityToken: string?,
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

--[[
	For PlayStation :tm: Network identifiers which have not been linked to
	PlayFab accounts, null will be returned.

]]
export type GetPlayFabIDsFromPSNOnlineIDsResult = {
	--[[
		Mapping of PlayStation :tm: Network identifiers to PlayFab identifiers.

	]]
	Data: { PSNOnlinePlayFabIdPair }?,
}

export type UserServerCustomIdInfo = {
	--[[
		Custom ID

	]]
	CustomId: string?,
}

--[[
	NOTE: The position of the character in the results is relative to the other
	characters for that specific user. This mean the values will always be
	between 0 and one less than the number of characters returned regardless of
	the size of the actual leaderboard.

]]
export type GetLeaderboardForUsersCharactersResult = {
	--[[
		Ordered list of leaderboard entries.

	]]
	Leaderboard: { CharacterLeaderboardEntry }?,
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

export type GetCharacterLeaderboardRequest = {
	--[[
		Unique identifier for the title-specific statistic for the leaderboard.

	]]
	StatisticName: string,
	--[[
		Maximum number of entries to retrieve.

	]]
	MaxResultsCount: number,
	--[[
		First entry in the leaderboard to be retrieved.

	]]
	StartPosition: number,
}

export type UnlinkNintendoServiceAccountRequest = {
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

export type UnlinkNintendoSwitchDeviceIdRequest = {
	--[[
		Nintendo Switch Device identifier for the user. If not specified, the most
		recently signed in device ID will be used.

	]]
	NintendoSwitchDeviceId: string?,
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

export type GrantCharacterToUserResult = {
	--[[
		Unique identifier tagged to this character.

	]]
	CharacterId: string?,
}

export type UnlinkNintendoSwitchDeviceIdResult = {
	-- No properties defined in spec
	[string]: any
}

export type UnlinkPSNAccountRequest = {
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

export type UnlinkPSNAccountResult = {
	-- No properties defined in spec
	[string]: any
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

export type UpdateAvatarUrlRequest = {
	--[[
		URL of the avatar image. If empty, it removes the existing avatar URL.

	]]
	ImageUrl: string,
	--[[
		Unique PlayFab assigned ID of the user on whom the operation will be
		performed.

	]]
	PlayFabId: string,
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

export type UnlinkServerCustomIdResult = {
	-- No properties defined in spec
	[string]: any
}

export type UnlinkSteamIdRequest = {
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		Unique PlayFab identifier for a user, or null if no PlayFab account is linked
		to the Steam account.

	]]
	PlayFabId: string,
}

--[[
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

]]
export type LoginWithAndroidDeviceIDRequest = {
	--[[
		Specific model of the user's device.

	]]
	AndroidDevice: string?,
	--[[
		Specific Operating System version for the user's device.

	]]
	OS: string?,
	InfoRequestParameters: GetPlayerCombinedInfoRequestParams?,
	--[[
		Automatically create a PlayFab account if one is not currently linked to this
		ID.

	]]
	CreateAccount: boolean?,
	--[[
		Android device identifier for the user's device.

	]]
	AndroidDeviceId: string,
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
	This function directly adds inventory items to the character's inventories.
	As a result of this operations, the user will not be charged any transaction
	fee, regardless of the inventory item catalog definition. Please note that
	the processing time for inventory grants and purchases increases
	fractionally the more items are in the inventory, and the more items are in
	the grant/purchase operation.

]]
export type GrantItemsToCharacterRequest = {
	--[[
		Unique PlayFab assigned ID of the user on whom the operation will be
		performed.

	]]
	PlayFabId: string,
	--[[
		Catalog version from which items are to be granted.

	]]
	CatalogVersion: string?,
	--[[
		String detailing any additional information concerning this operation.

	]]
	Annotation: string?,
	--[[
		Array of itemIds to grant to the user.

	]]
	ItemIds: { string }?,
	--[[
		Unique PlayFab assigned ID for a specific character owned by a user

	]]
	CharacterId: string,
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
	Specify the container and optionally the catalogVersion for the container to
	open

]]
export type UnlockContainerInstanceRequest = {
	--[[
		Unique PlayFab assigned ID of the user on whom the operation will be
		performed.

	]]
	PlayFabId: string,
	--[[
		Specifies the catalog version that should be used to determine container
		contents. If unspecified, uses catalog associated with the item instance.

	]]
	CatalogVersion: string?,
	--[[
		ItemInstanceId of the container to unlock.

	]]
	ContainerItemInstanceId: string,
	--[[
		Unique PlayFab assigned ID for a specific character owned by a user

	]]
	CharacterId: string?,
	--[[
		ItemInstanceId of the key that will be consumed by unlocking this container.
		If the container requires a key, this parameter is required.

	]]
	KeyItemInstanceId: string?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type ConsumeItemResult = {
	--[[
		Unique instance identifier of the item with uses consumed.

	]]
	ItemInstanceId: string?,
	--[[
		Number of uses remaining on the item.

	]]
	RemainingUses: number,
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

export type TreatmentAssignment = {
	--[[
		List of the experiment variables.

	]]
	Variables: { Variable }?,
	--[[
		List of the experiment variants.

	]]
	Variants: { string }?,
}

export type CharacterInventory = {
	--[[
		The inventory of this character.

	]]
	Inventory: { ItemInstance }?,
	--[[
		The id of this character.

	]]
	CharacterId: string?,
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

export type AddFriendRequest = {
	--[[
		PlayFab identifier of the player to add a new friend.

	]]
	PlayFabId: string,
	--[[
		The PlayFab identifier of the user being added.

	]]
	FriendPlayFabId: string?,
	--[[
		Title-specific display name of the user to being added.

	]]
	FriendTitleDisplayName: string?,
	--[[
		Email address of the user being added.

	]]
	FriendEmail: string?,
	--[[
		The PlayFab username of the user being added

	]]
	FriendUsername: string?,
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

export type ExternalFriendSources = 
	| "None"
	| "Steam"
	| "Facebook"
	| "Xbox"
	| "Psn"
	| "All"

export type MoveItemToCharacterFromCharacterResult = {
	-- No properties defined in spec
	[string]: any
}

--[[
	Note: When calling 'GetLeaderboardAround...' APIs, the position of the user
	defaults to 0 when the user does not have the corresponding statistic.

]]
export type GetLeaderboardAroundUserResult = {
	--[[
		Ordered listing of users and their positions in the requested leaderboard.

	]]
	Leaderboard: { PlayerLeaderboardEntry }?,
	--[[
		The time the next scheduled reset will occur. Null if the leaderboard does not
		reset on a schedule.

	]]
	NextReset: string?,
	--[[
		The version of the leaderboard returned.

	]]
	Version: number,
}

export type GetServerCustomIDsFromPlayFabIDsRequest = {
	--[[
		Array of unique PlayFab player identifiers for which the title needs to get
		server custom identifiers. Cannot contain more than 25 identifiers.

	]]
	PlayFabIDs: { string },
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

--[[
	Represents the request to delete a push notification template.

]]
export type DeletePushNotificationTemplateRequest = {
	--[[
		Id of the push notification template to be deleted.

	]]
	PushNotificationTemplateId: string,
}

--[[
	Transfers an item from a character to another character that is owned by the
	same user. This will remove the item from the character's inventory (until
	and unless it is moved back), and will enable the other character to make
	use of the item instead.

]]
export type MoveItemToCharacterFromCharacterRequest = {
	--[[
		Unique identifier of the character that currently has the item.

	]]
	GivingCharacterId: string,
	--[[
		Unique PlayFab assigned ID of the user on whom the operation will be
		performed.

	]]
	PlayFabId: string,
	--[[
		Unique identifier of the character that will be receiving the item.

	]]
	ReceivingCharacterId: string,
	--[[
		Unique PlayFab assigned instance identifier of the item

	]]
	ItemInstanceId: string,
}

--[[
	All items currently in the character inventory will be returned,
	irrespective of how they were acquired (via purchasing, grants, coupons,
	etc.). Items that are expired, fully consumed, or are no longer valid are
	not considered to be in the user's current inventory, and so will not be not
	included. Also returns their virtual currency balances.

]]
export type GetCharacterInventoryRequest = {
	--[[
		Used to limit results to only those from a specific catalog version.

	]]
	CatalogVersion: string?,
	--[[
		Unique PlayFab assigned ID of the user on whom the operation will be
		performed.

	]]
	PlayFabId: string,
	--[[
		Unique PlayFab assigned ID for a specific character owned by a user

	]]
	CharacterId: string,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type StatisticValue = {
	--[[
		statistic value for the player

	]]
	Value: number,
	--[[
		unique name of the statistic

	]]
	StatisticName: string?,
	--[[
		for updates to an existing statistic value for a player, the version of the
		statistic when it was loaded

	]]
	Version: number,
}

export type GetPlayerCombinedInfoRequest = {
	InfoRequestParameters: GetPlayerCombinedInfoRequestParams,
	--[[
		PlayFabId of the user whose data will be returned

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

export type GetPlayerProfileResult = {
	PlayerProfile: PlayerProfileModel?,
}

--[[
	For Steam identifiers which have not been linked to PlayFab accounts, null
	will be returned.

]]
export type GetPlayFabIDsFromSteamIDsResult = {
	--[[
		Mapping of Steam identifiers to PlayFab identifiers.

	]]
	Data: { SteamPlayFabIdPair }?,
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

export type EmailVerificationStatus = 
	| "Unverified"
	| "Pending"
	| "Confirmed"

--[[
	This operation is additive. Statistics not currently defined will be added,
	while those already defined will be updated with the given values. All other
	user statistics will remain unchanged.

]]
export type UpdatePlayerStatisticsRequest = {
	--[[
		Unique PlayFab assigned ID of the user on whom the operation will be
		performed.

	]]
	PlayFabId: string,
	--[[
		Statistics to be updated with the provided values

	]]
	Statistics: { StatisticUpdate },
	--[[
		Indicates whether the statistics provided should be set, regardless of the
		aggregation method set on the statistic. Default is false.

	]]
	ForceUpdate: boolean?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type GenericServiceId = {
	--[[
		Name of the service for which the player has a unique identifier.

	]]
	ServiceName: string,
	--[[
		Unique identifier of the player in that service.

	]]
	UserId: string,
}

export type GetPlayerStatisticsRequest = {
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		user for whom statistics are being requested

	]]
	PlayFabId: string,
	--[[
		statistics to return

	]]
	StatisticNames: { string }?,
	--[[
		statistics to return, if StatisticNames is not set (only statistics which have
		a version matching that provided will be returned)

	]]
	StatisticNameVersions: { StatisticNameVersion }?,
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

export type FacebookInstantGamesPlayFabIdPair = {
	--[[
		Unique Facebook Instant Games identifier for a user.

	]]
	FacebookInstantGamesId: string?,
	--[[
		Unique PlayFab identifier for a user, or null if no PlayFab account is linked
		to the Facebook Instant Games identifier.

	]]
	PlayFabId: string?,
}

export type GetPlayFabIDsFromNintendoSwitchDeviceIdsRequest = {
	--[[
		Array of unique Nintendo Switch Device identifiers for which the title needs
		to get PlayFab identifiers. The array cannot exceed 25 in length.

	]]
	NintendoSwitchDeviceIds: { string },
}

export type UnlinkXboxAccountRequest = {
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		Unique PlayFab identifier for a user, or null if no PlayFab account is linked
		to the Xbox Live identifier.

	]]
	PlayFabId: string,
}

export type SetPlayerSecretResult = {
	-- No properties defined in spec
	[string]: any
}

export type PushNotificationPlatform = 
	| "ApplePushNotificationService"
	| "GoogleCloudMessaging"

export type UpdateBansResult = {
	--[[
		Information on the bans that were updated

	]]
	BanData: { BanInfo }?,
}

export type AddSharedGroupMembersRequest = {
	--[[
		An array of unique PlayFab assigned ID of the user on whom the operation will
		be performed.

	]]
	PlayFabIds: { string },
	--[[
		Unique identifier for the shared group.

	]]
	SharedGroupId: string,
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

export type RevokeInventoryItemsResult = {
	--[[
		Collection of any errors that occurred during processing.

	]]
	Errors: { RevokeItemError }?,
}

export type SteamNamePlayFabIdPair = {
	--[[
		Unique PlayFab identifier for a user, or null if no PlayFab account is linked
		to the Steam identifier.

	]]
	PlayFabId: string?,
	--[[
		Unique Steam identifier for a user, also known as Steam persona name.

	]]
	SteamName: string?,
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

--[[
	This API is designed to write a multitude of different event types into
	PlayStream. It supports a flexible JSON schema, which allowsfor arbitrary
	key-value pairs to describe any player-based event. The created event will
	be locked to the authenticated title.

]]
export type WriteServerPlayerEventRequest = {
	--[[
		Unique PlayFab assigned ID of the user on whom the operation will be
		performed.

	]]
	PlayFabId: string,
	--[[
		Custom data properties associated with the event. Each property consists of a
		name (string) and a value (JSON object).

	]]
	Body: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		The name of the event, within the namespace scoped to the title. The naming
		convention is up to the caller, but it commonly follows the
		subject_verb_object pattern (e.g. player_logged_in).

	]]
	EventName: string,
	--[[
		The time (in UTC) associated with this event. The value defaults to the
		current time.

	]]
	Timestamp: string?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type ExecuteCloudScriptServerRequest = {
	RevisionSelection: CloudScriptRevisionOption?,
	--[[
		The unique user identifier for the player on whose behalf the script is being
		run

	]]
	PlayFabId: string,
	--[[
		The name of the CloudScript function to execute

	]]
	FunctionName: string,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		Object that is passed in to the function as the first argument

	]]
	FunctionParameter: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		Generate a 'player_executed_cloudscript' PlayStream event containing the
		results of the function execution and other contextual information. This event
		will show up in the PlayStream debugger console for the player in Game
		Manager.

	]]
	GeneratePlayStreamEvent: boolean?,
	--[[
		The specivic revision to execute, when RevisionSelection is set to 'Specific'

	]]
	SpecificRevision: number?,
}

export type RevokeAllBansForUserResult = {
	--[[
		Information on the bans that were revoked.

	]]
	BanData: { BanInfo }?,
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

export type UpdateSharedGroupDataResult = {
	-- No properties defined in spec
	[string]: any
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

export type GetFriendLeaderboardRequest = {
	--[[
		The player whose friend leaderboard to get

	]]
	PlayFabId: string,
	--[[
		Maximum number of entries to retrieve.

	]]
	MaxResultsCount: number,
	--[[
		Position in the leaderboard to start this listing (defaults to the first
		entry).

	]]
	StartPosition: number,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		Statistic used to rank friends for this leaderboard.

	]]
	StatisticName: string,
	--[[
		Xbox token if Xbox friends should be included. Requires Xbox be configured on
		PlayFab.

	]]
	XboxToken: string?,
	--[[
		The version of the leaderboard to get.

	]]
	Version: number?,
	--[[
		If set to false, Version is considered null. If true, uses the specified
		Version

	]]
	UseSpecificVersion: boolean?,
	ExternalPlatformFriends: ExternalFriendSources?,
	ProfileConstraints: PlayerProfileViewConstraints?,
}

export type GenericPlayFabIdPair = {
	GenericId: GenericServiceId?,
	--[[
		Unique PlayFab identifier for a user, or null if no PlayFab account is linked
		to the given generic identifier.

	]]
	PlayFabId: string?,
}



return nil
