--!strict
--[=[
	# AdminApi

	APIs for managing title configurations, uploaded Game Server code executables, 
	and user data. 

	API Version: 1.220926.4
]=]

local PlayFabInternal = require(script.Parent.PlayFabInternal)

local AdminApi = {}

function AdminApi.SetSettings(settings: PlayFabInternal.ISettings)
	PlayFabInternal.SetSettings(settings)
end

--- If the task instance has already completed, there will be no-op. 
export type AbortTaskInstanceRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- ID of a task instance that is being aborted. 
	TaskInstanceId: string,
}

export type ActionsOnPlayersInSegmentTaskParameter = {
	--- ID of the action to perform on each player in segment. 
	ActionId: string,
	--- ID of the segment to perform actions on. 
	SegmentId: string,
}

export type ActionsOnPlayersInSegmentTaskSummary = {
	--- UTC timestamp when the task completed. 
	CompletedAt: string?,
	--- Error message for last processing attempt, if an error occured. 
	ErrorMessage: string?,
	--- Flag indicating if the error was fatal, if false job will be retried. 
	ErrorWasFatal: boolean?,
	--- Estimated time remaining in seconds. 
	EstimatedSecondsRemaining: number?,
	--- Progress represented as percentage. 
	PercentComplete: number?,
	--- If manually scheduled, ID of user who scheduled the task. 
	ScheduledByUserId: string?,
	--- UTC timestamp when the task started. 
	StartedAt: string,
	--- Current status of the task instance. 
	Status: string?,
	--- Identifier of the task this instance belongs to. 
	TaskIdentifier: NameIdentifier?,
	--- ID of the task instance. 
	TaskInstanceId: string?,
	--- Total players in segment when task was started. 
	TotalPlayersInSegment: number?,
	--- Total number of players that have had the actions applied to. 
	TotalPlayersProcessed: number?,
}

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

export type AdCampaignSegmentFilter = {
	--- Campaign id. 
	CampaignId: string?,
	--- Campaign source. 
	CampaignSource: string?,
	--- Campaign comparison. 
	Comparison: string?,
}

export type AddLocalizedNewsRequest = {
	--- Localized body text of the news. 
	Body: string,
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- Language of the news item. 
	Language: string,
	--- Unique id of the updated news item. 
	NewsId: string,
	--- Localized title (headline) of the news item. 
	Title: string,
}

export type AddLocalizedNewsResult = {
}

export type AddNewsRequest = {
	--- Default body text of the news. 
	Body: string,
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- Time this news was published. If not set, defaults to now. 
	Timestamp: string?,
	--- Default title (headline) of the news item. 
	Title: string,
}

export type AddNewsResult = {
	--- Unique id of the new news item 
	NewsId: string?,
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

--- This operation is additive. Any new currencies defined in the array will be 
--- added to the set of those available for the title, while any CurrencyCode identifiers 
--- matching existing ones in the game will be overwritten with the new values. 
export type AddVirtualCurrencyTypesRequest = {
	--- List of virtual currencies and their initial deposits (the amount a user is 
	--- granted when signing in for the first time) to the title 
	VirtualCurrencies: {VirtualCurrencyData},
}

export type AllPlayersSegmentFilter = {
}

export type ApiCondition = {
	--- Require that API calls contain an RSA encrypted payload or signed headers. 
	HasSignatureOrEncryption: string?,
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

export type AuthTokenType = 
	"Email"

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

export type BanPlayerSegmentAction = {
	--- Ban hours duration. 
	BanHours: number?,
	--- Reason for ban. 
	ReasonForBan: string?,
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

export type BlankResult = {
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

--- This returns the total number of these items available. 
export type CheckLimitedEditionItemAvailabilityRequest = {
	--- Which catalog is being updated. If null, uses the default catalog. 
	CatalogVersion: string?,
	--- The item to check for. 
	ItemId: string,
}

export type CheckLimitedEditionItemAvailabilityResult = {
	--- The amount of the specified resource remaining. 
	Amount: number,
}

export type ChurnRiskLevel = 
	"NoData"
	| "LowRisk"
	| "MediumRisk"
	| "HighRisk"

export type CloudScriptFile = {
	--- Contents of the Cloud Script javascript. Must be string-escaped javascript. 
	FileContents: string,
	--- Name of the javascript file. These names are not used internally by the server, 
	--- they are only for developer organizational purposes. 
	Filename: string,
}

export type CloudScriptTaskParameter = {
	--- Argument to pass to the CloudScript function. 
	Argument: {[any]: any}?,
	--- Name of the CloudScript function to execute. 
	FunctionName: string?,
}

export type CloudScriptTaskSummary = {
	--- UTC timestamp when the task completed. 
	CompletedAt: string?,
	--- Estimated time remaining in seconds. 
	EstimatedSecondsRemaining: number?,
	--- Progress represented as percentage. 
	PercentComplete: number?,
	--- Result of CloudScript execution 
	Result: ExecuteCloudScriptResult?,
	--- If manually scheduled, ID of user who scheduled the task. 
	ScheduledByUserId: string?,
	--- UTC timestamp when the task started. 
	StartedAt: string,
	--- Current status of the task instance. 
	Status: string?,
	--- Identifier of the task this instance belongs to. 
	TaskIdentifier: NameIdentifier?,
	--- ID of the task instance. 
	TaskInstanceId: string?,
}

export type CloudScriptVersionStatus = {
	--- Most recent revision for this Cloud Script version 
	LatestRevision: number,
	--- Published code revision for this Cloud Script version 
	PublishedRevision: number,
	--- Version number 
	Version: number,
}

export type Conditionals = 
	"Any"
	| "True"
	| "False"

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

export type ContentInfo = {
	--- Key of the content 
	Key: string?,
	--- Last modified time 
	LastModified: string,
	--- Size of the content in bytes 
	Size: number,
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
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- Description the task 
	Description: string?,
	--- Whether the schedule is active. Inactive schedule will not trigger task execution. 
	IsActive: boolean,
	--- Name of the task. This is a unique identifier for tasks in the title. 
	Name: string,
	--- Task details related to segment and action 
	Parameter: ActionsOnPlayersInSegmentTaskParameter,
	--- Cron expression for the run schedule of the task. The expression should be in 
	--- UTC. 
	Schedule: string?,
}

--- Task name is unique within a title. Using a task name that's already taken will 
--- cause a name conflict error. Too many create-task requests within a short time 
--- will cause a create conflict error. 
export type CreateCloudScriptTaskRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- Description the task 
	Description: string?,
	--- Whether the schedule is active. Inactive schedule will not trigger task execution. 
	IsActive: boolean,
	--- Name of the task. This is a unique identifier for tasks in the title. 
	Name: string,
	--- Task details related to CloudScript 
	Parameter: CloudScriptTaskParameter,
	--- Cron expression for the run schedule of the task. The expression should be in 
	--- UTC. 
	Schedule: string?,
}

--- Task name is unique within a title. Using a task name that's already taken will 
--- cause a name conflict error. Too many create-task requests within a short time 
--- will cause a create conflict error. 
export type CreateInsightsScheduledScalingTaskRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- Description the task 
	Description: string?,
	--- Whether the schedule is active. Inactive schedule will not trigger task execution. 
	IsActive: boolean,
	--- Name of the task. This is a unique identifier for tasks in the title. 
	Name: string,
	--- Task details related to Insights Scaling 
	Parameter: InsightsScalingTaskParameter,
	--- Cron expression for the run schedule of the task. The expression should be in 
	--- UTC. 
	Schedule: string?,
}

export type CreateOpenIdConnectionRequest = {
	--- The client ID given by the ID provider. 
	ClientId: string,
	--- The client secret given by the ID provider. 
	ClientSecret: string,
	--- A name for the connection that identifies it within the title. 
	ConnectionId: string,
	--- Ignore 'nonce' claim in identity tokens. 
	IgnoreNonce: boolean?,
	--- The discovery document URL to read issuer information from. This must be the 
	--- absolute URL to the JSON OpenId Configuration document and must be accessible 
	--- from the internet. If you don't know it, try your issuer URL followed by "/.well-known/openid-configuration". 
	--- For example, if the issuer is https://example.com, try https://example.com/.well-known/openid-configuration 
	IssuerDiscoveryUrl: string?,
	--- Manually specified information for an OpenID Connect issuer. 
	IssuerInformation: OpenIdIssuerInformation?,
}

--- Player Shared Secret Keys are used for the call to Client/GetTitlePublicKey, 
--- which exchanges the shared secret for an RSA CSP blob to be used to encrypt 
--- the payload of account creation requests when that API requires a signature 
--- header. 
export type CreatePlayerSharedSecretRequest = {
	--- Friendly name for this key 
	FriendlyName: string?,
}

export type CreatePlayerSharedSecretResult = {
	--- The player shared secret to use when calling Client/GetTitlePublicKey 
	SecretKey: string?,
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
	--- the aggregation method to use in updating the statistic (defaults to last) 
	AggregationMethod: string?,
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- unique name of the statistic 
	StatisticName: string,
	--- interval at which the values of the statistic for all players are reset (resets 
	--- begin at the next interval boundary) 
	VersionChangeInterval: string?,
}

export type CreatePlayerStatisticDefinitionResult = {
	--- created statistic definition 
	Statistic: PlayerStatisticDefinition?,
}

--- Send all the segment details part of CreateSegmentRequest 
export type CreateSegmentRequest = {
	--- Segment model with all of the segment properties data. 
	SegmentModel: SegmentModel,
}

export type CreateSegmentResponse = {
	--- Error message. 
	ErrorMessage: string?,
	--- Segment id. 
	SegmentId: string?,
}

export type CreateTaskResult = {
	--- ID of the task 
	TaskId: string?,
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
	--- Key of the content item to be deleted 
	Key: string,
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
	--- Developer created string to identify a user without PlayFab ID 
	MetaData: string?,
	--- Unique PlayFab assigned ID of the user on whom the operation will be performed. 
	PlayFabId: string,
}

export type DeleteMasterPlayerAccountResult = {
	--- A notification email with this job receipt Id will be sent to the title notification 
	--- email address when deletion is complete. 
	JobReceiptId: string?,
	--- List of titles from which the player's data will be deleted. 
	TitleIds: {any}?,
}

--- This API lets developers delete a membership subscription. 
export type DeleteMembershipSubscriptionRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- Id of the membership to apply the override expiration date to. 
	MembershipId: string,
	--- Unique PlayFab assigned ID of the user on whom the operation will be performed. 
	PlayFabId: string,
	--- Id of the subscription that should be deleted from the membership. 
	SubscriptionId: string,
}

export type DeleteMembershipSubscriptionResult = {
}

export type DeleteOpenIdConnectionRequest = {
	--- unique name of the connection 
	ConnectionId: string,
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
	--- Unique PlayFab assigned ID of the user on whom the operation will be performed. 
	PlayFabId: string,
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
	--- The shared secret key to delete 
	SecretKey: string?,
}

export type DeletePlayerSharedSecretResult = {
}

export type DeletePlayerStatisticSegmentAction = {
	--- Statistic name. 
	StatisticName: string?,
}

--- Send segment id planning to delete part of DeleteSegmentRequest object 
export type DeleteSegmentRequest = {
	--- Segment id. 
	SegmentId: string,
}

export type DeleteSegmentsResponse = {
	--- Error message. 
	ErrorMessage: string?,
}

--- This non-reversible operation will permanently delete the requested store. 
export type DeleteStoreRequest = {
	--- catalog version of the store to delete. If null, uses the default catalog. 
	CatalogVersion: string?,
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- unqiue identifier for the store which is to be deleted 
	StoreId: string,
}

export type DeleteStoreResult = {
}

--- After a task is deleted, for tracking purposes, the task instances belonging 
--- to this task will still remain. They will become orphaned and does not belongs 
--- to any task. Executions of any in-progress task instances will continue. If 
--- the task specified does not exist, the deletion is considered a success. 
export type DeleteTaskRequest = {
	--- Specify either the task ID or the name of task to be deleted. 
	Identifier: NameIdentifier?,
}

--- Will delete all the title data associated with the given override label. 
export type DeleteTitleDataOverrideRequest = {
	--- Name of the override. 
	OverrideLabel: string,
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
	--- Email template id. 
	EmailTemplateId: string?,
	--- Email template name. 
	EmailTemplateName: string?,
}

export type EmailVerificationStatus = 
	"Unverified"
	| "Pending"
	| "Confirmed"

export type EmptyResponse = {
}

--- Combined entity type and ID structure which uniquely identifies a single entity. 
export type EntityKey = {
	--- Unique ID of the entity. 
	Id: string,
	--- Entity type. See https://docs.microsoft.com/gaming/playfab/features/data/entities/available-built-in-entity-types 
	Type: string?,
}

export type ExecuteAzureFunctionSegmentAction = {
	--- Azure function. 
	AzureFunction: string?,
	--- Azure function parameter. 
	FunctionParameter: {[any]: any}?,
	--- Generate play stream event. 
	GenerateFunctionExecutedEvents: boolean,
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

export type ExecuteCloudScriptSegmentAction = {
	--- Cloud script function. 
	CloudScriptFunction: string?,
	--- Generate play stream event. 
	CloudScriptPublishResultsToPlayStream: boolean,
	--- Cloud script function parameter. 
	FunctionParameter: {[any]: any}?,
	--- Cloud script function parameter json text. 
	FunctionParameterJson: string?,
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
	--- Unique PlayFab assigned ID of the user on whom the operation will be performed. 
	PlayFabId: string,
}

export type ExportMasterPlayerDataResult = {
	--- An email with this job receipt Id containing the export download link will be 
	--- sent to the title notification email address when the export is complete. 
	JobReceiptId: string?,
}

--- Request must contain the Segment ID 
export type ExportPlayersInSegmentRequest = {
	--- Unique identifier of the requested segment. 
	SegmentId: string,
}

export type ExportPlayersInSegmentResult = {
	--- Unique identifier of the export for the requested Segment. 
	ExportId: string?,
	--- Unique identifier of the requested Segment. 
	SegmentId: string?,
}

export type FirstLoginDateSegmentFilter = {
	--- First player login date comparison. 
	Comparison: string?,
	--- First player login date. 
	LogInDate: string,
}

export type FirstLoginTimespanSegmentFilter = {
	--- First player login duration comparison. 
	Comparison: string?,
	--- First player login duration. 
	DurationInMinutes: number,
}

export type GameBuildStatus = 
	"Available"
	| "Validating"
	| "InvalidBuildPackage"
	| "Processing"
	| "FailedToProcess"

export type GameModeInfo = {
	--- specific game mode type 
	Gamemode: string,
	--- maximum user count a specific Game Server Instance can support 
	MaxPlayerCount: number,
	--- minimum user count required for this Game Server Instance to continue (usually 
	--- 1) 
	MinPlayerCount: number,
	--- whether to start as an open session, meaning that players can matchmake into 
	--- it (defaults to true) 
	StartOpen: boolean?,
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
	--- Parameter of this task instance 
	Parameter: ActionsOnPlayersInSegmentTaskParameter?,
	--- Status summary of the actions-on-players-in-segment task instance 
	Summary: ActionsOnPlayersInSegmentTaskSummary?,
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

export type GetCloudScriptRevisionRequest = {
	--- Revision number. If left null, defaults to the latest revision 
	Revision: number?,
	--- Version number. If left null, defaults to the latest version 
	Version: number?,
}

export type GetCloudScriptRevisionResult = {
	--- Time this revision was created 
	CreatedAt: string,
	--- List of Cloud Script files in this revision. 
	Files: {CloudScriptFile}?,
	--- True if this is the currently published revision 
	IsPublished: boolean,
	--- Revision number. 
	Revision: number,
	--- Version number. 
	Version: number,
}

export type GetCloudScriptTaskInstanceResult = {
	--- Parameter of this task instance 
	Parameter: CloudScriptTaskParameter?,
	--- Status summary of the CloudScript task instance 
	Summary: CloudScriptTaskSummary?,
}

export type GetCloudScriptVersionsRequest = {
}

export type GetCloudScriptVersionsResult = {
	--- List of versions 
	Versions: {CloudScriptVersionStatus}?,
}

export type GetContentListRequest = {
	--- Limits the response to keys that begin with the specified prefix. You can use 
	--- prefixes to list contents under a folder, or for a specified version, etc. 
	Prefix: string?,
}

export type GetContentListResult = {
	--- List of content items. 
	Contents: {ContentInfo}?,
	--- Number of content items returned. We currently have a maximum of 1000 items 
	--- limit. 
	ItemCount: number,
	--- The total size of listed contents in bytes. 
	TotalSize: number,
}

export type GetContentUploadUrlRequest = {
	--- A standard MIME type describing the format of the contents. The same MIME type 
	--- has to be set in the header when uploading the content. If not specified, the 
	--- MIME type is 'binary/octet-stream' by default. 
	ContentType: string?,
	--- Key of the content item to upload, usually formatted as a path, e.g. images/a.png 
	Key: string,
}

export type GetContentUploadUrlResult = {
	--- URL for uploading content via HTTP PUT method. The URL requires the 'x-ms-blob-type' 
	--- header to have the value 'BlockBlob'. The URL will expire in approximately one 
	--- hour. 
	URL: string?,
}

--- Gets the download URL for the requested report data (in CSV form). The reports 
--- available through this API call are those available in the Game Manager, in 
--- the Analytics->Reports tab. 
export type GetDataReportRequest = {
	--- Reporting year (UTC) 
	Day: number,
	--- Reporting month (UTC) 
	Month: number,
	--- Report name 
	ReportName: string,
	--- Reporting year (UTC) 
	Year: number,
}

export type GetDataReportResult = {
	--- The URL where the requested report can be downloaded. This can be any PlayFab 
	--- generated reports. The full list of reports can be found at: https://docs.microsoft.com/en-us/gaming/playfab/features/analytics/reports/quickstart. 
	DownloadUrl: string?,
}

export type GetMatchmakerGameInfoRequest = {
	--- unique identifier of the lobby for which info is being requested 
	LobbyId: string,
}

export type GetMatchmakerGameInfoResult = {
	--- version identifier of the game server executable binary being run 
	BuildVersion: string?,
	--- time when Game Server Instance is currently scheduled to end 
	EndTime: string?,
	--- unique identifier of the lobby  
	LobbyId: string?,
	--- game mode for this Game Server Instance 
	Mode: string?,
	--- array of unique PlayFab identifiers for users currently connected to this Game 
	--- Server Instance 
	Players: {any}?,
	--- region in which the Game Server Instance is running 
	Region: string?,
	--- IPV4 address of the server 
	ServerIPV4Address: string?,
	--- IPV6 address of the server 
	ServerIPV6Address: string?,
	--- communication port for this Game Server Instance 
	ServerPort: number,
	--- Public DNS name (if any) of the server 
	ServerPublicDNSName: string?,
	--- time when the Game Server Instance was created 
	StartTime: string,
	--- unique identifier of the Game Server Instance for this lobby 
	TitleId: string?,
}

--- These details are used by the PlayFab matchmaking service to determine if an 
--- existing Game Server Instance has room for additional users, and by the PlayFab 
--- game server management service to determine when a new Game Server Host should 
--- be created in order to prevent excess load on existing Hosts. 
export type GetMatchmakerGameModesRequest = {
	--- previously uploaded build version for which game modes are being requested 
	BuildVersion: string,
}

export type GetMatchmakerGameModesResult = {
	--- array of game modes available for the specified build 
	GameModes: {GameModeInfo}?,
}

--- Useful for identifying titles of which the player's data will be deleted by 
--- DeleteMasterPlayer. 
export type GetPlayedTitleListRequest = {
	--- Unique PlayFab assigned ID of the user on whom the operation will be performed. 
	PlayFabId: string,
}

export type GetPlayedTitleListResult = {
	--- List of titles the player has played 
	TitleIds: {any}?,
}

--- Gets a player ID from an auth token. The token expires after 30 minutes and 
--- cannot be used to look up a player when expired. 
export type GetPlayerIdFromAuthTokenRequest = {
	--- The auth token of the player requesting the password reset. 
	Token: string,
	--- The type of auth token of the player requesting the password reset. 
	TokenType: string,
}

export type GetPlayerIdFromAuthTokenResult = {
	--- The player ID from the token passed in 
	PlayFabId: string?,
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

--- Player Shared Secret Keys are used for the call to Client/GetTitlePublicKey, 
--- which exchanges the shared secret for an RSA CSP blob to be used to encrypt 
--- the payload of account creation requests when that API requires a signature 
--- header. 
export type GetPlayerSharedSecretsRequest = {
}

export type GetPlayerSharedSecretsResult = {
	--- The player shared secret to use when calling Client/GetTitlePublicKey 
	SharedSecrets: {SharedSecret}?,
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
	--- the player statistic definitions for the title 
	Statistics: {PlayerStatisticDefinition}?,
}

export type GetPlayerStatisticVersionsRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- unique name of the statistic 
	StatisticName: string?,
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
	--- version change history of the statistic 
	StatisticVersions: {PlayerStatisticVersion}?,
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

--- Request must contain the ExportId 
export type GetPlayersInSegmentExportRequest = {
	--- Unique identifier of the export for the requested Segment. 
	ExportId: string,
}

export type GetPlayersInSegmentExportResponse = {
	--- Url from which the index file can be downloaded. 
	IndexUrl: string?,
	--- Shows the current status of the export 
	State: string?,
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

--- Views the requested policy. Today, the only supported policy is 'ApiPolicy'. 
export type GetPolicyRequest = {
	--- The name of the policy to read. Only supported name is 'ApiPolicy'. 
	PolicyName: string?,
}

export type GetPolicyResponse = {
	--- The name of the policy read. 
	PolicyName: string?,
	--- Policy version. 
	PolicyVersion: number,
	--- The statements in the requested policy. 
	Statements: {PermissionStatement}?,
}

--- This API is designed to return publisher-specific values which can be read, 
--- but not written to, by the client. This data is shared across all titles assigned 
--- to a particular publisher, and can be used for cross-game coordination. Only 
--- titles assigned to a publisher can use this API. For more information email 
--- helloplayfab@microsoft.com. This AdminAPI call for getting title data guarantees 
--- no delay in between update and retrieval of newly set data. 
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
	--- catalog version to fetch tables from. Use default catalog version if null 
	CatalogVersion: string?,
}

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

--- Given input segment ids, return list of segments. 
export type GetSegmentsRequest = {
	--- Segment ids to filter title segments. 
	SegmentIds: {any},
}

export type GetSegmentsResponse = {
	--- Error message. 
	ErrorMessage: string?,
	--- List of title segments. 
	Segments: {SegmentModel}?,
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
	--- Catalog version to store items from. Use default catalog version if null 
	CatalogVersion: string?,
	--- Unqiue identifier for the store which is being requested. 
	StoreId: string,
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

--- The result includes detail information that's specific to a CloudScript task. 
--- Only CloudScript tasks configured as "Run Cloud Script function once" will be 
--- retrieved. To get a list of task instances by task, status, or time range, use 
--- GetTaskInstances. 
export type GetTaskInstanceRequest = {
	--- ID of the requested task instance. 
	TaskInstanceId: string,
}

--- Only the most recent 100 task instances are returned, ordered by start time 
--- descending. The results are generic basic information for task instances. To 
--- get detail information specific to each task type, use Get*TaskInstance based 
--- on its corresponding task type. 
export type GetTaskInstancesRequest = {
	--- Optional range-from filter for task instances' StartedAt timestamp. 
	StartedAtRangeFrom: string?,
	--- Optional range-to filter for task instances' StartedAt timestamp. 
	StartedAtRangeTo: string?,
	--- Optional filter for task instances that are of a specific status. 
	StatusFilter: string?,
	--- Name or ID of the task whose instances are being queried. If not specified, 
	--- return all task instances that satisfy conditions set by other filters. 
	TaskIdentifier: NameIdentifier?,
}

export type GetTaskInstancesResult = {
	--- Basic status summaries of the queried task instances. Empty If no task instances 
	--- meets the filter criteria. To get detailed status summary, use Get*TaskInstance 
	--- API according to task type (e.g. GetActionsOnPlayersInSegmentTaskInstance). 
	Summaries: {TaskInstanceBasicSummary}?,
}

export type GetTasksRequest = {
	--- Provide either the task ID or the task name to get a specific task. If not specified, 
	--- return all defined tasks. 
	Identifier: NameIdentifier?,
}

export type GetTasksResult = {
	--- Result tasks. Empty if there is no task found. 
	Tasks: {ScheduledTask}?,
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
--- the user's current inventory, and so will not be not included. There can be 
--- a delay of up to a half a second for inventory changes to be reflected in the 
--- GetUserInventory API response. 
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

export type GrantItemSegmentAction = {
	--- Item catalog id. 
	CatelogId: string?,
	--- Item id. 
	ItemId: string?,
	--- Item quantity. 
	Quantity: number,
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

export type GrantVirtualCurrencySegmentAction = {
	--- Virtual currency amount. 
	Amount: number,
	--- Virtual currency code. 
	CurrencyCode: string?,
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

--- This operation will increment the global counter for the number of these items 
--- available. This number cannot be decremented, except by actual grants. 
export type IncrementLimitedEditionItemAvailabilityRequest = {
	--- Amount to increase availability by. 
	Amount: number,
	--- Which catalog is being updated. If null, uses the default catalog. 
	CatalogVersion: string?,
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The item which needs more availability. 
	ItemId: string,
}

export type IncrementLimitedEditionItemAvailabilityResult = {
}

export type IncrementPlayerStatisticSegmentAction = {
	--- Increment value. 
	IncrementValue: number,
	--- Statistic name. 
	StatisticName: string?,
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
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- unique name of the statistic 
	StatisticName: string?,
}

export type IncrementPlayerStatisticVersionResult = {
	--- version change history of the statistic 
	StatisticVersion: PlayerStatisticVersion?,
}

export type InsightsScalingTaskParameter = {
	--- Insights Performance Level to scale to. 
	Level: number,
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

export type LastLoginDateSegmentFilter = {
	--- Last player login date comparison. 
	Comparison: string?,
	--- Last player login date. 
	LogInDate: string,
}

export type LastLoginTimespanSegmentFilter = {
	--- Last player login duration comparison. 
	Comparison: string?,
	--- Last player login duration. 
	DurationInMinutes: number,
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

export type LinkedUserAccountHasEmailSegmentFilter = {
	--- Login provider comparison. 
	Comparison: string?,
	--- Login provider. 
	LoginProvider: string?,
}

export type LinkedUserAccountSegmentFilter = {
	--- Login provider. 
	LoginProvider: string?,
}

export type ListOpenIdConnectionRequest = {
}

export type ListOpenIdConnectionResponse = {
	--- The list of Open ID Connections 
	Connections: {OpenIdConnection}?,
}

export type ListVirtualCurrencyTypesRequest = {
}

export type ListVirtualCurrencyTypesResult = {
	--- List of virtual currency names defined for this title 
	VirtualCurrencies: {VirtualCurrencyData}?,
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

export type LocationSegmentFilter = {
	--- Segment country code. 
	CountryCode: string?,
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

--- This API allows for access to details regarding a user in the PlayFab service, 
--- usually for purposes of customer support. Note that data returned may be Personally 
--- Identifying Information (PII), such as email address, and so care should be 
--- taken in how this data is stored and managed. Since this call will always return 
--- the relevant information for users who have accessed the title, the recommendation 
--- is to not store this data locally. 
export type LookupUserAccountInfoRequest = {
	--- User email address attached to their account 
	Email: string?,
	--- Unique PlayFab assigned ID of the user on whom the operation will be performed. 
	PlayFabId: string?,
	--- Title specific username to match against existing user accounts 
	TitleDisplayName: string?,
	--- PlayFab username for the account (3-20 characters) 
	Username: string?,
}

export type LookupUserAccountInfoResult = {
	--- User info for the user matching the request 
	UserInfo: UserAccountInfo?,
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

export type ModifyServerBuildRequest = {
	--- array of regions where this build can used, when it is active 
	ActiveRegions: {Region}?,
	--- unique identifier of the previously uploaded build executable to be updated 
	BuildId: string,
	--- appended to the end of the command line when starting game servers 
	CommandLineTemplate: string?,
	--- developer comment(s) for this build 
	Comment: string?,
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- path to the game server executable. Defaults to gameserver.exe 
	ExecutablePath: string?,
	--- maximum number of game server instances that can run on a single host machine 
	MaxGamesPerHost: number,
	--- minimum capacity of additional game server instances that can be started before 
	--- the autoscaling service starts new host machines (given the number of current 
	--- running host machines and game server instances) 
	MinFreeGameSlots: number,
	--- new timestamp 
	Timestamp: string?,
}

export type ModifyServerBuildResult = {
	--- array of regions where this build can used, when it is active 
	ActiveRegions: {Region}?,
	--- unique identifier for this build executable 
	BuildId: string?,
	--- appended to the end of the command line when starting game servers 
	CommandLineTemplate: string?,
	--- developer comment(s) for this build 
	Comment: string?,
	--- path to the game server executable. Defaults to gameserver.exe 
	ExecutablePath: string?,
	--- maximum number of game server instances that can run on a single host machine 
	MaxGamesPerHost: number,
	--- minimum capacity of additional game server instances that can be started before 
	--- the autoscaling service starts new host machines (given the number of current 
	--- running host machines and game server instances) 
	MinFreeGameSlots: number,
	--- the current status of the build validation and processing steps 
	Status: string?,
	--- time this build was last modified (or uploaded, if this build has never been 
	--- modified) 
	Timestamp: string,
	--- Unique identifier for the title, found in the Settings > Game Properties section 
	--- of the PlayFab developer site when a title has been selected. 
	TitleId: string?,
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

--- Identifier by either name or ID. Note that a name may change due to renaming, 
--- or reused after being deleted. ID is immutable and unique. 
export type NameIdentifier = {
	--- Id Identifier, if present 
	Id: string?,
	--- Name Identifier, if present 
	Name: string?,
}

export type OpenIdConnection = {
	--- The client ID given by the ID provider. 
	ClientId: string?,
	--- The client secret given by the ID provider. 
	ClientSecret: string?,
	--- A name for the connection to identify it within the title. 
	ConnectionId: string?,
	--- Shows if data about the connection will be loaded from the issuer's discovery 
	--- document 
	DiscoverConfiguration: boolean,
	--- Information for an OpenID Connect provider. 
	IssuerInformation: OpenIdIssuerInformation?,
}

export type OpenIdIssuerInformation = {
	--- Authorization endpoint URL to direct users to for signin. 
	AuthorizationUrl: string,
	--- The URL of the issuer of the tokens. This must match the exact URL of the issuer 
	--- field in tokens. 
	Issuer: string,
	--- JSON Web Key Set for validating the signature of tokens. 
	JsonWebKeySet: {[any]: any},
	--- Token endpoint URL for code verification. 
	TokenUrl: string,
}

export type PermissionStatement = {
	--- The action this statement effects. The only supported action is 'Execute'. 
	Action: string,
	--- Additional conditions to be applied for API Resources. 
	ApiConditions: ApiCondition?,
	--- A comment about the statement. Intended solely for bookkeeping and debugging. 
	Comment: string?,
	--- The effect this statement will have. It could be either Allow or Deny 
	Effect: string,
	--- The principal this statement will effect. The only supported principal is '*'. 
	Principal: string,
	--- The resource this statements effects. The only supported resources look like 
	--- 'pfrn:api--*' for all apis, or 'pfrn:api--/Client/ConfirmPurchase' for specific 
	--- apis. 
	Resource: string,
}

export type PlayerChurnPredictionSegmentFilter = {
	--- Comparison 
	Comparison: string?,
	--- RiskLevel 
	RiskLevel: string?,
}

export type PlayerChurnPredictionTimeSegmentFilter = {
	--- Comparison 
	Comparison: string?,
	--- DurationInDays 
	DurationInDays: number,
}

export type PlayerChurnPreviousPredictionSegmentFilter = {
	--- Comparison 
	Comparison: string?,
	--- RiskLevel 
	RiskLevel: string?,
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

export type PlayerStatisticDefinition = {
	--- the aggregation method to use in updating the statistic (defaults to last) 
	AggregationMethod: string?,
	--- current active version of the statistic, incremented each time the statistic 
	--- resets 
	CurrentVersion: number,
	--- unique name of the statistic 
	StatisticName: string?,
	--- interval at which the values of the statistic for all players are reset automatically 
	VersionChangeInterval: string?,
}

export type PlayerStatisticVersion = {
	--- time when the statistic version became active 
	ActivationTime: string,
	--- URL for the downloadable archive of player statistic values, if available 
	ArchiveDownloadUrl: string?,
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
	--- status of the statistic version 
	Status: string?,
	--- version of the statistic 
	Version: number,
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

export type PushNotificationSegmentAction = {
	--- Push notification template id. 
	PushNotificationTemplateId: string?,
}

export type PushNotificationSegmentFilter = {
	--- Push notification device platform. 
	PushNotificationDevicePlatform: string?,
}

export type PushSetupPlatform = 
	"GCM"
	| "APNS"
	| "APNS_SANDBOX"

export type RandomResultTable = {
	--- Child nodes that indicate what kind of drop table item this actually is. 
	Nodes: {ResultTableNode},
	--- Unique name for this drop table 
	TableId: string,
}

export type RandomResultTableListing = {
	--- Catalog version this table is associated with 
	CatalogVersion: string?,
	--- Child nodes that indicate what kind of drop table item this actually is. 
	Nodes: {ResultTableNode},
	--- Unique name for this drop table 
	TableId: string,
}

export type RefundPurchaseRequest = {
	--- Unique order ID for the purchase in question. 
	OrderId: string,
	--- Unique PlayFab assigned ID of the user on whom the operation will be performed. 
	PlayFabId: string,
	--- The Reason parameter should correspond with the payment providers reason field, 
	--- if they require one such as Facebook. In the case of Facebook this must match 
	--- one of their refund or dispute resolution enums (See: https://developers.facebook.com/docs/payments/implementation-guide/handling-disputes-refunds) 
	Reason: string?,
}

export type RefundPurchaseResponse = {
	--- The order's updated purchase status. 
	PurchaseStatus: string?,
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

--- Virtual currencies to be removed cannot have entries in any catalog nor store 
--- for the title. Note that this operation will not remove player balances for 
--- the removed currencies; if a deleted currency is recreated at any point, user 
--- balances will be in an undefined state. 
export type RemoveVirtualCurrencyTypesRequest = {
	--- List of virtual currencies to delete 
	VirtualCurrencies: {VirtualCurrencyData},
}

--- Note that this action cannot be un-done. All statistics for this character will 
--- be deleted, removing the user from all leaderboards for the game. 
export type ResetCharacterStatisticsRequest = {
	--- Unique PlayFab assigned ID for a specific character owned by a user 
	CharacterId: string,
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- Unique PlayFab assigned ID of the user on whom the operation will be performed. 
	PlayFabId: string,
}

export type ResetCharacterStatisticsResult = {
}

--- Resets a player's password taking in a new password based and validating the 
--- user based off of a token sent to the playerto their email. The token expires 
--- after 30 minutes. 
export type ResetPasswordRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The new password for the player. 
	Password: string,
	--- The token of the player requesting the password reset. 
	Token: string,
}

export type ResetPasswordResult = {
}

--- Note that this action cannot be un-done. All statistics for this user will be 
--- deleted, removing the user from all leaderboards for the game. 
export type ResetUserStatisticsRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- Unique PlayFab assigned ID of the user on whom the operation will be performed. 
	PlayFabId: string,
}

export type ResetUserStatisticsResult = {
}

export type ResolutionOutcome = 
	"Revoke"
	| "Reinstate"
	| "Manual"

export type ResolvePurchaseDisputeRequest = {
	--- Unique order ID for the purchase in question. 
	OrderId: string,
	--- Enum for the desired purchase result state after notifying the payment provider. 
	--- Valid values are Revoke, Reinstate and Manual. Manual will cause no change to 
	--- the order state. 
	Outcome: string,
	--- Unique PlayFab assigned ID of the user on whom the operation will be performed. 
	PlayFabId: string,
	--- The Reason parameter should correspond with the payment providers reason field, 
	--- if they require one such as Facebook. In the case of Facebook this must match 
	--- one of their refund or dispute resolution enums (See: https://developers.facebook.com/docs/payments/implementation-guide/handling-disputes-refunds) 
	Reason: string?,
}

export type ResolvePurchaseDisputeResponse = {
	--- The order's updated purchase status. 
	PurchaseStatus: string?,
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

--- The returned task instance ID can be used to query for task execution status. 
export type RunTaskRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- Provide either the task ID or the task name to run a task. 
	Identifier: NameIdentifier?,
}

export type RunTaskResult = {
	--- ID of the task instance that is started. This can be used in Get*TaskInstance 
	--- (e.g. GetCloudScriptTaskInstance) API call to retrieve status for the task instance. 
	TaskInstanceId: string?,
}

export type ScheduledTask = {
	--- Description the task 
	Description: string?,
	--- Whether the schedule is active. Inactive schedule will not trigger task execution. 
	IsActive: boolean,
	--- UTC time of last run 
	LastRunTime: string?,
	--- Name of the task. This is a unique identifier for tasks in the title. 
	Name: string,
	--- UTC time of next run 
	NextRunTime: string?,
	--- Task parameter. Different types of task have different parameter structure. 
	--- See each task type's create API documentation for the details. 
	Parameter: {[any]: any}?,
	--- Cron expression for the run schedule of the task. The expression should be in 
	--- UTC. 
	Schedule: string?,
	--- ID of the task 
	TaskId: string?,
	--- Task type. 
	Type: string?,
}

export type ScheduledTaskType = 
	"CloudScript"
	| "ActionsOnPlayerSegment"
	| "CloudScriptAzureFunctions"
	| "InsightsScheduledScaling"

export type ScriptExecutionError = {
	--- Error code, such as CloudScriptNotFound, JavascriptException, CloudScriptFunctionArgumentSizeExceeded, 
	--- CloudScriptAPIRequestCountExceeded, CloudScriptAPIRequestError, or CloudScriptHTTPRequestError 
	Error: string?,
	--- Details about the error 
	Message: string?,
	--- Point during the execution of the script at which the error occurred, if any 
	StackTrace: string?,
}

export type SegmentAndDefinition = {
	--- Filter property for ad campaign filter. 
	AdCampaignFilter: AdCampaignSegmentFilter?,
	--- property for all player filter. 
	AllPlayersFilter: AllPlayersSegmentFilter?,
	--- Filter property for first login date. 
	FirstLoginDateFilter: FirstLoginDateSegmentFilter?,
	--- Filter property for first login timespan. 
	FirstLoginFilter: FirstLoginTimespanSegmentFilter?,
	--- Filter property for last login date. 
	LastLoginDateFilter: LastLoginDateSegmentFilter?,
	--- Filter property for last login timespan. 
	LastLoginFilter: LastLoginTimespanSegmentFilter?,
	--- Filter property for linked in user account. 
	LinkedUserAccountFilter: LinkedUserAccountSegmentFilter?,
	--- Filter property for linked in user account has email. 
	LinkedUserAccountHasEmailFilter: LinkedUserAccountHasEmailSegmentFilter?,
	--- Filter property for location. 
	LocationFilter: LocationSegmentFilter?,
	--- Filter property for current player churn value. 
	PlayerChurnPredictionFilter: PlayerChurnPredictionSegmentFilter?,
	--- Filter property for player churn timespan. 
	PlayerChurnPredictionTimeFilter: PlayerChurnPredictionTimeSegmentFilter?,
	--- Filter property for previous player churn value. 
	PlayerChurnPreviousPredictionFilter: PlayerChurnPreviousPredictionSegmentFilter?,
	--- Filter property for push notification. 
	PushNotificationFilter: PushNotificationSegmentFilter?,
	--- Filter property for statistics. 
	StatisticFilter: StatisticSegmentFilter?,
	--- Filter property for tags. 
	TagFilter: TagSegmentFilter?,
	--- Filter property for total value to date in USD. 
	TotalValueToDateInUSDFilter: TotalValueToDateInUSDSegmentFilter?,
	--- Filter property for user origination. 
	UserOriginationFilter: UserOriginationSegmentFilter?,
	--- Filter property for value to date. 
	ValueToDateFilter: ValueToDateSegmentFilter?,
	--- Filter property for virtual currency. 
	VirtualCurrencyBalanceFilter: VirtualCurrencyBalanceSegmentFilter?,
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
	--- Segment description. 
	Description: string?,
	--- Segment actions for current entered segment players. 
	EnteredSegmentActions: {SegmentTrigger}?,
	--- Segment last updated date time. 
	LastUpdateTime: string,
	--- Segment actions for current left segment players. 
	LeftSegmentActions: {SegmentTrigger}?,
	--- Segment name. 
	Name: string?,
	--- Segment id in hex. 
	SegmentId: string?,
	--- Segment or definitions. This includes segment and definitions and filters. 
	SegmentOrDefinitions: {SegmentOrDefinition}?,
}

export type SegmentOrDefinition = {
	--- List of segment and definitions. 
	SegmentAndDefinitions: {SegmentAndDefinition}?,
}

export type SegmentPushNotificationDevicePlatform = 
	"ApplePushNotificationService"
	| "GoogleCloudMessaging"

export type SegmentTrigger = {
	--- Ban player segment trigger action. 
	BanPlayerAction: BanPlayerSegmentAction?,
	--- Delete player segment trigger action. 
	DeletePlayerAction: DeletePlayerSegmentAction?,
	--- Delete player statistic segment trigger action. 
	DeletePlayerStatisticAction: DeletePlayerStatisticSegmentAction?,
	--- Email notification segment trigger action. 
	EmailNotificationAction: EmailNotificationSegmentAction?,
	--- Execute azure function segment trigger action. 
	ExecuteAzureFunctionAction: ExecuteAzureFunctionSegmentAction?,
	--- Execute cloud script segment trigger action. 
	ExecuteCloudScriptAction: ExecuteCloudScriptSegmentAction?,
	--- Grant item segment trigger action. 
	GrantItemAction: GrantItemSegmentAction?,
	--- Grant virtual currency segment trigger action. 
	GrantVirtualCurrencyAction: GrantVirtualCurrencySegmentAction?,
	--- Increment player statistic segment trigger action. 
	IncrementPlayerStatisticAction: IncrementPlayerStatisticSegmentAction?,
	--- Push notification segment trigger action. 
	PushNotificationAction: PushNotificationSegmentAction?,
}

--- If the account in question is a "temporary" account (for example, one that was 
--- created via a call to LoginFromIOSDeviceID), thisfunction will have no effect. 
--- Only PlayFab accounts which have valid email addresses will be able to receive 
--- a password reset email using this API. 
export type SendAccountRecoveryEmailRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- User email address attached to their account 
	Email: string,
	--- The email template id of the account recovery email template to send. 
	EmailTemplateId: string?,
}

export type SendAccountRecoveryEmailResult = {
}

--- This API lets developers set overrides for membership expirations, independent 
--- of any subscriptions setting it. 
export type SetMembershipOverrideRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- Expiration time for the membership in DateTime format, will override any subscription 
	--- expirations. 
	ExpirationTime: string,
	--- Id of the membership to apply the override expiration date to. 
	MembershipId: string,
	--- Unique PlayFab assigned ID of the user on whom the operation will be performed. 
	PlayFabId: string,
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
	--- Unique PlayFab assigned ID of the user on whom the operation will be performed. 
	PlayFabId: string,
	--- Player secret that is used to verify API request signatures (Enterprise Only). 
	PlayerSecret: string?,
}

export type SetPlayerSecretResult = {
}

export type SetPublishedRevisionRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- Revision to make the current published revision 
	Revision: number,
	--- Version number 
	Version: number,
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
	--- key we want to set a value on (note, this is additive - will only replace an 
	--- existing key's value if they are the same name.) Keys are trimmed of whitespace. 
	--- Keys may not begin with the '!' character. 
	Key: string,
	--- new value to set. Set to null to remove a value 
	Value: string?,
}

export type SetPublisherDataResult = {
}

--- Will set the given key values in the specified override or the primary title 
--- data based on whether the label is provided or not. 
export type SetTitleDataAndOverridesRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- List of titleData key-value pairs to set/delete. Use an empty value to delete 
	--- an existing key; use a non-empty value to create/update a key. 
	KeyValues: {TitleDataKeyValue},
	--- Name of the override. 
	OverrideLabel: string?,
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

--- When using the Apple Push Notification service (APNS) or the development version 
--- (APNS_SANDBOX), the APNS Private Key should be used as the Credential in this 
--- call. With Google Cloud Messaging (GCM), the Android API Key should be used. 
--- The current ARN (if one exists) can be overwritten by setting the OverwriteOldARN 
--- boolean to true. 
export type SetupPushNotificationRequest = {
	--- Credential is the Private Key for APNS/APNS_SANDBOX, and the API Key for GCM 
	Credential: string,
	--- for APNS, this is the PlatformPrincipal (SSL Certificate) 
	Key: string?,
	--- This field is deprecated and any usage of this will cause the API to fail. 
	Name: string?,
	--- replace any existing ARN with the newly generated one. If this is set to false, 
	--- an error will be returned if notifications have already setup for this platform. 
	OverwriteOldARN: boolean,
	--- supported notification platforms are Apple Push Notification Service (APNS and 
	--- APNS_SANDBOX) for iOS and Google Cloud Messaging (GCM) for Android 
	Platform: string,
}

export type SetupPushNotificationResult = {
	--- Amazon Resource Name for the created notification topic. 
	ARN: string?,
}

export type SharedSecret = {
	--- Flag to indicate if this key is disabled 
	Disabled: boolean,
	--- Friendly name for this key 
	FriendlyName: string?,
	--- The player shared secret to use when calling Client/GetTitlePublicKey 
	SecretKey: string?,
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
	--- Statistic name 
	Name: string?,
	--- Statistic value 
	Value: number,
	--- Statistic version (0 if not a versioned statistic) 
	Version: number,
}

export type StatisticResetIntervalOption = 
	"Never"
	| "Hour"
	| "Day"
	| "Week"
	| "Month"

export type StatisticSegmentFilter = {
	--- Statistic filter comparison. 
	Comparison: string?,
	--- Statistic filter value. 
	FilterValue: string?,
	--- Statistic name. 
	Name: string?,
	--- Use current version of statistic? 
	UseCurrentVersion: boolean?,
	--- Statistic version. 
	Version: number?,
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

export type TagSegmentFilter = {
	--- Tag comparison. 
	Comparison: string?,
	--- Tag value. 
	TagValue: string?,
}

export type TaskInstanceBasicSummary = {
	--- UTC timestamp when the task completed. 
	CompletedAt: string?,
	--- Error message for last processing attempt, if an error occured. 
	ErrorMessage: string?,
	--- Estimated time remaining in seconds. 
	EstimatedSecondsRemaining: number?,
	--- Progress represented as percentage. 
	PercentComplete: number?,
	--- If manually scheduled, ID of user who scheduled the task. 
	ScheduledByUserId: string?,
	--- UTC timestamp when the task started. 
	StartedAt: string,
	--- Current status of the task instance. 
	Status: string?,
	--- Identifier of the task this instance belongs to. 
	TaskIdentifier: NameIdentifier?,
	--- ID of the task instance. 
	TaskInstanceId: string?,
	--- Type of the task. 
	Type: string?,
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
	--- Key we want to set a value on (note, this is additive - will only replace an 
	--- existing key's value if they are the same name.) Keys are trimmed of whitespace. 
	--- Keys may not begin with the '!' character. 
	Key: string?,
	--- New value to set. Set to null to remove a value 
	Value: string?,
}

export type TotalValueToDateInUSDSegmentFilter = {
	--- Total value to date USD amount. 
	Amount: string?,
	--- Total value to date USD comparison. 
	Comparison: string?,
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

--- When used for SetCatalogItems, this operation is not additive. Using it will 
--- cause the indicated catalog version to be created from scratch. If there is 
--- an existing catalog with the version number in question, it will be deleted 
--- and replaced with only the items specified in this call. When used for UpdateCatalogItems, 
--- this operation is additive. Items with ItemId values not currently in the catalog 
--- will be added, while those with ItemId values matching items currently in the 
--- catalog will overwrite those items with the given values. 
export type UpdateCatalogItemsRequest = {
	--- Array of catalog items to be submitted. Note that while CatalogItem has a parameter 
	--- for CatalogVersion, it is not required and ignored in this call. 
	Catalog: {CatalogItem}?,
	--- Which catalog is being updated. If null, uses the default catalog. 
	CatalogVersion: string?,
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- Should this catalog be set as the default catalog. Defaults to true. If there 
	--- is currently no default catalog, this will always set it. 
	SetAsDefaultCatalog: boolean?,
}

export type UpdateCatalogItemsResult = {
}

export type UpdateCloudScriptRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- PlayFab user ID of the developer initiating the request. 
	DeveloperPlayFabId: string?,
	--- List of Cloud Script files to upload to create the new revision. Must have at 
	--- least one file. 
	Files: {CloudScriptFile},
	--- Immediately publish the new revision 
	Publish: boolean,
}

export type UpdateCloudScriptResult = {
	--- New revision number created 
	Revision: number,
	--- Cloud Script version updated 
	Version: number,
}

export type UpdateOpenIdConnectionRequest = {
	--- The client ID given by the ID provider. 
	ClientId: string?,
	--- The client secret given by the ID provider. 
	ClientSecret: string?,
	--- A name for the connection that identifies it within the title. 
	ConnectionId: string,
	--- The issuer URL or discovery document URL to read issuer information from 
	IssuerDiscoveryUrl: string?,
	--- Manually specified information for an OpenID Connect issuer. 
	IssuerInformation: OpenIdIssuerInformation?,
}

--- Player Shared Secret Keys are used for the call to Client/GetTitlePublicKey, 
--- which exchanges the shared secret for an RSA CSP blob to be used to encrypt 
--- the payload of account creation requests when that API requires a signature 
--- header. 
export type UpdatePlayerSharedSecretRequest = {
	--- Disable or Enable this key 
	Disabled: boolean,
	--- Friendly name for this key 
	FriendlyName: string?,
	--- The shared secret key to update 
	SecretKey: string?,
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
	--- the aggregation method to use in updating the statistic (defaults to last) 
	AggregationMethod: string?,
	--- unique name of the statistic 
	StatisticName: string,
	--- interval at which the values of the statistic for all players are reset (changes 
	--- are effective at the next occurance of the new interval boundary) 
	VersionChangeInterval: string?,
}

export type UpdatePlayerStatisticDefinitionResult = {
	--- updated statistic definition 
	Statistic: PlayerStatisticDefinition?,
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
	--- Whether to overwrite or append to the existing policy. 
	OverwritePolicy: boolean,
	--- The name of the policy being updated. Only supported name is 'ApiPolicy' 
	PolicyName: string,
	--- Version of the policy to update. Must be the latest (as returned by GetPolicy). 
	PolicyVersion: number,
	--- The new statements to include in the policy. 
	Statements: {PermissionStatement},
}

export type UpdatePolicyResponse = {
	--- The name of the policy that was updated. 
	PolicyName: string?,
	--- The statements included in the new version of the policy. 
	Statements: {PermissionStatement}?,
}

--- This operation is additive. Tables with TableId values not currently defined 
--- will be added, while those with TableId values matching Tables currently in 
--- the catalog will be overwritten with the given values. 
export type UpdateRandomResultTablesRequest = {
	--- which catalog is being updated. If null, update the current default catalog 
	--- version 
	CatalogVersion: string?,
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- array of random result tables to make available (Note: specifying an existing 
	--- TableId will result in overwriting that table, while any others will be added 
	--- to the available set) 
	Tables: {RandomResultTable}?,
}

export type UpdateRandomResultTablesResult = {
}

--- Update segment properties data which are planning to update 
export type UpdateSegmentRequest = {
	--- Segment model with all of the segment properties data. 
	SegmentModel: SegmentModel,
}

export type UpdateSegmentResponse = {
	--- Error message. 
	ErrorMessage: string?,
	--- Segment id. 
	SegmentId: string?,
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
	--- Catalog version of the store to update. If null, uses the default catalog. 
	CatalogVersion: string?,
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- Additional data about the store 
	MarketingData: StoreMarketingModel?,
	--- Array of store items - references to catalog items, with specific pricing - 
	--- to be added 
	Store: {StoreItem}?,
	--- Unique identifier for the store which is to be updated 
	StoreId: string,
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
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- Description the task 
	Description: string?,
	--- Specify either the task ID or the name of the task to be updated. 
	Identifier: NameIdentifier?,
	--- Whether the schedule is active. Inactive schedule will not trigger task execution. 
	IsActive: boolean,
	--- Name of the task. This is a unique identifier for tasks in the title. 
	Name: string,
	--- Parameter object specific to the task type. See each task type's create API 
	--- documentation for details. 
	Parameter: {[any]: any}?,
	--- Cron expression for the run schedule of the task. The expression should be in 
	--- UTC. 
	Schedule: string?,
	--- Task type. 
	Type: string,
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

--- In addition to the PlayFab username, titles can make use of a DisplayName which 
--- is also a unique identifier, but specific to the title. This allows for unique 
--- names which more closely match the theme or genre of a title, for example. This 
--- API enables changing that name, whether due to a customer request, an offensive 
--- name choice, etc. 
export type UpdateUserTitleDisplayNameRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- New title display name for the user - must be between 3 and 25 characters 
	DisplayName: string,
	--- PlayFab unique identifier of the user whose title specific display name is to 
	--- be changed 
	PlayFabId: string,
}

export type UpdateUserTitleDisplayNameResult = {
	--- current title display name for the user (this will be the original display name 
	--- if the rename attempt failed) 
	DisplayName: string?,
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

export type UserOriginationSegmentFilter = {
	--- User login provider. 
	LoginProvider: string?,
}

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

export type ValueToDateSegmentFilter = {
	--- Value to date amount. 
	Amount: string?,
	--- Value to date comparison. 
	Comparison: string?,
	--- Currency using for filter. 
	Currency: string?,
}

export type VirtualCurrencyBalanceSegmentFilter = {
	--- Total amount. 
	Amount: number,
	--- Amount comparison. 
	Comparison: string?,
	--- Currency code. 
	CurrencyCode: string?,
}

export type VirtualCurrencyData = {
	--- unique two-character identifier for this currency type (e.g.: "CC") 
	CurrencyCode: string,
	--- friendly name to show in the developer portal, reports, etc. 
	DisplayName: string?,
	--- amount to automatically grant users upon first login to the title 
	InitialDeposit: number?,
	--- maximum amount to which the currency will recharge (cannot exceed MaxAmount, 
	--- but can be less) 
	RechargeMax: number?,
	--- rate at which the currency automatically be added to over time, in units per 
	--- day (24 hours) 
	RechargeRate: number?,
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


--- If the task instance has already completed, there will be no-op. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/scheduledtask/aborttaskinstance
function AdminApi.AbortTaskInstanceAsync(
	secretKey: string, 
	request: AbortTaskInstanceRequest
): EmptyResponse
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
): AddLocalizedNewsResult
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
): AddNewsResult
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
): AddPlayerTagResult
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
): ModifyUserVirtualCurrencyResult
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
): BlankResult
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
): BanUsersResult
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
): CheckLimitedEditionItemAvailabilityResult
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
): CreateTaskResult
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
): CreateTaskResult
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
): CreateTaskResult
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
): EmptyResponse
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
): CreatePlayerSharedSecretResult
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
): CreatePlayerStatisticDefinitionResult
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
): CreateSegmentResponse
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
): BlankResult
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
): DeleteMasterPlayerAccountResult
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
): DeleteMembershipSubscriptionResult
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
): EmptyResponse
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
): DeletePlayerResult
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
): DeletePlayerSharedSecretResult
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
): DeleteSegmentsResponse
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
): DeleteStoreResult
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
): EmptyResponse
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
): DeleteTitleResult
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
): DeleteTitleDataOverrideResult
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
): ExportMasterPlayerDataResult
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
): ExportPlayersInSegmentResult
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
): GetActionsOnPlayersInSegmentTaskInstanceResult
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
): GetAllSegmentsResult
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
): GetCatalogItemsResult
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
): GetCloudScriptRevisionResult
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
): GetCloudScriptTaskInstanceResult
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
): GetCloudScriptVersionsResult
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
): GetContentListResult
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
): GetContentUploadUrlResult
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
): GetDataReportResult
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
): GetMatchmakerGameInfoResult
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
): GetMatchmakerGameModesResult
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
): GetPlayedTitleListResult
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
): GetPlayerIdFromAuthTokenResult
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
): GetPlayerProfileResult
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
): GetPlayerSegmentsResult
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
): GetPlayerSharedSecretsResult
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
): GetPlayerStatisticDefinitionsResult
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
): GetPlayerStatisticVersionsResult
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
): GetPlayerTagsResult
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
): GetPlayersInSegmentResult
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
): GetPolicyResponse
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
): GetPublisherDataResult
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
): GetRandomResultTablesResult
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
): GetPlayersInSegmentExportResponse
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
): GetSegmentsResponse
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
): GetStoreItemsResult
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
): GetTaskInstancesResult
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
): GetTasksResult
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
): GetTitleDataResult
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
): GetTitleDataResult
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
): LookupUserAccountInfoResult
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
): GetUserBansResult
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
): GetUserDataResult
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
): GetUserDataResult
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
): GetUserInventoryResult
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
): GetUserDataResult
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
): GetUserDataResult
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
): GetUserDataResult
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
): GetUserDataResult
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
): GrantItemsToUsersResult
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
): IncrementLimitedEditionItemAvailabilityResult
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
): IncrementPlayerStatisticVersionResult
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
): ListOpenIdConnectionResponse
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
): ListVirtualCurrencyTypesResult
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
): ModifyServerBuildResult
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
): RefundPurchaseResponse
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
): RemovePlayerTagResult
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
): BlankResult
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
): ResetCharacterStatisticsResult
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
): ResetPasswordResult
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
): ResetUserStatisticsResult
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
): ResolvePurchaseDisputeResponse
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
): RevokeAllBansForUserResult
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
): RevokeBansResult
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
): RevokeInventoryResult
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
): RevokeInventoryItemsResult
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
): RunTaskResult
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
): SendAccountRecoveryEmailResult
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
): UpdateCatalogItemsResult
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
): SetMembershipOverrideResult
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
): SetPlayerSecretResult
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
): SetPublishedRevisionResult
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
): SetPublisherDataResult
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
): UpdateStoreItemsResult
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
): SetTitleDataResult
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
): SetTitleDataAndOverridesResult
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
): SetTitleDataResult
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
): SetupPushNotificationResult
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
): ModifyUserVirtualCurrencyResult
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
): UpdateBansResult
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
): UpdateCatalogItemsResult
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
): UpdateCloudScriptResult
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
): EmptyResponse
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
): UpdatePlayerSharedSecretResult
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
): UpdatePlayerStatisticDefinitionResult
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
): UpdatePolicyResponse
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
): UpdateRandomResultTablesResult
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
): UpdateSegmentResponse
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
): UpdateStoreItemsResult
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
): EmptyResponse
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
): UpdateUserDataResult
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
): UpdateUserDataResult
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
): UpdateUserDataResult
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
): UpdateUserDataResult
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
): UpdateUserDataResult
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
): UpdateUserDataResult
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
): UpdateUserTitleDisplayNameResult
	return PlayFabInternal.MakeApiCall(
		"/Admin/UpdateUserTitleDisplayName",
		request,
		"X-SecretKey",
		secretKey
	)
end

return AdminApi

