--!strict
--[=[
	# AdminApi

	APIs for managing title configurations, uploaded Game Server code executables, 
	and user data. 
]=]

local PlayFabInternal = require(script.Parent.PlayFabInternal)

local AdminApi = {}

--- If the task instance has already completed, there will be no-op. 
export type AbortTaskInstanceRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	TaskInstanceId: string, --- ID of a task instance that is being aborted.
}

export type ActionsOnPlayersInSegmentTaskParameter = {
	ActionId: string, --- ID of the action to perform on each player in segment.
	SegmentId: string, --- ID of the segment to perform actions on.
}

export type ActionsOnPlayersInSegmentTaskSummary = {
	CompletedAt: string?, --- UTC timestamp when the task completed.
	ErrorMessage: string?, --- Error message for last processing attempt, if an error occured.
	ErrorWasFatal: boolean?, --- Flag indicating if the error was fatal, if false job will be retried.
	EstimatedSecondsRemaining: number?, --- Estimated time remaining in seconds.
	PercentComplete: number?, --- Progress represented as percentage.
	ScheduledByUserId: string?, --- If manually scheduled, ID of user who scheduled the task.
	StartedAt: string, --- UTC timestamp when the task started.
	Status: string?, --- Current status of the task instance.
	TaskIdentifier: NameIdentifier?, --- Identifier of the task this instance belongs to.
	TaskInstanceId: string?, --- ID of the task instance.
	TotalPlayersInSegment: number?, --- Total players in segment when task was started.
	TotalPlayersProcessed: number?, --- Total number of players that have had the actions applied to.
}

export type AdCampaignAttribution = {
	AttributedAt: string, --- UTC time stamp of attribution
	CampaignId: string?, --- Attribution campaign identifier
	Platform: string?, --- Attribution network name
}

export type AdCampaignAttributionModel = {
	AttributedAt: string, --- UTC time stamp of attribution
	CampaignId: string?, --- Attribution campaign identifier
	Platform: string?, --- Attribution network name
}

export type AdCampaignSegmentFilter = {
	CampaignId: string?, --- Campaign id.
	CampaignSource: string?, --- Campaign source.
	Comparison: string?, --- Campaign comparison.
}

export type AddLocalizedNewsRequest = {
	Body: string, --- Localized body text of the news.
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	Language: string, --- Language of the news item.
	NewsId: string, --- Unique id of the updated news item.
	Title: string, --- Localized title (headline) of the news item.
}

export type AddLocalizedNewsResult = {
}

export type AddNewsRequest = {
	Body: string, --- Default body text of the news.
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	Timestamp: string?, --- Time this news was published. If not set, defaults to now.
	Title: string, --- Default title (headline) of the news item.
}

export type AddNewsResult = {
	NewsId: string?, --- Unique id of the new news item
}

--- This API will trigger a player_tag_added event and add a tag with the given 
--- TagName and PlayFabID to the corresponding player profile. TagName can be used 
--- for segmentation and it is limited to 256 characters. Also there is a limit 
--- on the number of tags a title can have. 
export type AddPlayerTagRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	PlayFabId: string, --- Unique PlayFab assigned ID of the user on whom the operation will be performed.
	TagName: string, --- Unique tag for player profile.
}

export type AddPlayerTagResult = {
}

export type AddUserVirtualCurrencyRequest = {
	Amount: number, --- Amount to be added to the user balance of the specified virtual currency. Maximum VC balance is Int32 (2,147,483,647). Any increase over this value will be discarded.
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	PlayFabId: string, --- PlayFab unique identifier of the user whose virtual currency balance is to be increased.
	VirtualCurrency: string, --- Name of the virtual currency which is to be incremented.
}

--- This operation is additive. Any new currencies defined in the array will be 
--- added to the set of those available for the title, while any CurrencyCode identifiers 
--- matching existing ones in the game will be overwritten with the new values. 
export type AddVirtualCurrencyTypesRequest = {
	VirtualCurrencies: {VirtualCurrencyData}, --- List of virtual currencies and their initial deposits (the amount a user is granted when signing in for the first time) to the title
}

export type AllPlayersSegmentFilter = {
}

export type ApiCondition = {
	HasSignatureOrEncryption: string?, --- Require that API calls contain an RSA encrypted payload or signed headers.
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

export type AuthTokenType = 
	"Email"

--- Contains information for a ban. 
export type BanInfo = {
	Active: boolean, --- The active state of this ban. Expired bans may still have this value set to true but they will have no effect.
	BanId: string?, --- The unique Ban Id associated with this ban.
	Created: string?, --- The time when this ban was applied.
	Expires: string?, --- The time when this ban expires. Permanent bans do not have expiration date.
	IPAddress: string?, --- The IP address on which the ban was applied. May affect multiple players.
	PlayFabId: string?, --- Unique PlayFab assigned ID of the user on whom the operation will be performed.
	Reason: string?, --- The reason why this ban was applied.
}

export type BanPlayerSegmentAction = {
	BanHours: number?, --- Ban hours duration.
	ReasonForBan: string?, --- Reason for ban.
}

--- Represents a single ban request. 
export type BanRequest = {
	DurationInHours: number?, --- The duration in hours for the ban. Leave this blank for a permanent ban.
	IPAddress: string?, --- IP address to be banned. May affect multiple players.
	PlayFabId: string, --- Unique PlayFab assigned ID of the user on whom the operation will be performed.
	Reason: string?, --- The reason for this ban. Maximum 140 characters.
}

--- The existence of each user will not be verified. When banning by IP or MAC address, 
--- multiple players may be affected, so use this feature with caution. Returns 
--- information about the new bans. 
export type BanUsersRequest = {
	Bans: {BanRequest}, --- List of ban requests to be applied. Maximum 100.
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
}

export type BanUsersResult = {
	BanData: {BanInfo}?, --- Information on the bans that were applied
}

export type BlankResult = {
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

--- This returns the total number of these items available. 
export type CheckLimitedEditionItemAvailabilityRequest = {
	CatalogVersion: string?, --- Which catalog is being updated. If null, uses the default catalog.
	ItemId: string, --- The item to check for.
}

export type CheckLimitedEditionItemAvailabilityResult = {
	Amount: number, --- The amount of the specified resource remaining.
}

export type ChurnRiskLevel = 
	"NoData"
	| "LowRisk"
	| "MediumRisk"
	| "HighRisk"

export type CloudScriptFile = {
	FileContents: string, --- Contents of the Cloud Script javascript. Must be string-escaped javascript.
	Filename: string, --- Name of the javascript file. These names are not used internally by the server, they are only for developer organizational purposes.
}

export type CloudScriptTaskParameter = {
	Argument: {[any]: any}?, --- Argument to pass to the CloudScript function.
	FunctionName: string?, --- Name of the CloudScript function to execute.
}

export type CloudScriptTaskSummary = {
	CompletedAt: string?, --- UTC timestamp when the task completed.
	EstimatedSecondsRemaining: number?, --- Estimated time remaining in seconds.
	PercentComplete: number?, --- Progress represented as percentage.
	Result: ExecuteCloudScriptResult?, --- Result of CloudScript execution
	ScheduledByUserId: string?, --- If manually scheduled, ID of user who scheduled the task.
	StartedAt: string, --- UTC timestamp when the task started.
	Status: string?, --- Current status of the task instance.
	TaskIdentifier: NameIdentifier?, --- Identifier of the task this instance belongs to.
	TaskInstanceId: string?, --- ID of the task instance.
}

export type CloudScriptVersionStatus = {
	LatestRevision: number, --- Most recent revision for this Cloud Script version
	PublishedRevision: number, --- Published code revision for this Cloud Script version
	Version: number, --- Version number
}

export type Conditionals = 
	"Any"
	| "True"
	| "False"

export type ContactEmailInfo = {
	EmailAddress: string?, --- The email address
	Name: string?, --- The name of the email info data
	VerificationStatus: string?, --- The verification status of the email
}

export type ContactEmailInfoModel = {
	EmailAddress: string?, --- The email address
	Name: string?, --- The name of the email info data
	VerificationStatus: string?, --- The verification status of the email
}

export type ContentInfo = {
	Key: string?, --- Key of the content
	LastModified: string, --- Last modified time
	Size: number, --- Size of the content in bytes
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

--- Task name is unique within a title. Using a task name that's already taken will 
--- cause a name conflict error. Too many create-task requests within a short time 
--- will cause a create conflict error. 
export type CreateActionsOnPlayerSegmentTaskRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	Description: string?, --- Description the task
	IsActive: boolean, --- Whether the schedule is active. Inactive schedule will not trigger task execution.
	Name: string, --- Name of the task. This is a unique identifier for tasks in the title.
	Parameter: ActionsOnPlayersInSegmentTaskParameter, --- Task details related to segment and action
	Schedule: string?, --- Cron expression for the run schedule of the task. The expression should be in UTC.
}

--- Task name is unique within a title. Using a task name that's already taken will 
--- cause a name conflict error. Too many create-task requests within a short time 
--- will cause a create conflict error. 
export type CreateCloudScriptTaskRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	Description: string?, --- Description the task
	IsActive: boolean, --- Whether the schedule is active. Inactive schedule will not trigger task execution.
	Name: string, --- Name of the task. This is a unique identifier for tasks in the title.
	Parameter: CloudScriptTaskParameter, --- Task details related to CloudScript
	Schedule: string?, --- Cron expression for the run schedule of the task. The expression should be in UTC.
}

--- Task name is unique within a title. Using a task name that's already taken will 
--- cause a name conflict error. Too many create-task requests within a short time 
--- will cause a create conflict error. 
export type CreateInsightsScheduledScalingTaskRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	Description: string?, --- Description the task
	IsActive: boolean, --- Whether the schedule is active. Inactive schedule will not trigger task execution.
	Name: string, --- Name of the task. This is a unique identifier for tasks in the title.
	Parameter: InsightsScalingTaskParameter, --- Task details related to Insights Scaling
	Schedule: string?, --- Cron expression for the run schedule of the task. The expression should be in UTC.
}

export type CreateOpenIdConnectionRequest = {
	ClientId: string, --- The client ID given by the ID provider.
	ClientSecret: string, --- The client secret given by the ID provider.
	ConnectionId: string, --- A name for the connection that identifies it within the title.
	IgnoreNonce: boolean?, --- Ignore 'nonce' claim in identity tokens.
	IssuerDiscoveryUrl: string?, --- The discovery document URL to read issuer information from. This must be the absolute URL to the JSON OpenId Configuration document and must be accessible from the internet. If you don't know it, try your issuer URL followed by "/.well-known/openid-configuration". For example, if the issuer is https://example.com, try https://example.com/.well-known/openid-configuration
	IssuerInformation: OpenIdIssuerInformation?, --- Manually specified information for an OpenID Connect issuer.
}

--- Player Shared Secret Keys are used for the call to Client/GetTitlePublicKey, 
--- which exchanges the shared secret for an RSA CSP blob to be used to encrypt 
--- the payload of account creation requests when that API requires a signature 
--- header. 
export type CreatePlayerSharedSecretRequest = {
	FriendlyName: string?, --- Friendly name for this key
}

export type CreatePlayerSharedSecretResult = {
	SecretKey: string?, --- The player shared secret to use when calling Client/GetTitlePublicKey
}

--- Statistics are numeric values, with each statistic in the title also generating 
--- a leaderboard. The ResetInterval enables automatically resetting leaderboards 
--- on a specified interval. Upon reset, the statistic updates to a new version 
--- with no values (effectively removing all players from the leaderboard). The 
--- previous version's statistic values are also archived for retrieval, if needed 
--- (see GetPlayerStatisticVersions). Statistics not created via a call to CreatePlayerStatisticDefinition 
--- by default have a VersionChangeInterval of Never, meaning they do not reset 
--- on a schedule, but they can be set to do so via a call to UpdatePlayerStatisticDefinition. 
--- Once a statistic has been reset (sometimes referred to as versioned or incremented), 
--- the now-previous version can still be written to for up a short, pre-defined 
--- period (currently 10 seconds), to prevent issues with levels completing around 
--- the time of the reset. Also, once reset, the historical statistics for players 
--- in the title may be retrieved using the URL specified in the version information 
--- (GetPlayerStatisticVersions). The AggregationMethod determines what action is 
--- taken when a new statistic value is submitted - always update with the new value 
--- (Last), use the highest of the old and new values (Max), use the smallest (Min), 
--- or add them together (Sum). 
export type CreatePlayerStatisticDefinitionRequest = {
	AggregationMethod: string?, --- the aggregation method to use in updating the statistic (defaults to last)
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	StatisticName: string, --- unique name of the statistic
	VersionChangeInterval: string?, --- interval at which the values of the statistic for all players are reset (resets begin at the next interval boundary)
}

export type CreatePlayerStatisticDefinitionResult = {
	Statistic: PlayerStatisticDefinition?, --- created statistic definition
}

--- Send all the segment details part of CreateSegmentRequest 
export type CreateSegmentRequest = {
	SegmentModel: SegmentModel, --- Segment model with all of the segment properties data.
}

export type CreateSegmentResponse = {
	ErrorMessage: string?, --- Error message.
	SegmentId: string?, --- Segment id.
}

export type CreateTaskResult = {
	TaskId: string?, --- ID of the task
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

export type DeleteContentRequest = {
	Key: string, --- Key of the content item to be deleted
}

--- Deletes all data associated with the master player account, including data from 
--- all titles the player has played, such as statistics, custom data, inventory, 
--- purchases, virtual currency balances, characters, group memberships, publisher 
--- data, credential data, account linkages, friends list and PlayStream event history. 
--- Removes the player from all leaderboards and player search indexes. Note, this 
--- API queues the player for deletion and returns a receipt immediately. Record 
--- the receipt ID for future reference. It may take some time before all player 
--- data is fully deleted. Upon completion of the deletion, an email will be sent 
--- to the notification email address configured for the title confirming the deletion. 
--- Until the player data is fully deleted, attempts to recreate the player with 
--- the same user account in the same title will fail with the 'AccountDeleted' 
--- error. It is highly recommended to know the impact of the deletion by calling 
--- GetPlayedTitleList, before calling this API. 
export type DeleteMasterPlayerAccountRequest = {
	MetaData: string?, --- Developer created string to identify a user without PlayFab ID
	PlayFabId: string, --- Unique PlayFab assigned ID of the user on whom the operation will be performed.
}

export type DeleteMasterPlayerAccountResult = {
	JobReceiptId: string?, --- A notification email with this job receipt Id will be sent to the title notification email address when deletion is complete.
	TitleIds: {any}?, --- List of titles from which the player's data will be deleted.
}

--- This API lets developers delete a membership subscription. 
export type DeleteMembershipSubscriptionRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	MembershipId: string, --- Id of the membership to apply the override expiration date to.
	PlayFabId: string, --- Unique PlayFab assigned ID of the user on whom the operation will be performed.
	SubscriptionId: string, --- Id of the subscription that should be deleted from the membership.
}

export type DeleteMembershipSubscriptionResult = {
}

export type DeleteOpenIdConnectionRequest = {
	ConnectionId: string, --- unique name of the connection
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
--- error. 
export type DeletePlayerRequest = {
	PlayFabId: string, --- Unique PlayFab assigned ID of the user on whom the operation will be performed.
}

export type DeletePlayerResult = {
}

export type DeletePlayerSegmentAction = {
}

--- Player Shared Secret Keys are used for the call to Client/GetTitlePublicKey, 
--- which exchanges the shared secret for an RSA CSP blob to be used to encrypt 
--- the payload of account creation requests when that API requires a signature 
--- header. 
export type DeletePlayerSharedSecretRequest = {
	SecretKey: string?, --- The shared secret key to delete
}

export type DeletePlayerSharedSecretResult = {
}

export type DeletePlayerStatisticSegmentAction = {
	StatisticName: string?, --- Statistic name.
}

--- Send segment id planning to delete part of DeleteSegmentRequest object 
export type DeleteSegmentRequest = {
	SegmentId: string, --- Segment id.
}

export type DeleteSegmentsResponse = {
	ErrorMessage: string?, --- Error message.
}

--- This non-reversible operation will permanently delete the requested store. 
export type DeleteStoreRequest = {
	CatalogVersion: string?, --- catalog version of the store to delete. If null, uses the default catalog.
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	StoreId: string, --- unqiue identifier for the store which is to be deleted
}

export type DeleteStoreResult = {
}

--- After a task is deleted, for tracking purposes, the task instances belonging 
--- to this task will still remain. They will become orphaned and does not belongs 
--- to any task. Executions of any in-progress task instances will continue. If 
--- the task specified does not exist, the deletion is considered a success. 
export type DeleteTaskRequest = {
	Identifier: NameIdentifier?, --- Specify either the task ID or the name of task to be deleted.
}

--- Will delete all the title data associated with the given override label. 
export type DeleteTitleDataOverrideRequest = {
	OverrideLabel: string, --- Name of the override.
}

export type DeleteTitleDataOverrideResult = {
}

--- Deletes all data associated with the title, including catalog, virtual currencies, 
--- leaderboard statistics, Cloud Script revisions, segment definitions, event rules, 
--- tasks, add-ons, secret keys, data encryption keys, and permission policies. 
--- Removes the title from its studio and removes all associated developer roles 
--- and permissions. Does not delete PlayStream event history associated with the 
--- title. Note, this API queues the title for deletion and returns immediately. 
--- It may take several hours or more before all title data is fully deleted. All 
--- player accounts in the title must be deleted before deleting the title. If any 
--- player accounts exist, the API will return a 'TitleContainsUserAccounts' error. 
--- Until the title data is fully deleted, attempts to call APIs with the title 
--- will fail with the 'TitleDeleted' error. 
export type DeleteTitleRequest = {
}

export type DeleteTitleResult = {
}

export type EffectType = 
	"Allow"
	| "Deny"

export type EmailNotificationSegmentAction = {
	EmailTemplateId: string?, --- Email template id.
	EmailTemplateName: string?, --- Email template name.
}

export type EmailVerificationStatus = 
	"Unverified"
	| "Pending"
	| "Confirmed"

export type EmptyResponse = {
}

--- Combined entity type and ID structure which uniquely identifies a single entity. 
export type EntityKey = {
	Id: string, --- Unique ID of the entity.
	Type: string?, --- Entity type. See https://docs.microsoft.com/gaming/playfab/features/data/entities/available-built-in-entity-types
}

export type ExecuteAzureFunctionSegmentAction = {
	AzureFunction: string?, --- Azure function.
	FunctionParameter: {[any]: any}?, --- Azure function parameter.
	GenerateFunctionExecutedEvents: boolean, --- Generate play stream event.
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

export type ExecuteCloudScriptSegmentAction = {
	CloudScriptFunction: string?, --- Cloud script function.
	CloudScriptPublishResultsToPlayStream: boolean, --- Generate play stream event.
	FunctionParameter: {[any]: any}?, --- Cloud script function parameter.
	FunctionParameterJson: string?, --- Cloud script function parameter json text.
}

--- Exports all data associated with the master player account, including data from 
--- all titles the player has played, such as statistics, custom data, inventory, 
--- purchases, virtual currency balances, characters, group memberships, publisher 
--- data, credential data, account linkages, friends list and PlayStream event history. 
--- Note, this API queues the player for export and returns a receipt immediately. 
--- Record the receipt ID for future reference. It may take some time before the 
--- export is available for download. Upon completion of the export, an email containing 
--- the URL to download the export dump will be sent to the notification email address 
--- configured for the title. 
export type ExportMasterPlayerDataRequest = {
	PlayFabId: string, --- Unique PlayFab assigned ID of the user on whom the operation will be performed.
}

export type ExportMasterPlayerDataResult = {
	JobReceiptId: string?, --- An email with this job receipt Id containing the export download link will be sent to the title notification email address when the export is complete.
}

--- Request must contain the Segment ID 
export type ExportPlayersInSegmentRequest = {
	SegmentId: string, --- Unique identifier of the requested segment.
}

export type ExportPlayersInSegmentResult = {
	ExportId: string?, --- Unique identifier of the export for the requested Segment.
	SegmentId: string?, --- Unique identifier of the requested Segment.
}

export type FirstLoginDateSegmentFilter = {
	Comparison: string?, --- First player login date comparison.
	LogInDate: string, --- First player login date.
}

export type FirstLoginTimespanSegmentFilter = {
	Comparison: string?, --- First player login duration comparison.
	DurationInMinutes: number, --- First player login duration.
}

export type GameBuildStatus = 
	"Available"
	| "Validating"
	| "InvalidBuildPackage"
	| "Processing"
	| "FailedToProcess"

export type GameModeInfo = {
	Gamemode: string, --- specific game mode type
	MaxPlayerCount: number, --- maximum user count a specific Game Server Instance can support
	MinPlayerCount: number, --- minimum user count required for this Game Server Instance to continue (usually 1)
	StartOpen: boolean?, --- whether to start as an open session, meaning that players can matchmake into it (defaults to true)
}

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

export type GetActionsOnPlayersInSegmentTaskInstanceResult = {
	Parameter: ActionsOnPlayersInSegmentTaskParameter?, --- Parameter of this task instance
	Summary: ActionsOnPlayersInSegmentTaskSummary?, --- Status summary of the actions-on-players-in-segment task instance
}

--- Request has no paramaters. 
export type GetAllSegmentsRequest = {
}

export type GetAllSegmentsResult = {
	Segments: {GetSegmentResult}?, --- Array of segments for this title.
}

export type GetCatalogItemsRequest = {
	CatalogVersion: string?, --- Which catalog is being requested. If null, uses the default catalog.
}

export type GetCatalogItemsResult = {
	Catalog: {CatalogItem}?, --- Array of items which can be purchased.
}

export type GetCloudScriptRevisionRequest = {
	Revision: number?, --- Revision number. If left null, defaults to the latest revision
	Version: number?, --- Version number. If left null, defaults to the latest version
}

export type GetCloudScriptRevisionResult = {
	CreatedAt: string, --- Time this revision was created
	Files: {CloudScriptFile}?, --- List of Cloud Script files in this revision.
	IsPublished: boolean, --- True if this is the currently published revision
	Revision: number, --- Revision number.
	Version: number, --- Version number.
}

export type GetCloudScriptTaskInstanceResult = {
	Parameter: CloudScriptTaskParameter?, --- Parameter of this task instance
	Summary: CloudScriptTaskSummary?, --- Status summary of the CloudScript task instance
}

export type GetCloudScriptVersionsRequest = {
}

export type GetCloudScriptVersionsResult = {
	Versions: {CloudScriptVersionStatus}?, --- List of versions
}

export type GetContentListRequest = {
	Prefix: string?, --- Limits the response to keys that begin with the specified prefix. You can use prefixes to list contents under a folder, or for a specified version, etc.
}

export type GetContentListResult = {
	Contents: {ContentInfo}?, --- List of content items.
	ItemCount: number, --- Number of content items returned. We currently have a maximum of 1000 items limit.
	TotalSize: number, --- The total size of listed contents in bytes.
}

export type GetContentUploadUrlRequest = {
	ContentType: string?, --- A standard MIME type describing the format of the contents. The same MIME type has to be set in the header when uploading the content. If not specified, the MIME type is 'binary/octet-stream' by default.
	Key: string, --- Key of the content item to upload, usually formatted as a path, e.g. images/a.png
}

export type GetContentUploadUrlResult = {
	URL: string?, --- URL for uploading content via HTTP PUT method. The URL requires the 'x-ms-blob-type' header to have the value 'BlockBlob'. The URL will expire in approximately one hour.
}

--- Gets the download URL for the requested report data (in CSV form). The reports 
--- available through this API call are those available in the Game Manager, in 
--- the Analytics->Reports tab. 
export type GetDataReportRequest = {
	Day: number, --- Reporting year (UTC)
	Month: number, --- Reporting month (UTC)
	ReportName: string, --- Report name
	Year: number, --- Reporting year (UTC)
}

export type GetDataReportResult = {
	DownloadUrl: string?, --- The URL where the requested report can be downloaded. This can be any PlayFab generated reports. The full list of reports can be found at: https://docs.microsoft.com/en-us/gaming/playfab/features/analytics/reports/quickstart.
}

export type GetMatchmakerGameInfoRequest = {
	LobbyId: string, --- unique identifier of the lobby for which info is being requested
}

export type GetMatchmakerGameInfoResult = {
	BuildVersion: string?, --- version identifier of the game server executable binary being run
	EndTime: string?, --- time when Game Server Instance is currently scheduled to end
	LobbyId: string?, --- unique identifier of the lobby 
	Mode: string?, --- game mode for this Game Server Instance
	Players: {any}?, --- array of unique PlayFab identifiers for users currently connected to this Game Server Instance
	Region: string?, --- region in which the Game Server Instance is running
	ServerIPV4Address: string?, --- IPV4 address of the server
	ServerIPV6Address: string?, --- IPV6 address of the server
	ServerPort: number, --- communication port for this Game Server Instance
	ServerPublicDNSName: string?, --- Public DNS name (if any) of the server
	StartTime: string, --- time when the Game Server Instance was created
	TitleId: string?, --- unique identifier of the Game Server Instance for this lobby
}

--- These details are used by the PlayFab matchmaking service to determine if an 
--- existing Game Server Instance has room for additional users, and by the PlayFab 
--- game server management service to determine when a new Game Server Host should 
--- be created in order to prevent excess load on existing Hosts. 
export type GetMatchmakerGameModesRequest = {
	BuildVersion: string, --- previously uploaded build version for which game modes are being requested
}

export type GetMatchmakerGameModesResult = {
	GameModes: {GameModeInfo}?, --- array of game modes available for the specified build
}

--- Useful for identifying titles of which the player's data will be deleted by 
--- DeleteMasterPlayer. 
export type GetPlayedTitleListRequest = {
	PlayFabId: string, --- Unique PlayFab assigned ID of the user on whom the operation will be performed.
}

export type GetPlayedTitleListResult = {
	TitleIds: {any}?, --- List of titles the player has played
}

--- Gets a player ID from an auth token. The token expires after 30 minutes and 
--- cannot be used to look up a player when expired. 
export type GetPlayerIdFromAuthTokenRequest = {
	Token: string, --- The auth token of the player requesting the password reset.
	TokenType: string, --- The type of auth token of the player requesting the password reset.
}

export type GetPlayerIdFromAuthTokenResult = {
	PlayFabId: string?, --- The player ID from the token passed in
}

--- This API allows for access to details regarding a user in the PlayFab service, 
--- usually for purposes of customer support. Note that data returned may be Personally 
--- Identifying Information (PII), such as email address, and so care should be 
--- taken in how this data is stored and managed. Since this call will always return 
--- the relevant information for users who have accessed the title, the recommendation 
--- is to not store this data locally. 
export type GetPlayerProfileRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	PlayFabId: string, --- Unique PlayFab assigned ID of the user on whom the operation will be performed.
	ProfileConstraints: PlayerProfileViewConstraints?, --- If non-null, this determines which properties of the resulting player profiles to return. For API calls from the client, only the allowed client profile properties for the title may be requested. These allowed properties are configured in the Game Manager "Client Profile Options" tab in the "Settings" section.
}

export type GetPlayerProfileResult = {
	PlayerProfile: PlayerProfileModel?, --- The profile of the player. This profile is not guaranteed to be up-to-date. For a new player, this profile will not exist.
}

export type GetPlayerSegmentsResult = {
	Segments: {GetSegmentResult}?, --- Array of segments the requested player currently belongs to.
}

--- Player Shared Secret Keys are used for the call to Client/GetTitlePublicKey, 
--- which exchanges the shared secret for an RSA CSP blob to be used to encrypt 
--- the payload of account creation requests when that API requires a signature 
--- header. 
export type GetPlayerSharedSecretsRequest = {
}

export type GetPlayerSharedSecretsResult = {
	SharedSecrets: {SharedSecret}?, --- The player shared secret to use when calling Client/GetTitlePublicKey
}

export type GetPlayerStatisticDefinitionsRequest = {
}

--- Statistics are numeric values, with each statistic in the title also generating 
--- a leaderboard. The ResetInterval defines the period of time at which the leaderboard 
--- for the statistic will automatically reset. Upon reset, the statistic updates 
--- to a new version with no values (effectively removing all players from the leaderboard). 
--- The previous version's statistic values are also archived for retrieval, if 
--- needed (see GetPlayerStatisticVersions). Statistics not created via a call to 
--- CreatePlayerStatisticDefinition by default have a VersionChangeInterval of Never, 
--- meaning they do not reset on a schedule, but they can be set to do so via a 
--- call to UpdatePlayerStatisticDefinition. Once a statistic has been reset (sometimes 
--- referred to as versioned or incremented), the previous version can still be 
--- written to for up a short, pre-defined period (currently 10 seconds), to prevent 
--- issues with levels completing around the time of the reset. Also, once reset, 
--- the historical statistics for players in the title may be retrieved using the 
--- URL specified in the version information (GetPlayerStatisticVersions). The AggregationMethod 
--- defines what action is taken when a new statistic value is submitted - always 
--- update with the new value (Last), use the highest of the old and new values 
--- (Max), use the smallest (Min), or add them together (Sum). 
export type GetPlayerStatisticDefinitionsResult = {
	Statistics: {PlayerStatisticDefinition}?, --- the player statistic definitions for the title
}

export type GetPlayerStatisticVersionsRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	StatisticName: string?, --- unique name of the statistic
}

--- Statistics are numeric values, with each statistic in the title also generating 
--- a leaderboard. The information returned in the results defines the state of 
--- a specific version of a statistic, including when it was or will become the 
--- currently active version, when it will (or did) become a previous version, and 
--- its archival state if it is no longer the active version. For a statistic which 
--- has been reset, once the archival status is Complete, the full set of statistics 
--- for all players in the leaderboard for that version may be retrieved via the 
--- ArchiveDownloadUrl. Statistics which have not been reset (incremented/versioned) 
--- will only have a single version which is not scheduled to reset. 
export type GetPlayerStatisticVersionsResult = {
	StatisticVersions: {PlayerStatisticVersion}?, --- version change history of the statistic
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

--- Request must contain the ExportId 
export type GetPlayersInSegmentExportRequest = {
	ExportId: string, --- Unique identifier of the export for the requested Segment.
}

export type GetPlayersInSegmentExportResponse = {
	IndexUrl: string?, --- Url from which the index file can be downloaded.
	State: string?, --- Shows the current status of the export
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
	ContinuationToken: string?, --- Continuation token if retrieving subsequent pages of results.
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	MaxBatchSize: number?, --- Maximum number of profiles to load. Default is 1,000. Maximum is 10,000.
	SecondsToLive: number?, --- Number of seconds to keep the continuation token active. After token expiration it is not possible to continue paging results. Default is 300 (5 minutes). Maximum is 1,800 (30 minutes).
	SegmentId: string, --- Unique identifier for this segment.
}

export type GetPlayersInSegmentResult = {
	ContinuationToken: string?, --- Continuation token to use to retrieve subsequent pages of results. If token returns null there are no more results.
	PlayerProfiles: {PlayerProfile}?, --- Array of player profiles in this segment.
	ProfilesInSegment: number, --- Count of profiles matching this segment.
}

export type GetPlayersSegmentsRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	PlayFabId: string, --- Unique PlayFab assigned ID of the user on whom the operation will be performed.
}

--- Views the requested policy. Today, the only supported policy is 'ApiPolicy'. 
export type GetPolicyRequest = {
	PolicyName: string?, --- The name of the policy to read. Only supported name is 'ApiPolicy'.
}

export type GetPolicyResponse = {
	PolicyName: string?, --- The name of the policy read.
	PolicyVersion: number, --- Policy version.
	Statements: {PermissionStatement}?, --- The statements in the requested policy.
}

--- This API is designed to return publisher-specific values which can be read, 
--- but not written to, by the client. This data is shared across all titles assigned 
--- to a particular publisher, and can be used for cross-game coordination. Only 
--- titles assigned to a publisher can use this API. For more information email 
--- helloplayfab@microsoft.com. This AdminAPI call for getting title data guarantees 
--- no delay in between update and retrieval of newly set data. 
export type GetPublisherDataRequest = {
	Keys: {any}, ---  array of keys to get back data from the Publisher data blob, set by the admin tools
}

export type GetPublisherDataResult = {
	Data: {[any]: any}?, --- a dictionary object of key / value pairs
}

export type GetRandomResultTablesRequest = {
	CatalogVersion: string?, --- catalog version to fetch tables from. Use default catalog version if null
}

export type GetRandomResultTablesResult = {
	Tables: RandomResultTableListing?, --- array of random result tables currently available
}

export type GetSegmentResult = {
	ABTestParent: string?, --- Identifier of the segments AB Test, if it is attached to one.
	Id: string, --- Unique identifier for this segment.
	Name: string?, --- Segment name.
}

--- Given input segment ids, return list of segments. 
export type GetSegmentsRequest = {
	SegmentIds: {any}, --- Segment ids to filter title segments.
}

export type GetSegmentsResponse = {
	ErrorMessage: string?, --- Error message.
	Segments: {SegmentModel}?, --- List of title segments.
}

--- A store contains an array of references to items defined in the catalog, along 
--- with the prices for the item, in both real world and virtual currencies. These 
--- prices act as an override to any prices defined in the catalog. In this way, 
--- the base definitions of the items may be defined in the catalog, with all associated 
--- properties, while the pricing can be set for each store, as needed. This allows 
--- for subsets of goods to be defined for different purposes (in order to simplify 
--- showing some, but not all catalog items to users, based upon different characteristics), 
--- along with unique prices. Note that all prices defined in the catalog and store 
--- definitions for the item are considered valid, and that a compromised client 
--- can be made to send a request for an item based upon any of these definitions. 
--- If no price is specified in the store for an item, the price set in the catalog 
--- should be displayed to the user. 
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

--- The result includes detail information that's specific to a CloudScript task. 
--- Only CloudScript tasks configured as "Run Cloud Script function once" will be 
--- retrieved. To get a list of task instances by task, status, or time range, use 
--- GetTaskInstances. 
export type GetTaskInstanceRequest = {
	TaskInstanceId: string, --- ID of the requested task instance.
}

--- Only the most recent 100 task instances are returned, ordered by start time 
--- descending. The results are generic basic information for task instances. To 
--- get detail information specific to each task type, use Get*TaskInstance based 
--- on its corresponding task type. 
export type GetTaskInstancesRequest = {
	StartedAtRangeFrom: string?, --- Optional range-from filter for task instances' StartedAt timestamp.
	StartedAtRangeTo: string?, --- Optional range-to filter for task instances' StartedAt timestamp.
	StatusFilter: string?, --- Optional filter for task instances that are of a specific status.
	TaskIdentifier: NameIdentifier?, --- Name or ID of the task whose instances are being queried. If not specified, return all task instances that satisfy conditions set by other filters.
}

export type GetTaskInstancesResult = {
	Summaries: {TaskInstanceBasicSummary}?, --- Basic status summaries of the queried task instances. Empty If no task instances meets the filter criteria. To get detailed status summary, use Get*TaskInstance API according to task type (e.g. GetActionsOnPlayersInSegmentTaskInstance).
}

export type GetTasksRequest = {
	Identifier: NameIdentifier?, --- Provide either the task ID or the task name to get a specific task. If not specified, return all defined tasks.
}

export type GetTasksResult = {
	Tasks: {ScheduledTask}?, --- Result tasks. Empty if there is no task found.
}

--- This API method is designed to return title specific values which can be read 
--- by the client. For example, a developer could choose to store values which modify 
--- the user experience, such as enemy spawn rates, weapon strengths, movement speeds, 
--- etc. This allows a developer to update the title without the need to create, 
--- test, and ship a new build. If an override label is specified in the request, 
--- the overrides are applied automatically and returned with the title data. Note 
--- that due to caching, there may up to a minute delay in between updating title 
--- data and a query returning the newest value. 
export type GetTitleDataRequest = {
	Keys: {any}?, --- Specific keys to search for in the title data (leave null to get all keys)
	OverrideLabel: string?, --- Optional field that specifies the name of an override. This value is ignored when used by the game client; otherwise, the overrides are applied automatically to the title data.
}

export type GetTitleDataResult = {
	Data: {[any]: any}?, --- a dictionary object of key / value pairs
}

--- Get all bans for a user, including inactive and expired bans.  
export type GetUserBansRequest = {
	PlayFabId: string, --- Unique PlayFab assigned ID of the user on whom the operation will be performed.
}

export type GetUserBansResult = {
	BanData: {BanInfo}?, --- Information about the bans
}

--- Data is stored as JSON key-value pairs. If the Keys parameter is provided, the 
--- data object returned will only contain the data specific to the indicated Keys. 
--- Otherwise, the full set of custom user data will be returned. 
export type GetUserDataRequest = {
	IfChangedFromDataVersion: number?, --- The version that currently exists according to the caller. The call will return the data for all of the keys if the version in the system is greater than this.
	Keys: {any}?, --- Specific keys to search for in the custom user data.
	PlayFabId: string, --- Unique PlayFab assigned ID of the user on whom the operation will be performed.
}

export type GetUserDataResult = {
	Data: UserDataRecord?, --- User specific data for this title.
	DataVersion: number, --- Indicates the current version of the data that has been set. This is incremented with every set call for that type of data (read-only, internal, etc). This version can be provided in Get calls to find updated data.
	PlayFabId: string?, --- PlayFab unique identifier of the user whose custom data is being returned.
}

--- All items currently in the user inventory will be returned, irrespective of 
--- how they were acquired (via purchasing, grants, coupons, etc.). Items that are 
--- expired, fully consumed, or are no longer valid are not considered to be in 
--- the user's current inventory, and so will not be not included. There can be 
--- a delay of up to a half a second for inventory changes to be reflected in the 
--- GetUserInventory API response. 
export type GetUserInventoryRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	PlayFabId: string, --- Unique PlayFab assigned ID of the user on whom the operation will be performed.
}

export type GetUserInventoryResult = {
	Inventory: {ItemInstance}?, --- Array of inventory items belonging to the user.
	PlayFabId: string?, --- Unique PlayFab assigned ID of the user on whom the operation will be performed.
	VirtualCurrency: {[any]: any}?, --- Array of virtual currency balance(s) belonging to the user.
	VirtualCurrencyRechargeTimes: VirtualCurrencyRechargeTime?, --- Array of remaining times and timestamps for virtual currencies.
}

export type GrantItemSegmentAction = {
	CatelogId: string?, --- Item catalog id.
	ItemId: string?, --- Item id.
	Quantity: number, --- Item quantity.
}

--- This function directly adds inventory items to user inventories. As a result 
--- of this operations, the user will not be charged any transaction fee, regardless 
--- of the inventory item catalog definition. Please note that the processing time 
--- for inventory grants and purchases increases fractionally the more items are 
--- in the inventory, and the more items are in the grant/purchase operation. 
export type GrantItemsToUsersRequest = {
	CatalogVersion: string?, --- Catalog version from which items are to be granted.
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	ItemGrants: {ItemGrant}, --- Array of items to grant and the users to whom the items are to be granted.
}

--- Please note that the order of the items in the response may not match the order 
--- of items in the request. 
export type GrantItemsToUsersResult = {
	ItemGrantResults: {GrantedItemInstance}?, --- Array of items granted to users.
}

export type GrantVirtualCurrencySegmentAction = {
	Amount: number, --- Virtual currency amount.
	CurrencyCode: string?, --- Virtual currency code.
}

--- Result of granting an item to a user. Note, to retrieve additional information 
--- for an item such as Tags, Description that are the same across all instances 
--- of the item, a call to GetCatalogItems is required. The ItemID of can be matched 
--- to a catalog entry, which contains the additional information. Also note that 
--- Custom Data is only set when the User's specific instance has updated the CustomData 
--- via a call to UpdateUserInventoryItemCustomData. Other fields such as UnitPrice 
--- and UnitCurrency are only set when the item was granted via a purchase. 
export type GrantedItemInstance = {
	Annotation: string?, --- Game specific comment associated with this instance when it was added to the user inventory.
	BundleContents: {any}?, --- Array of unique items that were awarded when this catalog item was purchased.
	BundleParent: string?, --- Unique identifier for the parent inventory item, as defined in the catalog, for object which were added from a bundle or container.
	CatalogVersion: string?, --- Catalog version for the inventory item, when this instance was created.
	CharacterId: string?, --- Unique PlayFab assigned ID for a specific character owned by a user
	CustomData: {[any]: any}?, --- A set of custom key-value pairs on the instance of the inventory item, which is not to be confused with the catalog item's custom data.
	DisplayName: string?, --- CatalogItem.DisplayName at the time this item was purchased.
	Expiration: string?, --- Timestamp for when this instance will expire.
	ItemClass: string?, --- Class name for the inventory item, as defined in the catalog.
	ItemId: string?, --- Unique identifier for the inventory item, as defined in the catalog.
	ItemInstanceId: string?, --- Unique item identifier for this specific instance of the item.
	PlayFabId: string?, --- Unique PlayFab assigned ID of the user on whom the operation will be performed.
	PurchaseDate: string?, --- Timestamp for when this instance was purchased.
	RemainingUses: number?, --- Total number of remaining uses, if this is a consumable item.
	Result: boolean, --- Result of this operation.
	UnitCurrency: string?, --- Currency type for the cost of the catalog item. Not available when granting items.
	UnitPrice: number, --- Cost of the catalog item in the given currency. Not available when granting items.
	UsesIncrementedBy: number?, --- The number of uses that were added or removed to this item in this call.
}

--- This operation will increment the global counter for the number of these items 
--- available. This number cannot be decremented, except by actual grants. 
export type IncrementLimitedEditionItemAvailabilityRequest = {
	Amount: number, --- Amount to increase availability by.
	CatalogVersion: string?, --- Which catalog is being updated. If null, uses the default catalog.
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	ItemId: string, --- The item which needs more availability.
}

export type IncrementLimitedEditionItemAvailabilityResult = {
}

export type IncrementPlayerStatisticSegmentAction = {
	IncrementValue: number, --- Increment value.
	StatisticName: string?, --- Statistic name.
}

--- Statistics are numeric values, with each statistic in the title also generating 
--- a leaderboard. When this call is made on a given statistic, this forces a reset 
--- of that statistic. Upon reset, the statistic updates to a new version with no 
--- values (effectively removing all players from the leaderboard). The previous 
--- version's statistic values are also archived for retrieval, if needed (see GetPlayerStatisticVersions). 
--- Statistics not created via a call to CreatePlayerStatisticDefinition by default 
--- have a VersionChangeInterval of Never, meaning they do not reset on a schedule, 
--- but they can be set to do so via a call to UpdatePlayerStatisticDefinition. 
--- Once a statistic has been reset (sometimes referred to as versioned or incremented), 
--- the now-previous version can still be written to for up a short, pre-defined 
--- period (currently 10 seconds), to prevent issues with levels completing around 
--- the time of the reset. Also, once reset, the historical statistics for players 
--- in the title may be retrieved using the URL specified in the version information 
--- (GetPlayerStatisticVersions). 
export type IncrementPlayerStatisticVersionRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	StatisticName: string?, --- unique name of the statistic
}

export type IncrementPlayerStatisticVersionResult = {
	StatisticVersion: PlayerStatisticVersion?, --- version change history of the statistic
}

export type InsightsScalingTaskParameter = {
	Level: number, --- Insights Performance Level to scale to.
}

export type ItemGrant = {
	Annotation: string?, --- String detailing any additional information concerning this operation.
	CharacterId: string?, --- Unique PlayFab assigned ID for a specific character owned by a user
	Data: {[any]: any}?, --- Key-value pairs to be written to the custom data. Note that keys are trimmed of whitespace, are limited in size, and may not begin with a '!' character or be null.
	ItemId: string, --- Unique identifier of the catalog item to be granted to the user.
	KeysToRemove: {any}?, --- Optional list of Data-keys to remove from UserData. Some SDKs cannot insert null-values into Data due to language constraints. Use this to delete the keys directly.
	PlayFabId: string, --- Unique PlayFab assigned ID of the user on whom the operation will be performed.
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

export type LastLoginDateSegmentFilter = {
	Comparison: string?, --- Last player login date comparison.
	LogInDate: string, --- Last player login date.
}

export type LastLoginTimespanSegmentFilter = {
	Comparison: string?, --- Last player login duration comparison.
	DurationInMinutes: number, --- Last player login duration.
}

export type LinkedPlatformAccountModel = {
	Email: string?, --- Linked account email of the user on the platform, if available
	Platform: string?, --- Authentication platform
	PlatformUserId: string?, --- Unique account identifier of the user on the platform
	Username: string?, --- Linked account username of the user on the platform, if available
}

export type LinkedUserAccountHasEmailSegmentFilter = {
	Comparison: string?, --- Login provider comparison.
	LoginProvider: string?, --- Login provider.
}

export type LinkedUserAccountSegmentFilter = {
	LoginProvider: string?, --- Login provider.
}

export type ListOpenIdConnectionRequest = {
}

export type ListOpenIdConnectionResponse = {
	Connections: {OpenIdConnection}?, --- The list of Open ID Connections
}

export type ListVirtualCurrencyTypesRequest = {
}

export type ListVirtualCurrencyTypesResult = {
	VirtualCurrencies: {VirtualCurrencyData}?, --- List of virtual currency names defined for this title
}

export type LocationModel = {
	City: string?, --- City name.
	ContinentCode: string?, --- The two-character continent code for this location
	CountryCode: string?, --- The two-character ISO 3166-1 country code for the country associated with the location
	Latitude: number?, --- Latitude coordinate of the geographic location.
	Longitude: number?, --- Longitude coordinate of the geographic location.
}

export type LocationSegmentFilter = {
	CountryCode: string?, --- Segment country code.
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

--- This API allows for access to details regarding a user in the PlayFab service, 
--- usually for purposes of customer support. Note that data returned may be Personally 
--- Identifying Information (PII), such as email address, and so care should be 
--- taken in how this data is stored and managed. Since this call will always return 
--- the relevant information for users who have accessed the title, the recommendation 
--- is to not store this data locally. 
export type LookupUserAccountInfoRequest = {
	Email: string?, --- User email address attached to their account
	PlayFabId: string?, --- Unique PlayFab assigned ID of the user on whom the operation will be performed.
	TitleDisplayName: string?, --- Title specific username to match against existing user accounts
	Username: string?, --- PlayFab username for the account (3-20 characters)
}

export type LookupUserAccountInfoResult = {
	UserInfo: UserAccountInfo?, --- User info for the user matching the request
}

export type MembershipModel = {
	IsActive: boolean, --- Whether this membership is active. That is, whether the MembershipExpiration time has been reached.
	MembershipExpiration: string, --- The time this membership expires
	MembershipId: string?, --- The id of the membership
	OverrideExpiration: string?, --- Membership expirations can be explicitly overridden (via game manager or the admin api). If this membership has been overridden, this will be the new expiration time.
	OverrideIsSet: boolean?, --- Whether the override expiration is set.
	Subscriptions: {SubscriptionModel}?, --- The list of subscriptions that this player has for this membership
}

export type ModifyServerBuildRequest = {
	ActiveRegions: {Region}?, --- array of regions where this build can used, when it is active
	BuildId: string, --- unique identifier of the previously uploaded build executable to be updated
	CommandLineTemplate: string?, --- appended to the end of the command line when starting game servers
	Comment: string?, --- developer comment(s) for this build
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	ExecutablePath: string?, --- path to the game server executable. Defaults to gameserver.exe
	MaxGamesPerHost: number, --- maximum number of game server instances that can run on a single host machine
	MinFreeGameSlots: number, --- minimum capacity of additional game server instances that can be started before the autoscaling service starts new host machines (given the number of current running host machines and game server instances)
	Timestamp: string?, --- new timestamp
}

export type ModifyServerBuildResult = {
	ActiveRegions: {Region}?, --- array of regions where this build can used, when it is active
	BuildId: string?, --- unique identifier for this build executable
	CommandLineTemplate: string?, --- appended to the end of the command line when starting game servers
	Comment: string?, --- developer comment(s) for this build
	ExecutablePath: string?, --- path to the game server executable. Defaults to gameserver.exe
	MaxGamesPerHost: number, --- maximum number of game server instances that can run on a single host machine
	MinFreeGameSlots: number, --- minimum capacity of additional game server instances that can be started before the autoscaling service starts new host machines (given the number of current running host machines and game server instances)
	Status: string?, --- the current status of the build validation and processing steps
	Timestamp: string, --- time this build was last modified (or uploaded, if this build has never been modified)
	TitleId: string?, --- Unique identifier for the title, found in the Settings > Game Properties section of the PlayFab developer site when a title has been selected.
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

export type OpenIdConnection = {
	ClientId: string?, --- The client ID given by the ID provider.
	ClientSecret: string?, --- The client secret given by the ID provider.
	ConnectionId: string?, --- A name for the connection to identify it within the title.
	DiscoverConfiguration: boolean, --- Shows if data about the connection will be loaded from the issuer's discovery document
	IssuerInformation: OpenIdIssuerInformation?, --- Information for an OpenID Connect provider.
}

export type OpenIdIssuerInformation = {
	AuthorizationUrl: string, --- Authorization endpoint URL to direct users to for signin.
	Issuer: string, --- The URL of the issuer of the tokens. This must match the exact URL of the issuer field in tokens.
	JsonWebKeySet: {[any]: any}, --- JSON Web Key Set for validating the signature of tokens.
	TokenUrl: string, --- Token endpoint URL for code verification.
}

export type PermissionStatement = {
	Action: string, --- The action this statement effects. The only supported action is 'Execute'.
	ApiConditions: ApiCondition?, --- Additional conditions to be applied for API Resources.
	Comment: string?, --- A comment about the statement. Intended solely for bookkeeping and debugging.
	Effect: string, --- The effect this statement will have. It could be either Allow or Deny
	Principal: string, --- The principal this statement will effect. The only supported principal is '*'.
	Resource: string, --- The resource this statements effects. The only supported resources look like 'pfrn:api--*' for all apis, or 'pfrn:api--/Client/ConfirmPurchase' for specific apis.
}

export type PlayerChurnPredictionSegmentFilter = {
	Comparison: string?, --- Comparison
	RiskLevel: string?, --- RiskLevel
}

export type PlayerChurnPredictionTimeSegmentFilter = {
	Comparison: string?, --- Comparison
	DurationInDays: number, --- DurationInDays
}

export type PlayerChurnPreviousPredictionSegmentFilter = {
	Comparison: string?, --- Comparison
	RiskLevel: string?, --- RiskLevel
}

export type PlayerLinkedAccount = {
	Email: string?, --- Linked account's email
	Platform: string?, --- Authentication platform
	PlatformUserId: string?, --- Platform user identifier
	Username: string?, --- Linked account's username
}

export type PlayerLocation = {
	City: string?, --- City of the player's geographic location.
	ContinentCode: string, --- The two-character continent code for this location
	CountryCode: string, --- The two-character ISO 3166-1 country code for the country associated with the location
	Latitude: number?, --- Latitude coordinate of the player's geographic location.
	Longitude: number?, --- Longitude coordinate of the player's geographic location.
}

export type PlayerProfile = {
	AdCampaignAttributions: {AdCampaignAttribution}?, --- Array of ad campaigns player has been attributed to
	AvatarUrl: string?, --- Image URL of the player's avatar.
	BannedUntil: string?, --- Banned until UTC Date. If permanent ban this is set for 20 years after the original ban date.
	ContactEmailAddresses: {ContactEmailInfo}?, --- Array of contact email addresses associated with the player
	Created: string?, --- Player record created
	DisplayName: string?, --- Player Display Name
	LastLogin: string?, --- Last login
	LinkedAccounts: {PlayerLinkedAccount}?, --- Array of third party accounts linked to this player
	Locations: PlayerLocation?, --- Dictionary of player's locations by type.
	Origination: string?, --- Player account origination
	PlayerExperimentVariants: {any}?, --- List of player variants for experimentation
	PlayerId: string?, --- PlayFab Player ID
	PlayerStatistics: {PlayerStatistic}?, --- Array of player statistics
	PublisherId: string?, --- Publisher this player belongs to
	PushNotificationRegistrations: {PushNotificationRegistration}?, --- Array of configured push notification end points
	Statistics: {[any]: any}?, --- Dictionary of player's statistics using only the latest version's value
	Tags: {any}?, --- List of player's tags for segmentation.
	TitleId: string?, --- Title ID this profile applies to
	TotalValueToDateInUSD: number?, --- A sum of player's total purchases in USD across all currencies.
	ValuesToDate: {[any]: any}?, --- Dictionary of player's total purchases by currency.
	VirtualCurrencyBalances: {[any]: any}?, --- Dictionary of player's virtual currency balances
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

export type PlayerStatistic = {
	Id: string?, --- Statistic ID
	Name: string?, --- Statistic name
	StatisticValue: number, --- Current statistic value
	StatisticVersion: number, --- Statistic version (0 if not a versioned statistic)
}

export type PlayerStatisticDefinition = {
	AggregationMethod: string?, --- the aggregation method to use in updating the statistic (defaults to last)
	CurrentVersion: number, --- current active version of the statistic, incremented each time the statistic resets
	StatisticName: string?, --- unique name of the statistic
	VersionChangeInterval: string?, --- interval at which the values of the statistic for all players are reset automatically
}

export type PlayerStatisticVersion = {
	ActivationTime: string, --- time when the statistic version became active
	ArchiveDownloadUrl: string?, --- URL for the downloadable archive of player statistic values, if available
	DeactivationTime: string?, --- time when the statistic version became inactive due to statistic version incrementing
	ScheduledActivationTime: string?, --- time at which the statistic version was scheduled to become active, based on the configured ResetInterval
	ScheduledDeactivationTime: string?, --- time at which the statistic version was scheduled to become inactive, based on the configured ResetInterval
	StatisticName: string?, --- name of the statistic when the version became active
	Status: string?, --- status of the statistic version
	Version: number, --- version of the statistic
}

export type PushNotificationPlatform = 
	"ApplePushNotificationService"
	| "GoogleCloudMessaging"

export type PushNotificationRegistration = {
	NotificationEndpointARN: string?, --- Notification configured endpoint
	Platform: string?, --- Push notification platform
}

export type PushNotificationRegistrationModel = {
	NotificationEndpointARN: string?, --- Notification configured endpoint
	Platform: string?, --- Push notification platform
}

export type PushNotificationSegmentAction = {
	PushNotificationTemplateId: string?, --- Push notification template id.
}

export type PushNotificationSegmentFilter = {
	PushNotificationDevicePlatform: string?, --- Push notification device platform.
}

export type PushSetupPlatform = 
	"GCM"
	| "APNS"
	| "APNS_SANDBOX"

export type RandomResultTable = {
	Nodes: {ResultTableNode}, --- Child nodes that indicate what kind of drop table item this actually is.
	TableId: string, --- Unique name for this drop table
}

export type RandomResultTableListing = {
	CatalogVersion: string?, --- Catalog version this table is associated with
	Nodes: {ResultTableNode}, --- Child nodes that indicate what kind of drop table item this actually is.
	TableId: string, --- Unique name for this drop table
}

export type RefundPurchaseRequest = {
	OrderId: string, --- Unique order ID for the purchase in question.
	PlayFabId: string, --- Unique PlayFab assigned ID of the user on whom the operation will be performed.
	Reason: string?, --- The Reason parameter should correspond with the payment providers reason field, if they require one such as Facebook. In the case of Facebook this must match one of their refund or dispute resolution enums (See: https://developers.facebook.com/docs/payments/implementation-guide/handling-disputes-refunds)
}

export type RefundPurchaseResponse = {
	PurchaseStatus: string?, --- The order's updated purchase status.
}

export type Region = 
	"USCentral"
	| "USEast"
	| "EUWest"
	| "Singapore"
	| "Japan"
	| "Brazil"
	| "Australia"

--- This API will trigger a player_tag_removed event and remove a tag with the given 
--- TagName and PlayFabID from the corresponding player profile. TagName can be 
--- used for segmentation and it is limited to 256 characters 
export type RemovePlayerTagRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	PlayFabId: string, --- Unique PlayFab assigned ID of the user on whom the operation will be performed.
	TagName: string, --- Unique tag for player profile.
}

export type RemovePlayerTagResult = {
}

--- Virtual currencies to be removed cannot have entries in any catalog nor store 
--- for the title. Note that this operation will not remove player balances for 
--- the removed currencies; if a deleted currency is recreated at any point, user 
--- balances will be in an undefined state. 
export type RemoveVirtualCurrencyTypesRequest = {
	VirtualCurrencies: {VirtualCurrencyData}, --- List of virtual currencies to delete
}

--- Note that this action cannot be un-done. All statistics for this character will 
--- be deleted, removing the user from all leaderboards for the game. 
export type ResetCharacterStatisticsRequest = {
	CharacterId: string, --- Unique PlayFab assigned ID for a specific character owned by a user
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	PlayFabId: string, --- Unique PlayFab assigned ID of the user on whom the operation will be performed.
}

export type ResetCharacterStatisticsResult = {
}

--- Resets a player's password taking in a new password based and validating the 
--- user based off of a token sent to the playerto their email. The token expires 
--- after 30 minutes. 
export type ResetPasswordRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	Password: string, --- The new password for the player.
	Token: string, --- The token of the player requesting the password reset.
}

export type ResetPasswordResult = {
}

--- Note that this action cannot be un-done. All statistics for this user will be 
--- deleted, removing the user from all leaderboards for the game. 
export type ResetUserStatisticsRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	PlayFabId: string, --- Unique PlayFab assigned ID of the user on whom the operation will be performed.
}

export type ResetUserStatisticsResult = {
}

export type ResolutionOutcome = 
	"Revoke"
	| "Reinstate"
	| "Manual"

export type ResolvePurchaseDisputeRequest = {
	OrderId: string, --- Unique order ID for the purchase in question.
	Outcome: string, --- Enum for the desired purchase result state after notifying the payment provider. Valid values are Revoke, Reinstate and Manual. Manual will cause no change to the order state.
	PlayFabId: string, --- Unique PlayFab assigned ID of the user on whom the operation will be performed.
	Reason: string?, --- The Reason parameter should correspond with the payment providers reason field, if they require one such as Facebook. In the case of Facebook this must match one of their refund or dispute resolution enums (See: https://developers.facebook.com/docs/payments/implementation-guide/handling-disputes-refunds)
}

export type ResolvePurchaseDisputeResponse = {
	PurchaseStatus: string?, --- The order's updated purchase status.
}

export type ResultTableNode = {
	ResultItem: string, --- Either an ItemId, or the TableId of another random result table
	ResultItemType: string, --- Whether this entry in the table is an item or a link to another table
	Weight: number, --- How likely this is to be rolled - larger numbers add more weight
}

export type ResultTableNodeType = 
	"ItemId"
	| "TableId"

--- Setting the active state of all non-expired bans for a user to Inactive. Expired 
--- bans with an Active state will be ignored, however. Returns information about 
--- applied updates only. 
export type RevokeAllBansForUserRequest = {
	PlayFabId: string, --- Unique PlayFab assigned ID of the user on whom the operation will be performed.
}

export type RevokeAllBansForUserResult = {
	BanData: {BanInfo}?, --- Information on the bans that were revoked.
}

--- Setting the active state of all bans requested to Inactive regardless of whether 
--- that ban has already expired. BanIds that do not exist will be skipped. Returns 
--- information about applied updates only.  
export type RevokeBansRequest = {
	BanIds: {any}, --- Ids of the bans to be revoked. Maximum 100.
}

export type RevokeBansResult = {
	BanData: {BanInfo}?, --- Information on the bans that were revoked
}

export type RevokeInventoryItem = {
	CharacterId: string?, --- Unique PlayFab assigned ID for a specific character owned by a user
	ItemInstanceId: string, --- Unique PlayFab assigned instance identifier of the item
	PlayFabId: string, --- Unique PlayFab assigned ID of the user on whom the operation will be performed.
}

--- In cases where the inventory item in question is a "crate", and the items it 
--- contained have already been dispensed, this will not revoke access or otherwise 
--- remove the items which were dispensed. 
export type RevokeInventoryItemRequest = {
	CharacterId: string?, --- Unique PlayFab assigned ID for a specific character owned by a user
	ItemInstanceId: string, --- Unique PlayFab assigned instance identifier of the item
	PlayFabId: string, --- Unique PlayFab assigned ID of the user on whom the operation will be performed.
}

--- In cases where the inventory item in question is a "crate", and the items it 
--- contained have already been dispensed, this will not revoke access or otherwise 
--- remove the items which were dispensed. 
export type RevokeInventoryItemsRequest = {
	Items: {RevokeInventoryItem}, --- Array of player items to revoke, between 1 and 25 items.
}

export type RevokeInventoryItemsResult = {
	Errors: {RevokeItemError}?, --- Collection of any errors that occurred during processing.
}

export type RevokeInventoryResult = {
}

export type RevokeItemError = {
	Error: string?, --- Specific error that was encountered.
	Item: RevokeInventoryItem?, --- Item information that failed to be revoked.
}

--- The returned task instance ID can be used to query for task execution status. 
export type RunTaskRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	Identifier: NameIdentifier?, --- Provide either the task ID or the task name to run a task.
}

export type RunTaskResult = {
	TaskInstanceId: string?, --- ID of the task instance that is started. This can be used in Get*TaskInstance (e.g. GetCloudScriptTaskInstance) API call to retrieve status for the task instance.
}

export type ScheduledTask = {
	Description: string?, --- Description the task
	IsActive: boolean, --- Whether the schedule is active. Inactive schedule will not trigger task execution.
	LastRunTime: string?, --- UTC time of last run
	Name: string, --- Name of the task. This is a unique identifier for tasks in the title.
	NextRunTime: string?, --- UTC time of next run
	Parameter: {[any]: any}?, --- Task parameter. Different types of task have different parameter structure. See each task type's create API documentation for the details.
	Schedule: string?, --- Cron expression for the run schedule of the task. The expression should be in UTC.
	TaskId: string?, --- ID of the task
	Type: string?, --- Task type.
}

export type ScheduledTaskType = 
	"CloudScript"
	| "ActionsOnPlayerSegment"
	| "CloudScriptAzureFunctions"
	| "InsightsScheduledScaling"

export type ScriptExecutionError = {
	Error: string?, --- Error code, such as CloudScriptNotFound, JavascriptException, CloudScriptFunctionArgumentSizeExceeded, CloudScriptAPIRequestCountExceeded, CloudScriptAPIRequestError, or CloudScriptHTTPRequestError
	Message: string?, --- Details about the error
	StackTrace: string?, --- Point during the execution of the script at which the error occurred, if any
}

export type SegmentAndDefinition = {
	AdCampaignFilter: AdCampaignSegmentFilter?, --- Filter property for ad campaign filter.
	AllPlayersFilter: AllPlayersSegmentFilter?, --- property for all player filter.
	FirstLoginDateFilter: FirstLoginDateSegmentFilter?, --- Filter property for first login date.
	FirstLoginFilter: FirstLoginTimespanSegmentFilter?, --- Filter property for first login timespan.
	LastLoginDateFilter: LastLoginDateSegmentFilter?, --- Filter property for last login date.
	LastLoginFilter: LastLoginTimespanSegmentFilter?, --- Filter property for last login timespan.
	LinkedUserAccountFilter: LinkedUserAccountSegmentFilter?, --- Filter property for linked in user account.
	LinkedUserAccountHasEmailFilter: LinkedUserAccountHasEmailSegmentFilter?, --- Filter property for linked in user account has email.
	LocationFilter: LocationSegmentFilter?, --- Filter property for location.
	PlayerChurnPredictionFilter: PlayerChurnPredictionSegmentFilter?, --- Filter property for current player churn value.
	PlayerChurnPredictionTimeFilter: PlayerChurnPredictionTimeSegmentFilter?, --- Filter property for player churn timespan.
	PlayerChurnPreviousPredictionFilter: PlayerChurnPreviousPredictionSegmentFilter?, --- Filter property for previous player churn value.
	PushNotificationFilter: PushNotificationSegmentFilter?, --- Filter property for push notification.
	StatisticFilter: StatisticSegmentFilter?, --- Filter property for statistics.
	TagFilter: TagSegmentFilter?, --- Filter property for tags.
	TotalValueToDateInUSDFilter: TotalValueToDateInUSDSegmentFilter?, --- Filter property for total value to date in USD.
	UserOriginationFilter: UserOriginationSegmentFilter?, --- Filter property for user origination.
	ValueToDateFilter: ValueToDateSegmentFilter?, --- Filter property for value to date.
	VirtualCurrencyBalanceFilter: VirtualCurrencyBalanceSegmentFilter?, --- Filter property for virtual currency.
}

export type SegmentCountryCode = 
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

export type SegmentCurrency = 
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

export type SegmentFilterComparison = 
	"GreaterThan"
	| "LessThan"
	| "EqualTo"
	| "NotEqualTo"
	| "GreaterThanOrEqual"
	| "LessThanOrEqual"
	| "Exists"
	| "Contains"
	| "NotContains"

export type SegmentLoginIdentityProvider = 
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

export type SegmentModel = {
	Description: string?, --- Segment description.
	EnteredSegmentActions: {SegmentTrigger}?, --- Segment actions for current entered segment players.
	LastUpdateTime: string, --- Segment last updated date time.
	LeftSegmentActions: {SegmentTrigger}?, --- Segment actions for current left segment players.
	Name: string?, --- Segment name.
	SegmentId: string?, --- Segment id in hex.
	SegmentOrDefinitions: {SegmentOrDefinition}?, --- Segment or definitions. This includes segment and definitions and filters.
}

export type SegmentOrDefinition = {
	SegmentAndDefinitions: {SegmentAndDefinition}?, --- List of segment and definitions.
}

export type SegmentPushNotificationDevicePlatform = 
	"ApplePushNotificationService"
	| "GoogleCloudMessaging"

export type SegmentTrigger = {
	BanPlayerAction: BanPlayerSegmentAction?, --- Ban player segment trigger action.
	DeletePlayerAction: DeletePlayerSegmentAction?, --- Delete player segment trigger action.
	DeletePlayerStatisticAction: DeletePlayerStatisticSegmentAction?, --- Delete player statistic segment trigger action.
	EmailNotificationAction: EmailNotificationSegmentAction?, --- Email notification segment trigger action.
	ExecuteAzureFunctionAction: ExecuteAzureFunctionSegmentAction?, --- Execute azure function segment trigger action.
	ExecuteCloudScriptAction: ExecuteCloudScriptSegmentAction?, --- Execute cloud script segment trigger action.
	GrantItemAction: GrantItemSegmentAction?, --- Grant item segment trigger action.
	GrantVirtualCurrencyAction: GrantVirtualCurrencySegmentAction?, --- Grant virtual currency segment trigger action.
	IncrementPlayerStatisticAction: IncrementPlayerStatisticSegmentAction?, --- Increment player statistic segment trigger action.
	PushNotificationAction: PushNotificationSegmentAction?, --- Push notification segment trigger action.
}

--- If the account in question is a "temporary" account (for example, one that was 
--- created via a call to LoginFromIOSDeviceID), thisfunction will have no effect. 
--- Only PlayFab accounts which have valid email addresses will be able to receive 
--- a password reset email using this API. 
export type SendAccountRecoveryEmailRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	Email: string, --- User email address attached to their account
	EmailTemplateId: string?, --- The email template id of the account recovery email template to send.
}

export type SendAccountRecoveryEmailResult = {
}

--- This API lets developers set overrides for membership expirations, independent 
--- of any subscriptions setting it. 
export type SetMembershipOverrideRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	ExpirationTime: string, --- Expiration time for the membership in DateTime format, will override any subscription expirations.
	MembershipId: string, --- Id of the membership to apply the override expiration date to.
	PlayFabId: string, --- Unique PlayFab assigned ID of the user on whom the operation will be performed.
}

export type SetMembershipOverrideResult = {
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
	PlayFabId: string, --- Unique PlayFab assigned ID of the user on whom the operation will be performed.
	PlayerSecret: string?, --- Player secret that is used to verify API request signatures (Enterprise Only).
}

export type SetPlayerSecretResult = {
}

export type SetPublishedRevisionRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	Revision: number, --- Revision to make the current published revision
	Version: number, --- Version number
}

export type SetPublishedRevisionResult = {
}

--- This API is designed to store publisher-specific values which can be read, but 
--- not written to, by the client. This data is shared across all titles assigned 
--- to a particular publisher, and can be used for cross-game coordination. Only 
--- titles assigned to a publisher can use this API. This operation is additive. 
--- If a Key does not exist in the current dataset, it will be added with the specified 
--- Value. If it already exists, the Value for that key will be overwritten with 
--- the new Value. For more information email helloplayfab@microsoft.com 
export type SetPublisherDataRequest = {
	Key: string, --- key we want to set a value on (note, this is additive - will only replace an existing key's value if they are the same name.) Keys are trimmed of whitespace. Keys may not begin with the '!' character.
	Value: string?, --- new value to set. Set to null to remove a value
}

export type SetPublisherDataResult = {
}

--- Will set the given key values in the specified override or the primary title 
--- data based on whether the label is provided or not. 
export type SetTitleDataAndOverridesRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	KeyValues: {TitleDataKeyValue}, --- List of titleData key-value pairs to set/delete. Use an empty value to delete an existing key; use a non-empty value to create/update a key.
	OverrideLabel: string?, --- Name of the override.
}

export type SetTitleDataAndOverridesResult = {
}

--- This API method is designed to store title specific values which can be read 
--- by the client. For example, a developer could choose to store values which modify 
--- the user experience, such as enemy spawn rates, weapon strengths, movement speeds, 
--- etc. This allows a developer to update the title without the need to create, 
--- test, and ship a new build. This operation is additive. If a Key does not exist 
--- in the current dataset, it will be added with the specified Value. If it already 
--- exists, the Value for that key will be overwritten with the new Value. 
export type SetTitleDataRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	Key: string, --- key we want to set a value on (note, this is additive - will only replace an existing key's value if they are the same name.) Keys are trimmed of whitespace. Keys may not begin with the '!' character.
	Value: string?, --- new value to set. Set to null to remove a value
}

export type SetTitleDataResult = {
}

--- When using the Apple Push Notification service (APNS) or the development version 
--- (APNS_SANDBOX), the APNS Private Key should be used as the Credential in this 
--- call. With Google Cloud Messaging (GCM), the Android API Key should be used. 
--- The current ARN (if one exists) can be overwritten by setting the OverwriteOldARN 
--- boolean to true. 
export type SetupPushNotificationRequest = {
	Credential: string, --- Credential is the Private Key for APNS/APNS_SANDBOX, and the API Key for GCM
	Key: string?, --- for APNS, this is the PlatformPrincipal (SSL Certificate)
	Name: string?, --- This field is deprecated and any usage of this will cause the API to fail.
	OverwriteOldARN: boolean, --- replace any existing ARN with the newly generated one. If this is set to false, an error will be returned if notifications have already setup for this platform.
	Platform: string, --- supported notification platforms are Apple Push Notification Service (APNS and APNS_SANDBOX) for iOS and Google Cloud Messaging (GCM) for Android
}

export type SetupPushNotificationResult = {
	ARN: string?, --- Amazon Resource Name for the created notification topic.
}

export type SharedSecret = {
	Disabled: boolean, --- Flag to indicate if this key is disabled
	FriendlyName: string?, --- Friendly name for this key
	SecretKey: string?, --- The player shared secret to use when calling Client/GetTitlePublicKey
}

export type SourceType = 
	"Admin"
	| "BackEnd"
	| "GameClient"
	| "GameServer"
	| "Partner"
	| "Custom"
	| "API"

export type StatisticAggregationMethod = 
	"Last"
	| "Min"
	| "Max"
	| "Sum"

export type StatisticModel = {
	Name: string?, --- Statistic name
	Value: number, --- Statistic value
	Version: number, --- Statistic version (0 if not a versioned statistic)
}

export type StatisticResetIntervalOption = 
	"Never"
	| "Hour"
	| "Day"
	| "Week"
	| "Month"

export type StatisticSegmentFilter = {
	Comparison: string?, --- Statistic filter comparison.
	FilterValue: string?, --- Statistic filter value.
	Name: string?, --- Statistic name.
	UseCurrentVersion: boolean?, --- Use current version of statistic?
	Version: number?, --- Statistic version.
}

export type StatisticVersionArchivalStatus = 
	"NotScheduled"
	| "Scheduled"
	| "Queued"
	| "InProgress"
	| "Complete"

export type StatisticVersionStatus = 
	"Active"
	| "SnapshotPending"
	| "Snapshot"
	| "ArchivalPending"
	| "Archived"

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

export type SubtractUserVirtualCurrencyRequest = {
	Amount: number, --- Amount to be subtracted from the user balance of the specified virtual currency.
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	PlayFabId: string, --- PlayFab unique identifier of the user whose virtual currency balance is to be decreased.
	VirtualCurrency: string, --- Name of the virtual currency which is to be decremented.
}

export type TagModel = {
	TagValue: string?, --- Full value of the tag, including namespace
}

export type TagSegmentFilter = {
	Comparison: string?, --- Tag comparison.
	TagValue: string?, --- Tag value.
}

export type TaskInstanceBasicSummary = {
	CompletedAt: string?, --- UTC timestamp when the task completed.
	ErrorMessage: string?, --- Error message for last processing attempt, if an error occured.
	EstimatedSecondsRemaining: number?, --- Estimated time remaining in seconds.
	PercentComplete: number?, --- Progress represented as percentage.
	ScheduledByUserId: string?, --- If manually scheduled, ID of user who scheduled the task.
	StartedAt: string, --- UTC timestamp when the task started.
	Status: string?, --- Current status of the task instance.
	TaskIdentifier: NameIdentifier?, --- Identifier of the task this instance belongs to.
	TaskInstanceId: string?, --- ID of the task instance.
	Type: string?, --- Type of the task.
}

export type TaskInstanceStatus = 
	"Succeeded"
	| "Starting"
	| "InProgress"
	| "Failed"
	| "Aborted"
	| "Stalled"

export type TitleActivationStatus = 
	"None"
	| "ActivatedTitleKey"
	| "PendingSteam"
	| "ActivatedSteam"
	| "RevokedSteam"

export type TitleDataKeyValue = {
	Key: string?, --- Key we want to set a value on (note, this is additive - will only replace an existing key's value if they are the same name.) Keys are trimmed of whitespace. Keys may not begin with the '!' character.
	Value: string?, --- New value to set. Set to null to remove a value
}

export type TotalValueToDateInUSDSegmentFilter = {
	Amount: string?, --- Total value to date USD amount.
	Comparison: string?, --- Total value to date USD comparison.
}

--- Represents a single update ban request. 
export type UpdateBanRequest = {
	Active: boolean?, --- The updated active state for the ban. Null for no change.
	BanId: string, --- The id of the ban to be updated.
	Expires: string?, --- The updated expiration date for the ban. Null for no change.
	IPAddress: string?, --- The updated IP address for the ban. Null for no change.
	Permanent: boolean?, --- Whether to make this ban permanent. Set to true to make this ban permanent. This will not modify Active state.
	Reason: string?, --- The updated reason for the ban to be updated. Maximum 140 characters. Null for no change.
}

--- For each ban, only updates the values that are set. Leave any value to null 
--- for no change. If a ban could not be found, the rest are still applied. Returns 
--- information about applied updates only. 
export type UpdateBansRequest = {
	Bans: {UpdateBanRequest}, --- List of bans to be updated. Maximum 100.
}

export type UpdateBansResult = {
	BanData: {BanInfo}?, --- Information on the bans that were updated
}

--- When used for SetCatalogItems, this operation is not additive. Using it will 
--- cause the indicated catalog version to be created from scratch. If there is 
--- an existing catalog with the version number in question, it will be deleted 
--- and replaced with only the items specified in this call. When used for UpdateCatalogItems, 
--- this operation is additive. Items with ItemId values not currently in the catalog 
--- will be added, while those with ItemId values matching items currently in the 
--- catalog will overwrite those items with the given values. 
export type UpdateCatalogItemsRequest = {
	Catalog: {CatalogItem}?, --- Array of catalog items to be submitted. Note that while CatalogItem has a parameter for CatalogVersion, it is not required and ignored in this call.
	CatalogVersion: string?, --- Which catalog is being updated. If null, uses the default catalog.
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	SetAsDefaultCatalog: boolean?, --- Should this catalog be set as the default catalog. Defaults to true. If there is currently no default catalog, this will always set it.
}

export type UpdateCatalogItemsResult = {
}

export type UpdateCloudScriptRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	DeveloperPlayFabId: string?, --- PlayFab user ID of the developer initiating the request.
	Files: {CloudScriptFile}, --- List of Cloud Script files to upload to create the new revision. Must have at least one file.
	Publish: boolean, --- Immediately publish the new revision
}

export type UpdateCloudScriptResult = {
	Revision: number, --- New revision number created
	Version: number, --- Cloud Script version updated
}

export type UpdateOpenIdConnectionRequest = {
	ClientId: string?, --- The client ID given by the ID provider.
	ClientSecret: string?, --- The client secret given by the ID provider.
	ConnectionId: string, --- A name for the connection that identifies it within the title.
	IssuerDiscoveryUrl: string?, --- The issuer URL or discovery document URL to read issuer information from
	IssuerInformation: OpenIdIssuerInformation?, --- Manually specified information for an OpenID Connect issuer.
}

--- Player Shared Secret Keys are used for the call to Client/GetTitlePublicKey, 
--- which exchanges the shared secret for an RSA CSP blob to be used to encrypt 
--- the payload of account creation requests when that API requires a signature 
--- header. 
export type UpdatePlayerSharedSecretRequest = {
	Disabled: boolean, --- Disable or Enable this key
	FriendlyName: string?, --- Friendly name for this key
	SecretKey: string?, --- The shared secret key to update
}

export type UpdatePlayerSharedSecretResult = {
}

--- Statistics are numeric values, with each statistic in the title also generating 
--- a leaderboard. The ResetInterval enables automatically resetting leaderboards 
--- on a specified interval. Upon reset, the statistic updates to a new version 
--- with no values (effectively removing all players from the leaderboard). The 
--- previous version's statistic values are also archived for retrieval, if needed 
--- (see GetPlayerStatisticVersions). Statistics not created via a call to CreatePlayerStatisticDefinition 
--- by default have a VersionChangeInterval of Never, meaning they do not reset 
--- on a schedule, but they can be set to do so via a call to UpdatePlayerStatisticDefinition. 
--- Once a statistic has been reset (sometimes referred to as versioned or incremented), 
--- the now-previous version can still be written to for up a short, pre-defined 
--- period (currently 10 seconds), to prevent issues with levels completing around 
--- the time of the reset. Also, once reset, the historical statistics for players 
--- in the title may be retrieved using the URL specified in the version information 
--- (GetPlayerStatisticVersions). The AggregationMethod determines what action is 
--- taken when a new statistic value is submitted - always update with the new value 
--- (Last), use the highest of the old and new values (Max), use the smallest (Min), 
--- or add them together (Sum). 
export type UpdatePlayerStatisticDefinitionRequest = {
	AggregationMethod: string?, --- the aggregation method to use in updating the statistic (defaults to last)
	StatisticName: string, --- unique name of the statistic
	VersionChangeInterval: string?, --- interval at which the values of the statistic for all players are reset (changes are effective at the next occurance of the new interval boundary)
}

export type UpdatePlayerStatisticDefinitionResult = {
	Statistic: PlayerStatisticDefinition?, --- updated statistic definition
}

--- Updates permissions for your title. Policies affect what is allowed to happen 
--- on your title. Your policy is a collection of statements that, together, govern 
--- particular area for your title. Today, the only allowed policy is called 'ApiPolicy' 
--- and it governs what API calls are allowed. To verify that you have the latest 
--- version always download the current policy from GetPolicy before uploading a 
--- new policy. PlayFab updates the base policy periodically and will automatically 
--- apply it to the uploaded policy. Overwriting the combined policy blindly may 
--- result in unexpected API errors. 
export type UpdatePolicyRequest = {
	OverwritePolicy: boolean, --- Whether to overwrite or append to the existing policy.
	PolicyName: string, --- The name of the policy being updated. Only supported name is 'ApiPolicy'
	PolicyVersion: number, --- Version of the policy to update. Must be the latest (as returned by GetPolicy).
	Statements: {PermissionStatement}, --- The new statements to include in the policy.
}

export type UpdatePolicyResponse = {
	PolicyName: string?, --- The name of the policy that was updated.
	Statements: {PermissionStatement}?, --- The statements included in the new version of the policy.
}

--- This operation is additive. Tables with TableId values not currently defined 
--- will be added, while those with TableId values matching Tables currently in 
--- the catalog will be overwritten with the given values. 
export type UpdateRandomResultTablesRequest = {
	CatalogVersion: string?, --- which catalog is being updated. If null, update the current default catalog version
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	Tables: {RandomResultTable}?, --- array of random result tables to make available (Note: specifying an existing TableId will result in overwriting that table, while any others will be added to the available set)
}

export type UpdateRandomResultTablesResult = {
}

--- Update segment properties data which are planning to update 
export type UpdateSegmentRequest = {
	SegmentModel: SegmentModel, --- Segment model with all of the segment properties data.
}

export type UpdateSegmentResponse = {
	ErrorMessage: string?, --- Error message.
	SegmentId: string?, --- Segment id.
}

--- When used for SetStoreItems, this operation is not additive. Using it will cause 
--- the indicated virtual store to be created from scratch. If there is an existing 
--- store with the same storeId, it will be deleted and replaced with only the items 
--- specified in this call. When used for UpdateStoreItems, this operation is additive. 
--- Items with ItemId values not currently in the store will be added, while those 
--- with ItemId values matching items currently in the catalog will overwrite those 
--- items with the given values. In both cases, a store contains an array of references 
--- to items defined in the catalog, along with the prices for the item, in both 
--- real world and virtual currencies. These prices act as an override to any prices 
--- defined in the catalog. In this way, the base definitions of the items may be 
--- defined in the catalog, with all associated properties, while the pricing can 
--- be set for each store, as needed. This allows for subsets of goods to be defined 
--- for different purposes (in order to simplify showing some, but not all catalog 
--- items to users, based upon different characteristics), along with unique prices. 
--- Note that all prices defined in the catalog and store definitions for the item 
--- are considered valid, and that a compromised client can be made to send a request 
--- for an item based upon any of these definitions. If no price is specified in 
--- the store for an item, the price set in the catalog should be displayed to the 
--- user. 
export type UpdateStoreItemsRequest = {
	CatalogVersion: string?, --- Catalog version of the store to update. If null, uses the default catalog.
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	MarketingData: StoreMarketingModel?, --- Additional data about the store
	Store: {StoreItem}?, --- Array of store items - references to catalog items, with specific pricing - to be added
	StoreId: string, --- Unique identifier for the store which is to be updated
}

export type UpdateStoreItemsResult = {
}

--- Note that when calling this API, all properties of the task have to be provided, 
--- including properties that you do not want to change. Parameters not specified 
--- would be set to default value. If the task name in the update request is new, 
--- a task rename operation will be executed before updating other fields of the 
--- task. WARNING: Renaming of a task may break logics where the task name is used 
--- as an identifier. 
export type UpdateTaskRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	Description: string?, --- Description the task
	Identifier: NameIdentifier?, --- Specify either the task ID or the name of the task to be updated.
	IsActive: boolean, --- Whether the schedule is active. Inactive schedule will not trigger task execution.
	Name: string, --- Name of the task. This is a unique identifier for tasks in the title.
	Parameter: {[any]: any}?, --- Parameter object specific to the task type. See each task type's create API documentation for details.
	Schedule: string?, --- Cron expression for the run schedule of the task. The expression should be in UTC.
	Type: string, --- Task type.
}

--- This function performs an additive update of the arbitrary JSON object containing 
--- the custom data for the user. In updating the custom data object, keys which 
--- already exist in the object will have their values overwritten, while keys with 
--- null values will be removed. No other key-value pairs will be changed apart 
--- from those specified in the call. 
export type UpdateUserDataRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	Data: {[any]: any}?, --- Key-value pairs to be written to the custom data. Note that keys are trimmed of whitespace, are limited in size, and may not begin with a '!' character or be null.
	KeysToRemove: {any}?, --- Optional list of Data-keys to remove from UserData. Some SDKs cannot insert null-values into Data due to language constraints. Use this to delete the keys directly.
	Permission: string?, --- Permission to be applied to all user data keys written in this request. Defaults to "private" if not set.
	PlayFabId: string, --- Unique PlayFab assigned ID of the user on whom the operation will be performed.
}

export type UpdateUserDataResult = {
	DataVersion: number, --- Indicates the current version of the data that has been set. This is incremented with every set call for that type of data (read-only, internal, etc). This version can be provided in Get calls to find updated data.
}

--- This function performs an additive update of the arbitrary JSON object containing 
--- the custom data for the user. In updating the custom data object, keys which 
--- already exist in the object will have their values overwritten, keys with null 
--- values will be removed. No other key-value pairs will be changed apart from 
--- those specified in the call. 
export type UpdateUserInternalDataRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	Data: {[any]: any}?, --- Key-value pairs to be written to the custom data. Note that keys are trimmed of whitespace, are limited in size, and may not begin with a '!' character or be null.
	KeysToRemove: {any}?, --- Optional list of Data-keys to remove from UserData. Some SDKs cannot insert null-values into Data due to language constraints. Use this to delete the keys directly.
	PlayFabId: string, --- Unique PlayFab assigned ID of the user on whom the operation will be performed.
}

--- In addition to the PlayFab username, titles can make use of a DisplayName which 
--- is also a unique identifier, but specific to the title. This allows for unique 
--- names which more closely match the theme or genre of a title, for example. This 
--- API enables changing that name, whether due to a customer request, an offensive 
--- name choice, etc. 
export type UpdateUserTitleDisplayNameRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	DisplayName: string, --- New title display name for the user - must be between 3 and 25 characters
	PlayFabId: string, --- PlayFab unique identifier of the user whose title specific display name is to be changed
}

export type UpdateUserTitleDisplayNameResult = {
	DisplayName: string?, --- current title display name for the user (this will be the original display name if the rename attempt failed)
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

export type UserOriginationSegmentFilter = {
	LoginProvider: string?, --- User login provider.
}

export type UserPrivateAccountInfo = {
	Email: string?, --- user email address
}

export type UserPsnInfo = {
	PsnAccountId: string?, --- PlayStation :tm: Network account ID
	PsnOnlineId: string?, --- PlayStation :tm: Network online ID
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

export type ValueToDateModel = {
	Currency: string?, --- ISO 4217 code of the currency used in the purchases
	TotalValue: number, --- Total value of the purchases in a whole number of 1/100 monetary units. For example, 999 indicates nine dollars and ninety-nine cents when Currency is 'USD')
	TotalValueAsDecimal: string?, --- Total value of the purchases in a string representation of decimal monetary units. For example, '9.99' indicates nine dollars and ninety-nine cents when Currency is 'USD'.
}

export type ValueToDateSegmentFilter = {
	Amount: string?, --- Value to date amount.
	Comparison: string?, --- Value to date comparison.
	Currency: string?, --- Currency using for filter.
}

export type VirtualCurrencyBalanceSegmentFilter = {
	Amount: number, --- Total amount.
	Comparison: string?, --- Amount comparison.
	CurrencyCode: string?, --- Currency code.
}

export type VirtualCurrencyData = {
	CurrencyCode: string, --- unique two-character identifier for this currency type (e.g.: "CC")
	DisplayName: string?, --- friendly name to show in the developer portal, reports, etc.
	InitialDeposit: number?, --- amount to automatically grant users upon first login to the title
	RechargeMax: number?, --- maximum amount to which the currency will recharge (cannot exceed MaxAmount, but can be less)
	RechargeRate: number?, --- rate at which the currency automatically be added to over time, in units per day (24 hours)
}

export type VirtualCurrencyRechargeTime = {
	RechargeMax: number, --- Maximum value to which the regenerating currency will automatically increment. Note that it can exceed this value through use of the AddUserVirtualCurrency API call. However, it will not regenerate automatically until it has fallen below this value.
	RechargeTime: string, --- Server timestamp in UTC indicating the next time the virtual currency will be incremented.
	SecondsToRecharge: number, --- Time remaining (in seconds) before the next recharge increment of the virtual currency.
}


--- If the task instance has already completed, there will be no-op. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/scheduledtask/aborttaskinstance
function AdminApi.AbortTaskInstanceAsync(
	secretKey: string, 
	request: AbortTaskInstanceRequest
): EmptyResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Admin/AbortTaskInstance",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/addlocalizednews
function AdminApi.AddLocalizedNewsAsync(
	secretKey: string, 
	request: AddLocalizedNewsRequest
): AddLocalizedNewsResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Admin/AddLocalizedNews",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/addnews
function AdminApi.AddNewsAsync(
	secretKey: string, 
	request: AddNewsRequest
): AddNewsResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Admin/AddNews",
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
--- https://docs.microsoft.com/rest/api/playfab/admin/playstream/addplayertag
function AdminApi.AddPlayerTagAsync(
	secretKey: string, 
	request: AddPlayerTagRequest
): AddPlayerTagResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Admin/AddPlayerTag",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/admin/player-item-management/adduservirtualcurrency
function AdminApi.AddUserVirtualCurrencyAsync(
	secretKey: string, 
	request: AddUserVirtualCurrencyRequest
): ModifyUserVirtualCurrencyResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Admin/AddUserVirtualCurrency",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- This operation is additive. Any new currencies defined in the array will be 
--- added to the set of those available for the title, while any CurrencyCode identifiers 
--- matching existing ones in the game will be overwritten with the new values. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/addvirtualcurrencytypes
function AdminApi.AddVirtualCurrencyTypesAsync(
	secretKey: string, 
	request: AddVirtualCurrencyTypesRequest
): BlankResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Admin/AddVirtualCurrencyTypes",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- The existence of each user will not be verified. When banning by IP or MAC address, 
--- multiple players may be affected, so use this feature with caution. Returns 
--- information about the new bans. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/account-management/banusers
function AdminApi.BanUsersAsync(
	secretKey: string, 
	request: BanUsersRequest
): BanUsersResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Admin/BanUsers",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- This returns the total number of these items available. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/player-item-management/checklimitededitionitemavailability
function AdminApi.CheckLimitedEditionItemAvailabilityAsync(
	secretKey: string, 
	request: CheckLimitedEditionItemAvailabilityRequest
): CheckLimitedEditionItemAvailabilityResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Admin/CheckLimitedEditionItemAvailability",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- Task name is unique within a title. Using a task name that's already taken will 
--- cause a name conflict error. Too many create-task requests within a short time 
--- will cause a create conflict error. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/scheduledtask/createactionsonplayersinsegmenttask
function AdminApi.CreateActionsOnPlayersInSegmentTaskAsync(
	secretKey: string, 
	request: CreateActionsOnPlayerSegmentTaskRequest
): CreateTaskResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Admin/CreateActionsOnPlayersInSegmentTask",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- Task name is unique within a title. Using a task name that's already taken will 
--- cause a name conflict error. Too many create-task requests within a short time 
--- will cause a create conflict error. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/scheduledtask/createcloudscripttask
function AdminApi.CreateCloudScriptTaskAsync(
	secretKey: string, 
	request: CreateCloudScriptTaskRequest
): CreateTaskResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Admin/CreateCloudScriptTask",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- Task name is unique within a title. Using a task name that's already taken will 
--- cause a name conflict error. Too many create-task requests within a short time 
--- will cause a create conflict error. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/scheduledtask/createinsightsscheduledscalingtask
function AdminApi.CreateInsightsScheduledScalingTaskAsync(
	secretKey: string, 
	request: CreateInsightsScheduledScalingTaskRequest
): CreateTaskResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Admin/CreateInsightsScheduledScalingTask",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/admin/authentication/createopenidconnection
function AdminApi.CreateOpenIdConnectionAsync(
	secretKey: string, 
	request: CreateOpenIdConnectionRequest
): EmptyResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Admin/CreateOpenIdConnection",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- Player Shared Secret Keys are used for the call to Client/GetTitlePublicKey, 
--- which exchanges the shared secret for an RSA CSP blob to be used to encrypt 
--- the payload of account creation requests when that API requires a signature 
--- header. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/authentication/createplayersharedsecret
function AdminApi.CreatePlayerSharedSecretAsync(
	secretKey: string, 
	request: CreatePlayerSharedSecretRequest
): CreatePlayerSharedSecretResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Admin/CreatePlayerSharedSecret",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- Statistics are numeric values, with each statistic in the title also generating 
--- a leaderboard. The ResetInterval enables automatically resetting leaderboards 
--- on a specified interval. Upon reset, the statistic updates to a new version 
--- with no values (effectively removing all players from the leaderboard). The 
--- previous version's statistic values are also archived for retrieval, if needed 
--- (see GetPlayerStatisticVersions). Statistics not created via a call to CreatePlayerStatisticDefinition 
--- by default have a VersionChangeInterval of Never, meaning they do not reset 
--- on a schedule, but they can be set to do so via a call to UpdatePlayerStatisticDefinition. 
--- Once a statistic has been reset (sometimes referred to as versioned or incremented), 
--- the now-previous version can still be written to for up a short, pre-defined 
--- period (currently 10 seconds), to prevent issues with levels completing around 
--- the time of the reset. Also, once reset, the historical statistics for players 
--- in the title may be retrieved using the URL specified in the version information 
--- (GetPlayerStatisticVersions). The AggregationMethod determines what action is 
--- taken when a new statistic value is submitted - always update with the new value 
--- (Last), use the highest of the old and new values (Max), use the smallest (Min), 
--- or add them together (Sum). 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/createplayerstatisticdefinition
function AdminApi.CreatePlayerStatisticDefinitionAsync(
	secretKey: string, 
	request: CreatePlayerStatisticDefinitionRequest
): CreatePlayerStatisticDefinitionResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Admin/CreatePlayerStatisticDefinition",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- Send all the segment details part of CreateSegmentRequest 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/segments/createsegment
function AdminApi.CreateSegmentAsync(
	secretKey: string, 
	request: CreateSegmentRequest
): CreateSegmentResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Admin/CreateSegment",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/admin/content/deletecontent
function AdminApi.DeleteContentAsync(
	secretKey: string, 
	request: DeleteContentRequest
): BlankResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Admin/DeleteContent",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- Deletes all data associated with the master player account, including data from 
--- all titles the player has played, such as statistics, custom data, inventory, 
--- purchases, virtual currency balances, characters, group memberships, publisher 
--- data, credential data, account linkages, friends list and PlayStream event history. 
--- Removes the player from all leaderboards and player search indexes. Note, this 
--- API queues the player for deletion and returns a receipt immediately. Record 
--- the receipt ID for future reference. It may take some time before all player 
--- data is fully deleted. Upon completion of the deletion, an email will be sent 
--- to the notification email address configured for the title confirming the deletion. 
--- Until the player data is fully deleted, attempts to recreate the player with 
--- the same user account in the same title will fail with the 'AccountDeleted' 
--- error. It is highly recommended to know the impact of the deletion by calling 
--- GetPlayedTitleList, before calling this API. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/account-management/deletemasterplayeraccount
function AdminApi.DeleteMasterPlayerAccountAsync(
	secretKey: string, 
	request: DeleteMasterPlayerAccountRequest
): DeleteMasterPlayerAccountResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Admin/DeleteMasterPlayerAccount",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- This API lets developers delete a membership subscription. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/account-management/deletemembershipsubscription
function AdminApi.DeleteMembershipSubscriptionAsync(
	secretKey: string, 
	request: DeleteMembershipSubscriptionRequest
): DeleteMembershipSubscriptionResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Admin/DeleteMembershipSubscription",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/admin/authentication/deleteopenidconnection
function AdminApi.DeleteOpenIdConnectionAsync(
	secretKey: string, 
	request: DeleteOpenIdConnectionRequest
): EmptyResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Admin/DeleteOpenIdConnection",
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
--- error. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/account-management/deleteplayer
function AdminApi.DeletePlayerAsync(
	secretKey: string, 
	request: DeletePlayerRequest
): DeletePlayerResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Admin/DeletePlayer",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- Player Shared Secret Keys are used for the call to Client/GetTitlePublicKey, 
--- which exchanges the shared secret for an RSA CSP blob to be used to encrypt 
--- the payload of account creation requests when that API requires a signature 
--- header. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/authentication/deleteplayersharedsecret
function AdminApi.DeletePlayerSharedSecretAsync(
	secretKey: string, 
	request: DeletePlayerSharedSecretRequest
): DeletePlayerSharedSecretResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Admin/DeletePlayerSharedSecret",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- Send segment id planning to delete part of DeleteSegmentRequest object 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/segments/deletesegment
function AdminApi.DeleteSegmentAsync(
	secretKey: string, 
	request: DeleteSegmentRequest
): DeleteSegmentsResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Admin/DeleteSegment",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- This non-reversible operation will permanently delete the requested store. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/deletestore
function AdminApi.DeleteStoreAsync(
	secretKey: string, 
	request: DeleteStoreRequest
): DeleteStoreResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Admin/DeleteStore",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- After a task is deleted, for tracking purposes, the task instances belonging 
--- to this task will still remain. They will become orphaned and does not belongs 
--- to any task. Executions of any in-progress task instances will continue. If 
--- the task specified does not exist, the deletion is considered a success. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/scheduledtask/deletetask
function AdminApi.DeleteTaskAsync(
	secretKey: string, 
	request: DeleteTaskRequest
): EmptyResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Admin/DeleteTask",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- Deletes all data associated with the title, including catalog, virtual currencies, 
--- leaderboard statistics, Cloud Script revisions, segment definitions, event rules, 
--- tasks, add-ons, secret keys, data encryption keys, and permission policies. 
--- Removes the title from its studio and removes all associated developer roles 
--- and permissions. Does not delete PlayStream event history associated with the 
--- title. Note, this API queues the title for deletion and returns immediately. 
--- It may take several hours or more before all title data is fully deleted. All 
--- player accounts in the title must be deleted before deleting the title. If any 
--- player accounts exist, the API will return a 'TitleContainsUserAccounts' error. 
--- Until the title data is fully deleted, attempts to call APIs with the title 
--- will fail with the 'TitleDeleted' error. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/account-management/deletetitle
function AdminApi.DeleteTitleAsync(
	secretKey: string, 
	request: DeleteTitleRequest
): DeleteTitleResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Admin/DeleteTitle",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- This API method is designed to delete specified title data overrides associated 
--- with the given label. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/deletetitledataoverride
function AdminApi.DeleteTitleDataOverrideAsync(
	secretKey: string, 
	request: DeleteTitleDataOverrideRequest
): DeleteTitleDataOverrideResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Admin/DeleteTitleDataOverride",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- Exports all data associated with the master player account, including data from 
--- all titles the player has played, such as statistics, custom data, inventory, 
--- purchases, virtual currency balances, characters, group memberships, publisher 
--- data, credential data, account linkages, friends list and PlayStream event history. 
--- Note, this API queues the player for export and returns a receipt immediately. 
--- Record the receipt ID for future reference. It may take some time before the 
--- export is available for download. Upon completion of the export, an email containing 
--- the URL to download the export dump will be sent to the notification email address 
--- configured for the title. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/account-management/exportmasterplayerdata
function AdminApi.ExportMasterPlayerDataAsync(
	secretKey: string, 
	request: ExportMasterPlayerDataRequest
): ExportMasterPlayerDataResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Admin/ExportMasterPlayerData",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- Request must contain the Segment ID 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/playstream/exportplayersinsegment
function AdminApi.ExportPlayersInSegmentAsync(
	secretKey: string, 
	request: ExportPlayersInSegmentRequest
): ExportPlayersInSegmentResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Admin/ExportPlayersInSegment",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- The result includes detail information that's specific to an ActionsOnPlayersInSegment 
--- task. To get a list of task instances with generic basic information, use GetTaskInstances. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/scheduledtask/getactionsonplayersinsegmenttaskinstance
function AdminApi.GetActionsOnPlayersInSegmentTaskInstanceAsync(
	secretKey: string, 
	request: GetTaskInstanceRequest
): GetActionsOnPlayersInSegmentTaskInstanceResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Admin/GetActionsOnPlayersInSegmentTaskInstance",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- Request has no paramaters. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/playstream/getallsegments
function AdminApi.GetAllSegmentsAsync(
	secretKey: string, 
	request: GetAllSegmentsRequest
): GetAllSegmentsResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Admin/GetAllSegments",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/getcatalogitems
function AdminApi.GetCatalogItemsAsync(
	secretKey: string, 
	request: GetCatalogItemsRequest
): GetCatalogItemsResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Admin/GetCatalogItems",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/admin/server-side-cloud-script/getcloudscriptrevision
function AdminApi.GetCloudScriptRevisionAsync(
	secretKey: string, 
	request: GetCloudScriptRevisionRequest
): GetCloudScriptRevisionResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Admin/GetCloudScriptRevision",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- The result includes detail information that's specific to a CloudScript task. 
--- Only CloudScript tasks configured as "Run Cloud Script function once" will be 
--- retrieved. To get a list of task instances by task, status, or time range, use 
--- GetTaskInstances. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/scheduledtask/getcloudscripttaskinstance
function AdminApi.GetCloudScriptTaskInstanceAsync(
	secretKey: string, 
	request: GetTaskInstanceRequest
): GetCloudScriptTaskInstanceResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Admin/GetCloudScriptTaskInstance",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/admin/server-side-cloud-script/getcloudscriptversions
function AdminApi.GetCloudScriptVersionsAsync(
	secretKey: string, 
	request: GetCloudScriptVersionsRequest
): GetCloudScriptVersionsResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Admin/GetCloudScriptVersions",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/admin/content/getcontentlist
function AdminApi.GetContentListAsync(
	secretKey: string, 
	request: GetContentListRequest
): GetContentListResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Admin/GetContentList",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/admin/content/getcontentuploadurl
function AdminApi.GetContentUploadUrlAsync(
	secretKey: string, 
	request: GetContentUploadUrlRequest
): GetContentUploadUrlResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Admin/GetContentUploadUrl",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- Gets the download URL for the requested report data (in CSV form). The reports 
--- available through this API call are those available in the Game Manager, in 
--- the Analytics->Reports tab. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/getdatareport
function AdminApi.GetDataReportAsync(
	secretKey: string, 
	request: GetDataReportRequest
): GetDataReportResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Admin/GetDataReport",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/admin/matchmaking/getmatchmakergameinfo
function AdminApi.GetMatchmakerGameInfoAsync(
	secretKey: string, 
	request: GetMatchmakerGameInfoRequest
): GetMatchmakerGameInfoResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Admin/GetMatchmakerGameInfo",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- These details are used by the PlayFab matchmaking service to determine if an 
--- existing Game Server Instance has room for additional users, and by the PlayFab 
--- game server management service to determine when a new Game Server Host should 
--- be created in order to prevent excess load on existing Hosts. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/matchmaking/getmatchmakergamemodes
function AdminApi.GetMatchmakerGameModesAsync(
	secretKey: string, 
	request: GetMatchmakerGameModesRequest
): GetMatchmakerGameModesResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Admin/GetMatchmakerGameModes",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- Useful for identifying titles of which the player's data will be deleted by 
--- DeleteMasterPlayer. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/account-management/getplayedtitlelist
function AdminApi.GetPlayedTitleListAsync(
	secretKey: string, 
	request: GetPlayedTitleListRequest
): GetPlayedTitleListResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Admin/GetPlayedTitleList",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- Gets a player ID from an auth token. The token expires after 30 minutes and 
--- cannot be used to look up a player when expired. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/account-management/getplayeridfromauthtoken
function AdminApi.GetPlayerIdFromAuthTokenAsync(
	secretKey: string, 
	request: GetPlayerIdFromAuthTokenRequest
): GetPlayerIdFromAuthTokenResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Admin/GetPlayerIdFromAuthToken",
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
--- https://docs.microsoft.com/rest/api/playfab/admin/account-management/getplayerprofile
function AdminApi.GetPlayerProfileAsync(
	secretKey: string, 
	request: GetPlayerProfileRequest
): GetPlayerProfileResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Admin/GetPlayerProfile",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/admin/playstream/getplayersegments
function AdminApi.GetPlayerSegmentsAsync(
	secretKey: string, 
	request: GetPlayersSegmentsRequest
): GetPlayerSegmentsResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Admin/GetPlayerSegments",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- Player Shared Secret Keys are used for the call to Client/GetTitlePublicKey, 
--- which exchanges the shared secret for an RSA CSP blob to be used to encrypt 
--- the payload of account creation requests when that API requires a signature 
--- header. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/authentication/getplayersharedsecrets
function AdminApi.GetPlayerSharedSecretsAsync(
	secretKey: string, 
	request: GetPlayerSharedSecretsRequest
): GetPlayerSharedSecretsResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Admin/GetPlayerSharedSecrets",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/getplayerstatisticdefinitions
function AdminApi.GetPlayerStatisticDefinitionsAsync(
	secretKey: string, 
	request: GetPlayerStatisticDefinitionsRequest
): GetPlayerStatisticDefinitionsResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Admin/GetPlayerStatisticDefinitions",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/getplayerstatisticversions
function AdminApi.GetPlayerStatisticVersionsAsync(
	secretKey: string, 
	request: GetPlayerStatisticVersionsRequest
): GetPlayerStatisticVersionsResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Admin/GetPlayerStatisticVersions",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- This API will return a list of canonical tags which includes both namespace 
--- and tag's name. If namespace is not provided, the result is a list of all canonical 
--- tags. TagName can be used for segmentation and Namespace is limited to 128 characters. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/playstream/getplayertags
function AdminApi.GetPlayerTagsAsync(
	secretKey: string, 
	request: GetPlayerTagsRequest
): GetPlayerTagsResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Admin/GetPlayerTags",
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
--- https://docs.microsoft.com/rest/api/playfab/admin/playstream/getplayersinsegment
function AdminApi.GetPlayersInSegmentAsync(
	secretKey: string, 
	request: GetPlayersInSegmentRequest
): GetPlayersInSegmentResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Admin/GetPlayersInSegment",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- Views the requested policy. Today, the only supported policy is 'ApiPolicy'. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/authentication/getpolicy
function AdminApi.GetPolicyAsync(
	secretKey: string, 
	request: GetPolicyRequest
): GetPolicyResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Admin/GetPolicy",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- This API is designed to return publisher-specific values which can be read, 
--- but not written to, by the client. This data is shared across all titles assigned 
--- to a particular publisher, and can be used for cross-game coordination. Only 
--- titles assigned to a publisher can use this API. For more information email 
--- helloplayfab@microsoft.com. This AdminAPI call for getting title data guarantees 
--- no delay in between update and retrieval of newly set data. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/getpublisherdata
function AdminApi.GetPublisherDataAsync(
	secretKey: string, 
	request: GetPublisherDataRequest
): GetPublisherDataResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Admin/GetPublisherData",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/getrandomresulttables
function AdminApi.GetRandomResultTablesAsync(
	secretKey: string, 
	request: GetRandomResultTablesRequest
): GetRandomResultTablesResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Admin/GetRandomResultTables",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- Request must contain the ExportId 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/playstream/getsegmentexport
function AdminApi.GetSegmentExportAsync(
	secretKey: string, 
	request: GetPlayersInSegmentExportRequest
): GetPlayersInSegmentExportResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Admin/GetSegmentExport",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- Send segment filter details part of GetSegmentsRequest object 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/segments/getsegments
function AdminApi.GetSegmentsAsync(
	secretKey: string, 
	request: GetSegmentsRequest
): GetSegmentsResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Admin/GetSegments",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- A store contains an array of references to items defined in the catalog, along 
--- with the prices for the item, in both real world and virtual currencies. These 
--- prices act as an override to any prices defined in the catalog. In this way, 
--- the base definitions of the items may be defined in the catalog, with all associated 
--- properties, while the pricing can be set for each store, as needed. This allows 
--- for subsets of goods to be defined for different purposes (in order to simplify 
--- showing some, but not all catalog items to users, based upon different characteristics), 
--- along with unique prices. Note that all prices defined in the catalog and store 
--- definitions for the item are considered valid, and that a compromised client 
--- can be made to send a request for an item based upon any of these definitions. 
--- If no price is specified in the store for an item, the price set in the catalog 
--- should be displayed to the user. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/getstoreitems
function AdminApi.GetStoreItemsAsync(
	secretKey: string, 
	request: GetStoreItemsRequest
): GetStoreItemsResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Admin/GetStoreItems",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- Only the most recent 100 task instances are returned, ordered by start time 
--- descending. The results are generic basic information for task instances. To 
--- get detail information specific to each task type, use Get*TaskInstance based 
--- on its corresponding task type. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/scheduledtask/gettaskinstances
function AdminApi.GetTaskInstancesAsync(
	secretKey: string, 
	request: GetTaskInstancesRequest
): GetTaskInstancesResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Admin/GetTaskInstances",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/admin/scheduledtask/gettasks
function AdminApi.GetTasksAsync(
	secretKey: string, 
	request: GetTasksRequest
): GetTasksResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Admin/GetTasks",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- This API method is designed to return title specific values which can be read 
--- by the client. For example, a developer could choose to store values which modify 
--- the user experience, such as enemy spawn rates, weapon strengths, movement speeds, 
--- etc. This allows a developer to update the title without the need to create, 
--- test, and ship a new build. If an override label is specified in the request, 
--- the overrides are applied automatically and returned with the title data. Note 
--- that due to caching, there may up to a minute delay in between updating title 
--- data and a query returning the newest value. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/gettitledata
function AdminApi.GetTitleDataAsync(
	secretKey: string, 
	request: GetTitleDataRequest
): GetTitleDataResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Admin/GetTitleData",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- This API method is designed to return title specific values which are accessible 
--- only by the server. These values can be used to tweak settings used by game 
--- servers and Cloud Scripts without the need to update and re-deploy. Note that 
--- due to caching, there may up to a minute delay in between updating title data 
--- and this query returning the newest value. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/gettitleinternaldata
function AdminApi.GetTitleInternalDataAsync(
	secretKey: string, 
	request: GetTitleDataRequest
): GetTitleDataResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Admin/GetTitleInternalData",
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
--- https://docs.microsoft.com/rest/api/playfab/admin/account-management/getuseraccountinfo
function AdminApi.GetUserAccountInfoAsync(
	secretKey: string, 
	request: LookupUserAccountInfoRequest
): LookupUserAccountInfoResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Admin/GetUserAccountInfo",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- Get all bans for a user, including inactive and expired bans.  
---
--- https://docs.microsoft.com/rest/api/playfab/admin/account-management/getuserbans
function AdminApi.GetUserBansAsync(
	secretKey: string, 
	request: GetUserBansRequest
): GetUserBansResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Admin/GetUserBans",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- Data is stored as JSON key-value pairs. If the Keys parameter is provided, the 
--- data object returned will only contain the data specific to the indicated Keys. 
--- Otherwise, the full set of custom user data will be returned. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/getuserdata
function AdminApi.GetUserDataAsync(
	secretKey: string, 
	request: GetUserDataRequest
): GetUserDataResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Admin/GetUserData",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- Data is stored as JSON key-value pairs. If the Keys parameter is provided, the 
--- data object returned will only contain the data specific to the indicated Keys. 
--- Otherwise, the full set of custom user data will be returned. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/getuserinternaldata
function AdminApi.GetUserInternalDataAsync(
	secretKey: string, 
	request: GetUserDataRequest
): GetUserDataResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Admin/GetUserInternalData",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- All items currently in the user inventory will be returned, irrespective of 
--- how they were acquired (via purchasing, grants, coupons, etc.). Items that are 
--- expired, fully consumed, or are no longer valid are not considered to be in 
--- the user's current inventory, and so will not be not included. There can be 
--- a delay of up to a half a second for inventory changes to be reflected in the 
--- GetUserInventory API response. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/player-item-management/getuserinventory
function AdminApi.GetUserInventoryAsync(
	secretKey: string, 
	request: GetUserInventoryRequest
): GetUserInventoryResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Admin/GetUserInventory",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- Data is stored as JSON key-value pairs. If the Keys parameter is provided, the 
--- data object returned will only contain the data specific to the indicated Keys. 
--- Otherwise, the full set of custom user data will be returned. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/getuserpublisherdata
function AdminApi.GetUserPublisherDataAsync(
	secretKey: string, 
	request: GetUserDataRequest
): GetUserDataResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Admin/GetUserPublisherData",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- Data is stored as JSON key-value pairs. If the Keys parameter is provided, the 
--- data object returned will only contain the data specific to the indicated Keys. 
--- Otherwise, the full set of custom user data will be returned. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/getuserpublisherinternaldata
function AdminApi.GetUserPublisherInternalDataAsync(
	secretKey: string, 
	request: GetUserDataRequest
): GetUserDataResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Admin/GetUserPublisherInternalData",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- Data is stored as JSON key-value pairs. If the Keys parameter is provided, the 
--- data object returned will only contain the data specific to the indicated Keys. 
--- Otherwise, the full set of custom user data will be returned. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/getuserpublisherreadonlydata
function AdminApi.GetUserPublisherReadOnlyDataAsync(
	secretKey: string, 
	request: GetUserDataRequest
): GetUserDataResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Admin/GetUserPublisherReadOnlyData",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- Data is stored as JSON key-value pairs. If the Keys parameter is provided, the 
--- data object returned will only contain the data specific to the indicated Keys. 
--- Otherwise, the full set of custom user data will be returned. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/getuserreadonlydata
function AdminApi.GetUserReadOnlyDataAsync(
	secretKey: string, 
	request: GetUserDataRequest
): GetUserDataResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Admin/GetUserReadOnlyData",
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
--- https://docs.microsoft.com/rest/api/playfab/admin/player-item-management/grantitemstousers
function AdminApi.GrantItemsToUsersAsync(
	secretKey: string, 
	request: GrantItemsToUsersRequest
): GrantItemsToUsersResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Admin/GrantItemsToUsers",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- This operation will increment the global counter for the number of these items 
--- available. This number cannot be decremented, except by actual grants. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/player-item-management/incrementlimitededitionitemavailability
function AdminApi.IncrementLimitedEditionItemAvailabilityAsync(
	secretKey: string, 
	request: IncrementLimitedEditionItemAvailabilityRequest
): IncrementLimitedEditionItemAvailabilityResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Admin/IncrementLimitedEditionItemAvailability",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- Statistics are numeric values, with each statistic in the title also generating 
--- a leaderboard. When this call is made on a given statistic, this forces a reset 
--- of that statistic. Upon reset, the statistic updates to a new version with no 
--- values (effectively removing all players from the leaderboard). The previous 
--- version's statistic values are also archived for retrieval, if needed (see GetPlayerStatisticVersions). 
--- Statistics not created via a call to CreatePlayerStatisticDefinition by default 
--- have a VersionChangeInterval of Never, meaning they do not reset on a schedule, 
--- but they can be set to do so via a call to UpdatePlayerStatisticDefinition. 
--- Once a statistic has been reset (sometimes referred to as versioned or incremented), 
--- the now-previous version can still be written to for up a short, pre-defined 
--- period (currently 10 seconds), to prevent issues with levels completing around 
--- the time of the reset. Also, once reset, the historical statistics for players 
--- in the title may be retrieved using the URL specified in the version information 
--- (GetPlayerStatisticVersions). 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/incrementplayerstatisticversion
function AdminApi.IncrementPlayerStatisticVersionAsync(
	secretKey: string, 
	request: IncrementPlayerStatisticVersionRequest
): IncrementPlayerStatisticVersionResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Admin/IncrementPlayerStatisticVersion",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/admin/authentication/listopenidconnection
function AdminApi.ListOpenIdConnectionAsync(
	secretKey: string, 
	request: ListOpenIdConnectionRequest
): ListOpenIdConnectionResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Admin/ListOpenIdConnection",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/listvirtualcurrencytypes
function AdminApi.ListVirtualCurrencyTypesAsync(
	secretKey: string, 
	request: ListVirtualCurrencyTypesRequest
): ListVirtualCurrencyTypesResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Admin/ListVirtualCurrencyTypes",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/admin/custom-server-management/modifyserverbuild
function AdminApi.ModifyServerBuildAsync(
	secretKey: string, 
	request: ModifyServerBuildRequest
): ModifyServerBuildResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Admin/ModifyServerBuild",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/refundpurchase
function AdminApi.RefundPurchaseAsync(
	secretKey: string, 
	request: RefundPurchaseRequest
): RefundPurchaseResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Admin/RefundPurchase",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- This API will trigger a player_tag_removed event and remove a tag with the given 
--- TagName and PlayFabID from the corresponding player profile. TagName can be 
--- used for segmentation and it is limited to 256 characters 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/playstream/removeplayertag
function AdminApi.RemovePlayerTagAsync(
	secretKey: string, 
	request: RemovePlayerTagRequest
): RemovePlayerTagResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Admin/RemovePlayerTag",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- Virtual currencies to be removed cannot have entries in any catalog nor store 
--- for the title. Note that this operation will not remove player balances for 
--- the removed currencies; if a deleted currency is recreated at any point, user 
--- balances will be in an undefined state. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/removevirtualcurrencytypes
function AdminApi.RemoveVirtualCurrencyTypesAsync(
	secretKey: string, 
	request: RemoveVirtualCurrencyTypesRequest
): BlankResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Admin/RemoveVirtualCurrencyTypes",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- Note that this action cannot be un-done. All statistics for this character will 
--- be deleted, removing the user from all leaderboards for the game. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/characters/resetcharacterstatistics
function AdminApi.ResetCharacterStatisticsAsync(
	secretKey: string, 
	request: ResetCharacterStatisticsRequest
): ResetCharacterStatisticsResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Admin/ResetCharacterStatistics",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- Resets a player's password taking in a new password based and validating the 
--- user based off of a token sent to the playerto their email. The token expires 
--- after 30 minutes. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/account-management/resetpassword
function AdminApi.ResetPasswordAsync(
	secretKey: string, 
	request: ResetPasswordRequest
): ResetPasswordResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Admin/ResetPassword",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- Note that this action cannot be un-done. All statistics for this user will be 
--- deleted, removing the user from all leaderboards for the game. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/resetuserstatistics
function AdminApi.ResetUserStatisticsAsync(
	secretKey: string, 
	request: ResetUserStatisticsRequest
): ResetUserStatisticsResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Admin/ResetUserStatistics",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/resolvepurchasedispute
function AdminApi.ResolvePurchaseDisputeAsync(
	secretKey: string, 
	request: ResolvePurchaseDisputeRequest
): ResolvePurchaseDisputeResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Admin/ResolvePurchaseDispute",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- Setting the active state of all non-expired bans for a user to Inactive. Expired 
--- bans with an Active state will be ignored, however. Returns information about 
--- applied updates only. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/account-management/revokeallbansforuser
function AdminApi.RevokeAllBansForUserAsync(
	secretKey: string, 
	request: RevokeAllBansForUserRequest
): RevokeAllBansForUserResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Admin/RevokeAllBansForUser",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- Setting the active state of all bans requested to Inactive regardless of whether 
--- that ban has already expired. BanIds that do not exist will be skipped. Returns 
--- information about applied updates only.  
---
--- https://docs.microsoft.com/rest/api/playfab/admin/account-management/revokebans
function AdminApi.RevokeBansAsync(
	secretKey: string, 
	request: RevokeBansRequest
): RevokeBansResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Admin/RevokeBans",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- In cases where the inventory item in question is a "crate", and the items it 
--- contained have already been dispensed, this will not revoke access or otherwise 
--- remove the items which were dispensed. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/player-item-management/revokeinventoryitem
function AdminApi.RevokeInventoryItemAsync(
	secretKey: string, 
	request: RevokeInventoryItemRequest
): RevokeInventoryResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Admin/RevokeInventoryItem",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- In cases where the inventory item in question is a "crate", and the items it 
--- contained have already been dispensed, this will not revoke access or otherwise 
--- remove the items which were dispensed. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/player-item-management/revokeinventoryitems
function AdminApi.RevokeInventoryItemsAsync(
	secretKey: string, 
	request: RevokeInventoryItemsRequest
): RevokeInventoryItemsResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Admin/RevokeInventoryItems",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- The returned task instance ID can be used to query for task execution status. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/scheduledtask/runtask
function AdminApi.RunTaskAsync(
	secretKey: string, 
	request: RunTaskRequest
): RunTaskResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Admin/RunTask",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- If the account in question is a "temporary" account (for example, one that was 
--- created via a call to LoginFromIOSDeviceID), thisfunction will have no effect. 
--- Only PlayFab accounts which have valid email addresses will be able to receive 
--- a password reset email using this API. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/account-management/sendaccountrecoveryemail
function AdminApi.SendAccountRecoveryEmailAsync(
	secretKey: string, 
	request: SendAccountRecoveryEmailRequest
): SendAccountRecoveryEmailResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Admin/SendAccountRecoveryEmail",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- When used for SetCatalogItems, this operation is not additive. Using it will 
--- cause the indicated catalog version to be created from scratch. If there is 
--- an existing catalog with the version number in question, it will be deleted 
--- and replaced with only the items specified in this call. When used for UpdateCatalogItems, 
--- this operation is additive. Items with ItemId values not currently in the catalog 
--- will be added, while those with ItemId values matching items currently in the 
--- catalog will overwrite those items with the given values. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/setcatalogitems
function AdminApi.SetCatalogItemsAsync(
	secretKey: string, 
	request: UpdateCatalogItemsRequest
): UpdateCatalogItemsResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Admin/SetCatalogItems",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- This API lets developers set overrides for membership expirations, independent 
--- of any subscriptions setting it. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/account-management/setmembershipoverride
function AdminApi.SetMembershipOverrideAsync(
	secretKey: string, 
	request: SetMembershipOverrideRequest
): SetMembershipOverrideResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Admin/SetMembershipOverride",
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
--- https://docs.microsoft.com/rest/api/playfab/admin/authentication/setplayersecret
function AdminApi.SetPlayerSecretAsync(
	secretKey: string, 
	request: SetPlayerSecretRequest
): SetPlayerSecretResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Admin/SetPlayerSecret",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/admin/server-side-cloud-script/setpublishedrevision
function AdminApi.SetPublishedRevisionAsync(
	secretKey: string, 
	request: SetPublishedRevisionRequest
): SetPublishedRevisionResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Admin/SetPublishedRevision",
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
--- https://docs.microsoft.com/rest/api/playfab/admin/shared-group-data/setpublisherdata
function AdminApi.SetPublisherDataAsync(
	secretKey: string, 
	request: SetPublisherDataRequest
): SetPublisherDataResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Admin/SetPublisherData",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- When used for SetStoreItems, this operation is not additive. Using it will cause 
--- the indicated virtual store to be created from scratch. If there is an existing 
--- store with the same storeId, it will be deleted and replaced with only the items 
--- specified in this call. When used for UpdateStoreItems, this operation is additive. 
--- Items with ItemId values not currently in the store will be added, while those 
--- with ItemId values matching items currently in the catalog will overwrite those 
--- items with the given values. In both cases, a store contains an array of references 
--- to items defined in the catalog, along with the prices for the item, in both 
--- real world and virtual currencies. These prices act as an override to any prices 
--- defined in the catalog. In this way, the base definitions of the items may be 
--- defined in the catalog, with all associated properties, while the pricing can 
--- be set for each store, as needed. This allows for subsets of goods to be defined 
--- for different purposes (in order to simplify showing some, but not all catalog 
--- items to users, based upon different characteristics), along with unique prices. 
--- Note that all prices defined in the catalog and store definitions for the item 
--- are considered valid, and that a compromised client can be made to send a request 
--- for an item based upon any of these definitions. If no price is specified in 
--- the store for an item, the price set in the catalog should be displayed to the 
--- user. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/setstoreitems
function AdminApi.SetStoreItemsAsync(
	secretKey: string, 
	request: UpdateStoreItemsRequest
): UpdateStoreItemsResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Admin/SetStoreItems",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- This API method is designed to store title specific values which can be read 
--- by the client. For example, a developer could choose to store values which modify 
--- the user experience, such as enemy spawn rates, weapon strengths, movement speeds, 
--- etc. This allows a developer to update the title without the need to create, 
--- test, and ship a new build. This operation is additive. If a Key does not exist 
--- in the current dataset, it will be added with the specified Value. If it already 
--- exists, the Value for that key will be overwritten with the new Value. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/settitledata
function AdminApi.SetTitleDataAsync(
	secretKey: string, 
	request: SetTitleDataRequest
): SetTitleDataResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Admin/SetTitleData",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- This API method is designed to set and delete key-value pairs in a title data 
--- override instance. If the key exists and the new value is empty, the method 
--- will delete the key; otherwise, the method will update the current value with 
--- the new value. Keys are trimmed and cannot start with '!'. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/settitledataandoverrides
function AdminApi.SetTitleDataAndOverridesAsync(
	secretKey: string, 
	request: SetTitleDataAndOverridesRequest
): SetTitleDataAndOverridesResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Admin/SetTitleDataAndOverrides",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- This API method is designed to store title specific values which are accessible 
--- only by the server. These values can be used to tweak settings used by game 
--- servers and Cloud Scripts without the need to update and re-deploy. This operation 
--- is additive. If a Key does not exist in the current dataset, it will be added 
--- with the specified Value. If it already exists, the Value for that key will 
--- be overwritten with the new Value. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/settitleinternaldata
function AdminApi.SetTitleInternalDataAsync(
	secretKey: string, 
	request: SetTitleDataRequest
): SetTitleDataResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Admin/SetTitleInternalData",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- When using the Apple Push Notification service (APNS) or the development version 
--- (APNS_SANDBOX), the APNS Private Key should be used as the Credential in this 
--- call. With Google Cloud Messaging (GCM), the Android API Key should be used. 
--- The current ARN (if one exists) can be overwritten by setting the OverwriteOldARN 
--- boolean to true. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/setuppushnotification
function AdminApi.SetupPushNotificationAsync(
	secretKey: string, 
	request: SetupPushNotificationRequest
): SetupPushNotificationResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Admin/SetupPushNotification",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/admin/player-item-management/subtractuservirtualcurrency
function AdminApi.SubtractUserVirtualCurrencyAsync(
	secretKey: string, 
	request: SubtractUserVirtualCurrencyRequest
): ModifyUserVirtualCurrencyResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Admin/SubtractUserVirtualCurrency",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- For each ban, only updates the values that are set. Leave any value to null 
--- for no change. If a ban could not be found, the rest are still applied. Returns 
--- information about applied updates only. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/account-management/updatebans
function AdminApi.UpdateBansAsync(
	secretKey: string, 
	request: UpdateBansRequest
): UpdateBansResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Admin/UpdateBans",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- When used for SetCatalogItems, this operation is not additive. Using it will 
--- cause the indicated catalog version to be created from scratch. If there is 
--- an existing catalog with the version number in question, it will be deleted 
--- and replaced with only the items specified in this call. When used for UpdateCatalogItems, 
--- this operation is additive. Items with ItemId values not currently in the catalog 
--- will be added, while those with ItemId values matching items currently in the 
--- catalog will overwrite those items with the given values. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/updatecatalogitems
function AdminApi.UpdateCatalogItemsAsync(
	secretKey: string, 
	request: UpdateCatalogItemsRequest
): UpdateCatalogItemsResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Admin/UpdateCatalogItems",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/admin/server-side-cloud-script/updatecloudscript
function AdminApi.UpdateCloudScriptAsync(
	secretKey: string, 
	request: UpdateCloudScriptRequest
): UpdateCloudScriptResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Admin/UpdateCloudScript",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/admin/authentication/updateopenidconnection
function AdminApi.UpdateOpenIdConnectionAsync(
	secretKey: string, 
	request: UpdateOpenIdConnectionRequest
): EmptyResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Admin/UpdateOpenIdConnection",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- Player Shared Secret Keys are used for the call to Client/GetTitlePublicKey, 
--- which exchanges the shared secret for an RSA CSP blob to be used to encrypt 
--- the payload of account creation requests when that API requires a signature 
--- header. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/authentication/updateplayersharedsecret
function AdminApi.UpdatePlayerSharedSecretAsync(
	secretKey: string, 
	request: UpdatePlayerSharedSecretRequest
): UpdatePlayerSharedSecretResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Admin/UpdatePlayerSharedSecret",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- Statistics are numeric values, with each statistic in the title also generating 
--- a leaderboard. The ResetInterval enables automatically resetting leaderboards 
--- on a specified interval. Upon reset, the statistic updates to a new version 
--- with no values (effectively removing all players from the leaderboard). The 
--- previous version's statistic values are also archived for retrieval, if needed 
--- (see GetPlayerStatisticVersions). Statistics not created via a call to CreatePlayerStatisticDefinition 
--- by default have a VersionChangeInterval of Never, meaning they do not reset 
--- on a schedule, but they can be set to do so via a call to UpdatePlayerStatisticDefinition. 
--- Once a statistic has been reset (sometimes referred to as versioned or incremented), 
--- the now-previous version can still be written to for up a short, pre-defined 
--- period (currently 10 seconds), to prevent issues with levels completing around 
--- the time of the reset. Also, once reset, the historical statistics for players 
--- in the title may be retrieved using the URL specified in the version information 
--- (GetPlayerStatisticVersions). The AggregationMethod determines what action is 
--- taken when a new statistic value is submitted - always update with the new value 
--- (Last), use the highest of the old and new values (Max), use the smallest (Min), 
--- or add them together (Sum). 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/updateplayerstatisticdefinition
function AdminApi.UpdatePlayerStatisticDefinitionAsync(
	secretKey: string, 
	request: UpdatePlayerStatisticDefinitionRequest
): UpdatePlayerStatisticDefinitionResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Admin/UpdatePlayerStatisticDefinition",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- Updates permissions for your title. Policies affect what is allowed to happen 
--- on your title. Your policy is a collection of statements that, together, govern 
--- particular area for your title. Today, the only allowed policy is called 'ApiPolicy' 
--- and it governs what API calls are allowed. To verify that you have the latest 
--- version always download the current policy from GetPolicy before uploading a 
--- new policy. PlayFab updates the base policy periodically and will automatically 
--- apply it to the uploaded policy. Overwriting the combined policy blindly may 
--- result in unexpected API errors. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/authentication/updatepolicy
function AdminApi.UpdatePolicyAsync(
	secretKey: string, 
	request: UpdatePolicyRequest
): UpdatePolicyResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Admin/UpdatePolicy",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- This operation is additive. Tables with TableId values not currently defined 
--- will be added, while those with TableId values matching Tables currently in 
--- the catalog will be overwritten with the given values. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/updaterandomresulttables
function AdminApi.UpdateRandomResultTablesAsync(
	secretKey: string, 
	request: UpdateRandomResultTablesRequest
): UpdateRandomResultTablesResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Admin/UpdateRandomResultTables",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- Update segment properties data which are planning to update 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/segments/updatesegment
function AdminApi.UpdateSegmentAsync(
	secretKey: string, 
	request: UpdateSegmentRequest
): UpdateSegmentResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Admin/UpdateSegment",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- When used for SetStoreItems, this operation is not additive. Using it will cause 
--- the indicated virtual store to be created from scratch. If there is an existing 
--- store with the same storeId, it will be deleted and replaced with only the items 
--- specified in this call. When used for UpdateStoreItems, this operation is additive. 
--- Items with ItemId values not currently in the store will be added, while those 
--- with ItemId values matching items currently in the catalog will overwrite those 
--- items with the given values. In both cases, a store contains an array of references 
--- to items defined in the catalog, along with the prices for the item, in both 
--- real world and virtual currencies. These prices act as an override to any prices 
--- defined in the catalog. In this way, the base definitions of the items may be 
--- defined in the catalog, with all associated properties, while the pricing can 
--- be set for each store, as needed. This allows for subsets of goods to be defined 
--- for different purposes (in order to simplify showing some, but not all catalog 
--- items to users, based upon different characteristics), along with unique prices. 
--- Note that all prices defined in the catalog and store definitions for the item 
--- are considered valid, and that a compromised client can be made to send a request 
--- for an item based upon any of these definitions. If no price is specified in 
--- the store for an item, the price set in the catalog should be displayed to the 
--- user. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/updatestoreitems
function AdminApi.UpdateStoreItemsAsync(
	secretKey: string, 
	request: UpdateStoreItemsRequest
): UpdateStoreItemsResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Admin/UpdateStoreItems",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- Note that when calling this API, all properties of the task have to be provided, 
--- including properties that you do not want to change. Parameters not specified 
--- would be set to default value. If the task name in the update request is new, 
--- a task rename operation will be executed before updating other fields of the 
--- task. WARNING: Renaming of a task may break logics where the task name is used 
--- as an identifier. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/scheduledtask/updatetask
function AdminApi.UpdateTaskAsync(
	secretKey: string, 
	request: UpdateTaskRequest
): EmptyResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Admin/UpdateTask",
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
--- https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/updateuserdata
function AdminApi.UpdateUserDataAsync(
	secretKey: string, 
	request: UpdateUserDataRequest
): UpdateUserDataResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Admin/UpdateUserData",
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
--- https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/updateuserinternaldata
function AdminApi.UpdateUserInternalDataAsync(
	secretKey: string, 
	request: UpdateUserInternalDataRequest
): UpdateUserDataResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Admin/UpdateUserInternalData",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- This function performs an additive update of the arbitrary JSON object containing 
--- the custom data for the user. In updating the custom data object, keys which 
--- already exist in the object will have their values overwritten, while keys with 
--- null values will be removed. No other key-value pairs will be changed apart 
--- from those specified in the call. Note that in the example call provided, title-specific 
--- data is used, as there may be a need to share this across titles (in sequels, 
--- for example). 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/updateuserpublisherdata
function AdminApi.UpdateUserPublisherDataAsync(
	secretKey: string, 
	request: UpdateUserDataRequest
): UpdateUserDataResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Admin/UpdateUserPublisherData",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- This function performs an additive update of the arbitrary JSON object containing 
--- the custom data for the user. In updating the custom data object, keys which 
--- already exist in the object will have their values overwritten, keys with null 
--- values will be removed. No other key-value pairs will be changed apart from 
--- those specified in the call. Note that in the example call provided, title-specific 
--- data is used, as there may be a need to share this across titles (in sequels, 
--- for example). 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/updateuserpublisherinternaldata
function AdminApi.UpdateUserPublisherInternalDataAsync(
	secretKey: string, 
	request: UpdateUserInternalDataRequest
): UpdateUserDataResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Admin/UpdateUserPublisherInternalData",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- This function performs an additive update of the arbitrary JSON object containing 
--- the custom data for the user. In updating the custom data object, keys which 
--- already exist in the object will have their values overwritten, keys with null 
--- values will be removed. No other key-value pairs will be changed apart from 
--- those specified in the call. Note that in the example call provided, title-specific 
--- data is used, as there may be a need to share this across titles (in sequels, 
--- for example). 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/updateuserpublisherreadonlydata
function AdminApi.UpdateUserPublisherReadOnlyDataAsync(
	secretKey: string, 
	request: UpdateUserDataRequest
): UpdateUserDataResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Admin/UpdateUserPublisherReadOnlyData",
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
--- https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/updateuserreadonlydata
function AdminApi.UpdateUserReadOnlyDataAsync(
	secretKey: string, 
	request: UpdateUserDataRequest
): UpdateUserDataResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Admin/UpdateUserReadOnlyData",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- In addition to the PlayFab username, titles can make use of a DisplayName which 
--- is also a unique identifier, but specific to the title. This allows for unique 
--- names which more closely match the theme or genre of a title, for example. This 
--- API enables changing that name, whether due to a customer request, an offensive 
--- name choice, etc. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/account-management/updateusertitledisplayname
function AdminApi.UpdateUserTitleDisplayNameAsync(
	secretKey: string, 
	request: UpdateUserTitleDisplayNameRequest
): UpdateUserTitleDisplayNameResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Admin/UpdateUserTitleDisplayName",
		request,
		"X-SecretKey",
		secretKey
	)
end

return AdminApi

