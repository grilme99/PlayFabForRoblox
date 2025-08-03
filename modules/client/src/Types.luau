--[[
	This file was generated on 2025-08-03 at 00:04 UTC. Do not edit directly.

]]

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

--[[
	This is the second step in the purchasing process, initiating the purchase
	transaction with the payment provider (if applicable). For payment provider
	scenarios, the title should next present the user with the payment
	provider'sinterface for payment. Once the player has completed the payment
	with the provider, the title should call ConfirmPurchase tofinalize the
	process and add the appropriate items to the player inventory.

]]
export type PayForPurchaseRequest = {
	--[[
		Payment provider transaction identifier. Required for Facebook Payments.

	]]
	ProviderTransactionId: string?,
	--[[
		Currency to use to fund the purchase.

	]]
	Currency: string,
	--[[
		Purchase order identifier returned from StartPurchase.

	]]
	OrderId: string,
	--[[
		Payment provider to use to fund the purchase.

	]]
	ProviderName: string,
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
		PlayFab identifier of the user to attempt to add to the local user's friend
		list.

	]]
	FriendPlayFabId: string?,
	--[[
		PlayFab username of the user to attempt to add to the local user's friend
		list.

	]]
	FriendUsername: string?,
	--[[
		Email address of the user to attempt to add to the local user's friend list.

	]]
	FriendEmail: string?,
	--[[
		Title-specific display name of the user to attempt to add to the local user's
		friend list.

	]]
	FriendTitleDisplayName: string?,
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
		The list of properties requested to be deleted.

	]]
	DeletedProperties: { DeletedPropertyDetails }?,
	--[[
		Indicates the current version of a player's properties that have been set.
		This is incremented after updates and deletes. This version can be provided in
		update and delete calls for concurrency control.

	]]
	PropertiesVersion: number,
}

--[[
	Deletes custom properties for the specified player. The list of provided
	property names must be non-empty.

]]
export type DeletePlayerCustomPropertiesRequest = {
	--[[
		A list of property names denoting which properties should be deleted.

	]]
	PropertyNames: { string },
	--[[
		Optional field used for concurrency control. One can ensure that the delete
		operation will only be performed if the player's properties have not been
		updated by any other clients since the last version.

	]]
	ExpectedPropertiesVersion: number?,
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

export type GetLeaderboardAroundPlayerRequest = {
	--[[
		PlayFab unique identifier of the user to center the leaderboard around. If
		null will center on the logged in user.

	]]
	PlayFabId: string?,
	--[[
		Maximum number of entries to retrieve. Default 10, maximum 100.

	]]
	MaxResultsCount: number?,
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
		Statistic used to rank players for this leaderboard.

	]]
	StatisticName: string,
	ProfileConstraints: PlayerProfileViewConstraints?,
}

export type GetPlayFabIDsFromNintendoServiceAccountIdsRequest = {
	--[[
		Array of unique Nintendo Switch Account identifiers for which the title needs
		to get PlayFab identifiers. The array cannot exceed 25 in length.

	]]
	NintendoAccountIds: { string },
}

export type StartPurchaseResult = {
	--[[
		Available methods by which the user can pay.

	]]
	PaymentOptions: { PaymentOption }?,
	--[[
		Purchase order identifier.

	]]
	OrderId: string?,
	--[[
		Cart items to be purchased.

	]]
	Contents: { CartItem }?,
	--[[
		Current virtual currency totals for the user.

	]]
	VirtualCurrencyBalances: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type GetPlayFabIDsFromTwitchIDsRequest = {
	--[[
		Array of unique Twitch identifiers (Twitch's _id) for which the title needs to
		get PlayFab identifiers. The array cannot exceed 25 in length.

	]]
	TwitchIds: { string },
}

--[[
	Google sign-in is accomplished by obtaining a Google OAuth 2.0 credential
	using the Google sign-in for Android APIs on the device and passing it to
	this API. If this is the first time a user has signed in with the Google
	account and CreateAccount is set to true, a new PlayFab account will be
	created and linked to the Google account. Otherwise, if no PlayFab account
	is linked to the Google account, an error indicating this will be returned,
	so that the title can guide the user through creation of a PlayFab account.
	The current (recommended) method for obtaining a Google account credential
	in an Android application is to call GoogleSignInAccount.getServerAuthCode()
	and send the auth code as the ServerAuthCode parameter of this API. Before
	doing this, you must create an OAuth 2.0 web application client ID in the
	Google API Console and configure its client ID and secret in the PlayFab
	Game Manager Google Add-on for your title. This method does not require
	prompting of the user for additional Google account permissions, resulting
	in a user experience with the least possible friction. For more information
	about obtaining the server auth code, see
	https://developers.google.com/identity/sign-in/android/offline-access. The
	previous (deprecated) method was to obtain an OAuth access token by calling
	GetAccessToken() on the client and passing it as the AccessToken parameter
	to this API. for the with the Google OAuth 2.0 Access Token. More
	information on this change can be found in the Google developer
	documentation
	(https://android-developers.googleblog.com/2016/01/play-games-permissions-are-changing-in.html).

]]
export type LoginWithGoogleAccountRequest = {
	--[[
		Optional boolean to opt out of setting the MPA email when creating a Google
		account, defaults to true.

	]]
	SetEmail: boolean?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		Automatically create a PlayFab account if one is not currently linked to this
		ID.

	]]
	CreateAccount: boolean?,
	--[[
		Unique identifier for the title, found in the Settings > Game Properties
		section of the PlayFab developer site when a title has been selected.

	]]
	TitleId: string,
	InfoRequestParameters: GetPlayerCombinedInfoRequestParams?,
	--[[
		Player secret that is used to verify API request signatures (Enterprise Only).

	]]
	PlayerSecret: string?,
	--[[
		Base64 encoded body that is encrypted with the Title's public RSA key
		(Enterprise Only).

	]]
	EncryptedRequest: string?,
	--[[
		OAuth 2.0 server authentication code obtained on the client by calling the
		getServerAuthCode()
		(https://developers.google.com/identity/sign-in/android/offline-access) Google
		client API.

	]]
	ServerAuthCode: string?,
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

export type AddOrUpdateContactEmailResult = {
	-- No properties defined in spec
	[string]: any
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

export type GooglePlayFabIdPair = {
	--[[
		Unique Google identifier for a user.

	]]
	GoogleId: string?,
	--[[
		Unique PlayFab identifier for a user, or null if no PlayFab account is linked
		to the Google identifier.

	]]
	PlayFabId: string?,
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

--[[
	Details for each item granted

]]
export type AdRewardItemGranted = {
	--[[
		Catalog ID

	]]
	CatalogId: string?,
	--[[
		Catalog item display name

	]]
	DisplayName: string?,
	--[[
		Inventory instance ID

	]]
	InstanceId: string?,
	--[[
		Item ID

	]]
	ItemId: string?,
}

export type PaymentOption = {
	--[[
		Amount of the specified currency needed for the purchase.

	]]
	Price: number,
	--[[
		Specific currency to use to fund the purchase.

	]]
	Currency: string?,
	--[[
		Name of the purchase provider for this option.

	]]
	ProviderName: string?,
	--[[
		Amount of existing credit the user has with the provider.

	]]
	StoreCredit: number,
}

export type SharedGroupDataRecord = {
	--[[
		Unique PlayFab identifier of the user to last update this value.

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

export type UserAndroidDeviceInfo = {
	--[[
		Android device ID

	]]
	AndroidDeviceId: string?,
}

--[[
	Specify the container and optionally the catalogVersion for the container to
	open

]]
export type UnlockContainerInstanceRequest = {
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
	In addition to the PlayFab username, titles can make use of a DisplayName
	which is also a unique identifier, but specific to the title. This allows
	for unique names which more closely match the theme or genre of a title, for
	example.

]]
export type UpdateUserTitleDisplayNameRequest = {
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		New title display name for the user - must be between 3 and 25 characters.

	]]
	DisplayName: string,
}

--[[
	Once verified, the catalog item matching the Product name will be added to
	the user's inventory. This result should be used for immediate updates to
	the local client game state as opposed to the GetUserInventory API which can
	have an up to half second delay.

]]
export type ValidateWindowsReceiptResult = {
	--[[
		Fulfilled inventory items and recorded purchases in fulfillment of the
		validated receipt transactions.

	]]
	Fulfillments: { PurchaseReceiptFulfillment }?,
}

export type LinkKongregateAccountResult = {
	-- No properties defined in spec
	[string]: any
}

export type UserIosDeviceInfo = {
	--[[
		iOS device ID

	]]
	IosDeviceId: string?,
}

--[[
	Data is stored as JSON key-value pairs. Every time the data is updated via
	any source, the version counter is incremented. If the Version parameter is
	provided, then this call will only return data if the current version on the
	system is greater than the value provided. If the Keys parameter is
	provided, the data object returned will only contain the data specific to
	the indicated Keys. Otherwise, the full set of custom user data will be
	returned.

]]
export type GetUserDataRequest = {
	--[[
		List of unique keys to load from.

	]]
	Keys: { string }?,
	--[[
		The version that currently exists according to the caller. The call will
		return the data for all of the keys if the version in the system is greater
		than this.

	]]
	IfChangedFromDataVersion: number?,
	--[[
		Unique PlayFab identifier of the user to load data for. Optional, defaults to
		yourself if not set. When specified to a PlayFab id of another player, then
		this will only return public keys for that account.

	]]
	PlayFabId: string?,
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
	Specify the type of container to open and optionally the catalogVersion for
	the container to open

]]
export type UnlockContainerItemRequest = {
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

export type CartItem = {
	--[[
		Display name for the catalog item.

	]]
	DisplayName: string?,
	--[[
		Cost of the catalog item for each applicable virtual currency.

	]]
	VirtualCurrencyPrices: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		Description of the catalog item.

	]]
	Description: string?,
	--[[
		Cost of the catalog item for each applicable real world currency.

	]]
	RealCurrencyPrices: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		Amount of each applicable virtual currency which will be received as a result
		of purchasing this catalog item.

	]]
	VCAmount: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		Class name to which catalog item belongs.

	]]
	ItemClass: string?,
	--[[
		Unique instance identifier for this catalog item.

	]]
	ItemInstanceId: string?,
	--[[
		Unique identifier for the catalog item.

	]]
	ItemId: string?,
}

export type GetPlayFabIDsFromFacebookInstantGamesIdsRequest = {
	--[[
		Array of unique Facebook Instant Games identifiers for which the title needs
		to get PlayFab identifiers. The array cannot exceed 25 in length.

	]]
	FacebookInstantGamesIds: { string },
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

export type GooglePlayGamesPlayFabIdPair = {
	--[[
		Unique Google Play Games identifier for a user.

	]]
	GooglePlayGamesPlayerId: string?,
	--[[
		Unique PlayFab identifier for a user, or null if no PlayFab account is linked
		to the Google Play Games identifier.

	]]
	PlayFabId: string?,
}

export type PushNotificationRegistrationModel = {
	--[[
		Notification configured endpoint

	]]
	NotificationEndpointARN: string?,
	Platform: PushNotificationPlatform?,
}

--[[
	Please note that the processing time for inventory grants and purchases
	increases fractionally the more items are in the inventory, and the more
	items are in the grant/purchase operation (with each item in a bundle being
	a distinct add).

]]
export type PurchaseItemRequest = {
	--[[
		Catalog version for the items to be purchased (defaults to most recent
		version.

	]]
	CatalogVersion: string?,
	--[[
		Store to buy this item through. If not set, prices default to those in the
		catalog.

	]]
	StoreId: string?,
	--[[
		Virtual currency to use to purchase the item.

	]]
	VirtualCurrency: string,
	--[[
		Price the client expects to pay for the item (in case a new catalog or store
		was uploaded, with new prices).

	]]
	Price: number,
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
	--[[
		Unique identifier of the item to purchase.

	]]
	ItemId: string,
}

--[[
	This API is designed to return title specific values which can be read, but
	not written to, by the client. For example, a developer could choose to
	store values which modify the user experience, such as enemy spawn rates,
	weapon strengths, movement speeds, etc. This allows a developer to update
	the title without the need to create, test, and ship a new build. If the
	player belongs to an experiment variant that uses title data overrides, the
	overrides are applied automatically and returned with the title data. Note
	that there may up to a minute delay in between updating title data and this
	API call returning the newest value.

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

export type AddFriendResult = {
	--[[
		True if the friend request was processed successfully.

	]]
	Created: boolean,
}

export type UnlinkCustomIDResult = {
	-- No properties defined in spec
	[string]: any
}

export type ConsumePS5EntitlementsRequest = {
	--[[
		Catalog version to use

	]]
	CatalogVersion: string?,
	MarketplaceSpecificData: PlayStation5Payload,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type GetLeaderboardForUsersCharactersRequest = {
	--[[
		Unique identifier for the title-specific statistic for the leaderboard.

	]]
	StatisticName: string,
}

export type UnlinkTwitchAccountRequest = {
	--[[
		Valid token issued by Twitch. Used to specify which twitch account to unlink
		from the profile. By default it uses the one that is present on the profile.

	]]
	AccessToken: string?,
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
	Each account must have a unique email address in the PlayFab service. Once
	created, the account may be associated with additional accounts (Steam,
	Facebook, Game Center, etc.), allowing for added social network lists and
	achievements systems.

]]
export type RegisterPlayFabUserResult = {
	--[[
		PlayFab unique user name.

	]]
	Username: string?,
	SettingsForUser: UserSettings?,
	--[[
		Unique token identifying the user and game at the server level, for the
		current session.

	]]
	SessionTicket: string?,
	--[[
		PlayFab unique identifier for this newly created account.

	]]
	PlayFabId: string?,
	EntityToken: EntityTokenResponse?,
}

--[[
	For Kongregate identifiers which have not been linked to PlayFab accounts,
	null will be returned.

]]
export type GetPlayFabIDsFromKongregateIDsResult = {
	--[[
		Mapping of Kongregate identifiers to PlayFab identifiers.

	]]
	Data: { KongregatePlayFabIdPair }?,
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
	Enable this option with the 'Allow Client to Post Player Statistics' option
	in PlayFab GameManager for your title. However, this is not best practice,
	as this data will no longer be safely controlled by the server. This
	operation is additive. Character Statistics not currently defined will be
	added, while those already defined will be updated with the given values.
	All other user statistics will remain unchanged. Character statistics are
	used by the character-leaderboard apis, and accessible for custom
	game-logic.

]]
export type UpdateCharacterStatisticsRequest = {
	--[[
		Unique PlayFab assigned ID for a specific character owned by a user

	]]
	CharacterId: string,
	--[[
		Statistics to be updated with the provided values, in the Key(string),
		Value(int) pattern.

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

export type LinkOpenIdConnectRequest = {
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		A name that identifies which configured OpenID Connect provider relationship
		to use. Maximum 100 characters.

	]]
	ConnectionId: string,
	--[[
		The JSON Web token (JWT) returned by the identity provider after login.
		Represented as the id_token field in the identity provider's response. Used to
		validate the request and find the user ID (OpenID Connect subject) to link
		with.

	]]
	IdToken: string,
	--[[
		If another user is already linked to a specific OpenId Connect user, unlink
		the other user and re-link.

	]]
	ForceLink: boolean?,
}

--[[
	Any arbitrary information collected by the device

]]
export type DeviceInfoRequest = {
	--[[
		Information posted to the PlayStream Event. Currently arbitrary, and specific
		to the environment sending it.

	]]
	Info: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type ExecuteCloudScriptRequest = {
	RevisionSelection: CloudScriptRevisionOption?,
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

export type GetPlayFabIDsFromGameCenterIDsRequest = {
	--[[
		Array of unique Game Center identifiers (the Player Identifier) for which the
		title needs to get PlayFab identifiers. The array cannot exceed 25 in length.

	]]
	GameCenterIDs: { string },
}

export type GetCatalogItemsRequest = {
	--[[
		Which catalog is being requested. If null, uses the default catalog.

	]]
	CatalogVersion: string?,
}

--[[
	Once verified, the valid items will be restored into the user's inventory.
	This result should be used for immediate updates to the local client game
	state as opposed to the GetUserInventory API which can have an up to half
	second delay.

]]
export type RestoreIOSPurchasesResult = {
	--[[
		Fulfilled inventory items and recorded purchases in fulfillment of the
		validated receipt transactions.

	]]
	Fulfillments: { PurchaseReceiptFulfillment }?,
}

--[[
	For Facebook Instant Game identifiers which have not been linked to PlayFab
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

--[[
	Once verified, the catalog item matching the Amazon item name will be added
	to the user's inventory. This result should be used for immediate updates to
	the local client game state as opposed to the GetUserInventory API which can
	have an up to half second delay.

]]
export type ValidateAmazonReceiptResult = {
	--[[
		Fulfilled inventory items and recorded purchases in fulfillment of the
		validated receipt transactions.

	]]
	Fulfillments: { PurchaseReceiptFulfillment }?,
}

export type RemoveFriendResult = {
	-- No properties defined in spec
	[string]: any
}

export type AcceptTradeResponse = {
	Trade: TradeInfo?,
}

export type GetSharedGroupDataResult = {
	Data: SharedGroupDataRecord?,
	--[[
		List of PlayFabId identifiers for the members of this group, if requested.

	]]
	Members: { string }?,
}

export type UnlinkAndroidDeviceIDRequest = {
	--[[
		Android device identifier for the user's device. If not specified, the most
		recently signed in Android Device ID will be used.

	]]
	AndroidDeviceId: string?,
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
	This function performs an additive update of the arbitrary strings
	containing the custom data for the character. In updating the custom data
	object, keys which already exist in the object will have their values
	overwritten, while keys with null values will be removed. New keys will be
	added, with the given values. No other key-value pairs will be changed apart
	from those specified in the call.

]]
export type UpdateCharacterDataRequest = {
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

export type PushNotificationPlatform = 
	| "ApplePushNotificationService"
	| "GoogleCloudMessaging"

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

export type LinkAndroidDeviceIDResult = {
	-- No properties defined in spec
	[string]: any
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

export type GetTitlePublicKeyResult = {
	--[[
		Base64 encoded RSA CSP byte array blob containing the title's public RSA key

	]]
	RSAPublicKey: string?,
}

--[[
	When the FailedByPaymentProvider error is returned, it's important to check
	the ProviderErrorCode, ProviderErrorMessage, and ProviderErrorDetails to
	understand the specific reason the payment was rejected, as in some rare
	cases, this may mean that the provider hasn't completed some operation
	required to finalize the purchase.

]]
export type ConfirmPurchaseResult = {
	--[[
		Array of items purchased.

	]]
	Items: { ItemInstance }?,
	--[[
		Purchase order identifier.

	]]
	OrderId: string?,
	--[[
		Date and time of the purchase.

	]]
	PurchaseDate: string,
}

export type LinkAppleRequest = {
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		The JSON Web token (JWT) returned by Apple after login. Represented as the
		identityToken field in the authorization credential payload. Used to validate
		the request and find the user ID (Apple subject) to link with.

	]]
	IdentityToken: string,
	--[[
		If another user is already linked to a specific Apple account, unlink the
		other user and re-link.

	]]
	ForceLink: boolean?,
}

--[[
	Steam sign-in is accomplished with the Steam Session Ticket. More
	information on the Ticket can be found in the Steamworks SDK, here:
	https://partner.steamgames.com/documentation/auth. NOTE: For Steam
	authentication to work, the title must be configured with the Steam
	Application ID and Web API Key in the PlayFab Game Manager (under Steam in
	the Add-ons Marketplace). You can obtain a Web API Key from the Permissions
	page of any Group associated with your App ID in the Steamworks site. If
	this is the first time a user has signed in with the Steam account and
	CreateAccount is set to true, a new PlayFab account will be created and
	linked to the provided account's Steam ID. In this case, no email or
	username will be associated with the PlayFab account. Otherwise, if no
	PlayFab account is linked to the Steam account, an error indicating this
	will be returned, so that the title can guide the user through creation of a
	PlayFab account.

]]
export type LoginWithSteamRequest = {
	--[[
		True if ticket was generated using ISteamUser::GetAuthTicketForWebAPI() using
		"AzurePlayFab" as the identity string. False if the ticket was generated with
		ISteamUser::GetAuthSessionTicket().

	]]
	TicketIsServiceSpecific: boolean?,
	--[[
		Authentication token for the user, returned as a byte array from Steam, and
		converted to a string (for example, the byte 0x08 should become "08").

	]]
	SteamTicket: string?,
	--[[
		Automatically create a PlayFab account if one is not currently linked to this
		ID.

	]]
	CreateAccount: boolean?,
	--[[
		Unique identifier for the title, found in the Settings > Game Properties
		section of the PlayFab developer site when a title has been selected.

	]]
	TitleId: string,
	InfoRequestParameters: GetPlayerCombinedInfoRequestParams?,
	--[[
		Player secret that is used to verify API request signatures (Enterprise Only).

	]]
	PlayerSecret: string?,
	--[[
		Base64 encoded body that is encrypted with the Title's public RSA key
		(Enterprise Only).

	]]
	EncryptedRequest: string?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type UnlinkAndroidDeviceIDResult = {
	-- No properties defined in spec
	[string]: any
}

--[[
	Returns a list of every character that currently belongs to a user.

]]
export type ListUsersCharactersRequest = {
	--[[
		Unique PlayFab assigned ID of the user on whom the operation will be
		performed.

	]]
	PlayFabId: string?,
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

--[[
	Time is always returned as Coordinated Universal Time (UTC).

]]
export type GetTimeResult = {
	--[[
		Current server time when the request was received, in UTC

	]]
	Time: string,
}

export type ReportPlayerClientRequest = {
	--[[
		Unique PlayFab identifier of the reported player.

	]]
	ReporteeId: string,
	--[[
		Optional additional comment by reporting player.

	]]
	Comment: string?,
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
		Player secret that is used to verify API request signatures (Enterprise Only).

	]]
	PlayerSecret: string?,
	--[[
		Base64 encoded body that is encrypted with the Title's public RSA key
		(Enterprise Only).

	]]
	EncryptedRequest: string?,
	--[[
		Unique identifier for the title, found in the Settings > Game Properties
		section of the PlayFab developer site when a title has been selected.

	]]
	TitleId: string,
	InfoRequestParameters: GetPlayerCombinedInfoRequestParams?,
	--[[
		Id of the PlayStation :tm: Network issuer environment. If null, defaults to
		production environment.

	]]
	IssuerId: number?,
	--[[
		Redirect URI supplied to PlayStation :tm: Network when requesting an auth code

	]]
	RedirectUri: string?,
	--[[
		Auth code provided by the PlayStation :tm: Network OAuth provider.

	]]
	AuthCode: string?,
}

export type LoginResult = {
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
	In addition to being available for use by the title, the statistics are used
	for all leaderboard operations in PlayFab.

]]
export type GetCharacterStatisticsResult = {
	--[[
		The requested character statistics.

	]]
	CharacterStatistics: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type ValidateAmazonReceiptRequest = {
	--[[
		Amount of the stated currency paid, in centesimal units.

	]]
	PurchasePrice: number,
	--[[
		ReceiptId returned by the Amazon App Store in-app purchase API

	]]
	ReceiptId: string,
	--[[
		Currency used to pay for the purchase (ISO 4217 currency code).

	]]
	CurrencyCode: string?,
	--[[
		Catalog version of the fulfilled items. If null, defaults to the primary
		catalog.

	]]
	CatalogVersion: string?,
	--[[
		AmazonId of the user making the purchase as returned by the Amazon App Store
		in-app purchase API

	]]
	UserId: string,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type GetFriendLeaderboardAroundPlayerRequest = {
	--[[
		PlayFab unique identifier of the user to center the leaderboard around. If
		null will center on the logged in user.

	]]
	PlayFabId: string?,
	--[[
		Maximum number of entries to retrieve. Default 10, maximum 100.

	]]
	MaxResultsCount: number?,
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
		Xbox token if Xbox friends should be included. Requires Xbox be configured on
		PlayFab.

	]]
	XboxToken: string?,
	--[[
		Statistic used to rank players for this leaderboard.

	]]
	StatisticName: string,
	ExternalPlatformFriends: ExternalFriendSources?,
	ProfileConstraints: PlayerProfileViewConstraints?,
}

export type KongregatePlayFabIdPair = {
	--[[
		Unique Kongregate identifier for a user.

	]]
	KongregateId: string?,
	--[[
		Unique PlayFab identifier for a user, or null if no PlayFab account is linked
		to the Kongregate identifier.

	]]
	PlayFabId: string?,
}

export type ConsumePSNEntitlementsRequest = {
	--[[
		Id of the PlayStation :tm: Network service label to consume entitlements from

	]]
	ServiceLabel: number,
	--[[
		Which catalog to match granted entitlements against. If null, defaults to
		title default catalog

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

export type GetTradeStatusRequest = {
	--[[
		Player who opened trade.

	]]
	OfferingPlayerId: string,
	--[[
		Trade identifier as returned by OpenTradeOffer.

	]]
	TradeId: string,
}

--[[
	Username and password lengths are provided for information purposes. The
	server will validate that data passed in conforms to the field definition
	and report errors appropriately. It is recommended that developers not
	perform this validation locally, so that future updates to the username or
	password do not require client updates.

]]
export type LoginWithPlayFabRequest = {
	--[[
		PlayFab username for the account.

	]]
	Username: string,
	--[[
		Unique identifier for the title, found in the Settings > Game Properties
		section of the PlayFab developer site when a title has been selected.

	]]
	TitleId: string,
	InfoRequestParameters: GetPlayerCombinedInfoRequestParams?,
	--[[
		Password for the PlayFab account (6-100 characters)

	]]
	Password: string,
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
	Once verified, the catalog item matching the iTunes item name will be added
	to the user's inventory. This result should be used for immediate updates to
	the local client game state as opposed to the GetUserInventory API which can
	have an up to half second delay.

]]
export type ValidateIOSReceiptResult = {
	--[[
		Fulfilled inventory items and recorded purchases in fulfillment of the
		validated receipt transactions.

	]]
	Fulfillments: { PurchaseReceiptFulfillment }?,
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

export type GetPlayerSegmentsRequest = {
	-- No properties defined in spec
	[string]: any
}

--[[
	The packageName and productId are defined in the GooglePlay store. The
	productId must match the ItemId of the inventory item in the PlayFab catalog
	for the title. This enables the PlayFab service to securely validate that
	the purchase is for the correct item, in order to prevent uses from passing
	valid receipts as being for more expensive items (passing a receipt for a
	99-cent purchase as being for a $19.99 purchase, for example). Each receipt
	may be validated only once to avoid granting the same item over and over
	from a single purchase.

]]
export type ValidateGooglePlayPurchaseRequest = {
	--[[
		Amount of the stated currency paid, in centesimal units.

	]]
	PurchasePrice: number?,
	--[[
		Currency used to pay for the purchase (ISO 4217 currency code).

	]]
	CurrencyCode: string?,
	--[[
		Signature returned by the Google Play IAB API.

	]]
	Signature: string,
	--[[
		Catalog version of the fulfilled items. If null, defaults to the primary
		catalog.

	]]
	CatalogVersion: string?,
	--[[
		Original JSON string returned by the Google Play IAB API.

	]]
	ReceiptJson: string,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type CancelTradeRequest = {
	--[[
		Trade identifier.

	]]
	TradeId: string,
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

export type LinkAndroidDeviceIDRequest = {
	--[[
		Specific model of the user's device.

	]]
	AndroidDevice: string?,
	--[[
		Specific Operating System version for the user's device.

	]]
	OS: string?,
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
	--[[
		If another user is already linked to the device, unlink the other user and
		re-link.

	]]
	ForceLink: boolean?,
}

export type GameCenterPlayFabIdPair = {
	--[[
		Unique Game Center identifier for a user.

	]]
	GameCenterId: string?,
	--[[
		Unique PlayFab identifier for a user, or null if no PlayFab account is linked
		to the Game Center identifier.

	]]
	PlayFabId: string?,
}

export type GetPlayerCustomPropertyResult = {
	--[[
		Indicates the current version of a player's properties that have been set.
		This is incremented after updates and deletes. This version can be provided in
		update and delete calls for concurrency control.

	]]
	PropertiesVersion: number,
	Property: CustomPropertyDetails?,
}

--[[
	The Game Center player identifier
	(https://developer.apple.com/library/ios/documentation/Accounts/Reference/ACAccountClassRef/index.html#//apple_ref/occ/instp/ACAccount/identifier)
	is a generated string which is stored on the local device. As with device
	identifiers, care must be taken to never expose a player's Game Center
	identifier to end users, as that could result in a user's account being
	compromised. If this is the first time a user has signed in with Game Center
	and CreateAccount is set to true, a new PlayFab account will be created and
	linked to the Game Center identifier. In this case, no email or username
	will be associated with the PlayFab account. Otherwise, if no PlayFab
	account is linked to the Game Center account, an error indicating this will
	be returned, so that the title can guide the user through creation of a
	PlayFab account. If an invalid iOS Game Center player identifier is used, an
	error indicating this will be returned.

]]
export type LoginWithGameCenterRequest = {
	--[[
		Unique Game Center player id.

	]]
	PlayerId: string?,
	--[[
		The verification signature of the authentication payload.

	]]
	Signature: string?,
	--[[
		Automatically create a PlayFab account if one is not currently linked to this
		ID.

	]]
	CreateAccount: boolean?,
	--[[
		The URL for the public encryption key that will be used to verify the
		signature.

	]]
	PublicKeyUrl: string?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		Player secret that is used to verify API request signatures (Enterprise Only).

	]]
	PlayerSecret: string?,
	--[[
		Unique identifier for the title, found in the Settings > Game Properties
		section of the PlayFab developer site when a title has been selected.

	]]
	TitleId: string,
	InfoRequestParameters: GetPlayerCombinedInfoRequestParams?,
	--[[
		The integer representation of date and time that the signature was created on.
		PlayFab will reject authentication signatures not within 10 minutes of the
		server's current time.

	]]
	Timestamp: string?,
	--[[
		Base64 encoded body that is encrypted with the Title's public RSA key
		(Enterprise Only).

	]]
	EncryptedRequest: string?,
	--[[
		A random value used to compute the hash and keep it randomized.

	]]
	Salt: string?,
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
}

export type LoginWithBattleNetRequest = {
	--[[
		Automatically create a PlayFab account if one is not currently linked to this
		ID.

	]]
	CreateAccount: boolean?,
	--[[
		Base64 encoded body that is encrypted with the Title's public RSA key
		(Enterprise Only).

	]]
	EncryptedRequest: string?,
	--[[
		Unique identifier for the title, found in the Settings > Game Properties
		section of the PlayFab developer site when a title has been selected.

	]]
	TitleId: string,
	InfoRequestParameters: GetPlayerCombinedInfoRequestParams?,
	--[[
		Player secret that is used to verify API request signatures (Enterprise Only).

	]]
	PlayerSecret: string?,
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

export type ConsumeXboxEntitlementsResult = {
	--[[
		Details for the items purchased.

	]]
	Items: { ItemInstance }?,
}

export type LinkIOSDeviceIDRequest = {
	--[[
		Specific Operating System version for the user's device.

	]]
	OS: string?,
	--[[
		Specific model of the user's device.

	]]
	DeviceModel: string?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		Vendor-specific iOS identifier for the user's device.

	]]
	DeviceId: string,
	--[[
		If another user is already linked to the device, unlink the other user and
		re-link.

	]]
	ForceLink: boolean?,
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
		Player specific properties and their corresponding values for this title.

	]]
	Properties: { CustomPropertyDetails }?,
}

--[[
	This API is designed to write a multitude of different event types into
	PlayStream. It supports a flexible JSON schema, which allowsfor arbitrary
	key-value pairs to describe any player-based event. The created event will
	be locked to the authenticated title and player.

]]
export type WriteClientPlayerEventRequest = {
	--[[
		Custom data properties associated with the event. Each property consists of a
		name (string) and a value (JSON object).

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

export type GetTitleNewsRequest = {
	--[[
		Limits the results to the last n entries. Defaults to 10 if not set.

	]]
	Count: number?,
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
		User email address attached to their account

	]]
	Email: string,
	--[[
		The email template id of the account recovery email template to send.

	]]
	EmailTemplateId: string?,
	--[[
		Unique identifier for the title, found in the Settings > Game Properties
		section of the PlayFab developer site when a title has been selected.

	]]
	TitleId: string,
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

export type GetPaymentTokenResult = {
	--[[
		PlayFab's purchase order identifier.

	]]
	OrderId: string?,
	--[[
		The token from provider.

	]]
	ProviderToken: string?,
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

export type GetPurchaseResult = {
	--[[
		Provider transaction ID (If not VC)

	]]
	TransactionId: string?,
	--[[
		Payment provider used for transaction (If not VC)

	]]
	PaymentProvider: string?,
	--[[
		Purchase order identifier.

	]]
	OrderId: string?,
	--[[
		Date and time of the purchase.

	]]
	PurchaseDate: string,
	--[[
		PlayFab transaction status

	]]
	TransactionStatus: string?,
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

export type GetTradeStatusResponse = {
	Trade: TradeInfo?,
}

export type EmptyResult = {
	-- No properties defined in spec
	[string]: any
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
	Note: If the user authenticated with AuthenticationToken when calling
	LoginWithFacebook, instead of AccessToken, an empty list will be returned.
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
	For Google Play Games identifiers which have not been linked to PlayFab
	accounts, null will be returned.

]]
export type GetPlayFabIDsFromGooglePlayGamesPlayerIDsResult = {
	--[[
		Mapping of Google Play Games identifiers to PlayFab identifiers.

	]]
	Data: { GooglePlayGamesPlayFabIdPair }?,
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

--[[
	If CatalogVersion is not specified, only inventory items associated with the
	most recent version of the catalog will be returned.

]]
export type GetCatalogItemsResult = {
	--[[
		Array of items which can be purchased.

	]]
	Catalog: { CatalogItem }?,
}

export type RemoveFriendRequest = {
	--[[
		PlayFab identifier of the friend account which is to be removed.

	]]
	FriendPlayFabId: string,
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

export type CancelTradeResponse = {
	Trade: TradeInfo?,
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
	Note: When calling 'GetLeaderboardAround...' APIs, the position of the user
	defaults to 0 when the user does not have the corresponding statistic.

]]
export type GetLeaderboardAroundPlayerResult = {
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

--[[
	Note: the user's Position is relative to the overall leaderboard.

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

export type ConsumeItemRequest = {
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		Unique PlayFab assigned ID for a specific character owned by a user

	]]
	CharacterId: string?,
	--[[
		Number of uses to consume from the item.

	]]
	ConsumeCount: number,
	--[[
		Unique instance identifier of the item to be consumed.

	]]
	ItemInstanceId: string,
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

--[[
	The final step in the purchasing process, this API finalizes the purchase
	with the payment provider, where applicable, adding virtual goods to the
	player inventory (including random drop table resolution and recursive
	addition of bundled items) and adjusting virtual currency balances for funds
	used or added. Note that this is a pull operation, and should be polled
	regularly when a purchase is in progress. Please note that the processing
	time for inventory grants and purchases increases fractionally the more
	items are in the inventory, and the more items are in the grant/purchase
	operation.

]]
export type ConfirmPurchaseRequest = {
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		Purchase order identifier returned from StartPurchase.

	]]
	OrderId: string,
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

--[[
	The steps to configure and send Push Notifications is described in the
	PlayFab tutorials, here:
	https://docs.microsoft.com/gaming/playfab/features/engagement/push-notifications/quickstart

]]
export type RegisterForIOSPushNotificationRequest = {
	--[[
		Message to display when confirming push notification.

	]]
	ConfirmationMessage: string?,
	--[[
		If true, send a test push message immediately after sucessful registration.
		Defaults to false.

	]]
	SendPushNotificationConfirmation: boolean?,
	--[[
		Unique token generated by the Apple Push Notification service when the title
		registered to receive push notifications.

	]]
	DeviceToken: string,
}

export type GetPlayFabIDsFromGenericIDsRequest = {
	--[[
		Array of unique generic service identifiers for which the title needs to get
		PlayFab identifiers. Currently limited to a maximum of 10 in a single request.

	]]
	GenericIDs: { GenericServiceId },
}

export type UserAppleIdInfo = {
	--[[
		Apple subject ID

	]]
	AppleSubjectId: string?,
}

export type GetPlayerCustomPropertyRequest = {
	--[[
		Specific property name to search for in the player's properties.

	]]
	PropertyName: string,
}

export type ConsumeMicrosoftStoreEntitlementsResponse = {
	--[[
		Details for the items purchased.

	]]
	Items: { ItemInstance }?,
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
	PlayFabId: string?,
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

export type ContinentCode = 
	| "AF"
	| "AN"
	| "AS"
	| "EU"
	| "NA"
	| "OC"
	| "SA"
	| "Unknown"

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

export type GetPlayerTradesRequest = {
	StatusFilter: TradeStatus?,
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

export type GetPlayerTradesResponse = {
	--[[
		History of trades which this player has accepted.

	]]
	AcceptedTrades: { TradeInfo }?,
	--[[
		The trades for this player which are currently available to be accepted.

	]]
	OpenedTrades: { TradeInfo }?,
}

--[[
	This API adds a contact email to the player's profile. If the player's
	profile already contains a contact email, it will update the contact email
	to the email address specified.

]]
export type AddOrUpdateContactEmailRequest = {
	--[[
		The new contact email to associate with the player.

	]]
	EmailAddress: string,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type GetPlayFabIDsFromGoogleIDsRequest = {
	--[[
		Array of unique Google identifiers (Google+ user IDs) for which the title
		needs to get PlayFab identifiers. The array cannot exceed 25 in length.

	]]
	GoogleIDs: { string },
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

export type UnlinkSteamAccountResult = {
	-- No properties defined in spec
	[string]: any
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
	A single ad placement details including placement and reward information

]]
export type AdPlacementDetails = {
	--[[
		Placement unique ID

	]]
	PlacementId: string?,
	--[[
		If placement has viewing limits indicates when they will next reset

	]]
	PlacementViewsResetMinutes: number?,
	--[[
		Optional URL to a reward asset

	]]
	RewardAssetUrl: string?,
	--[[
		If placement has viewing limits indicates how many views are left

	]]
	PlacementViewsRemaining: number?,
	--[[
		Reward description

	]]
	RewardDescription: string?,
	--[[
		Placement name

	]]
	PlacementName: string?,
	--[[
		Reward unique ID

	]]
	RewardId: string?,
	--[[
		Reward name

	]]
	RewardName: string?,
}

export type CreateSharedGroupResult = {
	--[[
		Unique identifier for the shared group.

	]]
	SharedGroupId: string?,
}

export type RemoveGenericIDResult = {
	-- No properties defined in spec
	[string]: any
}

export type GetPlayFabIDsFromNintendoSwitchDeviceIdsRequest = {
	--[[
		Array of unique Nintendo Switch Device identifiers for which the title needs
		to get PlayFab identifiers. The array cannot exceed 25 in length.

	]]
	NintendoSwitchDeviceIds: { string },
}

--[[
	For Nintendo Switch identifiers which have not been linked to PlayFab
	accounts, null will be returned.

]]
export type GetPlayFabIDsFromNintendoSwitchDeviceIdsResult = {
	--[[
		Mapping of Nintendo Switch Device identifiers to PlayFab identifiers.

	]]
	Data: { NintendoSwitchPlayFabIdPair }?,
}

--[[
	This is the first step in the purchasing process. For security purposes,
	once the order (or "cart") has been created, additional inventory objects
	may no longer be added. In addition, inventory objects will be locked to the
	current prices, regardless of any subsequent changes at the catalog level
	which may occur during the next two steps.

]]
export type StartPurchaseRequest = {
	--[[
		Array of items to purchase.

	]]
	Items: { ItemPurchaseRequest },
	--[[
		Catalog version for the items to be purchased. Defaults to most recent
		catalog.

	]]
	CatalogVersion: string?,
	--[[
		Store through which to purchase items. If not set, prices will be pulled from
		the catalog itself.

	]]
	StoreId: string?,
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

export type GetPaymentTokenRequest = {
	--[[
		The name of service to provide the payment token. Allowed Values are: xsolla

	]]
	TokenProvider: string,
}

export type ItemPurchaseRequest = {
	--[[
		Title-specific text concerning this purchase.

	]]
	Annotation: string?,
	--[[
		How many of this item to purchase. Min 1, maximum 25.

	]]
	Quantity: number,
	--[[
		Unique ItemId of the item to purchase.

	]]
	ItemId: string,
	--[[
		Items to be upgraded as a result of this purchase (upgraded items are hidden,
		as they are "replaced" by the new items).

	]]
	UpgradeFromItems: { string }?,
}

export type SendAccountRecoveryEmailResult = {
	-- No properties defined in spec
	[string]: any
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

export type UpdatePlayerCustomPropertiesResult = {
	--[[
		Indicates the current version of a player's properties that have been set.
		This is incremented after updates and deletes. This version can be provided in
		update and delete calls for concurrency control.

	]]
	PropertiesVersion: number,
}

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

export type UpdateCharacterStatisticsResult = {
	-- No properties defined in spec
	[string]: any
}

export type GetPlayerCombinedInfoRequest = {
	InfoRequestParameters: GetPlayerCombinedInfoRequestParams,
	--[[
		PlayFabId of the user whose data will be returned. If not filled included, we
		return the data for the calling player.

	]]
	PlayFabId: string?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
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

export type UnlinkGoogleAccountRequest = {
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

--[[
	The items and vc found within the container. These will be added and stacked
	in the appropriate inventory.

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

--[[
	This API is designed to write a multitude of different client-defined events
	into PlayStream. It supports a flexible JSON schema, which allowsfor
	arbitrary key-value pairs to describe any character-based event. The created
	event will be locked to the authenticated title and player.

]]
export type WriteClientCharacterEventRequest = {
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
		Unique PlayFab assigned ID for a specific character owned by a user

	]]
	CharacterId: string,
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

--[[
	Each account must have a unique username and email address in the PlayFab
	service. Once created, the account may be associated with additional
	accounts (Steam, Facebook, Game Center, etc.), allowing for added social
	network lists and achievements systems. This can also be used to provide a
	recovery method if the user loses their original means of access.

]]
export type AddUsernamePasswordResult = {
	--[[
		PlayFab unique user name.

	]]
	Username: string?,
}

export type PurchaseReceiptFulfillment = {
	--[[
		Currency used to purchase the items (ISO 4217 currency code).

	]]
	RecordedTransactionCurrency: string?,
	--[[
		Items granted to the player in fulfillment of the validated receipt.

	]]
	FulfilledItems: { ItemInstance }?,
	--[[
		Amount of the stated currency paid for the items, in centesimal units

	]]
	RecordedTransactionTotal: number?,
	--[[
		Source of the payment price information for the recorded purchase transaction.
		A value of 'Request' indicates that the price specified in the request was
		used, whereas a value of 'Catalog' indicates that the real-money price of the
		catalog item matching the product ID in the validated receipt transaction and
		the currency specified in the request (defaulting to USD) was used.

	]]
	RecordedPriceSource: string?,
}

--[[
	This API is designed to write a multitude of different client-defined events
	into PlayStream. It supports a flexible JSON schema, which allowsfor
	arbitrary key-value pairs to describe any title-based event. The created
	event will be locked to the authenticated title.

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

export type GetTitleNewsResult = {
	--[[
		Array of news items.

	]]
	News: { TitleNewsItem }?,
}

--[[
	An RSA CSP blob to be used to encrypt the payload of account creation
	requests when that API requires a signature header. For example if
	Client/LoginWithCustomId requires signature headers but the player does not
	have an account yet follow these steps: 1) Call Client/GetTitlePublicKey
	with one of the title's shared secrets. 2) Convert the Base64 encoded CSP
	blob to a byte array and create an RSA signing object. 3) Encrypt the UTF8
	encoded JSON body of the registration request and place the Base64 encoded
	result into the EncryptedRequest and with the TitleId field, all other
	fields can be left empty when performing the API request. 4) Client receives
	authentication token as normal. Future requests to LoginWithCustomId will
	require the X-PlayFab-Signature header.

]]
export type GetTitlePublicKeyRequest = {
	--[[
		The shared secret key for this title

	]]
	TitleSharedSecret: string,
	--[[
		Unique identifier for the title, found in the Settings > Game Properties
		section of the PlayFab developer site when a title has been selected.

	]]
	TitleId: string,
}

export type UnlinkFacebookAccountRequest = {
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type AcceptTradeRequest = {
	--[[
		Items from the accepting player's inventory in exchange for the offered items
		in the trade. In the case of a gift, this will be null.

	]]
	AcceptedInventoryInstanceIds: { string }?,
	--[[
		Player who opened the trade.

	]]
	OfferingPlayerId: string,
	--[[
		Trade identifier.

	]]
	TradeId: string,
}

export type LoginWithFacebookInstantGamesIdRequest = {
	--[[
		Facebook Instant Games signature for the user.

	]]
	FacebookInstantGamesSignature: string,
	--[[
		Automatically create a PlayFab account if one is not currently linked to this
		ID.

	]]
	CreateAccount: boolean?,
	--[[
		Unique identifier for the title, found in the Settings > Game Properties
		section of the PlayFab developer site when a title has been selected.

	]]
	TitleId: string,
	InfoRequestParameters: GetPlayerCombinedInfoRequestParams?,
	--[[
		Player secret that is used to verify API request signatures (Enterprise Only).

	]]
	PlayerSecret: string?,
	--[[
		Base64 encoded body that is encrypted with the Title's public RSA key
		(Enterprise Only).

	]]
	EncryptedRequest: string?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type LoginWithNintendoSwitchDeviceIdRequest = {
	--[[
		Nintendo Switch unique identifier for the user's device.

	]]
	NintendoSwitchDeviceId: string?,
	--[[
		Automatically create a PlayFab account if one is not currently linked to this
		ID.

	]]
	CreateAccount: boolean?,
	--[[
		Unique identifier for the title, found in the Settings > Game Properties
		section of the PlayFab developer site when a title has been selected.

	]]
	TitleId: string,
	InfoRequestParameters: GetPlayerCombinedInfoRequestParams?,
	--[[
		Player secret that is used to verify API request signatures (Enterprise Only).

	]]
	PlayerSecret: string?,
	--[[
		Base64 encoded body that is encrypted with the Title's public RSA key
		(Enterprise Only).

	]]
	EncryptedRequest: string?,
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
	Data: UserDataRecord?,
	--[[
		Indicates the current version of the data that has been set. This is
		incremented with every set call for that type of data (read-only, internal,
		etc). This version can be provided in Get calls to find updated data.

	]]
	DataVersion: number,
}

export type LinkGooglePlayGamesServicesAccountResult = {
	-- No properties defined in spec
	[string]: any
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

--[[
	Grants a character to the user of the type specified by the item ID. The
	user must already have an instance of this item in their inventory in order
	to allow character creation. This item can come from a purchase or grant,
	which must be done before calling to create the character.

]]
export type GrantCharacterToUserRequest = {
	--[[
		Non-unique display name of the character being granted (1-40 characters in
		length).

	]]
	CharacterName: string,
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
	--[[
		Catalog item identifier of the item in the user's inventory that corresponds
		to the character in the catalog to be created.

	]]
	ItemId: string,
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

export type UserNintendoSwitchDeviceIdInfo = {
	--[[
		Nintendo Switch Device ID

	]]
	NintendoSwitchDeviceId: string?,
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

export type AddGenericIDResult = {
	-- No properties defined in spec
	[string]: any
}

export type GetCharacterStatisticsRequest = {
	--[[
		Unique PlayFab assigned ID for a specific character owned by a user

	]]
	CharacterId: string,
}

export type GenericPlayFabIdPair = {
	GenericId: GenericServiceId?,
	--[[
		Unique PlayFab identifier for a user, or null if no PlayFab account is linked
		to the given generic identifier.

	]]
	PlayFabId: string?,
}

export type LinkTwitchAccountRequest = {
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		Valid token issued by Twitch

	]]
	AccessToken: string,
	--[[
		If another user is already linked to the account, unlink the other user and
		re-link.

	]]
	ForceLink: boolean?,
}

--[[
	Facebook sign-in is accomplished using the Facebook User Access Token. More
	information on the Token can be found in the Facebook developer
	documentation
	(https://developers.facebook.com/docs/facebook-login/access-tokens/). In
	Unity, for example, the Token is available as AccessToken in the Facebook
	SDK ScriptableObject FB. Note that titles should never re-use the same
	Facebook applications between PlayFab Title IDs, as Facebook provides unique
	user IDs per application and doing so can result in issues with the Facebook
	ID for the user in their PlayFab account information. If you must re-use an
	application in a new PlayFab Title ID, please be sure to first unlink all
	accounts from Facebook, or delete all users in the first Title ID.

]]
export type LinkFacebookAccountRequest = {
	--[[
		Token used for limited login authentication.

	]]
	AuthenticationToken: string?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		Unique identifier from Facebook for the user.

	]]
	AccessToken: string?,
	--[[
		If another user is already linked to the account, unlink the other user and
		re-link.

	]]
	ForceLink: boolean?,
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

--[[
	Using an AppId to return a list of valid ad placements for a player.

]]
export type GetAdPlacementsRequest = {
	--[[
		The current AppId to use

	]]
	AppId: string,
	--[[
		Identifier by either name or ID. Note that a name may change due to renaming,
		or reused after being deleted. ID is immutable and unique.

	]]
	Identifier: NameIdentifier?,
}

export type UserFacebookInstantGamesIdInfo = {
	--[[
		Facebook Instant Games ID

	]]
	FacebookInstantGamesId: string?,
}

export type LinkFacebookAccountResult = {
	-- No properties defined in spec
	[string]: any
}

export type UnlinkNintendoSwitchDeviceIdResult = {
	-- No properties defined in spec
	[string]: any
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
	The title should obtain a refresh receipt via restoreCompletedTransactions
	in the SKPaymentQueue of the Apple StoreKit and pass that in to this call.
	The resultant receipt contains new receipt instances for all non-consumable
	goods previously purchased by the user. This API call iterates through every
	purchase in the receipt and restores the items if they still exist in the
	catalog and can be validated.

]]
export type RestoreIOSPurchasesRequest = {
	--[[
		Catalog version of the restored items. If null, defaults to primary catalog.

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
		Base64 encoded receipt data, passed back by the App Store as a result of a
		successful purchase.

	]]
	ReceiptData: string,
}

--[[
	More details regarding Kongregate and their game authentication system can
	be found at
	http://developers.kongregate.com/docs/virtual-goods/authentication.
	Developers must provide the Kongregate user ID and auth token that are
	generated using the Kongregate client library. PlayFab will combine these
	identifiers with the title's unique Kongregate app ID to log the player into
	the Kongregate system. If CreateAccount is set to true and there is not
	already a user matched to this Kongregate ID, then PlayFab will create a new
	account for this user and link the ID. In this case, no email or username
	will be associated with the PlayFab account. If there is already a different
	PlayFab user linked with this account, then an error will be returned.

]]
export type LoginWithKongregateRequest = {
	--[[
		Token issued by Kongregate's client API for the user.

	]]
	AuthTicket: string?,
	--[[
		Numeric user ID assigned by Kongregate

	]]
	KongregateId: string?,
	--[[
		Automatically create a PlayFab account if one is not currently linked to this
		ID.

	]]
	CreateAccount: boolean?,
	--[[
		Unique identifier for the title, found in the Settings > Game Properties
		section of the PlayFab developer site when a title has been selected.

	]]
	TitleId: string,
	InfoRequestParameters: GetPlayerCombinedInfoRequestParams?,
	--[[
		Player secret that is used to verify API request signatures (Enterprise Only).

	]]
	PlayerSecret: string?,
	--[[
		Base64 encoded body that is encrypted with the Title's public RSA key
		(Enterprise Only).

	]]
	EncryptedRequest: string?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
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
	For Facebook identifiers which have not been linked to PlayFab accounts,
	null will be returned.

]]
export type GetPlayFabIDsFromFacebookIDsResult = {
	--[[
		Mapping of Facebook identifiers to PlayFab identifiers.

	]]
	Data: { FacebookPlayFabIdPair }?,
}

--[[
	This API must be enabled for use as an option in the game manager website.
	It is disabled by default.

]]
export type AddUserVirtualCurrencyRequest = {
	--[[
		Amount to be added to the user balance of the specified virtual currency.

	]]
	Amount: number,
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

--[[
	For web-based payment providers, this operation returns the URL to which the
	user should be directed inorder to approve the purchase. Items added to the
	user inventory as a result of this operation will be marked as unconfirmed.

]]
export type PayForPurchaseResult = {
	--[[
		A token generated by the provider to authenticate the request
		(provider-specific).

	]]
	ProviderToken: string?,
	--[[
		Current virtual currency balances for the user.

	]]
	VirtualCurrency: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		Virtual currencies granted by the transaction, if any.

	]]
	VCAmount: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		Local credit applied to the transaction (provider specific).

	]]
	CreditApplied: number,
	--[[
		URL to the purchase provider page that details the purchase.

	]]
	PurchaseConfirmationPageURL: string?,
	--[[
		Currency for the transaction, may be a virtual currency or real money.

	]]
	PurchaseCurrency: string?,
	--[[
		Provider used for the transaction.

	]]
	ProviderData: string?,
	Status: TransactionStatus?,
	--[[
		Purchase order identifier.

	]]
	OrderId: string?,
	--[[
		Cost of the transaction.

	]]
	PurchasePrice: number,
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

export type LinkGameCenterAccountResult = {
	-- No properties defined in spec
	[string]: any
}

--[[
	Google sign-in is accomplished by obtaining a Google OAuth 2.0 credential
	using the Google sign-in for Android APIs on the device and passing it to
	this API.

]]
export type LinkGoogleAccountRequest = {
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
		re-link. If the current user is already linked, link both accounts

	]]
	ForceLink: boolean?,
	--[[
		Server authentication code obtained on the client by calling
		getServerAuthCode()
		(https://developers.google.com/identity/sign-in/android/offline-access) from
		Google Play for the user.

	]]
	ServerAuthCode: string?,
}

export type GetFriendsListRequest = {
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	ProfileConstraints: PlayerProfileViewConstraints?,
	ExternalPlatformFriends: ExternalFriendSources?,
	--[[
		Xbox token if Xbox friends should be included. Requires Xbox be configured on
		PlayFab.

	]]
	XboxToken: string?,
}

export type AttributeInstallResult = {
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

export type GetTitleDataResult = {
	--[[
		a dictionary object of key / value pairs

	]]
	Data: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type UnlinkOpenIdConnectRequest = {
	--[[
		A name that identifies which configured OpenID Connect provider relationship
		to use. Maximum 100 characters.

	]]
	ConnectionId: string,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type RegisterPlayFabUserRequest = {
	--[[
		Player secret that is used to verify API request signatures (Enterprise Only).

	]]
	PlayerSecret: string?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		Password for the PlayFab account (6-100 characters)

	]]
	Password: string?,
	--[[
		An optional parameter for setting the display name for this title (3-25
		characters).

	]]
	DisplayName: string?,
	--[[
		Base64 encoded body that is encrypted with the Title's public RSA key
		(Enterprise Only).

	]]
	EncryptedRequest: string?,
	--[[
		Unique identifier for the title, found in the Settings > Game Properties
		section of the PlayFab developer site when a title has been selected.

	]]
	TitleId: string,
	InfoRequestParameters: GetPlayerCombinedInfoRequestParams?,
	--[[
		PlayFab username for the account (3-20 characters)

	]]
	Username: string?,
	--[[
		An optional parameter that specifies whether both the username and email
		parameters are required. If true, both parameters are required; if false, the
		user must supply either the username or email parameter. The default value is
		true.

	]]
	RequireBothUsernameAndEmail: boolean?,
	--[[
		User email address attached to their account

	]]
	Email: string?,
}

--[[
	Google Play Games sign-in is accomplished by obtaining a Google OAuth 2.0
	credential using the Google Play Games sign-in for Android APIs on the
	device and passing it to this API.

]]
export type LinkGooglePlayGamesServicesAccountRequest = {
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
		re-link. If the current user is already linked, link both accounts

	]]
	ForceLink: boolean?,
	--[[
		OAuth 2.0 server authentication code obtained on the client by calling the
		requestServerSideAccess()
		(https://developers.google.com/games/services/android/signin) Google Play
		Games client API.

	]]
	ServerAuthCode: string,
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

export type LinkIOSDeviceIDResult = {
	-- No properties defined in spec
	[string]: any
}

export type LoginWithNintendoServiceAccountRequest = {
	--[[
		Automatically create a PlayFab account if one is not currently linked to this
		ID.

	]]
	CreateAccount: boolean?,
	--[[
		Base64 encoded body that is encrypted with the Title's public RSA key
		(Enterprise Only).

	]]
	EncryptedRequest: string?,
	--[[
		Unique identifier for the title, found in the Settings > Game Properties
		section of the PlayFab developer site when a title has been selected.

	]]
	TitleId: string,
	InfoRequestParameters: GetPlayerCombinedInfoRequestParams?,
	--[[
		Player secret that is used to verify API request signatures (Enterprise Only).

	]]
	PlayerSecret: string?,
	--[[
		The JSON Web token (JWT) returned by Nintendo after login.

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

export type GetCharacterLeaderboardRequest = {
	--[[
		Unique identifier for the title-specific statistic for the leaderboard.

	]]
	StatisticName: string,
	--[[
		Maximum number of entries to retrieve. Default 10, maximum 100.

	]]
	MaxResultsCount: number?,
	--[[
		First entry in the leaderboard to be retrieved.

	]]
	StartPosition: number,
}

export type LinkGameCenterAccountRequest = {
	--[[
		Game Center identifier for the player account to be linked.

	]]
	GameCenterId: string,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		The URL for the public encryption key that will be used to verify the
		signature.

	]]
	PublicKeyUrl: string?,
	--[[
		The verification signature of the authentication payload.

	]]
	Signature: string?,
	--[[
		The integer representation of date and time that the signature was created on.
		PlayFab will reject authentication signatures not within 10 minutes of the
		server's current time.

	]]
	Timestamp: string?,
	--[[
		A random value used to compute the hash and keep it randomized.

	]]
	Salt: string?,
	--[[
		If another user is already linked to the account, unlink the other user and
		re-link. If the current user is already linked, link both accounts

	]]
	ForceLink: boolean?,
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
}

export type UnlinkGameCenterAccountRequest = {
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type GetPlayFabIDsFromGooglePlayGamesPlayerIDsRequest = {
	--[[
		Array of unique Google Play Games identifiers (Google+ user IDs) for which the
		title needs to get PlayFab identifiers. The array cannot exceed 25 in length.

	]]
	GooglePlayGamesPlayerIDs: { string },
}

export type UnlinkIOSDeviceIDResult = {
	-- No properties defined in spec
	[string]: any
}

export type ConsumeMicrosoftStoreEntitlementsRequest = {
	--[[
		Catalog version to use

	]]
	CatalogVersion: string?,
	MarketplaceSpecificData: MicrosoftStorePayload,
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
	Note: When calling 'GetLeaderboardAround...' APIs, the position of the user
	defaults to 0 when the user does not have the corresponding statistic.If
	Facebook friends are included, make sure the access token from previous
	LoginWithFacebook call is still valid and not expired. If Xbox Live friends
	are included, make sure the access token from the previous LoginWithXbox
	call is still valid and not expired.

]]
export type GetFriendLeaderboardAroundPlayerResult = {
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
		Maximum number of entries to retrieve. Default 10, maximum 100.

	]]
	MaxResultsCount: number?,
	--[[
		Position in the leaderboard to start this listing (defaults to the first
		entry).

	]]
	StartPosition: number,
	--[[
		The version of the leaderboard to get.

	]]
	Version: number?,
	--[[
		Statistic used to rank players for this leaderboard.

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

export type AndroidDevicePushNotificationRegistrationResult = {
	-- No properties defined in spec
	[string]: any
}

export type LinkNintendoSwitchDeviceIdRequest = {
	--[[
		Nintendo Switch unique identifier for the user's device.

	]]
	NintendoSwitchDeviceId: string,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		If another user is already linked to the Nintendo Switch Device ID, unlink the
		other user and re-link.

	]]
	ForceLink: boolean?,
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

export type PlayStation5Payload = {
	--[[
		An optional list of entitlement ids to query against PlayStation :tm: Network

	]]
	Ids: { string }?,
	--[[
		Id of the PlayStation :tm: Network service label to consume entitlements from

	]]
	ServiceLabel: string?,
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

export type LinkNintendoSwitchDeviceIdResult = {
	-- No properties defined in spec
	[string]: any
}

export type LinkPSNAccountRequest = {
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

export type LinkTwitchAccountResult = {
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

export type SetFriendTagsResult = {
	-- No properties defined in spec
	[string]: any
}

export type GetLeaderboardAroundCharacterRequest = {
	--[[
		Unique PlayFab assigned ID for a specific character on which to center the
		leaderboard.

	]]
	CharacterId: string,
	--[[
		Maximum number of entries to retrieve. Default 10, maximum 100.

	]]
	MaxResultsCount: number?,
	--[[
		Unique identifier for the title-specific statistic for the leaderboard.

	]]
	StatisticName: string,
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

export type LinkXboxAccountResult = {
	-- No properties defined in spec
	[string]: any
}

export type GetPhotonAuthenticationTokenRequest = {
	--[[
		The Photon applicationId for the game you wish to log into.

	]]
	PhotonApplicationId: string,
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

export type ListUsersCharactersResult = {
	--[[
		The requested list of characters.

	]]
	Characters: { CharacterResult }?,
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
	--[[
		Custom unique identifier for the user, generated by the title.

	]]
	CustomId: string?,
	--[[
		Automatically create a PlayFab account if one is not currently linked to this
		ID.

	]]
	CreateAccount: boolean?,
	--[[
		Unique identifier for the title, found in the Settings > Game Properties
		section of the PlayFab developer site when a title has been selected.

	]]
	TitleId: string,
	InfoRequestParameters: GetPlayerCombinedInfoRequestParams?,
	--[[
		Player secret that is used to verify API request signatures (Enterprise Only).

	]]
	PlayerSecret: string?,
	--[[
		Base64 encoded body that is encrypted with the Title's public RSA key
		(Enterprise Only).

	]]
	EncryptedRequest: string?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
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

--[[
	This API must be enabled for use as an option in the game manager website.
	It is disabled by default.

]]
export type SubtractUserVirtualCurrencyRequest = {
	--[[
		Amount to be subtracted from the user balance of the specified virtual
		currency.

	]]
	Amount: number,
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

export type GetCharacterDataResult = {
	--[[
		Unique PlayFab assigned ID for a specific character owned by a user

	]]
	CharacterId: string?,
	Data: UserDataRecord?,
	--[[
		Indicates the current version of the data that has been set. This is
		incremented with every set call for that type of data (read-only, internal,
		etc). This version can be provided in Get calls to find updated data.

	]]
	DataVersion: number,
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
	All items currently in the character inventory will be returned,
	irrespective of how they were acquired (via purchasing, grants, coupons,
	etc.). Items that are expired, fully consumed, or are no longer valid are
	not considered to be in the user's current inventory, and so will not be not
	included. Also returns their virtual currency balances.

]]
export type GetCharacterInventoryRequest = {
	--[[
		Unique PlayFab assigned ID for a specific character owned by a user

	]]
	CharacterId: string,
	--[[
		Used to limit results to only those from a specific catalog version.

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

export type UserPrivateAccountInfo = {
	--[[
		user email address

	]]
	Email: string?,
}

export type UnlinkNintendoSwitchDeviceIdRequest = {
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		Nintendo Switch Device identifier for the user. If not specified, the most
		recently signed in device ID will be used.

	]]
	NintendoSwitchDeviceId: string?,
}

--[[
	Facebook sign-in is accomplished using the Facebook User Access Token. More
	information on the Token can be found in the Facebook developer
	documentation
	(https://developers.facebook.com/docs/facebook-login/access-tokens/). In
	Unity, for example, the Token is available as AccessToken in the Facebook
	SDK ScriptableObject FB. If this is the first time a user has signed in with
	the Facebook account and CreateAccount is set to true, a new PlayFab account
	will be created and linked to the provided account's Facebook ID. In this
	case, no email or username will be associated with the PlayFab account.
	Otherwise, if no PlayFab account is linked to the Facebook account, an error
	indicating this will be returned, so that the title can guide the user
	through creation of a PlayFab account. Note that titles should never re-use
	the same Facebook applications between PlayFab Title IDs, as Facebook
	provides unique user IDs per application and doing so can result in issues
	with the Facebook ID for the user in their PlayFab account information. If
	you must re-use an application in a new PlayFab Title ID, please be sure to
	first unlink all accounts from Facebook, or delete all users in the first
	Title ID. Note: If the user is authenticated with AuthenticationToken,
	instead of AccessToken, the GetFriendsList API will return an empty list.

]]
export type LoginWithFacebookRequest = {
	--[[
		Token used for limited login authentication.

	]]
	AuthenticationToken: string?,
	--[[
		Unique identifier from Facebook for the user.

	]]
	AccessToken: string?,
	--[[
		Automatically create a PlayFab account if one is not currently linked to this
		ID.

	]]
	CreateAccount: boolean?,
	--[[
		Unique identifier for the title, found in the Settings > Game Properties
		section of the PlayFab developer site when a title has been selected.

	]]
	TitleId: string,
	InfoRequestParameters: GetPlayerCombinedInfoRequestParams?,
	--[[
		Player secret that is used to verify API request signatures (Enterprise Only).

	]]
	PlayerSecret: string?,
	--[[
		Base64 encoded body that is encrypted with the Title's public RSA key
		(Enterprise Only).

	]]
	EncryptedRequest: string?,
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
	the title can guide the user through creation of a PlayFab account. Please
	note that while multiple devices of this type can be linked to a single user
	account, only the one most recently used to login (or most recently linked)
	will be reflected in the user's account information. We will be updating to
	show all linked devices in a future release.

]]
export type LoginWithIOSDeviceIDRequest = {
	--[[
		Specific Operating System version for the user's device.

	]]
	OS: string?,
	--[[
		Specific model of the user's device.

	]]
	DeviceModel: string?,
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
		Unique identifier for the title, found in the Settings > Game Properties
		section of the PlayFab developer site when a title has been selected.

	]]
	TitleId: string,
	InfoRequestParameters: GetPlayerCombinedInfoRequestParams?,
	--[[
		Vendor-specific iOS identifier for the user's device.

	]]
	DeviceId: string?,
	--[[
		Base64 encoded body that is encrypted with the Title's public RSA key
		(Enterprise Only).

	]]
	EncryptedRequest: string?,
	--[[
		Player secret that is used to verify API request signatures (Enterprise Only).

	]]
	PlayerSecret: string?,
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
	Result for rewarding an ad activity

]]
export type RewardAdActivityResult = {
	--[[
		Id of the placement the reward was for

	]]
	PlacementId: string?,
	--[[
		Details on what was granted to the player

	]]
	RewardResults: AdRewardResults?,
	--[[
		Debug results from the grants

	]]
	DebugResults: { string }?,
	--[[
		PlayStream Event ID that was generated by this reward (all subsequent events
		are associated with this event identifier)

	]]
	AdActivityEventId: string?,
	--[[
		Name of the placement the reward was for

	]]
	PlacementName: string?,
	--[[
		If placement has viewing limits indicates how many views are left

	]]
	PlacementViewsRemaining: number?,
	--[[
		If placement has viewing limits indicates when they will next reset

	]]
	PlacementViewsResetMinutes: number?,
}

--[[
	This API retrieves details regarding the player in the PlayFab service. Note
	that when this call is used to retrieve data about another player (not the
	one signed into the local client), some data, such as Personally Identifying
	Information (PII), will be omitted for privacy reasons or to comply with the
	requirements of the platform belongs to. The user account returned will be
	based on the identifier provided in priority order: PlayFabId, Username,
	Email, then TitleDisplayName. If no identifier is specified, the currently
	signed in user's information will be returned.

]]
export type GetAccountInfoResult = {
	AccountInfo: UserAccountInfo?,
}

--[[
	Details on which placement and reward to perform a grant on

]]
export type RewardAdActivityRequest = {
	--[[
		Placement unique ID

	]]
	PlacementId: string,
	--[[
		Reward unique ID

	]]
	RewardId: string,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type GetPlayFabIDsFromSteamIDsRequest = {
	--[[
		Array of unique Steam identifiers (Steam profile IDs) for which the title
		needs to get PlayFab identifiers. The array cannot exceed 25 in length.

	]]
	SteamStringIDs: { string }?,
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
	Email address and password lengths are provided for information purposes.
	The server will validate that data passed in conforms to the field
	definition and report errors appropriately. It is recommended that
	developers not perform this validation locally, so that future updates do
	not require client updates.

]]
export type LoginWithEmailAddressRequest = {
	--[[
		Password for the PlayFab account (6-100 characters)

	]]
	Password: string,
	--[[
		Unique identifier for the title, found in the Settings > Game Properties
		section of the PlayFab developer site when a title has been selected.

	]]
	TitleId: string,
	InfoRequestParameters: GetPlayerCombinedInfoRequestParams?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		Email address for the account.

	]]
	Email: string,
}

export type GetPlayFabIDsFromBattleNetAccountIdsRequest = {
	--[[
		Array of unique Battle.net account identifiers for which the title needs to
		get PlayFab identifiers. The array cannot exceed 10 in length.

	]]
	BattleNetAccountIds: { string },
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

--[[
	Report ad activity

]]
export type ReportAdActivityRequest = {
	--[[
		Unique ID of the placement to report for

	]]
	PlacementId: string,
	Activity: AdActivity,
	--[[
		Unique ID of the reward the player was offered

	]]
	RewardId: string,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type LinkSteamAccountResult = {
	-- No properties defined in spec
	[string]: any
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

export type AdActivity = 
	| "Opened"
	| "Closed"
	| "Start"
	| "End"

--[[
	More details regarding Twitch and their authentication system can be found
	at https://github.com/justintv/Twitch-API/blob/master/authentication.md.
	Developers must provide the Twitch access token that is generated using one
	of the Twitch authentication flows. PlayFab will use the title's unique
	Twitch Client ID to authenticate the token and log in to the PlayFab system.
	If CreateAccount is set to true and there is not already a user matched to
	the Twitch username that generated the token, then PlayFab will create a new
	account for this user and link the ID. In this case, no email or username
	will be associated with the PlayFab account. If there is already a different
	PlayFab user linked with this account, then an error will be returned.

]]
export type LoginWithTwitchRequest = {
	--[[
		Automatically create a PlayFab account if one is not currently linked to this
		ID.

	]]
	CreateAccount: boolean?,
	--[[
		Token issued by Twitch's API for the user.

	]]
	AccessToken: string?,
	--[[
		Unique identifier for the title, found in the Settings > Game Properties
		section of the PlayFab developer site when a title has been selected.

	]]
	TitleId: string,
	InfoRequestParameters: GetPlayerCombinedInfoRequestParams?,
	--[[
		Player secret that is used to verify API request signatures (Enterprise Only).

	]]
	PlayerSecret: string?,
	--[[
		Base64 encoded body that is encrypted with the Title's public RSA key
		(Enterprise Only).

	]]
	EncryptedRequest: string?,
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
	All items currently in the user inventory will be returned, irrespective of
	how they were acquired (via purchasing, grants, coupons, etc.). Items that
	are expired, fully consumed, or are no longer valid are not considered to be
	in the user's current inventory, and so will not be not included.

]]
export type GetUserInventoryResult = {
	--[[
		Array of inventory items belonging to the user.

	]]
	Inventory: { ItemInstance }?,
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

export type ConsumePS5EntitlementsResult = {
	--[[
		Details for the items purchased.

	]]
	Items: { ItemInstance }?,
}

export type LoginWithOpenIdConnectRequest = {
	--[[
		Automatically create a PlayFab account if one is not currently linked to this
		ID.

	]]
	CreateAccount: boolean?,
	--[[
		A name that identifies which configured OpenID Connect provider relationship
		to use. Maximum 100 characters.

	]]
	ConnectionId: string,
	--[[
		The JSON Web token (JWT) returned by the identity provider after login.
		Represented as the id_token field in the identity provider's response.

	]]
	IdToken: string,
	--[[
		Unique identifier for the title, found in the Settings > Game Properties
		section of the PlayFab developer site when a title has been selected.

	]]
	TitleId: string,
	InfoRequestParameters: GetPlayerCombinedInfoRequestParams?,
	--[[
		Player secret that is used to verify API request signatures (Enterprise Only).

	]]
	PlayerSecret: string?,
	--[[
		Base64 encoded body that is encrypted with the Title's public RSA key
		(Enterprise Only).

	]]
	EncryptedRequest: string?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type UnlinkFacebookAccountResult = {
	-- No properties defined in spec
	[string]: any
}

export type RefreshPSNAuthTokenRequest = {
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
		Auth code returned by PlayStation :tm: Network OAuth system.

	]]
	AuthCode: string,
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
	This function performs an additive update of the arbitrary strings
	containing the custom data for the user. In updating the custom data object,
	keys which already exist in the object will have their values overwritten,
	while keys with null values will be removed. New keys will be added, with
	the given values. No other key-value pairs will be changed apart from those
	specified in the call.

]]
export type UpdateUserDataRequest = {
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
		Indicates whether a given data key is private (readable only by the player) or
		public (readable by all players). When a player makes a GetUserData request
		about another player, only keys marked Public will be returned.

	]]
	Permission: UserDataPermission?,
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

export type AddUsernamePasswordRequest = {
	--[[
		PlayFab username for the account (3-20 characters)

	]]
	Username: string,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		Password for the PlayFab account (6-100 characters)

	]]
	Password: string,
	--[[
		User email address attached to their account

	]]
	Email: string,
}

export type ConsumeXboxEntitlementsRequest = {
	--[[
		Catalog version to use

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
		Token provided by the Xbox Live SDK/XDK method
		GetTokenAndSignatureAsync("POST", "https://playfabapi.com/", "").

	]]
	XboxToken: string,
}

export type LinkFacebookInstantGamesIdResult = {
	-- No properties defined in spec
	[string]: any
}

--[[
	Data is stored as JSON key-value pairs. If the Keys parameter is provided,
	the data object returned will only contain the data specific to the
	indicated Keys. Otherwise, the full set of custom character data will be
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
		Unique PlayFab identifier of the user to load data for. Optional, defaults to
		yourself if not set.

	]]
	PlayFabId: string?,
}

export type PurchaseItemResult = {
	--[[
		Details for the items purchased.

	]]
	Items: { ItemInstance }?,
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

export type UnlinkGooglePlayGamesServicesAccountResult = {
	-- No properties defined in spec
	[string]: any
}

export type GrantCharacterToUserResult = {
	--[[
		Unique identifier tagged to this character.

	]]
	CharacterId: string?,
	--[[
		Indicates whether this character was created successfully.

	]]
	Result: boolean,
	--[[
		Type of character that was created.

	]]
	CharacterType: string?,
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
	Steam authentication is accomplished with the Steam Session Ticket. More
	information on the Ticket can be found in the Steamworks SDK, here:
	https://partner.steamgames.com/documentation/auth (requires sign-in). NOTE:
	For Steam authentication to work, the title must be configured with the
	Steam Application ID and Publisher Key in the PlayFab Game Manager (under
	Properties). Information on creating a Publisher Key (referred to as the
	Secret Key in PlayFab) for your title can be found here:
	https://partner.steamgames.com/documentation/webapi#publisherkey.

]]
export type LinkSteamAccountRequest = {
	--[[
		True if ticket was generated using ISteamUser::GetAuthTicketForWebAPI() using
		"AzurePlayFab" as the identity string. False if the ticket was generated with
		ISteamUser::GetAuthSessionTicket().

	]]
	TicketIsServiceSpecific: boolean?,
	--[[
		Authentication token for the user, returned as a byte array from Steam, and
		converted to a string (for example, the byte 0x08 should become "08").

	]]
	SteamTicket: string,
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

--[[
	For Game Center identifiers which have not been linked to PlayFab accounts,
	null will be returned.

]]
export type GetPlayFabIDsFromGameCenterIDsResult = {
	--[[
		Mapping of Game Center identifiers to PlayFab identifiers.

	]]
	Data: { GameCenterPlayFabIdPair }?,
}

export type RegisterForIOSPushNotificationResult = {
	-- No properties defined in spec
	[string]: any
}

export type GetContentDownloadUrlResult = {
	--[[
		URL for downloading content via HTTP GET or HEAD method. The URL will expire
		in approximately one hour.

	]]
	URL: string?,
}

--[[
	This API removes an existing contact email from the player's profile.

]]
export type RemoveContactEmailRequest = {
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type RemoveContactEmailResult = {
	-- No properties defined in spec
	[string]: any
}

--[[
	Array of AdPlacementDetails

]]
export type GetAdPlacementsResult = {
	--[[
		Array of results

	]]
	AdPlacements: { AdPlacementDetails }?,
}

export type RemoveGenericIDRequest = {
	GenericId: GenericServiceId,
}

export type OpenTradeRequest = {
	--[[
		Player inventory items offered for trade. If not set, the trade is effectively
		a gift request

	]]
	OfferedInventoryInstanceIds: { string }?,
	--[[
		Catalog items accepted for the trade. If not set, the trade is effectively a
		gift.

	]]
	RequestedCatalogItemIds: { string }?,
	--[[
		Players who are allowed to accept the trade. If null, the trade may be
		accepted by any player. If empty, the trade may not be accepted by any player.

	]]
	AllowedPlayerIds: { string }?,
}

--[[
	Returns whatever info is requested in the response for the user. If no user
	is explicitly requested this defaults to the authenticated user. If the user
	is the same as the requester, PII (like email address, facebook id) is
	returned if available. Otherwise, only public information is returned. All
	parameters default to false.

]]
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

--[[
	Players are currently limited to five reports per day. Attempts by a single
	user account to submit reports beyond five will result in Updated being
	returned as false.

]]
export type ReportPlayerClientResult = {
	--[[
		The number of remaining reports which may be filed today.

	]]
	SubmissionsRemaining: number,
}

--[[
	In addition to being available for use by the title, the statistics are used
	for all leaderboard operations in PlayFab.

]]
export type GetPlayerStatisticsResult = {
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
		Base64 encoded body that is encrypted with the Title's public RSA key
		(Enterprise Only).

	]]
	EncryptedRequest: string?,
	--[[
		Player secret that is used to verify API request signatures (Enterprise Only).

	]]
	PlayerSecret: string?,
}

export type UnlinkFacebookInstantGamesIdResult = {
	-- No properties defined in spec
	[string]: any
}

--[[
	Google Play Games sign-in is accomplished by obtaining a Google OAuth 2.0
	credential using the Google Play Games sign-in for Android APIs on the
	device and passing it to this API. If this is the first time a user has
	signed in with the Google Play Games account and CreateAccount is set to
	true, a new PlayFab account will be created and linked to the Google Play
	Games account. Otherwise, if no PlayFab account is linked to the Google Play
	Games account, an error indicating this will be returned, so that the title
	can guide the user through creation of a PlayFab account. The current
	(recommended) method for obtaining a Google Play Games account credential in
	an Android application is to call
	GamesSignInClient.requestServerSideAccess() and send the auth code as the
	ServerAuthCode parameter of this API. Before doing this, you must create an
	OAuth 2.0 web application client ID in the Google API Console and configure
	its client ID and secret in the PlayFab Game Manager Google Add-on for your
	title. This method does not require prompting of the user for additional
	Google account permissions, resulting in a user experience with the least
	possible friction. For more information about obtaining the server auth
	code, see https://developers.google.com/games/services/android/signin.

]]
export type LoginWithGooglePlayGamesServicesRequest = {
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		Automatically create a PlayFab account if one is not currently linked to this
		ID.

	]]
	CreateAccount: boolean?,
	--[[
		Unique identifier for the title, found in the Settings > Game Properties
		section of the PlayFab developer site when a title has been selected.

	]]
	TitleId: string,
	InfoRequestParameters: GetPlayerCombinedInfoRequestParams?,
	--[[
		Player secret that is used to verify API request signatures (Enterprise Only).

	]]
	PlayerSecret: string?,
	--[[
		Base64 encoded body that is encrypted with the Title's public RSA key
		(Enterprise Only).

	]]
	EncryptedRequest: string?,
	--[[
		OAuth 2.0 server authentication code obtained on the client by calling the
		requestServerSideAccess()
		(https://developers.google.com/games/services/android/signin) Google Play
		Games client API.

	]]
	ServerAuthCode: string?,
}

--[[
	For Steam identifiers which have not been linked to PlayFab accounts, or if
	the user has not logged in recently, null will be returned.

]]
export type GetPlayFabIDsFromSteamNamesResult = {
	--[[
		Mapping of Steam identifiers to PlayFab identifiers.

	]]
	Data: { SteamNamePlayFabIdPair }?,
}

--[[
	Report ad activity response has no body

]]
export type ReportAdActivityResult = {
	-- No properties defined in spec
	[string]: any
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
		News item text.

	]]
	Body: string?,
}

export type GetPlayerProfileResult = {
	PlayerProfile: PlayerProfileModel?,
}

export type TransactionStatus = 
	| "CreateCart"
	| "Init"
	| "Approved"
	| "Succeeded"
	| "FailedByProvider"
	| "DisputePending"
	| "RefundPending"
	| "Refunded"
	| "RefundFailed"
	| "ChargedBack"
	| "FailedByUber"
	| "FailedByPlayFab"
	| "Revoked"
	| "TradePending"
	| "Traded"
	| "Upgraded"
	| "StackPending"
	| "Stacked"
	| "Other"
	| "Failed"

export type LinkCustomIDRequest = {
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
	--[[
		If another user is already linked to the custom ID, unlink the other user and
		re-link.

	]]
	ForceLink: boolean?,
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

export type UnlinkAppleRequest = {
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type GetUserInventoryRequest = {
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
	Coupon codes can be created for any item, or set of items, in the catalog
	for the title. This operation causes the coupon to be consumed, and the
	specific items to be awarded to the user. Attempting to re-use an already
	consumed code, or a code which has not yet been created in the service, will
	result in an error.

]]
export type RedeemCouponRequest = {
	--[[
		Catalog version of the coupon. If null, uses the default catalog

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
	Details on what was granted to the player

]]
export type AdRewardResults = {
	--[[
		Dictionary of virtual currencies that were granted to the player

	]]
	GrantedVirtualCurrencies: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		Array of the items granted to the player

	]]
	GrantedItems: { AdRewardItemGranted }?,
	--[[
		Dictionary of statistics that were modified for the player

	]]
	IncrementedStatistics: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type UnlinkFacebookInstantGamesIdRequest = {
	--[[
		Facebook Instant Games identifier for the user. If not specified, the most
		recently signed in ID will be used.

	]]
	FacebookInstantGamesId: string?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type SetPlayerSecretResult = {
	-- No properties defined in spec
	[string]: any
}

export type GetPhotonAuthenticationTokenResult = {
	--[[
		The Photon authentication token for this game-session.

	]]
	PhotonCustomAuthenticationToken: string?,
}

export type GetPlayFabIDsFromKongregateIDsRequest = {
	--[[
		Array of unique Kongregate identifiers (Kongregate's user_id) for which the
		title needs to get PlayFab identifiers. The array cannot exceed 25 in length.

	]]
	KongregateIDs: { string },
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

export type UnlinkGameCenterAccountResult = {
	-- No properties defined in spec
	[string]: any
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
}

export type UnlinkGooglePlayGamesServicesAccountRequest = {
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type LinkCustomIDResult = {
	-- No properties defined in spec
	[string]: any
}

export type UnlinkKongregateAccountResult = {
	-- No properties defined in spec
	[string]: any
}

export type UnlinkGoogleAccountResult = {
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
	If this is the first time a user has signed in with the Xbox Live account
	and CreateAccount is set to true, a new PlayFab account will be created and
	linked to the Xbox Live account. In this case, no email or username will be
	associated with the PlayFab account. Otherwise, if no PlayFab account is
	linked to the Xbox Live account, an error indicating this will be returned,
	so that the title can guide the user through creation of a PlayFab account.

]]
export type LoginWithXboxRequest = {
	--[[
		Unique identifier for the title, found in the Settings > Game Properties
		section of the PlayFab developer site when a title has been selected.

	]]
	TitleId: string,
	--[[
		Automatically create a PlayFab account if one is not currently linked to this
		ID.

	]]
	CreateAccount: boolean?,
	--[[
		Token provided by the Xbox Live SDK/XDK method
		GetTokenAndSignatureAsync("POST", "https://playfabapi.com/", "").

	]]
	XboxToken: string?,
	InfoRequestParameters: GetPlayerCombinedInfoRequestParams?,
	--[[
		Player secret that is used to verify API request signatures (Enterprise Only).

	]]
	PlayerSecret: string?,
	--[[
		Base64 encoded body that is encrypted with the Title's public RSA key
		(Enterprise Only).

	]]
	EncryptedRequest: string?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
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
		Specific Operating System version for the user's device.

	]]
	OS: string?,
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
		Specific model of the user's device.

	]]
	AndroidDevice: string?,
	--[[
		Unique identifier for the title, found in the Settings > Game Properties
		section of the PlayFab developer site when a title has been selected.

	]]
	TitleId: string,
	InfoRequestParameters: GetPlayerCombinedInfoRequestParams?,
	--[[
		Player secret that is used to verify API request signatures (Enterprise Only).

	]]
	PlayerSecret: string?,
	--[[
		Base64 encoded body that is encrypted with the Title's public RSA key
		(Enterprise Only).

	]]
	EncryptedRequest: string?,
	--[[
		Android device identifier for the user's device.

	]]
	AndroidDeviceId: string?,
}

export type UnlinkKongregateAccountRequest = {
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
	For Google identifiers which have not been linked to PlayFab accounts, null
	will be returned.

]]
export type GetPlayFabIDsFromGoogleIDsResult = {
	--[[
		Mapping of Google identifiers to PlayFab identifiers.

	]]
	Data: { GooglePlayFabIdPair }?,
}

export type LinkKongregateAccountRequest = {
	--[[
		Valid session auth ticket issued by Kongregate

	]]
	AuthTicket: string,
	--[[
		Numeric user ID assigned by Kongregate

	]]
	KongregateId: string,
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

export type UnlinkPSNAccountResult = {
	-- No properties defined in spec
	[string]: any
}

export type GetAccountInfoRequest = {
	--[[
		Title-specific username for the account to find (if no Email is set). Note
		that if the non-unique Title Display Names option is enabled for the title,
		attempts to look up users by Title Display Name will always return
		AccountNotFound.

	]]
	TitleDisplayName: string?,
	--[[
		Unique PlayFab identifier of the user whose info is being requested. Optional,
		defaults to the authenticated user if no other lookup identifier set.

	]]
	PlayFabId: string?,
	--[[
		PlayFab Username for the account to find (if no PlayFabId is specified).

	]]
	Username: string?,
	--[[
		User email address for the account to find (if no Username is specified).

	]]
	Email: string?,
}

export type MicrosoftStorePayload = {
	--[[
		Microsoft store ID key. This is optional. Alternatively you can use XboxToken

	]]
	CollectionsMsIdKey: string?,
	--[[
		If collectionsMsIdKey is provided, this will verify the user id in the
		collectionsMsIdKey is the same.

	]]
	UserId: string?,
	--[[
		Token provided by the Xbox Live SDK/XDK method
		GetTokenAndSignatureAsync("POST", "https://playfabapi.com/", ""). This is
		optional. Alternatively can use CollectionsMsIdKey

	]]
	XboxToken: string?,
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

export type UpdateUserTitleDisplayNameResult = {
	--[[
		Current title display name for the user (this will be the original display
		name if the rename attempt failed).

	]]
	DisplayName: string?,
}

export type TradeStatus = 
	| "Invalid"
	| "Opening"
	| "Open"
	| "Accepting"
	| "Accepted"
	| "Filled"
	| "Cancelled"

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

export type GetPlayerSegmentsResult = {
	--[[
		Array of segments the requested player currently belongs to.

	]]
	Segments: { GetSegmentResult }?,
}

export type LinkGoogleAccountResult = {
	-- No properties defined in spec
	[string]: any
}

export type GetCharacterInventoryResult = {
	--[[
		Array of inventory items belonging to the character.

	]]
	Inventory: { ItemInstance }?,
	--[[
		Unique identifier of the character for this inventory.

	]]
	CharacterId: string?,
	--[[
		Array of virtual currency balance(s) belonging to the character.

	]]
	VirtualCurrency: {
		-- No properties defined in spec
		[string]: any
	}?,
	VirtualCurrencyRechargeTimes: VirtualCurrencyRechargeTime?,
}

export type UnlinkIOSDeviceIDRequest = {
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		Vendor-specific iOS identifier for the user's device. If not specified, the
		most recently signed in iOS Device ID will be used.

	]]
	DeviceId: string?,
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

export type UnlinkTwitchAccountResult = {
	-- No properties defined in spec
	[string]: any
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

export type LinkFacebookInstantGamesIdRequest = {
	--[[
		Facebook Instant Games signature for the user.

	]]
	FacebookInstantGamesSignature: string,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		If another user is already linked to the Facebook Instant Games ID, unlink the
		other user and re-link.

	]]
	ForceLink: boolean?,
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
	Enable this option with the 'Allow Client to Post Player Statistics' option
	in PlayFab GameManager for your title. However, this is not best practice,
	as this data will no longer be safely controlled by the server. This
	operation is additive. Statistics not currently defined will be added, while
	those already defined will be updated with the given values. All other user
	statistics will remain unchanged. Note that if the statistic is intended to
	have a reset period, the UpdatePlayerStatisticDefinition API call can be
	used to define that reset period. Once a statistic has been versioned
	(reset), the now-previous version can still be written to for up a short,
	pre-defined period (currently 10 seconds), using the Version parameter in
	this call.

]]
export type UpdatePlayerStatisticsRequest = {
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		Statistics to be updated with the provided values

	]]
	Statistics: { StatisticUpdate },
}

export type EmailVerificationStatus = 
	| "Unverified"
	| "Pending"
	| "Confirmed"

--[[
	Once verified, the catalog item (ItemId) matching the GooglePlay store item
	(productId) will be added to the user's inventory. This result should be
	used for immediate updates to the local client game state as opposed to the
	GetUserInventory API which can have an up to half second delay.

]]
export type ValidateGooglePlayPurchaseResult = {
	--[[
		Fulfilled inventory items and recorded purchases in fulfillment of the
		validated receipt transactions.

	]]
	Fulfillments: { PurchaseReceiptFulfillment }?,
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
		statistics to return (current version will be returned for each)

	]]
	StatisticNames: { string }?,
	--[[
		statistics to return, if StatisticNames is not set (only statistics which have
		a version matching that provided will be returned)

	]]
	StatisticNameVersions: { StatisticNameVersion }?,
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

--[[
	If you have an ad attribution partner enabled, this will post an install to
	their service to track the device. It uses the given device id to match
	based on clicks on ads.

]]
export type AttributeInstallRequest = {
	--[[
		The adid for this device.

	]]
	Adid: string?,
	--[[
		The IdentifierForAdvertisers for iOS Devices.

	]]
	Idfa: string?,
}

export type UnlinkCustomIDRequest = {
	--[[
		Custom unique identifier for the user, generated by the title. If not
		specified, the most recently signed in Custom ID will be used.

	]]
	CustomId: string?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
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
}

export type UnlinkSteamAccountRequest = {
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type LoginWithAppleRequest = {
	--[[
		Automatically create a PlayFab account if one is not currently linked to this
		ID.

	]]
	CreateAccount: boolean?,
	--[[
		Base64 encoded body that is encrypted with the Title's public RSA key
		(Enterprise Only).

	]]
	EncryptedRequest: string?,
	--[[
		Unique identifier for the title, found in the Settings > Game Properties
		section of the PlayFab developer site when a title has been selected.

	]]
	TitleId: string,
	InfoRequestParameters: GetPlayerCombinedInfoRequestParams?,
	--[[
		Player secret that is used to verify API request signatures (Enterprise Only).

	]]
	PlayerSecret: string?,
	--[[
		The JSON Web token (JWT) returned by Apple after login. Represented as the
		identityToken field in the authorization credential payload. If you choose to
		ignore the expiration date for identity tokens, you will receive an
		NotAuthorized error if Apple rotates the signing key. In this case, users have
		to login to provide a fresh identity token.

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

export type TradeInfo = {
	--[[
		The catalogItem Ids requested in exchange.

	]]
	RequestedCatalogItemIds: { string }?,
	--[[
		The PlayFab ID of the player who accepted the trade. If null, no one has
		accepted the trade.

	]]
	AcceptedPlayerId: string?,
	--[[
		If set, The UTC time when this trade was made invalid.

	]]
	InvalidatedAt: string?,
	--[[
		The itemInstance Ids that are being offered.

	]]
	OfferedInventoryInstanceIds: { string }?,
	--[[
		An optional list of players allowed to complete this trade. If null, anybody
		can complete the trade.

	]]
	AllowedPlayerIds: { string }?,
	--[[
		The catalogItem Ids of the item instances being offered.

	]]
	OfferedCatalogItemIds: { string }?,
	--[[
		If set, The UTC time when this trade was fulfilled.

	]]
	FilledAt: string?,
	--[[
		The UTC time when this trade was created.

	]]
	OpenedAt: string?,
	--[[
		The identifier for this trade.

	]]
	TradeId: string?,
	Status: TradeStatus?,
	--[[
		Item instances from the accepting player that are used to fulfill the trade.
		If null, no one has accepted the trade.

	]]
	AcceptedInventoryInstanceIds: { string }?,
	--[[
		If set, The UTC time when this trade was canceled.

	]]
	CancelledAt: string?,
	--[[
		The PlayFabId for the offering player.

	]]
	OfferingPlayerId: string?,
}

export type OpenTradeResponse = {
	Trade: TradeInfo?,
}

export type GetPurchaseRequest = {
	--[[
		Purchase order identifier.

	]]
	OrderId: string,
}

export type UserCustomIdInfo = {
	--[[
		Custom ID

	]]
	CustomId: string?,
}

export type ListPlayerCustomPropertiesRequest = {
	-- No properties defined in spec
	[string]: any
}

--[[
	More information can be found on configuring your game for the Google Cloud
	Messaging service in the Google developer documentation, here:
	http://developer.android.com/google/gcm/client.html. The steps to configure
	and send Push Notifications is described in the PlayFab tutorials, here:
	https://docs.microsoft.com/gaming/playfab/features/engagement/push-notifications/quickstart.

]]
export type AndroidDevicePushNotificationRegistrationRequest = {
	--[[
		Message to display when confirming push notification.

	]]
	ConfirmationMessage: string?,
	--[[
		If true, send a test push message immediately after sucessful registration.
		Defaults to false.

	]]
	SendPushNotificationConfirmation: boolean?,
	--[[
		Registration ID provided by the Google Cloud Messaging service when the title
		registered to receive push notifications (see the GCM documentation, here:
		http://developer.android.com/google/gcm/client.html).

	]]
	DeviceToken: string,
}

export type ConsumePSNEntitlementsResult = {
	--[[
		Array of items granted to the player as a result of consuming entitlements.

	]]
	ItemsGranted: { ItemInstance }?,
}

--[[
	The CurrencyCode and PurchasePrice must match the price which was set up for
	the item in the Apple store. In addition, The ItemId of the inventory in the
	PlayFab Catalog must match the Product ID as it was set up in the Apple
	store. This enables the PlayFab service to securely validate that the
	purchase is for the correct item, in order to prevent uses from passing
	valid receipts as being for more expensive items (passing a receipt for a
	99-cent purchase as being for a $19.99 purchase, for example).

]]
export type ValidateIOSReceiptRequest = {
	--[[
		Amount of the stated currency paid, in centesimal units.

	]]
	PurchasePrice: number,
	--[[
		Currency used to pay for the purchase (ISO 4217 currency code).

	]]
	CurrencyCode: string?,
	--[[
		Catalog version of the fulfilled items. If null, defaults to the primary
		catalog.

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
		Base64 encoded receipt data, passed back by the App Store as a result of a
		successful purchase.

	]]
	ReceiptData: string,
}

export type ValidateWindowsReceiptRequest = {
	--[[
		Amount of the stated currency paid, in centesimal units.

	]]
	PurchasePrice: number,
	--[[
		Currency used to pay for the purchase (ISO 4217 currency code).

	]]
	CurrencyCode: string,
	--[[
		Catalog version of the fulfilled items. If null, defaults to the primary
		catalog.

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
		XML Receipt returned by the Windows App Store in-app purchase API

	]]
	Receipt: string,
}

export type UpdateSharedGroupDataResult = {
	-- No properties defined in spec
	[string]: any
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

export type GetFriendLeaderboardRequest = {
	--[[
		Maximum number of entries to retrieve. Default 10, maximum 100.

	]]
	MaxResultsCount: number?,
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
		The version of the leaderboard to get.

	]]
	Version: number?,
	--[[
		Xbox token if Xbox friends should be included. Requires Xbox be configured on
		PlayFab.

	]]
	XboxToken: string?,
	--[[
		If set to false, Version is considered null. If true, uses the specified
		Version

	]]
	UseSpecificVersion: boolean?,
	--[[
		Statistic used to rank friends for this leaderboard.

	]]
	StatisticName: string,
	ExternalPlatformFriends: ExternalFriendSources?,
	ProfileConstraints: PlayerProfileViewConstraints?,
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



return nil
