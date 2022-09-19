--!strict
--[=[
	# ClientApi

	APIs which provide the full range of PlayFab features available to the client 
	- authentication, account and data management, inventory, friends, matchmaking, 
	reporting, and platform-specific functionality. 
]=]

local PlayFabInternal = require(script.Parent.PlayFabInternal)

local ClientApi = {}

export type AcceptTradeRequest = {
	AcceptedInventoryInstanceIds: {any}?, --- Items from the accepting player's inventory in exchange for the offered items in the trade. In the case of a gift, this will be null.
	OfferingPlayerId: string, --- Player who opened the trade.
	TradeId: string, --- Trade identifier.
}

export type AcceptTradeResponse = {
	Trade: TradeInfo?, --- Details about trade which was just accepted.
}

export type AdActivity = 
	"Opened"
	| "Closed"
	| "Start"
	| "End"

export type AdCampaignAttributionModel = {
	AttributedAt: string, --- UTC time stamp of attribution
	CampaignId: string?, --- Attribution campaign identifier
	Platform: string?, --- Attribution network name
}

--- A single ad placement details including placement and reward information 
export type AdPlacementDetails = {
	PlacementId: string?, --- Placement unique ID
	PlacementName: string?, --- Placement name
	PlacementViewsRemaining: number?, --- If placement has viewing limits indicates how many views are left
	PlacementViewsResetMinutes: number?, --- If placement has viewing limits indicates when they will next reset
	RewardAssetUrl: string?, --- Optional URL to a reward asset
	RewardDescription: string?, --- Reward description
	RewardId: string?, --- Reward unique ID
	RewardName: string?, --- Reward name
}

--- Details for each item granted 
export type AdRewardItemGranted = {
	CatalogId: string?, --- Catalog ID
	DisplayName: string?, --- Catalog item display name
	InstanceId: string?, --- Inventory instance ID
	ItemId: string?, --- Item ID
}

--- Details on what was granted to the player 
export type AdRewardResults = {
	GrantedItems: {AdRewardItemGranted}?, --- Array of the items granted to the player
	GrantedVirtualCurrencies: {[any]: any}?, --- Dictionary of virtual currencies that were granted to the player
	IncrementedStatistics: {[any]: any}?, --- Dictionary of statistics that were modified for the player
}

export type AddFriendRequest = {
	FriendEmail: string?, --- Email address of the user to attempt to add to the local user's friend list.
	FriendPlayFabId: string?, --- PlayFab identifier of the user to attempt to add to the local user's friend list.
	FriendTitleDisplayName: string?, --- Title-specific display name of the user to attempt to add to the local user's friend list.
	FriendUsername: string?, --- PlayFab username of the user to attempt to add to the local user's friend list.
}

export type AddFriendResult = {
	Created: boolean, --- True if the friend request was processed successfully.
}

export type AddGenericIDRequest = {
	GenericId: GenericServiceId, --- Generic service identifier to add to the player account.
}

export type AddGenericIDResult = {
}

--- This API adds a contact email to the player's profile. If the player's profile 
--- already contains a contact email, it will update the contact email to the email 
--- address specified. 
export type AddOrUpdateContactEmailRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	EmailAddress: string, --- The new contact email to associate with the player.
}

export type AddOrUpdateContactEmailResult = {
}

export type AddSharedGroupMembersRequest = {
	PlayFabIds: {any}, --- An array of unique PlayFab assigned ID of the user on whom the operation will be performed.
	SharedGroupId: string, --- Unique identifier for the shared group.
}

export type AddSharedGroupMembersResult = {
}

--- This API must be enabled for use as an option in the game manager website. It 
--- is disabled by default. 
export type AddUserVirtualCurrencyRequest = {
	Amount: number, --- Amount to be added to the user balance of the specified virtual currency.
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	VirtualCurrency: string, --- Name of the virtual currency which is to be incremented.
}

export type AddUsernamePasswordRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	Email: string, --- User email address attached to their account
	Password: string, --- Password for the PlayFab account (6-100 characters)
	Username: string, --- PlayFab username for the account (3-20 characters)
}

--- Each account must have a unique username and email address in the PlayFab service. 
--- Once created, the account may be associated with additional accounts (Steam, 
--- Facebook, Game Center, etc.), allowing for added social network lists and achievements 
--- systems. This can also be used to provide a recovery method if the user loses 
--- their original means of access. 
export type AddUsernamePasswordResult = {
	Username: string?, --- PlayFab unique user name.
}

--- More information can be found on configuring your game for the Google Cloud 
--- Messaging service in the Google developer documentation, here: http://developer.android.com/google/gcm/client.html. 
--- The steps to configure and send Push Notifications is described in the PlayFab 
--- tutorials, here: https://docs.microsoft.com/gaming/playfab/features/engagement/push-notifications/quickstart. 
export type AndroidDevicePushNotificationRegistrationRequest = {
	ConfirmationMessage: string?, --- Message to display when confirming push notification.
	DeviceToken: string, --- Registration ID provided by the Google Cloud Messaging service when the title registered to receive push notifications (see the GCM documentation, here: http://developer.android.com/google/gcm/client.html).
	SendPushNotificationConfirmation: boolean?, --- If true, send a test push message immediately after sucessful registration. Defaults to false.
}

export type AndroidDevicePushNotificationRegistrationResult = {
}

--- The basic wrapper around every failed API response 
export type ApiErrorWrapper = {
	code: number, --- Numerical HTTP code
	error: string?, --- Playfab error code
	errorCode: number, --- Numerical PlayFab error code
	errorDetails: {[any]: any}?, --- Detailed description of individual issues with the request object
	errorMessage: string?, --- Description for the PlayFab errorCode
	status: string?, --- String HTTP code
}

--- If you have an ad attribution partner enabled, this will post an install to 
--- their service to track the device. It uses the given device id to match based 
--- on clicks on ads. 
export type AttributeInstallRequest = {
	Adid: string?, --- The adid for this device.
	Idfa: string?, --- The IdentifierForAdvertisers for iOS Devices.
}

export type AttributeInstallResult = {
}

export type CancelTradeRequest = {
	TradeId: string, --- Trade identifier.
}

export type CancelTradeResponse = {
	Trade: TradeInfo?, --- Details about trade which was just canceled.
}

export type CartItem = {
	Description: string?, --- Description of the catalog item.
	DisplayName: string?, --- Display name for the catalog item.
	ItemClass: string?, --- Class name to which catalog item belongs.
	ItemId: string?, --- Unique identifier for the catalog item.
	ItemInstanceId: string?, --- Unique instance identifier for this catalog item.
	RealCurrencyPrices: {[any]: any}?, --- Cost of the catalog item for each applicable real world currency.
	VCAmount: {[any]: any}?, --- Amount of each applicable virtual currency which will be received as a result of purchasing this catalog item.
	VirtualCurrencyPrices: {[any]: any}?, --- Cost of the catalog item for each applicable virtual currency.
}

--- A purchasable item from the item catalog 
export type CatalogItem = {
	Bundle: CatalogItemBundleInfo?, --- defines the bundle properties for the item - bundles are items which contain other items, including random drop tables and virtual currencies
	CanBecomeCharacter: boolean, --- if true, then an item instance of this type can be used to grant a character to a user.
	CatalogVersion: string?, --- catalog version for this item
	Consumable: CatalogItemConsumableInfo?, --- defines the consumable properties (number of uses, timeout) for the item
	Container: CatalogItemContainerInfo?, --- defines the container properties for the item - what items it contains, including random drop tables and virtual currencies, and what item (if any) is required to open it via the UnlockContainerItem API
	CustomData: string?, --- game specific custom data
	Description: string?, --- text description of item, to show in-game
	DisplayName: string?, --- text name for the item, to show in-game
	InitialLimitedEditionCount: number, --- If the item has IsLImitedEdition set to true, and this is the first time this ItemId has been defined as a limited edition item, this value determines the total number of instances to allocate for the title. Once this limit has been reached, no more instances of this ItemId can be created, and attempts to purchase or grant it will return a Result of false for that ItemId. If the item has already been defined to have a limited edition count, or if this value is less than zero, it will be ignored.
	IsLimitedEdition: boolean, --- BETA: If true, then only a fixed number can ever be granted.
	IsStackable: boolean, --- if true, then only one item instance of this type will exist and its remaininguses will be incremented instead. RemainingUses will cap out at Int32.Max (2,147,483,647). All subsequent increases will be discarded
	IsTradable: boolean, --- if true, then an item instance of this type can be traded between players using the trading APIs
	ItemClass: string?, --- class to which the item belongs
	ItemId: string, --- unique identifier for this item
	ItemImageUrl: string?, --- URL to the item image. For Facebook purchase to display the image on the item purchase page, this must be set to an HTTP URL.
	RealCurrencyPrices: {[any]: any}?, --- override prices for this item for specific currencies
	Tags: {any}?, --- list of item tags
	VirtualCurrencyPrices: {[any]: any}?, --- price of this item in virtual currencies and "RM" (the base Real Money purchase price, in USD pennies)
}

export type CatalogItemBundleInfo = {
	BundledItems: {any}?, --- unique ItemId values for all items which will be added to the player inventory when the bundle is added
	BundledResultTables: {any}?, --- unique TableId values for all RandomResultTable objects which are part of the bundle (random tables will be resolved and add the relevant items to the player inventory when the bundle is added)
	BundledVirtualCurrencies: {[any]: any}?, --- virtual currency types and balances which will be added to the player inventory when the bundle is added
}

export type CatalogItemConsumableInfo = {
	UsageCount: number?, --- number of times this object can be used, after which it will be removed from the player inventory
	UsagePeriod: number?, --- duration in seconds for how long the item will remain in the player inventory - once elapsed, the item will be removed (recommended minimum value is 5 seconds, as lower values can cause the item to expire before operations depending on this item's details have completed)
	UsagePeriodGroup: string?, --- all inventory item instances in the player inventory sharing a non-null UsagePeriodGroup have their UsagePeriod values added together, and share the result - when that period has elapsed, all the items in the group will be removed
}

--- Containers are inventory items that can hold other items defined in the catalog, 
--- as well as virtual currency, which is added to the player inventory when the 
--- container is unlocked, using the UnlockContainerItem API. The items can be anything 
--- defined in the catalog, as well as RandomResultTable objects which will be resolved 
--- when the container is unlocked. Containers and their keys should be defined 
--- as Consumable (having a limited number of uses) in their catalog defintiions, 
--- unless the intent is for the player to be able to re-use them infinitely. 
export type CatalogItemContainerInfo = {
	ItemContents: {any}?, --- unique ItemId values for all items which will be added to the player inventory, once the container has been unlocked
	KeyItemId: string?, --- ItemId for the catalog item used to unlock the container, if any (if not specified, a call to UnlockContainerItem will open the container, adding the contents to the player inventory and currency balances)
	ResultTableContents: {any}?, --- unique TableId values for all RandomResultTable objects which are part of the container (once unlocked, random tables will be resolved and add the relevant items to the player inventory)
	VirtualCurrencyContents: {[any]: any}?, --- virtual currency types and balances which will be added to the player inventory when the container is unlocked
}

export type CharacterInventory = {
	CharacterId: string?, --- The id of this character.
	Inventory: {ItemInstance}?, --- The inventory of this character.
}

export type CharacterLeaderboardEntry = {
	CharacterId: string?, --- PlayFab unique identifier of the character that belongs to the user for this leaderboard entry.
	CharacterName: string?, --- Title-specific display name of the character for this leaderboard entry.
	CharacterType: string?, --- Name of the character class for this entry.
	DisplayName: string?, --- Title-specific display name of the user for this leaderboard entry.
	PlayFabId: string?, --- PlayFab unique identifier of the user for this leaderboard entry.
	Position: number, --- User's overall position in the leaderboard.
	StatValue: number, --- Specific value of the user's statistic.
}

export type CharacterResult = {
	CharacterId: string?, --- The id for this character on this player.
	CharacterName: string?, --- The name of this character.
	CharacterType: string?, --- The type-string that was given to this character on creation.
}

export type CloudScriptRevisionOption = 
	"Live"
	| "Latest"
	| "Specific"

--- Collection filter to include and/or exclude collections with certain key-value 
--- pairs. The filter generates a collection set defined by Includes rules and then 
--- remove collections that matches the Excludes rules. A collection is considered 
--- matching a rule if the rule describes a subset of the collection.  
export type CollectionFilter = {
	Excludes: {Container_Dictionary_String_String}?, --- List of Exclude rules, with any of which if a collection matches, it is excluded by the filter.
	Includes: {Container_Dictionary_String_String}?, --- List of Include rules, with any of which if a collection matches, it is included by the filter, unless it is excluded by one of the Exclude rule
}

--- The final step in the purchasing process, this API finalizes the purchase with 
--- the payment provider, where applicable, adding virtual goods to the player inventory 
--- (including random drop table resolution and recursive addition of bundled items) 
--- and adjusting virtual currency balances for funds used or added. Note that this 
--- is a pull operation, and should be polled regularly when a purchase is in progress. 
--- Please note that the processing time for inventory grants and purchases increases 
--- fractionally the more items are in the inventory, and the more items are in 
--- the grant/purchase operation. 
export type ConfirmPurchaseRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	OrderId: string, --- Purchase order identifier returned from StartPurchase.
}

--- When the FailedByPaymentProvider error is returned, it's important to check 
--- the ProviderErrorCode, ProviderErrorMessage, and ProviderErrorDetails to understand 
--- the specific reason the payment was rejected, as in some rare cases, this may 
--- mean that the provider hasn't completed some operation required to finalize 
--- the purchase. 
export type ConfirmPurchaseResult = {
	Items: {ItemInstance}?, --- Array of items purchased.
	OrderId: string?, --- Purchase order identifier.
	PurchaseDate: string, --- Date and time of the purchase.
}

export type ConsumeItemRequest = {
	CharacterId: string?, --- Unique PlayFab assigned ID for a specific character owned by a user
	ConsumeCount: number, --- Number of uses to consume from the item.
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	ItemInstanceId: string, --- Unique instance identifier of the item to be consumed.
}

export type ConsumeItemResult = {
	ItemInstanceId: string?, --- Unique instance identifier of the item with uses consumed.
	RemainingUses: number, --- Number of uses remaining on the item.
}

export type ConsumeMicrosoftStoreEntitlementsRequest = {
	CatalogVersion: string?, --- Catalog version to use
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	MarketplaceSpecificData: MicrosoftStorePayload, --- Marketplace specific payload containing details to fetch in app purchase transactions
}

export type ConsumeMicrosoftStoreEntitlementsResponse = {
	Items: {ItemInstance}?, --- Details for the items purchased.
}

export type ConsumePS5EntitlementsRequest = {
	CatalogVersion: string?, --- Catalog version to use
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	MarketplaceSpecificData: PlayStation5Payload, --- Marketplace specific payload containing details to fetch in app purchase transactions
}

export type ConsumePS5EntitlementsResult = {
	Items: {ItemInstance}?, --- Details for the items purchased.
}

export type ConsumePSNEntitlementsRequest = {
	CatalogVersion: string?, --- Which catalog to match granted entitlements against. If null, defaults to title default catalog
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	ServiceLabel: number, --- Id of the PlayStation :tm: Network service label to consume entitlements from
}

export type ConsumePSNEntitlementsResult = {
	ItemsGranted: {ItemInstance}?, --- Array of items granted to the player as a result of consuming entitlements.
}

export type ConsumeXboxEntitlementsRequest = {
	CatalogVersion: string?, --- Catalog version to use
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	XboxToken: string, --- Token provided by the Xbox Live SDK/XDK method GetTokenAndSignatureAsync("POST", "https://playfabapi.com/", "").
}

export type ConsumeXboxEntitlementsResult = {
	Items: {ItemInstance}?, --- Details for the items purchased.
}

export type ContactEmailInfoModel = {
	EmailAddress: string?, --- The email address
	Name: string?, --- The name of the email info data
	VerificationStatus: string?, --- The verification status of the email
}

--- A data container 
export type Container_Dictionary_String_String = {
	Data: {[any]: any}?, --- Content of data
}

export type ContinentCode = 
	"AF"
	| "AN"
	| "AS"
	| "EU"
	| "NA"
	| "OC"
	| "SA"

export type CountryCode = 
	"AF"
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

--- If SharedGroupId is specified, the service will attempt to create a group with 
--- that identifier, and will return an error if it is already in use. If no SharedGroupId 
--- is specified, a random identifier will be assigned. 
export type CreateSharedGroupRequest = {
	SharedGroupId: string?, --- Unique identifier for the shared group (a random identifier will be assigned, if one is not specified).
}

export type CreateSharedGroupResult = {
	SharedGroupId: string?, --- Unique identifier for the shared group.
}

export type Currency = 
	"AED"
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

export type CurrentGamesRequest = {
	BuildVersion: string?, --- Build to match against.
	GameMode: string?, --- Game mode to look for.
	Region: string?, --- Region to check for Game Server Instances.
	StatisticName: string?, --- Statistic name to find statistic-based matches.
	TagFilter: CollectionFilter?, --- Filter to include and/or exclude Game Server Instances associated with certain tags.
}

export type CurrentGamesResult = {
	GameCount: number, --- number of games running
	Games: {GameInfo}?, --- array of games found
	PlayerCount: number, --- total number of players across all servers
}

--- Any arbitrary information collected by the device 
export type DeviceInfoRequest = {
	Info: {[any]: any}?, --- Information posted to the PlayStream Event. Currently arbitrary, and specific to the environment sending it.
}

export type EmailVerificationStatus = 
	"Unverified"
	| "Pending"
	| "Confirmed"

export type EmptyResponse = {
}

export type EmptyResult = {
}

--- Combined entity type and ID structure which uniquely identifies a single entity. 
export type EntityKey = {
	Id: string, --- Unique ID of the entity.
	Type: string?, --- Entity type. See https://docs.microsoft.com/gaming/playfab/features/data/entities/available-built-in-entity-types
}

export type EntityTokenResponse = {
	Entity: EntityKey?, --- The entity id and type.
	EntityToken: string?, --- The token used to set X-EntityToken for all entity based API calls.
	TokenExpiration: string?, --- The time the token will expire, if it is an expiring token, in UTC.
}

export type ExecuteCloudScriptRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	FunctionName: string, --- The name of the CloudScript function to execute
	FunctionParameter: {[any]: any}?, --- Object that is passed in to the function as the first argument
	GeneratePlayStreamEvent: boolean?, --- Generate a 'player_executed_cloudscript' PlayStream event containing the results of the function execution and other contextual information. This event will show up in the PlayStream debugger console for the player in Game Manager.
	RevisionSelection: string?, --- Option for which revision of the CloudScript to execute. 'Latest' executes the most recently created revision, 'Live' executes the current live, published revision, and 'Specific' executes the specified revision. The default value is 'Specific', if the SpeificRevision parameter is specified, otherwise it is 'Live'.
	SpecificRevision: number?, --- The specivic revision to execute, when RevisionSelection is set to 'Specific'
}

export type ExecuteCloudScriptResult = {
	APIRequestsIssued: number, --- Number of PlayFab API requests issued by the CloudScript function
	Error: ScriptExecutionError?, --- Information about the error, if any, that occurred during execution
	ExecutionTimeSeconds: number,
	FunctionName: string?, --- The name of the function that executed
	FunctionResult: {[any]: any}?, --- The object returned from the CloudScript function, if any
	FunctionResultTooLarge: boolean?, --- Flag indicating if the FunctionResult was too large and was subsequently dropped from this event. This only occurs if the total event size is larger than 350KB.
	HttpRequestsIssued: number, --- Number of external HTTP requests issued by the CloudScript function
	Logs: {LogStatement}?, --- Entries logged during the function execution. These include both entries logged in the function code using log.info() and log.error() and error entries for API and HTTP request failures.
	LogsTooLarge: boolean?, --- Flag indicating if the logs were too large and were subsequently dropped from this event. This only occurs if the total event size is larger than 350KB after the FunctionResult was removed.
	MemoryConsumedBytes: number,
	ProcessorTimeSeconds: number, --- Processor time consumed while executing the function. This does not include time spent waiting on API calls or HTTP requests.
	Revision: number, --- The revision of the CloudScript that executed
}

export type FacebookInstantGamesPlayFabIdPair = {
	FacebookInstantGamesId: string?, --- Unique Facebook Instant Games identifier for a user.
	PlayFabId: string?, --- Unique PlayFab identifier for a user, or null if no PlayFab account is linked to the Facebook Instant Games identifier.
}

export type FacebookPlayFabIdPair = {
	FacebookId: string?, --- Unique Facebook identifier for a user.
	PlayFabId: string?, --- Unique PlayFab identifier for a user, or null if no PlayFab account is linked to the Facebook identifier.
}

export type FriendInfo = {
	FacebookInfo: UserFacebookInfo?, --- Available Facebook information (if the user and PlayFab friend are also connected in Facebook).
	FriendPlayFabId: string?, --- PlayFab unique identifier for this friend.
	GameCenterInfo: UserGameCenterInfo?, --- Available Game Center information (if the user and PlayFab friend are also connected in Game Center).
	PSNInfo: UserPsnInfo?, --- Available PlayStation :tm: Network information, if the user and PlayFab friend are both connected to PlayStation :tm: Network.
	Profile: PlayerProfileModel?, --- The profile of the user, if requested.
	SteamInfo: UserSteamInfo?, --- Available Steam information (if the user and PlayFab friend are also connected in Steam).
	Tags: {any}?, --- Tags which have been associated with this friend.
	TitleDisplayName: string?, --- Title-specific display name for this friend.
	Username: string?, --- PlayFab unique username for this friend.
	XboxInfo: UserXboxInfo?, --- Available Xbox information, if the user and PlayFab friend are both connected to Xbox Live.
}

export type GameCenterPlayFabIdPair = {
	GameCenterId: string?, --- Unique Game Center identifier for a user.
	PlayFabId: string?, --- Unique PlayFab identifier for a user, or null if no PlayFab account is linked to the Game Center identifier.
}

export type GameInfo = {
	BuildVersion: string?, --- build version this server is running
	GameMode: string?, --- game mode this server is running
	GameServerData: string?, --- game session custom data
	GameServerStateEnum: string?, --- game specific string denoting server configuration
	LastHeartbeat: string?, --- last heartbeat of the game server instance, used in external game server provider mode
	LobbyID: string?, --- unique lobby identifier for this game server
	MaxPlayers: number?, --- maximum players this server can support
	PlayerUserIds: {any}?, --- array of current player IDs on this server
	Region: string?, --- region to which this server is associated
	RunTime: number, --- duration in seconds this server has been running
	ServerIPV4Address: string?, --- IPV4 address of the server
	ServerIPV6Address: string?, --- IPV6 address of the server
	ServerPort: number?, --- port number to use for non-http communications with the server
	ServerPublicDNSName: string?, --- Public DNS name (if any) of the server
	StatisticName: string?, --- stastic used to match this game in player statistic matchmaking
	Tags: {[any]: any}?, --- game session tags
}

export type GameInstanceState = 
	"Open"
	| "Closed"

export type GameServerRegionsRequest = {
	BuildVersion: string, --- version of game server for which stats are being requested
	TitleId: string?, --- Unique identifier for the title, found in the Settings > Game Properties section of the PlayFab developer site when a title has been selected.
}

export type GameServerRegionsResult = {
	Regions: {RegionInfo}?, --- array of regions found matching the request parameters
}

export type GenericPlayFabIdPair = {
	GenericId: GenericServiceId?, --- Unique generic service identifier for a user.
	PlayFabId: string?, --- Unique PlayFab identifier for a user, or null if no PlayFab account is linked to the given generic identifier.
}

export type GenericServiceId = {
	ServiceName: string, --- Name of the service for which the player has a unique identifier.
	UserId: string, --- Unique identifier of the player in that service.
}

export type GetAccountInfoRequest = {
	Email: string?, --- User email address for the account to find (if no Username is specified).
	PlayFabId: string?, --- Unique PlayFab identifier of the user whose info is being requested. Optional, defaults to the authenticated user if no other lookup identifier set.
	TitleDisplayName: string?, --- Title-specific username for the account to find (if no Email is set). Note that if the non-unique Title Display Names option is enabled for the title, attempts to look up users by Title Display Name will always return AccountNotFound.
	Username: string?, --- PlayFab Username for the account to find (if no PlayFabId is specified).
}

--- This API retrieves details regarding the player in the PlayFab service. Note 
--- that when this call is used to retrieve data about another player (not the one 
--- signed into the local client), some data, such as Personally Identifying Information 
--- (PII), will be omitted for privacy reasons or to comply with the requirements 
--- of the platform belongs to. The user account returned will be based on the identifier 
--- provided in priority order: PlayFabId, Username, Email, then TitleDisplayName. 
--- If no identifier is specified, the currently signed in user's information will 
--- be returned. 
export type GetAccountInfoResult = {
	AccountInfo: UserAccountInfo?, --- Account information for the local user.
}

--- Using an AppId to return a list of valid ad placements for a player. 
export type GetAdPlacementsRequest = {
	AppId: string, --- The current AppId to use
	Identifier: NameIdentifier?, --- Using the name or unique identifier, filter the result for get a specific placement.
}

--- Array of AdPlacementDetails 
export type GetAdPlacementsResult = {
	AdPlacements: {AdPlacementDetails}?, --- Array of results
}

export type GetCatalogItemsRequest = {
	CatalogVersion: string?, --- Which catalog is being requested. If null, uses the default catalog.
}

--- If CatalogVersion is not specified, only inventory items associated with the 
--- most recent version of the catalog will be returned. 
export type GetCatalogItemsResult = {
	Catalog: {CatalogItem}?, --- Array of items which can be purchased.
}

--- Data is stored as JSON key-value pairs. If the Keys parameter is provided, the 
--- data object returned will only contain the data specific to the indicated Keys. 
--- Otherwise, the full set of custom character data will be returned. 
export type GetCharacterDataRequest = {
	CharacterId: string, --- Unique PlayFab assigned ID for a specific character owned by a user
	IfChangedFromDataVersion: number?, --- The version that currently exists according to the caller. The call will return the data for all of the keys if the version in the system is greater than this.
	Keys: {any}?, --- Specific keys to search for in the custom user data.
	PlayFabId: string?, --- Unique PlayFab identifier of the user to load data for. Optional, defaults to yourself if not set.
}

export type GetCharacterDataResult = {
	CharacterId: string?, --- Unique PlayFab assigned ID for a specific character owned by a user
	Data: UserDataRecord?, --- User specific data for this title.
	DataVersion: number, --- Indicates the current version of the data that has been set. This is incremented with every set call for that type of data (read-only, internal, etc). This version can be provided in Get calls to find updated data.
}

--- All items currently in the character inventory will be returned, irrespective 
--- of how they were acquired (via purchasing, grants, coupons, etc.). Items that 
--- are expired, fully consumed, or are no longer valid are not considered to be 
--- in the user's current inventory, and so will not be not included. Also returns 
--- their virtual currency balances. 
export type GetCharacterInventoryRequest = {
	CatalogVersion: string?, --- Used to limit results to only those from a specific catalog version.
	CharacterId: string, --- Unique PlayFab assigned ID for a specific character owned by a user
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
}

export type GetCharacterInventoryResult = {
	CharacterId: string?, --- Unique identifier of the character for this inventory.
	Inventory: {ItemInstance}?, --- Array of inventory items belonging to the character.
	VirtualCurrency: {[any]: any}?, --- Array of virtual currency balance(s) belonging to the character.
	VirtualCurrencyRechargeTimes: VirtualCurrencyRechargeTime?, --- Array of remaining times and timestamps for virtual currencies.
}

export type GetCharacterLeaderboardRequest = {
	MaxResultsCount: number?, --- Maximum number of entries to retrieve. Default 10, maximum 100.
	StartPosition: number, --- First entry in the leaderboard to be retrieved.
	StatisticName: string, --- Unique identifier for the title-specific statistic for the leaderboard.
}

--- Note that the Position of the character in the results is for the overall leaderboard. 
export type GetCharacterLeaderboardResult = {
	Leaderboard: {CharacterLeaderboardEntry}?, --- Ordered list of leaderboard entries.
}

export type GetCharacterStatisticsRequest = {
	CharacterId: string, --- Unique PlayFab assigned ID for a specific character owned by a user
}

--- In addition to being available for use by the title, the statistics are used 
--- for all leaderboard operations in PlayFab. 
export type GetCharacterStatisticsResult = {
	CharacterStatistics: {[any]: any}?, --- The requested character statistics.
}

export type GetContentDownloadUrlRequest = {
	HttpMethod: string?, --- HTTP method to fetch item - GET or HEAD. Use HEAD when only fetching metadata. Default is GET.
	Key: string, --- Key of the content item to fetch, usually formatted as a path, e.g. images/a.png
	ThruCDN: boolean?, --- True to download through CDN. CDN provides higher download bandwidth and lower latency. However, if you want the latest, non-cached version of the content during development, set this to false. Default is true.
}

export type GetContentDownloadUrlResult = {
	URL: string?, --- URL for downloading content via HTTP GET or HEAD method. The URL will expire in approximately one hour.
}

export type GetFriendLeaderboardAroundPlayerRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	IncludeFacebookFriends: boolean?, --- Indicates whether Facebook friends should be included in the response. Default is true.
	IncludeSteamFriends: boolean?, --- Indicates whether Steam service friends should be included in the response. Default is true.
	MaxResultsCount: number?, --- Maximum number of entries to retrieve. Default 10, maximum 100.
	PlayFabId: string?, --- PlayFab unique identifier of the user to center the leaderboard around. If null will center on the logged in user.
	ProfileConstraints: PlayerProfileViewConstraints?, --- If non-null, this determines which properties of the resulting player profiles to return. For API calls from the client, only the allowed client profile properties for the title may be requested. These allowed properties are configured in the Game Manager "Client Profile Options" tab in the "Settings" section.
	StatisticName: string, --- Statistic used to rank players for this leaderboard.
	UseSpecificVersion: boolean?, --- If set to false, Version is considered null. If true, uses the specified Version
	Version: number?, --- The version of the leaderboard to get.
	XboxToken: string?, --- Xbox token if Xbox friends should be included. Requires Xbox be configured on PlayFab.
}

--- Note: When calling 'GetLeaderboardAround...' APIs, the position of the user 
--- defaults to 0 when the user does not have the corresponding statistic.If Facebook 
--- friends are included, make sure the access token from previous LoginWithFacebook 
--- call is still valid and not expired. If Xbox Live friends are included, make 
--- sure the access token from the previous LoginWithXbox call is still valid and 
--- not expired.  
export type GetFriendLeaderboardAroundPlayerResult = {
	Leaderboard: {PlayerLeaderboardEntry}?, --- Ordered listing of users and their positions in the requested leaderboard.
	NextReset: string?, --- The time the next scheduled reset will occur. Null if the leaderboard does not reset on a schedule.
	Version: number, --- The version of the leaderboard returned.
}

export type GetFriendLeaderboardRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	IncludeFacebookFriends: boolean?, --- Indicates whether Facebook friends should be included in the response. Default is true.
	IncludeSteamFriends: boolean?, --- Indicates whether Steam service friends should be included in the response. Default is true.
	MaxResultsCount: number?, --- Maximum number of entries to retrieve. Default 10, maximum 100.
	ProfileConstraints: PlayerProfileViewConstraints?, --- If non-null, this determines which properties of the resulting player profiles to return. For API calls from the client, only the allowed client profile properties for the title may be requested. These allowed properties are configured in the Game Manager "Client Profile Options" tab in the "Settings" section.
	StartPosition: number, --- Position in the leaderboard to start this listing (defaults to the first entry).
	StatisticName: string, --- Statistic used to rank friends for this leaderboard.
	UseSpecificVersion: boolean?, --- If set to false, Version is considered null. If true, uses the specified Version
	Version: number?, --- The version of the leaderboard to get.
	XboxToken: string?, --- Xbox token if Xbox friends should be included. Requires Xbox be configured on PlayFab.
}

export type GetFriendsListRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	IncludeFacebookFriends: boolean?, --- Indicates whether Facebook friends should be included in the response. Default is true.
	IncludeSteamFriends: boolean?, --- Indicates whether Steam service friends should be included in the response. Default is true.
	ProfileConstraints: PlayerProfileViewConstraints?, --- If non-null, this determines which properties of the resulting player profiles to return. For API calls from the client, only the allowed client profile properties for the title may be requested. These allowed properties are configured in the Game Manager "Client Profile Options" tab in the "Settings" section.
	XboxToken: string?, --- Xbox token if Xbox friends should be included. Requires Xbox be configured on PlayFab.
}

--- If any additional services are queried for the user's friends, those friends 
--- who also have a PlayFab account registered for the title will be returned in 
--- the results. For Facebook, user has to have logged into the title's Facebook 
--- app recently, and only friends who also plays this game will be included. For 
--- Xbox Live, user has to have logged into the Xbox Live recently, and only friends 
--- who also play this game will be included. 
export type GetFriendsListResult = {
	Friends: {FriendInfo}?, --- Array of friends found.
}

export type GetLeaderboardAroundCharacterRequest = {
	CharacterId: string, --- Unique PlayFab assigned ID for a specific character on which to center the leaderboard.
	MaxResultsCount: number?, --- Maximum number of entries to retrieve. Default 10, maximum 100.
	StatisticName: string, --- Unique identifier for the title-specific statistic for the leaderboard.
}

--- Note: When calling 'GetLeaderboardAround...' APIs, the position of the character 
--- defaults to 0 when the character does not have the corresponding statistic. 
export type GetLeaderboardAroundCharacterResult = {
	Leaderboard: {CharacterLeaderboardEntry}?, --- Ordered list of leaderboard entries.
}

export type GetLeaderboardAroundPlayerRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	MaxResultsCount: number?, --- Maximum number of entries to retrieve. Default 10, maximum 100.
	PlayFabId: string?, --- PlayFab unique identifier of the user to center the leaderboard around. If null will center on the logged in user.
	ProfileConstraints: PlayerProfileViewConstraints?, --- If non-null, this determines which properties of the resulting player profiles to return. For API calls from the client, only the allowed client profile properties for the title may be requested. These allowed properties are configured in the Game Manager "Client Profile Options" tab in the "Settings" section.
	StatisticName: string, --- Statistic used to rank players for this leaderboard.
	UseSpecificVersion: boolean?, --- If set to false, Version is considered null. If true, uses the specified Version
	Version: number?, --- The version of the leaderboard to get.
}

--- Note: When calling 'GetLeaderboardAround...' APIs, the position of the user 
--- defaults to 0 when the user does not have the corresponding statistic. 
export type GetLeaderboardAroundPlayerResult = {
	Leaderboard: {PlayerLeaderboardEntry}?, --- Ordered listing of users and their positions in the requested leaderboard.
	NextReset: string?, --- The time the next scheduled reset will occur. Null if the leaderboard does not reset on a schedule.
	Version: number, --- The version of the leaderboard returned.
}

export type GetLeaderboardForUsersCharactersRequest = {
	StatisticName: string, --- Unique identifier for the title-specific statistic for the leaderboard.
}

--- NOTE: The position of the character in the results is relative to the other 
--- characters for that specific user. This mean the values will always be between 
--- 0 and one less than the number of characters returned regardless of the size 
--- of the actual leaderboard. 
export type GetLeaderboardForUsersCharactersResult = {
	Leaderboard: {CharacterLeaderboardEntry}?, --- Ordered list of leaderboard entries.
}

export type GetLeaderboardRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	MaxResultsCount: number?, --- Maximum number of entries to retrieve. Default 10, maximum 100.
	ProfileConstraints: PlayerProfileViewConstraints?, --- If non-null, this determines which properties of the resulting player profiles to return. For API calls from the client, only the allowed client profile properties for the title may be requested. These allowed properties are configured in the Game Manager "Client Profile Options" tab in the "Settings" section.
	StartPosition: number, --- Position in the leaderboard to start this listing (defaults to the first entry).
	StatisticName: string, --- Statistic used to rank players for this leaderboard.
	UseSpecificVersion: boolean?, --- If set to false, Version is considered null. If true, uses the specified Version
	Version: number?, --- The version of the leaderboard to get.
}

--- Note: the user's Position is relative to the overall leaderboard. 
export type GetLeaderboardResult = {
	Leaderboard: {PlayerLeaderboardEntry}?, --- Ordered listing of users and their positions in the requested leaderboard.
	NextReset: string?, --- The time the next scheduled reset will occur. Null if the leaderboard does not reset on a schedule.
	Version: number, --- The version of the leaderboard returned.
}

export type GetPaymentTokenRequest = {
	TokenProvider: string, --- The name of service to provide the payment token. Allowed Values are: xsolla
}

export type GetPaymentTokenResult = {
	OrderId: string?, --- PlayFab's purchase order identifier.
	ProviderToken: string?, --- The token from provider.
}

export type GetPhotonAuthenticationTokenRequest = {
	PhotonApplicationId: string, --- The Photon applicationId for the game you wish to log into.
}

export type GetPhotonAuthenticationTokenResult = {
	PhotonCustomAuthenticationToken: string?, --- The Photon authentication token for this game-session.
}

export type GetPlayFabIDsFromFacebookIDsRequest = {
	FacebookIDs: {any}, --- Array of unique Facebook identifiers for which the title needs to get PlayFab identifiers.
}

--- For Facebook identifiers which have not been linked to PlayFab accounts, null 
--- will be returned. 
export type GetPlayFabIDsFromFacebookIDsResult = {
	Data: {FacebookPlayFabIdPair}?, --- Mapping of Facebook identifiers to PlayFab identifiers.
}

export type GetPlayFabIDsFromFacebookInstantGamesIdsRequest = {
	FacebookInstantGamesIds: {any}, --- Array of unique Facebook Instant Games identifiers for which the title needs to get PlayFab identifiers.
}

--- For Facebook Instant Game identifiers which have not been linked to PlayFab 
--- accounts, null will be returned. 
export type GetPlayFabIDsFromFacebookInstantGamesIdsResult = {
	Data: {FacebookInstantGamesPlayFabIdPair}?, --- Mapping of Facebook Instant Games identifiers to PlayFab identifiers.
}

export type GetPlayFabIDsFromGameCenterIDsRequest = {
	GameCenterIDs: {any}, --- Array of unique Game Center identifiers (the Player Identifier) for which the title needs to get PlayFab identifiers.
}

--- For Game Center identifiers which have not been linked to PlayFab accounts, 
--- null will be returned. 
export type GetPlayFabIDsFromGameCenterIDsResult = {
	Data: {GameCenterPlayFabIdPair}?, --- Mapping of Game Center identifiers to PlayFab identifiers.
}

export type GetPlayFabIDsFromGenericIDsRequest = {
	GenericIDs: {GenericServiceId}, --- Array of unique generic service identifiers for which the title needs to get PlayFab identifiers. Currently limited to a maximum of 10 in a single request.
}

--- For generic service identifiers which have not been linked to PlayFab accounts, 
--- null will be returned. 
export type GetPlayFabIDsFromGenericIDsResult = {
	Data: {GenericPlayFabIdPair}?, --- Mapping of generic service identifiers to PlayFab identifiers.
}

export type GetPlayFabIDsFromGoogleIDsRequest = {
	GoogleIDs: {any}, --- Array of unique Google identifiers (Google+ user IDs) for which the title needs to get PlayFab identifiers.
}

--- For Google identifiers which have not been linked to PlayFab accounts, null 
--- will be returned. 
export type GetPlayFabIDsFromGoogleIDsResult = {
	Data: {GooglePlayFabIdPair}?, --- Mapping of Google identifiers to PlayFab identifiers.
}

export type GetPlayFabIDsFromGooglePlayGamesPlayerIDsRequest = {
	GooglePlayGamesPlayerIDs: {any}, --- Array of unique Google Play Games identifiers (Google+ user IDs) for which the title needs to get PlayFab identifiers.
}

--- For Google Play Games identifiers which have not been linked to PlayFab accounts, 
--- null will be returned. 
export type GetPlayFabIDsFromGooglePlayGamesPlayerIDsResult = {
	Data: {GooglePlayGamesPlayFabIdPair}?, --- Mapping of Google Play Games identifiers to PlayFab identifiers.
}

export type GetPlayFabIDsFromKongregateIDsRequest = {
	KongregateIDs: {any}, --- Array of unique Kongregate identifiers (Kongregate's user_id) for which the title needs to get PlayFab identifiers.
}

--- For Kongregate identifiers which have not been linked to PlayFab accounts, null 
--- will be returned. 
export type GetPlayFabIDsFromKongregateIDsResult = {
	Data: {KongregatePlayFabIdPair}?, --- Mapping of Kongregate identifiers to PlayFab identifiers.
}

export type GetPlayFabIDsFromNintendoServiceAccountIdsRequest = {
	NintendoAccountIds: {any}, --- Array of unique Nintendo Switch Account identifiers for which the title needs to get PlayFab identifiers.
}

--- For Nintendo Service Account identifiers which have not been linked to PlayFab 
--- accounts, null will be returned. 
export type GetPlayFabIDsFromNintendoServiceAccountIdsResult = {
	Data: {NintendoServiceAccountPlayFabIdPair}?, --- Mapping of Nintendo Switch Service Account identifiers to PlayFab identifiers.
}

export type GetPlayFabIDsFromNintendoSwitchDeviceIdsRequest = {
	NintendoSwitchDeviceIds: {any}, --- Array of unique Nintendo Switch Device identifiers for which the title needs to get PlayFab identifiers.
}

--- For Nintendo Switch identifiers which have not been linked to PlayFab accounts, 
--- null will be returned. 
export type GetPlayFabIDsFromNintendoSwitchDeviceIdsResult = {
	Data: {NintendoSwitchPlayFabIdPair}?, --- Mapping of Nintendo Switch Device identifiers to PlayFab identifiers.
}

export type GetPlayFabIDsFromPSNAccountIDsRequest = {
	IssuerId: number?, --- Id of the PlayStation :tm: Network issuer environment. If null, defaults to production environment.
	PSNAccountIDs: {any}, --- Array of unique PlayStation :tm: Network identifiers for which the title needs to get PlayFab identifiers.
}

--- For PlayStation :tm: Network identifiers which have not been linked to PlayFab 
--- accounts, null will be returned. 
export type GetPlayFabIDsFromPSNAccountIDsResult = {
	Data: {PSNAccountPlayFabIdPair}?, --- Mapping of PlayStation :tm: Network identifiers to PlayFab identifiers.
}

export type GetPlayFabIDsFromSteamIDsRequest = {
	SteamStringIDs: {any}?, --- Array of unique Steam identifiers (Steam profile IDs) for which the title needs to get PlayFab identifiers.
}

--- For Steam identifiers which have not been linked to PlayFab accounts, null will 
--- be returned. 
export type GetPlayFabIDsFromSteamIDsResult = {
	Data: {SteamPlayFabIdPair}?, --- Mapping of Steam identifiers to PlayFab identifiers.
}

export type GetPlayFabIDsFromTwitchIDsRequest = {
	TwitchIds: {any}, --- Array of unique Twitch identifiers (Twitch's _id) for which the title needs to get PlayFab identifiers.
}

--- For Twitch identifiers which have not been linked to PlayFab accounts, null 
--- will be returned. 
export type GetPlayFabIDsFromTwitchIDsResult = {
	Data: {TwitchPlayFabIdPair}?, --- Mapping of Twitch identifiers to PlayFab identifiers.
}

export type GetPlayFabIDsFromXboxLiveIDsRequest = {
	Sandbox: string?, --- The ID of Xbox Live sandbox.
	XboxLiveAccountIDs: {any}, --- Array of unique Xbox Live account identifiers for which the title needs to get PlayFab identifiers.
}

--- For XboxLive identifiers which have not been linked to PlayFab accounts, null 
--- will be returned. 
export type GetPlayFabIDsFromXboxLiveIDsResult = {
	Data: {XboxLiveAccountPlayFabIdPair}?, --- Mapping of Xbox Live identifiers to PlayFab identifiers.
}

export type GetPlayerCombinedInfoRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	InfoRequestParameters: GetPlayerCombinedInfoRequestParams, --- Flags for which pieces of info to return for the user.
	PlayFabId: string?, --- PlayFabId of the user whose data will be returned. If not filled included, we return the data for the calling player. 
}

export type GetPlayerCombinedInfoRequestParams = {
	GetCharacterInventories: boolean, --- Whether to get character inventories. Defaults to false.
	GetCharacterList: boolean, --- Whether to get the list of characters. Defaults to false.
	GetPlayerProfile: boolean, --- Whether to get player profile. Defaults to false. Has no effect for a new player.
	GetPlayerStatistics: boolean, --- Whether to get player statistics. Defaults to false.
	GetTitleData: boolean, --- Whether to get title data. Defaults to false.
	GetUserAccountInfo: boolean, --- Whether to get the player's account Info. Defaults to false
	GetUserData: boolean, --- Whether to get the player's custom data. Defaults to false
	GetUserInventory: boolean, --- Whether to get the player's inventory. Defaults to false
	GetUserReadOnlyData: boolean, --- Whether to get the player's read only data. Defaults to false
	GetUserVirtualCurrency: boolean, --- Whether to get the player's virtual currency balances. Defaults to false
	PlayerStatisticNames: {any}?, --- Specific statistics to retrieve. Leave null to get all keys. Has no effect if GetPlayerStatistics is false
	ProfileConstraints: PlayerProfileViewConstraints?, --- Specifies the properties to return from the player profile. Defaults to returning the player's display name.
	TitleDataKeys: {any}?, --- Specific keys to search for in the custom data. Leave null to get all keys. Has no effect if GetTitleData is false
	UserDataKeys: {any}?, --- Specific keys to search for in the custom data. Leave null to get all keys. Has no effect if GetUserData is false
	UserReadOnlyDataKeys: {any}?, --- Specific keys to search for in the custom data. Leave null to get all keys. Has no effect if GetUserReadOnlyData is false
}

--- Returns whatever info is requested in the response for the user. If no user 
--- is explicitly requested this defaults to the authenticated user. If the user 
--- is the same as the requester, PII (like email address, facebook id) is returned 
--- if available. Otherwise, only public information is returned. All parameters 
--- default to false. 
export type GetPlayerCombinedInfoResult = {
	InfoResultPayload: GetPlayerCombinedInfoResultPayload?, --- Results for requested info.
	PlayFabId: string?, --- Unique PlayFab assigned ID of the user on whom the operation will be performed.
}

export type GetPlayerCombinedInfoResultPayload = {
	AccountInfo: UserAccountInfo?, --- Account information for the user. This is always retrieved.
	CharacterInventories: {CharacterInventory}?, --- Inventories for each character for the user.
	CharacterList: {CharacterResult}?, --- List of characters for the user.
	PlayerProfile: PlayerProfileModel?, --- The profile of the players. This profile is not guaranteed to be up-to-date. For a new player, this profile will not exist.
	PlayerStatistics: {StatisticValue}?, --- List of statistics for this player.
	TitleData: {[any]: any}?, --- Title data for this title.
	UserData: UserDataRecord?, --- User specific custom data.
	UserDataVersion: number, --- The version of the UserData that was returned.
	UserInventory: {ItemInstance}?, --- Array of inventory items in the user's current inventory.
	UserReadOnlyData: UserDataRecord?, --- User specific read-only data.
	UserReadOnlyDataVersion: number, --- The version of the Read-Only UserData that was returned.
	UserVirtualCurrency: {[any]: any}?, --- Dictionary of virtual currency balance(s) belonging to the user.
	UserVirtualCurrencyRechargeTimes: VirtualCurrencyRechargeTime?, --- Dictionary of remaining times and timestamps for virtual currencies.
}

--- This API allows for access to details regarding a user in the PlayFab service, 
--- usually for purposes of customer support. Note that data returned may be Personally 
--- Identifying Information (PII), such as email address, and so care should be 
--- taken in how this data is stored and managed. Since this call will always return 
--- the relevant information for users who have accessed the title, the recommendation 
--- is to not store this data locally. 
export type GetPlayerProfileRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	PlayFabId: string?, --- Unique PlayFab assigned ID of the user on whom the operation will be performed.
	ProfileConstraints: PlayerProfileViewConstraints?, --- If non-null, this determines which properties of the resulting player profiles to return. For API calls from the client, only the allowed client profile properties for the title may be requested. These allowed properties are configured in the Game Manager "Client Profile Options" tab in the "Settings" section.
}

export type GetPlayerProfileResult = {
	PlayerProfile: PlayerProfileModel?, --- The profile of the player. This profile is not guaranteed to be up-to-date. For a new player, this profile will not exist.
}

export type GetPlayerSegmentsRequest = {
}

export type GetPlayerSegmentsResult = {
	Segments: {GetSegmentResult}?, --- Array of segments the requested player currently belongs to.
}

export type GetPlayerStatisticVersionsRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	StatisticName: string?, --- unique name of the statistic
}

export type GetPlayerStatisticVersionsResult = {
	StatisticVersions: {PlayerStatisticVersion}?, --- version change history of the statistic
}

export type GetPlayerStatisticsRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	StatisticNameVersions: {StatisticNameVersion}?, --- statistics to return, if StatisticNames is not set (only statistics which have a version matching that provided will be returned)
	StatisticNames: {any}?, --- statistics to return (current version will be returned for each)
}

--- In addition to being available for use by the title, the statistics are used 
--- for all leaderboard operations in PlayFab. 
export type GetPlayerStatisticsResult = {
	Statistics: {StatisticValue}?, --- User statistics for the requested user.
}

--- This API will return a list of canonical tags which includes both namespace 
--- and tag's name. If namespace is not provided, the result is a list of all canonical 
--- tags. TagName can be used for segmentation and Namespace is limited to 128 characters. 
export type GetPlayerTagsRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	Namespace: string?, --- Optional namespace to filter results by
	PlayFabId: string, --- Unique PlayFab assigned ID of the user on whom the operation will be performed.
}

export type GetPlayerTagsResult = {
	PlayFabId: string, --- Unique PlayFab assigned ID of the user on whom the operation will be performed.
	Tags: {any}, --- Canonical tags (including namespace and tag's name) for the requested user
}

export type GetPlayerTradesRequest = {
	StatusFilter: string?, --- Returns only trades with the given status. If null, returns all trades.
}

export type GetPlayerTradesResponse = {
	AcceptedTrades: {TradeInfo}?, --- History of trades which this player has accepted.
	OpenedTrades: {TradeInfo}?, --- The trades for this player which are currently available to be accepted.
}

--- This API is designed to return publisher-specific values which can be read, 
--- but not written to, by the client. This data is shared across all titles assigned 
--- to a particular publisher, and can be used for cross-game coordination. Only 
--- titles assigned to a publisher can use this API. For more information email 
--- helloplayfab@microsoft.com. Note that there may up to a minute delay in between 
--- updating title data and this API call returning the newest value. 
export type GetPublisherDataRequest = {
	Keys: {any}, ---  array of keys to get back data from the Publisher data blob, set by the admin tools
}

export type GetPublisherDataResult = {
	Data: {[any]: any}?, --- a dictionary object of key / value pairs
}

export type GetPurchaseRequest = {
	OrderId: string, --- Purchase order identifier.
}

export type GetPurchaseResult = {
	OrderId: string?, --- Purchase order identifier.
	PaymentProvider: string?, --- Payment provider used for transaction (If not VC)
	PurchaseDate: string, --- Date and time of the purchase.
	TransactionId: string?, --- Provider transaction ID (If not VC)
	TransactionStatus: string?, --- PlayFab transaction status
}

export type GetSegmentResult = {
	ABTestParent: string?, --- Identifier of the segments AB Test, if it is attached to one.
	Id: string, --- Unique identifier for this segment.
	Name: string?, --- Segment name.
}

export type GetSharedGroupDataRequest = {
	GetMembers: boolean?, --- If true, return the list of all members of the shared group.
	Keys: {any}?, --- Specific keys to retrieve from the shared group (if not specified, all keys will be returned, while an empty array indicates that no keys should be returned).
	SharedGroupId: string, --- Unique identifier for the shared group.
}

export type GetSharedGroupDataResult = {
	Data: SharedGroupDataRecord?, --- Data for the requested keys.
	Members: {any}?, --- List of PlayFabId identifiers for the members of this group, if requested.
}

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
export type GetStoreItemsRequest = {
	CatalogVersion: string?, --- Catalog version to store items from. Use default catalog version if null
	StoreId: string, --- Unqiue identifier for the store which is being requested.
}

export type GetStoreItemsResult = {
	CatalogVersion: string?, --- The base catalog that this store is a part of.
	MarketingData: StoreMarketingModel?, --- Additional data about the store.
	Source: string?, --- How the store was last updated (Admin or a third party).
	Store: {StoreItem}?, --- Array of items which can be purchased from this store.
	StoreId: string?, --- The ID of this store.
}

--- This query retrieves the current time from one of the servers in PlayFab. Please 
--- note that due to clock drift between servers, there is a potential variance 
--- of up to 5 seconds. 
export type GetTimeRequest = {
}

--- Time is always returned as Coordinated Universal Time (UTC). 
export type GetTimeResult = {
	Time: string, --- Current server time when the request was received, in UTC
}

--- This API is designed to return title specific values which can be read, but 
--- not written to, by the client. For example, a developer could choose to store 
--- values which modify the user experience, such as enemy spawn rates, weapon strengths, 
--- movement speeds, etc. This allows a developer to update the title without the 
--- need to create, test, and ship a new build. If the player belongs to an experiment 
--- variant that uses title data overrides, the overrides are applied automatically 
--- and returned with the title data. Note that there may up to a minute delay in 
--- between updating title data and this API call returning the newest value. 
export type GetTitleDataRequest = {
	Keys: {any}?, --- Specific keys to search for in the title data (leave null to get all keys)
	OverrideLabel: string?, --- Optional field that specifies the name of an override. This value is ignored when used by the game client; otherwise, the overrides are applied automatically to the title data.
}

export type GetTitleDataResult = {
	Data: {[any]: any}?, --- a dictionary object of key / value pairs
}

export type GetTitleNewsRequest = {
	Count: number?, --- Limits the results to the last n entries. Defaults to 10 if not set.
}

export type GetTitleNewsResult = {
	News: {TitleNewsItem}?, --- Array of news items.
}

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
export type GetTitlePublicKeyRequest = {
	TitleId: string, --- Unique identifier for the title, found in the Settings > Game Properties section of the PlayFab developer site when a title has been selected.
	TitleSharedSecret: string, --- The shared secret key for this title
}

export type GetTitlePublicKeyResult = {
	RSAPublicKey: string?, --- Base64 encoded RSA CSP byte array blob containing the title's public RSA key
}

export type GetTradeStatusRequest = {
	OfferingPlayerId: string, --- Player who opened trade.
	TradeId: string, --- Trade identifier as returned by OpenTradeOffer.
}

export type GetTradeStatusResponse = {
	Trade: TradeInfo?, --- Information about the requested trade.
}

--- Data is stored as JSON key-value pairs. Every time the data is updated via any 
--- source, the version counter is incremented. If the Version parameter is provided, 
--- then this call will only return data if the current version on the system is 
--- greater than the value provided. If the Keys parameter is provided, the data 
--- object returned will only contain the data specific to the indicated Keys. Otherwise, 
--- the full set of custom user data will be returned. 
export type GetUserDataRequest = {
	IfChangedFromDataVersion: number?, --- The version that currently exists according to the caller. The call will return the data for all of the keys if the version in the system is greater than this.
	Keys: {any}?, --- List of unique keys to load from.
	PlayFabId: string?, --- Unique PlayFab identifier of the user to load data for. Optional, defaults to yourself if not set. When specified to a PlayFab id of another player, then this will only return public keys for that account.
}

export type GetUserDataResult = {
	Data: UserDataRecord?, --- User specific data for this title.
	DataVersion: number, --- Indicates the current version of the data that has been set. This is incremented with every set call for that type of data (read-only, internal, etc). This version can be provided in Get calls to find updated data.
}

export type GetUserInventoryRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
}

--- All items currently in the user inventory will be returned, irrespective of 
--- how they were acquired (via purchasing, grants, coupons, etc.). Items that are 
--- expired, fully consumed, or are no longer valid are not considered to be in 
--- the user's current inventory, and so will not be not included. 
export type GetUserInventoryResult = {
	Inventory: {ItemInstance}?, --- Array of inventory items belonging to the user.
	VirtualCurrency: {[any]: any}?, --- Array of virtual currency balance(s) belonging to the user.
	VirtualCurrencyRechargeTimes: VirtualCurrencyRechargeTime?, --- Array of remaining times and timestamps for virtual currencies.
}

export type GooglePlayFabIdPair = {
	GoogleId: string?, --- Unique Google identifier for a user.
	PlayFabId: string?, --- Unique PlayFab identifier for a user, or null if no PlayFab account is linked to the Google identifier.
}

export type GooglePlayGamesPlayFabIdPair = {
	GooglePlayGamesPlayerId: string?, --- Unique Google Play Games identifier for a user.
	PlayFabId: string?, --- Unique PlayFab identifier for a user, or null if no PlayFab account is linked to the Google Play Games identifier.
}

--- Grants a character to the user of the type specified by the item ID. The user 
--- must already have an instance of this item in their inventory in order to allow 
--- character creation. This item can come from a purchase or grant, which must 
--- be done before calling to create the character. 
export type GrantCharacterToUserRequest = {
	CatalogVersion: string?, --- Catalog version from which items are to be granted.
	CharacterName: string, --- Non-unique display name of the character being granted (1-40 characters in length).
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	ItemId: string, --- Catalog item identifier of the item in the user's inventory that corresponds to the character in the catalog to be created.
}

export type GrantCharacterToUserResult = {
	CharacterId: string?, --- Unique identifier tagged to this character.
	CharacterType: string?, --- Type of character that was created.
	Result: boolean, --- Indicates whether this character was created successfully.
}

--- A unique instance of an item in a user's inventory. Note, to retrieve additional 
--- information for an item such as Tags, Description that are the same across all 
--- instances of the item, a call to GetCatalogItems is required. The ItemID of 
--- can be matched to a catalog entry, which contains the additional information. 
--- Also note that Custom Data is only set when the User's specific instance has 
--- updated the CustomData via a call to UpdateUserInventoryItemCustomData. Other 
--- fields such as UnitPrice and UnitCurrency are only set when the item was granted 
--- via a purchase. 
export type ItemInstance = {
	Annotation: string?, --- Game specific comment associated with this instance when it was added to the user inventory.
	BundleContents: {any}?, --- Array of unique items that were awarded when this catalog item was purchased.
	BundleParent: string?, --- Unique identifier for the parent inventory item, as defined in the catalog, for object which were added from a bundle or container.
	CatalogVersion: string?, --- Catalog version for the inventory item, when this instance was created.
	CustomData: {[any]: any}?, --- A set of custom key-value pairs on the instance of the inventory item, which is not to be confused with the catalog item's custom data.
	DisplayName: string?, --- CatalogItem.DisplayName at the time this item was purchased.
	Expiration: string?, --- Timestamp for when this instance will expire.
	ItemClass: string?, --- Class name for the inventory item, as defined in the catalog.
	ItemId: string?, --- Unique identifier for the inventory item, as defined in the catalog.
	ItemInstanceId: string?, --- Unique item identifier for this specific instance of the item.
	PurchaseDate: string?, --- Timestamp for when this instance was purchased.
	RemainingUses: number?, --- Total number of remaining uses, if this is a consumable item.
	UnitCurrency: string?, --- Currency type for the cost of the catalog item. Not available when granting items.
	UnitPrice: number, --- Cost of the catalog item in the given currency. Not available when granting items.
	UsesIncrementedBy: number?, --- The number of uses that were added or removed to this item in this call.
}

export type ItemPurchaseRequest = {
	Annotation: string?, --- Title-specific text concerning this purchase.
	ItemId: string, --- Unique ItemId of the item to purchase.
	Quantity: number, --- How many of this item to purchase. Min 1, maximum 25.
	UpgradeFromItems: {any}?, --- Items to be upgraded as a result of this purchase (upgraded items are hidden, as they are "replaced" by the new items).
}

export type KongregatePlayFabIdPair = {
	KongregateId: string?, --- Unique Kongregate identifier for a user.
	PlayFabId: string?, --- Unique PlayFab identifier for a user, or null if no PlayFab account is linked to the Kongregate identifier.
}

export type LinkAndroidDeviceIDRequest = {
	AndroidDevice: string?, --- Specific model of the user's device.
	AndroidDeviceId: string, --- Android device identifier for the user's device.
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	ForceLink: boolean?, --- If another user is already linked to the device, unlink the other user and re-link.
	OS: string?, --- Specific Operating System version for the user's device.
}

export type LinkAndroidDeviceIDResult = {
}

export type LinkAppleRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	ForceLink: boolean?, --- If another user is already linked to a specific Apple account, unlink the other user and re-link.
	IdentityToken: string, --- The JSON Web token (JWT) returned by Apple after login. Represented as the identityToken field in the authorization credential payload. Used to validate the request and find the user ID (Apple subject) to link with.
}

export type LinkCustomIDRequest = {
	CustomId: string, --- Custom unique identifier for the user, generated by the title.
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	ForceLink: boolean?, --- If another user is already linked to the custom ID, unlink the other user and re-link.
}

export type LinkCustomIDResult = {
}

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
export type LinkFacebookAccountRequest = {
	AccessToken: string, --- Unique identifier from Facebook for the user.
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	ForceLink: boolean?, --- If another user is already linked to the account, unlink the other user and re-link.
}

export type LinkFacebookAccountResult = {
}

export type LinkFacebookInstantGamesIdRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	FacebookInstantGamesSignature: string, --- Facebook Instant Games signature for the user.
	ForceLink: boolean?, --- If another user is already linked to the Facebook Instant Games ID, unlink the other user and re-link.
}

export type LinkFacebookInstantGamesIdResult = {
}

export type LinkGameCenterAccountRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	ForceLink: boolean?, --- If another user is already linked to the account, unlink the other user and re-link. If the current user is already linked, link both accounts
	GameCenterId: string, --- Game Center identifier for the player account to be linked.
	PublicKeyUrl: string?, --- The URL for the public encryption key that will be used to verify the signature.
	Salt: string?, --- A random value used to compute the hash and keep it randomized.
	Signature: string?, --- The verification signature of the authentication payload.
	Timestamp: string?, --- The integer representation of date and time that the signature was created on. PlayFab will reject authentication signatures not within 10 minutes of the server's current time.
}

export type LinkGameCenterAccountResult = {
}

--- Google sign-in is accomplished by obtaining a Google OAuth 2.0 credential using 
--- the Google sign-in for Android APIs on the device and passing it to this API. 
export type LinkGoogleAccountRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	ForceLink: boolean?, --- If another user is already linked to the account, unlink the other user and re-link. If the current user is already linked, link both accounts
	ServerAuthCode: string?, --- Server authentication code obtained on the client by calling getServerAuthCode() (https://developers.google.com/identity/sign-in/android/offline-access) from Google Play for the user.
}

export type LinkGoogleAccountResult = {
}

--- Google Play Games sign-in is accomplished by obtaining a Google OAuth 2.0 credential 
--- using the Google Play Games sign-in for Android APIs on the device and passing 
--- it to this API. 
export type LinkGooglePlayGamesServicesAccountRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	ForceLink: boolean?, --- If another user is already linked to the account, unlink the other user and re-link. If the current user is already linked, link both accounts
	ServerAuthCode: string, --- OAuth 2.0 server authentication code obtained on the client by calling the requestServerSideAccess() (https://developers.google.com/games/services/android/signin) Google Play Games client API.
}

export type LinkGooglePlayGamesServicesAccountResult = {
}

export type LinkIOSDeviceIDRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	DeviceId: string, --- Vendor-specific iOS identifier for the user's device.
	DeviceModel: string?, --- Specific model of the user's device.
	ForceLink: boolean?, --- If another user is already linked to the device, unlink the other user and re-link.
	OS: string?, --- Specific Operating System version for the user's device.
}

export type LinkIOSDeviceIDResult = {
}

export type LinkKongregateAccountRequest = {
	AuthTicket: string, --- Valid session auth ticket issued by Kongregate
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	ForceLink: boolean?, --- If another user is already linked to the account, unlink the other user and re-link.
	KongregateId: string, --- Numeric user ID assigned by Kongregate
}

export type LinkKongregateAccountResult = {
}

export type LinkNintendoServiceAccountRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	ForceLink: boolean?, --- If another user is already linked to a specific Nintendo Switch account, unlink the other user and re-link.
	IdentityToken: string, --- The JSON Web token (JWT) returned by Nintendo after login. Used to validate the request and find the user ID (Nintendo Switch subject) to link with.
}

export type LinkNintendoSwitchDeviceIdRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	ForceLink: boolean?, --- If another user is already linked to the Nintendo Switch Device ID, unlink the other user and re-link.
	NintendoSwitchDeviceId: string, --- Nintendo Switch unique identifier for the user's device.
}

export type LinkNintendoSwitchDeviceIdResult = {
}

export type LinkOpenIdConnectRequest = {
	ConnectionId: string, --- A name that identifies which configured OpenID Connect provider relationship to use. Maximum 100 characters.
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	ForceLink: boolean?, --- If another user is already linked to a specific OpenId Connect user, unlink the other user and re-link.
	IdToken: string, --- The JSON Web token (JWT) returned by the identity provider after login. Represented as the id_token field in the identity provider's response. Used to validate the request and find the user ID (OpenID Connect subject) to link with.
}

export type LinkPSNAccountRequest = {
	AuthCode: string, --- Authentication code provided by the PlayStation :tm: Network.
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	ForceLink: boolean?, --- If another user is already linked to the account, unlink the other user and re-link.
	IssuerId: number?, --- Id of the PlayStation :tm: Network issuer environment. If null, defaults to production environment.
	RedirectUri: string, --- Redirect URI supplied to PlayStation :tm: Network when requesting an auth code
}

export type LinkPSNAccountResult = {
}

--- Steam authentication is accomplished with the Steam Session Ticket. More information 
--- on the Ticket can be found in the Steamworks SDK, here: https://partner.steamgames.com/documentation/auth 
--- (requires sign-in). NOTE: For Steam authentication to work, the title must be 
--- configured with the Steam Application ID and Publisher Key in the PlayFab Game 
--- Manager (under Properties). Information on creating a Publisher Key (referred 
--- to as the Secret Key in PlayFab) for your title can be found here: https://partner.steamgames.com/documentation/webapi#publisherkey. 
export type LinkSteamAccountRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	ForceLink: boolean?, --- If another user is already linked to the account, unlink the other user and re-link.
	SteamTicket: string, --- Authentication token for the user, returned as a byte array from Steam, and converted to a string (for example, the byte 0x08 should become "08").
}

export type LinkSteamAccountResult = {
}

export type LinkTwitchAccountRequest = {
	AccessToken: string, --- Valid token issued by Twitch
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	ForceLink: boolean?, --- If another user is already linked to the account, unlink the other user and re-link.
}

export type LinkTwitchAccountResult = {
}

export type LinkXboxAccountRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	ForceLink: boolean?, --- If another user is already linked to the account, unlink the other user and re-link.
	XboxToken: string, --- Token provided by the Xbox Live SDK/XDK method GetTokenAndSignatureAsync("POST", "https://playfabapi.com/", "").
}

export type LinkXboxAccountResult = {
}

export type LinkedPlatformAccountModel = {
	Email: string?, --- Linked account email of the user on the platform, if available
	Platform: string?, --- Authentication platform
	PlatformUserId: string?, --- Unique account identifier of the user on the platform
	Username: string?, --- Linked account username of the user on the platform, if available
}

--- Returns a list of every character that currently belongs to a user. 
export type ListUsersCharactersRequest = {
	PlayFabId: string?, --- Unique PlayFab assigned ID of the user on whom the operation will be performed.
}

export type ListUsersCharactersResult = {
	Characters: {CharacterResult}?, --- The requested list of characters.
}

export type LocationModel = {
	City: string?, --- City name.
	ContinentCode: string?, --- The two-character continent code for this location
	CountryCode: string?, --- The two-character ISO 3166-1 country code for the country associated with the location
	Latitude: number?, --- Latitude coordinate of the geographic location.
	Longitude: number?, --- Longitude coordinate of the geographic location.
}

export type LogStatement = {
	Data: {[any]: any}?, --- Optional object accompanying the message as contextual information
	Level: string?, --- 'Debug', 'Info', or 'Error'
	Message: string?,
}

export type LoginIdentityProvider = 
	"Unknown"
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

export type LoginResult = {
	EntityToken: EntityTokenResponse?, --- If LoginTitlePlayerAccountEntity flag is set on the login request the title_player_account will also be logged in and returned.
	InfoResultPayload: GetPlayerCombinedInfoResultPayload?, --- Results for requested info.
	LastLoginTime: string?, --- The time of this user's previous login. If there was no previous login, then it's DateTime.MinValue
	NewlyCreated: boolean, --- True if the account was newly created on this login.
	PlayFabId: string?, --- Player's unique PlayFabId.
	SessionTicket: string?, --- Unique token authorizing the user and game at the server level, for the current session.
	SettingsForUser: UserSettings?, --- Settings specific to this user.
	TreatmentAssignment: TreatmentAssignment?, --- The experimentation treatments for this user at the time of login.
}

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
export type LoginWithAndroidDeviceIDRequest = {
	AndroidDevice: string?, --- Specific model of the user's device.
	AndroidDeviceId: string?, --- Android device identifier for the user's device.
	CreateAccount: boolean?, --- Automatically create a PlayFab account if one is not currently linked to this ID.
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	EncryptedRequest: string?, --- Base64 encoded body that is encrypted with the Title's public RSA key (Enterprise Only).
	InfoRequestParameters: GetPlayerCombinedInfoRequestParams?, --- Flags for which pieces of info to return for the user.
	OS: string?, --- Specific Operating System version for the user's device.
	PlayerSecret: string?, --- Player secret that is used to verify API request signatures (Enterprise Only).
	TitleId: string, --- Unique identifier for the title, found in the Settings > Game Properties section of the PlayFab developer site when a title has been selected.
}

export type LoginWithAppleRequest = {
	CreateAccount: boolean?, --- Automatically create a PlayFab account if one is not currently linked to this ID.
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	EncryptedRequest: string?, --- Base64 encoded body that is encrypted with the Title's public RSA key (Enterprise Only).
	IdentityToken: string, --- The JSON Web token (JWT) returned by Apple after login. Represented as the identityToken field in the authorization credential payload. If you choose to ignore the expiration date for identity tokens, you will receive an NotAuthorized error if Apple rotates the signing key. In this case, users have to login to provide a fresh identity token.
	InfoRequestParameters: GetPlayerCombinedInfoRequestParams?, --- Flags for which pieces of info to return for the user.
	PlayerSecret: string?, --- Player secret that is used to verify API request signatures (Enterprise Only).
	TitleId: string, --- Unique identifier for the title, found in the Settings > Game Properties section of the PlayFab developer site when a title has been selected.
}

--- It is highly recommended that developers ensure that it is extremely unlikely 
--- that a customer could generate an ID which is already in use by another customer. 
--- If this is the first time a user has signed in with the Custom ID and CreateAccount 
--- is set to true, a new PlayFab account will be created and linked to the Custom 
--- ID. In this case, no email or username will be associated with the PlayFab account. 
--- Otherwise, if no PlayFab account is linked to the Custom ID, an error indicating 
--- this will be returned, so that the title can guide the user through creation 
--- of a PlayFab account. 
export type LoginWithCustomIDRequest = {
	CreateAccount: boolean?, --- Automatically create a PlayFab account if one is not currently linked to this ID.
	CustomId: string?, --- Custom unique identifier for the user, generated by the title.
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	EncryptedRequest: string?, --- Base64 encoded body that is encrypted with the Title's public RSA key (Enterprise Only).
	InfoRequestParameters: GetPlayerCombinedInfoRequestParams?, --- Flags for which pieces of info to return for the user.
	PlayerSecret: string?, --- Player secret that is used to verify API request signatures (Enterprise Only).
	TitleId: string, --- Unique identifier for the title, found in the Settings > Game Properties section of the PlayFab developer site when a title has been selected.
}

--- Email address and password lengths are provided for information purposes. The 
--- server will validate that data passed in conforms to the field definition and 
--- report errors appropriately. It is recommended that developers not perform this 
--- validation locally, so that future updates do not require client updates. 
export type LoginWithEmailAddressRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	Email: string, --- Email address for the account.
	InfoRequestParameters: GetPlayerCombinedInfoRequestParams?, --- Flags for which pieces of info to return for the user.
	Password: string, --- Password for the PlayFab account (6-100 characters)
	TitleId: string, --- Unique identifier for the title, found in the Settings > Game Properties section of the PlayFab developer site when a title has been selected.
}

export type LoginWithFacebookInstantGamesIdRequest = {
	CreateAccount: boolean?, --- Automatically create a PlayFab account if one is not currently linked to this ID.
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	EncryptedRequest: string?, --- Base64 encoded body that is encrypted with the Title's public RSA key (Enterprise Only).
	FacebookInstantGamesSignature: string, --- Facebook Instant Games signature for the user.
	InfoRequestParameters: GetPlayerCombinedInfoRequestParams?, --- Flags for which pieces of info to return for the user.
	PlayerSecret: string?, --- Player secret that is used to verify API request signatures (Enterprise Only).
	TitleId: string, --- Unique identifier for the title, found in the Settings > Game Properties section of the PlayFab developer site when a title has been selected.
}

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
export type LoginWithFacebookRequest = {
	AccessToken: string, --- Unique identifier from Facebook for the user.
	CreateAccount: boolean?, --- Automatically create a PlayFab account if one is not currently linked to this ID.
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	EncryptedRequest: string?, --- Base64 encoded body that is encrypted with the Title's public RSA key (Enterprise Only).
	InfoRequestParameters: GetPlayerCombinedInfoRequestParams?, --- Flags for which pieces of info to return for the user.
	PlayerSecret: string?, --- Player secret that is used to verify API request signatures (Enterprise Only).
	TitleId: string, --- Unique identifier for the title, found in the Settings > Game Properties section of the PlayFab developer site when a title has been selected.
}

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
export type LoginWithGameCenterRequest = {
	CreateAccount: boolean?, --- Automatically create a PlayFab account if one is not currently linked to this ID.
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	EncryptedRequest: string?, --- Base64 encoded body that is encrypted with the Title's public RSA key (Enterprise Only).
	InfoRequestParameters: GetPlayerCombinedInfoRequestParams?, --- Flags for which pieces of info to return for the user.
	PlayerId: string?, --- Unique Game Center player id.
	PlayerSecret: string?, --- Player secret that is used to verify API request signatures (Enterprise Only).
	PublicKeyUrl: string?, --- The URL for the public encryption key that will be used to verify the signature.
	Salt: string?, --- A random value used to compute the hash and keep it randomized.
	Signature: string?, --- The verification signature of the authentication payload.
	Timestamp: string?, --- The integer representation of date and time that the signature was created on. PlayFab will reject authentication signatures not within 10 minutes of the server's current time.
	TitleId: string, --- Unique identifier for the title, found in the Settings > Game Properties section of the PlayFab developer site when a title has been selected.
}

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
export type LoginWithGoogleAccountRequest = {
	CreateAccount: boolean?, --- Automatically create a PlayFab account if one is not currently linked to this ID.
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	EncryptedRequest: string?, --- Base64 encoded body that is encrypted with the Title's public RSA key (Enterprise Only).
	InfoRequestParameters: GetPlayerCombinedInfoRequestParams?, --- Flags for which pieces of info to return for the user.
	PlayerSecret: string?, --- Player secret that is used to verify API request signatures (Enterprise Only).
	ServerAuthCode: string?, --- OAuth 2.0 server authentication code obtained on the client by calling the getServerAuthCode() (https://developers.google.com/identity/sign-in/android/offline-access) Google client API.
	TitleId: string, --- Unique identifier for the title, found in the Settings > Game Properties section of the PlayFab developer site when a title has been selected.
}

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
export type LoginWithGooglePlayGamesServicesRequest = {
	CreateAccount: boolean?, --- Automatically create a PlayFab account if one is not currently linked to this ID.
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	EncryptedRequest: string?, --- Base64 encoded body that is encrypted with the Title's public RSA key (Enterprise Only).
	InfoRequestParameters: GetPlayerCombinedInfoRequestParams?, --- Flags for which pieces of info to return for the user.
	PlayerSecret: string?, --- Player secret that is used to verify API request signatures (Enterprise Only).
	ServerAuthCode: string?, --- OAuth 2.0 server authentication code obtained on the client by calling the requestServerSideAccess() (https://developers.google.com/games/services/android/signin) Google Play Games client API.
	TitleId: string, --- Unique identifier for the title, found in the Settings > Game Properties section of the PlayFab developer site when a title has been selected.
}

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
export type LoginWithIOSDeviceIDRequest = {
	CreateAccount: boolean?, --- Automatically create a PlayFab account if one is not currently linked to this ID.
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	DeviceId: string?, --- Vendor-specific iOS identifier for the user's device.
	DeviceModel: string?, --- Specific model of the user's device.
	EncryptedRequest: string?, --- Base64 encoded body that is encrypted with the Title's public RSA key (Enterprise Only).
	InfoRequestParameters: GetPlayerCombinedInfoRequestParams?, --- Flags for which pieces of info to return for the user.
	OS: string?, --- Specific Operating System version for the user's device.
	PlayerSecret: string?, --- Player secret that is used to verify API request signatures (Enterprise Only).
	TitleId: string, --- Unique identifier for the title, found in the Settings > Game Properties section of the PlayFab developer site when a title has been selected.
}

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
export type LoginWithKongregateRequest = {
	AuthTicket: string?, --- Token issued by Kongregate's client API for the user.
	CreateAccount: boolean?, --- Automatically create a PlayFab account if one is not currently linked to this ID.
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	EncryptedRequest: string?, --- Base64 encoded body that is encrypted with the Title's public RSA key (Enterprise Only).
	InfoRequestParameters: GetPlayerCombinedInfoRequestParams?, --- Flags for which pieces of info to return for the user.
	KongregateId: string?, --- Numeric user ID assigned by Kongregate
	PlayerSecret: string?, --- Player secret that is used to verify API request signatures (Enterprise Only).
	TitleId: string, --- Unique identifier for the title, found in the Settings > Game Properties section of the PlayFab developer site when a title has been selected.
}

export type LoginWithNintendoServiceAccountRequest = {
	CreateAccount: boolean?, --- Automatically create a PlayFab account if one is not currently linked to this ID.
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	EncryptedRequest: string?, --- Base64 encoded body that is encrypted with the Title's public RSA key (Enterprise Only).
	IdentityToken: string, --- The JSON Web token (JWT) returned by Nintendo after login.
	InfoRequestParameters: GetPlayerCombinedInfoRequestParams?, --- Flags for which pieces of info to return for the user.
	PlayerSecret: string?, --- Player secret that is used to verify API request signatures (Enterprise Only).
	TitleId: string, --- Unique identifier for the title, found in the Settings > Game Properties section of the PlayFab developer site when a title has been selected.
}

export type LoginWithNintendoSwitchDeviceIdRequest = {
	CreateAccount: boolean?, --- Automatically create a PlayFab account if one is not currently linked to this ID.
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	EncryptedRequest: string?, --- Base64 encoded body that is encrypted with the Title's public RSA key (Enterprise Only).
	InfoRequestParameters: GetPlayerCombinedInfoRequestParams?, --- Flags for which pieces of info to return for the user.
	NintendoSwitchDeviceId: string?, --- Nintendo Switch unique identifier for the user's device.
	PlayerSecret: string?, --- Player secret that is used to verify API request signatures (Enterprise Only).
	TitleId: string, --- Unique identifier for the title, found in the Settings > Game Properties section of the PlayFab developer site when a title has been selected.
}

export type LoginWithOpenIdConnectRequest = {
	ConnectionId: string, --- A name that identifies which configured OpenID Connect provider relationship to use. Maximum 100 characters.
	CreateAccount: boolean?, --- Automatically create a PlayFab account if one is not currently linked to this ID.
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	EncryptedRequest: string?, --- Base64 encoded body that is encrypted with the Title's public RSA key (Enterprise Only).
	IdToken: string, --- The JSON Web token (JWT) returned by the identity provider after login. Represented as the id_token field in the identity provider's response.
	InfoRequestParameters: GetPlayerCombinedInfoRequestParams?, --- Flags for which pieces of info to return for the user.
	PlayerSecret: string?, --- Player secret that is used to verify API request signatures (Enterprise Only).
	TitleId: string, --- Unique identifier for the title, found in the Settings > Game Properties section of the PlayFab developer site when a title has been selected.
}

--- If this is the first time a user has signed in with the PlayStation :tm: Network 
--- account and CreateAccount is set to true, a new PlayFab account will be created 
--- and linked to the PlayStation :tm: Network account. In this case, no email or 
--- username will be associated with the PlayFab account. Otherwise, if no PlayFab 
--- account is linked to the PlayStation :tm: Network account, an error indicating 
--- this will be returned, so that the title can guide the user through creation 
--- of a PlayFab account. 
export type LoginWithPSNRequest = {
	AuthCode: string?, --- Auth code provided by the PlayStation :tm: Network OAuth provider.
	CreateAccount: boolean?, --- Automatically create a PlayFab account if one is not currently linked to this ID.
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	EncryptedRequest: string?, --- Base64 encoded body that is encrypted with the Title's public RSA key (Enterprise Only).
	InfoRequestParameters: GetPlayerCombinedInfoRequestParams?, --- Flags for which pieces of info to return for the user.
	IssuerId: number?, --- Id of the PlayStation :tm: Network issuer environment. If null, defaults to production environment.
	PlayerSecret: string?, --- Player secret that is used to verify API request signatures (Enterprise Only).
	RedirectUri: string?, --- Redirect URI supplied to PlayStation :tm: Network when requesting an auth code
	TitleId: string, --- Unique identifier for the title, found in the Settings > Game Properties section of the PlayFab developer site when a title has been selected.
}

--- Username and password lengths are provided for information purposes. The server 
--- will validate that data passed in conforms to the field definition and report 
--- errors appropriately. It is recommended that developers not perform this validation 
--- locally, so that future updates to the username or password do not require client 
--- updates. 
export type LoginWithPlayFabRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	InfoRequestParameters: GetPlayerCombinedInfoRequestParams?, --- Flags for which pieces of info to return for the user.
	Password: string, --- Password for the PlayFab account (6-100 characters)
	TitleId: string, --- Unique identifier for the title, found in the Settings > Game Properties section of the PlayFab developer site when a title has been selected.
	Username: string, --- PlayFab username for the account.
}

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
export type LoginWithSteamRequest = {
	CreateAccount: boolean?, --- Automatically create a PlayFab account if one is not currently linked to this ID.
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	EncryptedRequest: string?, --- Base64 encoded body that is encrypted with the Title's public RSA key (Enterprise Only).
	InfoRequestParameters: GetPlayerCombinedInfoRequestParams?, --- Flags for which pieces of info to return for the user.
	PlayerSecret: string?, --- Player secret that is used to verify API request signatures (Enterprise Only).
	SteamTicket: string?, --- Authentication token for the user, returned as a byte array from Steam, and converted to a string (for example, the byte 0x08 should become "08").
	TitleId: string, --- Unique identifier for the title, found in the Settings > Game Properties section of the PlayFab developer site when a title has been selected.
}

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
export type LoginWithTwitchRequest = {
	AccessToken: string?, --- Token issued by Twitch's API for the user.
	CreateAccount: boolean?, --- Automatically create a PlayFab account if one is not currently linked to this ID.
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	EncryptedRequest: string?, --- Base64 encoded body that is encrypted with the Title's public RSA key (Enterprise Only).
	InfoRequestParameters: GetPlayerCombinedInfoRequestParams?, --- Flags for which pieces of info to return for the user.
	PlayerSecret: string?, --- Player secret that is used to verify API request signatures (Enterprise Only).
	TitleId: string, --- Unique identifier for the title, found in the Settings > Game Properties section of the PlayFab developer site when a title has been selected.
}

--- If this is the first time a user has signed in with the Xbox Live account and 
--- CreateAccount is set to true, a new PlayFab account will be created and linked 
--- to the Xbox Live account. In this case, no email or username will be associated 
--- with the PlayFab account. Otherwise, if no PlayFab account is linked to the 
--- Xbox Live account, an error indicating this will be returned, so that the title 
--- can guide the user through creation of a PlayFab account. 
export type LoginWithXboxRequest = {
	CreateAccount: boolean?, --- Automatically create a PlayFab account if one is not currently linked to this ID.
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	EncryptedRequest: string?, --- Base64 encoded body that is encrypted with the Title's public RSA key (Enterprise Only).
	InfoRequestParameters: GetPlayerCombinedInfoRequestParams?, --- Flags for which pieces of info to return for the user.
	PlayerSecret: string?, --- Player secret that is used to verify API request signatures (Enterprise Only).
	TitleId: string, --- Unique identifier for the title, found in the Settings > Game Properties section of the PlayFab developer site when a title has been selected.
	XboxToken: string?, --- Token provided by the Xbox Live SDK/XDK method GetTokenAndSignatureAsync("POST", "https://playfabapi.com/", "").
}

export type MatchmakeRequest = {
	BuildVersion: string?, --- Build version to match against. [Note: Required if LobbyId is not specified]
	CharacterId: string?, --- Character to use for stats based matching. Leave null to use account stats.
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	GameMode: string?, --- Game mode to match make against. [Note: Required if LobbyId is not specified]
	LobbyId: string?, --- Lobby identifier to match make against. This is used to select a specific Game Server Instance.
	Region: string?, --- Region to match make against. [Note: Required if LobbyId is not specified]
	StartNewIfNoneFound: boolean?, --- Start a game session if one with an open slot is not found. Defaults to true.
	StatisticName: string?, --- Player statistic to use in finding a match. May be null for no stat-based matching.
	TagFilter: CollectionFilter?, --- Filter to include and/or exclude Game Server Instances associated with certain Tags
}

export type MatchmakeResult = {
	Expires: string?, --- timestamp for when the server will expire, if applicable
	LobbyID: string?, --- unique lobby identifier of the server matched
	PollWaitTimeMS: number?, --- time in milliseconds the application is configured to wait on matchmaking results
	ServerIPV4Address: string?, --- IPV4 address of the server
	ServerIPV6Address: string?, --- IPV6 address of the server
	ServerPort: number?, --- port number to use for non-http communications with the server
	ServerPublicDNSName: string?, --- Public DNS name (if any) of the server
	Status: string?, --- result of match making process
	Ticket: string?, --- server authorization ticket (used by RedeemMatchmakerTicket to validate user insertion into the game)
}

export type MatchmakeStatus = 
	"Complete"
	| "Waiting"
	| "GameNotFound"
	| "NoAvailableSlots"
	| "SessionClosed"

export type MembershipModel = {
	IsActive: boolean, --- Whether this membership is active. That is, whether the MembershipExpiration time has been reached.
	MembershipExpiration: string, --- The time this membership expires
	MembershipId: string?, --- The id of the membership
	OverrideExpiration: string?, --- Membership expirations can be explicitly overridden (via game manager or the admin api). If this membership has been overridden, this will be the new expiration time.
	OverrideIsSet: boolean?, --- Whether the override expiration is set.
	Subscriptions: {SubscriptionModel}?, --- The list of subscriptions that this player has for this membership
}

export type MicrosoftStorePayload = {
	CollectionsMsIdKey: string?, --- Microsoft store ID key. This is optional. Alternatively you can use XboxToken
	UserId: string?, --- If collectionsMsIdKey is provided, this will verify the user id in the collectionsMsIdKey is the same.
	XboxToken: string?, --- Token provided by the Xbox Live SDK/XDK method GetTokenAndSignatureAsync("POST", "https://playfabapi.com/", ""). This is optional. Alternatively can use CollectionsMsIdKey
}

export type ModifyUserVirtualCurrencyResult = {
	Balance: number, --- Balance of the virtual currency after modification.
	BalanceChange: number, --- Amount added or subtracted from the user's virtual currency. Maximum VC balance is Int32 (2,147,483,647). Any increase over this value will be discarded.
	PlayFabId: string?, --- User currency was subtracted from.
	VirtualCurrency: string?, --- Name of the virtual currency which was modified.
}

--- Identifier by either name or ID. Note that a name may change due to renaming, 
--- or reused after being deleted. ID is immutable and unique. 
export type NameIdentifier = {
	Id: string?, --- Id Identifier, if present
	Name: string?, --- Name Identifier, if present
}

export type NintendoServiceAccountPlayFabIdPair = {
	NintendoServiceAccountId: string?, --- Unique Nintendo Switch Service Account identifier for a user.
	PlayFabId: string?, --- Unique PlayFab identifier for a user, or null if no PlayFab account is linked to the Nintendo Switch Service Account identifier.
}

export type NintendoSwitchPlayFabIdPair = {
	NintendoSwitchDeviceId: string?, --- Unique Nintendo Switch Device identifier for a user.
	PlayFabId: string?, --- Unique PlayFab identifier for a user, or null if no PlayFab account is linked to the Nintendo Switch Device identifier.
}

export type OpenTradeRequest = {
	AllowedPlayerIds: {any}?, --- Players who are allowed to accept the trade. If null, the trade may be accepted by any player. If empty, the trade may not be accepted by any player.
	OfferedInventoryInstanceIds: {any}?, --- Player inventory items offered for trade. If not set, the trade is effectively a gift request
	RequestedCatalogItemIds: {any}?, --- Catalog items accepted for the trade. If not set, the trade is effectively a gift.
}

export type OpenTradeResponse = {
	Trade: TradeInfo?, --- The information about the trade that was just opened.
}

export type PSNAccountPlayFabIdPair = {
	PSNAccountId: string?, --- Unique PlayStation :tm: Network identifier for a user.
	PlayFabId: string?, --- Unique PlayFab identifier for a user, or null if no PlayFab account is linked to the PlayStation :tm: Network identifier.
}

--- This is the second step in the purchasing process, initiating the purchase transaction 
--- with the payment provider (if applicable). For payment provider scenarios, the 
--- title should next present the user with the payment provider'sinterface for 
--- payment. Once the player has completed the payment with the provider, the title 
--- should call ConfirmPurchase tofinalize the process and add the appropriate items 
--- to the player inventory. 
export type PayForPurchaseRequest = {
	Currency: string, --- Currency to use to fund the purchase.
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	OrderId: string, --- Purchase order identifier returned from StartPurchase.
	ProviderName: string, --- Payment provider to use to fund the purchase.
	ProviderTransactionId: string?, --- Payment provider transaction identifier. Required for Facebook Payments.
}

--- For web-based payment providers, this operation returns the URL to which the 
--- user should be directed inorder to approve the purchase. Items added to the 
--- user inventory as a result of this operation will be marked as unconfirmed. 
export type PayForPurchaseResult = {
	CreditApplied: number, --- Local credit applied to the transaction (provider specific).
	OrderId: string?, --- Purchase order identifier.
	ProviderData: string?, --- Provider used for the transaction.
	ProviderToken: string?, --- A token generated by the provider to authenticate the request (provider-specific).
	PurchaseConfirmationPageURL: string?, --- URL to the purchase provider page that details the purchase.
	PurchaseCurrency: string?, --- Currency for the transaction, may be a virtual currency or real money.
	PurchasePrice: number, --- Cost of the transaction.
	Status: string?, --- Status of the transaction.
	VCAmount: {[any]: any}?, --- Virtual currencies granted by the transaction, if any.
	VirtualCurrency: {[any]: any}?, --- Current virtual currency balances for the user.
}

export type PaymentOption = {
	Currency: string?, --- Specific currency to use to fund the purchase.
	Price: number, --- Amount of the specified currency needed for the purchase.
	ProviderName: string?, --- Name of the purchase provider for this option.
	StoreCredit: number, --- Amount of existing credit the user has with the provider.
}

export type PlayStation5Payload = {
	Ids: {any}?, --- An optional list of entitlement ids to query against PlayStation :tm: Network
	ServiceLabel: string?, --- Id of the PlayStation :tm: Network service label to consume entitlements from
}

export type PlayerLeaderboardEntry = {
	DisplayName: string?, --- Title-specific display name of the user for this leaderboard entry.
	PlayFabId: string?, --- PlayFab unique identifier of the user for this leaderboard entry.
	Position: number, --- User's overall position in the leaderboard.
	Profile: PlayerProfileModel?, --- The profile of the user, if requested.
	StatValue: number, --- Specific value of the user's statistic.
}

export type PlayerProfileModel = {
	AdCampaignAttributions: {AdCampaignAttributionModel}?, --- List of advertising campaigns the player has been attributed to
	AvatarUrl: string?, --- URL of the player's avatar image
	BannedUntil: string?, --- If the player is currently banned, the UTC Date when the ban expires
	ContactEmailAddresses: {ContactEmailInfoModel}?, --- List of all contact email info associated with the player account
	Created: string?, --- Player record created
	DisplayName: string?, --- Player display name
	ExperimentVariants: {any}?, --- List of experiment variants for the player. Note that these variants are not guaranteed to be up-to-date when returned during login because the player profile is updated only after login. Instead, use the LoginResult.TreatmentAssignment property during login to get the correct variants and variables.
	LastLogin: string?, --- UTC time when the player most recently logged in to the title
	LinkedAccounts: {LinkedPlatformAccountModel}?, --- List of all authentication systems linked to this player account
	Locations: {LocationModel}?, --- List of geographic locations from which the player has logged in to the title
	Memberships: {MembershipModel}?, --- List of memberships for the player, along with whether are expired.
	Origination: string?, --- Player account origination
	PlayerId: string?, --- PlayFab player account unique identifier
	PublisherId: string?, --- Publisher this player belongs to
	PushNotificationRegistrations: {PushNotificationRegistrationModel}?, --- List of configured end points registered for sending the player push notifications
	Statistics: {StatisticModel}?, --- List of leaderboard statistic values for the player
	Tags: {TagModel}?, --- List of player's tags for segmentation
	TitleId: string?, --- Title ID this player profile applies to
	TotalValueToDateInUSD: number?, --- Sum of the player's purchases made with real-money currencies, converted to US dollars equivalent and represented as a whole number of cents (1/100 USD). For example, 999 indicates nine dollars and ninety-nine cents.
	ValuesToDate: {ValueToDateModel}?, --- List of the player's lifetime purchase totals, summed by real-money currency
}

export type PlayerProfileViewConstraints = {
	ShowAvatarUrl: boolean, --- Whether to show player's avatar URL. Defaults to false
	ShowBannedUntil: boolean, --- Whether to show the banned until time. Defaults to false
	ShowCampaignAttributions: boolean, --- Whether to show campaign attributions. Defaults to false
	ShowContactEmailAddresses: boolean, --- Whether to show contact email addresses. Defaults to false
	ShowCreated: boolean, --- Whether to show the created date. Defaults to false
	ShowDisplayName: boolean, --- Whether to show the display name. Defaults to false
	ShowExperimentVariants: boolean, --- Whether to show player's experiment variants. Defaults to false
	ShowLastLogin: boolean, --- Whether to show the last login time. Defaults to false
	ShowLinkedAccounts: boolean, --- Whether to show the linked accounts. Defaults to false
	ShowLocations: boolean, --- Whether to show player's locations. Defaults to false
	ShowMemberships: boolean, --- Whether to show player's membership information. Defaults to false
	ShowOrigination: boolean, --- Whether to show origination. Defaults to false
	ShowPushNotificationRegistrations: boolean, --- Whether to show push notification registrations. Defaults to false
	ShowStatistics: boolean, --- Reserved for future development
	ShowTags: boolean, --- Whether to show tags. Defaults to false
	ShowTotalValueToDateInUsd: boolean, --- Whether to show the total value to date in usd. Defaults to false
	ShowValuesToDate: boolean, --- Whether to show the values to date. Defaults to false
}

export type PlayerStatisticVersion = {
	ActivationTime: string, --- time when the statistic version became active
	DeactivationTime: string?, --- time when the statistic version became inactive due to statistic version incrementing
	ScheduledActivationTime: string?, --- time at which the statistic version was scheduled to become active, based on the configured ResetInterval
	ScheduledDeactivationTime: string?, --- time at which the statistic version was scheduled to become inactive, based on the configured ResetInterval
	StatisticName: string?, --- name of the statistic when the version became active
	Version: number, --- version of the statistic
}

--- Please note that the processing time for inventory grants and purchases increases 
--- fractionally the more items are in the inventory, and the more items are in 
--- the grant/purchase operation (with each item in a bundle being a distinct add). 
export type PurchaseItemRequest = {
	CatalogVersion: string?, --- Catalog version for the items to be purchased (defaults to most recent version.
	CharacterId: string?, --- Unique PlayFab assigned ID for a specific character owned by a user
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	ItemId: string, --- Unique identifier of the item to purchase.
	Price: number, --- Price the client expects to pay for the item (in case a new catalog or store was uploaded, with new prices).
	StoreId: string?, --- Store to buy this item through. If not set, prices default to those in the catalog.
	VirtualCurrency: string, --- Virtual currency to use to purchase the item.
}

export type PurchaseItemResult = {
	Items: {ItemInstance}?, --- Details for the items purchased.
}

export type PurchaseReceiptFulfillment = {
	FulfilledItems: {ItemInstance}?, --- Items granted to the player in fulfillment of the validated receipt.
	RecordedPriceSource: string?, --- Source of the payment price information for the recorded purchase transaction. A value of 'Request' indicates that the price specified in the request was used, whereas a value of 'Catalog' indicates that the real-money price of the catalog item matching the product ID in the validated receipt transaction and the currency specified in the request (defaulting to USD) was used.
	RecordedTransactionCurrency: string?, --- Currency used to purchase the items (ISO 4217 currency code).
	RecordedTransactionTotal: number?, --- Amount of the stated currency paid for the items, in centesimal units
}

export type PushNotificationPlatform = 
	"ApplePushNotificationService"
	| "GoogleCloudMessaging"

export type PushNotificationRegistrationModel = {
	NotificationEndpointARN: string?, --- Notification configured endpoint
	Platform: string?, --- Push notification platform
}

--- Coupon codes can be created for any item, or set of items, in the catalog for 
--- the title. This operation causes the coupon to be consumed, and the specific 
--- items to be awarded to the user. Attempting to re-use an already consumed code, 
--- or a code which has not yet been created in the service, will result in an error. 
export type RedeemCouponRequest = {
	CatalogVersion: string?, --- Catalog version of the coupon. If null, uses the default catalog
	CharacterId: string?, --- Optional identifier for the Character that should receive the item. If null, item is added to the player
	CouponCode: string, --- Generated coupon code to redeem.
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
}

export type RedeemCouponResult = {
	GrantedItems: {ItemInstance}?, --- Items granted to the player as a result of redeeming the coupon.
}

export type RefreshPSNAuthTokenRequest = {
	AuthCode: string, --- Auth code returned by PlayStation :tm: Network OAuth system.
	IssuerId: number?, --- Id of the PlayStation :tm: Network issuer environment. If null, defaults to production environment.
	RedirectUri: string, --- Redirect URI supplied to PlayStation :tm: Network when requesting an auth code
}

export type Region = 
	"USCentral"
	| "USEast"
	| "EUWest"
	| "Singapore"
	| "Japan"
	| "Brazil"
	| "Australia"

export type RegionInfo = {
	Available: boolean, --- indicates whether the server specified is available in this region
	Name: string?, --- name of the region
	PingUrl: string?, --- url to ping to get roundtrip time
	Region: string?, --- unique identifier for the region
}

--- The steps to configure and send Push Notifications is described in the PlayFab 
--- tutorials, here: https://docs.microsoft.com/gaming/playfab/features/engagement/push-notifications/quickstart 
export type RegisterForIOSPushNotificationRequest = {
	ConfirmationMessage: string?, --- Message to display when confirming push notification.
	DeviceToken: string, --- Unique token generated by the Apple Push Notification service when the title registered to receive push notifications.
	SendPushNotificationConfirmation: boolean?, --- If true, send a test push message immediately after sucessful registration. Defaults to false.
}

export type RegisterForIOSPushNotificationResult = {
}

export type RegisterPlayFabUserRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	DisplayName: string?, --- An optional parameter for setting the display name for this title (3-25 characters).
	Email: string?, --- User email address attached to their account
	EncryptedRequest: string?, --- Base64 encoded body that is encrypted with the Title's public RSA key (Enterprise Only).
	InfoRequestParameters: GetPlayerCombinedInfoRequestParams?, --- Flags for which pieces of info to return for the user.
	Password: string?, --- Password for the PlayFab account (6-100 characters)
	PlayerSecret: string?, --- Player secret that is used to verify API request signatures (Enterprise Only).
	RequireBothUsernameAndEmail: boolean?, --- An optional parameter that specifies whether both the username and email parameters are required. If true, both parameters are required; if false, the user must supply either the username or email parameter. The default value is true.
	TitleId: string, --- Unique identifier for the title, found in the Settings > Game Properties section of the PlayFab developer site when a title has been selected.
	Username: string?, --- PlayFab username for the account (3-20 characters)
}

--- Each account must have a unique email address in the PlayFab service. Once created, 
--- the account may be associated with additional accounts (Steam, Facebook, Game 
--- Center, etc.), allowing for added social network lists and achievements systems. 
export type RegisterPlayFabUserResult = {
	EntityToken: EntityTokenResponse?, --- If LoginTitlePlayerAccountEntity flag is set on the login request the title_player_account will also be logged in and returned.
	PlayFabId: string?, --- PlayFab unique identifier for this newly created account.
	SessionTicket: string?, --- Unique token identifying the user and game at the server level, for the current session.
	SettingsForUser: UserSettings?, --- Settings specific to this user.
	Username: string?, --- PlayFab unique user name.
}

--- This API removes an existing contact email from the player's profile. 
export type RemoveContactEmailRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
}

export type RemoveContactEmailResult = {
}

export type RemoveFriendRequest = {
	FriendPlayFabId: string, --- PlayFab identifier of the friend account which is to be removed.
}

export type RemoveFriendResult = {
}

export type RemoveGenericIDRequest = {
	GenericId: GenericServiceId, --- Generic service identifier to be removed from the player.
}

export type RemoveGenericIDResult = {
}

export type RemoveSharedGroupMembersRequest = {
	PlayFabIds: {any}, --- An array of unique PlayFab assigned ID of the user on whom the operation will be performed.
	SharedGroupId: string, --- Unique identifier for the shared group.
}

export type RemoveSharedGroupMembersResult = {
}

--- Report ad activity 
export type ReportAdActivityRequest = {
	Activity: string, --- Type of activity, may be Opened, Closed, Start or End
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	PlacementId: string, --- Unique ID of the placement to report for
	RewardId: string, --- Unique ID of the reward the player was offered
}

--- Report ad activity response has no body 
export type ReportAdActivityResult = {
}

export type ReportPlayerClientRequest = {
	Comment: string?, --- Optional additional comment by reporting player.
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	ReporteeId: string, --- Unique PlayFab identifier of the reported player.
}

--- Players are currently limited to five reports per day. Attempts by a single 
--- user account to submit reports beyond five will result in Updated being returned 
--- as false. 
export type ReportPlayerClientResult = {
	SubmissionsRemaining: number, --- The number of remaining reports which may be filed today.
}

--- The title should obtain a refresh receipt via restoreCompletedTransactions in 
--- the SKPaymentQueue of the Apple StoreKit and pass that in to this call. The 
--- resultant receipt contains new receipt instances for all non-consumable goods 
--- previously purchased by the user. This API call iterates through every purchase 
--- in the receipt and restores the items if they still exist in the catalog and 
--- can be validated. 
export type RestoreIOSPurchasesRequest = {
	CatalogVersion: string?, --- Catalog version of the restored items. If null, defaults to primary catalog.
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	ReceiptData: string, --- Base64 encoded receipt data, passed back by the App Store as a result of a successful purchase.
}

--- Once verified, the valid items will be restored into the user's inventory. This 
--- result should be used for immediate updates to the local client game state as 
--- opposed to the GetUserInventory API which can have an up to half second delay. 
export type RestoreIOSPurchasesResult = {
	Fulfillments: {PurchaseReceiptFulfillment}?, --- Fulfilled inventory items and recorded purchases in fulfillment of the validated receipt transactions.
}

--- Details on which placement and reward to perform a grant on 
export type RewardAdActivityRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	PlacementId: string, --- Placement unique ID
	RewardId: string, --- Reward unique ID
}

--- Result for rewarding an ad activity 
export type RewardAdActivityResult = {
	AdActivityEventId: string?, --- PlayStream Event ID that was generated by this reward (all subsequent events are associated with this event identifier)
	DebugResults: {any}?, --- Debug results from the grants
	PlacementId: string?, --- Id of the placement the reward was for
	PlacementName: string?, --- Name of the placement the reward was for
	PlacementViewsRemaining: number?, --- If placement has viewing limits indicates how many views are left
	PlacementViewsResetMinutes: number?, --- If placement has viewing limits indicates when they will next reset
	RewardResults: AdRewardResults?, --- Reward results
}

export type ScriptExecutionError = {
	Error: string?, --- Error code, such as CloudScriptNotFound, JavascriptException, CloudScriptFunctionArgumentSizeExceeded, CloudScriptAPIRequestCountExceeded, CloudScriptAPIRequestError, or CloudScriptHTTPRequestError
	Message: string?, --- Details about the error
	StackTrace: string?, --- Point during the execution of the script at which the error occurred, if any
}

--- If the account in question is a "temporary" account (for example, one that was 
--- created via a call to LoginFromIOSDeviceID), thisfunction will have no effect. 
--- Only PlayFab accounts which have valid email addresses will be able to receive 
--- a password reset email using this API. 
export type SendAccountRecoveryEmailRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	Email: string, --- User email address attached to their account
	EmailTemplateId: string?, --- The email template id of the account recovery email template to send.
	TitleId: string, --- Unique identifier for the title, found in the Settings > Game Properties section of the PlayFab developer site when a title has been selected.
}

export type SendAccountRecoveryEmailResult = {
}

--- This operation is not additive. It will completely replace the tag list for 
--- the specified user. Please note that only users in the PlayFab friends list 
--- can be assigned tags. Attempting to set a tag on a friend only included in the 
--- friends list from a social site integration (such as Facebook or Steam) will 
--- return the AccountNotFound error. 
export type SetFriendTagsRequest = {
	FriendPlayFabId: string, --- PlayFab identifier of the friend account to which the tag(s) should be applied.
	Tags: {any}, --- Array of tags to set on the friend account.
}

export type SetFriendTagsResult = {
}

--- APIs that require signatures require that the player have a configured Player 
--- Secret Key that is used to sign all requests. Players that don't have a secret 
--- will be blocked from making API calls until it is configured. To create a signature 
--- header add a SHA256 hashed string containing UTF8 encoded JSON body as it will 
--- be sent to the server, the current time in UTC formatted to ISO 8601, and the 
--- players secret formatted as 'body.date.secret'. Place the resulting hash into 
--- the header X-PlayFab-Signature, along with a header X-PlayFab-Timestamp of the 
--- same UTC timestamp used in the signature. 
export type SetPlayerSecretRequest = {
	EncryptedRequest: string?, --- Base64 encoded body that is encrypted with the Title's public RSA key (Enterprise Only).
	PlayerSecret: string?, --- Player secret that is used to verify API request signatures (Enterprise Only).
}

export type SetPlayerSecretResult = {
}

export type SharedGroupDataRecord = {
	LastUpdated: string, --- Timestamp for when this data was last updated.
	LastUpdatedBy: string?, --- Unique PlayFab identifier of the user to last update this value.
	Permission: string?, --- Indicates whether this data can be read by all users (public) or only members of the group (private).
	Value: string?, --- Data stored for the specified group data key.
}

export type SourceType = 
	"Admin"
	| "BackEnd"
	| "GameClient"
	| "GameServer"
	| "Partner"
	| "Custom"
	| "API"

--- This is the first step in the purchasing process. For security purposes, once 
--- the order (or "cart") has been created, additional inventory objects may no 
--- longer be added. In addition, inventory objects will be locked to the current 
--- prices, regardless of any subsequent changes at the catalog level which may 
--- occur during the next two steps. 
export type StartPurchaseRequest = {
	CatalogVersion: string?, --- Catalog version for the items to be purchased. Defaults to most recent catalog.
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	Items: {ItemPurchaseRequest}, --- Array of items to purchase.
	StoreId: string?, --- Store through which to purchase items. If not set, prices will be pulled from the catalog itself.
}

export type StartPurchaseResult = {
	Contents: {CartItem}?, --- Cart items to be purchased.
	OrderId: string?, --- Purchase order identifier.
	PaymentOptions: {PaymentOption}?, --- Available methods by which the user can pay.
	VirtualCurrencyBalances: {[any]: any}?, --- Current virtual currency totals for the user.
}

export type StatisticModel = {
	Name: string?, --- Statistic name
	Value: number, --- Statistic value
	Version: number, --- Statistic version (0 if not a versioned statistic)
}

export type StatisticNameVersion = {
	StatisticName: string, --- unique name of the statistic
	Version: number, --- the version of the statistic to be returned
}

export type StatisticUpdate = {
	StatisticName: string, --- unique name of the statistic
	Value: number, --- statistic value for the player
	Version: number?, --- for updates to an existing statistic value for a player, the version of the statistic when it was loaded. Null when setting the statistic value for the first time.
}

export type StatisticValue = {
	StatisticName: string?, --- unique name of the statistic
	Value: number, --- statistic value for the player
	Version: number, --- for updates to an existing statistic value for a player, the version of the statistic when it was loaded
}

export type SteamPlayFabIdPair = {
	PlayFabId: string?, --- Unique PlayFab identifier for a user, or null if no PlayFab account is linked to the Steam identifier.
	SteamStringId: string?, --- Unique Steam identifier for a user.
}

--- A store entry that list a catalog item at a particular price 
export type StoreItem = {
	CustomData: {[any]: any}?, --- Store specific custom data. The data only exists as part of this store; it is not transferred to item instances
	DisplayPosition: number?, --- Intended display position for this item. Note that 0 is the first position
	ItemId: string, --- Unique identifier of the item as it exists in the catalog - note that this must exactly match the ItemId from the catalog
	RealCurrencyPrices: {[any]: any}?, --- Override prices for this item for specific currencies
	VirtualCurrencyPrices: {[any]: any}?, --- Override prices for this item in virtual currencies and "RM" (the base Real Money purchase price, in USD pennies)
}

--- Marketing data about a specific store 
export type StoreMarketingModel = {
	Description: string?, --- Tagline for a store.
	DisplayName: string?, --- Display name of a store as it will appear to users.
	Metadata: {[any]: any}?, --- Custom data about a store.
}

export type SubscriptionModel = {
	Expiration: string, --- When this subscription expires.
	InitialSubscriptionTime: string, --- The time the subscription was orignially purchased
	IsActive: boolean, --- Whether this subscription is currently active. That is, if Expiration > now.
	Status: string?, --- The status of this subscription, according to the subscription provider.
	SubscriptionId: string?, --- The id for this subscription
	SubscriptionItemId: string?, --- The item id for this subscription from the primary catalog
	SubscriptionProvider: string?, --- The provider for this subscription. Apple or Google Play are supported today.
}

export type SubscriptionProviderStatus = 
	"NoError"
	| "Cancelled"
	| "UnknownError"
	| "BillingError"
	| "ProductUnavailable"
	| "CustomerDidNotAcceptPriceChange"
	| "FreeTrial"
	| "PaymentPending"

--- This API must be enabled for use as an option in the game manager website. It 
--- is disabled by default. 
export type SubtractUserVirtualCurrencyRequest = {
	Amount: number, --- Amount to be subtracted from the user balance of the specified virtual currency.
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	VirtualCurrency: string, --- Name of the virtual currency which is to be decremented.
}

export type TagModel = {
	TagValue: string?, --- Full value of the tag, including namespace
}

export type TitleActivationStatus = 
	"None"
	| "ActivatedTitleKey"
	| "PendingSteam"
	| "ActivatedSteam"
	| "RevokedSteam"

export type TitleNewsItem = {
	Body: string?, --- News item text.
	NewsId: string?, --- Unique identifier of news item.
	Timestamp: string, --- Date and time when the news item was posted.
	Title: string?, --- Title of the news item.
}

export type TradeInfo = {
	AcceptedInventoryInstanceIds: {any}?, --- Item instances from the accepting player that are used to fulfill the trade. If null, no one has accepted the trade.
	AcceptedPlayerId: string?, --- The PlayFab ID of the player who accepted the trade. If null, no one has accepted the trade.
	AllowedPlayerIds: {any}?, --- An optional list of players allowed to complete this trade. If null, anybody can complete the trade.
	CancelledAt: string?, --- If set, The UTC time when this trade was canceled.
	FilledAt: string?, --- If set, The UTC time when this trade was fulfilled.
	InvalidatedAt: string?, --- If set, The UTC time when this trade was made invalid.
	OfferedCatalogItemIds: {any}?, --- The catalogItem Ids of the item instances being offered.
	OfferedInventoryInstanceIds: {any}?, --- The itemInstance Ids that are being offered.
	OfferingPlayerId: string?, --- The PlayFabId for the offering player.
	OpenedAt: string?, --- The UTC time when this trade was created.
	RequestedCatalogItemIds: {any}?, --- The catalogItem Ids requested in exchange.
	Status: string?, --- Describes the current state of this trade.
	TradeId: string?, --- The identifier for this trade.
}

export type TradeStatus = 
	"Invalid"
	| "Opening"
	| "Open"
	| "Accepting"
	| "Accepted"
	| "Filled"
	| "Cancelled"

export type TransactionStatus = 
	"CreateCart"
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

export type TreatmentAssignment = {
	Variables: {Variable}?, --- List of the experiment variables.
	Variants: {any}?, --- List of the experiment variants.
}

export type TwitchPlayFabIdPair = {
	PlayFabId: string?, --- Unique PlayFab identifier for a user, or null if no PlayFab account is linked to the Twitch identifier.
	TwitchId: string?, --- Unique Twitch identifier for a user.
}

export type UnlinkAndroidDeviceIDRequest = {
	AndroidDeviceId: string?, --- Android device identifier for the user's device. If not specified, the most recently signed in Android Device ID will be used.
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
}

export type UnlinkAndroidDeviceIDResult = {
}

export type UnlinkAppleRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
}

export type UnlinkCustomIDRequest = {
	CustomId: string?, --- Custom unique identifier for the user, generated by the title. If not specified, the most recently signed in Custom ID will be used.
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
}

export type UnlinkCustomIDResult = {
}

export type UnlinkFacebookAccountRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
}

export type UnlinkFacebookAccountResult = {
}

export type UnlinkFacebookInstantGamesIdRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	FacebookInstantGamesId: string?, --- Facebook Instant Games identifier for the user. If not specified, the most recently signed in ID will be used.
}

export type UnlinkFacebookInstantGamesIdResult = {
}

export type UnlinkGameCenterAccountRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
}

export type UnlinkGameCenterAccountResult = {
}

export type UnlinkGoogleAccountRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
}

export type UnlinkGoogleAccountResult = {
}

export type UnlinkGooglePlayGamesServicesAccountRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
}

export type UnlinkGooglePlayGamesServicesAccountResult = {
}

export type UnlinkIOSDeviceIDRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	DeviceId: string?, --- Vendor-specific iOS identifier for the user's device. If not specified, the most recently signed in iOS Device ID will be used.
}

export type UnlinkIOSDeviceIDResult = {
}

export type UnlinkKongregateAccountRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
}

export type UnlinkKongregateAccountResult = {
}

export type UnlinkNintendoServiceAccountRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
}

export type UnlinkNintendoSwitchDeviceIdRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	NintendoSwitchDeviceId: string?, --- Nintendo Switch Device identifier for the user. If not specified, the most recently signed in device ID will be used.
}

export type UnlinkNintendoSwitchDeviceIdResult = {
}

export type UnlinkOpenIdConnectRequest = {
	ConnectionId: string, --- A name that identifies which configured OpenID Connect provider relationship to use. Maximum 100 characters.
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
}

export type UnlinkPSNAccountRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
}

export type UnlinkPSNAccountResult = {
}

export type UnlinkSteamAccountRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
}

export type UnlinkSteamAccountResult = {
}

export type UnlinkTwitchAccountRequest = {
	AccessToken: string?, --- Valid token issued by Twitch. Used to specify which twitch account to unlink from the profile. By default it uses the one that is present on the profile.
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
}

export type UnlinkTwitchAccountResult = {
}

export type UnlinkXboxAccountRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
}

export type UnlinkXboxAccountResult = {
}

--- Specify the container and optionally the catalogVersion for the container to 
--- open 
export type UnlockContainerInstanceRequest = {
	CatalogVersion: string?, --- Specifies the catalog version that should be used to determine container contents. If unspecified, uses catalog associated with the item instance.
	CharacterId: string?, --- Unique PlayFab assigned ID for a specific character owned by a user
	ContainerItemInstanceId: string, --- ItemInstanceId of the container to unlock.
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	KeyItemInstanceId: string?, --- ItemInstanceId of the key that will be consumed by unlocking this container. If the container requires a key, this parameter is required.
}

--- Specify the type of container to open and optionally the catalogVersion for 
--- the container to open 
export type UnlockContainerItemRequest = {
	CatalogVersion: string?, --- Specifies the catalog version that should be used to determine container contents. If unspecified, uses default/primary catalog.
	CharacterId: string?, --- Unique PlayFab assigned ID for a specific character owned by a user
	ContainerItemId: string, --- Catalog ItemId of the container type to unlock.
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
}

--- The items and vc found within the container. These will be added and stacked 
--- in the appropriate inventory. 
export type UnlockContainerItemResult = {
	GrantedItems: {ItemInstance}?, --- Items granted to the player as a result of unlocking the container.
	UnlockedItemInstanceId: string?, --- Unique instance identifier of the container unlocked.
	UnlockedWithItemInstanceId: string?, --- Unique instance identifier of the key used to unlock the container, if applicable.
	VirtualCurrency: {[any]: any}?, --- Virtual currency granted to the player as a result of unlocking the container.
}

export type UpdateAvatarUrlRequest = {
	ImageUrl: string, --- URL of the avatar image. If empty, it removes the existing avatar URL.
}

--- This function performs an additive update of the arbitrary strings containing 
--- the custom data for the character. In updating the custom data object, keys 
--- which already exist in the object will have their values overwritten, while 
--- keys with null values will be removed. New keys will be added, with the given 
--- values. No other key-value pairs will be changed apart from those specified 
--- in the call. 
export type UpdateCharacterDataRequest = {
	CharacterId: string, --- Unique PlayFab assigned ID for a specific character owned by a user
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	Data: {[any]: any}?, --- Key-value pairs to be written to the custom data. Note that keys are trimmed of whitespace, are limited in size, and may not begin with a '!' character or be null.
	KeysToRemove: {any}?, --- Optional list of Data-keys to remove from UserData. Some SDKs cannot insert null-values into Data due to language constraints. Use this to delete the keys directly.
	Permission: string?, --- Permission to be applied to all user data keys written in this request. Defaults to "private" if not set.
}

export type UpdateCharacterDataResult = {
	DataVersion: number, --- Indicates the current version of the data that has been set. This is incremented with every set call for that type of data (read-only, internal, etc). This version can be provided in Get calls to find updated data.
}

--- Enable this option with the 'Allow Client to Post Player Statistics' option 
--- in PlayFab GameManager for your title. However, this is not best practice, as 
--- this data will no longer be safely controlled by the server. This operation 
--- is additive. Character Statistics not currently defined will be added, while 
--- those already defined will be updated with the given values. All other user 
--- statistics will remain unchanged. Character statistics are used by the character-leaderboard 
--- apis, and accessible for custom game-logic. 
export type UpdateCharacterStatisticsRequest = {
	CharacterId: string, --- Unique PlayFab assigned ID for a specific character owned by a user
	CharacterStatistics: {[any]: any}?, --- Statistics to be updated with the provided values, in the Key(string), Value(int) pattern.
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
}

export type UpdateCharacterStatisticsResult = {
}

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
export type UpdatePlayerStatisticsRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	Statistics: {StatisticUpdate}, --- Statistics to be updated with the provided values
}

export type UpdatePlayerStatisticsResult = {
}

--- Note that in the case of multiple calls to write to the same shared group data 
--- keys, the last write received by the PlayFab service will determine the value 
--- available to subsequent read operations. For scenarios requiring coordination 
--- of data updates, it is recommended that titles make use of user data with read 
--- permission set to public, or a combination of user data and shared group data. 
export type UpdateSharedGroupDataRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	Data: {[any]: any}?, --- Key-value pairs to be written to the custom data. Note that keys are trimmed of whitespace, are limited in size, and may not begin with a '!' character or be null.
	KeysToRemove: {any}?, --- Optional list of Data-keys to remove from UserData. Some SDKs cannot insert null-values into Data due to language constraints. Use this to delete the keys directly.
	Permission: string?, --- Permission to be applied to all user data keys in this request.
	SharedGroupId: string, --- Unique identifier for the shared group.
}

export type UpdateSharedGroupDataResult = {
}

--- This function performs an additive update of the arbitrary strings containing 
--- the custom data for the user. In updating the custom data object, keys which 
--- already exist in the object will have their values overwritten, while keys with 
--- null values will be removed. New keys will be added, with the given values. 
--- No other key-value pairs will be changed apart from those specified in the call. 
export type UpdateUserDataRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	Data: {[any]: any}?, --- Key-value pairs to be written to the custom data. Note that keys are trimmed of whitespace, are limited in size, and may not begin with a '!' character or be null.
	KeysToRemove: {any}?, --- Optional list of Data-keys to remove from UserData. Some SDKs cannot insert null-values into Data due to language constraints. Use this to delete the keys directly.
	Permission: string?, --- Permission to be applied to all user data keys written in this request. Defaults to "private" if not set. This is used for requests by one player for information about another player; those requests will only return Public keys.
}

export type UpdateUserDataResult = {
	DataVersion: number, --- Indicates the current version of the data that has been set. This is incremented with every set call for that type of data (read-only, internal, etc). This version can be provided in Get calls to find updated data.
}

--- In addition to the PlayFab username, titles can make use of a DisplayName which 
--- is also a unique identifier, but specific to the title. This allows for unique 
--- names which more closely match the theme or genre of a title, for example. 
export type UpdateUserTitleDisplayNameRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	DisplayName: string, --- New title display name for the user - must be between 3 and 25 characters.
}

export type UpdateUserTitleDisplayNameResult = {
	DisplayName: string?, --- Current title display name for the user (this will be the original display name if the rename attempt failed).
}

export type UserAccountInfo = {
	AndroidDeviceInfo: UserAndroidDeviceInfo?, --- User Android device information, if an Android device has been linked
	AppleAccountInfo: UserAppleIdInfo?, --- Sign in with Apple account information, if an Apple account has been linked
	Created: string, --- Timestamp indicating when the user account was created
	CustomIdInfo: UserCustomIdInfo?, --- Custom ID information, if a custom ID has been assigned
	FacebookInfo: UserFacebookInfo?, --- User Facebook information, if a Facebook account has been linked
	FacebookInstantGamesIdInfo: UserFacebookInstantGamesIdInfo?, --- Facebook Instant Games account information, if a Facebook Instant Games account has been linked
	GameCenterInfo: UserGameCenterInfo?, --- User Gamecenter information, if a Gamecenter account has been linked
	GoogleInfo: UserGoogleInfo?, --- User Google account information, if a Google account has been linked
	GooglePlayGamesInfo: UserGooglePlayGamesInfo?, --- User Google Play Games account information, if a Google Play Games account has been linked
	IosDeviceInfo: UserIosDeviceInfo?, --- User iOS device information, if an iOS device has been linked
	KongregateInfo: UserKongregateInfo?, --- User Kongregate account information, if a Kongregate account has been linked
	NintendoSwitchAccountInfo: UserNintendoSwitchAccountIdInfo?, --- Nintendo Switch account information, if a Nintendo Switch account has been linked
	NintendoSwitchDeviceIdInfo: UserNintendoSwitchDeviceIdInfo?, --- Nintendo Switch device information, if a Nintendo Switch device has been linked
	OpenIdInfo: {UserOpenIdInfo}?, --- OpenID Connect information, if any OpenID Connect accounts have been linked
	PlayFabId: string?, --- Unique identifier for the user account
	PrivateInfo: UserPrivateAccountInfo?, --- Personal information for the user which is considered more sensitive
	PsnInfo: UserPsnInfo?, --- User PlayStation :tm: Network account information, if a PlayStation :tm: Network account has been linked
	SteamInfo: UserSteamInfo?, --- User Steam information, if a Steam account has been linked
	TitleInfo: UserTitleInfo?, --- Title-specific information for the user account
	TwitchInfo: UserTwitchInfo?, --- User Twitch account information, if a Twitch account has been linked
	Username: string?, --- User account name in the PlayFab service
	XboxInfo: UserXboxInfo?, --- User XBox account information, if a XBox account has been linked
}

export type UserAndroidDeviceInfo = {
	AndroidDeviceId: string?, --- Android device ID
}

export type UserAppleIdInfo = {
	AppleSubjectId: string?, --- Apple subject ID
}

export type UserCustomIdInfo = {
	CustomId: string?, --- Custom ID
}

--- Indicates whether a given data key is private (readable only by the player) 
--- or public (readable by all players). When a player makes a GetUserData request 
--- about another player, only keys marked Public will be returned. 
export type UserDataPermission = 
	"Private"
	| "Public"

export type UserDataRecord = {
	LastUpdated: string, --- Timestamp for when this data was last updated.
	Permission: string?, --- Indicates whether this data can be read by all users (public) or only the user (private). This is used for GetUserData requests being made by one player about another player.
	Value: string?, --- Data stored for the specified user data key.
}

export type UserFacebookInfo = {
	FacebookId: string?, --- Facebook identifier
	FullName: string?, --- Facebook full name
}

export type UserFacebookInstantGamesIdInfo = {
	FacebookInstantGamesId: string?, --- Facebook Instant Games ID
}

export type UserGameCenterInfo = {
	GameCenterId: string?, --- Gamecenter identifier
}

export type UserGoogleInfo = {
	GoogleEmail: string?, --- Email address of the Google account
	GoogleGender: string?, --- Gender information of the Google account
	GoogleId: string?, --- Google ID
	GoogleLocale: string?, --- Locale of the Google account
	GoogleName: string?, --- Name of the Google account user
}

export type UserGooglePlayGamesInfo = {
	GooglePlayGamesPlayerAvatarImageUrl: string?, --- Avatar image url of the Google Play Games player
	GooglePlayGamesPlayerDisplayName: string?, --- Display name of the Google Play Games player
	GooglePlayGamesPlayerId: string?, --- Google Play Games player ID
}

export type UserIosDeviceInfo = {
	IosDeviceId: string?, --- iOS device ID
}

export type UserKongregateInfo = {
	KongregateId: string?, --- Kongregate ID
	KongregateName: string?, --- Kongregate Username
}

export type UserNintendoSwitchAccountIdInfo = {
	NintendoSwitchAccountSubjectId: string?, --- Nintendo Switch account subject ID
}

export type UserNintendoSwitchDeviceIdInfo = {
	NintendoSwitchDeviceId: string?, --- Nintendo Switch Device ID
}

export type UserOpenIdInfo = {
	ConnectionId: string?, --- OpenID Connection ID
	Issuer: string?, --- OpenID Issuer
	Subject: string?, --- OpenID Subject
}

export type UserOrigination = 
	"Organic"
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

export type UserPrivateAccountInfo = {
	Email: string?, --- user email address
}

export type UserPsnInfo = {
	PsnAccountId: string?, --- PlayStation :tm: Network account ID
	PsnOnlineId: string?, --- PlayStation :tm: Network online ID
}

export type UserSettings = {
	GatherDeviceInfo: boolean, --- Boolean for whether this player is eligible for gathering device info.
	GatherFocusInfo: boolean, --- Boolean for whether this player should report OnFocus play-time tracking.
	NeedsAttribution: boolean, --- Boolean for whether this player is eligible for ad tracking.
}

export type UserSteamInfo = {
	SteamActivationStatus: string?, --- what stage of game ownership the user is listed as being in, from Steam
	SteamCountry: string?, --- the country in which the player resides, from Steam data
	SteamCurrency: string?, --- currency type set in the user Steam account
	SteamId: string?, --- Steam identifier
	SteamName: string?, --- Steam display name
}

export type UserTitleInfo = {
	AvatarUrl: string?, --- URL to the player's avatar.
	Created: string, --- timestamp indicating when the user was first associated with this game (this can differ significantly from when the user first registered with PlayFab)
	DisplayName: string?, --- name of the user, as it is displayed in-game
	FirstLogin: string?, --- timestamp indicating when the user first signed into this game (this can differ from the Created timestamp, as other events, such as issuing a beta key to the user, can associate the title to the user)
	LastLogin: string?, --- timestamp for the last user login for this title
	Origination: string?, --- source by which the user first joined the game, if known
	TitlePlayerAccount: EntityKey?, --- Title player account entity for this user
	isBanned: boolean?, --- boolean indicating whether or not the user is currently banned for a title
}

export type UserTwitchInfo = {
	TwitchId: string?, --- Twitch ID
	TwitchUserName: string?, --- Twitch Username
}

export type UserXboxInfo = {
	XboxUserId: string?, --- XBox user ID
	XboxUserSandbox: string?, --- XBox user sandbox
}

export type ValidateAmazonReceiptRequest = {
	CatalogVersion: string?, --- Catalog version of the fulfilled items. If null, defaults to the primary catalog.
	CurrencyCode: string?, --- Currency used to pay for the purchase (ISO 4217 currency code).
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	PurchasePrice: number, --- Amount of the stated currency paid, in centesimal units.
	ReceiptId: string, --- ReceiptId returned by the Amazon App Store in-app purchase API
	UserId: string, --- AmazonId of the user making the purchase as returned by the Amazon App Store in-app purchase API
}

--- Once verified, the catalog item matching the Amazon item name will be added 
--- to the user's inventory. This result should be used for immediate updates to 
--- the local client game state as opposed to the GetUserInventory API which can 
--- have an up to half second delay. 
export type ValidateAmazonReceiptResult = {
	Fulfillments: {PurchaseReceiptFulfillment}?, --- Fulfilled inventory items and recorded purchases in fulfillment of the validated receipt transactions.
}

--- The packageName and productId are defined in the GooglePlay store. The productId 
--- must match the ItemId of the inventory item in the PlayFab catalog for the title. 
--- This enables the PlayFab service to securely validate that the purchase is for 
--- the correct item, in order to prevent uses from passing valid receipts as being 
--- for more expensive items (passing a receipt for a 99-cent purchase as being 
--- for a $19.99 purchase, for example). Each receipt may be validated only once 
--- to avoid granting the same item over and over from a single purchase. 
export type ValidateGooglePlayPurchaseRequest = {
	CatalogVersion: string?, --- Catalog version of the fulfilled items. If null, defaults to the primary catalog.
	CurrencyCode: string?, --- Currency used to pay for the purchase (ISO 4217 currency code).
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	PurchasePrice: number?, --- Amount of the stated currency paid, in centesimal units.
	ReceiptJson: string, --- Original JSON string returned by the Google Play IAB API.
	Signature: string, --- Signature returned by the Google Play IAB API.
}

--- Once verified, the catalog item (ItemId) matching the GooglePlay store item 
--- (productId) will be added to the user's inventory. This result should be used 
--- for immediate updates to the local client game state as opposed to the GetUserInventory 
--- API which can have an up to half second delay. 
export type ValidateGooglePlayPurchaseResult = {
	Fulfillments: {PurchaseReceiptFulfillment}?, --- Fulfilled inventory items and recorded purchases in fulfillment of the validated receipt transactions.
}

--- The CurrencyCode and PurchasePrice must match the price which was set up for 
--- the item in the Apple store. In addition, The ItemId of the inventory in the 
--- PlayFab Catalog must match the Product ID as it was set up in the Apple store. 
--- This enables the PlayFab service to securely validate that the purchase is for 
--- the correct item, in order to prevent uses from passing valid receipts as being 
--- for more expensive items (passing a receipt for a 99-cent purchase as being 
--- for a $19.99 purchase, for example). 
export type ValidateIOSReceiptRequest = {
	CatalogVersion: string?, --- Catalog version of the fulfilled items. If null, defaults to the primary catalog.
	CurrencyCode: string?, --- Currency used to pay for the purchase (ISO 4217 currency code).
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	PurchasePrice: number, --- Amount of the stated currency paid, in centesimal units.
	ReceiptData: string, --- Base64 encoded receipt data, passed back by the App Store as a result of a successful purchase.
}

--- Once verified, the catalog item matching the iTunes item name will be added 
--- to the user's inventory. This result should be used for immediate updates to 
--- the local client game state as opposed to the GetUserInventory API which can 
--- have an up to half second delay. 
export type ValidateIOSReceiptResult = {
	Fulfillments: {PurchaseReceiptFulfillment}?, --- Fulfilled inventory items and recorded purchases in fulfillment of the validated receipt transactions.
}

export type ValidateWindowsReceiptRequest = {
	CatalogVersion: string?, --- Catalog version of the fulfilled items. If null, defaults to the primary catalog.
	CurrencyCode: string, --- Currency used to pay for the purchase (ISO 4217 currency code).
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	PurchasePrice: number, --- Amount of the stated currency paid, in centesimal units.
	Receipt: string, --- XML Receipt returned by the Windows App Store in-app purchase API
}

--- Once verified, the catalog item matching the Product name will be added to the 
--- user's inventory. This result should be used for immediate updates to the local 
--- client game state as opposed to the GetUserInventory API which can have an up 
--- to half second delay. 
export type ValidateWindowsReceiptResult = {
	Fulfillments: {PurchaseReceiptFulfillment}?, --- Fulfilled inventory items and recorded purchases in fulfillment of the validated receipt transactions.
}

export type ValueToDateModel = {
	Currency: string?, --- ISO 4217 code of the currency used in the purchases
	TotalValue: number, --- Total value of the purchases in a whole number of 1/100 monetary units. For example, 999 indicates nine dollars and ninety-nine cents when Currency is 'USD')
	TotalValueAsDecimal: string?, --- Total value of the purchases in a string representation of decimal monetary units. For example, '9.99' indicates nine dollars and ninety-nine cents when Currency is 'USD'.
}

export type Variable = {
	Name: string, --- Name of the variable.
	Value: string?, --- Value of the variable.
}

export type VirtualCurrencyRechargeTime = {
	RechargeMax: number, --- Maximum value to which the regenerating currency will automatically increment. Note that it can exceed this value through use of the AddUserVirtualCurrency API call. However, it will not regenerate automatically until it has fallen below this value.
	RechargeTime: string, --- Server timestamp in UTC indicating the next time the virtual currency will be incremented.
	SecondsToRecharge: number, --- Time remaining (in seconds) before the next recharge increment of the virtual currency.
}

--- This API is designed to write a multitude of different client-defined events 
--- into PlayStream. It supports a flexible JSON schema, which allowsfor arbitrary 
--- key-value pairs to describe any character-based event. The created event will 
--- be locked to the authenticated title and player.  
export type WriteClientCharacterEventRequest = {
	Body: {[any]: any}?, --- Custom event properties. Each property consists of a name (string) and a value (JSON object).
	CharacterId: string, --- Unique PlayFab assigned ID for a specific character owned by a user
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	EventName: string, --- The name of the event, within the namespace scoped to the title. The naming convention is up to the caller, but it commonly follows the subject_verb_object pattern (e.g. player_logged_in).
	Timestamp: string?, --- The time (in UTC) associated with this event. The value defaults to the current time.
}

--- This API is designed to write a multitude of different event types into PlayStream. 
--- It supports a flexible JSON schema, which allowsfor arbitrary key-value pairs 
--- to describe any player-based event. The created event will be locked to the 
--- authenticated title and player.  
export type WriteClientPlayerEventRequest = {
	Body: {[any]: any}?, --- Custom data properties associated with the event. Each property consists of a name (string) and a value (JSON object).
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	EventName: string, --- The name of the event, within the namespace scoped to the title. The naming convention is up to the caller, but it commonly follows the subject_verb_object pattern (e.g. player_logged_in).
	Timestamp: string?, --- The time (in UTC) associated with this event. The value defaults to the current time.
}

export type WriteEventResponse = {
	EventId: string?, --- The unique identifier of the event. The values of this identifier consist of ASCII characters and are not constrained to any particular format.
}

--- This API is designed to write a multitude of different client-defined events 
--- into PlayStream. It supports a flexible JSON schema, which allowsfor arbitrary 
--- key-value pairs to describe any title-based event. The created event will be 
--- locked to the authenticated title.  
export type WriteTitleEventRequest = {
	Body: {[any]: any}?, --- Custom event properties. Each property consists of a name (string) and a value (JSON object).
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	EventName: string, --- The name of the event, within the namespace scoped to the title. The naming convention is up to the caller, but it commonly follows the subject_verb_object pattern (e.g. player_logged_in).
	Timestamp: string?, --- The time (in UTC) associated with this event. The value defaults to the current time.
}

export type XboxLiveAccountPlayFabIdPair = {
	PlayFabId: string?, --- Unique PlayFab identifier for a user, or null if no PlayFab account is linked to the Xbox Live identifier.
	XboxLiveAccountId: string?, --- Unique Xbox Live identifier for a user.
}


--- https://docs.microsoft.com/rest/api/playfab/client/trading/accepttrade
function ClientApi.AcceptTradeAsync(
	sessionTicket: string, 
	request: AcceptTradeRequest
): AcceptTradeResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Client/AcceptTrade",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/friend-list-management/addfriend
function ClientApi.AddFriendAsync(
	sessionTicket: string, 
	request: AddFriendRequest
): AddFriendResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Client/AddFriend",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/account-management/addgenericid
function ClientApi.AddGenericIDAsync(
	sessionTicket: string, 
	request: AddGenericIDRequest
): AddGenericIDResult | ApiErrorWrapper
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
function ClientApi.AddOrUpdateContactEmailAsync(
	sessionTicket: string, 
	request: AddOrUpdateContactEmailRequest
): AddOrUpdateContactEmailResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Client/AddOrUpdateContactEmail",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/shared-group-data/addsharedgroupmembers
function ClientApi.AddSharedGroupMembersAsync(
	sessionTicket: string, 
	request: AddSharedGroupMembersRequest
): AddSharedGroupMembersResult | ApiErrorWrapper
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
function ClientApi.AddUserVirtualCurrencyAsync(
	sessionTicket: string, 
	request: AddUserVirtualCurrencyRequest
): ModifyUserVirtualCurrencyResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Client/AddUserVirtualCurrency",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/account-management/addusernamepassword
function ClientApi.AddUsernamePasswordAsync(
	sessionTicket: string, 
	request: AddUsernamePasswordRequest
): AddUsernamePasswordResult | ApiErrorWrapper
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
function ClientApi.AndroidDevicePushNotificationRegistrationAsync(
	sessionTicket: string, 
	request: AndroidDevicePushNotificationRegistrationRequest
): AndroidDevicePushNotificationRegistrationResult | ApiErrorWrapper
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
function ClientApi.AttributeInstallAsync(
	sessionTicket: string, 
	request: AttributeInstallRequest
): AttributeInstallResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Client/AttributeInstall",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/trading/canceltrade
function ClientApi.CancelTradeAsync(
	sessionTicket: string, 
	request: CancelTradeRequest
): CancelTradeResponse | ApiErrorWrapper
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
function ClientApi.ConfirmPurchaseAsync(
	sessionTicket: string, 
	request: ConfirmPurchaseRequest
): ConfirmPurchaseResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Client/ConfirmPurchase",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/player-item-management/consumeitem
function ClientApi.ConsumeItemAsync(
	sessionTicket: string, 
	request: ConsumeItemRequest
): ConsumeItemResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Client/ConsumeItem",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/platform-specific-methods/consumemicrosoftstoreentitlements
function ClientApi.ConsumeMicrosoftStoreEntitlementsAsync(
	sessionTicket: string, 
	request: ConsumeMicrosoftStoreEntitlementsRequest
): ConsumeMicrosoftStoreEntitlementsResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Client/ConsumeMicrosoftStoreEntitlements",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/platform-specific-methods/consumeps5entitlements
function ClientApi.ConsumePS5EntitlementsAsync(
	sessionTicket: string, 
	request: ConsumePS5EntitlementsRequest
): ConsumePS5EntitlementsResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Client/ConsumePS5Entitlements",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/platform-specific-methods/consumepsnentitlements
function ClientApi.ConsumePSNEntitlementsAsync(
	sessionTicket: string, 
	request: ConsumePSNEntitlementsRequest
): ConsumePSNEntitlementsResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Client/ConsumePSNEntitlements",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/platform-specific-methods/consumexboxentitlements
function ClientApi.ConsumeXboxEntitlementsAsync(
	sessionTicket: string, 
	request: ConsumeXboxEntitlementsRequest
): ConsumeXboxEntitlementsResult | ApiErrorWrapper
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
function ClientApi.CreateSharedGroupAsync(
	sessionTicket: string, 
	request: CreateSharedGroupRequest
): CreateSharedGroupResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Client/CreateSharedGroup",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/server-side-cloud-script/executecloudscript
function ClientApi.ExecuteCloudScriptAsync(
	sessionTicket: string, 
	request: ExecuteCloudScriptRequest
): ExecuteCloudScriptResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Client/ExecuteCloudScript",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/account-management/getaccountinfo
function ClientApi.GetAccountInfoAsync(
	sessionTicket: string, 
	request: GetAccountInfoRequest
): GetAccountInfoResult | ApiErrorWrapper
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
function ClientApi.GetAdPlacementsAsync(
	sessionTicket: string, 
	request: GetAdPlacementsRequest
): GetAdPlacementsResult | ApiErrorWrapper
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
function ClientApi.GetAllUsersCharactersAsync(
	sessionTicket: string, 
	request: ListUsersCharactersRequest
): ListUsersCharactersResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Client/GetAllUsersCharacters",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/title-wide-data-management/getcatalogitems
function ClientApi.GetCatalogItemsAsync(
	sessionTicket: string, 
	request: GetCatalogItemsRequest
): GetCatalogItemsResult | ApiErrorWrapper
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
function ClientApi.GetCharacterDataAsync(
	sessionTicket: string, 
	request: GetCharacterDataRequest
): GetCharacterDataResult | ApiErrorWrapper
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
function ClientApi.GetCharacterInventoryAsync(
	sessionTicket: string, 
	request: GetCharacterInventoryRequest
): GetCharacterInventoryResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Client/GetCharacterInventory",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/characters/getcharacterleaderboard
function ClientApi.GetCharacterLeaderboardAsync(
	sessionTicket: string, 
	request: GetCharacterLeaderboardRequest
): GetCharacterLeaderboardResult | ApiErrorWrapper
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
function ClientApi.GetCharacterReadOnlyDataAsync(
	sessionTicket: string, 
	request: GetCharacterDataRequest
): GetCharacterDataResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Client/GetCharacterReadOnlyData",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/characters/getcharacterstatistics
function ClientApi.GetCharacterStatisticsAsync(
	sessionTicket: string, 
	request: GetCharacterStatisticsRequest
): GetCharacterStatisticsResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Client/GetCharacterStatistics",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/content/getcontentdownloadurl
function ClientApi.GetContentDownloadUrlAsync(
	sessionTicket: string, 
	request: GetContentDownloadUrlRequest
): GetContentDownloadUrlResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Client/GetContentDownloadUrl",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/matchmaking/getcurrentgames
function ClientApi.GetCurrentGamesAsync(
	sessionTicket: string, 
	request: CurrentGamesRequest
): CurrentGamesResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Client/GetCurrentGames",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/player-data-management/getfriendleaderboard
function ClientApi.GetFriendLeaderboardAsync(
	sessionTicket: string, 
	request: GetFriendLeaderboardRequest
): GetLeaderboardResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Client/GetFriendLeaderboard",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/player-data-management/getfriendleaderboardaroundplayer
function ClientApi.GetFriendLeaderboardAroundPlayerAsync(
	sessionTicket: string, 
	request: GetFriendLeaderboardAroundPlayerRequest
): GetFriendLeaderboardAroundPlayerResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Client/GetFriendLeaderboardAroundPlayer",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/friend-list-management/getfriendslist
function ClientApi.GetFriendsListAsync(
	sessionTicket: string, 
	request: GetFriendsListRequest
): GetFriendsListResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Client/GetFriendsList",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/matchmaking/getgameserverregions
function ClientApi.GetGameServerRegionsAsync(
	sessionTicket: string, 
	request: GameServerRegionsRequest
): GameServerRegionsResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Client/GetGameServerRegions",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/player-data-management/getleaderboard
function ClientApi.GetLeaderboardAsync(
	sessionTicket: string, 
	request: GetLeaderboardRequest
): GetLeaderboardResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Client/GetLeaderboard",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/characters/getleaderboardaroundcharacter
function ClientApi.GetLeaderboardAroundCharacterAsync(
	sessionTicket: string, 
	request: GetLeaderboardAroundCharacterRequest
): GetLeaderboardAroundCharacterResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Client/GetLeaderboardAroundCharacter",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/player-data-management/getleaderboardaroundplayer
function ClientApi.GetLeaderboardAroundPlayerAsync(
	sessionTicket: string, 
	request: GetLeaderboardAroundPlayerRequest
): GetLeaderboardAroundPlayerResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Client/GetLeaderboardAroundPlayer",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/characters/getleaderboardforusercharacters
function ClientApi.GetLeaderboardForUserCharactersAsync(
	sessionTicket: string, 
	request: GetLeaderboardForUsersCharactersRequest
): GetLeaderboardForUsersCharactersResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Client/GetLeaderboardForUserCharacters",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/player-item-management/getpaymenttoken
function ClientApi.GetPaymentTokenAsync(
	sessionTicket: string, 
	request: GetPaymentTokenRequest
): GetPaymentTokenResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Client/GetPaymentToken",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/authentication/getphotonauthenticationtoken
function ClientApi.GetPhotonAuthenticationTokenAsync(
	sessionTicket: string, 
	request: GetPhotonAuthenticationTokenRequest
): GetPhotonAuthenticationTokenResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Client/GetPhotonAuthenticationToken",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/account-management/getplayfabidsfromfacebookids
function ClientApi.GetPlayFabIDsFromFacebookIDsAsync(
	sessionTicket: string, 
	request: GetPlayFabIDsFromFacebookIDsRequest
): GetPlayFabIDsFromFacebookIDsResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Client/GetPlayFabIDsFromFacebookIDs",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/account-management/getplayfabidsfromfacebookinstantgamesids
function ClientApi.GetPlayFabIDsFromFacebookInstantGamesIdsAsync(
	sessionTicket: string, 
	request: GetPlayFabIDsFromFacebookInstantGamesIdsRequest
): GetPlayFabIDsFromFacebookInstantGamesIdsResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Client/GetPlayFabIDsFromFacebookInstantGamesIds",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/account-management/getplayfabidsfromgamecenterids
function ClientApi.GetPlayFabIDsFromGameCenterIDsAsync(
	sessionTicket: string, 
	request: GetPlayFabIDsFromGameCenterIDsRequest
): GetPlayFabIDsFromGameCenterIDsResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Client/GetPlayFabIDsFromGameCenterIDs",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/account-management/getplayfabidsfromgenericids
function ClientApi.GetPlayFabIDsFromGenericIDsAsync(
	sessionTicket: string, 
	request: GetPlayFabIDsFromGenericIDsRequest
): GetPlayFabIDsFromGenericIDsResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Client/GetPlayFabIDsFromGenericIDs",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/account-management/getplayfabidsfromgoogleids
function ClientApi.GetPlayFabIDsFromGoogleIDsAsync(
	sessionTicket: string, 
	request: GetPlayFabIDsFromGoogleIDsRequest
): GetPlayFabIDsFromGoogleIDsResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Client/GetPlayFabIDsFromGoogleIDs",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/account-management/getplayfabidsfromgoogleplaygamesplayerids
function ClientApi.GetPlayFabIDsFromGooglePlayGamesPlayerIDsAsync(
	sessionTicket: string, 
	request: GetPlayFabIDsFromGooglePlayGamesPlayerIDsRequest
): GetPlayFabIDsFromGooglePlayGamesPlayerIDsResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Client/GetPlayFabIDsFromGooglePlayGamesPlayerIDs",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/account-management/getplayfabidsfromkongregateids
function ClientApi.GetPlayFabIDsFromKongregateIDsAsync(
	sessionTicket: string, 
	request: GetPlayFabIDsFromKongregateIDsRequest
): GetPlayFabIDsFromKongregateIDsResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Client/GetPlayFabIDsFromKongregateIDs",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/account-management/getplayfabidsfromnintendoserviceaccountids
function ClientApi.GetPlayFabIDsFromNintendoServiceAccountIdsAsync(
	sessionTicket: string, 
	request: GetPlayFabIDsFromNintendoServiceAccountIdsRequest
): GetPlayFabIDsFromNintendoServiceAccountIdsResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Client/GetPlayFabIDsFromNintendoServiceAccountIds",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/account-management/getplayfabidsfromnintendoswitchdeviceids
function ClientApi.GetPlayFabIDsFromNintendoSwitchDeviceIdsAsync(
	sessionTicket: string, 
	request: GetPlayFabIDsFromNintendoSwitchDeviceIdsRequest
): GetPlayFabIDsFromNintendoSwitchDeviceIdsResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Client/GetPlayFabIDsFromNintendoSwitchDeviceIds",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/account-management/getplayfabidsfrompsnaccountids
function ClientApi.GetPlayFabIDsFromPSNAccountIDsAsync(
	sessionTicket: string, 
	request: GetPlayFabIDsFromPSNAccountIDsRequest
): GetPlayFabIDsFromPSNAccountIDsResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Client/GetPlayFabIDsFromPSNAccountIDs",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/account-management/getplayfabidsfromsteamids
function ClientApi.GetPlayFabIDsFromSteamIDsAsync(
	sessionTicket: string, 
	request: GetPlayFabIDsFromSteamIDsRequest
): GetPlayFabIDsFromSteamIDsResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Client/GetPlayFabIDsFromSteamIDs",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/account-management/getplayfabidsfromtwitchids
function ClientApi.GetPlayFabIDsFromTwitchIDsAsync(
	sessionTicket: string, 
	request: GetPlayFabIDsFromTwitchIDsRequest
): GetPlayFabIDsFromTwitchIDsResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Client/GetPlayFabIDsFromTwitchIDs",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/account-management/getplayfabidsfromxboxliveids
function ClientApi.GetPlayFabIDsFromXboxLiveIDsAsync(
	sessionTicket: string, 
	request: GetPlayFabIDsFromXboxLiveIDsRequest
): GetPlayFabIDsFromXboxLiveIDsResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Client/GetPlayFabIDsFromXboxLiveIDs",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/account-management/getplayercombinedinfo
function ClientApi.GetPlayerCombinedInfoAsync(
	sessionTicket: string, 
	request: GetPlayerCombinedInfoRequest
): GetPlayerCombinedInfoResult | ApiErrorWrapper
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
function ClientApi.GetPlayerProfileAsync(
	sessionTicket: string, 
	request: GetPlayerProfileRequest
): GetPlayerProfileResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Client/GetPlayerProfile",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/playstream/getplayersegments
function ClientApi.GetPlayerSegmentsAsync(
	sessionTicket: string, 
	request: GetPlayerSegmentsRequest
): GetPlayerSegmentsResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Client/GetPlayerSegments",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/player-data-management/getplayerstatisticversions
function ClientApi.GetPlayerStatisticVersionsAsync(
	sessionTicket: string, 
	request: GetPlayerStatisticVersionsRequest
): GetPlayerStatisticVersionsResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Client/GetPlayerStatisticVersions",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/player-data-management/getplayerstatistics
function ClientApi.GetPlayerStatisticsAsync(
	sessionTicket: string, 
	request: GetPlayerStatisticsRequest
): GetPlayerStatisticsResult | ApiErrorWrapper
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
function ClientApi.GetPlayerTagsAsync(
	sessionTicket: string, 
	request: GetPlayerTagsRequest
): GetPlayerTagsResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Client/GetPlayerTags",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/trading/getplayertrades
function ClientApi.GetPlayerTradesAsync(
	sessionTicket: string, 
	request: GetPlayerTradesRequest
): GetPlayerTradesResponse | ApiErrorWrapper
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
function ClientApi.GetPublisherDataAsync(
	sessionTicket: string, 
	request: GetPublisherDataRequest
): GetPublisherDataResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Client/GetPublisherData",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/player-item-management/getpurchase
function ClientApi.GetPurchaseAsync(
	sessionTicket: string, 
	request: GetPurchaseRequest
): GetPurchaseResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Client/GetPurchase",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/shared-group-data/getsharedgroupdata
function ClientApi.GetSharedGroupDataAsync(
	sessionTicket: string, 
	request: GetSharedGroupDataRequest
): GetSharedGroupDataResult | ApiErrorWrapper
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
function ClientApi.GetStoreItemsAsync(
	sessionTicket: string, 
	request: GetStoreItemsRequest
): GetStoreItemsResult | ApiErrorWrapper
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
function ClientApi.GetTimeAsync(
	sessionTicket: string, 
	request: GetTimeRequest
): GetTimeResult | ApiErrorWrapper
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
function ClientApi.GetTitleDataAsync(
	sessionTicket: string, 
	request: GetTitleDataRequest
): GetTitleDataResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Client/GetTitleData",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/title-wide-data-management/gettitlenews
function ClientApi.GetTitleNewsAsync(
	sessionTicket: string, 
	request: GetTitleNewsRequest
): GetTitleNewsResult | ApiErrorWrapper
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
function ClientApi.GetTitlePublicKeyAsync(
	request: GetTitlePublicKeyRequest
): GetTitlePublicKeyResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Client/GetTitlePublicKey",
		request,
		nil,
		nil
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/trading/gettradestatus
function ClientApi.GetTradeStatusAsync(
	sessionTicket: string, 
	request: GetTradeStatusRequest
): GetTradeStatusResponse | ApiErrorWrapper
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
function ClientApi.GetUserDataAsync(
	sessionTicket: string, 
	request: GetUserDataRequest
): GetUserDataResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Client/GetUserData",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/player-item-management/getuserinventory
function ClientApi.GetUserInventoryAsync(
	sessionTicket: string, 
	request: GetUserInventoryRequest
): GetUserInventoryResult | ApiErrorWrapper
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
function ClientApi.GetUserPublisherDataAsync(
	sessionTicket: string, 
	request: GetUserDataRequest
): GetUserDataResult | ApiErrorWrapper
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
function ClientApi.GetUserPublisherReadOnlyDataAsync(
	sessionTicket: string, 
	request: GetUserDataRequest
): GetUserDataResult | ApiErrorWrapper
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
function ClientApi.GetUserReadOnlyDataAsync(
	sessionTicket: string, 
	request: GetUserDataRequest
): GetUserDataResult | ApiErrorWrapper
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
function ClientApi.GrantCharacterToUserAsync(
	sessionTicket: string, 
	request: GrantCharacterToUserRequest
): GrantCharacterToUserResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Client/GrantCharacterToUser",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/account-management/linkandroiddeviceid
function ClientApi.LinkAndroidDeviceIDAsync(
	sessionTicket: string, 
	request: LinkAndroidDeviceIDRequest
): LinkAndroidDeviceIDResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Client/LinkAndroidDeviceID",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/account-management/linkapple
function ClientApi.LinkAppleAsync(
	sessionTicket: string, 
	request: LinkAppleRequest
): EmptyResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Client/LinkApple",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/account-management/linkcustomid
function ClientApi.LinkCustomIDAsync(
	sessionTicket: string, 
	request: LinkCustomIDRequest
): LinkCustomIDResult | ApiErrorWrapper
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
function ClientApi.LinkFacebookAccountAsync(
	sessionTicket: string, 
	request: LinkFacebookAccountRequest
): LinkFacebookAccountResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Client/LinkFacebookAccount",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/account-management/linkfacebookinstantgamesid
function ClientApi.LinkFacebookInstantGamesIdAsync(
	sessionTicket: string, 
	request: LinkFacebookInstantGamesIdRequest
): LinkFacebookInstantGamesIdResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Client/LinkFacebookInstantGamesId",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/account-management/linkgamecenteraccount
function ClientApi.LinkGameCenterAccountAsync(
	sessionTicket: string, 
	request: LinkGameCenterAccountRequest
): LinkGameCenterAccountResult | ApiErrorWrapper
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
function ClientApi.LinkGoogleAccountAsync(
	sessionTicket: string, 
	request: LinkGoogleAccountRequest
): LinkGoogleAccountResult | ApiErrorWrapper
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
function ClientApi.LinkGooglePlayGamesServicesAccountAsync(
	sessionTicket: string, 
	request: LinkGooglePlayGamesServicesAccountRequest
): LinkGooglePlayGamesServicesAccountResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Client/LinkGooglePlayGamesServicesAccount",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/account-management/linkiosdeviceid
function ClientApi.LinkIOSDeviceIDAsync(
	sessionTicket: string, 
	request: LinkIOSDeviceIDRequest
): LinkIOSDeviceIDResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Client/LinkIOSDeviceID",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/account-management/linkkongregate
function ClientApi.LinkKongregateAsync(
	sessionTicket: string, 
	request: LinkKongregateAccountRequest
): LinkKongregateAccountResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Client/LinkKongregate",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/account-management/linknintendoserviceaccount
function ClientApi.LinkNintendoServiceAccountAsync(
	sessionTicket: string, 
	request: LinkNintendoServiceAccountRequest
): EmptyResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Client/LinkNintendoServiceAccount",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/account-management/linknintendoswitchdeviceid
function ClientApi.LinkNintendoSwitchDeviceIdAsync(
	sessionTicket: string, 
	request: LinkNintendoSwitchDeviceIdRequest
): LinkNintendoSwitchDeviceIdResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Client/LinkNintendoSwitchDeviceId",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/account-management/linkopenidconnect
function ClientApi.LinkOpenIdConnectAsync(
	sessionTicket: string, 
	request: LinkOpenIdConnectRequest
): EmptyResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Client/LinkOpenIdConnect",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/account-management/linkpsnaccount
function ClientApi.LinkPSNAccountAsync(
	sessionTicket: string, 
	request: LinkPSNAccountRequest
): LinkPSNAccountResult | ApiErrorWrapper
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
function ClientApi.LinkSteamAccountAsync(
	sessionTicket: string, 
	request: LinkSteamAccountRequest
): LinkSteamAccountResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Client/LinkSteamAccount",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/account-management/linktwitch
function ClientApi.LinkTwitchAsync(
	sessionTicket: string, 
	request: LinkTwitchAccountRequest
): LinkTwitchAccountResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Client/LinkTwitch",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/account-management/linkxboxaccount
function ClientApi.LinkXboxAccountAsync(
	sessionTicket: string, 
	request: LinkXboxAccountRequest
): LinkXboxAccountResult | ApiErrorWrapper
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
function ClientApi.LoginWithAndroidDeviceIDAsync(
	request: LoginWithAndroidDeviceIDRequest
): LoginResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Client/LoginWithAndroidDeviceID",
		request,
		nil,
		nil
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/authentication/loginwithapple
function ClientApi.LoginWithAppleAsync(
	request: LoginWithAppleRequest
): LoginResult | ApiErrorWrapper
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
function ClientApi.LoginWithCustomIDAsync(
	request: LoginWithCustomIDRequest
): LoginResult | ApiErrorWrapper
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
function ClientApi.LoginWithEmailAddressAsync(
	request: LoginWithEmailAddressRequest
): LoginResult | ApiErrorWrapper
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
function ClientApi.LoginWithFacebookAsync(
	request: LoginWithFacebookRequest
): LoginResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Client/LoginWithFacebook",
		request,
		nil,
		nil
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/authentication/loginwithfacebookinstantgamesid
function ClientApi.LoginWithFacebookInstantGamesIdAsync(
	request: LoginWithFacebookInstantGamesIdRequest
): LoginResult | ApiErrorWrapper
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
function ClientApi.LoginWithGameCenterAsync(
	request: LoginWithGameCenterRequest
): LoginResult | ApiErrorWrapper
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
function ClientApi.LoginWithGoogleAccountAsync(
	request: LoginWithGoogleAccountRequest
): LoginResult | ApiErrorWrapper
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
function ClientApi.LoginWithGooglePlayGamesServicesAsync(
	request: LoginWithGooglePlayGamesServicesRequest
): LoginResult | ApiErrorWrapper
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
function ClientApi.LoginWithIOSDeviceIDAsync(
	request: LoginWithIOSDeviceIDRequest
): LoginResult | ApiErrorWrapper
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
function ClientApi.LoginWithKongregateAsync(
	request: LoginWithKongregateRequest
): LoginResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Client/LoginWithKongregate",
		request,
		nil,
		nil
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/authentication/loginwithnintendoserviceaccount
function ClientApi.LoginWithNintendoServiceAccountAsync(
	request: LoginWithNintendoServiceAccountRequest
): LoginResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Client/LoginWithNintendoServiceAccount",
		request,
		nil,
		nil
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/authentication/loginwithnintendoswitchdeviceid
function ClientApi.LoginWithNintendoSwitchDeviceIdAsync(
	request: LoginWithNintendoSwitchDeviceIdRequest
): LoginResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Client/LoginWithNintendoSwitchDeviceId",
		request,
		nil,
		nil
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/authentication/loginwithopenidconnect
function ClientApi.LoginWithOpenIdConnectAsync(
	request: LoginWithOpenIdConnectRequest
): LoginResult | ApiErrorWrapper
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
function ClientApi.LoginWithPSNAsync(
	request: LoginWithPSNRequest
): LoginResult | ApiErrorWrapper
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
function ClientApi.LoginWithPlayFabAsync(
	request: LoginWithPlayFabRequest
): LoginResult | ApiErrorWrapper
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
function ClientApi.LoginWithSteamAsync(
	request: LoginWithSteamRequest
): LoginResult | ApiErrorWrapper
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
function ClientApi.LoginWithTwitchAsync(
	request: LoginWithTwitchRequest
): LoginResult | ApiErrorWrapper
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
function ClientApi.LoginWithXboxAsync(
	request: LoginWithXboxRequest
): LoginResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Client/LoginWithXbox",
		request,
		nil,
		nil
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/matchmaking/matchmake
function ClientApi.MatchmakeAsync(
	sessionTicket: string, 
	request: MatchmakeRequest
): MatchmakeResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Client/Matchmake",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/trading/opentrade
function ClientApi.OpenTradeAsync(
	sessionTicket: string, 
	request: OpenTradeRequest
): OpenTradeResponse | ApiErrorWrapper
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
function ClientApi.PayForPurchaseAsync(
	sessionTicket: string, 
	request: PayForPurchaseRequest
): PayForPurchaseResult | ApiErrorWrapper
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
function ClientApi.PurchaseItemAsync(
	sessionTicket: string, 
	request: PurchaseItemRequest
): PurchaseItemResult | ApiErrorWrapper
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
function ClientApi.RedeemCouponAsync(
	sessionTicket: string, 
	request: RedeemCouponRequest
): RedeemCouponResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Client/RedeemCoupon",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/platform-specific-methods/refreshpsnauthtoken
function ClientApi.RefreshPSNAuthTokenAsync(
	sessionTicket: string, 
	request: RefreshPSNAuthTokenRequest
): EmptyResponse | ApiErrorWrapper
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
function ClientApi.RegisterForIOSPushNotificationAsync(
	sessionTicket: string, 
	request: RegisterForIOSPushNotificationRequest
): RegisterForIOSPushNotificationResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Client/RegisterForIOSPushNotification",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/authentication/registerplayfabuser
function ClientApi.RegisterPlayFabUserAsync(
	request: RegisterPlayFabUserRequest
): RegisterPlayFabUserResult | ApiErrorWrapper
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
function ClientApi.RemoveContactEmailAsync(
	sessionTicket: string, 
	request: RemoveContactEmailRequest
): RemoveContactEmailResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Client/RemoveContactEmail",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/friend-list-management/removefriend
function ClientApi.RemoveFriendAsync(
	sessionTicket: string, 
	request: RemoveFriendRequest
): RemoveFriendResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Client/RemoveFriend",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/account-management/removegenericid
function ClientApi.RemoveGenericIDAsync(
	sessionTicket: string, 
	request: RemoveGenericIDRequest
): RemoveGenericIDResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Client/RemoveGenericID",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/shared-group-data/removesharedgroupmembers
function ClientApi.RemoveSharedGroupMembersAsync(
	sessionTicket: string, 
	request: RemoveSharedGroupMembersRequest
): RemoveSharedGroupMembersResult | ApiErrorWrapper
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
function ClientApi.ReportAdActivityAsync(
	sessionTicket: string, 
	request: ReportAdActivityRequest
): ReportAdActivityResult | ApiErrorWrapper
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
function ClientApi.ReportDeviceInfoAsync(
	sessionTicket: string, 
	request: DeviceInfoRequest
): EmptyResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Client/ReportDeviceInfo",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/account-management/reportplayer
function ClientApi.ReportPlayerAsync(
	sessionTicket: string, 
	request: ReportPlayerClientRequest
): ReportPlayerClientResult | ApiErrorWrapper
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
function ClientApi.RestoreIOSPurchasesAsync(
	sessionTicket: string, 
	request: RestoreIOSPurchasesRequest
): RestoreIOSPurchasesResult | ApiErrorWrapper
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
function ClientApi.RewardAdActivityAsync(
	sessionTicket: string, 
	request: RewardAdActivityRequest
): RewardAdActivityResult | ApiErrorWrapper
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
function ClientApi.SendAccountRecoveryEmailAsync(
	request: SendAccountRecoveryEmailRequest
): SendAccountRecoveryEmailResult | ApiErrorWrapper
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
function ClientApi.SetFriendTagsAsync(
	sessionTicket: string, 
	request: SetFriendTagsRequest
): SetFriendTagsResult | ApiErrorWrapper
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
function ClientApi.SetPlayerSecretAsync(
	sessionTicket: string, 
	request: SetPlayerSecretRequest
): SetPlayerSecretResult | ApiErrorWrapper
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
function ClientApi.StartPurchaseAsync(
	sessionTicket: string, 
	request: StartPurchaseRequest
): StartPurchaseResult | ApiErrorWrapper
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
function ClientApi.SubtractUserVirtualCurrencyAsync(
	sessionTicket: string, 
	request: SubtractUserVirtualCurrencyRequest
): ModifyUserVirtualCurrencyResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Client/SubtractUserVirtualCurrency",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/account-management/unlinkandroiddeviceid
function ClientApi.UnlinkAndroidDeviceIDAsync(
	sessionTicket: string, 
	request: UnlinkAndroidDeviceIDRequest
): UnlinkAndroidDeviceIDResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Client/UnlinkAndroidDeviceID",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/account-management/unlinkapple
function ClientApi.UnlinkAppleAsync(
	sessionTicket: string, 
	request: UnlinkAppleRequest
): EmptyResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Client/UnlinkApple",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/account-management/unlinkcustomid
function ClientApi.UnlinkCustomIDAsync(
	sessionTicket: string, 
	request: UnlinkCustomIDRequest
): UnlinkCustomIDResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Client/UnlinkCustomID",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/account-management/unlinkfacebookaccount
function ClientApi.UnlinkFacebookAccountAsync(
	sessionTicket: string, 
	request: UnlinkFacebookAccountRequest
): UnlinkFacebookAccountResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Client/UnlinkFacebookAccount",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/account-management/unlinkfacebookinstantgamesid
function ClientApi.UnlinkFacebookInstantGamesIdAsync(
	sessionTicket: string, 
	request: UnlinkFacebookInstantGamesIdRequest
): UnlinkFacebookInstantGamesIdResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Client/UnlinkFacebookInstantGamesId",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/account-management/unlinkgamecenteraccount
function ClientApi.UnlinkGameCenterAccountAsync(
	sessionTicket: string, 
	request: UnlinkGameCenterAccountRequest
): UnlinkGameCenterAccountResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Client/UnlinkGameCenterAccount",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/account-management/unlinkgoogleaccount
function ClientApi.UnlinkGoogleAccountAsync(
	sessionTicket: string, 
	request: UnlinkGoogleAccountRequest
): UnlinkGoogleAccountResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Client/UnlinkGoogleAccount",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/account-management/unlinkgoogleplaygamesservicesaccount
function ClientApi.UnlinkGooglePlayGamesServicesAccountAsync(
	sessionTicket: string, 
	request: UnlinkGooglePlayGamesServicesAccountRequest
): UnlinkGooglePlayGamesServicesAccountResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Client/UnlinkGooglePlayGamesServicesAccount",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/account-management/unlinkiosdeviceid
function ClientApi.UnlinkIOSDeviceIDAsync(
	sessionTicket: string, 
	request: UnlinkIOSDeviceIDRequest
): UnlinkIOSDeviceIDResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Client/UnlinkIOSDeviceID",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/account-management/unlinkkongregate
function ClientApi.UnlinkKongregateAsync(
	sessionTicket: string, 
	request: UnlinkKongregateAccountRequest
): UnlinkKongregateAccountResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Client/UnlinkKongregate",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/account-management/unlinknintendoserviceaccount
function ClientApi.UnlinkNintendoServiceAccountAsync(
	sessionTicket: string, 
	request: UnlinkNintendoServiceAccountRequest
): EmptyResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Client/UnlinkNintendoServiceAccount",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/account-management/unlinknintendoswitchdeviceid
function ClientApi.UnlinkNintendoSwitchDeviceIdAsync(
	sessionTicket: string, 
	request: UnlinkNintendoSwitchDeviceIdRequest
): UnlinkNintendoSwitchDeviceIdResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Client/UnlinkNintendoSwitchDeviceId",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/account-management/unlinkopenidconnect
function ClientApi.UnlinkOpenIdConnectAsync(
	sessionTicket: string, 
	request: UnlinkOpenIdConnectRequest
): EmptyResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Client/UnlinkOpenIdConnect",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/account-management/unlinkpsnaccount
function ClientApi.UnlinkPSNAccountAsync(
	sessionTicket: string, 
	request: UnlinkPSNAccountRequest
): UnlinkPSNAccountResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Client/UnlinkPSNAccount",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/account-management/unlinksteamaccount
function ClientApi.UnlinkSteamAccountAsync(
	sessionTicket: string, 
	request: UnlinkSteamAccountRequest
): UnlinkSteamAccountResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Client/UnlinkSteamAccount",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/account-management/unlinktwitch
function ClientApi.UnlinkTwitchAsync(
	sessionTicket: string, 
	request: UnlinkTwitchAccountRequest
): UnlinkTwitchAccountResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Client/UnlinkTwitch",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/account-management/unlinkxboxaccount
function ClientApi.UnlinkXboxAccountAsync(
	sessionTicket: string, 
	request: UnlinkXboxAccountRequest
): UnlinkXboxAccountResult | ApiErrorWrapper
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
function ClientApi.UnlockContainerInstanceAsync(
	sessionTicket: string, 
	request: UnlockContainerInstanceRequest
): UnlockContainerItemResult | ApiErrorWrapper
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
function ClientApi.UnlockContainerItemAsync(
	sessionTicket: string, 
	request: UnlockContainerItemRequest
): UnlockContainerItemResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Client/UnlockContainerItem",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/account-management/updateavatarurl
function ClientApi.UpdateAvatarUrlAsync(
	sessionTicket: string, 
	request: UpdateAvatarUrlRequest
): EmptyResponse | ApiErrorWrapper
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
function ClientApi.UpdateCharacterDataAsync(
	sessionTicket: string, 
	request: UpdateCharacterDataRequest
): UpdateCharacterDataResult | ApiErrorWrapper
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
function ClientApi.UpdateCharacterStatisticsAsync(
	sessionTicket: string, 
	request: UpdateCharacterStatisticsRequest
): UpdateCharacterStatisticsResult | ApiErrorWrapper
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
function ClientApi.UpdatePlayerStatisticsAsync(
	sessionTicket: string, 
	request: UpdatePlayerStatisticsRequest
): UpdatePlayerStatisticsResult | ApiErrorWrapper
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
function ClientApi.UpdateSharedGroupDataAsync(
	sessionTicket: string, 
	request: UpdateSharedGroupDataRequest
): UpdateSharedGroupDataResult | ApiErrorWrapper
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
function ClientApi.UpdateUserDataAsync(
	sessionTicket: string, 
	request: UpdateUserDataRequest
): UpdateUserDataResult | ApiErrorWrapper
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
function ClientApi.UpdateUserPublisherDataAsync(
	sessionTicket: string, 
	request: UpdateUserDataRequest
): UpdateUserDataResult | ApiErrorWrapper
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
function ClientApi.UpdateUserTitleDisplayNameAsync(
	sessionTicket: string, 
	request: UpdateUserTitleDisplayNameRequest
): UpdateUserTitleDisplayNameResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Client/UpdateUserTitleDisplayName",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/platform-specific-methods/validateamazoniapreceipt
function ClientApi.ValidateAmazonIAPReceiptAsync(
	sessionTicket: string, 
	request: ValidateAmazonReceiptRequest
): ValidateAmazonReceiptResult | ApiErrorWrapper
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
function ClientApi.ValidateGooglePlayPurchaseAsync(
	sessionTicket: string, 
	request: ValidateGooglePlayPurchaseRequest
): ValidateGooglePlayPurchaseResult | ApiErrorWrapper
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
function ClientApi.ValidateIOSReceiptAsync(
	sessionTicket: string, 
	request: ValidateIOSReceiptRequest
): ValidateIOSReceiptResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Client/ValidateIOSReceipt",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--- https://docs.microsoft.com/rest/api/playfab/client/platform-specific-methods/validatewindowsstorereceipt
function ClientApi.ValidateWindowsStoreReceiptAsync(
	sessionTicket: string, 
	request: ValidateWindowsReceiptRequest
): ValidateWindowsReceiptResult | ApiErrorWrapper
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
function ClientApi.WriteCharacterEventAsync(
	sessionTicket: string, 
	request: WriteClientCharacterEventRequest
): WriteEventResponse | ApiErrorWrapper
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
function ClientApi.WritePlayerEventAsync(
	sessionTicket: string, 
	request: WriteClientPlayerEventRequest
): WriteEventResponse | ApiErrorWrapper
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
function ClientApi.WriteTitleEventAsync(
	sessionTicket: string, 
	request: WriteTitleEventRequest
): WriteEventResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Client/WriteTitleEvent",
		request,
		"X-Authorization",
		sessionTicket
	)
end

return ClientApi
