--[[
	This file was generated on 2025-08-03 at 00:04 UTC. Do not edit directly.

]]

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

export type GetFunctionResult = {
	--[[
		The name of the queue for a queue trigger Azure Function.

	]]
	QueueName: string?,
	--[[
		The URL to be invoked to execute an HTTP triggered function.

	]]
	FunctionUrl: string?,
	TriggerType: TriggerType?,
	--[[
		The connection string for the storage account containing the queue for a queue
		trigger Azure Function.

	]]
	ConnectionString: string?,
}

--[[
	A title can have many functions, ListHttpFunctions will return a list of all
	the currently registered HTTP triggered functions for a given title.

]]
export type ListFunctionsRequest = {
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type FunctionExecutionError = {
	--[[
		Details about the error

	]]
	Message: string?,
	--[[
		Point during the execution of the function at which the error occurred, if any

	]]
	StackTrace: string?,
	--[[
		Error code, such as CloudScriptAzureFunctionsExecutionTimeLimitExceeded,
		CloudScriptAzureFunctionsArgumentSizeExceeded,
		CloudScriptAzureFunctionsReturnSizeExceeded or
		CloudScriptAzureFunctionsHTTPRequestError

	]]
	Error: string?,
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

export type ListEventHubFunctionsResult = {
	--[[
		The list of EventHub triggered functions that are currently registered for the
		title.

	]]
	Functions: { EventHubFunctionModel }?,
}

export type PushNotificationRegistrationModel = {
	--[[
		Notification configured endpoint

	]]
	NotificationEndpointARN: string?,
	Platform: PushNotificationPlatform?,
}

export type GetFunctionRequest = {
	--[[
		The name of the function to register

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
}

export type PostFunctionResultForPlayerTriggeredActionRequest = {
	FunctionResult: ExecuteFunctionResult,
	PlayStreamEventEnvelope: PlayStreamEventEnvelopeModel?,
	PlayerProfile: PlayerProfileModel,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
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

export type PlayStreamEventEnvelopeModel = {
	--[[
		The type of the entity the event is about.

	]]
	EntityType: string?,
	--[[
		Settings for the event.

	]]
	EventSettings: string?,
	--[[
		Data specific to this event.

	]]
	EventData: string?,
	--[[
		The ID of the entity the event is about.

	]]
	EntityId: string?,
	--[[
		The name of the event.

	]]
	EventName: string?,
	--[[
		The namespace of the event.

	]]
	EventNamespace: string?,
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

export type ExecuteFunctionResult = {
	--[[
		Flag indicating if the FunctionResult was too large and was subsequently
		dropped from this event.

	]]
	FunctionResultTooLarge: boolean?,
	--[[
		The name of the function that executed

	]]
	FunctionName: string?,
	--[[
		The object returned from the function, if any

	]]
	FunctionResult: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		The amount of time the function took to execute

	]]
	ExecutionTimeMilliseconds: number,
	Error: FunctionExecutionError?,
	--[[
		The size in bytes of the object returned from the function, if any

	]]
	FunctionResultSize: number?,
}

export type ListHttpFunctionsResult = {
	--[[
		The list of HTTP triggered functions that are currently registered for the
		title.

	]]
	Functions: { HttpFunctionModel }?,
}

export type TriggerType = 
	| "HTTP"
	| "Queue"
	| "EventHub"

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

export type ListFunctionsResult = {
	--[[
		The list of functions that are currently registered for the title.

	]]
	Functions: { FunctionModel }?,
}

--[[
	Executes an Azure Function with the profile of the entity that is defined in
	the request.

]]
export type ExecuteFunctionRequest = {
	--[[
		Generate a 'entity_executed_cloudscript_function' PlayStream event containing
		the results of the function execution and other contextual information. This
		event will show up in the PlayStream debugger console for the player in Game
		Manager.

	]]
	GeneratePlayStreamEvent: boolean?,
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey?,
	--[[
		The name of the CloudScript function to execute

	]]
	FunctionName: string,
	--[[
		Object that is passed in to the function as the FunctionArgument field of the
		FunctionExecutionContext data structure

	]]
	FunctionParameter: {
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

export type PostFunctionResultForScheduledTaskRequest = {
	FunctionResult: ExecuteFunctionResult,
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
	ScheduledTaskId: NameIdentifier,
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

export type EmptyResult = {
	-- No properties defined in spec
	[string]: any
}

export type FunctionModel = {
	--[[
		The address of the function.

	]]
	FunctionAddress: string?,
	--[[
		The name the function was registered under.

	]]
	FunctionName: string?,
	TriggerType: TriggerType?,
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

export type HttpFunctionModel = {
	--[[
		The name the function was registered under.

	]]
	FunctionName: string?,
	--[[
		The URL of the function.

	]]
	FunctionUrl: string?,
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

--[[
	A title can have many functions, RegisterEventHubFunction associates a
	function name with an event hub name and connection string.

]]
export type RegisterEventHubFunctionRequest = {
	--[[
		A connection string for the namespace of the event hub for the Azure Function.

	]]
	ConnectionString: string,
	--[[
		The name of the event hub for the Azure Function.

	]]
	EventHubName: string,
	--[[
		The name of the function to register

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

export type PostFunctionResultForEntityTriggeredActionRequest = {
	FunctionResult: ExecuteFunctionResult,
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type QueuedFunctionModel = {
	--[[
		The name of the queue that triggers the Azure Function.

	]]
	QueueName: string?,
	--[[
		The name the function was registered under.

	]]
	FunctionName: string?,
	--[[
		The connection string for the Azure Storage Account that hosts the queue.

	]]
	ConnectionString: string?,
}

--[[
	A title can have many functions, RegisterQueuedFunction associates a
	function name with a queue name and connection string.

]]
export type RegisterQueuedFunctionRequest = {
	--[[
		The name of the queue for the Azure Function.

	]]
	QueueName: string,
	--[[
		A connection string for the storage account that hosts the queue for the Azure
		Function.

	]]
	ConnectionString: string,
	--[[
		The name of the function to register

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
}

export type ListQueuedFunctionsResult = {
	--[[
		The list of Queue triggered functions that are currently registered for the
		title.

	]]
	Functions: { QueuedFunctionModel }?,
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

export type EventHubFunctionModel = {
	--[[
		The name the function was registered under.

	]]
	FunctionName: string?,
	--[[
		The name of the event hub that triggers the Azure Function.

	]]
	EventHubName: string?,
	--[[
		The connection string for the event hub.

	]]
	ConnectionString: string?,
}

export type PostFunctionResultForFunctionExecutionRequest = {
	FunctionResult: ExecuteFunctionResult,
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type UnregisterFunctionRequest = {
	--[[
		The name of the function to register

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
}

export type RegisterHttpFunctionRequest = {
	--[[
		Full URL for Azure Function that implements the function.

	]]
	FunctionUrl: string,
	--[[
		The name of the function to register

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
}

export type EmailVerificationStatus = 
	| "Unverified"
	| "Pending"
	| "Confirmed"

--[[
	Executes CloudScript with the entity profile that is defined in the request.

]]
export type ExecuteEntityCloudScriptRequest = {
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
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey?,
	--[[
		Object that is passed in to the function as the first argument

	]]
	FunctionParameter: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		Generate a 'entity_executed_cloudscript' PlayStream event containing the
		results of the function execution and other contextual information. This event
		will show up in the PlayStream debugger console for the player in Game
		Manager.

	]]
	GeneratePlayStreamEvent: boolean?,
	--[[
		The specific revision to execute, when RevisionSelection is set to 'Specific'

	]]
	SpecificRevision: number?,
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

export type ContinentCode = 
	| "AF"
	| "AN"
	| "AS"
	| "EU"
	| "NA"
	| "OC"
	| "SA"
	| "Unknown"



return nil
