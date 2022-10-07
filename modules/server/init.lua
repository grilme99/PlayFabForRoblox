--!strict
--[=[
	# ServerApi

	Provides functionality to allow external (developer-controlled) servers to interact 
	with user inventories and data in a trusted manner, and to handle matchmaking 
	and client connection orchestration. 
]=]

local PlayFabInternal = require(script.Parent.PlayFabInternal)

local ServerApi = {}

function ServerApi.SetSettings(settings: PlayFabInternal.ISettings)
	PlayFabInternal.SetSettings(settings)
end

export type AdCampaignAttribution = {
	--- UTC time stamp of attribution 
	AttributedAt: string,
	--- Attribution campaign identifier 
	CampaignId: string?,
	--- Attribution network name 
	Platform: string?,
}

export type AdCampaignAttributionModel = {
	--- UTC time stamp of attribution 
	AttributedAt: string,
	--- Attribution campaign identifier 
	CampaignId: string?,
	--- Attribution network name 
	Platform: string?,
}

export type AddCharacterVirtualCurrencyRequest = {
	--- Amount to be added to the character balance of the specified virtual currency. 
	--- Maximum VC balance is Int32 (2,147,483,647). Any increase over this value will 
	--- be discarded. 
	Amount: number,
	--- Unique PlayFab assigned ID for a specific character owned by a user 
	CharacterId: string,
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- PlayFab unique identifier of the user whose virtual currency balance is to be 
	--- incremented. 
	PlayFabId: string,
	--- Name of the virtual currency which is to be incremented. 
	VirtualCurrency: string,
}

export type AddFriendRequest = {
	--- Email address of the user being added. 
	FriendEmail: string?,
	--- The PlayFab identifier of the user being added. 
	FriendPlayFabId: string?,
	--- Title-specific display name of the user to being added. 
	FriendTitleDisplayName: string?,
	--- The PlayFab username of the user being added 
	FriendUsername: string?,
	--- PlayFab identifier of the player to add a new friend. 
	PlayFabId: string,
}

export type AddGenericIDRequest = {
	--- Generic service identifier to add to the player account. 
	GenericId: GenericServiceId,
	--- PlayFabId of the user to link. 
	PlayFabId: string,
}

--- This API will trigger a player_tag_added event and add a tag with the given 
--- TagName and PlayFabID to the corresponding player profile. TagName can be used 
--- for segmentation and it is limited to 256 characters. Also there is a limit 
--- on the number of tags a title can have. 
export type AddPlayerTagRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- Unique PlayFab assigned ID of the user on whom the operation will be performed. 
	PlayFabId: string,
	--- Unique tag for player profile. 
	TagName: string,
}

export type AddPlayerTagResult = {
}

export type AddSharedGroupMembersRequest = {
	--- An array of unique PlayFab assigned ID of the user on whom the operation will 
	--- be performed. 
	PlayFabIds: {any},
	--- Unique identifier for the shared group. 
	SharedGroupId: string,
}

export type AddSharedGroupMembersResult = {
}

export type AddUserVirtualCurrencyRequest = {
	--- Amount to be added to the user balance of the specified virtual currency. Maximum 
	--- VC balance is Int32 (2,147,483,647). Any increase over this value will be discarded. 
	Amount: number,
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- PlayFab unique identifier of the user whose virtual currency balance is to be 
	--- increased. 
	PlayFabId: string,
	--- Name of the virtual currency which is to be incremented. 
	VirtualCurrency: string,
}

export type AdvancedPushPlatformMsg = {
	--- Stops GoogleCloudMessaging notifications from including both notification and 
	--- data properties and instead only sends the data property. 
	GCMDataOnly: boolean?,
	--- The Json the platform should receive. 
	Json: string,
	--- The platform that should receive the Json. 
	Platform: string,
}

--- The basic wrapper around every failed API response 
export type ApiErrorWrapper = {
	--- Numerical HTTP code 
	code: number,
	--- Playfab error code 
	error: string?,
	--- Numerical PlayFab error code 
	errorCode: number,
	--- Detailed description of individual issues with the request object 
	errorDetails: {[any]: any}?,
	--- Description for the PlayFab errorCode 
	errorMessage: string?,
	--- String HTTP code 
	status: string?,
}

--- Note that data returned may be Personally Identifying Information (PII), such 
--- as email address, and so care should be taken in how this data is stored and 
--- managed. Since this call will always return the relevant information for users 
--- who have accessed the title, the recommendation is to not store this data locally. 
export type AuthenticateSessionTicketRequest = {
	--- Session ticket as issued by a PlayFab client login API. 
	SessionTicket: string,
}

export type AuthenticateSessionTicketResult = {
	--- Indicates if token was expired at request time. 
	IsSessionTicketExpired: boolean?,
	--- Account info for the user whose session ticket was supplied. 
	UserInfo: UserAccountInfo?,
}

export type AwardSteamAchievementItem = {
	--- Unique Steam achievement name. 
	AchievementName: string,
	--- Unique PlayFab assigned ID of the user on whom the operation will be performed. 
	PlayFabId: string,
	--- Result of the award attempt (only valid on response, not on request). 
	Result: boolean,
}

export type AwardSteamAchievementRequest = {
	--- Array of achievements to grant and the users to whom they are to be granted. 
	Achievements: {AwardSteamAchievementItem},
}

export type AwardSteamAchievementResult = {
	--- Array of achievements granted. 
	AchievementResults: {AwardSteamAchievementItem}?,
}

--- Contains information for a ban. 
export type BanInfo = {
	--- The active state of this ban. Expired bans may still have this value set to 
	--- true but they will have no effect. 
	Active: boolean,
	--- The unique Ban Id associated with this ban. 
	BanId: string?,
	--- The time when this ban was applied. 
	Created: string?,
	--- The time when this ban expires. Permanent bans do not have expiration date. 
	Expires: string?,
	--- The IP address on which the ban was applied. May affect multiple players. 
	IPAddress: string?,
	--- Unique PlayFab assigned ID of the user on whom the operation will be performed. 
	PlayFabId: string?,
	--- The reason why this ban was applied. 
	Reason: string?,
}

--- Represents a single ban request. 
export type BanRequest = {
	--- The duration in hours for the ban. Leave this blank for a permanent ban. 
	DurationInHours: number?,
	--- IP address to be banned. May affect multiple players. 
	IPAddress: string?,
	--- Unique PlayFab assigned ID of the user on whom the operation will be performed. 
	PlayFabId: string,
	--- The reason for this ban. Maximum 140 characters. 
	Reason: string?,
}

--- The existence of each user will not be verified. When banning by IP or MAC address, 
--- multiple players may be affected, so use this feature with caution. Returns 
--- information about the new bans. 
export type BanUsersRequest = {
	--- List of ban requests to be applied. Maximum 100. 
	Bans: {BanRequest},
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
}

export type BanUsersResult = {
	--- Information on the bans that were applied 
	BanData: {BanInfo}?,
}

--- A purchasable item from the item catalog 
export type CatalogItem = {
	--- defines the bundle properties for the item - bundles are items which contain 
	--- other items, including random drop tables and virtual currencies 
	Bundle: CatalogItemBundleInfo?,
	--- if true, then an item instance of this type can be used to grant a character 
	--- to a user. 
	CanBecomeCharacter: boolean,
	--- catalog version for this item 
	CatalogVersion: string?,
	--- defines the consumable properties (number of uses, timeout) for the item 
	Consumable: CatalogItemConsumableInfo?,
	--- defines the container properties for the item - what items it contains, including 
	--- random drop tables and virtual currencies, and what item (if any) is required 
	--- to open it via the UnlockContainerItem API 
	Container: CatalogItemContainerInfo?,
	--- game specific custom data 
	CustomData: string?,
	--- text description of item, to show in-game 
	Description: string?,
	--- text name for the item, to show in-game 
	DisplayName: string?,
	--- If the item has IsLImitedEdition set to true, and this is the first time this 
	--- ItemId has been defined as a limited edition item, this value determines the 
	--- total number of instances to allocate for the title. Once this limit has been 
	--- reached, no more instances of this ItemId can be created, and attempts to purchase 
	--- or grant it will return a Result of false for that ItemId. If the item has already 
	--- been defined to have a limited edition count, or if this value is less than 
	--- zero, it will be ignored. 
	InitialLimitedEditionCount: number,
	--- BETA: If true, then only a fixed number can ever be granted. 
	IsLimitedEdition: boolean,
	--- if true, then only one item instance of this type will exist and its remaininguses 
	--- will be incremented instead. RemainingUses will cap out at Int32.Max (2,147,483,647). 
	--- All subsequent increases will be discarded 
	IsStackable: boolean,
	--- if true, then an item instance of this type can be traded between players using 
	--- the trading APIs 
	IsTradable: boolean,
	--- class to which the item belongs 
	ItemClass: string?,
	--- unique identifier for this item 
	ItemId: string,
	--- URL to the item image. For Facebook purchase to display the image on the item 
	--- purchase page, this must be set to an HTTP URL. 
	ItemImageUrl: string?,
	--- override prices for this item for specific currencies 
	RealCurrencyPrices: {[any]: any}?,
	--- list of item tags 
	Tags: {any}?,
	--- price of this item in virtual currencies and "RM" (the base Real Money purchase 
	--- price, in USD pennies) 
	VirtualCurrencyPrices: {[any]: any}?,
}

export type CatalogItemBundleInfo = {
	--- unique ItemId values for all items which will be added to the player inventory 
	--- when the bundle is added 
	BundledItems: {any}?,
	--- unique TableId values for all RandomResultTable objects which are part of the 
	--- bundle (random tables will be resolved and add the relevant items to the player 
	--- inventory when the bundle is added) 
	BundledResultTables: {any}?,
	--- virtual currency types and balances which will be added to the player inventory 
	--- when the bundle is added 
	BundledVirtualCurrencies: {[any]: any}?,
}

export type CatalogItemConsumableInfo = {
	--- number of times this object can be used, after which it will be removed from 
	--- the player inventory 
	UsageCount: number?,
	--- duration in seconds for how long the item will remain in the player inventory 
	--- - once elapsed, the item will be removed (recommended minimum value is 5 seconds, 
	--- as lower values can cause the item to expire before operations depending on 
	--- this item's details have completed) 
	UsagePeriod: number?,
	--- all inventory item instances in the player inventory sharing a non-null UsagePeriodGroup 
	--- have their UsagePeriod values added together, and share the result - when that 
	--- period has elapsed, all the items in the group will be removed 
	UsagePeriodGroup: string?,
}

--- Containers are inventory items that can hold other items defined in the catalog, 
--- as well as virtual currency, which is added to the player inventory when the 
--- container is unlocked, using the UnlockContainerItem API. The items can be anything 
--- defined in the catalog, as well as RandomResultTable objects which will be resolved 
--- when the container is unlocked. Containers and their keys should be defined 
--- as Consumable (having a limited number of uses) in their catalog defintiions, 
--- unless the intent is for the player to be able to re-use them infinitely. 
export type CatalogItemContainerInfo = {
	--- unique ItemId values for all items which will be added to the player inventory, 
	--- once the container has been unlocked 
	ItemContents: {any}?,
	--- ItemId for the catalog item used to unlock the container, if any (if not specified, 
	--- a call to UnlockContainerItem will open the container, adding the contents to 
	--- the player inventory and currency balances) 
	KeyItemId: string?,
	--- unique TableId values for all RandomResultTable objects which are part of the 
	--- container (once unlocked, random tables will be resolved and add the relevant 
	--- items to the player inventory) 
	ResultTableContents: {any}?,
	--- virtual currency types and balances which will be added to the player inventory 
	--- when the container is unlocked 
	VirtualCurrencyContents: {[any]: any}?,
}

export type CharacterInventory = {
	--- The id of this character. 
	CharacterId: string?,
	--- The inventory of this character. 
	Inventory: {ItemInstance}?,
}

export type CharacterLeaderboardEntry = {
	--- PlayFab unique identifier of the character that belongs to the user for this 
	--- leaderboard entry. 
	CharacterId: string?,
	--- Title-specific display name of the character for this leaderboard entry. 
	CharacterName: string?,
	--- Name of the character class for this entry. 
	CharacterType: string?,
	--- Title-specific display name of the user for this leaderboard entry. 
	DisplayName: string?,
	--- PlayFab unique identifier of the user for this leaderboard entry. 
	PlayFabId: string?,
	--- User's overall position in the leaderboard. 
	Position: number,
	--- Specific value of the user's statistic. 
	StatValue: number,
}

export type CharacterResult = {
	--- The id for this character on this player. 
	CharacterId: string?,
	--- The name of this character. 
	CharacterName: string?,
	--- The type-string that was given to this character on creation. 
	CharacterType: string?,
}

export type CloudScriptRevisionOption = 
	"Live"
	| "Latest"
	| "Specific"

export type ConsumeItemRequest = {
	--- Unique PlayFab assigned ID for a specific character owned by a user 
	CharacterId: string?,
	--- Number of uses to consume from the item. 
	ConsumeCount: number,
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- Unique instance identifier of the item to be consumed. 
	ItemInstanceId: string,
	--- Unique PlayFab assigned ID of the user on whom the operation will be performed. 
	PlayFabId: string,
}

export type ConsumeItemResult = {
	--- Unique instance identifier of the item with uses consumed. 
	ItemInstanceId: string?,
	--- Number of uses remaining on the item. 
	RemainingUses: number,
}

export type ContactEmailInfo = {
	--- The email address 
	EmailAddress: string?,
	--- The name of the email info data 
	Name: string?,
	--- The verification status of the email 
	VerificationStatus: string?,
}

export type ContactEmailInfoModel = {
	--- The email address 
	EmailAddress: string?,
	--- The name of the email info data 
	Name: string?,
	--- The verification status of the email 
	VerificationStatus: string?,
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
	--- Unique identifier for the shared group (a random identifier will be assigned, 
	--- if one is not specified). 
	SharedGroupId: string?,
}

export type CreateSharedGroupResult = {
	--- Unique identifier for the shared group. 
	SharedGroupId: string?,
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

--- This function will delete the specified character from the list allowed by the 
--- user, and will also delete any inventory or VC currently held by that character. 
--- It will NOT delete any statistics associated for this character, in order to 
--- preserve leaderboard integrity. 
export type DeleteCharacterFromUserRequest = {
	--- Unique PlayFab assigned ID for a specific character owned by a user 
	CharacterId: string,
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- Unique PlayFab assigned ID of the user on whom the operation will be performed. 
	PlayFabId: string,
	--- If true, the character's inventory will be transferred up to the owning user; 
	--- otherwise, this request will purge those items. 
	SaveCharacterInventory: boolean,
}

export type DeleteCharacterFromUserResult = {
}

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
export type DeletePlayerRequest = {
	--- Unique PlayFab assigned ID of the user on whom the operation will be performed. 
	PlayFabId: string,
}

export type DeletePlayerResult = {
}

--- Represents the request to delete a push notification template. 
export type DeletePushNotificationTemplateRequest = {
	--- Id of the push notification template to be deleted. 
	PushNotificationTemplateId: string,
}

export type DeletePushNotificationTemplateResult = {
}

export type DeleteSharedGroupRequest = {
	--- Unique identifier for the shared group. 
	SharedGroupId: string,
}

export type DeregisterGameRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- Unique identifier for the Game Server Instance that is being deregistered. 
	LobbyId: string,
}

export type DeregisterGameResponse = {
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
	--- Unique ID of the entity. 
	Id: string,
	--- Entity type. See https://docs.microsoft.com/gaming/playfab/features/data/entities/available-built-in-entity-types 
	Type: string?,
}

export type EntityTokenResponse = {
	--- The entity id and type. 
	Entity: EntityKey?,
	--- The token used to set X-EntityToken for all entity based API calls. 
	EntityToken: string?,
	--- The time the token will expire, if it is an expiring token, in UTC. 
	TokenExpiration: string?,
}

export type EvaluateRandomResultTableRequest = {
	--- Specifies the catalog version that should be used to evaluate the Random Result 
	--- Table. If unspecified, uses default/primary catalog. 
	CatalogVersion: string?,
	--- The unique identifier of the Random Result Table to use. 
	TableId: string,
}

--- Note that if the Random Result Table contains no entries, or does not exist 
--- for the catalog specified (the Primary catalog if one is not specified), an 
--- InvalidDropTable error will be returned. 
export type EvaluateRandomResultTableResult = {
	--- Unique identifier for the item returned from the Random Result Table evaluation, 
	--- for the given catalog. 
	ResultItemId: string?,
}

export type ExecuteCloudScriptResult = {
	--- Number of PlayFab API requests issued by the CloudScript function 
	APIRequestsIssued: number,
	--- Information about the error, if any, that occurred during execution 
	Error: ScriptExecutionError?,
	ExecutionTimeSeconds: number,
	--- The name of the function that executed 
	FunctionName: string?,
	--- The object returned from the CloudScript function, if any 
	FunctionResult: {[any]: any}?,
	--- Flag indicating if the FunctionResult was too large and was subsequently dropped 
	--- from this event. This only occurs if the total event size is larger than 350KB. 
	FunctionResultTooLarge: boolean?,
	--- Number of external HTTP requests issued by the CloudScript function 
	HttpRequestsIssued: number,
	--- Entries logged during the function execution. These include both entries logged 
	--- in the function code using log.info() and log.error() and error entries for 
	--- API and HTTP request failures. 
	Logs: {LogStatement}?,
	--- Flag indicating if the logs were too large and were subsequently dropped from 
	--- this event. This only occurs if the total event size is larger than 350KB after 
	--- the FunctionResult was removed. 
	LogsTooLarge: boolean?,
	MemoryConsumedBytes: number,
	--- Processor time consumed while executing the function. This does not include 
	--- time spent waiting on API calls or HTTP requests. 
	ProcessorTimeSeconds: number,
	--- The revision of the CloudScript that executed 
	Revision: number,
}

export type ExecuteCloudScriptServerRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The name of the CloudScript function to execute 
	FunctionName: string,
	--- Object that is passed in to the function as the first argument 
	FunctionParameter: {[any]: any}?,
	--- Generate a 'player_executed_cloudscript' PlayStream event containing the results 
	--- of the function execution and other contextual information. This event will 
	--- show up in the PlayStream debugger console for the player in Game Manager. 
	GeneratePlayStreamEvent: boolean?,
	--- The unique user identifier for the player on whose behalf the script is being 
	--- run 
	PlayFabId: string,
	--- Option for which revision of the CloudScript to execute. 'Latest' executes the 
	--- most recently created revision, 'Live' executes the current live, published 
	--- revision, and 'Specific' executes the specified revision. The default value 
	--- is 'Specific', if the SpeificRevision parameter is specified, otherwise it is 
	--- 'Live'. 
	RevisionSelection: string?,
	--- The specivic revision to execute, when RevisionSelection is set to 'Specific' 
	SpecificRevision: number?,
}

export type FacebookInstantGamesPlayFabIdPair = {
	--- Unique Facebook Instant Games identifier for a user. 
	FacebookInstantGamesId: string?,
	--- Unique PlayFab identifier for a user, or null if no PlayFab account is linked 
	--- to the Facebook Instant Games identifier. 
	PlayFabId: string?,
}

export type FacebookPlayFabIdPair = {
	--- Unique Facebook identifier for a user. 
	FacebookId: string?,
	--- Unique PlayFab identifier for a user, or null if no PlayFab account is linked 
	--- to the Facebook identifier. 
	PlayFabId: string?,
}

export type FriendInfo = {
	--- Available Facebook information (if the user and PlayFab friend are also connected 
	--- in Facebook). 
	FacebookInfo: UserFacebookInfo?,
	--- PlayFab unique identifier for this friend. 
	FriendPlayFabId: string?,
	--- Available Game Center information (if the user and PlayFab friend are also connected 
	--- in Game Center). 
	GameCenterInfo: UserGameCenterInfo?,
	--- Available PlayStation :tm: Network information, if the user and PlayFab friend 
	--- are both connected to PlayStation :tm: Network. 
	PSNInfo: UserPsnInfo?,
	--- The profile of the user, if requested. 
	Profile: PlayerProfileModel?,
	--- Available Steam information (if the user and PlayFab friend are also connected 
	--- in Steam). 
	SteamInfo: UserSteamInfo?,
	--- Tags which have been associated with this friend. 
	Tags: {any}?,
	--- Title-specific display name for this friend. 
	TitleDisplayName: string?,
	--- PlayFab unique username for this friend. 
	Username: string?,
	--- Available Xbox information, if the user and PlayFab friend are both connected 
	--- to Xbox Live. 
	XboxInfo: UserXboxInfo?,
}

export type GameInstanceState = 
	"Open"
	| "Closed"

export type GenericErrorCodes = 
	"Success"
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
	| "ReportNotAvailable"
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
	| "StorageAccountNotFound"
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
	| "SnapshotNotFound"
	| "InventoryApiNotImplemented"
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
	| "EventSamplingInvalidRatio"
	| "EventSamplingInvalidEventNamespace"
	| "EventSamplingInvalidEventName"
	| "EventSamplingRatioNotFound"
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
	| "OperationCanceled"
	| "InvalidDisplayNameRandomSuffixLength"
	| "AllowNonUniquePlayerDisplayNamesDisableNotAllowed"

export type GenericPlayFabIdPair = {
	--- Unique generic service identifier for a user. 
	GenericId: GenericServiceId?,
	--- Unique PlayFab identifier for a user, or null if no PlayFab account is linked 
	--- to the given generic identifier. 
	PlayFabId: string?,
}

export type GenericServiceId = {
	--- Name of the service for which the player has a unique identifier. 
	ServiceName: string,
	--- Unique identifier of the player in that service. 
	UserId: string,
}

--- Request has no paramaters. 
export type GetAllSegmentsRequest = {
}

export type GetAllSegmentsResult = {
	--- Array of segments for this title. 
	Segments: {GetSegmentResult}?,
}

export type GetCatalogItemsRequest = {
	--- Which catalog is being requested. If null, uses the default catalog. 
	CatalogVersion: string?,
}

export type GetCatalogItemsResult = {
	--- Array of items which can be purchased. 
	Catalog: {CatalogItem}?,
}

--- Data is stored as JSON key-value pairs. If the Keys parameter is provided, the 
--- data object returned will only contain the data specific to the indicated Keys. 
--- Otherwise, the full set of custom user data will be returned. 
export type GetCharacterDataRequest = {
	--- Unique PlayFab assigned ID for a specific character owned by a user 
	CharacterId: string,
	--- The version that currently exists according to the caller. The call will return 
	--- the data for all of the keys if the version in the system is greater than this. 
	IfChangedFromDataVersion: number?,
	--- Specific keys to search for in the custom user data. 
	Keys: {any}?,
	--- Unique PlayFab assigned ID of the user on whom the operation will be performed. 
	PlayFabId: string,
}

export type GetCharacterDataResult = {
	--- Unique PlayFab assigned ID for a specific character owned by a user 
	CharacterId: string?,
	--- User specific data for this title. 
	Data: UserDataRecord?,
	--- Indicates the current version of the data that has been set. This is incremented 
	--- with every set call for that type of data (read-only, internal, etc). This version 
	--- can be provided in Get calls to find updated data. 
	DataVersion: number,
	--- Unique PlayFab assigned ID of the user on whom the operation will be performed. 
	PlayFabId: string?,
}

--- All items currently in the character inventory will be returned, irrespective 
--- of how they were acquired (via purchasing, grants, coupons, etc.). Items that 
--- are expired, fully consumed, or are no longer valid are not considered to be 
--- in the user's current inventory, and so will not be not included. Also returns 
--- their virtual currency balances. 
export type GetCharacterInventoryRequest = {
	--- Used to limit results to only those from a specific catalog version. 
	CatalogVersion: string?,
	--- Unique PlayFab assigned ID for a specific character owned by a user 
	CharacterId: string,
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- Unique PlayFab assigned ID of the user on whom the operation will be performed. 
	PlayFabId: string,
}

export type GetCharacterInventoryResult = {
	--- Unique identifier of the character for this inventory. 
	CharacterId: string?,
	--- Array of inventory items belonging to the character. 
	Inventory: {ItemInstance}?,
	--- Unique PlayFab assigned ID of the user on whom the operation will be performed. 
	PlayFabId: string?,
	--- Array of virtual currency balance(s) belonging to the character. 
	VirtualCurrency: {[any]: any}?,
	--- Array of remaining times and timestamps for virtual currencies. 
	VirtualCurrencyRechargeTimes: VirtualCurrencyRechargeTime?,
}

export type GetCharacterLeaderboardRequest = {
	--- Maximum number of entries to retrieve. 
	MaxResultsCount: number,
	--- First entry in the leaderboard to be retrieved. 
	StartPosition: number,
	--- Unique identifier for the title-specific statistic for the leaderboard. 
	StatisticName: string,
}

--- Note that the Position of the character in the results is for the overall leaderboard. 
export type GetCharacterLeaderboardResult = {
	--- Ordered list of leaderboard entries. 
	Leaderboard: {CharacterLeaderboardEntry}?,
}

--- Character statistics are similar to user statistics in that they are numeric 
--- values which may only be updated by a server operation, in order to minimize 
--- the opportunity for unauthorized changes. In addition to being available for 
--- use by the title, the statistics are used for all leaderboard operations in 
--- PlayFab. 
export type GetCharacterStatisticsRequest = {
	--- Unique PlayFab assigned ID for a specific character owned by a user 
	CharacterId: string,
	--- Unique PlayFab assigned ID of the user on whom the operation will be performed. 
	PlayFabId: string,
}

export type GetCharacterStatisticsResult = {
	--- Unique identifier of the character for the statistics. 
	CharacterId: string?,
	--- Character statistics for the requested user. 
	CharacterStatistics: {[any]: any}?,
	--- PlayFab unique identifier of the user whose character statistics are being returned. 
	PlayFabId: string?,
}

export type GetContentDownloadUrlRequest = {
	--- HTTP method to fetch item - GET or HEAD. Use HEAD when only fetching metadata. 
	--- Default is GET. 
	HttpMethod: string?,
	--- Key of the content item to fetch, usually formatted as a path, e.g. images/a.png 
	Key: string,
	--- True to download through CDN. CDN provides higher download bandwidth and lower 
	--- latency. However, if you want the latest, non-cached version of the content 
	--- during development, set this to false. Default is true. 
	ThruCDN: boolean?,
}

export type GetContentDownloadUrlResult = {
	--- URL for downloading content via HTTP GET or HEAD method. The URL will expire 
	--- in approximately one hour. 
	URL: string?,
}

export type GetFriendLeaderboardRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- Indicates whether Facebook friends should be included in the response. Default 
	--- is true. 
	IncludeFacebookFriends: boolean?,
	--- Indicates whether Steam service friends should be included in the response. 
	--- Default is true. 
	IncludeSteamFriends: boolean?,
	--- Maximum number of entries to retrieve. 
	MaxResultsCount: number,
	--- The player whose friend leaderboard to get 
	PlayFabId: string,
	--- If non-null, this determines which properties of the resulting player profiles 
	--- to return. For API calls from the client, only the allowed client profile properties 
	--- for the title may be requested. These allowed properties are configured in the 
	--- Game Manager "Client Profile Options" tab in the "Settings" section. 
	ProfileConstraints: PlayerProfileViewConstraints?,
	--- Position in the leaderboard to start this listing (defaults to the first entry). 
	StartPosition: number,
	--- Statistic used to rank friends for this leaderboard. 
	StatisticName: string,
	--- If set to false, Version is considered null. If true, uses the specified Version 
	UseSpecificVersion: boolean?,
	--- The version of the leaderboard to get. 
	Version: number?,
	--- Xbox token if Xbox friends should be included. Requires Xbox be configured on 
	--- PlayFab. 
	XboxToken: string?,
}

export type GetFriendsListRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- Indicates whether Facebook friends should be included in the response. Default 
	--- is true. 
	IncludeFacebookFriends: boolean?,
	--- Indicates whether Steam service friends should be included in the response. 
	--- Default is true. 
	IncludeSteamFriends: boolean?,
	--- PlayFab identifier of the player whose friend list to get. 
	PlayFabId: string,
	--- If non-null, this determines which properties of the resulting player profiles 
	--- to return. For API calls from the client, only the allowed client profile properties 
	--- for the title may be requested. These allowed properties are configured in the 
	--- Game Manager "Client Profile Options" tab in the "Settings" section. 
	ProfileConstraints: PlayerProfileViewConstraints?,
	--- Xbox token if Xbox friends should be included. Requires Xbox be configured on 
	--- PlayFab. 
	XboxToken: string?,
}

--- If any additional services are queried for the user's friends, those friends 
--- who also have a PlayFab account registered for the title will be returned in 
--- the results. For Facebook, user has to have logged into the title's Facebook 
--- app recently, and only friends who also plays this game will be included. For 
--- Xbox Live, user has to have logged into the Xbox Live recently, and only friends 
--- who also play this game will be included. 
export type GetFriendsListResult = {
	--- Array of friends found. 
	Friends: {FriendInfo}?,
}

export type GetLeaderboardAroundCharacterRequest = {
	--- Unique PlayFab assigned ID for a specific character owned by a user 
	CharacterId: string,
	--- Maximum number of entries to retrieve. 
	MaxResultsCount: number,
	--- Unique PlayFab assigned ID of the user on whom the operation will be performed. 
	PlayFabId: string,
	--- Unique identifier for the title-specific statistic for the leaderboard. 
	StatisticName: string,
}

--- Note: When calling 'GetLeaderboardAround...' APIs, the position of the character 
--- defaults to 0 when the character does not have the corresponding statistic. 
export type GetLeaderboardAroundCharacterResult = {
	--- Ordered list of leaderboard entries. 
	Leaderboard: {CharacterLeaderboardEntry}?,
}

export type GetLeaderboardAroundUserRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- Maximum number of entries to retrieve. 
	MaxResultsCount: number,
	--- Unique PlayFab assigned ID of the user on whom the operation will be performed. 
	PlayFabId: string,
	--- If non-null, this determines which properties of the resulting player profiles 
	--- to return. For API calls from the client, only the allowed client profile properties 
	--- for the title may be requested. These allowed properties are configured in the 
	--- Game Manager "Client Profile Options" tab in the "Settings" section. 
	ProfileConstraints: PlayerProfileViewConstraints?,
	--- Unique identifier for the title-specific statistic for the leaderboard. 
	StatisticName: string,
	--- If set to false, Version is considered null. If true, uses the specified Version 
	UseSpecificVersion: boolean?,
	--- The version of the leaderboard to get. 
	Version: number?,
}

--- Note: When calling 'GetLeaderboardAround...' APIs, the position of the user 
--- defaults to 0 when the user does not have the corresponding statistic. 
export type GetLeaderboardAroundUserResult = {
	--- Ordered listing of users and their positions in the requested leaderboard. 
	Leaderboard: {PlayerLeaderboardEntry}?,
	--- The time the next scheduled reset will occur. Null if the leaderboard does not 
	--- reset on a schedule. 
	NextReset: string?,
	--- The version of the leaderboard returned. 
	Version: number,
}

export type GetLeaderboardForUsersCharactersRequest = {
	--- Unique PlayFab assigned ID of the user on whom the operation will be performed. 
	PlayFabId: string,
	--- Unique identifier for the title-specific statistic for the leaderboard. 
	StatisticName: string,
}

--- NOTE: The position of the character in the results is relative to the other 
--- characters for that specific user. This mean the values will always be between 
--- 0 and one less than the number of characters returned regardless of the size 
--- of the actual leaderboard. 
export type GetLeaderboardForUsersCharactersResult = {
	--- Ordered list of leaderboard entries. 
	Leaderboard: {CharacterLeaderboardEntry}?,
}

export type GetLeaderboardRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- Maximum number of entries to retrieve. 
	MaxResultsCount: number,
	--- If non-null, this determines which properties of the resulting player profiles 
	--- to return. For API calls from the client, only the allowed client profile properties 
	--- for the title may be requested. These allowed properties are configured in the 
	--- Game Manager "Client Profile Options" tab in the "Settings" section. 
	ProfileConstraints: PlayerProfileViewConstraints?,
	--- First entry in the leaderboard to be retrieved. 
	StartPosition: number,
	--- Unique identifier for the title-specific statistic for the leaderboard. 
	StatisticName: string,
	--- If set to false, Version is considered null. If true, uses the specified Version 
	UseSpecificVersion: boolean?,
	--- The version of the leaderboard to get. 
	Version: number?,
}

--- Note that the Position of the user in the results is for the overall leaderboard. 
export type GetLeaderboardResult = {
	--- Ordered listing of users and their positions in the requested leaderboard. 
	Leaderboard: {PlayerLeaderboardEntry}?,
	--- The time the next scheduled reset will occur. Null if the leaderboard does not 
	--- reset on a schedule. 
	NextReset: string?,
	--- The version of the leaderboard returned. 
	Version: number,
}

export type GetPlayFabIDsFromFacebookIDsRequest = {
	--- Array of unique Facebook identifiers for which the title needs to get PlayFab 
	--- identifiers. 
	FacebookIDs: {any},
}

--- For Facebook identifiers which have not been linked to PlayFab accounts, null 
--- will be returned. 
export type GetPlayFabIDsFromFacebookIDsResult = {
	--- Mapping of Facebook identifiers to PlayFab identifiers. 
	Data: {FacebookPlayFabIdPair}?,
}

export type GetPlayFabIDsFromFacebookInstantGamesIdsRequest = {
	--- Array of unique Facebook Instant Games identifiers for which the title needs 
	--- to get PlayFab identifiers. 
	FacebookInstantGamesIds: {any},
}

--- For Facebook Instant Games identifiers which have not been linked to PlayFab 
--- accounts, null will be returned. 
export type GetPlayFabIDsFromFacebookInstantGamesIdsResult = {
	--- Mapping of Facebook Instant Games identifiers to PlayFab identifiers. 
	Data: {FacebookInstantGamesPlayFabIdPair}?,
}

export type GetPlayFabIDsFromGenericIDsRequest = {
	--- Array of unique generic service identifiers for which the title needs to get 
	--- PlayFab identifiers. Currently limited to a maximum of 10 in a single request. 
	GenericIDs: {GenericServiceId},
}

--- For generic service identifiers which have not been linked to PlayFab accounts, 
--- null will be returned. 
export type GetPlayFabIDsFromGenericIDsResult = {
	--- Mapping of generic service identifiers to PlayFab identifiers. 
	Data: {GenericPlayFabIdPair}?,
}

export type GetPlayFabIDsFromNintendoServiceAccountIdsRequest = {
	--- Array of unique Nintendo Switch Account identifiers for which the title needs 
	--- to get PlayFab identifiers. 
	NintendoAccountIds: {any},
}

--- For Nintendo Service Account identifiers which have not been linked to PlayFab 
--- accounts, null will be returned. 
export type GetPlayFabIDsFromNintendoServiceAccountIdsResult = {
	--- Mapping of Nintendo Switch Service Account identifiers to PlayFab identifiers. 
	Data: {NintendoServiceAccountPlayFabIdPair}?,
}

export type GetPlayFabIDsFromNintendoSwitchDeviceIdsRequest = {
	--- Array of unique Nintendo Switch Device identifiers for which the title needs 
	--- to get PlayFab identifiers. 
	NintendoSwitchDeviceIds: {any},
}

--- For Nintendo Switch Device identifiers which have not been linked to PlayFab 
--- accounts, null will be returned. 
export type GetPlayFabIDsFromNintendoSwitchDeviceIdsResult = {
	--- Mapping of Nintendo Switch Device identifiers to PlayFab identifiers. 
	Data: {NintendoSwitchPlayFabIdPair}?,
}

export type GetPlayFabIDsFromPSNAccountIDsRequest = {
	--- Id of the PlayStation :tm: Network issuer environment. If null, defaults to 
	--- production environment. 
	IssuerId: number?,
	--- Array of unique PlayStation :tm: Network identifiers for which the title needs 
	--- to get PlayFab identifiers. 
	PSNAccountIDs: {any},
}

--- For PlayStation :tm: Network identifiers which have not been linked to PlayFab 
--- accounts, null will be returned. 
export type GetPlayFabIDsFromPSNAccountIDsResult = {
	--- Mapping of PlayStation :tm: Network identifiers to PlayFab identifiers. 
	Data: {PSNAccountPlayFabIdPair}?,
}

export type GetPlayFabIDsFromSteamIDsRequest = {
	--- Array of unique Steam identifiers (Steam profile IDs) for which the title needs 
	--- to get PlayFab identifiers. 
	SteamStringIDs: {any}?,
}

--- For Steam identifiers which have not been linked to PlayFab accounts, null will 
--- be returned. 
export type GetPlayFabIDsFromSteamIDsResult = {
	--- Mapping of Steam identifiers to PlayFab identifiers. 
	Data: {SteamPlayFabIdPair}?,
}

export type GetPlayFabIDsFromTwitchIDsRequest = {
	--- Array of unique Twitch identifiers (Twitch's _id) for which the title needs 
	--- to get PlayFab identifiers. 
	TwitchIds: {any},
}

--- For Twitch identifiers which have not been linked to PlayFab accounts, null 
--- will be returned. 
export type GetPlayFabIDsFromTwitchIDsResult = {
	--- Mapping of Twitch identifiers to PlayFab identifiers. 
	Data: {TwitchPlayFabIdPair}?,
}

export type GetPlayFabIDsFromXboxLiveIDsRequest = {
	--- The ID of Xbox Live sandbox. 
	Sandbox: string?,
	--- Array of unique Xbox Live account identifiers for which the title needs to get 
	--- PlayFab identifiers. 
	XboxLiveAccountIDs: {any},
}

--- For XboxLive identifiers which have not been linked to PlayFab accounts, null 
--- will be returned. 
export type GetPlayFabIDsFromXboxLiveIDsResult = {
	--- Mapping of Xbox Live identifiers to PlayFab identifiers. 
	Data: {XboxLiveAccountPlayFabIdPair}?,
}

export type GetPlayerCombinedInfoRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- Flags for which pieces of info to return for the user. 
	InfoRequestParameters: GetPlayerCombinedInfoRequestParams,
	--- PlayFabId of the user whose data will be returned 
	PlayFabId: string,
}

export type GetPlayerCombinedInfoRequestParams = {
	--- Whether to get character inventories. Defaults to false. 
	GetCharacterInventories: boolean,
	--- Whether to get the list of characters. Defaults to false. 
	GetCharacterList: boolean,
	--- Whether to get player profile. Defaults to false. Has no effect for a new player. 
	GetPlayerProfile: boolean,
	--- Whether to get player statistics. Defaults to false. 
	GetPlayerStatistics: boolean,
	--- Whether to get title data. Defaults to false. 
	GetTitleData: boolean,
	--- Whether to get the player's account Info. Defaults to false 
	GetUserAccountInfo: boolean,
	--- Whether to get the player's custom data. Defaults to false 
	GetUserData: boolean,
	--- Whether to get the player's inventory. Defaults to false 
	GetUserInventory: boolean,
	--- Whether to get the player's read only data. Defaults to false 
	GetUserReadOnlyData: boolean,
	--- Whether to get the player's virtual currency balances. Defaults to false 
	GetUserVirtualCurrency: boolean,
	--- Specific statistics to retrieve. Leave null to get all keys. Has no effect if 
	--- GetPlayerStatistics is false 
	PlayerStatisticNames: {any}?,
	--- Specifies the properties to return from the player profile. Defaults to returning 
	--- the player's display name. 
	ProfileConstraints: PlayerProfileViewConstraints?,
	--- Specific keys to search for in the custom data. Leave null to get all keys. 
	--- Has no effect if GetTitleData is false 
	TitleDataKeys: {any}?,
	--- Specific keys to search for in the custom data. Leave null to get all keys. 
	--- Has no effect if GetUserData is false 
	UserDataKeys: {any}?,
	--- Specific keys to search for in the custom data. Leave null to get all keys. 
	--- Has no effect if GetUserReadOnlyData is false 
	UserReadOnlyDataKeys: {any}?,
}

export type GetPlayerCombinedInfoResult = {
	--- Results for requested info. 
	InfoResultPayload: GetPlayerCombinedInfoResultPayload?,
	--- Unique PlayFab assigned ID of the user on whom the operation will be performed. 
	PlayFabId: string?,
}

export type GetPlayerCombinedInfoResultPayload = {
	--- Account information for the user. This is always retrieved. 
	AccountInfo: UserAccountInfo?,
	--- Inventories for each character for the user. 
	CharacterInventories: {CharacterInventory}?,
	--- List of characters for the user. 
	CharacterList: {CharacterResult}?,
	--- The profile of the players. This profile is not guaranteed to be up-to-date. 
	--- For a new player, this profile will not exist. 
	PlayerProfile: PlayerProfileModel?,
	--- List of statistics for this player. 
	PlayerStatistics: {StatisticValue}?,
	--- Title data for this title. 
	TitleData: {[any]: any}?,
	--- User specific custom data. 
	UserData: UserDataRecord?,
	--- The version of the UserData that was returned. 
	UserDataVersion: number,
	--- Array of inventory items in the user's current inventory. 
	UserInventory: {ItemInstance}?,
	--- User specific read-only data. 
	UserReadOnlyData: UserDataRecord?,
	--- The version of the Read-Only UserData that was returned. 
	UserReadOnlyDataVersion: number,
	--- Dictionary of virtual currency balance(s) belonging to the user. 
	UserVirtualCurrency: {[any]: any}?,
	--- Dictionary of remaining times and timestamps for virtual currencies. 
	UserVirtualCurrencyRechargeTimes: VirtualCurrencyRechargeTime?,
}

--- This API allows for access to details regarding a user in the PlayFab service, 
--- usually for purposes of customer support. Note that data returned may be Personally 
--- Identifying Information (PII), such as email address, and so care should be 
--- taken in how this data is stored and managed. Since this call will always return 
--- the relevant information for users who have accessed the title, the recommendation 
--- is to not store this data locally. 
export type GetPlayerProfileRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- Unique PlayFab assigned ID of the user on whom the operation will be performed. 
	PlayFabId: string,
	--- If non-null, this determines which properties of the resulting player profiles 
	--- to return. For API calls from the client, only the allowed client profile properties 
	--- for the title may be requested. These allowed properties are configured in the 
	--- Game Manager "Client Profile Options" tab in the "Settings" section. 
	ProfileConstraints: PlayerProfileViewConstraints?,
}

export type GetPlayerProfileResult = {
	--- The profile of the player. This profile is not guaranteed to be up-to-date. 
	--- For a new player, this profile will not exist. 
	PlayerProfile: PlayerProfileModel?,
}

export type GetPlayerSegmentsResult = {
	--- Array of segments the requested player currently belongs to. 
	Segments: {GetSegmentResult}?,
}

export type GetPlayerStatisticVersionsRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- unique name of the statistic 
	StatisticName: string?,
}

export type GetPlayerStatisticVersionsResult = {
	--- version change history of the statistic 
	StatisticVersions: {PlayerStatisticVersion}?,
}

export type GetPlayerStatisticsRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- user for whom statistics are being requested 
	PlayFabId: string,
	--- statistics to return, if StatisticNames is not set (only statistics which have 
	--- a version matching that provided will be returned) 
	StatisticNameVersions: {StatisticNameVersion}?,
	--- statistics to return 
	StatisticNames: {any}?,
}

--- In addition to being available for use by the title, the statistics are used 
--- for all leaderboard operations in PlayFab. 
export type GetPlayerStatisticsResult = {
	--- PlayFab unique identifier of the user whose statistics are being returned 
	PlayFabId: string?,
	--- User statistics for the requested user. 
	Statistics: {StatisticValue}?,
}

--- This API will return a list of canonical tags which includes both namespace 
--- and tag's name. If namespace is not provided, the result is a list of all canonical 
--- tags. TagName can be used for segmentation and Namespace is limited to 128 characters. 
export type GetPlayerTagsRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- Optional namespace to filter results by 
	Namespace: string?,
	--- Unique PlayFab assigned ID of the user on whom the operation will be performed. 
	PlayFabId: string,
}

export type GetPlayerTagsResult = {
	--- Unique PlayFab assigned ID of the user on whom the operation will be performed. 
	PlayFabId: string,
	--- Canonical tags (including namespace and tag's name) for the requested user 
	Tags: {any},
}

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
export type GetPlayersInSegmentRequest = {
	--- Continuation token if retrieving subsequent pages of results. 
	ContinuationToken: string?,
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- Maximum number of profiles to load. Default is 1,000. Maximum is 10,000. 
	MaxBatchSize: number?,
	--- Number of seconds to keep the continuation token active. After token expiration 
	--- it is not possible to continue paging results. Default is 300 (5 minutes). Maximum 
	--- is 1,800 (30 minutes). 
	SecondsToLive: number?,
	--- Unique identifier for this segment. 
	SegmentId: string,
}

export type GetPlayersInSegmentResult = {
	--- Continuation token to use to retrieve subsequent pages of results. If token 
	--- returns null there are no more results. 
	ContinuationToken: string?,
	--- Array of player profiles in this segment. 
	PlayerProfiles: {PlayerProfile}?,
	--- Count of profiles matching this segment. 
	ProfilesInSegment: number,
}

export type GetPlayersSegmentsRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- Unique PlayFab assigned ID of the user on whom the operation will be performed. 
	PlayFabId: string,
}

--- This API is designed to return publisher-specific values which can be read, 
--- but not written to, by the client. This data is shared across all titles assigned 
--- to a particular publisher, and can be used for cross-game coordination. Only 
--- titles assigned to a publisher can use this API. For more information email 
--- helloplayfab@microsoft.com. Note that there may up to a minute delay in between 
--- updating title data and this API call returning the newest value. 
export type GetPublisherDataRequest = {
	---  array of keys to get back data from the Publisher data blob, set by the admin 
	--- tools 
	Keys: {any},
}

export type GetPublisherDataResult = {
	--- a dictionary object of key / value pairs 
	Data: {[any]: any}?,
}

export type GetRandomResultTablesRequest = {
	--- Specifies the catalog version that should be used to retrieve the Random Result 
	--- Tables. If unspecified, uses default/primary catalog. 
	CatalogVersion: string?,
	--- The unique identifier of the Random Result Table to use. 
	TableIDs: {any},
}

--- Note that if a specified Random Result Table contains no entries, or does not 
--- exist in the catalog, an InvalidDropTable error will be returned. 
export type GetRandomResultTablesResult = {
	--- array of random result tables currently available 
	Tables: RandomResultTableListing?,
}

export type GetSegmentResult = {
	--- Identifier of the segments AB Test, if it is attached to one. 
	ABTestParent: string?,
	--- Unique identifier for this segment. 
	Id: string,
	--- Segment name. 
	Name: string?,
}

export type GetServerCustomIDsFromPlayFabIDsRequest = {
	--- Array of unique PlayFab player identifiers for which the title needs to get 
	--- server custom identifiers. Cannot contain more than 25 identifiers. 
	PlayFabIDs: {any},
}

--- For a PlayFab account that isn't associated with a server custom identity, ServerCustomId 
--- will be null. 
export type GetServerCustomIDsFromPlayFabIDsResult = {
	--- Mapping of server custom player identifiers to PlayFab identifiers. 
	Data: {ServerCustomIDPlayFabIDPair}?,
}

export type GetSharedGroupDataRequest = {
	--- If true, return the list of all members of the shared group. 
	GetMembers: boolean?,
	--- Specific keys to retrieve from the shared group (if not specified, all keys 
	--- will be returned, while an empty array indicates that no keys should be returned). 
	Keys: {any}?,
	--- Unique identifier for the shared group. 
	SharedGroupId: string,
}

export type GetSharedGroupDataResult = {
	--- Data for the requested keys. 
	Data: SharedGroupDataRecord?,
	--- List of PlayFabId identifiers for the members of this group, if requested. 
	Members: {any}?,
}

export type GetStoreItemsResult = {
	--- The base catalog that this store is a part of. 
	CatalogVersion: string?,
	--- Additional data about the store. 
	MarketingData: StoreMarketingModel?,
	--- How the store was last updated (Admin or a third party). 
	Source: string?,
	--- Array of items which can be purchased from this store. 
	Store: {StoreItem}?,
	--- The ID of this store. 
	StoreId: string?,
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
export type GetStoreItemsServerRequest = {
	--- Catalog version to store items from. Use default catalog version if null 
	CatalogVersion: string?,
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- Optional identifier for the player to use in requesting the store information 
	--- - if used, segment overrides will be applied 
	PlayFabId: string?,
	--- Unqiue identifier for the store which is being requested 
	StoreId: string,
}

--- This query retrieves the current time from one of the servers in PlayFab. Please 
--- note that due to clock drift between servers, there is a potential variance 
--- of up to 5 seconds. 
export type GetTimeRequest = {
}

--- Time is always returned as Coordinated Universal Time (UTC). 
export type GetTimeResult = {
	--- Current server time when the request was received, in UTC 
	Time: string,
}

--- This API is designed to return title specific values which can be read, but 
--- not written to, by the client. For example, a developer could choose to store 
--- values which modify the user experience, such as enemy spawn rates, weapon strengths, 
--- movement speeds, etc. This allows a developer to update the title without the 
--- need to create, test, and ship a new build. If an override label is specified 
--- in the request, the overrides are applied automatically and returned with the 
--- title data. Note that there may up to a minute delay in between updating title 
--- data and this API call returning the newest value. 
export type GetTitleDataRequest = {
	--- Specific keys to search for in the title data (leave null to get all keys) 
	Keys: {any}?,
	--- Optional field that specifies the name of an override. This value is ignored 
	--- when used by the game client; otherwise, the overrides are applied automatically 
	--- to the title data. 
	OverrideLabel: string?,
}

export type GetTitleDataResult = {
	--- a dictionary object of key / value pairs 
	Data: {[any]: any}?,
}

export type GetTitleNewsRequest = {
	--- Limits the results to the last n entries. Defaults to 10 if not set. 
	Count: number?,
}

export type GetTitleNewsResult = {
	--- Array of localized news items. 
	News: {TitleNewsItem}?,
}

--- This API allows for access to details regarding a user in the PlayFab service, 
--- usually for purposes of customer support. Note that data returned may be Personally 
--- Identifying Information (PII), such as email address, and so care should be 
--- taken in how this data is stored and managed. Since this call will always return 
--- the relevant information for users who have accessed the title, the recommendation 
--- is to not store this data locally. 
export type GetUserAccountInfoRequest = {
	--- Unique PlayFab assigned ID of the user on whom the operation will be performed. 
	PlayFabId: string,
}

export type GetUserAccountInfoResult = {
	--- Account details for the user whose information was requested. 
	UserInfo: UserAccountInfo?,
}

--- Get all bans for a user, including inactive and expired bans.  
export type GetUserBansRequest = {
	--- Unique PlayFab assigned ID of the user on whom the operation will be performed. 
	PlayFabId: string,
}

export type GetUserBansResult = {
	--- Information about the bans 
	BanData: {BanInfo}?,
}

--- Data is stored as JSON key-value pairs. If the Keys parameter is provided, the 
--- data object returned will only contain the data specific to the indicated Keys. 
--- Otherwise, the full set of custom user data will be returned. 
export type GetUserDataRequest = {
	--- The version that currently exists according to the caller. The call will return 
	--- the data for all of the keys if the version in the system is greater than this. 
	IfChangedFromDataVersion: number?,
	--- Specific keys to search for in the custom user data. 
	Keys: {any}?,
	--- Unique PlayFab assigned ID of the user on whom the operation will be performed. 
	PlayFabId: string,
}

export type GetUserDataResult = {
	--- User specific data for this title. 
	Data: UserDataRecord?,
	--- Indicates the current version of the data that has been set. This is incremented 
	--- with every set call for that type of data (read-only, internal, etc). This version 
	--- can be provided in Get calls to find updated data. 
	DataVersion: number,
	--- PlayFab unique identifier of the user whose custom data is being returned. 
	PlayFabId: string?,
}

--- All items currently in the user inventory will be returned, irrespective of 
--- how they were acquired (via purchasing, grants, coupons, etc.). Items that are 
--- expired, fully consumed, or are no longer valid are not considered to be in 
--- the user's current inventory, and so will not be not included. 
export type GetUserInventoryRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- Unique PlayFab assigned ID of the user on whom the operation will be performed. 
	PlayFabId: string,
}

export type GetUserInventoryResult = {
	--- Array of inventory items belonging to the user. 
	Inventory: {ItemInstance}?,
	--- Unique PlayFab assigned ID of the user on whom the operation will be performed. 
	PlayFabId: string?,
	--- Array of virtual currency balance(s) belonging to the user. 
	VirtualCurrency: {[any]: any}?,
	--- Array of remaining times and timestamps for virtual currencies. 
	VirtualCurrencyRechargeTimes: VirtualCurrencyRechargeTime?,
}

--- Grants a character to the user of the type and name specified in the request. 
export type GrantCharacterToUserRequest = {
	--- Non-unique display name of the character being granted (1-40 characters in length). 
	CharacterName: string,
	--- Type of the character being granted; statistics can be sliced based on this 
	--- value. 
	CharacterType: string,
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- Unique PlayFab assigned ID of the user on whom the operation will be performed. 
	PlayFabId: string,
}

export type GrantCharacterToUserResult = {
	--- Unique identifier tagged to this character. 
	CharacterId: string?,
}

--- This function directly adds inventory items to the character's inventories. 
--- As a result of this operations, the user will not be charged any transaction 
--- fee, regardless of the inventory item catalog definition. Please note that the 
--- processing time for inventory grants and purchases increases fractionally the 
--- more items are in the inventory, and the more items are in the grant/purchase 
--- operation. 
export type GrantItemsToCharacterRequest = {
	--- String detailing any additional information concerning this operation. 
	Annotation: string?,
	--- Catalog version from which items are to be granted. 
	CatalogVersion: string?,
	--- Unique PlayFab assigned ID for a specific character owned by a user 
	CharacterId: string,
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- Array of itemIds to grant to the user. 
	ItemIds: {any}?,
	--- Unique PlayFab assigned ID of the user on whom the operation will be performed. 
	PlayFabId: string,
}

export type GrantItemsToCharacterResult = {
	--- Array of items granted to users. 
	ItemGrantResults: {GrantedItemInstance}?,
}

--- This function directly adds inventory items to the user's inventories. As a 
--- result of this operations, the user will not be charged any transaction fee, 
--- regardless of the inventory item catalog definition. Please note that the processing 
--- time for inventory grants and purchases increases fractionally the more items 
--- are in the inventory, and the more items are in the grant/purchase operation. 
export type GrantItemsToUserRequest = {
	--- String detailing any additional information concerning this operation. 
	Annotation: string?,
	--- Catalog version from which items are to be granted. 
	CatalogVersion: string?,
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- Array of itemIds to grant to the user. 
	ItemIds: {any},
	--- Unique PlayFab assigned ID of the user on whom the operation will be performed. 
	PlayFabId: string,
}

--- Please note that the order of the items in the response may not match the order 
--- of items in the request. 
export type GrantItemsToUserResult = {
	--- Array of items granted to users. 
	ItemGrantResults: {GrantedItemInstance}?,
}

--- This function directly adds inventory items to user inventories. As a result 
--- of this operations, the user will not be charged any transaction fee, regardless 
--- of the inventory item catalog definition. Please note that the processing time 
--- for inventory grants and purchases increases fractionally the more items are 
--- in the inventory, and the more items are in the grant/purchase operation. 
export type GrantItemsToUsersRequest = {
	--- Catalog version from which items are to be granted. 
	CatalogVersion: string?,
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- Array of items to grant and the users to whom the items are to be granted. 
	ItemGrants: {ItemGrant},
}

--- Please note that the order of the items in the response may not match the order 
--- of items in the request. 
export type GrantItemsToUsersResult = {
	--- Array of items granted to users. 
	ItemGrantResults: {GrantedItemInstance}?,
}

--- Result of granting an item to a user. Note, to retrieve additional information 
--- for an item such as Tags, Description that are the same across all instances 
--- of the item, a call to GetCatalogItems is required. The ItemID of can be matched 
--- to a catalog entry, which contains the additional information. Also note that 
--- Custom Data is only set when the User's specific instance has updated the CustomData 
--- via a call to UpdateUserInventoryItemCustomData. Other fields such as UnitPrice 
--- and UnitCurrency are only set when the item was granted via a purchase. 
export type GrantedItemInstance = {
	--- Game specific comment associated with this instance when it was added to the 
	--- user inventory. 
	Annotation: string?,
	--- Array of unique items that were awarded when this catalog item was purchased. 
	BundleContents: {any}?,
	--- Unique identifier for the parent inventory item, as defined in the catalog, 
	--- for object which were added from a bundle or container. 
	BundleParent: string?,
	--- Catalog version for the inventory item, when this instance was created. 
	CatalogVersion: string?,
	--- Unique PlayFab assigned ID for a specific character owned by a user 
	CharacterId: string?,
	--- A set of custom key-value pairs on the instance of the inventory item, which 
	--- is not to be confused with the catalog item's custom data. 
	CustomData: {[any]: any}?,
	--- CatalogItem.DisplayName at the time this item was purchased. 
	DisplayName: string?,
	--- Timestamp for when this instance will expire. 
	Expiration: string?,
	--- Class name for the inventory item, as defined in the catalog. 
	ItemClass: string?,
	--- Unique identifier for the inventory item, as defined in the catalog. 
	ItemId: string?,
	--- Unique item identifier for this specific instance of the item. 
	ItemInstanceId: string?,
	--- Unique PlayFab assigned ID of the user on whom the operation will be performed. 
	PlayFabId: string?,
	--- Timestamp for when this instance was purchased. 
	PurchaseDate: string?,
	--- Total number of remaining uses, if this is a consumable item. 
	RemainingUses: number?,
	--- Result of this operation. 
	Result: boolean,
	--- Currency type for the cost of the catalog item. Not available when granting 
	--- items. 
	UnitCurrency: string?,
	--- Cost of the catalog item in the given currency. Not available when granting 
	--- items. 
	UnitPrice: number,
	--- The number of uses that were added or removed to this item in this call. 
	UsesIncrementedBy: number?,
}

export type ItemGrant = {
	--- String detailing any additional information concerning this operation. 
	Annotation: string?,
	--- Unique PlayFab assigned ID for a specific character owned by a user 
	CharacterId: string?,
	--- Key-value pairs to be written to the custom data. Note that keys are trimmed 
	--- of whitespace, are limited in size, and may not begin with a '!' character or 
	--- be null. 
	Data: {[any]: any}?,
	--- Unique identifier of the catalog item to be granted to the user. 
	ItemId: string,
	--- Optional list of Data-keys to remove from UserData. Some SDKs cannot insert 
	--- null-values into Data due to language constraints. Use this to delete the keys 
	--- directly. 
	KeysToRemove: {any}?,
	--- Unique PlayFab assigned ID of the user on whom the operation will be performed. 
	PlayFabId: string,
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
	--- Game specific comment associated with this instance when it was added to the 
	--- user inventory. 
	Annotation: string?,
	--- Array of unique items that were awarded when this catalog item was purchased. 
	BundleContents: {any}?,
	--- Unique identifier for the parent inventory item, as defined in the catalog, 
	--- for object which were added from a bundle or container. 
	BundleParent: string?,
	--- Catalog version for the inventory item, when this instance was created. 
	CatalogVersion: string?,
	--- A set of custom key-value pairs on the instance of the inventory item, which 
	--- is not to be confused with the catalog item's custom data. 
	CustomData: {[any]: any}?,
	--- CatalogItem.DisplayName at the time this item was purchased. 
	DisplayName: string?,
	--- Timestamp for when this instance will expire. 
	Expiration: string?,
	--- Class name for the inventory item, as defined in the catalog. 
	ItemClass: string?,
	--- Unique identifier for the inventory item, as defined in the catalog. 
	ItemId: string?,
	--- Unique item identifier for this specific instance of the item. 
	ItemInstanceId: string?,
	--- Timestamp for when this instance was purchased. 
	PurchaseDate: string?,
	--- Total number of remaining uses, if this is a consumable item. 
	RemainingUses: number?,
	--- Currency type for the cost of the catalog item. Not available when granting 
	--- items. 
	UnitCurrency: string?,
	--- Cost of the catalog item in the given currency. Not available when granting 
	--- items. 
	UnitPrice: number,
	--- The number of uses that were added or removed to this item in this call. 
	UsesIncrementedBy: number?,
}

export type LinkNintendoServiceAccountRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- If another user is already linked to a specific Nintendo Switch account, unlink 
	--- the other user and re-link. 
	ForceLink: boolean?,
	--- The JSON Web token (JWT) returned by Nintendo after login. Used to validate 
	--- the request and find the user ID (Nintendo Switch subject) to link with. 
	IdentityToken: string,
	--- Unique PlayFab assigned ID of the user on whom the operation will be performed. 
	PlayFabId: string,
}

export type LinkNintendoSwitchDeviceIdRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- If another user is already linked to the Nintendo Switch Device ID, unlink the 
	--- other user and re-link. 
	ForceLink: boolean?,
	--- Nintendo Switch unique identifier for the user's device. 
	NintendoSwitchDeviceId: string,
	--- Unique PlayFab assigned ID of the user on whom the operation will be performed. 
	PlayFabId: string,
}

export type LinkNintendoSwitchDeviceIdResult = {
}

export type LinkPSNAccountRequest = {
	--- Authentication code provided by the PlayStation :tm: Network. 
	AuthCode: string,
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- If another user is already linked to the account, unlink the other user and 
	--- re-link. 
	ForceLink: boolean?,
	--- Id of the PlayStation :tm: Network issuer environment. If null, defaults to 
	--- production environment. 
	IssuerId: number?,
	--- Unique PlayFab assigned ID of the user on whom the operation will be performed. 
	PlayFabId: string,
	--- Redirect URI supplied to PlayStation :tm: Network when requesting an auth code 
	RedirectUri: string,
}

export type LinkPSNAccountResult = {
}

export type LinkServerCustomIdRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- If another user is already linked to the custom ID, unlink the other user and 
	--- re-link. 
	ForceLink: boolean?,
	--- Unique PlayFab identifier. 
	PlayFabId: string,
	--- Unique server custom identifier for this player. 
	ServerCustomId: string,
}

export type LinkServerCustomIdResult = {
}

export type LinkXboxAccountRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- If another user is already linked to the account, unlink the other user and 
	--- re-link. 
	ForceLink: boolean?,
	--- Unique PlayFab identifier for a user, or null if no PlayFab account is linked 
	--- to the Xbox Live identifier. 
	PlayFabId: string,
	--- Token provided by the Xbox Live SDK/XDK method GetTokenAndSignatureAsync("POST", 
	--- "https://playfabapi.com/", ""). 
	XboxToken: string,
}

export type LinkXboxAccountResult = {
}

export type LinkedPlatformAccountModel = {
	--- Linked account email of the user on the platform, if available 
	Email: string?,
	--- Authentication platform 
	Platform: string?,
	--- Unique account identifier of the user on the platform 
	PlatformUserId: string?,
	--- Linked account username of the user on the platform, if available 
	Username: string?,
}

--- Returns a list of every character that currently belongs to a user. 
export type ListUsersCharactersRequest = {
	--- Unique PlayFab assigned ID of the user on whom the operation will be performed. 
	PlayFabId: string,
}

export type ListUsersCharactersResult = {
	--- The requested list of characters. 
	Characters: {CharacterResult}?,
}

--- Contains the localized push notification content. 
export type LocalizedPushNotificationProperties = {
	--- Message of the localized push notification template. 
	Message: string?,
	--- Subject of the localized push notification template. 
	Subject: string?,
}

export type LocationModel = {
	--- City name. 
	City: string?,
	--- The two-character continent code for this location 
	ContinentCode: string?,
	--- The two-character ISO 3166-1 country code for the country associated with the 
	--- location 
	CountryCode: string?,
	--- Latitude coordinate of the geographic location. 
	Latitude: number?,
	--- Longitude coordinate of the geographic location. 
	Longitude: number?,
}

export type LogStatement = {
	--- Optional object accompanying the message as contextual information 
	Data: {[any]: any}?,
	--- 'Debug', 'Info', or 'Error' 
	Level: string?,
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

export type LoginWithServerCustomIdRequest = {
	--- Automatically create a PlayFab account if one is not currently linked to this 
	--- ID. 
	CreateAccount: boolean?,
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- Flags for which pieces of info to return for the user. 
	InfoRequestParameters: GetPlayerCombinedInfoRequestParams?,
	--- Player secret that is used to verify API request signatures (Enterprise Only). 
	PlayerSecret: string?,
	--- The backend server identifier for this player. 
	ServerCustomId: string?,
}

--- If this is the first time a user has signed in with the Steam ID and CreateAccount 
--- is set to true, a new PlayFab account will be created and linked to the Steam 
--- account. In this case, no email or username will be associated with the PlayFab 
--- account. Otherwise, if no PlayFab account is linked to the Steam account, an 
--- error indicating this will be returned, so that the title can guide the user 
--- through creation of a PlayFab account. Steam users that are not logged into 
--- the Steam Client app will only have their Steam username synced, other data, 
--- such as currency and country will not be available until they login while the 
--- Client is open. 
export type LoginWithSteamIdRequest = {
	--- Automatically create a PlayFab account if one is not currently linked to this 
	--- ID. 
	CreateAccount: boolean?,
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- Flags for which pieces of info to return for the user. 
	InfoRequestParameters: GetPlayerCombinedInfoRequestParams?,
	--- Unique Steam identifier for a user 
	SteamId: string,
}

--- If this is the first time a user has signed in with the Xbox ID and CreateAccount 
--- is set to true, a new PlayFab account will be created and linked to the Xbox 
--- Live account. In this case, no email or username will be associated with the 
--- PlayFab account. Otherwise, if no PlayFab account is linked to the Xbox Live 
--- account, an error indicating this will be returned, so that the title can guide 
--- the user through creation of a PlayFab account. 
export type LoginWithXboxIdRequest = {
	--- Automatically create a PlayFab account if one is not currently linked to this 
	--- ID. 
	CreateAccount: boolean?,
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- Flags for which pieces of info to return for the user. 
	InfoRequestParameters: GetPlayerCombinedInfoRequestParams?,
	--- The id of Xbox Live sandbox. 
	Sandbox: string,
	--- Unique Xbox identifier for a user 
	XboxId: string,
}

--- If this is the first time a user has signed in with the Xbox Live account and 
--- CreateAccount is set to true, a new PlayFab account will be created and linked 
--- to the Xbox Live account. In this case, no email or username will be associated 
--- with the PlayFab account. Otherwise, if no PlayFab account is linked to the 
--- Xbox Live account, an error indicating this will be returned, so that the title 
--- can guide the user through creation of a PlayFab account. 
export type LoginWithXboxRequest = {
	--- Automatically create a PlayFab account if one is not currently linked to this 
	--- ID. 
	CreateAccount: boolean?,
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- Flags for which pieces of info to return for the user. 
	InfoRequestParameters: GetPlayerCombinedInfoRequestParams?,
	--- Token provided by the Xbox Live SDK/XDK method GetTokenAndSignatureAsync("POST", 
	--- "https://playfabapi.com/", ""). 
	XboxToken: string,
}

export type MembershipModel = {
	--- Whether this membership is active. That is, whether the MembershipExpiration 
	--- time has been reached. 
	IsActive: boolean,
	--- The time this membership expires 
	MembershipExpiration: string,
	--- The id of the membership 
	MembershipId: string?,
	--- Membership expirations can be explicitly overridden (via game manager or the 
	--- admin api). If this membership has been overridden, this will be the new expiration 
	--- time. 
	OverrideExpiration: string?,
	--- Whether the override expiration is set. 
	OverrideIsSet: boolean?,
	--- The list of subscriptions that this player has for this membership 
	Subscriptions: {SubscriptionModel}?,
}

export type ModifyCharacterVirtualCurrencyResult = {
	--- Balance of the virtual currency after modification. 
	Balance: number,
	--- Name of the virtual currency which was modified. 
	VirtualCurrency: string?,
}

--- This function can both add and remove uses of an inventory item. If the number 
--- of uses drops below zero, the item will be removed from active inventory. 
export type ModifyItemUsesRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- Unique instance identifier of the item to be modified. 
	ItemInstanceId: string,
	--- PlayFab unique identifier of the user whose item is being modified. 
	PlayFabId: string,
	--- Number of uses to add to the item. Can be negative to remove uses. 
	UsesToAdd: number,
}

export type ModifyItemUsesResult = {
	--- Unique instance identifier of the item with uses consumed. 
	ItemInstanceId: string?,
	--- Number of uses remaining on the item. 
	RemainingUses: number,
}

export type ModifyUserVirtualCurrencyResult = {
	--- Balance of the virtual currency after modification. 
	Balance: number,
	--- Amount added or subtracted from the user's virtual currency. Maximum VC balance 
	--- is Int32 (2,147,483,647). Any increase over this value will be discarded. 
	BalanceChange: number,
	--- User currency was subtracted from. 
	PlayFabId: string?,
	--- Name of the virtual currency which was modified. 
	VirtualCurrency: string?,
}

--- Transfers an item from a character to another character that is owned by the 
--- same user. This will remove the item from the character's inventory (until and 
--- unless it is moved back), and will enable the other character to make use of 
--- the item instead. 
export type MoveItemToCharacterFromCharacterRequest = {
	--- Unique identifier of the character that currently has the item. 
	GivingCharacterId: string,
	--- Unique PlayFab assigned instance identifier of the item 
	ItemInstanceId: string,
	--- Unique PlayFab assigned ID of the user on whom the operation will be performed. 
	PlayFabId: string,
	--- Unique identifier of the character that will be receiving the item. 
	ReceivingCharacterId: string,
}

export type MoveItemToCharacterFromCharacterResult = {
}

--- Transfers an item from a user to a character she owns. This will remove the 
--- item from the user's inventory (until and unless it is moved back), and will 
--- enable the character to make use of the item instead. 
export type MoveItemToCharacterFromUserRequest = {
	--- Unique PlayFab assigned ID for a specific character owned by a user 
	CharacterId: string,
	--- Unique PlayFab assigned instance identifier of the item 
	ItemInstanceId: string,
	--- Unique PlayFab assigned ID of the user on whom the operation will be performed. 
	PlayFabId: string,
}

export type MoveItemToCharacterFromUserResult = {
}

--- Transfers an item from a character to the owning user. This will remove the 
--- item from the character's inventory (until and unless it is moved back), and 
--- will enable the user to make use of the item instead. 
export type MoveItemToUserFromCharacterRequest = {
	--- Unique PlayFab assigned ID for a specific character owned by a user 
	CharacterId: string,
	--- Unique PlayFab assigned instance identifier of the item 
	ItemInstanceId: string,
	--- Unique PlayFab assigned ID of the user on whom the operation will be performed. 
	PlayFabId: string,
}

export type MoveItemToUserFromCharacterResult = {
}

export type NintendoServiceAccountPlayFabIdPair = {
	--- Unique Nintendo Switch Service Account identifier for a user. 
	NintendoServiceAccountId: string?,
	--- Unique PlayFab identifier for a user, or null if no PlayFab account is linked 
	--- to the Nintendo Switch Service Account identifier. 
	PlayFabId: string?,
}

export type NintendoSwitchPlayFabIdPair = {
	--- Unique Nintendo Switch Device identifier for a user. 
	NintendoSwitchDeviceId: string?,
	--- Unique PlayFab identifier for a user, or null if no PlayFab account is linked 
	--- to the Nintendo Switch Device identifier. 
	PlayFabId: string?,
}

export type NotifyMatchmakerPlayerLeftRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- Unique identifier of the Game Instance the user is leaving. 
	LobbyId: string,
	--- Unique PlayFab assigned ID of the user on whom the operation will be performed. 
	PlayFabId: string,
}

export type NotifyMatchmakerPlayerLeftResult = {
	--- State of user leaving the Game Server Instance. 
	PlayerState: string?,
}

export type PSNAccountPlayFabIdPair = {
	--- Unique PlayStation :tm: Network identifier for a user. 
	PSNAccountId: string?,
	--- Unique PlayFab identifier for a user, or null if no PlayFab account is linked 
	--- to the PlayStation :tm: Network identifier. 
	PlayFabId: string?,
}

export type PlayerConnectionState = 
	"Unassigned"
	| "Connecting"
	| "Participating"
	| "Participated"

export type PlayerLeaderboardEntry = {
	--- Title-specific display name of the user for this leaderboard entry. 
	DisplayName: string?,
	--- PlayFab unique identifier of the user for this leaderboard entry. 
	PlayFabId: string?,
	--- User's overall position in the leaderboard. 
	Position: number,
	--- The profile of the user, if requested. 
	Profile: PlayerProfileModel?,
	--- Specific value of the user's statistic. 
	StatValue: number,
}

export type PlayerLinkedAccount = {
	--- Linked account's email 
	Email: string?,
	--- Authentication platform 
	Platform: string?,
	--- Platform user identifier 
	PlatformUserId: string?,
	--- Linked account's username 
	Username: string?,
}

export type PlayerLocation = {
	--- City of the player's geographic location. 
	City: string?,
	--- The two-character continent code for this location 
	ContinentCode: string,
	--- The two-character ISO 3166-1 country code for the country associated with the 
	--- location 
	CountryCode: string,
	--- Latitude coordinate of the player's geographic location. 
	Latitude: number?,
	--- Longitude coordinate of the player's geographic location. 
	Longitude: number?,
}

export type PlayerProfile = {
	--- Array of ad campaigns player has been attributed to 
	AdCampaignAttributions: {AdCampaignAttribution}?,
	--- Image URL of the player's avatar. 
	AvatarUrl: string?,
	--- Banned until UTC Date. If permanent ban this is set for 20 years after the original 
	--- ban date. 
	BannedUntil: string?,
	--- Array of contact email addresses associated with the player 
	ContactEmailAddresses: {ContactEmailInfo}?,
	--- Player record created 
	Created: string?,
	--- Player Display Name 
	DisplayName: string?,
	--- Last login 
	LastLogin: string?,
	--- Array of third party accounts linked to this player 
	LinkedAccounts: {PlayerLinkedAccount}?,
	--- Dictionary of player's locations by type. 
	Locations: PlayerLocation?,
	--- Player account origination 
	Origination: string?,
	--- List of player variants for experimentation 
	PlayerExperimentVariants: {any}?,
	--- PlayFab Player ID 
	PlayerId: string?,
	--- Array of player statistics 
	PlayerStatistics: {PlayerStatistic}?,
	--- Publisher this player belongs to 
	PublisherId: string?,
	--- Array of configured push notification end points 
	PushNotificationRegistrations: {PushNotificationRegistration}?,
	--- Dictionary of player's statistics using only the latest version's value 
	Statistics: {[any]: any}?,
	--- List of player's tags for segmentation. 
	Tags: {any}?,
	--- Title ID this profile applies to 
	TitleId: string?,
	--- A sum of player's total purchases in USD across all currencies. 
	TotalValueToDateInUSD: number?,
	--- Dictionary of player's total purchases by currency. 
	ValuesToDate: {[any]: any}?,
	--- Dictionary of player's virtual currency balances 
	VirtualCurrencyBalances: {[any]: any}?,
}

export type PlayerProfileModel = {
	--- List of advertising campaigns the player has been attributed to 
	AdCampaignAttributions: {AdCampaignAttributionModel}?,
	--- URL of the player's avatar image 
	AvatarUrl: string?,
	--- If the player is currently banned, the UTC Date when the ban expires 
	BannedUntil: string?,
	--- List of all contact email info associated with the player account 
	ContactEmailAddresses: {ContactEmailInfoModel}?,
	--- Player record created 
	Created: string?,
	--- Player display name 
	DisplayName: string?,
	--- List of experiment variants for the player. Note that these variants are not 
	--- guaranteed to be up-to-date when returned during login because the player profile 
	--- is updated only after login. Instead, use the LoginResult.TreatmentAssignment 
	--- property during login to get the correct variants and variables. 
	ExperimentVariants: {any}?,
	--- UTC time when the player most recently logged in to the title 
	LastLogin: string?,
	--- List of all authentication systems linked to this player account 
	LinkedAccounts: {LinkedPlatformAccountModel}?,
	--- List of geographic locations from which the player has logged in to the title 
	Locations: {LocationModel}?,
	--- List of memberships for the player, along with whether are expired. 
	Memberships: {MembershipModel}?,
	--- Player account origination 
	Origination: string?,
	--- PlayFab player account unique identifier 
	PlayerId: string?,
	--- Publisher this player belongs to 
	PublisherId: string?,
	--- List of configured end points registered for sending the player push notifications 
	PushNotificationRegistrations: {PushNotificationRegistrationModel}?,
	--- List of leaderboard statistic values for the player 
	Statistics: {StatisticModel}?,
	--- List of player's tags for segmentation 
	Tags: {TagModel}?,
	--- Title ID this player profile applies to 
	TitleId: string?,
	--- Sum of the player's purchases made with real-money currencies, converted to 
	--- US dollars equivalent and represented as a whole number of cents (1/100 USD). 
	--- For example, 999 indicates nine dollars and ninety-nine cents. 
	TotalValueToDateInUSD: number?,
	--- List of the player's lifetime purchase totals, summed by real-money currency 
	ValuesToDate: {ValueToDateModel}?,
}

export type PlayerProfileViewConstraints = {
	--- Whether to show player's avatar URL. Defaults to false 
	ShowAvatarUrl: boolean,
	--- Whether to show the banned until time. Defaults to false 
	ShowBannedUntil: boolean,
	--- Whether to show campaign attributions. Defaults to false 
	ShowCampaignAttributions: boolean,
	--- Whether to show contact email addresses. Defaults to false 
	ShowContactEmailAddresses: boolean,
	--- Whether to show the created date. Defaults to false 
	ShowCreated: boolean,
	--- Whether to show the display name. Defaults to false 
	ShowDisplayName: boolean,
	--- Whether to show player's experiment variants. Defaults to false 
	ShowExperimentVariants: boolean,
	--- Whether to show the last login time. Defaults to false 
	ShowLastLogin: boolean,
	--- Whether to show the linked accounts. Defaults to false 
	ShowLinkedAccounts: boolean,
	--- Whether to show player's locations. Defaults to false 
	ShowLocations: boolean,
	--- Whether to show player's membership information. Defaults to false 
	ShowMemberships: boolean,
	--- Whether to show origination. Defaults to false 
	ShowOrigination: boolean,
	--- Whether to show push notification registrations. Defaults to false 
	ShowPushNotificationRegistrations: boolean,
	--- Reserved for future development 
	ShowStatistics: boolean,
	--- Whether to show tags. Defaults to false 
	ShowTags: boolean,
	--- Whether to show the total value to date in usd. Defaults to false 
	ShowTotalValueToDateInUsd: boolean,
	--- Whether to show the values to date. Defaults to false 
	ShowValuesToDate: boolean,
}

export type PlayerStatistic = {
	--- Statistic ID 
	Id: string?,
	--- Statistic name 
	Name: string?,
	--- Current statistic value 
	StatisticValue: number,
	--- Statistic version (0 if not a versioned statistic) 
	StatisticVersion: number,
}

export type PlayerStatisticVersion = {
	--- time when the statistic version became active 
	ActivationTime: string,
	--- time when the statistic version became inactive due to statistic version incrementing 
	DeactivationTime: string?,
	--- time at which the statistic version was scheduled to become active, based on 
	--- the configured ResetInterval 
	ScheduledActivationTime: string?,
	--- time at which the statistic version was scheduled to become inactive, based 
	--- on the configured ResetInterval 
	ScheduledDeactivationTime: string?,
	--- name of the statistic when the version became active 
	StatisticName: string?,
	--- version of the statistic 
	Version: number,
}

export type PushNotificationPackage = {
	--- Numerical badge to display on App icon (iOS only) 
	Badge: number,
	--- This must be a JSON formatted object. For use with developer-created custom 
	--- Push Notification plugins 
	CustomData: string?,
	--- Icon file to display with the message (Not supported for iOS) 
	Icon: string?,
	--- Content of the message (all platforms) 
	Message: string,
	--- Sound file to play with the message (all platforms) 
	Sound: string?,
	--- Title/Subject of the message. Not supported for iOS 
	Title: string,
}

export type PushNotificationPlatform = 
	"ApplePushNotificationService"
	| "GoogleCloudMessaging"

export type PushNotificationRegistration = {
	--- Notification configured endpoint 
	NotificationEndpointARN: string?,
	--- Push notification platform 
	Platform: string?,
}

export type PushNotificationRegistrationModel = {
	--- Notification configured endpoint 
	NotificationEndpointARN: string?,
	--- Push notification platform 
	Platform: string?,
}

export type RandomResultTableListing = {
	--- Catalog version this table is associated with 
	CatalogVersion: string?,
	--- Child nodes that indicate what kind of drop table item this actually is. 
	Nodes: {ResultTableNode},
	--- Unique name for this drop table 
	TableId: string,
}

--- Coupon codes can be created for any item, or set of items, in the catalog for 
--- the title. This operation causes the coupon to be consumed, and the specific 
--- items to be awarded to the user. Attempting to re-use an already consumed code, 
--- or a code which has not yet been created in the service, will result in an error. 
export type RedeemCouponRequest = {
	--- Catalog version of the coupon. 
	CatalogVersion: string?,
	--- Optional identifier for the Character that should receive the item. If null, 
	--- item is added to the player 
	CharacterId: string?,
	--- Generated coupon code to redeem. 
	CouponCode: string,
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- Unique PlayFab assigned ID of the user on whom the operation will be performed. 
	PlayFabId: string,
}

export type RedeemCouponResult = {
	--- Items granted to the player as a result of redeeming the coupon. 
	GrantedItems: {ItemInstance}?,
}

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
export type RedeemMatchmakerTicketRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- Unique identifier of the Game Server Instance that is asking for validation 
	--- of the authorization ticket. 
	LobbyId: string,
	--- Server authorization ticket passed back from a call to Matchmake or StartGame. 
	Ticket: string,
}

export type RedeemMatchmakerTicketResult = {
	--- Error value if the ticket was not validated. 
	Error: string?,
	--- Boolean indicating whether the ticket was validated by the PlayFab service. 
	TicketIsValid: boolean,
	--- User account information for the user validated. 
	UserInfo: UserAccountInfo?,
}

export type RefreshGameServerInstanceHeartbeatRequest = {
	--- Unique identifier of the Game Server Instance for which the heartbeat is updated. 
	LobbyId: string,
}

export type RefreshGameServerInstanceHeartbeatResult = {
}

export type Region = 
	"USCentral"
	| "USEast"
	| "EUWest"
	| "Singapore"
	| "Japan"
	| "Brazil"
	| "Australia"

export type RegisterGameRequest = {
	--- Unique identifier of the build running on the Game Server Instance. 
	Build: string,
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- Game Mode the Game Server instance is running. Note that this must be defined 
	--- in the Game Modes tab in the PlayFab Game Manager, along with the Build ID (the 
	--- same Game Mode can be defined for multiple Build IDs). 
	GameMode: string,
	--- Previous lobby id if re-registering an existing game. 
	LobbyId: string?,
	--- Region in which the Game Server Instance is running. For matchmaking using non-AWS 
	--- region names, set this to any AWS region and use Tags (below) to specify your 
	--- custom region. 
	Region: string,
	--- IPV4 address of the game server instance. 
	ServerIPV4Address: string?,
	--- IPV6 address (if any) of the game server instance. 
	ServerIPV6Address: string?,
	--- Port number for communication with the Game Server Instance. 
	ServerPort: string,
	--- Public DNS name (if any) of the server 
	ServerPublicDNSName: string?,
	--- Tags for the Game Server Instance 
	Tags: {[any]: any}?,
}

export type RegisterGameResponse = {
	--- Unique identifier generated for the Game Server Instance that is registered. 
	--- If LobbyId is specified in request and the game still exists in PlayFab, the 
	--- LobbyId in request is returned. Otherwise a new lobby id will be returned. 
	LobbyId: string?,
}

export type RemoveFriendRequest = {
	--- PlayFab identifier of the friend account which is to be removed. 
	FriendPlayFabId: string,
	--- Unique PlayFab assigned ID of the user on whom the operation will be performed. 
	PlayFabId: string,
}

export type RemoveGenericIDRequest = {
	--- Generic service identifier to be removed from the player. 
	GenericId: GenericServiceId,
	--- PlayFabId of the user to remove. 
	PlayFabId: string,
}

--- This API will trigger a player_tag_removed event and remove a tag with the given 
--- TagName and PlayFabID from the corresponding player profile. TagName can be 
--- used for segmentation and it is limited to 256 characters 
export type RemovePlayerTagRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- Unique PlayFab assigned ID of the user on whom the operation will be performed. 
	PlayFabId: string,
	--- Unique tag for player profile. 
	TagName: string,
}

export type RemovePlayerTagResult = {
}

export type RemoveSharedGroupMembersRequest = {
	--- An array of unique PlayFab assigned ID of the user on whom the operation will 
	--- be performed. 
	PlayFabIds: {any},
	--- Unique identifier for the shared group. 
	SharedGroupId: string,
}

export type RemoveSharedGroupMembersResult = {
}

export type ReportPlayerServerRequest = {
	--- Optional additional comment by reporting player. 
	Comment: string?,
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- Unique PlayFab identifier of the reported player. 
	ReporteeId: string,
	--- PlayFabId of the reporting player. 
	ReporterId: string,
}

--- Players are currently limited to five reports per day. Attempts by a single 
--- user account to submit reports beyond five will result in Updated being returned 
--- as false. 
export type ReportPlayerServerResult = {
	--- The number of remaining reports which may be filed today by this reporting player. 
	SubmissionsRemaining: number,
}

export type ResultTableNode = {
	--- Either an ItemId, or the TableId of another random result table 
	ResultItem: string,
	--- Whether this entry in the table is an item or a link to another table 
	ResultItemType: string,
	--- How likely this is to be rolled - larger numbers add more weight 
	Weight: number,
}

export type ResultTableNodeType = 
	"ItemId"
	| "TableId"

--- Setting the active state of all non-expired bans for a user to Inactive. Expired 
--- bans with an Active state will be ignored, however. Returns information about 
--- applied updates only. 
export type RevokeAllBansForUserRequest = {
	--- Unique PlayFab assigned ID of the user on whom the operation will be performed. 
	PlayFabId: string,
}

export type RevokeAllBansForUserResult = {
	--- Information on the bans that were revoked. 
	BanData: {BanInfo}?,
}

--- Setting the active state of all bans requested to Inactive regardless of whether 
--- that ban has already expired. BanIds that do not exist will be skipped. Returns 
--- information about applied updates only.  
export type RevokeBansRequest = {
	--- Ids of the bans to be revoked. Maximum 100. 
	BanIds: {any},
}

export type RevokeBansResult = {
	--- Information on the bans that were revoked 
	BanData: {BanInfo}?,
}

export type RevokeInventoryItem = {
	--- Unique PlayFab assigned ID for a specific character owned by a user 
	CharacterId: string?,
	--- Unique PlayFab assigned instance identifier of the item 
	ItemInstanceId: string,
	--- Unique PlayFab assigned ID of the user on whom the operation will be performed. 
	PlayFabId: string,
}

--- In cases where the inventory item in question is a "crate", and the items it 
--- contained have already been dispensed, this will not revoke access or otherwise 
--- remove the items which were dispensed. 
export type RevokeInventoryItemRequest = {
	--- Unique PlayFab assigned ID for a specific character owned by a user 
	CharacterId: string?,
	--- Unique PlayFab assigned instance identifier of the item 
	ItemInstanceId: string,
	--- Unique PlayFab assigned ID of the user on whom the operation will be performed. 
	PlayFabId: string,
}

--- In cases where the inventory item in question is a "crate", and the items it 
--- contained have already been dispensed, this will not revoke access or otherwise 
--- remove the items which were dispensed. 
export type RevokeInventoryItemsRequest = {
	--- Array of player items to revoke, between 1 and 25 items. 
	Items: {RevokeInventoryItem},
}

export type RevokeInventoryItemsResult = {
	--- Collection of any errors that occurred during processing. 
	Errors: {RevokeItemError}?,
}

export type RevokeInventoryResult = {
}

export type RevokeItemError = {
	--- Specific error that was encountered. 
	Error: string?,
	--- Item information that failed to be revoked. 
	Item: RevokeInventoryItem?,
}

--- Represents the save push notification template request. 
export type SavePushNotificationTemplateRequest = {
	--- Android JSON for the notification template. 
	AndroidPayload: string?,
	--- IOS JSON for the notification template. 
	IOSPayload: string?,
	--- Id of the push notification template. 
	Id: string?,
	--- Dictionary of localized push notification templates with the language as the 
	--- key. 
	LocalizedPushNotificationTemplates: LocalizedPushNotificationProperties?,
	--- Name of the push notification template. 
	Name: string,
}

--- Represents the save push notification template result. 
export type SavePushNotificationTemplateResult = {
	--- Id of the push notification template that was saved. 
	PushNotificationTemplateId: string?,
}

export type ScriptExecutionError = {
	--- Error code, such as CloudScriptNotFound, JavascriptException, CloudScriptFunctionArgumentSizeExceeded, 
	--- CloudScriptAPIRequestCountExceeded, CloudScriptAPIRequestError, or CloudScriptHTTPRequestError 
	Error: string?,
	--- Details about the error 
	Message: string?,
	--- Point during the execution of the script at which the error occurred, if any 
	StackTrace: string?,
}

--- PlayFab accounts which have valid email address or username will be able to 
--- receive a password reset email using this API.The email sent must be an account 
--- recovery email template. The username or email can be passed in to send the 
--- email 
export type SendCustomAccountRecoveryEmailRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- User email address attached to their account 
	Email: string?,
	--- The email template id of the account recovery email template to send. 
	EmailTemplateId: string,
	--- The user's username requesting an account recovery. 
	Username: string?,
}

export type SendCustomAccountRecoveryEmailResult = {
}

--- Sends an email for only players that have contact emails associated with them. 
--- Takes in an email template ID specifyingthe email template to send. 
export type SendEmailFromTemplateRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The email template id of the email template to send. 
	EmailTemplateId: string,
	--- Unique PlayFab assigned ID of the user on whom the operation will be performed. 
	PlayFabId: string,
}

export type SendEmailFromTemplateResult = {
}

--- Represents the request for sending a push notification template to a recipient. 
export type SendPushNotificationFromTemplateRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- Id of the push notification template. 
	PushNotificationTemplateId: string,
	--- PlayFabId of the push notification recipient. 
	Recipient: string,
}

export type SendPushNotificationRequest = {
	--- Allows you to provide precisely formatted json to target devices. This is an 
	--- advanced feature, allowing you to deliver to custom plugin logic, fields, or 
	--- functionality not natively supported by PlayFab. 
	AdvancedPlatformDelivery: {AdvancedPushPlatformMsg}?,
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- Text of message to send. 
	Message: string?,
	--- Defines all possible push attributes like message, title, icon, etc. Some parameters 
	--- are device specific - please see the PushNotificationPackage documentation for 
	--- details. 
	Package: PushNotificationPackage?,
	--- PlayFabId of the recipient of the push notification. 
	Recipient: string,
	--- Subject of message to send (may not be displayed in all platforms) 
	Subject: string?,
	--- Target Platforms that should receive the Message or Package. If omitted, we 
	--- will send to all available platforms. 
	TargetPlatforms: {PushNotificationPlatform}?,
}

export type SendPushNotificationResult = {
}

export type ServerCustomIDPlayFabIDPair = {
	--- Unique PlayFab identifier. 
	PlayFabId: string?,
	--- Unique server custom identifier for this player. 
	ServerCustomId: string?,
}

export type ServerLoginResult = {
	--- If LoginTitlePlayerAccountEntity flag is set on the login request the title_player_account 
	--- will also be logged in and returned. 
	EntityToken: EntityTokenResponse?,
	--- Results for requested info. 
	InfoResultPayload: GetPlayerCombinedInfoResultPayload?,
	--- The time of this user's previous login. If there was no previous login, then 
	--- it's DateTime.MinValue 
	LastLoginTime: string?,
	--- True if the account was newly created on this login. 
	NewlyCreated: boolean,
	--- Player's unique PlayFabId. 
	PlayFabId: string?,
	--- Unique token authorizing the user and game at the server level, for the current 
	--- session. 
	SessionTicket: string?,
	--- Settings specific to this user. 
	SettingsForUser: UserSettings?,
	--- The experimentation treatments for this user at the time of login. 
	TreatmentAssignment: TreatmentAssignment?,
}

--- This operation is not additive. It will completely replace the tag list for 
--- the specified user. Please note that only users in the PlayFab friends list 
--- can be assigned tags. Attempting to set a tag on a friend only included in the 
--- friends list from a social site integration (such as Facebook or Steam) will 
--- return the AccountNotFound error. 
export type SetFriendTagsRequest = {
	--- PlayFab identifier of the friend account to which the tag(s) should be applied. 
	FriendPlayFabId: string,
	--- PlayFab identifier of the player whose friend is to be updated. 
	PlayFabId: string,
	--- Array of tags to set on the friend account. 
	Tags: {any},
}

export type SetGameServerInstanceDataRequest = {
	--- Custom data to set for the specified game server instance. 
	GameServerData: string,
	--- Unique identifier of the Game Instance to be updated, in decimal format. 
	LobbyId: string,
}

export type SetGameServerInstanceDataResult = {
}

export type SetGameServerInstanceStateRequest = {
	--- Unique identifier of the Game Instance to be updated, in decimal format. 
	LobbyId: string,
	--- State to set for the specified game server instance. 
	State: string,
}

export type SetGameServerInstanceStateResult = {
}

export type SetGameServerInstanceTagsRequest = {
	--- Unique identifier of the Game Server Instance to be updated. 
	LobbyId: string,
	--- Tags to set for the specified Game Server Instance. Note that this is the complete 
	--- list of tags to be associated with the Game Server Instance. 
	Tags: {[any]: any},
}

export type SetGameServerInstanceTagsResult = {
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
	--- Unique PlayFab assigned ID of the user on whom the operation will be performed. 
	PlayFabId: string,
	--- Player secret that is used to verify API request signatures (Enterprise Only). 
	PlayerSecret: string?,
}

export type SetPlayerSecretResult = {
}

--- This API is designed to store publisher-specific values which can be read, but 
--- not written to, by the client. This data is shared across all titles assigned 
--- to a particular publisher, and can be used for cross-game coordination. Only 
--- titles assigned to a publisher can use this API. This operation is additive. 
--- If a Key does not exist in the current dataset, it will be added with the specified 
--- Value. If it already exists, the Value for that key will be overwritten with 
--- the new Value. For more information email helloplayfab@microsoft.com 
export type SetPublisherDataRequest = {
	--- key we want to set a value on (note, this is additive - will only replace an 
	--- existing key's value if they are the same name.) Keys are trimmed of whitespace. 
	--- Keys may not begin with the '!' character. 
	Key: string,
	--- new value to set. Set to null to remove a value 
	Value: string?,
}

export type SetPublisherDataResult = {
}

--- This API is designed to store title specific values which can be read, but not 
--- written to, by the client. For example, a developer could choose to store values 
--- which modify the user experience, such as enemy spawn rates, weapon strengths, 
--- movement speeds, etc. This allows a developer to update the title without the 
--- need to create, test, and ship a new build. This operation is additive. If a 
--- Key does not exist in the current dataset, it will be added with the specified 
--- Value. If it already exists, the Value for that key will be overwritten with 
--- the new Value. 
export type SetTitleDataRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- key we want to set a value on (note, this is additive - will only replace an 
	--- existing key's value if they are the same name.) Keys are trimmed of whitespace. 
	--- Keys may not begin with the '!' character. 
	Key: string,
	--- new value to set. Set to null to remove a value 
	Value: string?,
}

export type SetTitleDataResult = {
}

export type SharedGroupDataRecord = {
	--- Timestamp for when this data was last updated. 
	LastUpdated: string,
	--- PlayFabId of the user to last update this value. 
	LastUpdatedBy: string?,
	--- Indicates whether this data can be read by all users (public) or only members 
	--- of the group (private). 
	Permission: string?,
	--- Data stored for the specified group data key. 
	Value: string?,
}

export type SourceType = 
	"Admin"
	| "BackEnd"
	| "GameClient"
	| "GameServer"
	| "Partner"
	| "Custom"
	| "API"

export type StatisticModel = {
	--- Statistic name 
	Name: string?,
	--- Statistic value 
	Value: number,
	--- Statistic version (0 if not a versioned statistic) 
	Version: number,
}

export type StatisticNameVersion = {
	--- unique name of the statistic 
	StatisticName: string,
	--- the version of the statistic to be returned 
	Version: number,
}

export type StatisticUpdate = {
	--- unique name of the statistic 
	StatisticName: string,
	--- statistic value for the player 
	Value: number,
	--- for updates to an existing statistic value for a player, the version of the 
	--- statistic when it was loaded. Null when setting the statistic value for the 
	--- first time. 
	Version: number?,
}

export type StatisticValue = {
	--- unique name of the statistic 
	StatisticName: string?,
	--- statistic value for the player 
	Value: number,
	--- for updates to an existing statistic value for a player, the version of the 
	--- statistic when it was loaded 
	Version: number,
}

export type SteamPlayFabIdPair = {
	--- Unique PlayFab identifier for a user, or null if no PlayFab account is linked 
	--- to the Steam identifier. 
	PlayFabId: string?,
	--- Unique Steam identifier for a user. 
	SteamStringId: string?,
}

--- A store entry that list a catalog item at a particular price 
export type StoreItem = {
	--- Store specific custom data. The data only exists as part of this store; it is 
	--- not transferred to item instances 
	CustomData: {[any]: any}?,
	--- Intended display position for this item. Note that 0 is the first position 
	DisplayPosition: number?,
	--- Unique identifier of the item as it exists in the catalog - note that this must 
	--- exactly match the ItemId from the catalog 
	ItemId: string,
	--- Override prices for this item for specific currencies 
	RealCurrencyPrices: {[any]: any}?,
	--- Override prices for this item in virtual currencies and "RM" (the base Real 
	--- Money purchase price, in USD pennies) 
	VirtualCurrencyPrices: {[any]: any}?,
}

--- Marketing data about a specific store 
export type StoreMarketingModel = {
	--- Tagline for a store. 
	Description: string?,
	--- Display name of a store as it will appear to users. 
	DisplayName: string?,
	--- Custom data about a store. 
	Metadata: {[any]: any}?,
}

export type SubscriptionModel = {
	--- When this subscription expires. 
	Expiration: string,
	--- The time the subscription was orignially purchased 
	InitialSubscriptionTime: string,
	--- Whether this subscription is currently active. That is, if Expiration > now. 
	IsActive: boolean,
	--- The status of this subscription, according to the subscription provider. 
	Status: string?,
	--- The id for this subscription 
	SubscriptionId: string?,
	--- The item id for this subscription from the primary catalog 
	SubscriptionItemId: string?,
	--- The provider for this subscription. Apple or Google Play are supported today. 
	SubscriptionProvider: string?,
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

export type SubtractCharacterVirtualCurrencyRequest = {
	--- Amount to be subtracted from the user balance of the specified virtual currency. 
	Amount: number,
	--- Unique PlayFab assigned ID for a specific character owned by a user 
	CharacterId: string,
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- Unique PlayFab assigned ID of the user on whom the operation will be performed. 
	PlayFabId: string,
	--- Name of the virtual currency which is to be decremented. 
	VirtualCurrency: string,
}

export type SubtractUserVirtualCurrencyRequest = {
	--- Amount to be subtracted from the user balance of the specified virtual currency. 
	Amount: number,
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- PlayFab unique identifier of the user whose virtual currency balance is to be 
	--- decreased. 
	PlayFabId: string,
	--- Name of the virtual currency which is to be decremented. 
	VirtualCurrency: string,
}

export type TagModel = {
	--- Full value of the tag, including namespace 
	TagValue: string?,
}

export type TitleActivationStatus = 
	"None"
	| "ActivatedTitleKey"
	| "PendingSteam"
	| "ActivatedSteam"
	| "RevokedSteam"

export type TitleNewsItem = {
	--- News item body. 
	Body: string?,
	--- Unique identifier of news item. 
	NewsId: string?,
	--- Date and time when the news item was posted. 
	Timestamp: string,
	--- Title of the news item. 
	Title: string?,
}

export type TreatmentAssignment = {
	--- List of the experiment variables. 
	Variables: {Variable}?,
	--- List of the experiment variants. 
	Variants: {any}?,
}

export type TwitchPlayFabIdPair = {
	--- Unique PlayFab identifier for a user, or null if no PlayFab account is linked 
	--- to the Twitch identifier. 
	PlayFabId: string?,
	--- Unique Twitch identifier for a user. 
	TwitchId: string?,
}

export type UnlinkNintendoServiceAccountRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- Unique PlayFab assigned ID of the user on whom the operation will be performed. 
	PlayFabId: string,
}

export type UnlinkNintendoSwitchDeviceIdRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- Nintendo Switch Device identifier for the user. If not specified, the most recently 
	--- signed in device ID will be used. 
	NintendoSwitchDeviceId: string?,
	--- Unique PlayFab assigned ID of the user on whom the operation will be performed. 
	PlayFabId: string,
}

export type UnlinkNintendoSwitchDeviceIdResult = {
}

export type UnlinkPSNAccountRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- Unique PlayFab assigned ID of the user on whom the operation will be performed. 
	PlayFabId: string,
}

export type UnlinkPSNAccountResult = {
}

export type UnlinkServerCustomIdRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- Unique PlayFab identifier. 
	PlayFabId: string,
	--- Unique server custom identifier for this player. 
	ServerCustomId: string,
}

export type UnlinkServerCustomIdResult = {
}

export type UnlinkXboxAccountRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- Unique PlayFab identifier for a user, or null if no PlayFab account is linked 
	--- to the Xbox Live identifier. 
	PlayFabId: string,
}

export type UnlinkXboxAccountResult = {
}

--- Specify the container and optionally the catalogVersion for the container to 
--- open 
export type UnlockContainerInstanceRequest = {
	--- Specifies the catalog version that should be used to determine container contents. 
	--- If unspecified, uses catalog associated with the item instance. 
	CatalogVersion: string?,
	--- Unique PlayFab assigned ID for a specific character owned by a user 
	CharacterId: string?,
	--- ItemInstanceId of the container to unlock. 
	ContainerItemInstanceId: string,
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- ItemInstanceId of the key that will be consumed by unlocking this container. 
	--- If the container requires a key, this parameter is required. 
	KeyItemInstanceId: string?,
	--- Unique PlayFab assigned ID of the user on whom the operation will be performed. 
	PlayFabId: string,
}

--- Specify the type of container to open and optionally the catalogVersion for 
--- the container to open 
export type UnlockContainerItemRequest = {
	--- Specifies the catalog version that should be used to determine container contents. 
	--- If unspecified, uses default/primary catalog. 
	CatalogVersion: string?,
	--- Unique PlayFab assigned ID for a specific character owned by a user 
	CharacterId: string?,
	--- Catalog ItemId of the container type to unlock. 
	ContainerItemId: string,
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- Unique PlayFab assigned ID of the user on whom the operation will be performed. 
	PlayFabId: string,
}

--- The items and vc found within the container. These will be added and stacked 
--- in your inventory as appropriate. 
export type UnlockContainerItemResult = {
	--- Items granted to the player as a result of unlocking the container. 
	GrantedItems: {ItemInstance}?,
	--- Unique instance identifier of the container unlocked. 
	UnlockedItemInstanceId: string?,
	--- Unique instance identifier of the key used to unlock the container, if applicable. 
	UnlockedWithItemInstanceId: string?,
	--- Virtual currency granted to the player as a result of unlocking the container. 
	VirtualCurrency: {[any]: any}?,
}

export type UpdateAvatarUrlRequest = {
	--- URL of the avatar image. If empty, it removes the existing avatar URL. 
	ImageUrl: string,
	--- Unique PlayFab assigned ID of the user on whom the operation will be performed. 
	PlayFabId: string,
}

--- Represents a single update ban request. 
export type UpdateBanRequest = {
	--- The updated active state for the ban. Null for no change. 
	Active: boolean?,
	--- The id of the ban to be updated. 
	BanId: string,
	--- The updated expiration date for the ban. Null for no change. 
	Expires: string?,
	--- The updated IP address for the ban. Null for no change. 
	IPAddress: string?,
	--- Whether to make this ban permanent. Set to true to make this ban permanent. 
	--- This will not modify Active state. 
	Permanent: boolean?,
	--- The updated reason for the ban to be updated. Maximum 140 characters. Null for 
	--- no change. 
	Reason: string?,
}

--- For each ban, only updates the values that are set. Leave any value to null 
--- for no change. If a ban could not be found, the rest are still applied. Returns 
--- information about applied updates only. 
export type UpdateBansRequest = {
	--- List of bans to be updated. Maximum 100. 
	Bans: {UpdateBanRequest},
}

export type UpdateBansResult = {
	--- Information on the bans that were updated 
	BanData: {BanInfo}?,
}

--- This function performs an additive update of the arbitrary JSON object containing 
--- the custom data for the user. In updating the custom data object, keys which 
--- already exist in the object will have their values overwritten, while keys with 
--- null values will be removed. No other key-value pairs will be changed apart 
--- from those specified in the call. 
export type UpdateCharacterDataRequest = {
	--- Unique PlayFab assigned ID for a specific character owned by a user 
	CharacterId: string,
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- Key-value pairs to be written to the custom data. Note that keys are trimmed 
	--- of whitespace, are limited in size, and may not begin with a '!' character or 
	--- be null. 
	Data: {[any]: any}?,
	--- Optional list of Data-keys to remove from UserData. Some SDKs cannot insert 
	--- null-values into Data due to language constraints. Use this to delete the keys 
	--- directly. 
	KeysToRemove: {any}?,
	--- Permission to be applied to all user data keys written in this request. Defaults 
	--- to "private" if not set. 
	Permission: string?,
	--- Unique PlayFab assigned ID of the user on whom the operation will be performed. 
	PlayFabId: string,
}

export type UpdateCharacterDataResult = {
	--- Indicates the current version of the data that has been set. This is incremented 
	--- with every set call for that type of data (read-only, internal, etc). This version 
	--- can be provided in Get calls to find updated data. 
	DataVersion: number,
}

--- Character statistics are similar to user statistics in that they are numeric 
--- values which may only be updated by a server operation, in order to minimize 
--- the opportunity for unauthorized changes. In addition to being available for 
--- use by the title, the statistics are used for all leaderboard operations in 
--- PlayFab. 
export type UpdateCharacterStatisticsRequest = {
	--- Unique PlayFab assigned ID for a specific character owned by a user 
	CharacterId: string,
	--- Statistics to be updated with the provided values. 
	CharacterStatistics: {[any]: any}?,
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- Unique PlayFab assigned ID of the user on whom the operation will be performed. 
	PlayFabId: string,
}

export type UpdateCharacterStatisticsResult = {
}

--- This operation is additive. Statistics not currently defined will be added, 
--- while those already defined will be updated with the given values. All other 
--- user statistics will remain unchanged. 
export type UpdatePlayerStatisticsRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- Indicates whether the statistics provided should be set, regardless of the aggregation 
	--- method set on the statistic. Default is false. 
	ForceUpdate: boolean?,
	--- Unique PlayFab assigned ID of the user on whom the operation will be performed. 
	PlayFabId: string,
	--- Statistics to be updated with the provided values 
	Statistics: {StatisticUpdate},
}

export type UpdatePlayerStatisticsResult = {
}

--- Note that in the case of multiple calls to write to the same shared group data 
--- keys, the last write received by the PlayFab service will determine the value 
--- available to subsequent read operations. For scenarios requiring coordination 
--- of data updates, it is recommended that titles make use of user data with read 
--- permission set to public, or a combination of user data and shared group data. 
export type UpdateSharedGroupDataRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- Key-value pairs to be written to the custom data. Note that keys are trimmed 
	--- of whitespace, are limited in size, and may not begin with a '!' character or 
	--- be null. 
	Data: {[any]: any}?,
	--- Optional list of Data-keys to remove from UserData. Some SDKs cannot insert 
	--- null-values into Data due to language constraints. Use this to delete the keys 
	--- directly. 
	KeysToRemove: {any}?,
	--- Permission to be applied to all user data keys in this request. 
	Permission: string?,
	--- Unique identifier for the shared group. 
	SharedGroupId: string,
}

export type UpdateSharedGroupDataResult = {
}

--- This function performs an additive update of the arbitrary JSON object containing 
--- the custom data for the user. In updating the custom data object, keys which 
--- already exist in the object will have their values overwritten, while keys with 
--- null values will be removed. No other key-value pairs will be changed apart 
--- from those specified in the call. 
export type UpdateUserDataRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- Key-value pairs to be written to the custom data. Note that keys are trimmed 
	--- of whitespace, are limited in size, and may not begin with a '!' character or 
	--- be null. 
	Data: {[any]: any}?,
	--- Optional list of Data-keys to remove from UserData. Some SDKs cannot insert 
	--- null-values into Data due to language constraints. Use this to delete the keys 
	--- directly. 
	KeysToRemove: {any}?,
	--- Permission to be applied to all user data keys written in this request. Defaults 
	--- to "private" if not set. 
	Permission: string?,
	--- Unique PlayFab assigned ID of the user on whom the operation will be performed. 
	PlayFabId: string,
}

export type UpdateUserDataResult = {
	--- Indicates the current version of the data that has been set. This is incremented 
	--- with every set call for that type of data (read-only, internal, etc). This version 
	--- can be provided in Get calls to find updated data. 
	DataVersion: number,
}

--- This function performs an additive update of the arbitrary JSON object containing 
--- the custom data for the user. In updating the custom data object, keys which 
--- already exist in the object will have their values overwritten, keys with null 
--- values will be removed. No other key-value pairs will be changed apart from 
--- those specified in the call. 
export type UpdateUserInternalDataRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- Key-value pairs to be written to the custom data. Note that keys are trimmed 
	--- of whitespace, are limited in size, and may not begin with a '!' character or 
	--- be null. 
	Data: {[any]: any}?,
	--- Optional list of Data-keys to remove from UserData. Some SDKs cannot insert 
	--- null-values into Data due to language constraints. Use this to delete the keys 
	--- directly. 
	KeysToRemove: {any}?,
	--- Unique PlayFab assigned ID of the user on whom the operation will be performed. 
	PlayFabId: string,
}

--- This function performs an additive update of the arbitrary JSON object containing 
--- the custom data for the item instance which belongs to the specified user. In 
--- updating the custom data object, keys which already exist in the object will 
--- have their values overwritten, while keys with null values will be removed. 
--- No other key-value pairs will be changed apart from those specified in the call. 
export type UpdateUserInventoryItemDataRequest = {
	--- Unique PlayFab assigned ID for a specific character owned by a user 
	CharacterId: string?,
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- Key-value pairs to be written to the custom data. Note that keys are trimmed 
	--- of whitespace, are limited in size, and may not begin with a '!' character or 
	--- be null. 
	Data: {[any]: any}?,
	--- Unique PlayFab assigned instance identifier of the item 
	ItemInstanceId: string,
	--- Optional list of Data-keys to remove from UserData. Some SDKs cannot insert 
	--- null-values into Data due to language constraints. Use this to delete the keys 
	--- directly. 
	KeysToRemove: {any}?,
	--- Unique PlayFab assigned ID of the user on whom the operation will be performed. 
	PlayFabId: string,
}

export type UserAccountInfo = {
	--- User Android device information, if an Android device has been linked 
	AndroidDeviceInfo: UserAndroidDeviceInfo?,
	--- Sign in with Apple account information, if an Apple account has been linked 
	AppleAccountInfo: UserAppleIdInfo?,
	--- Timestamp indicating when the user account was created 
	Created: string,
	--- Custom ID information, if a custom ID has been assigned 
	CustomIdInfo: UserCustomIdInfo?,
	--- User Facebook information, if a Facebook account has been linked 
	FacebookInfo: UserFacebookInfo?,
	--- Facebook Instant Games account information, if a Facebook Instant Games account 
	--- has been linked 
	FacebookInstantGamesIdInfo: UserFacebookInstantGamesIdInfo?,
	--- User Gamecenter information, if a Gamecenter account has been linked 
	GameCenterInfo: UserGameCenterInfo?,
	--- User Google account information, if a Google account has been linked 
	GoogleInfo: UserGoogleInfo?,
	--- User Google Play Games account information, if a Google Play Games account has 
	--- been linked 
	GooglePlayGamesInfo: UserGooglePlayGamesInfo?,
	--- User iOS device information, if an iOS device has been linked 
	IosDeviceInfo: UserIosDeviceInfo?,
	--- User Kongregate account information, if a Kongregate account has been linked 
	KongregateInfo: UserKongregateInfo?,
	--- Nintendo Switch account information, if a Nintendo Switch account has been linked 
	NintendoSwitchAccountInfo: UserNintendoSwitchAccountIdInfo?,
	--- Nintendo Switch device information, if a Nintendo Switch device has been linked 
	NintendoSwitchDeviceIdInfo: UserNintendoSwitchDeviceIdInfo?,
	--- OpenID Connect information, if any OpenID Connect accounts have been linked 
	OpenIdInfo: {UserOpenIdInfo}?,
	--- Unique identifier for the user account 
	PlayFabId: string?,
	--- Personal information for the user which is considered more sensitive 
	PrivateInfo: UserPrivateAccountInfo?,
	--- User PlayStation :tm: Network account information, if a PlayStation :tm: Network 
	--- account has been linked 
	PsnInfo: UserPsnInfo?,
	--- User Steam information, if a Steam account has been linked 
	SteamInfo: UserSteamInfo?,
	--- Title-specific information for the user account 
	TitleInfo: UserTitleInfo?,
	--- User Twitch account information, if a Twitch account has been linked 
	TwitchInfo: UserTwitchInfo?,
	--- User account name in the PlayFab service 
	Username: string?,
	--- User XBox account information, if a XBox account has been linked 
	XboxInfo: UserXboxInfo?,
}

export type UserAndroidDeviceInfo = {
	--- Android device ID 
	AndroidDeviceId: string?,
}

export type UserAppleIdInfo = {
	--- Apple subject ID 
	AppleSubjectId: string?,
}

export type UserCustomIdInfo = {
	--- Custom ID 
	CustomId: string?,
}

--- Indicates whether a given data key is private (readable only by the player) 
--- or public (readable by all players). When a player makes a GetUserData request 
--- about another player, only keys marked Public will be returned. 
export type UserDataPermission = 
	"Private"
	| "Public"

export type UserDataRecord = {
	--- Timestamp for when this data was last updated. 
	LastUpdated: string,
	--- Indicates whether this data can be read by all users (public) or only the user 
	--- (private). This is used for GetUserData requests being made by one player about 
	--- another player. 
	Permission: string?,
	--- Data stored for the specified user data key. 
	Value: string?,
}

export type UserFacebookInfo = {
	--- Facebook identifier 
	FacebookId: string?,
	--- Facebook full name 
	FullName: string?,
}

export type UserFacebookInstantGamesIdInfo = {
	--- Facebook Instant Games ID 
	FacebookInstantGamesId: string?,
}

export type UserGameCenterInfo = {
	--- Gamecenter identifier 
	GameCenterId: string?,
}

export type UserGoogleInfo = {
	--- Email address of the Google account 
	GoogleEmail: string?,
	--- Gender information of the Google account 
	GoogleGender: string?,
	--- Google ID 
	GoogleId: string?,
	--- Locale of the Google account 
	GoogleLocale: string?,
	--- Name of the Google account user 
	GoogleName: string?,
}

export type UserGooglePlayGamesInfo = {
	--- Avatar image url of the Google Play Games player 
	GooglePlayGamesPlayerAvatarImageUrl: string?,
	--- Display name of the Google Play Games player 
	GooglePlayGamesPlayerDisplayName: string?,
	--- Google Play Games player ID 
	GooglePlayGamesPlayerId: string?,
}

export type UserIosDeviceInfo = {
	--- iOS device ID 
	IosDeviceId: string?,
}

export type UserKongregateInfo = {
	--- Kongregate ID 
	KongregateId: string?,
	--- Kongregate Username 
	KongregateName: string?,
}

export type UserNintendoSwitchAccountIdInfo = {
	--- Nintendo Switch account subject ID 
	NintendoSwitchAccountSubjectId: string?,
}

export type UserNintendoSwitchDeviceIdInfo = {
	--- Nintendo Switch Device ID 
	NintendoSwitchDeviceId: string?,
}

export type UserOpenIdInfo = {
	--- OpenID Connection ID 
	ConnectionId: string?,
	--- OpenID Issuer 
	Issuer: string?,
	--- OpenID Subject 
	Subject: string?,
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
	--- user email address 
	Email: string?,
}

export type UserPsnInfo = {
	--- PlayStation :tm: Network account ID 
	PsnAccountId: string?,
	--- PlayStation :tm: Network online ID 
	PsnOnlineId: string?,
}

export type UserSettings = {
	--- Boolean for whether this player is eligible for gathering device info. 
	GatherDeviceInfo: boolean,
	--- Boolean for whether this player should report OnFocus play-time tracking. 
	GatherFocusInfo: boolean,
	--- Boolean for whether this player is eligible for ad tracking. 
	NeedsAttribution: boolean,
}

export type UserSteamInfo = {
	--- what stage of game ownership the user is listed as being in, from Steam 
	SteamActivationStatus: string?,
	--- the country in which the player resides, from Steam data 
	SteamCountry: string?,
	--- currency type set in the user Steam account 
	SteamCurrency: string?,
	--- Steam identifier 
	SteamId: string?,
	--- Steam display name 
	SteamName: string?,
}

export type UserTitleInfo = {
	--- URL to the player's avatar. 
	AvatarUrl: string?,
	--- timestamp indicating when the user was first associated with this game (this 
	--- can differ significantly from when the user first registered with PlayFab) 
	Created: string,
	--- name of the user, as it is displayed in-game 
	DisplayName: string?,
	--- timestamp indicating when the user first signed into this game (this can differ 
	--- from the Created timestamp, as other events, such as issuing a beta key to the 
	--- user, can associate the title to the user) 
	FirstLogin: string?,
	--- timestamp for the last user login for this title 
	LastLogin: string?,
	--- source by which the user first joined the game, if known 
	Origination: string?,
	--- Title player account entity for this user 
	TitlePlayerAccount: EntityKey?,
	--- boolean indicating whether or not the user is currently banned for a title 
	isBanned: boolean?,
}

export type UserTwitchInfo = {
	--- Twitch ID 
	TwitchId: string?,
	--- Twitch Username 
	TwitchUserName: string?,
}

export type UserXboxInfo = {
	--- XBox user ID 
	XboxUserId: string?,
	--- XBox user sandbox 
	XboxUserSandbox: string?,
}

export type ValueToDateModel = {
	--- ISO 4217 code of the currency used in the purchases 
	Currency: string?,
	--- Total value of the purchases in a whole number of 1/100 monetary units. For 
	--- example, 999 indicates nine dollars and ninety-nine cents when Currency is 'USD') 
	TotalValue: number,
	--- Total value of the purchases in a string representation of decimal monetary 
	--- units. For example, '9.99' indicates nine dollars and ninety-nine cents when 
	--- Currency is 'USD'. 
	TotalValueAsDecimal: string?,
}

export type Variable = {
	--- Name of the variable. 
	Name: string,
	--- Value of the variable. 
	Value: string?,
}

export type VirtualCurrencyRechargeTime = {
	--- Maximum value to which the regenerating currency will automatically increment. 
	--- Note that it can exceed this value through use of the AddUserVirtualCurrency 
	--- API call. However, it will not regenerate automatically until it has fallen 
	--- below this value. 
	RechargeMax: number,
	--- Server timestamp in UTC indicating the next time the virtual currency will be 
	--- incremented. 
	RechargeTime: string,
	--- Time remaining (in seconds) before the next recharge increment of the virtual 
	--- currency. 
	SecondsToRecharge: number,
}

export type WriteEventResponse = {
	--- The unique identifier of the event. The values of this identifier consist of 
	--- ASCII characters and are not constrained to any particular format. 
	EventId: string?,
}

--- This API is designed to write a multitude of different event types into PlayStream. 
--- It supports a flexible JSON schema, which allowsfor arbitrary key-value pairs 
--- to describe any character-based event. The created event will be locked to the 
--- authenticated title.  
export type WriteServerCharacterEventRequest = {
	--- Custom event properties. Each property consists of a name (string) and a value 
	--- (JSON object). 
	Body: {[any]: any}?,
	--- Unique PlayFab assigned ID for a specific character owned by a user 
	CharacterId: string,
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The name of the event, within the namespace scoped to the title. The naming 
	--- convention is up to the caller, but it commonly follows the subject_verb_object 
	--- pattern (e.g. player_logged_in). 
	EventName: string,
	--- Unique PlayFab assigned ID of the user on whom the operation will be performed. 
	PlayFabId: string,
	--- The time (in UTC) associated with this event. The value defaults to the current 
	--- time. 
	Timestamp: string?,
}

--- This API is designed to write a multitude of different event types into PlayStream. 
--- It supports a flexible JSON schema, which allowsfor arbitrary key-value pairs 
--- to describe any player-based event. The created event will be locked to the 
--- authenticated title.  
export type WriteServerPlayerEventRequest = {
	--- Custom data properties associated with the event. Each property consists of 
	--- a name (string) and a value (JSON object). 
	Body: {[any]: any}?,
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The name of the event, within the namespace scoped to the title. The naming 
	--- convention is up to the caller, but it commonly follows the subject_verb_object 
	--- pattern (e.g. player_logged_in). 
	EventName: string,
	--- Unique PlayFab assigned ID of the user on whom the operation will be performed. 
	PlayFabId: string,
	--- The time (in UTC) associated with this event. The value defaults to the current 
	--- time. 
	Timestamp: string?,
}

--- This API is designed to write a multitude of different event types into PlayStream. 
--- It supports a flexible JSON schema, which allowsfor arbitrary key-value pairs 
--- to describe any title-based event. The created event will be locked to the authenticated 
--- title.  
export type WriteTitleEventRequest = {
	--- Custom event properties. Each property consists of a name (string) and a value 
	--- (JSON object). 
	Body: {[any]: any}?,
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The name of the event, within the namespace scoped to the title. The naming 
	--- convention is up to the caller, but it commonly follows the subject_verb_object 
	--- pattern (e.g. player_logged_in). 
	EventName: string,
	--- The time (in UTC) associated with this event. The value defaults to the current 
	--- time. 
	Timestamp: string?,
}

export type XboxLiveAccountPlayFabIdPair = {
	--- Unique PlayFab identifier for a user, or null if no PlayFab account is linked 
	--- to the Xbox Live identifier. 
	PlayFabId: string?,
	--- Unique Xbox Live identifier for a user. 
	XboxLiveAccountId: string?,
}


--- https://docs.microsoft.com/rest/api/playfab/server/player-item-management/addcharactervirtualcurrency
function ServerApi.AddCharacterVirtualCurrencyAsync(
	secretKey: string, 
	request: AddCharacterVirtualCurrencyRequest
): ModifyCharacterVirtualCurrencyResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Server/AddCharacterVirtualCurrency",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/friend-list-management/addfriend
function ServerApi.AddFriendAsync(
	secretKey: string, 
	request: AddFriendRequest
): EmptyResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Server/AddFriend",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/account-management/addgenericid
function ServerApi.AddGenericIDAsync(
	secretKey: string, 
	request: AddGenericIDRequest
): EmptyResult | ApiErrorWrapper
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
function ServerApi.AddPlayerTagAsync(
	secretKey: string, 
	request: AddPlayerTagRequest
): AddPlayerTagResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Server/AddPlayerTag",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/shared-group-data/addsharedgroupmembers
function ServerApi.AddSharedGroupMembersAsync(
	secretKey: string, 
	request: AddSharedGroupMembersRequest
): AddSharedGroupMembersResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Server/AddSharedGroupMembers",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/player-item-management/adduservirtualcurrency
function ServerApi.AddUserVirtualCurrencyAsync(
	secretKey: string, 
	request: AddUserVirtualCurrencyRequest
): ModifyUserVirtualCurrencyResult | ApiErrorWrapper
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
function ServerApi.AuthenticateSessionTicketAsync(
	secretKey: string, 
	request: AuthenticateSessionTicketRequest
): AuthenticateSessionTicketResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Server/AuthenticateSessionTicket",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/platform-specific-methods/awardsteamachievement
function ServerApi.AwardSteamAchievementAsync(
	secretKey: string, 
	request: AwardSteamAchievementRequest
): AwardSteamAchievementResult | ApiErrorWrapper
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
function ServerApi.BanUsersAsync(
	secretKey: string, 
	request: BanUsersRequest
): BanUsersResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Server/BanUsers",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/player-item-management/consumeitem
function ServerApi.ConsumeItemAsync(
	secretKey: string, 
	request: ConsumeItemRequest
): ConsumeItemResult | ApiErrorWrapper
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
function ServerApi.CreateSharedGroupAsync(
	secretKey: string, 
	request: CreateSharedGroupRequest
): CreateSharedGroupResult | ApiErrorWrapper
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
function ServerApi.DeleteCharacterFromUserAsync(
	secretKey: string, 
	request: DeleteCharacterFromUserRequest
): DeleteCharacterFromUserResult | ApiErrorWrapper
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
function ServerApi.DeletePlayerAsync(
	secretKey: string, 
	request: DeletePlayerRequest
): DeletePlayerResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Server/DeletePlayer",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/account-management/deletepushnotificationtemplate
function ServerApi.DeletePushNotificationTemplateAsync(
	secretKey: string, 
	request: DeletePushNotificationTemplateRequest
): DeletePushNotificationTemplateResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Server/DeletePushNotificationTemplate",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/shared-group-data/deletesharedgroup
function ServerApi.DeleteSharedGroupAsync(
	secretKey: string, 
	request: DeleteSharedGroupRequest
): EmptyResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Server/DeleteSharedGroup",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/matchmaking/deregistergame
function ServerApi.DeregisterGameAsync(
	secretKey: string, 
	request: DeregisterGameRequest
): DeregisterGameResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Server/DeregisterGame",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/player-item-management/evaluaterandomresulttable
function ServerApi.EvaluateRandomResultTableAsync(
	secretKey: string, 
	request: EvaluateRandomResultTableRequest
): EvaluateRandomResultTableResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Server/EvaluateRandomResultTable",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/server-side-cloud-script/executecloudscript
function ServerApi.ExecuteCloudScriptAsync(
	secretKey: string, 
	request: ExecuteCloudScriptServerRequest
): ExecuteCloudScriptResult | ApiErrorWrapper
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
function ServerApi.GetAllSegmentsAsync(
	secretKey: string, 
	request: GetAllSegmentsRequest
): GetAllSegmentsResult | ApiErrorWrapper
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
function ServerApi.GetAllUsersCharactersAsync(
	secretKey: string, 
	request: ListUsersCharactersRequest
): ListUsersCharactersResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Server/GetAllUsersCharacters",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/title-wide-data-management/getcatalogitems
function ServerApi.GetCatalogItemsAsync(
	secretKey: string, 
	request: GetCatalogItemsRequest
): GetCatalogItemsResult | ApiErrorWrapper
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
function ServerApi.GetCharacterDataAsync(
	secretKey: string, 
	request: GetCharacterDataRequest
): GetCharacterDataResult | ApiErrorWrapper
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
function ServerApi.GetCharacterInternalDataAsync(
	secretKey: string, 
	request: GetCharacterDataRequest
): GetCharacterDataResult | ApiErrorWrapper
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
function ServerApi.GetCharacterInventoryAsync(
	secretKey: string, 
	request: GetCharacterInventoryRequest
): GetCharacterInventoryResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Server/GetCharacterInventory",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/characters/getcharacterleaderboard
function ServerApi.GetCharacterLeaderboardAsync(
	secretKey: string, 
	request: GetCharacterLeaderboardRequest
): GetCharacterLeaderboardResult | ApiErrorWrapper
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
function ServerApi.GetCharacterReadOnlyDataAsync(
	secretKey: string, 
	request: GetCharacterDataRequest
): GetCharacterDataResult | ApiErrorWrapper
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
function ServerApi.GetCharacterStatisticsAsync(
	secretKey: string, 
	request: GetCharacterStatisticsRequest
): GetCharacterStatisticsResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Server/GetCharacterStatistics",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/content/getcontentdownloadurl
function ServerApi.GetContentDownloadUrlAsync(
	secretKey: string, 
	request: GetContentDownloadUrlRequest
): GetContentDownloadUrlResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Server/GetContentDownloadUrl",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/player-data-management/getfriendleaderboard
function ServerApi.GetFriendLeaderboardAsync(
	secretKey: string, 
	request: GetFriendLeaderboardRequest
): GetLeaderboardResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Server/GetFriendLeaderboard",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/friend-list-management/getfriendslist
function ServerApi.GetFriendsListAsync(
	secretKey: string, 
	request: GetFriendsListRequest
): GetFriendsListResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Server/GetFriendsList",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/player-data-management/getleaderboard
function ServerApi.GetLeaderboardAsync(
	secretKey: string, 
	request: GetLeaderboardRequest
): GetLeaderboardResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Server/GetLeaderboard",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/characters/getleaderboardaroundcharacter
function ServerApi.GetLeaderboardAroundCharacterAsync(
	secretKey: string, 
	request: GetLeaderboardAroundCharacterRequest
): GetLeaderboardAroundCharacterResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Server/GetLeaderboardAroundCharacter",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/player-data-management/getleaderboardarounduser
function ServerApi.GetLeaderboardAroundUserAsync(
	secretKey: string, 
	request: GetLeaderboardAroundUserRequest
): GetLeaderboardAroundUserResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Server/GetLeaderboardAroundUser",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/characters/getleaderboardforusercharacters
function ServerApi.GetLeaderboardForUserCharactersAsync(
	secretKey: string, 
	request: GetLeaderboardForUsersCharactersRequest
): GetLeaderboardForUsersCharactersResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Server/GetLeaderboardForUserCharacters",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/account-management/getplayfabidsfromfacebookids
function ServerApi.GetPlayFabIDsFromFacebookIDsAsync(
	secretKey: string, 
	request: GetPlayFabIDsFromFacebookIDsRequest
): GetPlayFabIDsFromFacebookIDsResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Server/GetPlayFabIDsFromFacebookIDs",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/account-management/getplayfabidsfromfacebookinstantgamesids
function ServerApi.GetPlayFabIDsFromFacebookInstantGamesIdsAsync(
	secretKey: string, 
	request: GetPlayFabIDsFromFacebookInstantGamesIdsRequest
): GetPlayFabIDsFromFacebookInstantGamesIdsResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Server/GetPlayFabIDsFromFacebookInstantGamesIds",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/account-management/getplayfabidsfromgenericids
function ServerApi.GetPlayFabIDsFromGenericIDsAsync(
	secretKey: string, 
	request: GetPlayFabIDsFromGenericIDsRequest
): GetPlayFabIDsFromGenericIDsResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Server/GetPlayFabIDsFromGenericIDs",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/account-management/getplayfabidsfromnintendoserviceaccountids
function ServerApi.GetPlayFabIDsFromNintendoServiceAccountIdsAsync(
	secretKey: string, 
	request: GetPlayFabIDsFromNintendoServiceAccountIdsRequest
): GetPlayFabIDsFromNintendoServiceAccountIdsResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Server/GetPlayFabIDsFromNintendoServiceAccountIds",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/account-management/getplayfabidsfromnintendoswitchdeviceids
function ServerApi.GetPlayFabIDsFromNintendoSwitchDeviceIdsAsync(
	secretKey: string, 
	request: GetPlayFabIDsFromNintendoSwitchDeviceIdsRequest
): GetPlayFabIDsFromNintendoSwitchDeviceIdsResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Server/GetPlayFabIDsFromNintendoSwitchDeviceIds",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/account-management/getplayfabidsfrompsnaccountids
function ServerApi.GetPlayFabIDsFromPSNAccountIDsAsync(
	secretKey: string, 
	request: GetPlayFabIDsFromPSNAccountIDsRequest
): GetPlayFabIDsFromPSNAccountIDsResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Server/GetPlayFabIDsFromPSNAccountIDs",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/account-management/getplayfabidsfromsteamids
function ServerApi.GetPlayFabIDsFromSteamIDsAsync(
	secretKey: string, 
	request: GetPlayFabIDsFromSteamIDsRequest
): GetPlayFabIDsFromSteamIDsResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Server/GetPlayFabIDsFromSteamIDs",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/account-management/getplayfabidsfromtwitchids
function ServerApi.GetPlayFabIDsFromTwitchIDsAsync(
	secretKey: string, 
	request: GetPlayFabIDsFromTwitchIDsRequest
): GetPlayFabIDsFromTwitchIDsResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Server/GetPlayFabIDsFromTwitchIDs",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/account-management/getplayfabidsfromxboxliveids
function ServerApi.GetPlayFabIDsFromXboxLiveIDsAsync(
	secretKey: string, 
	request: GetPlayFabIDsFromXboxLiveIDsRequest
): GetPlayFabIDsFromXboxLiveIDsResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Server/GetPlayFabIDsFromXboxLiveIDs",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/player-data-management/getplayercombinedinfo
function ServerApi.GetPlayerCombinedInfoAsync(
	secretKey: string, 
	request: GetPlayerCombinedInfoRequest
): GetPlayerCombinedInfoResult | ApiErrorWrapper
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
function ServerApi.GetPlayerProfileAsync(
	secretKey: string, 
	request: GetPlayerProfileRequest
): GetPlayerProfileResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Server/GetPlayerProfile",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/playstream/getplayersegments
function ServerApi.GetPlayerSegmentsAsync(
	secretKey: string, 
	request: GetPlayersSegmentsRequest
): GetPlayerSegmentsResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Server/GetPlayerSegments",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/player-data-management/getplayerstatisticversions
function ServerApi.GetPlayerStatisticVersionsAsync(
	secretKey: string, 
	request: GetPlayerStatisticVersionsRequest
): GetPlayerStatisticVersionsResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Server/GetPlayerStatisticVersions",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/player-data-management/getplayerstatistics
function ServerApi.GetPlayerStatisticsAsync(
	secretKey: string, 
	request: GetPlayerStatisticsRequest
): GetPlayerStatisticsResult | ApiErrorWrapper
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
function ServerApi.GetPlayerTagsAsync(
	secretKey: string, 
	request: GetPlayerTagsRequest
): GetPlayerTagsResult | ApiErrorWrapper
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
function ServerApi.GetPlayersInSegmentAsync(
	secretKey: string, 
	request: GetPlayersInSegmentRequest
): GetPlayersInSegmentResult | ApiErrorWrapper
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
function ServerApi.GetPublisherDataAsync(
	secretKey: string, 
	request: GetPublisherDataRequest
): GetPublisherDataResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Server/GetPublisherData",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/player-item-management/getrandomresulttables
function ServerApi.GetRandomResultTablesAsync(
	secretKey: string, 
	request: GetRandomResultTablesRequest
): GetRandomResultTablesResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Server/GetRandomResultTables",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/account-management/getservercustomidsfromplayfabids
function ServerApi.GetServerCustomIDsFromPlayFabIDsAsync(
	secretKey: string, 
	request: GetServerCustomIDsFromPlayFabIDsRequest
): GetServerCustomIDsFromPlayFabIDsResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Server/GetServerCustomIDsFromPlayFabIDs",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/shared-group-data/getsharedgroupdata
function ServerApi.GetSharedGroupDataAsync(
	secretKey: string, 
	request: GetSharedGroupDataRequest
): GetSharedGroupDataResult | ApiErrorWrapper
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
function ServerApi.GetStoreItemsAsync(
	secretKey: string, 
	request: GetStoreItemsServerRequest
): GetStoreItemsResult | ApiErrorWrapper
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
function ServerApi.GetTimeAsync(
	secretKey: string, 
	request: GetTimeRequest
): GetTimeResult | ApiErrorWrapper
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
function ServerApi.GetTitleDataAsync(
	secretKey: string, 
	request: GetTitleDataRequest
): GetTitleDataResult | ApiErrorWrapper
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
function ServerApi.GetTitleInternalDataAsync(
	secretKey: string, 
	request: GetTitleDataRequest
): GetTitleDataResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Server/GetTitleInternalData",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/title-wide-data-management/gettitlenews
function ServerApi.GetTitleNewsAsync(
	secretKey: string, 
	request: GetTitleNewsRequest
): GetTitleNewsResult | ApiErrorWrapper
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
function ServerApi.GetUserAccountInfoAsync(
	secretKey: string, 
	request: GetUserAccountInfoRequest
): GetUserAccountInfoResult | ApiErrorWrapper
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
function ServerApi.GetUserBansAsync(
	secretKey: string, 
	request: GetUserBansRequest
): GetUserBansResult | ApiErrorWrapper
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
function ServerApi.GetUserDataAsync(
	secretKey: string, 
	request: GetUserDataRequest
): GetUserDataResult | ApiErrorWrapper
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
function ServerApi.GetUserInternalDataAsync(
	secretKey: string, 
	request: GetUserDataRequest
): GetUserDataResult | ApiErrorWrapper
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
function ServerApi.GetUserInventoryAsync(
	secretKey: string, 
	request: GetUserInventoryRequest
): GetUserInventoryResult | ApiErrorWrapper
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
function ServerApi.GetUserPublisherDataAsync(
	secretKey: string, 
	request: GetUserDataRequest
): GetUserDataResult | ApiErrorWrapper
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
function ServerApi.GetUserPublisherInternalDataAsync(
	secretKey: string, 
	request: GetUserDataRequest
): GetUserDataResult | ApiErrorWrapper
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
function ServerApi.GetUserPublisherReadOnlyDataAsync(
	secretKey: string, 
	request: GetUserDataRequest
): GetUserDataResult | ApiErrorWrapper
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
function ServerApi.GetUserReadOnlyDataAsync(
	secretKey: string, 
	request: GetUserDataRequest
): GetUserDataResult | ApiErrorWrapper
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
function ServerApi.GrantCharacterToUserAsync(
	secretKey: string, 
	request: GrantCharacterToUserRequest
): GrantCharacterToUserResult | ApiErrorWrapper
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
function ServerApi.GrantItemsToCharacterAsync(
	secretKey: string, 
	request: GrantItemsToCharacterRequest
): GrantItemsToCharacterResult | ApiErrorWrapper
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
function ServerApi.GrantItemsToUserAsync(
	secretKey: string, 
	request: GrantItemsToUserRequest
): GrantItemsToUserResult | ApiErrorWrapper
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
function ServerApi.GrantItemsToUsersAsync(
	secretKey: string, 
	request: GrantItemsToUsersRequest
): GrantItemsToUsersResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Server/GrantItemsToUsers",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/account-management/linknintendoserviceaccount
function ServerApi.LinkNintendoServiceAccountAsync(
	secretKey: string, 
	request: LinkNintendoServiceAccountRequest
): EmptyResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Server/LinkNintendoServiceAccount",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/account-management/linknintendoswitchdeviceid
function ServerApi.LinkNintendoSwitchDeviceIdAsync(
	secretKey: string, 
	request: LinkNintendoSwitchDeviceIdRequest
): LinkNintendoSwitchDeviceIdResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Server/LinkNintendoSwitchDeviceId",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/account-management/linkpsnaccount
function ServerApi.LinkPSNAccountAsync(
	secretKey: string, 
	request: LinkPSNAccountRequest
): LinkPSNAccountResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Server/LinkPSNAccount",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/account-management/linkservercustomid
function ServerApi.LinkServerCustomIdAsync(
	secretKey: string, 
	request: LinkServerCustomIdRequest
): LinkServerCustomIdResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Server/LinkServerCustomId",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/account-management/linkxboxaccount
function ServerApi.LinkXboxAccountAsync(
	secretKey: string, 
	request: LinkXboxAccountRequest
): LinkXboxAccountResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Server/LinkXboxAccount",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/authentication/loginwithservercustomid
function ServerApi.LoginWithServerCustomIdAsync(
	secretKey: string, 
	request: LoginWithServerCustomIdRequest
): ServerLoginResult | ApiErrorWrapper
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
function ServerApi.LoginWithSteamIdAsync(
	secretKey: string, 
	request: LoginWithSteamIdRequest
): ServerLoginResult | ApiErrorWrapper
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
function ServerApi.LoginWithXboxAsync(
	secretKey: string, 
	request: LoginWithXboxRequest
): ServerLoginResult | ApiErrorWrapper
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
function ServerApi.LoginWithXboxIdAsync(
	secretKey: string, 
	request: LoginWithXboxIdRequest
): ServerLoginResult | ApiErrorWrapper
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
function ServerApi.ModifyItemUsesAsync(
	secretKey: string, 
	request: ModifyItemUsesRequest
): ModifyItemUsesResult | ApiErrorWrapper
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
function ServerApi.MoveItemToCharacterFromCharacterAsync(
	secretKey: string, 
	request: MoveItemToCharacterFromCharacterRequest
): MoveItemToCharacterFromCharacterResult | ApiErrorWrapper
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
function ServerApi.MoveItemToCharacterFromUserAsync(
	secretKey: string, 
	request: MoveItemToCharacterFromUserRequest
): MoveItemToCharacterFromUserResult | ApiErrorWrapper
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
function ServerApi.MoveItemToUserFromCharacterAsync(
	secretKey: string, 
	request: MoveItemToUserFromCharacterRequest
): MoveItemToUserFromCharacterResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Server/MoveItemToUserFromCharacter",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/matchmaking/notifymatchmakerplayerleft
function ServerApi.NotifyMatchmakerPlayerLeftAsync(
	secretKey: string, 
	request: NotifyMatchmakerPlayerLeftRequest
): NotifyMatchmakerPlayerLeftResult | ApiErrorWrapper
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
function ServerApi.RedeemCouponAsync(
	secretKey: string, 
	request: RedeemCouponRequest
): RedeemCouponResult | ApiErrorWrapper
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
function ServerApi.RedeemMatchmakerTicketAsync(
	secretKey: string, 
	request: RedeemMatchmakerTicketRequest
): RedeemMatchmakerTicketResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Server/RedeemMatchmakerTicket",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/matchmaking/refreshgameserverinstanceheartbeat
function ServerApi.RefreshGameServerInstanceHeartbeatAsync(
	secretKey: string, 
	request: RefreshGameServerInstanceHeartbeatRequest
): RefreshGameServerInstanceHeartbeatResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Server/RefreshGameServerInstanceHeartbeat",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/matchmaking/registergame
function ServerApi.RegisterGameAsync(
	secretKey: string, 
	request: RegisterGameRequest
): RegisterGameResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Server/RegisterGame",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/friend-list-management/removefriend
function ServerApi.RemoveFriendAsync(
	secretKey: string, 
	request: RemoveFriendRequest
): EmptyResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Server/RemoveFriend",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/account-management/removegenericid
function ServerApi.RemoveGenericIDAsync(
	secretKey: string, 
	request: RemoveGenericIDRequest
): EmptyResult | ApiErrorWrapper
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
function ServerApi.RemovePlayerTagAsync(
	secretKey: string, 
	request: RemovePlayerTagRequest
): RemovePlayerTagResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Server/RemovePlayerTag",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/shared-group-data/removesharedgroupmembers
function ServerApi.RemoveSharedGroupMembersAsync(
	secretKey: string, 
	request: RemoveSharedGroupMembersRequest
): RemoveSharedGroupMembersResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Server/RemoveSharedGroupMembers",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/player-item-management/reportplayer
function ServerApi.ReportPlayerAsync(
	secretKey: string, 
	request: ReportPlayerServerRequest
): ReportPlayerServerResult | ApiErrorWrapper
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
function ServerApi.RevokeAllBansForUserAsync(
	secretKey: string, 
	request: RevokeAllBansForUserRequest
): RevokeAllBansForUserResult | ApiErrorWrapper
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
function ServerApi.RevokeBansAsync(
	secretKey: string, 
	request: RevokeBansRequest
): RevokeBansResult | ApiErrorWrapper
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
function ServerApi.RevokeInventoryItemAsync(
	secretKey: string, 
	request: RevokeInventoryItemRequest
): RevokeInventoryResult | ApiErrorWrapper
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
function ServerApi.RevokeInventoryItemsAsync(
	secretKey: string, 
	request: RevokeInventoryItemsRequest
): RevokeInventoryItemsResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Server/RevokeInventoryItems",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/account-management/savepushnotificationtemplate
function ServerApi.SavePushNotificationTemplateAsync(
	secretKey: string, 
	request: SavePushNotificationTemplateRequest
): SavePushNotificationTemplateResult | ApiErrorWrapper
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
function ServerApi.SendCustomAccountRecoveryEmailAsync(
	secretKey: string, 
	request: SendCustomAccountRecoveryEmailRequest
): SendCustomAccountRecoveryEmailResult | ApiErrorWrapper
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
function ServerApi.SendEmailFromTemplateAsync(
	secretKey: string, 
	request: SendEmailFromTemplateRequest
): SendEmailFromTemplateResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Server/SendEmailFromTemplate",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/account-management/sendpushnotification
function ServerApi.SendPushNotificationAsync(
	secretKey: string, 
	request: SendPushNotificationRequest
): SendPushNotificationResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Server/SendPushNotification",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/account-management/sendpushnotificationfromtemplate
function ServerApi.SendPushNotificationFromTemplateAsync(
	secretKey: string, 
	request: SendPushNotificationFromTemplateRequest
): SendPushNotificationResult | ApiErrorWrapper
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
function ServerApi.SetFriendTagsAsync(
	secretKey: string, 
	request: SetFriendTagsRequest
): EmptyResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Server/SetFriendTags",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/matchmaking/setgameserverinstancedata
function ServerApi.SetGameServerInstanceDataAsync(
	secretKey: string, 
	request: SetGameServerInstanceDataRequest
): SetGameServerInstanceDataResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Server/SetGameServerInstanceData",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/matchmaking/setgameserverinstancestate
function ServerApi.SetGameServerInstanceStateAsync(
	secretKey: string, 
	request: SetGameServerInstanceStateRequest
): SetGameServerInstanceStateResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Server/SetGameServerInstanceState",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/matchmaking/setgameserverinstancetags
function ServerApi.SetGameServerInstanceTagsAsync(
	secretKey: string, 
	request: SetGameServerInstanceTagsRequest
): SetGameServerInstanceTagsResult | ApiErrorWrapper
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
function ServerApi.SetPlayerSecretAsync(
	secretKey: string, 
	request: SetPlayerSecretRequest
): SetPlayerSecretResult | ApiErrorWrapper
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
function ServerApi.SetPublisherDataAsync(
	secretKey: string, 
	request: SetPublisherDataRequest
): SetPublisherDataResult | ApiErrorWrapper
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
function ServerApi.SetTitleDataAsync(
	secretKey: string, 
	request: SetTitleDataRequest
): SetTitleDataResult | ApiErrorWrapper
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
function ServerApi.SetTitleInternalDataAsync(
	secretKey: string, 
	request: SetTitleDataRequest
): SetTitleDataResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Server/SetTitleInternalData",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/player-item-management/subtractcharactervirtualcurrency
function ServerApi.SubtractCharacterVirtualCurrencyAsync(
	secretKey: string, 
	request: SubtractCharacterVirtualCurrencyRequest
): ModifyCharacterVirtualCurrencyResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Server/SubtractCharacterVirtualCurrency",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/player-item-management/subtractuservirtualcurrency
function ServerApi.SubtractUserVirtualCurrencyAsync(
	secretKey: string, 
	request: SubtractUserVirtualCurrencyRequest
): ModifyUserVirtualCurrencyResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Server/SubtractUserVirtualCurrency",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/account-management/unlinknintendoserviceaccount
function ServerApi.UnlinkNintendoServiceAccountAsync(
	secretKey: string, 
	request: UnlinkNintendoServiceAccountRequest
): EmptyResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Server/UnlinkNintendoServiceAccount",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/account-management/unlinknintendoswitchdeviceid
function ServerApi.UnlinkNintendoSwitchDeviceIdAsync(
	secretKey: string, 
	request: UnlinkNintendoSwitchDeviceIdRequest
): UnlinkNintendoSwitchDeviceIdResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Server/UnlinkNintendoSwitchDeviceId",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/account-management/unlinkpsnaccount
function ServerApi.UnlinkPSNAccountAsync(
	secretKey: string, 
	request: UnlinkPSNAccountRequest
): UnlinkPSNAccountResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Server/UnlinkPSNAccount",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/account-management/unlinkservercustomid
function ServerApi.UnlinkServerCustomIdAsync(
	secretKey: string, 
	request: UnlinkServerCustomIdRequest
): UnlinkServerCustomIdResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Server/UnlinkServerCustomId",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/account-management/unlinkxboxaccount
function ServerApi.UnlinkXboxAccountAsync(
	secretKey: string, 
	request: UnlinkXboxAccountRequest
): UnlinkXboxAccountResult | ApiErrorWrapper
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
function ServerApi.UnlockContainerInstanceAsync(
	secretKey: string, 
	request: UnlockContainerInstanceRequest
): UnlockContainerItemResult | ApiErrorWrapper
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
function ServerApi.UnlockContainerItemAsync(
	secretKey: string, 
	request: UnlockContainerItemRequest
): UnlockContainerItemResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Server/UnlockContainerItem",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/server/account-management/updateavatarurl
function ServerApi.UpdateAvatarUrlAsync(
	secretKey: string, 
	request: UpdateAvatarUrlRequest
): EmptyResponse | ApiErrorWrapper
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
function ServerApi.UpdateBansAsync(
	secretKey: string, 
	request: UpdateBansRequest
): UpdateBansResult | ApiErrorWrapper
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
function ServerApi.UpdateCharacterDataAsync(
	secretKey: string, 
	request: UpdateCharacterDataRequest
): UpdateCharacterDataResult | ApiErrorWrapper
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
function ServerApi.UpdateCharacterInternalDataAsync(
	secretKey: string, 
	request: UpdateCharacterDataRequest
): UpdateCharacterDataResult | ApiErrorWrapper
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
function ServerApi.UpdateCharacterReadOnlyDataAsync(
	secretKey: string, 
	request: UpdateCharacterDataRequest
): UpdateCharacterDataResult | ApiErrorWrapper
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
function ServerApi.UpdateCharacterStatisticsAsync(
	secretKey: string, 
	request: UpdateCharacterStatisticsRequest
): UpdateCharacterStatisticsResult | ApiErrorWrapper
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
function ServerApi.UpdatePlayerStatisticsAsync(
	secretKey: string, 
	request: UpdatePlayerStatisticsRequest
): UpdatePlayerStatisticsResult | ApiErrorWrapper
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
function ServerApi.UpdateSharedGroupDataAsync(
	secretKey: string, 
	request: UpdateSharedGroupDataRequest
): UpdateSharedGroupDataResult | ApiErrorWrapper
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
function ServerApi.UpdateUserDataAsync(
	secretKey: string, 
	request: UpdateUserDataRequest
): UpdateUserDataResult | ApiErrorWrapper
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
function ServerApi.UpdateUserInternalDataAsync(
	secretKey: string, 
	request: UpdateUserInternalDataRequest
): UpdateUserDataResult | ApiErrorWrapper
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
function ServerApi.UpdateUserInventoryItemCustomDataAsync(
	secretKey: string, 
	request: UpdateUserInventoryItemDataRequest
): EmptyResponse | ApiErrorWrapper
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
function ServerApi.UpdateUserPublisherDataAsync(
	secretKey: string, 
	request: UpdateUserDataRequest
): UpdateUserDataResult | ApiErrorWrapper
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
function ServerApi.UpdateUserPublisherInternalDataAsync(
	secretKey: string, 
	request: UpdateUserInternalDataRequest
): UpdateUserDataResult | ApiErrorWrapper
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
function ServerApi.UpdateUserPublisherReadOnlyDataAsync(
	secretKey: string, 
	request: UpdateUserDataRequest
): UpdateUserDataResult | ApiErrorWrapper
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
function ServerApi.UpdateUserReadOnlyDataAsync(
	secretKey: string, 
	request: UpdateUserDataRequest
): UpdateUserDataResult | ApiErrorWrapper
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
function ServerApi.WriteCharacterEventAsync(
	secretKey: string, 
	request: WriteServerCharacterEventRequest
): WriteEventResponse | ApiErrorWrapper
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
function ServerApi.WritePlayerEventAsync(
	secretKey: string, 
	request: WriteServerPlayerEventRequest
): WriteEventResponse | ApiErrorWrapper
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
function ServerApi.WriteTitleEventAsync(
	secretKey: string, 
	request: WriteTitleEventRequest
): WriteEventResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Server/WriteTitleEvent",
		request,
		"X-SecretKey",
		secretKey
	)
end

return ServerApi

