--!strict
--[=[
	# CloudScriptApi

	API methods for executing CloudScript using an Entity Profile. 

	API Version: 1.220926.4
]=]

local PlayFabInternal = require(script.Parent.PlayFabInternal)

local CloudScriptApi = {}

function CloudScriptApi.SetSettings(settings: PlayFabInternal.ISettings)
	PlayFabInternal.SetSettings(settings)
end

export type AdCampaignAttributionModel = {
	--- UTC time stamp of attribution 
	AttributedAt: string,
	--- Attribution campaign identifier 
	CampaignId: string?,
	--- Attribution network name 
	Platform: string?,
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

export type CloudScriptRevisionOption = 
	"Live"
	| "Latest"
	| "Specific"

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

export type EmailVerificationStatus = 
	"Unverified"
	| "Pending"
	| "Confirmed"

export type EmptyResult = {
}

--- Combined entity type and ID structure which uniquely identifies a single entity. 
export type EntityKey = {
	--- Unique ID of the entity. 
	Id: string,
	--- Entity type. See https://docs.microsoft.com/gaming/playfab/features/data/entities/available-built-in-entity-types 
	Type: string?,
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

--- Executes CloudScript with the entity profile that is defined in the request. 
export type ExecuteEntityCloudScriptRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The optional entity to perform this action on. Defaults to the currently logged 
	--- in entity. 
	Entity: EntityKey?,
	--- The name of the CloudScript function to execute 
	FunctionName: string,
	--- Object that is passed in to the function as the first argument 
	FunctionParameter: {[any]: any}?,
	--- Generate a 'entity_executed_cloudscript' PlayStream event containing the results 
	--- of the function execution and other contextual information. This event will 
	--- show up in the PlayStream debugger console for the player in Game Manager. 
	GeneratePlayStreamEvent: boolean?,
	--- Option for which revision of the CloudScript to execute. 'Latest' executes the 
	--- most recently created revision, 'Live' executes the current live, published 
	--- revision, and 'Specific' executes the specified revision. The default value 
	--- is 'Specific', if the SpecificRevision parameter is specified, otherwise it 
	--- is 'Live'. 
	RevisionSelection: string?,
	--- The specific revision to execute, when RevisionSelection is set to 'Specific' 
	SpecificRevision: number?,
}

--- Executes an Azure Function with the profile of the entity that is defined in 
--- the request. 
export type ExecuteFunctionRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The optional entity to perform this action on. Defaults to the currently logged 
	--- in entity. 
	Entity: EntityKey?,
	--- The name of the CloudScript function to execute 
	FunctionName: string,
	--- Object that is passed in to the function as the FunctionArgument field of the 
	--- FunctionExecutionContext data structure 
	FunctionParameter: {[any]: any}?,
	--- Generate a 'entity_executed_cloudscript_function' PlayStream event containing 
	--- the results of the function execution and other contextual information. This 
	--- event will show up in the PlayStream debugger console for the player in Game 
	--- Manager. 
	GeneratePlayStreamEvent: boolean?,
}

export type ExecuteFunctionResult = {
	--- Error from the CloudScript Azure Function. 
	Error: FunctionExecutionError?,
	--- The amount of time the function took to execute 
	ExecutionTimeMilliseconds: number,
	--- The name of the function that executed 
	FunctionName: string?,
	--- The object returned from the function, if any 
	FunctionResult: {[any]: any}?,
	--- Flag indicating if the FunctionResult was too large and was subsequently dropped 
	--- from this event. 
	FunctionResultTooLarge: boolean?,
}

export type FunctionExecutionError = {
	--- Error code, such as CloudScriptAzureFunctionsExecutionTimeLimitExceeded, CloudScriptAzureFunctionsArgumentSizeExceeded, 
	--- CloudScriptAzureFunctionsReturnSizeExceeded or CloudScriptAzureFunctionsHTTPRequestError 
	Error: string?,
	--- Details about the error 
	Message: string?,
	--- Point during the execution of the function at which the error occurred, if any 
	StackTrace: string?,
}

export type FunctionModel = {
	--- The address of the function. 
	FunctionAddress: string?,
	--- The name the function was registered under. 
	FunctionName: string?,
	--- The trigger type for the function. 
	TriggerType: string?,
}

export type GetFunctionRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The name of the function to register 
	FunctionName: string,
}

export type GetFunctionResult = {
	--- The connection string for the storage account containing the queue for a queue 
	--- trigger Azure Function. 
	ConnectionString: string?,
	--- The URL to be invoked to execute an HTTP triggered function. 
	FunctionUrl: string?,
	--- The name of the queue for a queue trigger Azure Function. 
	QueueName: string?,
	--- The trigger type for the function. 
	TriggerType: string?,
}

export type HttpFunctionModel = {
	--- The name the function was registered under. 
	FunctionName: string?,
	--- The URL of the function. 
	FunctionUrl: string?,
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

--- A title can have many functions, ListHttpFunctions will return a list of all 
--- the currently registered HTTP triggered functions for a given title. 
export type ListFunctionsRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
}

export type ListFunctionsResult = {
	--- The list of functions that are currently registered for the title. 
	Functions: {FunctionModel}?,
}

export type ListHttpFunctionsResult = {
	--- The list of HTTP triggered functions that are currently registered for the title. 
	Functions: {HttpFunctionModel}?,
}

export type ListQueuedFunctionsResult = {
	--- The list of Queue triggered functions that are currently registered for the 
	--- title. 
	Functions: {QueuedFunctionModel}?,
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

--- Identifier by either name or ID. Note that a name may change due to renaming, 
--- or reused after being deleted. ID is immutable and unique. 
export type NameIdentifier = {
	--- Id Identifier, if present 
	Id: string?,
	--- Name Identifier, if present 
	Name: string?,
}

export type PlayStreamEventEnvelopeModel = {
	--- The ID of the entity the event is about. 
	EntityId: string?,
	--- The type of the entity the event is about. 
	EntityType: string?,
	--- Data specific to this event. 
	EventData: string?,
	--- The name of the event. 
	EventName: string?,
	--- The namespace of the event. 
	EventNamespace: string?,
	--- Settings for the event. 
	EventSettings: string?,
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

export type PostFunctionResultForEntityTriggeredActionRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The entity to perform this action on. 
	Entity: EntityKey,
	--- The result of the function execution. 
	FunctionResult: ExecuteFunctionResult,
}

export type PostFunctionResultForFunctionExecutionRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The entity to perform this action on. 
	Entity: EntityKey,
	--- The result of the function execution. 
	FunctionResult: ExecuteFunctionResult,
}

export type PostFunctionResultForPlayerTriggeredActionRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The optional entity to perform this action on. Defaults to the currently logged 
	--- in entity. 
	Entity: EntityKey?,
	--- The result of the function execution. 
	FunctionResult: ExecuteFunctionResult,
	--- The triggering PlayStream event, if any, that caused the function to be invoked. 
	PlayStreamEventEnvelope: PlayStreamEventEnvelopeModel?,
	--- The player profile the function was invoked with. 
	PlayerProfile: PlayerProfileModel,
}

export type PostFunctionResultForScheduledTaskRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The entity to perform this action on. 
	Entity: EntityKey,
	--- The result of the function execution 
	FunctionResult: ExecuteFunctionResult,
	--- The id of the scheduled task that invoked the function. 
	ScheduledTaskId: NameIdentifier,
}

export type PushNotificationPlatform = 
	"ApplePushNotificationService"
	| "GoogleCloudMessaging"

export type PushNotificationRegistrationModel = {
	--- Notification configured endpoint 
	NotificationEndpointARN: string?,
	--- Push notification platform 
	Platform: string?,
}

export type QueuedFunctionModel = {
	--- The connection string for the Azure Storage Account that hosts the queue. 
	ConnectionString: string?,
	--- The name the function was registered under. 
	FunctionName: string?,
	--- The name of the queue that triggers the Azure Function. 
	QueueName: string?,
}

export type RegisterHttpFunctionRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The name of the function to register 
	FunctionName: string,
	--- Full URL for Azure Function that implements the function. 
	FunctionUrl: string,
}

--- A title can have many functions, RegisterQueuedFunction associates a function 
--- name with a queue name and connection string. 
export type RegisterQueuedFunctionRequest = {
	--- A connection string for the storage account that hosts the queue for the Azure 
	--- Function. 
	ConnectionString: string,
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The name of the function to register 
	FunctionName: string,
	--- The name of the queue for the Azure Function. 
	QueueName: string,
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

export type StatisticModel = {
	--- Statistic name 
	Name: string?,
	--- Statistic value 
	Value: number,
	--- Statistic version (0 if not a versioned statistic) 
	Version: number,
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

export type TagModel = {
	--- Full value of the tag, including namespace 
	TagValue: string?,
}

export type TriggerType = 
	"HTTP"
	| "Queue"

export type UnregisterFunctionRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The name of the function to register 
	FunctionName: string,
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


--- Executes CloudScript with the entity profile that is defined in the request. 
---
--- https://docs.microsoft.com/rest/api/playfab/cloudscript/server-side-cloud-script/executeentitycloudscript
function CloudScriptApi.ExecuteEntityCloudScriptAsync(
	entityToken: string, 
	request: ExecuteEntityCloudScriptRequest
): ExecuteCloudScriptResult
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
): ExecuteFunctionResult
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
): GetFunctionResult
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
): ListFunctionsResult
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
): ListHttpFunctionsResult
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
): ListQueuedFunctionsResult
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
): EmptyResult
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
): EmptyResult
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
): EmptyResult
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
): EmptyResult
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
): EmptyResult
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
): EmptyResult
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
): EmptyResult
	return PlayFabInternal.MakeApiCall(
		"/CloudScript/UnregisterFunction",
		request,
		"X-EntityToken",
		entityToken
	)
end

return CloudScriptApi

