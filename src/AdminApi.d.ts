interface AbortTaskInstanceRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // ID of a task instance that is being aborted.
    TaskInstanceId: string;
}

interface ActionsOnPlayersInSegmentTaskParameter {
    // ID of the action to perform on each player in segment.
    ActionId: string;
    // ID of the segment to perform actions on.
    SegmentId: string;
}

interface ActionsOnPlayersInSegmentTaskSummary {
    // UTC timestamp when the task completed.
    CompletedAt?: string;
    // Error message for last processing attempt, if an error occured.
    ErrorMessage?: string;
    // Flag indicating if the error was fatal, if false job will be retried.
    ErrorWasFatal?: boolean;
    // Estimated time remaining in seconds.
    EstimatedSecondsRemaining?: number;
    // Progress represented as percentage.
    PercentComplete?: number;
    // If manually scheduled, ID of user who scheduled the task.
    ScheduledByUserId?: string;
    // UTC timestamp when the task started.
    StartedAt: string;
    // Current status of the task instance.
    Status?: string;
    // Identifier of the task this instance belongs to.
    TaskIdentifier?: NameIdentifier;
    // ID of the task instance.
    TaskInstanceId?: string;
    // Total players in segment when task was started.
    TotalPlayersInSegment?: number;
    // Total number of players that have had the actions applied to.
    TotalPlayersProcessed?: number;
}

interface AdCampaignAttribution {
    // UTC time stamp of attribution
    AttributedAt: string;
    // Attribution campaign identifier
    CampaignId?: string;
    // Attribution network name
    Platform?: string;
}

interface AdCampaignAttributionModel {
    // UTC time stamp of attribution
    AttributedAt: string;
    // Attribution campaign identifier
    CampaignId?: string;
    // Attribution network name
    Platform?: string;
}

interface AddLocalizedNewsRequest extends PlayFabModule.IPlayFabRequestCommon {
    // Localized body text of the news.
    Body: string;
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // Language of the news item.
    Language: string;
    // Unique id of the updated news item.
    NewsId: string;
    // Localized title (headline) of the news item.
    Title: string;
}

interface AddLocalizedNewsResult extends PlayFabModule.IPlayFabResultCommon {}

interface AddNewsRequest extends PlayFabModule.IPlayFabRequestCommon {
    // Default body text of the news.
    Body: string;
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // Time this news was published. If not set, defaults to now.
    Timestamp?: string;
    // Default title (headline) of the news item.
    Title: string;
}

interface AddNewsResult extends PlayFabModule.IPlayFabResultCommon {
    // Unique id of the new news item
    NewsId?: string;
}

interface AddPlayerTagRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // Unique PlayFab assigned ID of the user on whom the operation will be performed.
    PlayFabId: string;
    // Unique tag for player profile.
    TagName: string;
}

interface AddPlayerTagResult extends PlayFabModule.IPlayFabResultCommon {}

interface AddServerBuildRequest extends PlayFabModule.IPlayFabRequestCommon {
    // server host regions in which this build should be running and available
    ActiveRegions?: string[];
    // unique identifier for the build executable
    BuildId: string;
    // appended to the end of the command line when starting game servers
    CommandLineTemplate?: string;
    // developer comment(s) for this build
    Comment?: string;
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // path to the game server executable. Defaults to gameserver.exe
    ExecutablePath?: string;
    // maximum number of game server instances that can run on a single host machine
    MaxGamesPerHost: number;
    // minimum capacity of additional game server instances that can be started before the autoscaling service starts new host
    // machines (given the number of current running host machines and game server instances)
    MinFreeGameSlots: number;
}

interface AddServerBuildResult extends PlayFabModule.IPlayFabResultCommon {
    // array of regions where this build can used, when it is active
    ActiveRegions?: string[];
    // unique identifier for this build executable
    BuildId?: string;
    // appended to the end of the command line when starting game servers
    CommandLineTemplate?: string;
    // developer comment(s) for this build
    Comment?: string;
    // path to the game server executable. Defaults to gameserver.exe
    ExecutablePath?: string;
    // maximum number of game server instances that can run on a single host machine
    MaxGamesPerHost: number;
    // minimum capacity of additional game server instances that can be started before the autoscaling service starts new host
    // machines (given the number of current running host machines and game server instances)
    MinFreeGameSlots: number;
    // the current status of the build validation and processing steps
    Status?: string;
    // time this build was last modified (or uploaded, if this build has never been modified)
    Timestamp: string;
    // Unique identifier for the title, found in the Settings > Game Properties section of the PlayFab developer site when a
    // title has been selected.
    TitleId?: string;
}

interface AddUserVirtualCurrencyRequest extends PlayFabModule.IPlayFabRequestCommon {
    // Amount to be added to the user balance of the specified virtual currency. Maximum VC balance is Int32 (2,147,483,647).
    // Any increase over this value will be discarded.
    Amount: number;
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // PlayFab unique identifier of the user whose virtual currency balance is to be increased.
    PlayFabId: string;
    // Name of the virtual currency which is to be incremented.
    VirtualCurrency: string;
}

interface AddVirtualCurrencyTypesRequest extends PlayFabModule.IPlayFabRequestCommon {
    // List of virtual currencies and their initial deposits (the amount a user is granted when signing in for the first time)
    // to the title
    VirtualCurrencies: VirtualCurrencyData[];
}

interface ApiCondition {
    // Require that API calls contain an RSA encrypted payload or signed headers.
    HasSignatureOrEncryption?: string;
}

type AuthTokenType = "Email";

interface BanInfo {
    // The active state of this ban. Expired bans may still have this value set to true but they will have no effect.
    Active: boolean;
    // The unique Ban Id associated with this ban.
    BanId?: string;
    // The time when this ban was applied.
    Created?: string;
    // The time when this ban expires. Permanent bans do not have expiration date.
    Expires?: string;
    // The IP address on which the ban was applied. May affect multiple players.
    IPAddress?: string;
    // The MAC address on which the ban was applied. May affect multiple players.
    MACAddress?: string;
    // Unique PlayFab assigned ID of the user on whom the operation will be performed.
    PlayFabId?: string;
    // The reason why this ban was applied.
    Reason?: string;
}

interface BanRequest {
    // The duration in hours for the ban. Leave this blank for a permanent ban.
    DurationInHours?: number;
    // IP address to be banned. May affect multiple players.
    IPAddress?: string;
    // MAC address to be banned. May affect multiple players.
    MACAddress?: string;
    // Unique PlayFab assigned ID of the user on whom the operation will be performed.
    PlayFabId: string;
    // The reason for this ban. Maximum 140 characters.
    Reason?: string;
}

interface BanUsersRequest extends PlayFabModule.IPlayFabRequestCommon {
    // List of ban requests to be applied. Maximum 100.
    Bans: BanRequest[];
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
}

interface BanUsersResult extends PlayFabModule.IPlayFabResultCommon {
    // Information on the bans that were applied
    BanData?: BanInfo[];
}

interface BlankResult extends PlayFabModule.IPlayFabResultCommon {}

interface CatalogItem {
    // defines the bundle properties for the item - bundles are items which contain other items, including random drop tables
    // and virtual currencies
    Bundle?: CatalogItemBundleInfo;
    // if true, then an item instance of this type can be used to grant a character to a user.
    CanBecomeCharacter: boolean;
    // catalog version for this item
    CatalogVersion?: string;
    // defines the consumable properties (number of uses, timeout) for the item
    Consumable?: CatalogItemConsumableInfo;
    // defines the container properties for the item - what items it contains, including random drop tables and virtual
    // currencies, and what item (if any) is required to open it via the UnlockContainerItem API
    Container?: CatalogItemContainerInfo;
    // game specific custom data
    CustomData?: string;
    // text description of item, to show in-game
    Description?: string;
    // text name for the item, to show in-game
    DisplayName?: string;
    // If the item has IsLImitedEdition set to true, and this is the first time this ItemId has been defined as a limited
    // edition item, this value determines the total number of instances to allocate for the title. Once this limit has been
    // reached, no more instances of this ItemId can be created, and attempts to purchase or grant it will return a Result of
    // false for that ItemId. If the item has already been defined to have a limited edition count, or if this value is less
    // than zero, it will be ignored.
    InitialLimitedEditionCount: number;
    // BETA: If true, then only a fixed number can ever be granted.
    IsLimitedEdition: boolean;
    // if true, then only one item instance of this type will exist and its remaininguses will be incremented instead.
    // RemainingUses will cap out at Int32.Max (2,147,483,647). All subsequent increases will be discarded
    IsStackable: boolean;
    // if true, then an item instance of this type can be traded between players using the trading APIs
    IsTradable: boolean;
    // class to which the item belongs
    ItemClass?: string;
    // unique identifier for this item
    ItemId: string;
    // URL to the item image. For Facebook purchase to display the image on the item purchase page, this must be set to an HTTP
    // URL.
    ItemImageUrl?: string;
    // override prices for this item for specific currencies
    RealCurrencyPrices?: { [key: string]: number };
    // list of item tags
    Tags?: string[];
    // price of this item in virtual currencies and "RM" (the base Real Money purchase price, in USD pennies)
    VirtualCurrencyPrices?: { [key: string]: number };
}

interface CatalogItemBundleInfo {
    // unique ItemId values for all items which will be added to the player inventory when the bundle is added
    BundledItems?: string[];
    // unique TableId values for all RandomResultTable objects which are part of the bundle (random tables will be resolved and
    // add the relevant items to the player inventory when the bundle is added)
    BundledResultTables?: string[];
    // virtual currency types and balances which will be added to the player inventory when the bundle is added
    BundledVirtualCurrencies?: { [key: string]: number };
}

interface CatalogItemConsumableInfo {
    // number of times this object can be used, after which it will be removed from the player inventory
    UsageCount?: number;
    // duration in seconds for how long the item will remain in the player inventory - once elapsed, the item will be removed
    // (recommended minimum value is 5 seconds, as lower values can cause the item to expire before operations depending on
    // this item's details have completed)
    UsagePeriod?: number;
    // all inventory item instances in the player inventory sharing a non-null UsagePeriodGroup have their UsagePeriod values
    // added together, and share the result - when that period has elapsed, all the items in the group will be removed
    UsagePeriodGroup?: string;
}

interface CatalogItemContainerInfo {
    // unique ItemId values for all items which will be added to the player inventory, once the container has been unlocked
    ItemContents?: string[];
    // ItemId for the catalog item used to unlock the container, if any (if not specified, a call to UnlockContainerItem will
    // open the container, adding the contents to the player inventory and currency balances)
    KeyItemId?: string;
    // unique TableId values for all RandomResultTable objects which are part of the container (once unlocked, random tables
    // will be resolved and add the relevant items to the player inventory)
    ResultTableContents?: string[];
    // virtual currency types and balances which will be added to the player inventory when the container is unlocked
    VirtualCurrencyContents?: { [key: string]: number };
}

interface CheckLimitedEditionItemAvailabilityRequest extends PlayFabModule.IPlayFabRequestCommon {
    // Which catalog is being updated. If null, uses the default catalog.
    CatalogVersion?: string;
    // The item to check for.
    ItemId: string;
}

interface CheckLimitedEditionItemAvailabilityResult extends PlayFabModule.IPlayFabResultCommon {
    // The amount of the specified resource remaining.
    Amount: number;
}

interface CloudScriptFile {
    // Contents of the Cloud Script javascript. Must be string-escaped javascript.
    FileContents: string;
    // Name of the javascript file. These names are not used internally by the server, they are only for developer
    // organizational purposes.
    Filename: string;
}

interface CloudScriptTaskParameter {
    // Argument to pass to the CloudScript function.
    Argument?: any;
    // Name of the CloudScript function to execute.
    FunctionName?: string;
}

interface CloudScriptTaskSummary {
    // UTC timestamp when the task completed.
    CompletedAt?: string;
    // Estimated time remaining in seconds.
    EstimatedSecondsRemaining?: number;
    // Progress represented as percentage.
    PercentComplete?: number;
    // Result of CloudScript execution
    Result?: ExecuteCloudScriptResult;
    // If manually scheduled, ID of user who scheduled the task.
    ScheduledByUserId?: string;
    // UTC timestamp when the task started.
    StartedAt: string;
    // Current status of the task instance.
    Status?: string;
    // Identifier of the task this instance belongs to.
    TaskIdentifier?: NameIdentifier;
    // ID of the task instance.
    TaskInstanceId?: string;
}

interface CloudScriptVersionStatus {
    // Most recent revision for this Cloud Script version
    LatestRevision: number;
    // Published code revision for this Cloud Script version
    PublishedRevision: number;
    // Version number
    Version: number;
}

type Conditionals = "Any"
    | "True"
    | "False";

interface ContactEmailInfo {
    // The email address
    EmailAddress?: string;
    // The name of the email info data
    Name?: string;
    // The verification status of the email
    VerificationStatus?: string;
}

interface ContactEmailInfoModel {
    // The email address
    EmailAddress?: string;
    // The name of the email info data
    Name?: string;
    // The verification status of the email
    VerificationStatus?: string;
}

interface ContentInfo {
    // Key of the content
    Key?: string;
    // Last modified time
    LastModified: string;
    // Size of the content in bytes
    Size: number;
}

interface CreateActionsOnPlayerSegmentTaskRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // Description the task
    Description?: string;
    // Whether the schedule is active. Inactive schedule will not trigger task execution.
    IsActive: boolean;
    // Name of the task. This is a unique identifier for tasks in the title.
    Name: string;
    // Task details related to segment and action
    Parameter: ActionsOnPlayersInSegmentTaskParameter;
    // Cron expression for the run schedule of the task. The expression should be in UTC.
    Schedule?: string;
}

interface CreateCloudScriptTaskRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // Description the task
    Description?: string;
    // Whether the schedule is active. Inactive schedule will not trigger task execution.
    IsActive: boolean;
    // Name of the task. This is a unique identifier for tasks in the title.
    Name: string;
    // Task details related to CloudScript
    Parameter: CloudScriptTaskParameter;
    // Cron expression for the run schedule of the task. The expression should be in UTC.
    Schedule?: string;
}

interface CreateInsightsScheduledScalingTaskRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // Description the task
    Description?: string;
    // Whether the schedule is active. Inactive schedule will not trigger task execution.
    IsActive: boolean;
    // Name of the task. This is a unique identifier for tasks in the title.
    Name: string;
    // Task details related to Insights Scaling
    Parameter: InsightsScalingTaskParameter;
    // Cron expression for the run schedule of the task. The expression should be in UTC.
    Schedule?: string;
}

interface CreateOpenIdConnectionRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The client ID given by the ID provider.
    ClientId: string;
    // The client secret given by the ID provider.
    ClientSecret: string;
    // A name for the connection that identifies it within the title.
    ConnectionId: string;
    // The discovery document URL to read issuer information from. This must be the absolute URL to the JSON OpenId
    // Configuration document and must be accessible from the internet. If you don't know it, try your issuer URL followed by
    // "/.well-known/openid-configuration". For example, if the issuer is https://example.com, try
    // https://example.com/.well-known/openid-configuration
    IssuerDiscoveryUrl?: string;
    // Manually specified information for an OpenID Connect issuer.
    IssuerInformation?: OpenIdIssuerInformation;
}

interface CreatePlayerSharedSecretRequest extends PlayFabModule.IPlayFabRequestCommon {
    // Friendly name for this key
    FriendlyName?: string;
}

interface CreatePlayerSharedSecretResult extends PlayFabModule.IPlayFabResultCommon {
    // The player shared secret to use when calling Client/GetTitlePublicKey
    SecretKey?: string;
}

interface CreatePlayerStatisticDefinitionRequest extends PlayFabModule.IPlayFabRequestCommon {
    // the aggregation method to use in updating the statistic (defaults to last)
    AggregationMethod?: string;
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // unique name of the statistic
    StatisticName: string;
    // interval at which the values of the statistic for all players are reset (resets begin at the next interval boundary)
    VersionChangeInterval?: string;
}

interface CreatePlayerStatisticDefinitionResult extends PlayFabModule.IPlayFabResultCommon {
    // created statistic definition
    Statistic?: PlayerStatisticDefinition;
}

interface CreateTaskResult extends PlayFabModule.IPlayFabResultCommon {
    // ID of the task
    TaskId?: string;
}

interface DeleteContentRequest extends PlayFabModule.IPlayFabRequestCommon {
    // Key of the content item to be deleted
    Key: string;
}

interface DeleteMasterPlayerAccountRequest extends PlayFabModule.IPlayFabRequestCommon {
    // Developer created string to identify a user without PlayFab ID
    MetaData?: string;
    // Unique PlayFab assigned ID of the user on whom the operation will be performed.
    PlayFabId: string;
}

interface DeleteMasterPlayerAccountResult extends PlayFabModule.IPlayFabResultCommon {
    // A notification email with this job receipt Id will be sent to the title notification email address when deletion is
    // complete.
    JobReceiptId?: string;
    // List of titles from which the player's data will be deleted.
    TitleIds?: string[];
}

interface DeleteOpenIdConnectionRequest extends PlayFabModule.IPlayFabRequestCommon {
    // unique name of the connection
    ConnectionId: string;
}

interface DeletePlayerRequest extends PlayFabModule.IPlayFabRequestCommon {
    // Unique PlayFab assigned ID of the user on whom the operation will be performed.
    PlayFabId: string;
}

interface DeletePlayerResult extends PlayFabModule.IPlayFabResultCommon {}

interface DeletePlayerSharedSecretRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The shared secret key to delete
    SecretKey?: string;
}

interface DeletePlayerSharedSecretResult extends PlayFabModule.IPlayFabResultCommon {}

interface DeleteStoreRequest extends PlayFabModule.IPlayFabRequestCommon {
    // catalog version of the store to delete. If null, uses the default catalog.
    CatalogVersion?: string;
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // unqiue identifier for the store which is to be deleted
    StoreId: string;
}

interface DeleteStoreResult extends PlayFabModule.IPlayFabResultCommon {}

interface DeleteTaskRequest extends PlayFabModule.IPlayFabRequestCommon {
    // Specify either the task ID or the name of task to be deleted.
    Identifier?: NameIdentifier;
}

interface DeleteTitleDataOverrideRequest extends PlayFabModule.IPlayFabRequestCommon {
    // Name of the override.
    OverrideLabel: string;
}

interface DeleteTitleDataOverrideResult extends PlayFabModule.IPlayFabResultCommon {}

interface DeleteTitleRequest extends PlayFabModule.IPlayFabRequestCommon {}

interface DeleteTitleResult extends PlayFabModule.IPlayFabResultCommon {}

type EffectType = "Allow"
    | "Deny";

interface EmptyResponse extends PlayFabModule.IPlayFabResultCommon {}

interface EntityKey {
    // Unique ID of the entity.
    Id: string;
    // Entity type. See https://docs.microsoft.com/gaming/playfab/features/data/entities/available-built-in-entity-types
    Type?: string;
}

interface ExecuteCloudScriptResult {
    // Number of PlayFab API requests issued by the CloudScript function
    APIRequestsIssued: number;
    // Information about the error, if any, that occurred during execution
    Error?: ScriptExecutionError;
    ExecutionTimeSeconds: number;
    // The name of the function that executed
    FunctionName?: string;
    // The object returned from the CloudScript function, if any
    FunctionResult?: any;
    // Flag indicating if the FunctionResult was too large and was subsequently dropped from this event. This only occurs if
    // the total event size is larger than 350KB.
    FunctionResultTooLarge?: boolean;
    // Number of external HTTP requests issued by the CloudScript function
    HttpRequestsIssued: number;
    // Entries logged during the function execution. These include both entries logged in the function code using log.info()
    // and log.error() and error entries for API and HTTP request failures.
    Logs?: LogStatement[];
    // Flag indicating if the logs were too large and were subsequently dropped from this event. This only occurs if the total
    // event size is larger than 350KB after the FunctionResult was removed.
    LogsTooLarge?: boolean;
    MemoryConsumedBytes: number;
    // Processor time consumed while executing the function. This does not include time spent waiting on API calls or HTTP
    // requests.
    ProcessorTimeSeconds: number;
    // The revision of the CloudScript that executed
    Revision: number;
}

interface ExportMasterPlayerDataRequest extends PlayFabModule.IPlayFabRequestCommon {
    // Unique PlayFab assigned ID of the user on whom the operation will be performed.
    PlayFabId: string;
}

interface ExportMasterPlayerDataResult extends PlayFabModule.IPlayFabResultCommon {
    // An email with this job receipt Id containing the download link will be sent to the title notification email
    // address when the is complete.
    JobReceiptId?: string;
}

type GameBuildStatus = "Available"
    | "Validating"
    | "InvalidBuildPackage"
    | "Processing"
    | "FailedToProcess";

interface GameModeInfo {
    // specific game mode type
    Gamemode: string;
    // maximum user count a specific Game Server Instance can support
    MaxPlayerCount: number;
    // minimum user count required for this Game Server Instance to continue (usually 1)
    MinPlayerCount: number;
    // whether to start as an open session, meaning that players can matchmake into it (defaults to true)
    StartOpen?: boolean;
}

type GenericErrorCodes = "Success"
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
    | "InsightsManagementTitleInEvaluationMode"
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
    | "TitleConfigNotFound"
    | "TitleConfigUpdateConflict"
    | "TitleConfigSerializationError"
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
    | "CatalogUnauthorized"
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
    | "TitleNotEnabledForParty"
    | "PartyVersionNotFound"
    | "MultiplayerServerBuildReferencedByMatchmakingQueue"
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
    | "MaxActionDepthExceeded"
    | "TitleNotOnUpdatedPricingPlan"
    | "SnapshotNotFound";

interface GetActionsOnPlayersInSegmentTaskInstanceResult extends PlayFabModule.IPlayFabResultCommon {
    // Parameter of this task instance
    Parameter?: ActionsOnPlayersInSegmentTaskParameter;
    // Status summary of the actions-on-players-in-segment task instance
    Summary?: ActionsOnPlayersInSegmentTaskSummary;
}

interface GetAllSegmentsRequest extends PlayFabModule.IPlayFabRequestCommon {}

interface GetAllSegmentsResult extends PlayFabModule.IPlayFabResultCommon {
    // Array of segments for this title.
    Segments?: GetSegmentResult[];
}

interface GetCatalogItemsRequest extends PlayFabModule.IPlayFabRequestCommon {
    // Which catalog is being requested. If null, uses the default catalog.
    CatalogVersion?: string;
}

interface GetCatalogItemsResult extends PlayFabModule.IPlayFabResultCommon {
    // Array of items which can be purchased.
    Catalog?: CatalogItem[];
}

interface GetCloudScriptRevisionRequest extends PlayFabModule.IPlayFabRequestCommon {
    // Revision number. If left null, defaults to the latest revision
    Revision?: number;
    // Version number. If left null, defaults to the latest version
    Version?: number;
}

interface GetCloudScriptRevisionResult extends PlayFabModule.IPlayFabResultCommon {
    // Time this revision was created
    CreatedAt: string;
    // List of Cloud Script files in this revision.
    Files?: CloudScriptFile[];
    // True if this is the currently published revision
    IsPublished: boolean;
    // Revision number.
    Revision: number;
    // Version number.
    Version: number;
}

interface GetCloudScriptTaskInstanceResult extends PlayFabModule.IPlayFabResultCommon {
    // Parameter of this task instance
    Parameter?: CloudScriptTaskParameter;
    // Status summary of the CloudScript task instance
    Summary?: CloudScriptTaskSummary;
}

interface GetCloudScriptVersionsRequest extends PlayFabModule.IPlayFabRequestCommon {}

interface GetCloudScriptVersionsResult extends PlayFabModule.IPlayFabResultCommon {
    // List of versions
    Versions?: CloudScriptVersionStatus[];
}

interface GetContentListRequest extends PlayFabModule.IPlayFabRequestCommon {
    // Limits the response to keys that begin with the specified prefix. You can use prefixes to list contents under a folder,
    // or for a specified version, etc.
    Prefix?: string;
}

interface GetContentListResult extends PlayFabModule.IPlayFabResultCommon {
    // List of content items.
    Contents?: ContentInfo[];
    // Number of content items returned. We currently have a maximum of 1000 items limit.
    ItemCount: number;
    // The total size of listed contents in bytes.
    TotalSize: number;
}

interface GetContentUploadUrlRequest extends PlayFabModule.IPlayFabRequestCommon {
    // A standard MIME type describing the format of the contents. The same MIME type has to be set in the header when
    // uploading the content. If not specified, the MIME type is 'binary/octet-stream' by default.
    ContentType?: string;
    // Key of the content item to upload, usually formatted as a path, e.g. images/a.png
    Key: string;
}

interface GetContentUploadUrlResult extends PlayFabModule.IPlayFabResultCommon {
    // URL for uploading content via HTTP PUT method. The URL will expire in approximately one hour.
    URL?: string;
}

interface GetDataReportRequest extends PlayFabModule.IPlayFabRequestCommon {
    // Reporting year (UTC)
    Day: number;
    // Reporting month (UTC)
    Month: number;
    // Report name
    ReportName: string;
    // Reporting year (UTC)
    Year: number;
}

interface GetDataReportResult extends PlayFabModule.IPlayFabResultCommon {
    // The URL where the requested report can be downloaded. This can be any PlayFab generated reports. The full list of
    // reports can be found at: https://docs.microsoft.com/en-us/gaming/playfab/features/analytics/reports/quickstart.
    DownloadUrl?: string;
}

interface GetMatchmakerGameInfoRequest extends PlayFabModule.IPlayFabRequestCommon {
    // unique identifier of the lobby for which info is being requested
    LobbyId: string;
}

interface GetMatchmakerGameInfoResult extends PlayFabModule.IPlayFabResultCommon {
    // version identifier of the game server executable binary being run
    BuildVersion?: string;
    // time when Game Server Instance is currently scheduled to end
    EndTime?: string;
    // unique identifier of the lobby
    LobbyId?: string;
    // game mode for this Game Server Instance
    Mode?: string;
    // array of unique PlayFab identifiers for users currently connected to this Game Server Instance
    Players?: string[];
    // region in which the Game Server Instance is running
    Region?: string;
    // IPV4 address of the server
    ServerIPV4Address?: string;
    // IPV6 address of the server
    ServerIPV6Address?: string;
    // communication port for this Game Server Instance
    ServerPort: number;
    // Public DNS name (if any) of the server
    ServerPublicDNSName?: string;
    // time when the Game Server Instance was created
    StartTime: string;
    // unique identifier of the Game Server Instance for this lobby
    TitleId?: string;
}

interface GetMatchmakerGameModesRequest extends PlayFabModule.IPlayFabRequestCommon {
    // previously uploaded build version for which game modes are being requested
    BuildVersion: string;
}

interface GetMatchmakerGameModesResult extends PlayFabModule.IPlayFabResultCommon {
    // array of game modes available for the specified build
    GameModes?: GameModeInfo[];
}

interface GetPlayedTitleListRequest extends PlayFabModule.IPlayFabRequestCommon {
    // Unique PlayFab assigned ID of the user on whom the operation will be performed.
    PlayFabId: string;
}

interface GetPlayedTitleListResult extends PlayFabModule.IPlayFabResultCommon {
    // List of titles the player has played
    TitleIds?: string[];
}

interface GetPlayerIdFromAuthTokenRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The auth token of the player requesting the password reset.
    Token: string;
    // The type of auth token of the player requesting the password reset.
    TokenType: string;
}

interface GetPlayerIdFromAuthTokenResult extends PlayFabModule.IPlayFabResultCommon {
    // The player ID from the token passed in
    PlayFabId?: string;
}

interface GetPlayerProfileRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // Unique PlayFab assigned ID of the user on whom the operation will be performed.
    PlayFabId?: string;
    // If non-null, this determines which properties of the resulting player profiles to return. For API calls from the client,
    // only the allowed client profile properties for the title may be requested. These allowed properties are configured in
    // the Game Manager "Client Profile Options" tab in the "Settings" section.
    ProfileConstraints?: PlayerProfileViewConstraints;
}

interface GetPlayerProfileResult extends PlayFabModule.IPlayFabResultCommon {
    // The profile of the player. This profile is not guaranteed to be up-to-date. For a new player, this profile will not
    // exist.
    PlayerProfile?: PlayerProfileModel;
}

interface GetPlayerSegmentsResult extends PlayFabModule.IPlayFabResultCommon {
    // Array of segments the requested player currently belongs to.
    Segments?: GetSegmentResult[];
}

interface GetPlayerSharedSecretsRequest extends PlayFabModule.IPlayFabRequestCommon {}

interface GetPlayerSharedSecretsResult extends PlayFabModule.IPlayFabResultCommon {
    // The player shared secret to use when calling Client/GetTitlePublicKey
    SharedSecrets?: SharedSecret[];
}

interface GetPlayersInSegmentRequest extends PlayFabModule.IPlayFabRequestCommon {
    // Continuation token if retrieving subsequent pages of results.
    ContinuationToken?: string;
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // Maximum number of profiles to load. Default is 1,000. Maximum is 10,000.
    MaxBatchSize?: number;
    // Number of seconds to keep the continuation token active. After token expiration it is not possible to continue paging
    // results. Default is 300 (5 minutes). Maximum is 1,800 (30 minutes).
    SecondsToLive?: number;
    // Unique identifier for this segment.
    SegmentId: string;
}

interface GetPlayersInSegmentResult extends PlayFabModule.IPlayFabResultCommon {
    // Continuation token to use to retrieve subsequent pages of results. If token returns null there are no more results.
    ContinuationToken?: string;
    // Array of player profiles in this segment.
    PlayerProfiles?: PlayerProfile[];
    // Count of profiles matching this segment.
    ProfilesInSegment: number;
}

interface GetPlayersSegmentsRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // Unique PlayFab assigned ID of the user on whom the operation will be performed.
    PlayFabId: string;
}

interface GetPlayerStatisticDefinitionsRequest extends PlayFabModule.IPlayFabRequestCommon {}

interface GetPlayerStatisticDefinitionsResult extends PlayFabModule.IPlayFabResultCommon {
    // the player statistic definitions for the title
    Statistics?: PlayerStatisticDefinition[];
}

interface GetPlayerStatisticVersionsRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // unique name of the statistic
    StatisticName?: string;
}

interface GetPlayerStatisticVersionsResult extends PlayFabModule.IPlayFabResultCommon {
    // version change history of the statistic
    StatisticVersions?: PlayerStatisticVersion[];
}

interface GetPlayerTagsRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // Optional namespace to filter results by
    Namespace?: string;
    // Unique PlayFab assigned ID of the user on whom the operation will be performed.
    PlayFabId: string;
}

interface GetPlayerTagsResult extends PlayFabModule.IPlayFabResultCommon {
    // Unique PlayFab assigned ID of the user on whom the operation will be performed.
    PlayFabId: string;
    // Canonical tags (including namespace and tag's name) for the requested user
    Tags: string[];
}

interface GetPolicyRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The name of the policy to read. Only supported name is 'ApiPolicy'.
    PolicyName?: string;
}

interface GetPolicyResponse extends PlayFabModule.IPlayFabResultCommon {
    // The name of the policy read.
    PolicyName?: string;
    // The statements in the requested policy.
    Statements?: PermissionStatement[];
}

interface GetPublisherDataRequest extends PlayFabModule.IPlayFabRequestCommon {
    // array of keys to get back data from the Publisher data blob, set by the admin tools
    Keys: string[];
}

interface GetPublisherDataResult extends PlayFabModule.IPlayFabResultCommon {
    // a dictionary object of key / value pairs
    Data?: { [key: string]: string | null };
}

interface GetRandomResultTablesRequest extends PlayFabModule.IPlayFabRequestCommon {
    // catalog version to fetch tables from. Use default catalog version if null
    CatalogVersion?: string;
}

interface GetRandomResultTablesResult extends PlayFabModule.IPlayFabResultCommon {
    // array of random result tables currently available
    Tables?: { [key: string]: RandomResultTableListing };
}

interface GetSegmentResult {
    // Identifier of the segments AB Test, if it is attached to one.
    ABTestParent?: string;
    // Unique identifier for this segment.
    Id: string;
    // Segment name.
    Name?: string;
}

interface GetServerBuildInfoRequest extends PlayFabModule.IPlayFabRequestCommon {
    // unique identifier of the previously uploaded build executable for which information is being requested
    BuildId: string;
}

interface GetServerBuildInfoResult extends PlayFabModule.IPlayFabResultCommon {
    // array of regions where this build can used, when it is active
    ActiveRegions?: string[];
    // unique identifier for this build executable
    BuildId?: string;
    // developer comment(s) for this build
    Comment?: string;
    // error message, if any, about this build
    ErrorMessage?: string;
    // maximum number of game server instances that can run on a single host machine
    MaxGamesPerHost: number;
    // minimum capacity of additional game server instances that can be started before the autoscaling service starts new host
    // machines (given the number of current running host machines and game server instances)
    MinFreeGameSlots: number;
    // the current status of the build validation and processing steps
    Status?: string;
    // time this build was last modified (or uploaded, if this build has never been modified)
    Timestamp: string;
    // Unique identifier for the title, found in the Settings > Game Properties section of the PlayFab developer site when a
    // title has been selected.
    TitleId?: string;
}

interface GetServerBuildUploadURLRequest extends PlayFabModule.IPlayFabRequestCommon {
    // unique identifier of the game server build to upload
    BuildId: string;
}

interface GetServerBuildUploadURLResult extends PlayFabModule.IPlayFabResultCommon {
    // pre-authorized URL for uploading the game server build package
    URL?: string;
}

interface GetStoreItemsRequest extends PlayFabModule.IPlayFabRequestCommon {
    // Catalog version to store items from. Use default catalog version if null
    CatalogVersion?: string;
    // Unqiue identifier for the store which is being requested.
    StoreId: string;
}

interface GetStoreItemsResult extends PlayFabModule.IPlayFabResultCommon {
    // The base catalog that this store is a part of.
    CatalogVersion?: string;
    // Additional data about the store.
    MarketingData?: StoreMarketingModel;
    // How the store was last updated (Admin or a third party).
    Source?: string;
    // Array of items which can be purchased from this store.
    Store?: StoreItem[];
    // The ID of this store.
    StoreId?: string;
}

interface GetTaskInstanceRequest extends PlayFabModule.IPlayFabRequestCommon {
    // ID of the requested task instance.
    TaskInstanceId: string;
}

interface GetTaskInstancesRequest extends PlayFabModule.IPlayFabRequestCommon {
    // Optional range-from filter for task instances' StartedAt timestamp.
    StartedAtRangeFrom?: string;
    // Optional range-to filter for task instances' StartedAt timestamp.
    StartedAtRangeTo?: string;
    // Optional filter for task instances that are of a specific status.
    StatusFilter?: string;
    // Name or ID of the task whose instances are being queried. If not specified, return all task instances that satisfy
    // conditions set by other filters.
    TaskIdentifier?: NameIdentifier;
}

interface GetTaskInstancesResult extends PlayFabModule.IPlayFabResultCommon {
    // Basic status summaries of the queried task instances. Empty If no task instances meets the filter criteria. To get
    // detailed status summary, use Get*TaskInstance API according to task type (e.g.
    // GetActionsOnPlayersInSegmentTaskInstance).
    Summaries?: TaskInstanceBasicSummary[];
}

interface GetTasksRequest extends PlayFabModule.IPlayFabRequestCommon {
    // Provide either the task ID or the task name to get a specific task. If not specified, return all defined tasks.
    Identifier?: NameIdentifier;
}

interface GetTasksResult extends PlayFabModule.IPlayFabResultCommon {
    // Result tasks. Empty if there is no task found.
    Tasks?: ScheduledTask[];
}

interface GetTitleDataRequest extends PlayFabModule.IPlayFabRequestCommon {
    // Specific keys to search for in the title data (leave null to get all keys)
    Keys?: string[];
    // Name of the override. This value is ignored when used by the game client; otherwise, the overrides are applied
    // automatically to the title data.
    OverrideLabel?: string;
}

interface GetTitleDataResult extends PlayFabModule.IPlayFabResultCommon {
    // a dictionary object of key / value pairs
    Data?: { [key: string]: string | null };
}

interface GetUserBansRequest extends PlayFabModule.IPlayFabRequestCommon {
    // Unique PlayFab assigned ID of the user on whom the operation will be performed.
    PlayFabId: string;
}

interface GetUserBansResult extends PlayFabModule.IPlayFabResultCommon {
    // Information about the bans
    BanData?: BanInfo[];
}

interface GetUserDataRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The version that currently exists according to the caller. The call will return the data for all of the keys if the
    // version in the system is greater than this.
    IfChangedFromDataVersion?: number;
    // Specific keys to search for in the custom user data.
    Keys?: string[];
    // Unique PlayFab assigned ID of the user on whom the operation will be performed.
    PlayFabId?: string;
}

interface GetUserDataResult extends PlayFabModule.IPlayFabResultCommon {
    // User specific data for this title.
    Data?: { [key: string]: UserDataRecord };
    // Indicates the current version of the data that has been set. This is incremented with every set call for that type of
    // data (read-only, internal, etc). This version can be provided in Get calls to find updated data.
    DataVersion: number;
    // PlayFab unique identifier of the user whose custom data is being returned.
    PlayFabId?: string;
}

interface GetUserInventoryRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // Unique PlayFab assigned ID of the user on whom the operation will be performed.
    PlayFabId: string;
}

interface GetUserInventoryResult extends PlayFabModule.IPlayFabResultCommon {
    // Array of inventory items belonging to the user.
    Inventory?: ItemInstance[];
    // Unique PlayFab assigned ID of the user on whom the operation will be performed.
    PlayFabId?: string;
    // Array of virtual currency balance(s) belonging to the user.
    VirtualCurrency?: { [key: string]: number };
    // Array of remaining times and timestamps for virtual currencies.
    VirtualCurrencyRechargeTimes?: { [key: string]: VirtualCurrencyRechargeTime };
}

interface GrantedItemInstance {
    // Game specific comment associated with this instance when it was added to the user inventory.
    Annotation?: string;
    // Array of unique items that were awarded when this catalog item was purchased.
    BundleContents?: string[];
    // Unique identifier for the parent inventory item, as defined in the catalog, for object which were added from a bundle or
    // container.
    BundleParent?: string;
    // Catalog version for the inventory item, when this instance was created.
    CatalogVersion?: string;
    // Unique PlayFab assigned ID for a specific character owned by a user
    CharacterId?: string;
    // A set of custom key-value pairs on the instance of the inventory item, which is not to be confused with the catalog
    // item's custom data.
    CustomData?: { [key: string]: string | null };
    // CatalogItem.DisplayName at the time this item was purchased.
    DisplayName?: string;
    // Timestamp for when this instance will expire.
    Expiration?: string;
    // Class name for the inventory item, as defined in the catalog.
    ItemClass?: string;
    // Unique identifier for the inventory item, as defined in the catalog.
    ItemId?: string;
    // Unique item identifier for this specific instance of the item.
    ItemInstanceId?: string;
    // Unique PlayFab assigned ID of the user on whom the operation will be performed.
    PlayFabId?: string;
    // Timestamp for when this instance was purchased.
    PurchaseDate?: string;
    // Total number of remaining uses, if this is a consumable item.
    RemainingUses?: number;
    // Result of this operation.
    Result: boolean;
    // Currency type for the cost of the catalog item. Not available when granting items.
    UnitCurrency?: string;
    // Cost of the catalog item in the given currency. Not available when granting items.
    UnitPrice: number;
    // The number of uses that were added or removed to this item in this call.
    UsesIncrementedBy?: number;
}

interface GrantItemsToUsersRequest extends PlayFabModule.IPlayFabRequestCommon {
    // Catalog version from which items are to be granted.
    CatalogVersion?: string;
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // Array of items to grant and the users to whom the items are to be granted.
    ItemGrants: ItemGrant[];
}

interface GrantItemsToUsersResult extends PlayFabModule.IPlayFabResultCommon {
    // Array of items granted to users.
    ItemGrantResults?: GrantedItemInstance[];
}

interface IncrementLimitedEditionItemAvailabilityRequest extends PlayFabModule.IPlayFabRequestCommon {
    // Amount to increase availability by.
    Amount: number;
    // Which catalog is being updated. If null, uses the default catalog.
    CatalogVersion?: string;
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // The item which needs more availability.
    ItemId: string;
}

interface IncrementLimitedEditionItemAvailabilityResult extends PlayFabModule.IPlayFabResultCommon {}

interface IncrementPlayerStatisticVersionRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // unique name of the statistic
    StatisticName?: string;
}

interface IncrementPlayerStatisticVersionResult extends PlayFabModule.IPlayFabResultCommon {
    // version change history of the statistic
    StatisticVersion?: PlayerStatisticVersion;
}

interface InsightsScalingTaskParameter {
    // Insights Performance Level to scale to.
    Level: number;
}

interface ItemGrant {
    // String detailing any additional information concerning this operation.
    Annotation?: string;
    // Unique PlayFab assigned ID for a specific character owned by a user
    CharacterId?: string;
    // Key-value pairs to be written to the custom data. Note that keys are trimmed of whitespace, are limited in size, and may
    // not begin with a '!' character or be null.
    Data?: { [key: string]: string | null };
    // Unique identifier of the catalog item to be granted to the user.
    ItemId: string;
    // Optional list of Data-keys to remove from UserData. Some SDKs cannot insert null-values into Data due to language
    // constraints. Use this to delete the keys directly.
    KeysToRemove?: string[];
    // Unique PlayFab assigned ID of the user on whom the operation will be performed.
    PlayFabId: string;
}

interface ItemInstance {
    // Game specific comment associated with this instance when it was added to the user inventory.
    Annotation?: string;
    // Array of unique items that were awarded when this catalog item was purchased.
    BundleContents?: string[];
    // Unique identifier for the parent inventory item, as defined in the catalog, for object which were added from a bundle or
    // container.
    BundleParent?: string;
    // Catalog version for the inventory item, when this instance was created.
    CatalogVersion?: string;
    // A set of custom key-value pairs on the instance of the inventory item, which is not to be confused with the catalog
    // item's custom data.
    CustomData?: { [key: string]: string | null };
    // CatalogItem.DisplayName at the time this item was purchased.
    DisplayName?: string;
    // Timestamp for when this instance will expire.
    Expiration?: string;
    // Class name for the inventory item, as defined in the catalog.
    ItemClass?: string;
    // Unique identifier for the inventory item, as defined in the catalog.
    ItemId?: string;
    // Unique item identifier for this specific instance of the item.
    ItemInstanceId?: string;
    // Timestamp for when this instance was purchased.
    PurchaseDate?: string;
    // Total number of remaining uses, if this is a consumable item.
    RemainingUses?: number;
    // Currency type for the cost of the catalog item. Not available when granting items.
    UnitCurrency?: string;
    // Cost of the catalog item in the given currency. Not available when granting items.
    UnitPrice: number;
    // The number of uses that were added or removed to this item in this call.
    UsesIncrementedBy?: number;
}

interface LinkedPlatformAccountModel {
    // Linked account email of the user on the platform, if available
    Email?: string;
    // Authentication platform
    Platform?: string;
    // Unique account identifier of the user on the platform
    PlatformUserId?: string;
    // Linked account username of the user on the platform, if available
    Username?: string;
}

interface ListBuildsRequest extends PlayFabModule.IPlayFabRequestCommon {}

interface ListBuildsResult extends PlayFabModule.IPlayFabResultCommon {
    // array of uploaded game server builds
    Builds?: GetServerBuildInfoResult[];
}

interface ListOpenIdConnectionRequest extends PlayFabModule.IPlayFabRequestCommon {}

interface ListOpenIdConnectionResponse extends PlayFabModule.IPlayFabResultCommon {
    // The list of Open ID Connections
    Connections?: OpenIdConnection[];
}

interface ListVirtualCurrencyTypesRequest extends PlayFabModule.IPlayFabRequestCommon {}

interface ListVirtualCurrencyTypesResult extends PlayFabModule.IPlayFabResultCommon {
    // List of virtual currency names defined for this title
    VirtualCurrencies?: VirtualCurrencyData[];
}

interface LocationModel {
    // City name.
    City?: string;
    // The two-character continent code for this location
    ContinentCode?: string;
    // The two-character ISO 3166-1 country code for the country associated with the location
    CountryCode?: string;
    // Latitude coordinate of the geographic location.
    Latitude?: number;
    // Longitude coordinate of the geographic location.
    Longitude?: number;
}

interface LogStatement {
    // Optional object accompanying the message as contextual information
    Data?: any;
    // 'Debug', 'Info', or 'Error'
    Level?: string;
    Message?: string;
}

interface LookupUserAccountInfoRequest extends PlayFabModule.IPlayFabRequestCommon {
    // User email address attached to their account
    Email?: string;
    // Unique PlayFab assigned ID of the user on whom the operation will be performed.
    PlayFabId?: string;
    // Title specific username to match against existing user accounts
    TitleDisplayName?: string;
    // PlayFab username for the account (3-20 characters)
    Username?: string;
}

interface LookupUserAccountInfoResult extends PlayFabModule.IPlayFabResultCommon {
    // User info for the user matching the request
    UserInfo?: UserAccountInfo;
}

interface MembershipModel {
    // Whether this membership is active. That is, whether the MembershipExpiration time has been reached.
    IsActive: boolean;
    // The time this membership expires
    MembershipExpiration: string;
    // The id of the membership
    MembershipId?: string;
    // Membership expirations can be explicitly overridden (via game manager or the admin api). If this membership has been
    // overridden, this will be the new expiration time.
    OverrideExpiration?: string;
    // The list of subscriptions that this player has for this membership
    Subscriptions?: SubscriptionModel[];
}

interface ModifyMatchmakerGameModesRequest extends PlayFabModule.IPlayFabRequestCommon {
    // previously uploaded build version for which game modes are being specified
    BuildVersion: string;
    // array of game modes (Note: this will replace all game modes for the indicated build version)
    GameModes: GameModeInfo[];
}

interface ModifyMatchmakerGameModesResult extends PlayFabModule.IPlayFabResultCommon {}

interface ModifyServerBuildRequest extends PlayFabModule.IPlayFabRequestCommon {
    // array of regions where this build can used, when it is active
    ActiveRegions?: string[];
    // unique identifier of the previously uploaded build executable to be updated
    BuildId: string;
    // appended to the end of the command line when starting game servers
    CommandLineTemplate?: string;
    // developer comment(s) for this build
    Comment?: string;
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // path to the game server executable. Defaults to gameserver.exe
    ExecutablePath?: string;
    // maximum number of game server instances that can run on a single host machine
    MaxGamesPerHost: number;
    // minimum capacity of additional game server instances that can be started before the autoscaling service starts new host
    // machines (given the number of current running host machines and game server instances)
    MinFreeGameSlots: number;
    // new timestamp
    Timestamp?: string;
}

interface ModifyServerBuildResult extends PlayFabModule.IPlayFabResultCommon {
    // array of regions where this build can used, when it is active
    ActiveRegions?: string[];
    // unique identifier for this build executable
    BuildId?: string;
    // appended to the end of the command line when starting game servers
    CommandLineTemplate?: string;
    // developer comment(s) for this build
    Comment?: string;
    // path to the game server executable. Defaults to gameserver.exe
    ExecutablePath?: string;
    // maximum number of game server instances that can run on a single host machine
    MaxGamesPerHost: number;
    // minimum capacity of additional game server instances that can be started before the autoscaling service starts new host
    // machines (given the number of current running host machines and game server instances)
    MinFreeGameSlots: number;
    // the current status of the build validation and processing steps
    Status?: string;
    // time this build was last modified (or uploaded, if this build has never been modified)
    Timestamp: string;
    // Unique identifier for the title, found in the Settings > Game Properties section of the PlayFab developer site when a
    // title has been selected.
    TitleId?: string;
}

interface ModifyUserVirtualCurrencyResult extends PlayFabModule.IPlayFabResultCommon {
    // Balance of the virtual currency after modification.
    Balance: number;
    // Amount added or subtracted from the user's virtual currency. Maximum VC balance is Int32 (2,147,483,647). Any increase
    // over this value will be discarded.
    BalanceChange: number;
    // User currency was subtracted from.
    PlayFabId?: string;
    // Name of the virtual currency which was modified.
    VirtualCurrency?: string;
}

interface NameIdentifier {
    // Id Identifier, if present
    Id?: string;
    // Name Identifier, if present
    Name?: string;
}

interface OpenIdConnection {
    // The client ID given by the ID provider.
    ClientId?: string;
    // The client secret given by the ID provider.
    ClientSecret?: string;
    // A name for the connection to identify it within the title.
    ConnectionId?: string;
    // Shows if data about the connection will be loaded from the issuer's discovery document
    DiscoverConfiguration: boolean;
    // Information for an OpenID Connect provider.
    IssuerInformation?: OpenIdIssuerInformation;
}

interface OpenIdIssuerInformation {
    // Authorization endpoint URL to direct users to for signin.
    AuthorizationUrl: string;
    // The URL of the issuer of the tokens. This must match the exact URL of the issuer field in tokens.
    Issuer: string;
    // JSON Web Key Set for validating the signature of tokens.
    JsonWebKeySet: any;
    // Token endpoint URL for code verification.
    TokenUrl: string;
}

interface PermissionStatement {
    // The action this statement effects. The only supported action is 'Execute'.
    Action: string;
    // Additional conditions to be applied for API Resources.
    ApiConditions?: ApiCondition;
    // A comment about the statement. Intended solely for bookkeeping and debugging.
    Comment?: string;
    // The effect this statement will have. It could be either Allow or Deny
    Effect: string;
    // The principal this statement will effect. The only supported principal is '*'.
    Principal: string;
    // The resource this statements effects. The only supported resources look like 'pfrn:api--*' for all apis, or
    // 'pfrn:api--/Client/ConfirmPurchase' for specific apis.
    Resource: string;
}

interface PlayerLinkedAccount {
    // Linked account's email
    Email?: string;
    // Authentication platform
    Platform?: string;
    // Platform user identifier
    PlatformUserId?: string;
    // Linked account's username
    Username?: string;
}

interface PlayerLocation {
    // City of the player's geographic location.
    City?: string;
    // The two-character continent code for this location
    ContinentCode: string;
    // The two-character ISO 3166-1 country code for the country associated with the location
    CountryCode: string;
    // Latitude coordinate of the player's geographic location.
    Latitude?: number;
    // Longitude coordinate of the player's geographic location.
    Longitude?: number;
}

interface PlayerProfile {
    // Array of ad campaigns player has been attributed to
    AdCampaignAttributions?: AdCampaignAttribution[];
    // Image URL of the player's avatar.
    AvatarUrl?: string;
    // Banned until UTC Date. If permanent ban this is set for 20 years after the original ban date.
    BannedUntil?: string;
    // Array of contact email addresses associated with the player
    ContactEmailAddresses?: ContactEmailInfo[];
    // Player record created
    Created?: string;
    // Player Display Name
    DisplayName?: string;
    // Last login
    LastLogin?: string;
    // Array of third party accounts linked to this player
    LinkedAccounts?: PlayerLinkedAccount[];
    // Dictionary of player's locations by type.
    Locations?: { [key: string]: PlayerLocation };
    // Player account origination
    Origination?: string;
    // List of player variants for experimentation
    PlayerExperimentVariants?: string[];
    // PlayFab Player ID
    PlayerId?: string;
    // Array of player statistics
    PlayerStatistics?: PlayerStatistic[];
    // Publisher this player belongs to
    PublisherId?: string;
    // Array of configured push notification end points
    PushNotificationRegistrations?: PushNotificationRegistration[];
    // Dictionary of player's statistics using only the latest version's value
    Statistics?: { [key: string]: number };
    // List of player's tags for segmentation.
    Tags?: string[];
    // Title ID this profile applies to
    TitleId?: string;
    // A sum of player's total purchases in USD across all currencies.
    TotalValueToDateInUSD?: number;
    // Dictionary of player's total purchases by currency.
    ValuesToDate?: { [key: string]: number };
    // Dictionary of player's virtual currency balances
    VirtualCurrencyBalances?: { [key: string]: number };
}

interface PlayerProfileModel {
    // List of advertising campaigns the player has been attributed to
    AdCampaignAttributions?: AdCampaignAttributionModel[];
    // URL of the player's avatar image
    AvatarUrl?: string;
    // If the player is currently banned, the UTC Date when the ban expires
    BannedUntil?: string;
    // List of all contact email info associated with the player account
    ContactEmailAddresses?: ContactEmailInfoModel[];
    // Player record created
    Created?: string;
    // Player display name
    DisplayName?: string;
    // List of experiment variants for the player.
    ExperimentVariants?: string[];
    // UTC time when the player most recently logged in to the title
    LastLogin?: string;
    // List of all authentication systems linked to this player account
    LinkedAccounts?: LinkedPlatformAccountModel[];
    // List of geographic locations from which the player has logged in to the title
    Locations?: LocationModel[];
    // List of memberships for the player, along with whether are expired.
    Memberships?: MembershipModel[];
    // Player account origination
    Origination?: string;
    // PlayFab player account unique identifier
    PlayerId?: string;
    // Publisher this player belongs to
    PublisherId?: string;
    // List of configured end points registered for sending the player push notifications
    PushNotificationRegistrations?: PushNotificationRegistrationModel[];
    // List of leaderboard statistic values for the player
    Statistics?: StatisticModel[];
    // List of player's tags for segmentation
    Tags?: TagModel[];
    // Title ID this player profile applies to
    TitleId?: string;
    // Sum of the player's purchases made with real-money currencies, converted to US dollars equivalent and represented as a
    // whole number of cents (1/100 USD). For example, 999 indicates nine dollars and ninety-nine cents.
    TotalValueToDateInUSD?: number;
    // List of the player's lifetime purchase totals, summed by real-money currency
    ValuesToDate?: ValueToDateModel[];
}

interface PlayerProfileViewConstraints {
    // Whether to show player's avatar URL. Defaults to false
    ShowAvatarUrl: boolean;
    // Whether to show the banned until time. Defaults to false
    ShowBannedUntil: boolean;
    // Whether to show campaign attributions. Defaults to false
    ShowCampaignAttributions: boolean;
    // Whether to show contact email addresses. Defaults to false
    ShowContactEmailAddresses: boolean;
    // Whether to show the created date. Defaults to false
    ShowCreated: boolean;
    // Whether to show the display name. Defaults to false
    ShowDisplayName: boolean;
    // Whether to show player's experiment variants. Defaults to false
    ShowExperimentVariants: boolean;
    // Whether to show the last login time. Defaults to false
    ShowLastLogin: boolean;
    // Whether to show the linked accounts. Defaults to false
    ShowLinkedAccounts: boolean;
    // Whether to show player's locations. Defaults to false
    ShowLocations: boolean;
    // Whether to show player's membership information. Defaults to false
    ShowMemberships: boolean;
    // Whether to show origination. Defaults to false
    ShowOrigination: boolean;
    // Whether to show push notification registrations. Defaults to false
    ShowPushNotificationRegistrations: boolean;
    // Reserved for future development
    ShowStatistics: boolean;
    // Whether to show tags. Defaults to false
    ShowTags: boolean;
    // Whether to show the total value to date in usd. Defaults to false
    ShowTotalValueToDateInUsd: boolean;
    // Whether to show the values to date. Defaults to false
    ShowValuesToDate: boolean;
}

interface PlayerStatistic {
    // Statistic ID
    Id?: string;
    // Statistic name
    Name?: string;
    // Current statistic value
    StatisticValue: number;
    // Statistic version (0 if not a versioned statistic)
    StatisticVersion: number;
}

interface PlayerStatisticDefinition {
    // the aggregation method to use in updating the statistic (defaults to last)
    AggregationMethod?: string;
    // current active version of the statistic, incremented each time the statistic resets
    CurrentVersion: number;
    // unique name of the statistic
    StatisticName?: string;
    // interval at which the values of the statistic for all players are reset automatically
    VersionChangeInterval?: string;
}

interface PlayerStatisticVersion {
    // time when the statistic version became active
    ActivationTime: string;
    // URL for the downloadable archive of player statistic values, if available
    ArchiveDownloadUrl?: string;
    // time when the statistic version became inactive due to statistic version incrementing
    DeactivationTime?: string;
    // time at which the statistic version was scheduled to become active, based on the configured ResetInterval
    ScheduledActivationTime?: string;
    // time at which the statistic version was scheduled to become inactive, based on the configured ResetInterval
    ScheduledDeactivationTime?: string;
    // name of the statistic when the version became active
    StatisticName?: string;
    // status of the statistic version
    Status?: string;
    // version of the statistic
    Version: number;
}

interface PushNotificationRegistration {
    // Notification configured endpoint
    NotificationEndpointARN?: string;
    // Push notification platform
    Platform?: string;
}

interface PushNotificationRegistrationModel {
    // Notification configured endpoint
    NotificationEndpointARN?: string;
    // Push notification platform
    Platform?: string;
}

type PushSetupPlatform = "GCM"
    | "APNS"
    | "APNS_SANDBOX";

interface RandomResultTable {
    // Child nodes that indicate what kind of drop table item this actually is.
    Nodes: ResultTableNode[];
    // Unique name for this drop table
    TableId: string;
}

interface RandomResultTableListing {
    // Catalog version this table is associated with
    CatalogVersion?: string;
    // Child nodes that indicate what kind of drop table item this actually is.
    Nodes: ResultTableNode[];
    // Unique name for this drop table
    TableId: string;
}

interface RefundPurchaseRequest extends PlayFabModule.IPlayFabRequestCommon {
    // Unique order ID for the purchase in question.
    OrderId: string;
    // Unique PlayFab assigned ID of the user on whom the operation will be performed.
    PlayFabId: string;
    // The Reason parameter should correspond with the payment providers reason field, if they require one such as Facebook. In
    // the case of Facebook this must match one of their refund or dispute resolution enums (See:
    // https://developers.facebook.com/docs/payments/implementation-guide/handling-disputes-refunds)
    Reason?: string;
}

interface RefundPurchaseResponse extends PlayFabModule.IPlayFabResultCommon {
    // The order's updated purchase status.
    PurchaseStatus?: string;
}

interface RemovePlayerTagRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // Unique PlayFab assigned ID of the user on whom the operation will be performed.
    PlayFabId: string;
    // Unique tag for player profile.
    TagName: string;
}

interface RemovePlayerTagResult extends PlayFabModule.IPlayFabResultCommon {}

interface RemoveServerBuildRequest extends PlayFabModule.IPlayFabRequestCommon {
    // unique identifier of the previously uploaded build executable to be removed
    BuildId: string;
}

interface RemoveServerBuildResult extends PlayFabModule.IPlayFabResultCommon {}

interface RemoveVirtualCurrencyTypesRequest extends PlayFabModule.IPlayFabRequestCommon {
    // List of virtual currencies to delete
    VirtualCurrencies: VirtualCurrencyData[];
}

interface ResetCharacterStatisticsRequest extends PlayFabModule.IPlayFabRequestCommon {
    // Unique PlayFab assigned ID for a specific character owned by a user
    CharacterId: string;
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // Unique PlayFab assigned ID of the user on whom the operation will be performed.
    PlayFabId: string;
}

interface ResetCharacterStatisticsResult extends PlayFabModule.IPlayFabResultCommon {}

interface ResetPasswordRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // The new password for the player.
    Password: string;
    // The token of the player requesting the password reset.
    Token: string;
}

interface ResetPasswordResult extends PlayFabModule.IPlayFabResultCommon {}

interface ResetUserStatisticsRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // Unique PlayFab assigned ID of the user on whom the operation will be performed.
    PlayFabId: string;
}

interface ResetUserStatisticsResult extends PlayFabModule.IPlayFabResultCommon {}

type ResolutionOutcome = "Revoke"
    | "Reinstate"
    | "Manual";

interface ResolvePurchaseDisputeRequest extends PlayFabModule.IPlayFabRequestCommon {
    // Unique order ID for the purchase in question.
    OrderId: string;
    // Enum for the desired purchase result state after notifying the payment provider. Valid values are Revoke, Reinstate and
    // Manual. Manual will cause no change to the order state.
    Outcome: string;
    // Unique PlayFab assigned ID of the user on whom the operation will be performed.
    PlayFabId: string;
    // The Reason parameter should correspond with the payment providers reason field, if they require one such as Facebook. In
    // the case of Facebook this must match one of their refund or dispute resolution enums (See:
    // https://developers.facebook.com/docs/payments/implementation-guide/handling-disputes-refunds)
    Reason?: string;
}

interface ResolvePurchaseDisputeResponse extends PlayFabModule.IPlayFabResultCommon {
    // The order's updated purchase status.
    PurchaseStatus?: string;
}

interface ResultTableNode {
    // Either an ItemId, or the TableId of another random result table
    ResultItem: string;
    // Whether this entry in the table is an item or a link to another table
    ResultItemType: string;
    // How likely this is to be rolled - larger numbers add more weight
    Weight: number;
}

type ResultTableNodeType = "ItemId"
    | "TableId";

interface RevokeAllBansForUserRequest extends PlayFabModule.IPlayFabRequestCommon {
    // Unique PlayFab assigned ID of the user on whom the operation will be performed.
    PlayFabId: string;
}

interface RevokeAllBansForUserResult extends PlayFabModule.IPlayFabResultCommon {
    // Information on the bans that were revoked.
    BanData?: BanInfo[];
}

interface RevokeBansRequest extends PlayFabModule.IPlayFabRequestCommon {
    // Ids of the bans to be revoked. Maximum 100.
    BanIds: string[];
}

interface RevokeBansResult extends PlayFabModule.IPlayFabResultCommon {
    // Information on the bans that were revoked
    BanData?: BanInfo[];
}

interface RevokeInventoryItem {
    // Unique PlayFab assigned ID for a specific character owned by a user
    CharacterId?: string;
    // Unique PlayFab assigned instance identifier of the item
    ItemInstanceId: string;
    // Unique PlayFab assigned ID of the user on whom the operation will be performed.
    PlayFabId: string;
}

interface RevokeInventoryItemRequest extends PlayFabModule.IPlayFabRequestCommon {
    // Unique PlayFab assigned ID for a specific character owned by a user
    CharacterId?: string;
    // Unique PlayFab assigned instance identifier of the item
    ItemInstanceId: string;
    // Unique PlayFab assigned ID of the user on whom the operation will be performed.
    PlayFabId: string;
}

interface RevokeInventoryItemsRequest extends PlayFabModule.IPlayFabRequestCommon {
    // Array of player items to revoke, between 1 and 25 items.
    Items: RevokeInventoryItem[];
}

interface RevokeInventoryItemsResult extends PlayFabModule.IPlayFabResultCommon {
    // Collection of any errors that occurred during processing.
    Errors?: RevokeItemError[];
}

interface RevokeInventoryResult extends PlayFabModule.IPlayFabResultCommon {}

interface RevokeItemError {
    // Specific error that was encountered.
    Error?: string;
    // Item information that failed to be revoked.
    Item?: RevokeInventoryItem;
}

interface RunTaskRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // Provide either the task ID or the task name to run a task.
    Identifier?: NameIdentifier;
}

interface RunTaskResult extends PlayFabModule.IPlayFabResultCommon {
    // ID of the task instance that is started. This can be used in Get*TaskInstance (e.g. GetCloudScriptTaskInstance) API call
    // to retrieve status for the task instance.
    TaskInstanceId?: string;
}

interface ScheduledTask {
    // Description the task
    Description?: string;
    // Whether the schedule is active. Inactive schedule will not trigger task execution.
    IsActive: boolean;
    // UTC time of last run
    LastRunTime?: string;
    // Name of the task. This is a unique identifier for tasks in the title.
    Name: string;
    // UTC time of next run
    NextRunTime?: string;
    // Task parameter. Different types of task have different parameter structure. See each task type's create API
    // documentation for the details.
    Parameter?: any;
    // Cron expression for the run schedule of the task. The expression should be in UTC.
    Schedule?: string;
    // ID of the task
    TaskId?: string;
    // Task type.
    Type?: string;
}

type ScheduledTaskType = "CloudScript"
    | "ActionsOnPlayerSegment"
    | "CloudScriptAzureFunctions"
    | "InsightsScheduledScaling";

interface ScriptExecutionError {
    // Error code, such as CloudScriptNotFound, JavascriptException, CloudScriptFunctionArgumentSizeExceeded,
    // CloudScriptAPIRequestCountExceeded, CloudScriptAPIRequestError, or CloudScriptHTTPRequestError
    Error?: string;
    // Details about the error
    Message?: string;
    // Point during the execution of the script at which the error occurred, if any
    StackTrace?: string;
}

interface SendAccountRecoveryEmailRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // User email address attached to their account
    Email: string;
    // The email template id of the account recovery email template to send.
    EmailTemplateId?: string;
}

interface SendAccountRecoveryEmailResult extends PlayFabModule.IPlayFabResultCommon {}

interface SetPlayerSecretRequest extends PlayFabModule.IPlayFabRequestCommon {
    // Player secret that is used to verify API request signatures (Enterprise Only).
    PlayerSecret?: string;
    // Unique PlayFab assigned ID of the user on whom the operation will be performed.
    PlayFabId: string;
}

interface SetPlayerSecretResult extends PlayFabModule.IPlayFabResultCommon {}

interface SetPublishedRevisionRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // Revision to make the current published revision
    Revision: number;
    // Version number
    Version: number;
}

interface SetPublishedRevisionResult extends PlayFabModule.IPlayFabResultCommon {}

interface SetPublisherDataRequest extends PlayFabModule.IPlayFabRequestCommon {
    // key we want to set a value on (note, this is additive - will only replace an existing key's value if they are the same
    // name.) Keys are trimmed of whitespace. Keys may not begin with the '!' character.
    Key: string;
    // new value to set. Set to null to remove a value
    Value?: string;
}

interface SetPublisherDataResult extends PlayFabModule.IPlayFabResultCommon {}

interface SetTitleDataAndOverridesRequest extends PlayFabModule.IPlayFabRequestCommon {
    // List of titleData key-value pairs to set/delete. Use an empty value to delete an existing key; use a non-empty value to
    // create/update a key.
    KeyValues: TitleDataKeyValue[];
    // Name of the override.
    OverrideLabel?: string;
}

interface SetTitleDataAndOverridesResult extends PlayFabModule.IPlayFabResultCommon {}

interface SetTitleDataRequest extends PlayFabModule.IPlayFabRequestCommon {
    // key we want to set a value on (note, this is additive - will only replace an existing key's value if they are the same
    // name.) Keys are trimmed of whitespace. Keys may not begin with the '!' character.
    Key: string;
    // new value to set. Set to null to remove a value
    Value?: string;
}

interface SetTitleDataResult extends PlayFabModule.IPlayFabResultCommon {}

interface SetupPushNotificationRequest extends PlayFabModule.IPlayFabRequestCommon {
    // Credential is the Private Key for APNS/APNS_SANDBOX, and the API Key for GCM
    Credential: string;
    // for APNS, this is the PlatformPrincipal (SSL Certificate)
    Key?: string;
    // name of the application sending the message (application names must be made up of only uppercase and lowercase ASCII
    // letters, numbers, underscores, hyphens, and periods, and must be between 1 and 256 characters long)
    Name: string;
    // replace any existing ARN with the newly generated one. If this is set to false, an error will be returned if
    // notifications have already setup for this platform.
    OverwriteOldARN: boolean;
    // supported notification platforms are Apple Push Notification Service (APNS and APNS_SANDBOX) for iOS and Google Cloud
    // Messaging (GCM) for Android
    Platform: string;
}

interface SetupPushNotificationResult extends PlayFabModule.IPlayFabResultCommon {
    // Amazon Resource Name for the created notification topic.
    ARN?: string;
}

interface SharedSecret {
    // Flag to indicate if this key is disabled
    Disabled: boolean;
    // Friendly name for this key
    FriendlyName?: string;
    // The player shared secret to use when calling Client/GetTitlePublicKey
    SecretKey?: string;
}

type StatisticAggregationMethod = "Last"
    | "Min"
    | "Max"
    | "Sum";

interface StatisticModel {
    // Statistic name
    Name?: string;
    // Statistic value
    Value: number;
    // Statistic version (0 if not a versioned statistic)
    Version: number;
}

type StatisticResetIntervalOption = "Never"
    | "Hour"
    | "Day"
    | "Week"
    | "Month";

type StatisticVersionArchivalStatus = "NotScheduled"
    | "Scheduled"
    | "Queued"
    | "InProgress"
    | "Complete";

type StatisticVersionStatus = "Active"
    | "SnapshotPending"
    | "Snapshot"
    | "ArchivalPending"
    | "Archived";

interface StoreItem {
    // Store specific custom data. The data only exists as part of this store; it is not transferred to item instances
    CustomData?: any;
    // Intended display position for this item. Note that 0 is the first position
    DisplayPosition?: number;
    // Unique identifier of the item as it exists in the catalog - note that this must exactly match the ItemId from the
    // catalog
    ItemId: string;
    // Override prices for this item for specific currencies
    RealCurrencyPrices?: { [key: string]: number };
    // Override prices for this item in virtual currencies and "RM" (the base Real Money purchase price, in USD pennies)
    VirtualCurrencyPrices?: { [key: string]: number };
}

interface StoreMarketingModel {
    // Tagline for a store.
    Description?: string;
    // Display name of a store as it will appear to users.
    DisplayName?: string;
    // Custom data about a store.
    Metadata?: any;
}

interface SubscriptionModel {
    // When this subscription expires.
    Expiration: string;
    // The time the subscription was orignially purchased
    InitialSubscriptionTime: string;
    // Whether this subscription is currently active. That is, if Expiration > now.
    IsActive: boolean;
    // The status of this subscription, according to the subscription provider.
    Status?: string;
    // The id for this subscription
    SubscriptionId?: string;
    // The item id for this subscription from the primary catalog
    SubscriptionItemId?: string;
    // The provider for this subscription. Apple or Google Play are supported today.
    SubscriptionProvider?: string;
}

interface SubtractUserVirtualCurrencyRequest extends PlayFabModule.IPlayFabRequestCommon {
    // Amount to be subtracted from the user balance of the specified virtual currency.
    Amount: number;
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // PlayFab unique identifier of the user whose virtual currency balance is to be decreased.
    PlayFabId: string;
    // Name of the virtual currency which is to be decremented.
    VirtualCurrency: string;
}

interface TagModel {
    // Full value of the tag, including namespace
    TagValue?: string;
}

interface TaskInstanceBasicSummary {
    // UTC timestamp when the task completed.
    CompletedAt?: string;
    // Error message for last processing attempt, if an error occured.
    ErrorMessage?: string;
    // Estimated time remaining in seconds.
    EstimatedSecondsRemaining?: number;
    // Progress represented as percentage.
    PercentComplete?: number;
    // If manually scheduled, ID of user who scheduled the task.
    ScheduledByUserId?: string;
    // UTC timestamp when the task started.
    StartedAt: string;
    // Current status of the task instance.
    Status?: string;
    // Identifier of the task this instance belongs to.
    TaskIdentifier?: NameIdentifier;
    // ID of the task instance.
    TaskInstanceId?: string;
    // Type of the task.
    Type?: string;
}

type TaskInstanceStatus = "Succeeded"
    | "Starting"
    | "InProgress"
    | "Failed"
    | "Aborted"
    | "Stalled";

interface TitleDataKeyValue {
    // Key we want to set a value on (note, this is additive - will only replace an existing key's value if they are the same
    // name.) Keys are trimmed of whitespace. Keys may not begin with the '!' character.
    Key?: string;
    // New value to set. Set to null to remove a value
    Value?: string;
}

interface UpdateBanRequest {
    // The updated active state for the ban. Null for no change.
    Active?: boolean;
    // The id of the ban to be updated.
    BanId: string;
    // The updated expiration date for the ban. Null for no change.
    Expires?: string;
    // The updated IP address for the ban. Null for no change.
    IPAddress?: string;
    // The updated MAC address for the ban. Null for no change.
    MACAddress?: string;
    // Whether to make this ban permanent. Set to true to make this ban permanent. This will not modify Active state.
    Permanent?: boolean;
    // The updated reason for the ban to be updated. Maximum 140 characters. Null for no change.
    Reason?: string;
}

interface UpdateBansRequest extends PlayFabModule.IPlayFabRequestCommon {
    // List of bans to be updated. Maximum 100.
    Bans: UpdateBanRequest[];
}

interface UpdateBansResult extends PlayFabModule.IPlayFabResultCommon {
    // Information on the bans that were updated
    BanData?: BanInfo[];
}

interface UpdateCatalogItemsRequest extends PlayFabModule.IPlayFabRequestCommon {
    // Array of catalog items to be submitted. Note that while CatalogItem has a parameter for CatalogVersion, it is not
    // required and ignored in this call.
    Catalog?: CatalogItem[];
    // Which catalog is being updated. If null, uses the default catalog.
    CatalogVersion?: string;
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // Should this catalog be set as the default catalog. Defaults to true. If there is currently no default catalog, this will
    // always set it.
    SetAsDefaultCatalog?: boolean;
}

interface UpdateCatalogItemsResult extends PlayFabModule.IPlayFabResultCommon {}

interface UpdateCloudScriptRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // PlayFab user ID of the developer initiating the request.
    DeveloperPlayFabId?: string;
    // List of Cloud Script files to upload to create the new revision. Must have at least one file.
    Files: CloudScriptFile[];
    // Immediately publish the new revision
    Publish: boolean;
}

interface UpdateCloudScriptResult extends PlayFabModule.IPlayFabResultCommon {
    // New revision number created
    Revision: number;
    // Cloud Script version updated
    Version: number;
}

interface UpdateOpenIdConnectionRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The client ID given by the ID provider.
    ClientId?: string;
    // The client secret given by the ID provider.
    ClientSecret?: string;
    // A name for the connection that identifies it within the title.
    ConnectionId: string;
    // The issuer URL or discovery document URL to read issuer information from
    IssuerDiscoveryUrl?: string;
    // Manually specified information for an OpenID Connect issuer.
    IssuerInformation?: OpenIdIssuerInformation;
}

interface UpdatePlayerSharedSecretRequest extends PlayFabModule.IPlayFabRequestCommon {
    // Disable or Enable this key
    Disabled: boolean;
    // Friendly name for this key
    FriendlyName?: string;
    // The shared secret key to update
    SecretKey?: string;
}

interface UpdatePlayerSharedSecretResult extends PlayFabModule.IPlayFabResultCommon {}

interface UpdatePlayerStatisticDefinitionRequest extends PlayFabModule.IPlayFabRequestCommon {
    // the aggregation method to use in updating the statistic (defaults to last)
    AggregationMethod?: string;
    // unique name of the statistic
    StatisticName: string;
    // interval at which the values of the statistic for all players are reset (changes are effective at the next occurance of
    // the new interval boundary)
    VersionChangeInterval?: string;
}

interface UpdatePlayerStatisticDefinitionResult extends PlayFabModule.IPlayFabResultCommon {
    // updated statistic definition
    Statistic?: PlayerStatisticDefinition;
}

interface UpdatePolicyRequest extends PlayFabModule.IPlayFabRequestCommon {
    // Whether to overwrite or append to the existing policy.
    OverwritePolicy: boolean;
    // The name of the policy being updated. Only supported name is 'ApiPolicy'
    PolicyName: string;
    // The new statements to include in the policy.
    Statements: PermissionStatement[];
}

interface UpdatePolicyResponse extends PlayFabModule.IPlayFabResultCommon {
    // The name of the policy that was updated.
    PolicyName?: string;
    // The statements included in the new version of the policy.
    Statements?: PermissionStatement[];
}

interface UpdateRandomResultTablesRequest extends PlayFabModule.IPlayFabRequestCommon {
    // which catalog is being updated. If null, update the current default catalog version
    CatalogVersion?: string;
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // array of random result tables to make available (Note: specifying an existing TableId will result in overwriting that
    // table, while any others will be added to the available set)
    Tables?: RandomResultTable[];
}

interface UpdateRandomResultTablesResult extends PlayFabModule.IPlayFabResultCommon {}

interface UpdateStoreItemsRequest extends PlayFabModule.IPlayFabRequestCommon {
    // Catalog version of the store to update. If null, uses the default catalog.
    CatalogVersion?: string;
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // Additional data about the store
    MarketingData?: StoreMarketingModel;
    // Array of store items - references to catalog items, with specific pricing - to be added
    Store?: StoreItem[];
    // Unique identifier for the store which is to be updated
    StoreId: string;
}

interface UpdateStoreItemsResult extends PlayFabModule.IPlayFabResultCommon {}

interface UpdateTaskRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // Description the task
    Description?: string;
    // Specify either the task ID or the name of the task to be updated.
    Identifier?: NameIdentifier;
    // Whether the schedule is active. Inactive schedule will not trigger task execution.
    IsActive: boolean;
    // Name of the task. This is a unique identifier for tasks in the title.
    Name: string;
    // Parameter object specific to the task type. See each task type's create API documentation for details.
    Parameter?: any;
    // Cron expression for the run schedule of the task. The expression should be in UTC.
    Schedule?: string;
    // Task type.
    Type: string;
}

interface UpdateUserDataRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // Key-value pairs to be written to the custom data. Note that keys are trimmed of whitespace, are limited in size, and may
    // not begin with a '!' character or be null.
    Data?: { [key: string]: string | null };
    // Optional list of Data-keys to remove from UserData. Some SDKs cannot insert null-values into Data due to language
    // constraints. Use this to delete the keys directly.
    KeysToRemove?: string[];
    // Permission to be applied to all user data keys written in this request. Defaults to "private" if not set.
    Permission?: string;
    // Unique PlayFab assigned ID of the user on whom the operation will be performed.
    PlayFabId: string;
}

interface UpdateUserDataResult extends PlayFabModule.IPlayFabResultCommon {
    // Indicates the current version of the data that has been set. This is incremented with every set call for that type of
    // data (read-only, internal, etc). This version can be provided in Get calls to find updated data.
    DataVersion: number;
}

interface UpdateUserInternalDataRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // Key-value pairs to be written to the custom data. Note that keys are trimmed of whitespace, are limited in size, and may
    // not begin with a '!' character or be null.
    Data?: { [key: string]: string | null };
    // Optional list of Data-keys to remove from UserData. Some SDKs cannot insert null-values into Data due to language
    // constraints. Use this to delete the keys directly.
    KeysToRemove?: string[];
    // Unique PlayFab assigned ID of the user on whom the operation will be performed.
    PlayFabId: string;
}

interface UpdateUserTitleDisplayNameRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // New title display name for the user - must be between 3 and 25 characters
    DisplayName: string;
    // PlayFab unique identifier of the user whose title specific display name is to be changed
    PlayFabId: string;
}

interface UpdateUserTitleDisplayNameResult extends PlayFabModule.IPlayFabResultCommon {
    // current title display name for the user (this will be the original display name if the rename attempt failed)
    DisplayName?: string;
}

interface UserAccountInfo {
    // User Android device information, if an Android device has been linked
    AndroidDeviceInfo?: UserAndroidDeviceInfo;
    // Sign in with Apple account information, if an Apple account has been linked
    AppleAccountInfo?: UserAppleIdInfo;
    // Timestamp indicating when the user account was created
    Created: string;
    // Custom ID information, if a custom ID has been assigned
    CustomIdInfo?: UserCustomIdInfo;
    // User Facebook information, if a Facebook account has been linked
    FacebookInfo?: UserFacebookInfo;
    // Facebook Instant Games account information, if a Facebook Instant Games account has been linked
    FacebookInstantGamesIdInfo?: UserFacebookInstantGamesIdInfo;
    // User Gamecenter information, if a Gamecenter account has been linked
    GameCenterInfo?: UserGameCenterInfo;
    // User Google account information, if a Google account has been linked
    GoogleInfo?: UserGoogleInfo;
    // User iOS device information, if an iOS device has been linked
    IosDeviceInfo?: UserIosDeviceInfo;
    // User Kongregate account information, if a Kongregate account has been linked
    KongregateInfo?: UserKongregateInfo;
    // Nintendo Switch account information, if a Nintendo Switch account has been linked
    NintendoSwitchAccountInfo?: UserNintendoSwitchAccountIdInfo;
    // Nintendo Switch device information, if a Nintendo Switch device has been linked
    NintendoSwitchDeviceIdInfo?: UserNintendoSwitchDeviceIdInfo;
    // OpenID Connect information, if any OpenID Connect accounts have been linked
    OpenIdInfo?: UserOpenIdInfo[];
    // Unique identifier for the user account
    PlayFabId?: string;
    // Personal information for the user which is considered more sensitive
    PrivateInfo?: UserPrivateAccountInfo;
    // User PSN account information, if a PSN account has been linked
    PsnInfo?: UserPsnInfo;
    // User Steam information, if a Steam account has been linked
    SteamInfo?: UserSteamInfo;
    // Title-specific information for the user account
    TitleInfo?: UserTitleInfo;
    // User Twitch account information, if a Twitch account has been linked
    TwitchInfo?: UserTwitchInfo;
    // User account name in the PlayFab service
    Username?: string;
    // Windows Hello account information, if a Windows Hello account has been linked
    WindowsHelloInfo?: UserWindowsHelloInfo;
    // User XBox account information, if a XBox account has been linked
    XboxInfo?: UserXboxInfo;
}

interface UserAndroidDeviceInfo {
    // Android device ID
    AndroidDeviceId?: string;
}

interface UserAppleIdInfo {
    // Apple subject ID
    AppleSubjectId?: string;
}

interface UserCustomIdInfo {
    // Custom ID
    CustomId?: string;
}

interface UserDataRecord {
    // Timestamp for when this data was last updated.
    LastUpdated: string;
    // Indicates whether this data can be read by all users (public) or only the user (private). This is used for GetUserData
    // requests being made by one player about another player.
    Permission?: string;
    // Data stored for the specified user data key.
    Value?: string;
}

interface UserFacebookInfo {
    // Facebook identifier
    FacebookId?: string;
    // Facebook full name
    FullName?: string;
}

interface UserFacebookInstantGamesIdInfo {
    // Facebook Instant Games ID
    FacebookInstantGamesId?: string;
}

interface UserGameCenterInfo {
    // Gamecenter identifier
    GameCenterId?: string;
}

interface UserGoogleInfo {
    // Email address of the Google account
    GoogleEmail?: string;
    // Gender information of the Google account
    GoogleGender?: string;
    // Google ID
    GoogleId?: string;
    // Locale of the Google account
    GoogleLocale?: string;
    // Name of the Google account user
    GoogleName?: string;
}

interface UserIosDeviceInfo {
    // iOS device ID
    IosDeviceId?: string;
}

interface UserKongregateInfo {
    // Kongregate ID
    KongregateId?: string;
    // Kongregate Username
    KongregateName?: string;
}

interface UserNintendoSwitchAccountIdInfo {
    // Nintendo Switch account subject ID
    NintendoSwitchAccountSubjectId?: string;
}

interface UserNintendoSwitchDeviceIdInfo {
    // Nintendo Switch Device ID
    NintendoSwitchDeviceId?: string;
}

interface UserOpenIdInfo {
    // OpenID Connection ID
    ConnectionId?: string;
    // OpenID Issuer
    Issuer?: string;
    // OpenID Subject
    Subject?: string;
}

interface UserPrivateAccountInfo {
    // user email address
    Email?: string;
}

interface UserPsnInfo {
    // PSN account ID
    PsnAccountId?: string;
    // PSN online ID
    PsnOnlineId?: string;
}

interface UserSteamInfo {
    // what stage of game ownership the user is listed as being in, from Steam
    SteamActivationStatus?: string;
    // the country in which the player resides, from Steam data
    SteamCountry?: string;
    // currency type set in the user Steam account
    SteamCurrency?: string;
    // Steam identifier
    SteamId?: string;
    // Steam display name
    SteamName?: string;
}

interface UserTitleInfo {
    // URL to the player's avatar.
    AvatarUrl?: string;
    // timestamp indicating when the user was first associated with this game (this can differ significantly from when the user
    // first registered with PlayFab)
    Created: string;
    // name of the user, as it is displayed in-game
    DisplayName?: string;
    // timestamp indicating when the user first signed into this game (this can differ from the Created timestamp, as other
    // events, such as issuing a beta key to the user, can associate the title to the user)
    FirstLogin?: string;
    // boolean indicating whether or not the user is currently banned for a title
    isBanned?: boolean;
    // timestamp for the last user login for this title
    LastLogin?: string;
    // source by which the user first joined the game, if known
    Origination?: string;
    // Title player account entity for this user
    TitlePlayerAccount?: EntityKey;
}

interface UserTwitchInfo {
    // Twitch ID
    TwitchId?: string;
    // Twitch Username
    TwitchUserName?: string;
}

interface UserWindowsHelloInfo {
    // Windows Hello Device Name
    WindowsHelloDeviceName?: string;
    // Windows Hello Public Key Hash
    WindowsHelloPublicKeyHash?: string;
}

interface UserXboxInfo {
    // XBox user ID
    XboxUserId?: string;
}

interface ValueToDateModel {
    // ISO 4217 code of the currency used in the purchases
    Currency?: string;
    // Total value of the purchases in a whole number of 1/100 monetary units. For example, 999 indicates nine dollars and
    // ninety-nine cents when Currency is 'USD')
    TotalValue: number;
    // Total value of the purchases in a string representation of decimal monetary units. For example, '9.99' indicates nine
    // dollars and ninety-nine cents when Currency is 'USD'.
    TotalValueAsDecimal?: string;
}

interface VirtualCurrencyData {
    // unique two-character identifier for this currency type (e.g.: "CC")
    CurrencyCode: string;
    // friendly name to show in the developer portal, reports, etc.
    DisplayName?: string;
    // amount to automatically grant users upon first login to the title
    InitialDeposit?: number;
    // maximum amount to which the currency will recharge (cannot exceed MaxAmount, but can be less)
    RechargeMax?: number;
    // rate at which the currency automatically be added to over time, in units per day (24 hours)
    RechargeRate?: number;
}

interface VirtualCurrencyRechargeTime {
    // Maximum value to which the regenerating currency will automatically increment. Note that it can exceed this value
    // through use of the AddUserVirtualCurrency API call. However, it will not regenerate automatically until it has fallen
    // below this value.
    RechargeMax: number;
    // Server timestamp in UTC indicating the next time the virtual currency will be incremented.
    RechargeTime: string;
    // Time remaining (in seconds) before the next recharge increment of the virtual currency.
    SecondsToRecharge: number;
}