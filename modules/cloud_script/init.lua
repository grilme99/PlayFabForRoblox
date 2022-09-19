--!strict
--[=[
	# CloudScriptApi

	API methods for executing CloudScript using an Entity Profile. 
]=]

local PlayFabInternal = require(script.Parent.PlayFabInternal)

local CloudScriptApi = {}

export type AdCampaignAttributionModel = {
	AttributedAt: string, --- UTC time stamp of attribution
	CampaignId: string?, --- Attribution campaign identifier
	Platform: string?, --- Attribution network name
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

export type CloudScriptRevisionOption = 
	"Live"
	| "Latest"
	| "Specific"

export type ContactEmailInfoModel = {
	EmailAddress: string?, --- The email address
	Name: string?, --- The name of the email info data
	VerificationStatus: string?, --- The verification status of the email
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

export type EmailVerificationStatus = 
	"Unverified"
	| "Pending"
	| "Confirmed"

export type EmptyResult = {
}

--- Combined entity type and ID structure which uniquely identifies a single entity. 
export type EntityKey = {
	Id: string, --- Unique ID of the entity.
	Type: string?, --- Entity type. See https://docs.microsoft.com/gaming/playfab/features/data/entities/available-built-in-entity-types
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

--- Executes CloudScript with the entity profile that is defined in the request. 
export type ExecuteEntityCloudScriptRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	Entity: EntityKey?, --- The optional entity to perform this action on. Defaults to the currently logged in entity.
	FunctionName: string, --- The name of the CloudScript function to execute
	FunctionParameter: {[any]: any}?, --- Object that is passed in to the function as the first argument
	GeneratePlayStreamEvent: boolean?, --- Generate a 'entity_executed_cloudscript' PlayStream event containing the results of the function execution and other contextual information. This event will show up in the PlayStream debugger console for the player in Game Manager.
	RevisionSelection: string?, --- Option for which revision of the CloudScript to execute. 'Latest' executes the most recently created revision, 'Live' executes the current live, published revision, and 'Specific' executes the specified revision. The default value is 'Specific', if the SpecificRevision parameter is specified, otherwise it is 'Live'.
	SpecificRevision: number?, --- The specific revision to execute, when RevisionSelection is set to 'Specific'
}

--- Executes an Azure Function with the profile of the entity that is defined in 
--- the request. 
export type ExecuteFunctionRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	Entity: EntityKey?, --- The optional entity to perform this action on. Defaults to the currently logged in entity.
	FunctionName: string, --- The name of the CloudScript function to execute
	FunctionParameter: {[any]: any}?, --- Object that is passed in to the function as the FunctionArgument field of the FunctionExecutionContext data structure
	GeneratePlayStreamEvent: boolean?, --- Generate a 'entity_executed_cloudscript_function' PlayStream event containing the results of the function execution and other contextual information. This event will show up in the PlayStream debugger console for the player in Game Manager.
}

export type ExecuteFunctionResult = {
	Error: FunctionExecutionError?, --- Error from the CloudScript Azure Function.
	ExecutionTimeMilliseconds: number, --- The amount of time the function took to execute
	FunctionName: string?, --- The name of the function that executed
	FunctionResult: {[any]: any}?, --- The object returned from the function, if any
	FunctionResultTooLarge: boolean?, --- Flag indicating if the FunctionResult was too large and was subsequently dropped from this event.
}

export type FunctionExecutionError = {
	Error: string?, --- Error code, such as CloudScriptAzureFunctionsExecutionTimeLimitExceeded, CloudScriptAzureFunctionsArgumentSizeExceeded, CloudScriptAzureFunctionsReturnSizeExceeded or CloudScriptAzureFunctionsHTTPRequestError
	Message: string?, --- Details about the error
	StackTrace: string?, --- Point during the execution of the function at which the error occurred, if any
}

export type FunctionModel = {
	FunctionAddress: string?, --- The address of the function.
	FunctionName: string?, --- The name the function was registered under.
	TriggerType: string?, --- The trigger type for the function.
}

export type GetFunctionRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	FunctionName: string, --- The name of the function to register
}

export type GetFunctionResult = {
	ConnectionString: string?, --- The connection string for the storage account containing the queue for a queue trigger Azure Function.
	FunctionUrl: string?, --- The URL to be invoked to execute an HTTP triggered function.
	QueueName: string?, --- The name of the queue for a queue trigger Azure Function.
	TriggerType: string?, --- The trigger type for the function.
}

export type HttpFunctionModel = {
	FunctionName: string?, --- The name the function was registered under.
	FunctionUrl: string?, --- The URL of the function.
}

export type LinkedPlatformAccountModel = {
	Email: string?, --- Linked account email of the user on the platform, if available
	Platform: string?, --- Authentication platform
	PlatformUserId: string?, --- Unique account identifier of the user on the platform
	Username: string?, --- Linked account username of the user on the platform, if available
}

--- A title can have many functions, ListHttpFunctions will return a list of all 
--- the currently registered HTTP triggered functions for a given title. 
export type ListFunctionsRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
}

export type ListFunctionsResult = {
	Functions: {FunctionModel}?, --- The list of functions that are currently registered for the title.
}

export type ListHttpFunctionsResult = {
	Functions: {HttpFunctionModel}?, --- The list of HTTP triggered functions that are currently registered for the title.
}

export type ListQueuedFunctionsResult = {
	Functions: {QueuedFunctionModel}?, --- The list of Queue triggered functions that are currently registered for the title.
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

export type MembershipModel = {
	IsActive: boolean, --- Whether this membership is active. That is, whether the MembershipExpiration time has been reached.
	MembershipExpiration: string, --- The time this membership expires
	MembershipId: string?, --- The id of the membership
	OverrideExpiration: string?, --- Membership expirations can be explicitly overridden (via game manager or the admin api). If this membership has been overridden, this will be the new expiration time.
	OverrideIsSet: boolean?, --- Whether the override expiration is set.
	Subscriptions: {SubscriptionModel}?, --- The list of subscriptions that this player has for this membership
}

--- Identifier by either name or ID. Note that a name may change due to renaming, 
--- or reused after being deleted. ID is immutable and unique. 
export type NameIdentifier = {
	Id: string?, --- Id Identifier, if present
	Name: string?, --- Name Identifier, if present
}

export type PlayStreamEventEnvelopeModel = {
	EntityId: string?, --- The ID of the entity the event is about.
	EntityType: string?, --- The type of the entity the event is about.
	EventData: string?, --- Data specific to this event.
	EventName: string?, --- The name of the event.
	EventNamespace: string?, --- The namespace of the event.
	EventSettings: string?, --- Settings for the event.
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

export type PostFunctionResultForEntityTriggeredActionRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	Entity: EntityKey, --- The entity to perform this action on.
	FunctionResult: ExecuteFunctionResult, --- The result of the function execution.
}

export type PostFunctionResultForFunctionExecutionRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	Entity: EntityKey, --- The entity to perform this action on.
	FunctionResult: ExecuteFunctionResult, --- The result of the function execution.
}

export type PostFunctionResultForPlayerTriggeredActionRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	Entity: EntityKey?, --- The optional entity to perform this action on. Defaults to the currently logged in entity.
	FunctionResult: ExecuteFunctionResult, --- The result of the function execution.
	PlayStreamEventEnvelope: PlayStreamEventEnvelopeModel?, --- The triggering PlayStream event, if any, that caused the function to be invoked.
	PlayerProfile: PlayerProfileModel, --- The player profile the function was invoked with.
}

export type PostFunctionResultForScheduledTaskRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	Entity: EntityKey, --- The entity to perform this action on.
	FunctionResult: ExecuteFunctionResult, --- The result of the function execution
	ScheduledTaskId: NameIdentifier, --- The id of the scheduled task that invoked the function.
}

export type PushNotificationPlatform = 
	"ApplePushNotificationService"
	| "GoogleCloudMessaging"

export type PushNotificationRegistrationModel = {
	NotificationEndpointARN: string?, --- Notification configured endpoint
	Platform: string?, --- Push notification platform
}

export type QueuedFunctionModel = {
	ConnectionString: string?, --- The connection string for the Azure Storage Account that hosts the queue.
	FunctionName: string?, --- The name the function was registered under.
	QueueName: string?, --- The name of the queue that triggers the Azure Function.
}

export type RegisterHttpFunctionRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	FunctionName: string, --- The name of the function to register
	FunctionUrl: string, --- Full URL for Azure Function that implements the function.
}

--- A title can have many functions, RegisterQueuedFunction associates a function 
--- name with a queue name and connection string. 
export type RegisterQueuedFunctionRequest = {
	ConnectionString: string, --- A connection string for the storage account that hosts the queue for the Azure Function.
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	FunctionName: string, --- The name of the function to register
	QueueName: string, --- The name of the queue for the Azure Function.
}

export type ScriptExecutionError = {
	Error: string?, --- Error code, such as CloudScriptNotFound, JavascriptException, CloudScriptFunctionArgumentSizeExceeded, CloudScriptAPIRequestCountExceeded, CloudScriptAPIRequestError, or CloudScriptHTTPRequestError
	Message: string?, --- Details about the error
	StackTrace: string?, --- Point during the execution of the script at which the error occurred, if any
}

export type StatisticModel = {
	Name: string?, --- Statistic name
	Value: number, --- Statistic value
	Version: number, --- Statistic version (0 if not a versioned statistic)
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

export type TagModel = {
	TagValue: string?, --- Full value of the tag, including namespace
}

export type TriggerType = 
	"HTTP"
	| "Queue"

export type UnregisterFunctionRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	FunctionName: string, --- The name of the function to register
}

export type ValueToDateModel = {
	Currency: string?, --- ISO 4217 code of the currency used in the purchases
	TotalValue: number, --- Total value of the purchases in a whole number of 1/100 monetary units. For example, 999 indicates nine dollars and ninety-nine cents when Currency is 'USD')
	TotalValueAsDecimal: string?, --- Total value of the purchases in a string representation of decimal monetary units. For example, '9.99' indicates nine dollars and ninety-nine cents when Currency is 'USD'.
}


--- Executes CloudScript with the entity profile that is defined in the request. 
---
--- https://docs.microsoft.com/rest/api/playfab/cloudscript/server-side-cloud-script/executeentitycloudscript
function CloudScriptApi.ExecuteEntityCloudScriptAsync(
	entityToken: string, 
	request: ExecuteEntityCloudScriptRequest
): ExecuteCloudScriptResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/CloudScript/ExecuteEntityCloudScript",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Executes an Azure Function with the profile of the entity that is defined in 
--- the request. 
---
--- https://docs.microsoft.com/rest/api/playfab/cloudscript/server-side-cloud-script/executefunction
function CloudScriptApi.ExecuteFunctionAsync(
	entityToken: string, 
	request: ExecuteFunctionRequest
): ExecuteFunctionResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/CloudScript/ExecuteFunction",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/cloudscript/server-side-cloud-script/getfunction
function CloudScriptApi.GetFunctionAsync(
	entityToken: string, 
	request: GetFunctionRequest
): GetFunctionResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/CloudScript/GetFunction",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/cloudscript/server-side-cloud-script/listfunctions
function CloudScriptApi.ListFunctionsAsync(
	entityToken: string, 
	request: ListFunctionsRequest
): ListFunctionsResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/CloudScript/ListFunctions",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- A title can have many functions, ListHttpFunctions will return a list of all 
--- the currently registered HTTP triggered functions for a given title. 
---
--- https://docs.microsoft.com/rest/api/playfab/cloudscript/server-side-cloud-script/listhttpfunctions
function CloudScriptApi.ListHttpFunctionsAsync(
	entityToken: string, 
	request: ListFunctionsRequest
): ListHttpFunctionsResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/CloudScript/ListHttpFunctions",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/cloudscript/server-side-cloud-script/listqueuedfunctions
function CloudScriptApi.ListQueuedFunctionsAsync(
	entityToken: string, 
	request: ListFunctionsRequest
): ListQueuedFunctionsResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/CloudScript/ListQueuedFunctions",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/cloudscript/server-side-cloud-script/postfunctionresultforentitytriggeredaction
function CloudScriptApi.PostFunctionResultForEntityTriggeredActionAsync(
	entityToken: string, 
	request: PostFunctionResultForEntityTriggeredActionRequest
): EmptyResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/CloudScript/PostFunctionResultForEntityTriggeredAction",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/cloudscript/server-side-cloud-script/postfunctionresultforfunctionexecution
function CloudScriptApi.PostFunctionResultForFunctionExecutionAsync(
	entityToken: string, 
	request: PostFunctionResultForFunctionExecutionRequest
): EmptyResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/CloudScript/PostFunctionResultForFunctionExecution",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/cloudscript/server-side-cloud-script/postfunctionresultforplayertriggeredaction
function CloudScriptApi.PostFunctionResultForPlayerTriggeredActionAsync(
	entityToken: string, 
	request: PostFunctionResultForPlayerTriggeredActionRequest
): EmptyResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/CloudScript/PostFunctionResultForPlayerTriggeredAction",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/cloudscript/server-side-cloud-script/postfunctionresultforscheduledtask
function CloudScriptApi.PostFunctionResultForScheduledTaskAsync(
	entityToken: string, 
	request: PostFunctionResultForScheduledTaskRequest
): EmptyResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/CloudScript/PostFunctionResultForScheduledTask",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/cloudscript/server-side-cloud-script/registerhttpfunction
function CloudScriptApi.RegisterHttpFunctionAsync(
	entityToken: string, 
	request: RegisterHttpFunctionRequest
): EmptyResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/CloudScript/RegisterHttpFunction",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- A title can have many functions, RegisterQueuedFunction associates a function 
--- name with a queue name and connection string. 
---
--- https://docs.microsoft.com/rest/api/playfab/cloudscript/server-side-cloud-script/registerqueuedfunction
function CloudScriptApi.RegisterQueuedFunctionAsync(
	entityToken: string, 
	request: RegisterQueuedFunctionRequest
): EmptyResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/CloudScript/RegisterQueuedFunction",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/cloudscript/server-side-cloud-script/unregisterfunction
function CloudScriptApi.UnregisterFunctionAsync(
	entityToken: string, 
	request: UnregisterFunctionRequest
): EmptyResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/CloudScript/UnregisterFunction",
		request,
		"X-EntityToken",
		entityToken
	)
end

return CloudScriptApi
