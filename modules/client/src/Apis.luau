--[[
	This file was generated on 2025-08-03 at 00:04 UTC. Do not edit directly.

]]

local Types = require(script.Parent.Types)

local Common = require(script.Parent.Parent.PlayFabCommon)
local makeApiCall = Common.makeApiCall
type Result<T, E> = Common.Result<T, E>

local Apis = {}

--[[
	Removes a contact email from the player's profile.

	This API removes an existing contact email from the player's profile.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/account-management/removecontactemail).

]]
function Apis.RemoveContactEmail(request: Types.RemoveContactEmailRequest, sessionTicket: string): Result<Types.RemoveContactEmailResult, string>
	return makeApiCall(
		"/Client/RemoveContactEmail",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Unlinks an OpenID Connect account from a user's PlayFab account, based on
	the connection ID of an existing relationship between a title and an Open ID
	Connect provider.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/account-management/unlinkopenidconnect).

	### Errors
	- AccountNotLinked

]]
function Apis.UnlinkOpenIdConnect(request: Types.UnlinkOpenIdConnectRequest, sessionTicket: string): Result<Types.EmptyResponse, string>
	return makeApiCall(
		"/Client/UnlinkOpenIdConnect",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Checks for any new consumable entitlements. If any are found, they are
	consumed (if they're consumables) and added as PlayFab items

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/platform-specific-methods/consumeps5entitlements).

	### Errors
	- ItemNotFound

]]
function Apis.ConsumePS5Entitlements(request: Types.ConsumePS5EntitlementsRequest, sessionTicket: string): Result<Types.ConsumePS5EntitlementsResult, string>
	return makeApiCall(
		"/Client/ConsumePS5Entitlements",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	_NOTE: This is a Legacy Economy API, and is in bugfix-only mode. All new
	Economy features are being developed only for version 2._ Opens the
	specified container, with the specified key (when required), and returns the
	contents of the opened container. If the container (and key when relevant)
	are consumable (RemainingUses > 0), their RemainingUses will be decremented,
	consistent with the operation of ConsumeItem.

	Specify the container and optionally the catalogVersion for the container to
	open

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/player-item-management/unlockcontainerinstance).

	### Errors
	- CharacterNotFound
	- ContainerKeyInvalid
	- ContainerNotOwned
	- InvalidContainerItem
	- InvalidItemIdInTable
	- InvalidItemProperties
	- KeyNotOwned

]]
function Apis.UnlockContainerInstance(request: Types.UnlockContainerInstanceRequest, sessionTicket: string): Result<Types.UnlockContainerItemResult, string>
	return makeApiCall(
		"/Client/UnlockContainerInstance",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Grants the player's current entitlements from Microsoft Store's Collection
	API

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/platform-specific-methods/consumemicrosoftstoreentitlements).

	### Errors
	- ItemNotFound

]]
function Apis.ConsumeMicrosoftStoreEntitlements(request: Types.ConsumeMicrosoftStoreEntitlementsRequest, sessionTicket: string): Result<Types.ConsumeMicrosoftStoreEntitlementsResponse, string>
	return makeApiCall(
		"/Client/ConsumeMicrosoftStoreEntitlements",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	_NOTE: This is a Legacy Economy API, and is in bugfix-only mode. All new
	Economy features are being developed only for version 2._ Decrements the
	user's balance of the specified virtual currency by the stated amount. It is
	possible to make a VC balance negative with this API.

	This API must be enabled for use as an option in the game manager website.
	It is disabled by default.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/player-item-management/subtractuservirtualcurrency).

	### Errors
	- APINotEnabledForGameClientAccess
	- InvalidVirtualCurrency
	- VirtualCurrencyCurrentlyUnavailable

]]
function Apis.SubtractUserVirtualCurrency(request: Types.SubtractUserVirtualCurrencyRequest, sessionTicket: string): Result<Types.ModifyUserVirtualCurrencyResult, string>
	return makeApiCall(
		"/Client/SubtractUserVirtualCurrency",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Unlinks the related Google account from the user's PlayFab account
	(https://developers.google.com/android/reference/com/google/android/gms/auth/GoogleAuthUtil#public-methods).

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/account-management/unlinkgoogleaccount).

	### Errors
	- AccountNotLinked

]]
function Apis.UnlinkGoogleAccount(request: Types.UnlinkGoogleAccountRequest, sessionTicket: string): Result<Types.UnlinkGoogleAccountResult, string>
	return makeApiCall(
		"/Client/UnlinkGoogleAccount",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Update the avatar URL of the player

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/account-management/updateavatarurl).

]]
function Apis.UpdateAvatarUrl(request: Types.UpdateAvatarUrlRequest, sessionTicket: string): Result<Types.EmptyResponse, string>
	return makeApiCall(
		"/Client/UpdateAvatarUrl",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Opens a new outstanding trade. Note that a given item instance may only be
	in one open trade at a time.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/trading/opentrade).

	### Errors
	- TradeAcceptedCatalogItemInvalid
	- TradeAcceptedCatalogItemIsNotTradable
	- TradeAcceptedItemIsBundle
	- TradeAllowedUsersInvalid
	- TradeInventoryItemDoesNotExist
	- TradeInventoryItemExpired
	- TradeInventoryItemInvalidStatus
	- TradeInventoryItemIsAssignedToCharacter
	- TradeInventoryItemIsBundle
	- TradeInventoryItemIsConsumed
	- TradeInventoryItemIsNotTradable
	- TradeInventoryItemIsStackable
	- TradeMissingOfferedAndAcceptedItems
	- TradeWaitForStatusTimeout

]]
function Apis.OpenTrade(request: Types.OpenTradeRequest, sessionTicket: string): Result<Types.OpenTradeResponse, string>
	return makeApiCall(
		"/Client/OpenTrade",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Links the Facebook Instant Games Id to the user's PlayFab account

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/account-management/linkfacebookinstantgamesid).

	### Errors
	- FacebookInstantGamesAuthNotConfiguredForTitle
	- InvalidFacebookInstantGamesSignature
	- LinkedIdentifierAlreadyClaimed

]]
function Apis.LinkFacebookInstantGamesId(request: Types.LinkFacebookInstantGamesIdRequest, sessionTicket: string): Result<Types.LinkFacebookInstantGamesIdResult, string>
	return makeApiCall(
		"/Client/LinkFacebookInstantGamesId",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Logs in a user with an Open ID Connect JWT created by an existing
	relationship between a title and an Open ID Connect provider.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/authentication/loginwithopenidconnect).

	### Errors
	- EncryptionKeyMissing
	- EvaluationModePlayerCountExceeded
	- InvalidIdentityProviderId
	- InvalidSignature
	- InvalidSignatureTime
	- PlayerSecretAlreadyConfigured
	- PlayerSecretNotConfigured
	- RequestViewConstraintParamsNotAllowed

]]
function Apis.LoginWithOpenIdConnect(request: Types.LoginWithOpenIdConnectRequest): Result<Types.LoginResult, string>
	return makeApiCall(
		"/Client/LoginWithOpenIdConnect",
		request,
		"None"
	)
end

--[[
	_NOTE: This is a Legacy Economy API, and is in bugfix-only mode. All new
	Economy features are being developed only for version 2._ Restores all
	in-app purchases based on the given restore receipt

	The title should obtain a refresh receipt via restoreCompletedTransactions
	in the SKPaymentQueue of the Apple StoreKit and pass that in to this call.
	The resultant receipt contains new receipt instances for all non-consumable
	goods previously purchased by the user. This API call iterates through every
	purchase in the receipt and restores the items if they still exist in the
	catalog and can be validated.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/platform-specific-methods/restoreiospurchases).

	### Errors
	- InvalidBundleID
	- InvalidCurrencyCode
	- InvalidEnvironmentForReceipt
	- InvalidReceipt
	- InvalidVirtualCurrency
	- NoMatchingCatalogItemForReceipt
	- ReceiptAlreadyUsed
	- ReceiptContainsMultipleInAppItems
	- ReceiptDoesNotContainInAppItems

]]
function Apis.RestoreIOSPurchases(request: Types.RestoreIOSPurchasesRequest, sessionTicket: string): Result<Types.RestoreIOSPurchasesResult, string>
	return makeApiCall(
		"/Client/RestoreIOSPurchases",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	_NOTE: This is a Legacy Economy API, and is in bugfix-only mode. All new
	Economy features are being developed only for version 2._ Validates with
	Amazon that the receipt for an Amazon App Store in-app purchase is valid and
	that it matches the purchased catalog item

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/platform-specific-methods/validateamazoniapreceipt).

	### Errors
	- AmazonValidationError
	- InvalidReceipt
	- MissingAmazonSharedKey
	- NoMatchingCatalogItemForReceipt
	- ReceiptAlreadyUsed

]]
function Apis.ValidateAmazonIAPReceipt(request: Types.ValidateAmazonReceiptRequest, sessionTicket: string): Result<Types.ValidateAmazonReceiptResult, string>
	return makeApiCall(
		"/Client/ValidateAmazonIAPReceipt",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Links the Apple account associated with the token to the user's PlayFab
	account.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/account-management/linkapple).

	### Errors
	- AppleNotEnabledForTitle
	- InvalidIdentityProviderId
	- LinkedIdentifierAlreadyClaimed
	- TokenSigningKeyNotFound

]]
function Apis.LinkApple(request: Types.LinkAppleRequest, sessionTicket: string): Result<Types.EmptyResult, string>
	return makeApiCall(
		"/Client/LinkApple",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Creates and updates the title-specific custom data for the user's character
	which is readable and writable by the client

	This function performs an additive update of the arbitrary strings
	containing the custom data for the character. In updating the custom data
	object, keys which already exist in the object will have their values
	overwritten, while keys with null values will be removed. New keys will be
	added, with the given values. No other key-value pairs will be changed apart
	from those specified in the call.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/character-data/updatecharacterdata).

	### Errors
	- CharacterNotFound

]]
function Apis.UpdateCharacterData(request: Types.UpdateCharacterDataRequest, sessionTicket: string): Result<Types.UpdateCharacterDataResult, string>
	return makeApiCall(
		"/Client/UpdateCharacterData",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Grants the player's current entitlements from Xbox Live, consuming all
	availble items in Xbox and granting them to the player's PlayFab inventory.
	This call is idempotent and will not grant previously granted items to the
	player.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/platform-specific-methods/consumexboxentitlements).

	### Errors
	- ExpiredXboxLiveToken
	- InvalidXboxLiveToken
	- XboxInaccessible
	- XboxRejectedXSTSExchangeRequest
	- XboxServiceTooManyRequests
	- XboxXASSExchangeFailure

]]
function Apis.ConsumeXboxEntitlements(request: Types.ConsumeXboxEntitlementsRequest, sessionTicket: string): Result<Types.ConsumeXboxEntitlementsResult, string>
	return makeApiCall(
		"/Client/ConsumeXboxEntitlements",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Retrieves the title-specific custom data for the character which is readable
	and writable by the client

	Data is stored as JSON key-value pairs. If the Keys parameter is provided,
	the data object returned will only contain the data specific to the
	indicated Keys. Otherwise, the full set of custom character data will be
	returned.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/character-data/getcharacterdata).

	### Errors
	- CharacterNotFound
	- UserisNotValid

]]
function Apis.GetCharacterData(request: Types.GetCharacterDataRequest, sessionTicket: string): Result<Types.GetCharacterDataResult, string>
	return makeApiCall(
		"/Client/GetCharacterData",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	_NOTE: This is a Legacy Economy API, and is in bugfix-only mode. All new
	Economy features are being developed only for version 2._ Retrieves the
	user's current inventory of virtual goods

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/player-item-management/getuserinventory).

]]
function Apis.GetUserInventory(request: Types.GetUserInventoryRequest, sessionTicket: string): Result<Types.GetUserInventoryResult, string>
	return makeApiCall(
		"/Client/GetUserInventory",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Retrieves the indicated statistics (current version and values for all
	statistics, if none are specified), for the local player.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/player-data-management/getplayerstatistics).

]]
function Apis.GetPlayerStatistics(request: Types.GetPlayerStatisticsRequest, sessionTicket: string): Result<Types.GetPlayerStatisticsResult, string>
	return makeApiCall(
		"/Client/GetPlayerStatistics",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Retrieves the key-value store of custom title settings

	This API is designed to return title specific values which can be read, but
	not written to, by the client. For example, a developer could choose to
	store values which modify the user experience, such as enemy spawn rates,
	weapon strengths, movement speeds, etc. This allows a developer to update
	the title without the need to create, test, and ship a new build. If the
	player belongs to an experiment variant that uses title data overrides, the
	overrides are applied automatically and returned with the title data. Note
	that there may up to a minute delay in between updating title data and this
	API call returning the newest value.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/title-wide-data-management/gettitledata).

]]
function Apis.GetTitleData(request: Types.GetTitleDataRequest, sessionTicket: string): Result<Types.GetTitleDataResult, string>
	return makeApiCall(
		"/Client/GetTitleData",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Unlinks the related Battle.net account from the user's PlayFab account.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/account-management/unlinkbattlenetaccount).

	### Errors
	- AccountNotLinked
	- BattleNetNotEnabledForTitle

]]
function Apis.UnlinkBattleNetAccount(request: Types.UnlinkBattleNetAccountRequest, sessionTicket: string): Result<Types.EmptyResponse, string>
	return makeApiCall(
		"/Client/UnlinkBattleNetAccount",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Links the Nintendo account associated with the token to the user's PlayFab
	account.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/account-management/linknintendoserviceaccount).

	### Errors
	- InvalidIdentityProviderId
	- LinkedIdentifierAlreadyClaimed
	- NintendoSwitchNotEnabledForTitle

]]
function Apis.LinkNintendoServiceAccount(request: Types.LinkNintendoServiceAccountRequest, sessionTicket: string): Result<Types.EmptyResult, string>
	return makeApiCall(
		"/Client/LinkNintendoServiceAccount",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Retrieves the unique PlayFab identifiers for the given set of Google
	identifiers. The Google identifiers are the IDs for the user accounts,
	available as "id" in the Google+ People API calls.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/account-management/getplayfabidsfromgoogleids).

]]
function Apis.GetPlayFabIDsFromGoogleIDs(request: Types.GetPlayFabIDsFromGoogleIDsRequest, sessionTicket: string): Result<Types.GetPlayFabIDsFromGoogleIDsResult, string>
	return makeApiCall(
		"/Client/GetPlayFabIDsFromGoogleIDs",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Adds the specified generic service identifier to the player's PlayFab
	account. This is designed to allow for a PlayFab ID lookup of any arbitrary
	service identifier a title wants to add. This identifier should never be
	used as authentication credentials, as the intent is that it is easily
	accessible by other players.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/account-management/addgenericid).

	### Errors
	- IdentifierAlreadyClaimed

]]
function Apis.AddGenericID(request: Types.AddGenericIDRequest, sessionTicket: string): Result<Types.AddGenericIDResult, string>
	return makeApiCall(
		"/Client/AddGenericID",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Retrieves the title news feed, as configured in the developer portal

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/title-wide-data-management/gettitlenews).

]]
function Apis.GetTitleNews(request: Types.GetTitleNewsRequest, sessionTicket: string): Result<Types.GetTitleNewsResult, string>
	return makeApiCall(
		"/Client/GetTitleNews",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Retrieves a title-specific custom property value for a player.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/player-data-management/getplayercustomproperty).

	### Errors
	- PlayerCustomPropertiesPropertyDoesNotExist

]]
function Apis.GetPlayerCustomProperty(request: Types.GetPlayerCustomPropertyRequest, sessionTicket: string): Result<Types.GetPlayerCustomPropertyResult, string>
	return makeApiCall(
		"/Client/GetPlayerCustomProperty",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Retrieves the unique PlayFab identifiers for the given set of Battle.net
	account identifiers.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/account-management/getplayfabidsfrombattlenetaccountids).

]]
function Apis.GetPlayFabIDsFromBattleNetAccountIds(request: Types.GetPlayFabIDsFromBattleNetAccountIdsRequest, sessionTicket: string): Result<Types.GetPlayFabIDsFromBattleNetAccountIdsResult, string>
	return makeApiCall(
		"/Client/GetPlayFabIDsFromBattleNetAccountIds",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Updates the title-specific custom property values for a player

	Performs an additive update of the custom properties for the specified
	player. In updating the player's custom properties, properties which already
	exist will have their values overwritten. No other properties will be
	changed apart from those specified in the call.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/player-data-management/updateplayercustomproperties).

	### Errors
	- PlayerCustomPropertiesDuplicatePropertyName
	- PlayerCustomPropertiesPropertyCountTooHigh
	- PlayerCustomPropertiesPropertyNameIsInvalid
	- PlayerCustomPropertiesPropertyNameTooLong
	- PlayerCustomPropertiesStringPropertyValueTooLong
	- PlayerCustomPropertiesValueIsInvalidType
	- PlayerCustomPropertiesVersionMismatch

]]
function Apis.UpdatePlayerCustomProperties(request: Types.UpdatePlayerCustomPropertiesRequest, sessionTicket: string): Result<Types.UpdatePlayerCustomPropertiesResult, string>
	return makeApiCall(
		"/Client/UpdatePlayerCustomProperties",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Signs the user in using the Android device identifier, returning a session
	identifier that can subsequently be used for API calls which require an
	authenticated user

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

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/authentication/loginwithandroiddeviceid).

	### Errors
	- EncryptionKeyMissing
	- EvaluationModePlayerCountExceeded
	- InvalidSignature
	- InvalidSignatureTime
	- PlayerCreationDisabled
	- PlayerSecretAlreadyConfigured
	- PlayerSecretNotConfigured
	- RequestViewConstraintParamsNotAllowed
	- SignedRequestNotAllowed

]]
function Apis.LoginWithAndroidDeviceID(request: Types.LoginWithAndroidDeviceIDRequest): Result<Types.LoginResult, string>
	return makeApiCall(
		"/Client/LoginWithAndroidDeviceID",
		request,
		"None"
	)
end

--[[
	List all segments that a player currently belongs to at this moment in time.



	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/playstream/getplayersegments).

]]
function Apis.GetPlayerSegments(request: Types.GetPlayerSegmentsRequest, sessionTicket: string): Result<Types.GetPlayerSegmentsResult, string>
	return makeApiCall(
		"/Client/GetPlayerSegments",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Unlinks the related Twitch account from the user's PlayFab account.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/account-management/unlinktwitch).

	### Errors
	- AccountNotLinked
	- FeatureNotConfiguredForTitle
	- InvalidTwitchToken

]]
function Apis.UnlinkTwitch(request: Types.UnlinkTwitchAccountRequest, sessionTicket: string): Result<Types.UnlinkTwitchAccountResult, string>
	return makeApiCall(
		"/Client/UnlinkTwitch",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Signs the user in using a Steam authentication ticket, returning a session
	identifier that can subsequently be used for API calls which require an
	authenticated user

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

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/authentication/loginwithsteam).

	### Errors
	- EncryptionKeyMissing
	- EvaluationModePlayerCountExceeded
	- InvalidSteamTicket
	- InvalidSteamUsername
	- PlayerSecretAlreadyConfigured
	- PlayerSecretNotConfigured
	- RequestViewConstraintParamsNotAllowed
	- SteamNotEnabledForTitle
	- SteamUserNotFound

]]
function Apis.LoginWithSteam(request: Types.LoginWithSteamRequest): Result<Types.LoginResult, string>
	return makeApiCall(
		"/Client/LoginWithSteam",
		request,
		"None"
	)
end

--[[
	Signs the user in using a Nintendo Switch Device ID, returning a session
	identifier that can subsequently be used for API calls which require an
	authenticated user

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/authentication/loginwithnintendoswitchdeviceid).

	### Errors
	- EvaluationModePlayerCountExceeded
	- InvalidSignature
	- InvalidSignatureTime
	- PlayerSecretAlreadyConfigured
	- PlayerSecretNotConfigured
	- RequestViewConstraintParamsNotAllowed

]]
function Apis.LoginWithNintendoSwitchDeviceId(request: Types.LoginWithNintendoSwitchDeviceIdRequest): Result<Types.LoginResult, string>
	return makeApiCall(
		"/Client/LoginWithNintendoSwitchDeviceId",
		request,
		"None"
	)
end

--[[
	Updates the values of the specified title-specific statistics for the user.
	By default, clients are not permitted to update statistics. Developers may
	override this setting in the Game Manager > Settings > API Features.

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

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/player-data-management/updateplayerstatistics).

	### Errors
	- APINotEnabledForGameClientAccess
	- DuplicateStatisticName
	- StatisticCountLimitExceeded
	- StatisticNameConflict
	- StatisticNotFound
	- StatisticValueAggregationOverflow
	- StatisticVersionClosedForWrites
	- StatisticVersionInvalid

]]
function Apis.UpdatePlayerStatistics(request: Types.UpdatePlayerStatisticsRequest, sessionTicket: string): Result<Types.UpdatePlayerStatisticsResult, string>
	return makeApiCall(
		"/Client/UpdatePlayerStatistics",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Retrieves the unique PlayFab identifiers for the given set of Steam
	identifiers. The Steam identifiers are the profile IDs for the user
	accounts, available as SteamId in the Steamworks Community API calls.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/account-management/getplayfabidsfromsteamids).

]]
function Apis.GetPlayFabIDsFromSteamIDs(request: Types.GetPlayFabIDsFromSteamIDsRequest, sessionTicket: string): Result<Types.GetPlayFabIDsFromSteamIDsResult, string>
	return makeApiCall(
		"/Client/GetPlayFabIDsFromSteamIDs",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Writes a player-based event into PlayStream.

	This API is designed to write a multitude of different event types into
	PlayStream. It supports a flexible JSON schema, which allowsfor arbitrary
	key-value pairs to describe any player-based event. The created event will
	be locked to the authenticated title and player.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/analytics/writeplayerevent).

	### Errors
	- InvalidEventField
	- NoWritePermissionsForEvent

]]
function Apis.WritePlayerEvent(request: Types.WriteClientPlayerEventRequest, sessionTicket: string): Result<Types.WriteEventResponse, string>
	return makeApiCall(
		"/Client/WritePlayerEvent",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	_NOTE: This is a Legacy Economy API, and is in bugfix-only mode. All new
	Economy features are being developed only for version 2._ Confirms with the
	payment provider that the purchase was approved (if applicable) and adjusts
	inventory and virtual currency balances as appropriate

	The final step in the purchasing process, this API finalizes the purchase
	with the payment provider, where applicable, adding virtual goods to the
	player inventory (including random drop table resolution and recursive
	addition of bundled items) and adjusting virtual currency balances for funds
	used or added. Note that this is a pull operation, and should be polled
	regularly when a purchase is in progress. Please note that the processing
	time for inventory grants and purchases increases fractionally the more
	items are in the inventory, and the more items are in the grant/purchase
	operation.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/player-item-management/confirmpurchase).

	### Errors
	- FailedByPaymentProvider
	- PurchaseDoesNotExist

]]
function Apis.ConfirmPurchase(request: Types.ConfirmPurchaseRequest, sessionTicket: string): Result<Types.ConfirmPurchaseResult, string>
	return makeApiCall(
		"/Client/ConfirmPurchase",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Links the Android device identifier to the user's PlayFab account

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/account-management/linkandroiddeviceid).

	### Errors
	- LinkedDeviceAlreadyClaimed

]]
function Apis.LinkAndroidDeviceID(request: Types.LinkAndroidDeviceIDRequest, sessionTicket: string): Result<Types.LinkAndroidDeviceIDResult, string>
	return makeApiCall(
		"/Client/LinkAndroidDeviceID",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Get all tags with a given Namespace (optional) from a player profile.

	This API will return a list of canonical tags which includes both namespace
	and tag's name. If namespace is not provided, the result is a list of all
	canonical tags. TagName can be used for segmentation and Namespace is
	limited to 128 characters.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/playstream/getplayertags).

]]
function Apis.GetPlayerTags(request: Types.GetPlayerTagsRequest, sessionTicket: string): Result<Types.GetPlayerTagsResult, string>
	return makeApiCall(
		"/Client/GetPlayerTags",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Retrieves the details of all title-specific statistics for the user

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/characters/getcharacterstatistics).

	### Errors
	- CharacterNotFound

]]
function Apis.GetCharacterStatistics(request: Types.GetCharacterStatisticsRequest, sessionTicket: string): Result<Types.GetCharacterStatisticsResult, string>
	return makeApiCall(
		"/Client/GetCharacterStatistics",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Registers the Android device to receive push notifications

	More information can be found on configuring your game for the Google Cloud
	Messaging service in the Google developer documentation, here:
	http://developer.android.com/google/gcm/client.html. The steps to configure
	and send Push Notifications is described in the PlayFab tutorials, here:
	https://docs.microsoft.com/gaming/playfab/features/engagement/push-notifications/quickstart.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/platform-specific-methods/androiddevicepushnotificationregistration).

	### Errors
	- NoPushNotificationARNForTitle
	- PushServiceError

]]
function Apis.AndroidDevicePushNotificationRegistration(request: Types.AndroidDevicePushNotificationRegistrationRequest, sessionTicket: string): Result<Types.AndroidDevicePushNotificationRegistrationResult, string>
	return makeApiCall(
		"/Client/AndroidDevicePushNotificationRegistration",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Retrieves the publisher-specific custom data for the user which can only be
	read by the client

	Data is stored as JSON key-value pairs. Every time the data is updated via
	any source, the version counter is incremented. If the Version parameter is
	provided, then this call will only return data if the current version on the
	system is greater than the value provided. If the Keys parameter is
	provided, the data object returned will only contain the data specific to
	the indicated Keys. Otherwise, the full set of custom user data will be
	returned.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/player-data-management/getuserpublisherreadonlydata).

	### Errors
	- PublisherNotSet

]]
function Apis.GetUserPublisherReadOnlyData(request: Types.GetUserDataRequest, sessionTicket: string): Result<Types.GetUserDataResult, string>
	return makeApiCall(
		"/Client/GetUserPublisherReadOnlyData",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Requests the creation of a shared group object, containing key/value pairs
	which may be updated by all members of the group. Upon creation, the current
	user will be the only member of the group. Shared Groups are designed for
	sharing data between a very small number of players, please see our guide:
	https://docs.microsoft.com/gaming/playfab/features/social/groups/using-shared-group-data

	If SharedGroupId is specified, the service will attempt to create a group
	with that identifier, and will return an error if it is already in use. If
	no SharedGroupId is specified, a random identifier will be assigned.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/shared-group-data/createsharedgroup).

	### Errors
	- InvalidSharedGroupId

]]
function Apis.CreateSharedGroup(request: Types.CreateSharedGroupRequest, sessionTicket: string): Result<Types.CreateSharedGroupResult, string>
	return makeApiCall(
		"/Client/CreateSharedGroup",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Removes the specified generic service identifier from the player's PlayFab
	account.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/account-management/removegenericid).

	### Errors
	- AccountNotLinked
	- IdentifierNotLinked

]]
function Apis.RemoveGenericID(request: Types.RemoveGenericIDRequest, sessionTicket: string): Result<Types.RemoveGenericIDResult, string>
	return makeApiCall(
		"/Client/RemoveGenericID",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Gets a Photon custom authentication token that can be used to securely join
	the player into a Photon room. See
	https://docs.microsoft.com/gaming/playfab/features/multiplayer/photon/quickstart
	for more details.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/authentication/getphotonauthenticationtoken).

	### Errors
	- PhotonApplicationNotAssociatedWithTitle
	- PhotonApplicationNotFound
	- PhotonNotEnabledForTitle

]]
function Apis.GetPhotonAuthenticationToken(request: Types.GetPhotonAuthenticationTokenRequest, sessionTicket: string): Result<Types.GetPhotonAuthenticationTokenResult, string>
	return makeApiCall(
		"/Client/GetPhotonAuthenticationToken",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Retrieves the current server time

	This query retrieves the current time from one of the servers in PlayFab.
	Please note that due to clock drift between servers, there is a potential
	variance of up to 5 seconds.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/title-wide-data-management/gettime).

	### Errors
	- PublisherNotSet

]]
function Apis.GetTime(request: Types.GetTimeRequest, sessionTicket: string): Result<Types.GetTimeResult, string>
	return makeApiCall(
		"/Client/GetTime",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	_NOTE: This is a Legacy Economy API, and is in bugfix-only mode. All new
	Economy features are being developed only for version 2._ Creates an order
	for a list of items from the title catalog

	This is the first step in the purchasing process. For security purposes,
	once the order (or "cart") has been created, additional inventory objects
	may no longer be added. In addition, inventory objects will be locked to the
	current prices, regardless of any subsequent changes at the catalog level
	which may occur during the next two steps.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/player-item-management/startpurchase).

	### Errors
	- StoreNotFound

]]
function Apis.StartPurchase(request: Types.StartPurchaseRequest, sessionTicket: string): Result<Types.StartPurchaseResult, string>
	return makeApiCall(
		"/Client/StartPurchase",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	_NOTE: This is a Legacy Economy API, and is in bugfix-only mode. All new
	Economy features are being developed only for version 2._ Retrieves the set
	of items defined for the specified store, including all prices defined

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

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/title-wide-data-management/getstoreitems).

	### Errors
	- StoreNotFound

]]
function Apis.GetStoreItems(request: Types.GetStoreItemsRequest, sessionTicket: string): Result<Types.GetStoreItemsResult, string>
	return makeApiCall(
		"/Client/GetStoreItems",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Signs the user in using a Xbox Live Token, returning a session identifier
	that can subsequently be used for API calls which require an authenticated
	user

	If this is the first time a user has signed in with the Xbox Live account
	and CreateAccount is set to true, a new PlayFab account will be created and
	linked to the Xbox Live account. In this case, no email or username will be
	associated with the PlayFab account. Otherwise, if no PlayFab account is
	linked to the Xbox Live account, an error indicating this will be returned,
	so that the title can guide the user through creation of a PlayFab account.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/authentication/loginwithxbox).

	### Errors
	- EncryptionKeyMissing
	- EvaluationModePlayerCountExceeded
	- ExpiredXboxLiveToken
	- InvalidXboxLiveToken
	- RequestViewConstraintParamsNotAllowed
	- SignedRequestNotAllowed
	- XboxInaccessible
	- XboxRejectedXSTSExchangeRequest
	- XboxXASSExchangeFailure

]]
function Apis.LoginWithXbox(request: Types.LoginWithXboxRequest): Result<Types.LoginResult, string>
	return makeApiCall(
		"/Client/LoginWithXbox",
		request,
		"None"
	)
end

--[[
	Retrieves a list of ranked friends of the current player for the given
	statistic, centered on the requested PlayFab user. If PlayFabId is empty or
	null will return currently logged in user.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/player-data-management/getfriendleaderboardaroundplayer).

	### Errors
	- ExpiredXboxLiveToken
	- FacebookAPIError
	- InvalidXboxLiveToken
	- LeaderboardVersionNotAvailable
	- XboxInaccessible
	- XboxServiceTooManyRequests
	- XboxXASSExchangeFailure

]]
function Apis.GetFriendLeaderboardAroundPlayer(request: Types.GetFriendLeaderboardAroundPlayerRequest, sessionTicket: string): Result<Types.GetFriendLeaderboardAroundPlayerResult, string>
	return makeApiCall(
		"/Client/GetFriendLeaderboardAroundPlayer",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Forces an email to be sent to the registered email address for the user's
	account, with a link allowing the user to change the password.If an account
	recovery email template ID is provided, an email using the custom email
	template will be used.

	If the account in question is a "temporary" account (for example, one that
	was created via a call to LoginFromIOSDeviceID), thisfunction will have no
	effect. Only PlayFab accounts which have valid email addresses will be able
	to receive a password reset email using this API.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/account-management/sendaccountrecoveryemail).

	### Errors
	- EmailRecipientBlacklisted
	- InvalidEmailAddress
	- NoContactEmailAddressFound
	- SmtpAddonNotEnabled

]]
function Apis.SendAccountRecoveryEmail(request: Types.SendAccountRecoveryEmailRequest): Result<Types.SendAccountRecoveryEmailResult, string>
	return makeApiCall(
		"/Client/SendAccountRecoveryEmail",
		request,
		"None"
	)
end

--[[
	Gets all trades the player has either opened or accepted, optionally
	filtered by trade status.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/trading/getplayertrades).

]]
function Apis.GetPlayerTrades(request: Types.GetPlayerTradesRequest, sessionTicket: string): Result<Types.GetPlayerTradesResponse, string>
	return makeApiCall(
		"/Client/GetPlayerTrades",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	This API retrieves a pre-signed URL for accessing a content file for the
	title. A subsequent HTTP GET to the returned URL will attempt to download
	the content. A HEAD query to the returned URL will attempt to retrieve the
	metadata of the content. Note that a successful result does not guarantee
	the existence of this content - if it has not been uploaded, the query to
	retrieve the data will fail. See this post for more information:
	https://community.playfab.com/hc/community/posts/205469488-How-to-upload-files-to-PlayFab-s-Content-Service.
	Also, please be aware that the Content service is specifically PlayFab's CDN
	offering, for which standard CDN rates apply.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/content/getcontentdownloadurl).

	### Errors
	- ContentS3OriginBucketNotConfigured

]]
function Apis.GetContentDownloadUrl(request: Types.GetContentDownloadUrlRequest, sessionTicket: string): Result<Types.GetContentDownloadUrlResult, string>
	return makeApiCall(
		"/Client/GetContentDownloadUrl",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Updates the tag list for a specified user in the friend list of the local
	user

	This operation is not additive. It will completely replace the tag list for
	the specified user. Please note that only users in the PlayFab friends list
	can be assigned tags. Attempting to set a tag on a friend only included in
	the friends list from a social site integration (such as Facebook or Steam)
	will return the AccountNotFound error.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/friend-list-management/setfriendtags).

]]
function Apis.SetFriendTags(request: Types.SetFriendTagsRequest, sessionTicket: string): Result<Types.SetFriendTagsResult, string>
	return makeApiCall(
		"/Client/SetFriendTags",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Executes a CloudScript function, with the 'currentPlayerId' set to the
	PlayFab ID of the authenticated player. The PlayFab ID is the entity ID of
	the player's master_player_account entity.



	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/server-side-cloud-script/executecloudscript).

	### Errors
	- CloudScriptAPIRequestCountExceeded
	- CloudScriptAPIRequestError
	- CloudScriptFunctionArgumentSizeExceeded
	- CloudScriptHTTPRequestError
	- CloudScriptNotFound
	- JavascriptException
	- TitleDeleted

]]
function Apis.ExecuteCloudScript(request: Types.ExecuteCloudScriptRequest, sessionTicket: string): Result<Types.ExecuteCloudScriptResult, string>
	return makeApiCall(
		"/Client/ExecuteCloudScript",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Attributes an install for advertisment.

	If you have an ad attribution partner enabled, this will post an install to
	their service to track the device. It uses the given device id to match
	based on clicks on ads.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/advertising/attributeinstall).

	### Errors
	- NoPartnerEnabled

]]
function Apis.AttributeInstall(request: Types.AttributeInstallRequest, sessionTicket: string): Result<Types.AttributeInstallResult, string>
	return makeApiCall(
		"/Client/AttributeInstall",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Unlinks the related PlayStation :tm: Network account from the user's PlayFab
	account

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/account-management/unlinkpsnaccount).

	### Errors
	- AccountNotLinked

]]
function Apis.UnlinkPSNAccount(request: Types.UnlinkPSNAccountRequest, sessionTicket: string): Result<Types.UnlinkPSNAccountResult, string>
	return makeApiCall(
		"/Client/UnlinkPSNAccount",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Signs the user in using their Google account credentials

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

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/authentication/loginwithgoogleaccount).

	### Errors
	- EncryptionKeyMissing
	- EvaluationModePlayerCountExceeded
	- GoogleOAuthError
	- GoogleOAuthNoIdTokenIncludedInResponse
	- GoogleOAuthNotConfiguredForTitle
	- InvalidGoogleToken
	- PlayerSecretAlreadyConfigured
	- PlayerSecretNotConfigured
	- RequestViewConstraintParamsNotAllowed

]]
function Apis.LoginWithGoogleAccount(request: Types.LoginWithGoogleAccountRequest): Result<Types.LoginResult, string>
	return makeApiCall(
		"/Client/LoginWithGoogleAccount",
		request,
		"None"
	)
end

--[[
	Retrieves the unique PlayFab identifiers for the given set of XboxLive
	identifiers.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/account-management/getplayfabidsfromxboxliveids).

]]
function Apis.GetPlayFabIDsFromXboxLiveIDs(request: Types.GetPlayFabIDsFromXboxLiveIDsRequest, sessionTicket: string): Result<Types.GetPlayFabIDsFromXboxLiveIDsResult, string>
	return makeApiCall(
		"/Client/GetPlayFabIDsFromXboxLiveIDs",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Retrieves the unique PlayFab identifiers for the given set of Facebook
	identifiers.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/account-management/getplayfabidsfromfacebookids).

]]
function Apis.GetPlayFabIDsFromFacebookIDs(request: Types.GetPlayFabIDsFromFacebookIDsRequest, sessionTicket: string): Result<Types.GetPlayFabIDsFromFacebookIDsResult, string>
	return makeApiCall(
		"/Client/GetPlayFabIDsFromFacebookIDs",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Links the Steam account associated with the provided Steam authentication
	ticket to the user's PlayFab account

	Steam authentication is accomplished with the Steam Session Ticket. More
	information on the Ticket can be found in the Steamworks SDK, here:
	https://partner.steamgames.com/documentation/auth (requires sign-in). NOTE:
	For Steam authentication to work, the title must be configured with the
	Steam Application ID and Publisher Key in the PlayFab Game Manager (under
	Properties). Information on creating a Publisher Key (referred to as the
	Secret Key in PlayFab) for your title can be found here:
	https://partner.steamgames.com/documentation/webapi#publisherkey.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/account-management/linksteamaccount).

	### Errors
	- AccountAlreadyLinked
	- InvalidSteamTicket
	- LinkedAccountAlreadyClaimed
	- SteamNotEnabledForTitle
	- SteamUserNotFound

]]
function Apis.LinkSteamAccount(request: Types.LinkSteamAccountRequest, sessionTicket: string): Result<Types.LinkSteamAccountResult, string>
	return makeApiCall(
		"/Client/LinkSteamAccount",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	_NOTE: This is a Legacy Economy API, and is in bugfix-only mode. All new
	Economy features are being developed only for version 2._ Retrieves a
	purchase along with its current PlayFab status. Returns inventory items from
	the purchase that are still active.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/player-item-management/getpurchase).

	### Errors
	- PurchaseDoesNotExist

]]
function Apis.GetPurchase(request: Types.GetPurchaseRequest, sessionTicket: string): Result<Types.GetPurchaseResult, string>
	return makeApiCall(
		"/Client/GetPurchase",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Signs the user in using a Facebook Instant Games ID, returning a session
	identifier that can subsequently be used for API calls which require an
	authenticated user. Requires Facebook Instant Games to be configured.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/authentication/loginwithfacebookinstantgamesid).

	### Errors
	- EncryptionKeyMissing
	- EvaluationModePlayerCountExceeded
	- FacebookInstantGamesAuthNotConfiguredForTitle
	- InvalidFacebookInstantGamesSignature
	- InvalidSignature
	- InvalidSignatureTime
	- PlayerSecretAlreadyConfigured
	- PlayerSecretNotConfigured
	- RequestViewConstraintParamsNotAllowed

]]
function Apis.LoginWithFacebookInstantGamesId(request: Types.LoginWithFacebookInstantGamesIdRequest): Result<Types.LoginResult, string>
	return makeApiCall(
		"/Client/LoginWithFacebookInstantGamesId",
		request,
		"None"
	)
end

--[[
	_NOTE: This is a Legacy Economy API, and is in bugfix-only mode. All new
	Economy features are being developed only for version 2._ Retrieves the
	specified version of the title's catalog of virtual goods, including all
	defined properties

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/title-wide-data-management/getcatalogitems).

]]
function Apis.GetCatalogItems(request: Types.GetCatalogItemsRequest, sessionTicket: string): Result<Types.GetCatalogItemsResult, string>
	return makeApiCall(
		"/Client/GetCatalogItems",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Gets the current status of an existing trade.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/trading/gettradestatus).

	### Errors
	- TradeDoesNotExist

]]
function Apis.GetTradeStatus(request: Types.GetTradeStatusRequest, sessionTicket: string): Result<Types.GetTradeStatusResponse, string>
	return makeApiCall(
		"/Client/GetTradeStatus",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Sign in the user with a Battle.net identity token

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/authentication/loginwithbattlenet).

	### Errors
	- AccountNotFound
	- BattleNetNotEnabledForTitle
	- EncryptionKeyMissing
	- EvaluationModePlayerCountExceeded
	- InvalidAuthToken
	- InvalidSignature
	- InvalidSignatureTime
	- InvalidTitleId
	- PlayerSecretAlreadyConfigured
	- PlayerSecretNotConfigured
	- RequestViewConstraintParamsNotAllowed

]]
function Apis.LoginWithBattleNet(request: Types.LoginWithBattleNetRequest): Result<Types.LoginResult, string>
	return makeApiCall(
		"/Client/LoginWithBattleNet",
		request,
		"None"
	)
end

--[[
	Retrieves a list of ranked characters for the given statistic, starting from
	the indicated point in the leaderboard

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/characters/getcharacterleaderboard).

]]
function Apis.GetCharacterLeaderboard(request: Types.GetCharacterLeaderboardRequest, sessionTicket: string): Result<Types.GetCharacterLeaderboardResult, string>
	return makeApiCall(
		"/Client/GetCharacterLeaderboard",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Retrieves the title-specific custom data for the character which can only be
	read by the client

	Data is stored as JSON key-value pairs. If the Keys parameter is provided,
	the data object returned will only contain the data specific to the
	indicated Keys. Otherwise, the full set of custom character data will be
	returned.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/character-data/getcharacterreadonlydata).

	### Errors
	- CharacterNotFound
	- UserisNotValid

]]
function Apis.GetCharacterReadOnlyData(request: Types.GetCharacterDataRequest, sessionTicket: string): Result<Types.GetCharacterDataResult, string>
	return makeApiCall(
		"/Client/GetCharacterReadOnlyData",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Signs the user in using a Twitch access token.

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

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/authentication/loginwithtwitch).

	### Errors
	- EncryptionKeyMissing
	- EvaluationModePlayerCountExceeded
	- FeatureNotConfiguredForTitle
	- InvalidTwitchToken
	- PlayerSecretAlreadyConfigured
	- PlayerSecretNotConfigured
	- RequestViewConstraintParamsNotAllowed
	- TwitchResponseError

]]
function Apis.LoginWithTwitch(request: Types.LoginWithTwitchRequest): Result<Types.LoginResult, string>
	return makeApiCall(
		"/Client/LoginWithTwitch",
		request,
		"None"
	)
end

--[[
	Adds users to the set of those able to update both the shared data, as well
	as the set of users in the group. Only users in the group can add new
	members. Shared Groups are designed for sharing data between a very small
	number of players, please see our guide:
	https://docs.microsoft.com/gaming/playfab/features/social/groups/using-shared-group-data

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/shared-group-data/addsharedgroupmembers).

	### Errors
	- UserAlreadyAdded

]]
function Apis.AddSharedGroupMembers(request: Types.AddSharedGroupMembersRequest, sessionTicket: string): Result<Types.AddSharedGroupMembersResult, string>
	return makeApiCall(
		"/Client/AddSharedGroupMembers",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Registers the iOS device to receive push notifications

	The steps to configure and send Push Notifications is described in the
	PlayFab tutorials, here:
	https://docs.microsoft.com/gaming/playfab/features/engagement/push-notifications/quickstart

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/platform-specific-methods/registerforiospushnotification).

	### Errors
	- NoPushNotificationARNForTitle
	- PushServiceError

]]
function Apis.RegisterForIOSPushNotification(request: Types.RegisterForIOSPushNotificationRequest, sessionTicket: string): Result<Types.RegisterForIOSPushNotificationResult, string>
	return makeApiCall(
		"/Client/RegisterForIOSPushNotification",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Write a PlayStream event to describe the provided player device information.
	This API method is not designed to be called directly by developers. Each
	PlayFab client SDK will eventually report this information automatically.

	Any arbitrary information collected by the device

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/analytics/reportdeviceinfo).

	### Errors
	- BodyTooLarge

]]
function Apis.ReportDeviceInfo(request: Types.DeviceInfoRequest, sessionTicket: string): Result<Types.EmptyResponse, string>
	return makeApiCall(
		"/Client/ReportDeviceInfo",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Updates the title specific display name for the user

	In addition to the PlayFab username, titles can make use of a DisplayName
	which is also a unique identifier, but specific to the title. This allows
	for unique names which more closely match the theme or genre of a title, for
	example.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/account-management/updateusertitledisplayname).

	### Errors
	- AccountNotFound
	- ConcurrentEditError
	- EntityProfileConstraintValidationFailed
	- EntityProfileVersionMismatch
	- InvalidPartnerResponse
	- NameNotAvailable
	- ProfaneDisplayName

]]
function Apis.UpdateUserTitleDisplayName(request: Types.UpdateUserTitleDisplayNameRequest, sessionTicket: string): Result<Types.UpdateUserTitleDisplayNameResult, string>
	return makeApiCall(
		"/Client/UpdateUserTitleDisplayName",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Signs the user in using a PlayStation :tm: Network authentication code,
	returning a session identifier that can subsequently be used for API calls
	which require an authenticated user

	If this is the first time a user has signed in with the PlayStation :tm:
	Network account and CreateAccount is set to true, a new PlayFab account will
	be created and linked to the PlayStation :tm: Network account. In this case,
	no email or username will be associated with the PlayFab account. Otherwise,
	if no PlayFab account is linked to the PlayStation :tm: Network account, an
	error indicating this will be returned, so that the title can guide the user
	through creation of a PlayFab account.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/authentication/loginwithpsn).

	### Errors
	- EncryptionKeyMissing
	- EvaluationModePlayerCountExceeded
	- FeatureNotConfiguredForTitle
	- InvalidPSNAuthCode
	- InvalidPSNIssuerId
	- PlayerSecretAlreadyConfigured
	- PlayerSecretNotConfigured
	- PSNInaccessible
	- RequestViewConstraintParamsNotAllowed

]]
function Apis.LoginWithPSN(request: Types.LoginWithPSNRequest): Result<Types.LoginResult, string>
	return makeApiCall(
		"/Client/LoginWithPSN",
		request,
		"None"
	)
end

--[[
	Unlinks the related Nintendo account from the user's PlayFab account.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/account-management/unlinknintendoserviceaccount).

	### Errors
	- AccountNotLinked
	- NintendoSwitchNotEnabledForTitle

]]
function Apis.UnlinkNintendoServiceAccount(request: Types.UnlinkNintendoServiceAccountRequest, sessionTicket: string): Result<Types.EmptyResponse, string>
	return makeApiCall(
		"/Client/UnlinkNintendoServiceAccount",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Retrieves the title-specific custom data for the user which is readable and
	writable by the client

	Data is stored as JSON key-value pairs. Every time the data is updated via
	any source, the version counter is incremented. If the Version parameter is
	provided, then this call will only return data if the current version on the
	system is greater than the value provided. If the Keys parameter is
	provided, the data object returned will only contain the data specific to
	the indicated Keys. Otherwise, the full set of custom user data will be
	returned.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/player-data-management/getuserdata).

]]
function Apis.GetUserData(request: Types.GetUserDataRequest, sessionTicket: string): Result<Types.GetUserDataResult, string>
	return makeApiCall(
		"/Client/GetUserData",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Returns the title's base 64 encoded RSA CSP blob.

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

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/authentication/gettitlepublickey).

	### Errors
	- EncryptionKeyBroken
	- InvalidSharedSecretKey
	- NoSharedSecretKeyConfigured

]]
function Apis.GetTitlePublicKey(request: Types.GetTitlePublicKeyRequest): Result<Types.GetTitlePublicKeyResult, string>
	return makeApiCall(
		"/Client/GetTitlePublicKey",
		request,
		"None"
	)
end

--[[
	Unlinks the related iOS device identifier from the user's PlayFab account

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/account-management/unlinkiosdeviceid).

	### Errors
	- AccountNotLinked
	- DeviceNotLinked

]]
function Apis.UnlinkIOSDeviceID(request: Types.UnlinkIOSDeviceIDRequest, sessionTicket: string): Result<Types.UnlinkIOSDeviceIDResult, string>
	return makeApiCall(
		"/Client/UnlinkIOSDeviceID",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Unlinks the related Kongregate identifier from the user's PlayFab account

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/account-management/unlinkkongregate).

	### Errors
	- AccountNotLinked

]]
function Apis.UnlinkKongregate(request: Types.UnlinkKongregateAccountRequest, sessionTicket: string): Result<Types.UnlinkKongregateAccountResult, string>
	return makeApiCall(
		"/Client/UnlinkKongregate",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Retrieves data stored in a shared group object, as well as the list of
	members in the group. Non-members of the group may use this to retrieve
	group data, including membership, but they will not receive data for keys
	marked as private. Shared Groups are designed for sharing data between a
	very small number of players, please see our guide:
	https://docs.microsoft.com/gaming/playfab/features/social/groups/using-shared-group-data

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/shared-group-data/getsharedgroupdata).

]]
function Apis.GetSharedGroupData(request: Types.GetSharedGroupDataRequest, sessionTicket: string): Result<Types.GetSharedGroupDataResult, string>
	return makeApiCall(
		"/Client/GetSharedGroupData",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	_NOTE: This is a Legacy Economy API, and is in bugfix-only mode. All new
	Economy features are being developed only for version 2._ For payments flows
	where the provider requires playfab (the fulfiller) to initiate the
	transaction, but the client completes the rest of the flow. In the Xsolla
	case, the token returned here will be passed to Xsolla by the client to
	create a cart. Poll GetPurchase using the returned OrderId once you've
	completed the payment.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/player-item-management/getpaymenttoken).

	### Errors
	- InvalidPaymentProvider
	- NoPartnerEnabled

]]
function Apis.GetPaymentToken(request: Types.GetPaymentTokenRequest, sessionTicket: string): Result<Types.GetPaymentTokenResult, string>
	return makeApiCall(
		"/Client/GetPaymentToken",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	_NOTE: This is a Legacy Economy API, and is in bugfix-only mode. All new
	Economy features are being developed only for version 2._ Consume uses of a
	consumable item. When all uses are consumed, it will be removed from the
	player's inventory.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/player-item-management/consumeitem).

	### Errors
	- CharacterNotFound
	- InvalidItemProperties
	- ItemNotFound
	- NoRemainingUses

]]
function Apis.ConsumeItem(request: Types.ConsumeItemRequest, sessionTicket: string): Result<Types.ConsumeItemResult, string>
	return makeApiCall(
		"/Client/ConsumeItem",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Registers a new Playfab user account, returning a session identifier that
	can subsequently be used for API calls which require an authenticated user.
	You must supply a username and an email address.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/authentication/registerplayfabuser).

	### Errors
	- EmailAddressNotAvailable
	- EncryptionKeyMissing
	- EvaluationModePlayerCountExceeded
	- InvalidEmailAddress
	- InvalidPartnerResponse
	- InvalidPassword
	- InvalidUsername
	- NameNotAvailable
	- ProfaneDisplayName
	- SignedRequestNotAllowed
	- UsernameNotAvailable

]]
function Apis.RegisterPlayFabUser(request: Types.RegisterPlayFabUserRequest): Result<Types.RegisterPlayFabUserResult, string>
	return makeApiCall(
		"/Client/RegisterPlayFabUser",
		request,
		"None"
	)
end

--[[
	Retrieves the user's PlayFab account details

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/account-management/getaccountinfo).

]]
function Apis.GetAccountInfo(request: Types.GetAccountInfoRequest, sessionTicket: string): Result<Types.GetAccountInfoResult, string>
	return makeApiCall(
		"/Client/GetAccountInfo",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Links the Twitch account associated with the token to the user's PlayFab
	account.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/account-management/linktwitch).

	### Errors
	- AccountAlreadyLinked
	- FeatureNotConfiguredForTitle
	- InvalidTwitchToken
	- LinkedAccountAlreadyClaimed
	- TwitchResponseError

]]
function Apis.LinkTwitch(request: Types.LinkTwitchAccountRequest, sessionTicket: string): Result<Types.LinkTwitchAccountResult, string>
	return makeApiCall(
		"/Client/LinkTwitch",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	_NOTE: This is a Legacy Economy API, and is in bugfix-only mode. All new
	Economy features are being developed only for version 2._ Buys a single item
	with virtual currency. You must specify both the virtual currency to use to
	purchase, as well as what the client believes the price to be. This lets the
	server fail the purchase if the price has changed.

	Please note that the processing time for inventory grants and purchases
	increases fractionally the more items are in the inventory, and the more
	items are in the grant/purchase operation (with each item in a bundle being
	a distinct add).

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/player-item-management/purchaseitem).

	### Errors
	- CharacterNotFound
	- InsufficientFunds
	- InvalidVirtualCurrency
	- ItemNotFound
	- OperationNotSupportedForPlatform
	- StoreNotFound
	- WrongPrice
	- WrongVirtualCurrency

]]
function Apis.PurchaseItem(request: Types.PurchaseItemRequest, sessionTicket: string): Result<Types.PurchaseItemResult, string>
	return makeApiCall(
		"/Client/PurchaseItem",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Links an OpenID Connect account to a user's PlayFab account, based on an
	existing relationship between a title and an Open ID Connect provider and
	the OpenId Connect JWT from that provider.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/account-management/linkopenidconnect).

	### Errors
	- InvalidIdentityProviderId
	- LinkedIdentifierAlreadyClaimed

]]
function Apis.LinkOpenIdConnect(request: Types.LinkOpenIdConnectRequest, sessionTicket: string): Result<Types.EmptyResult, string>
	return makeApiCall(
		"/Client/LinkOpenIdConnect",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Retrieves a list of ranked users for the given statistic, centered on the
	requested player. If PlayFabId is empty or null will return currently logged
	in user.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/player-data-management/getleaderboardaroundplayer).

	### Errors
	- LeaderboardVersionNotAvailable

]]
function Apis.GetLeaderboardAroundPlayer(request: Types.GetLeaderboardAroundPlayerRequest, sessionTicket: string): Result<Types.GetLeaderboardAroundPlayerResult, string>
	return makeApiCall(
		"/Client/GetLeaderboardAroundPlayer",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Creates and updates the publisher-specific custom data for the user which is
	readable and writable by the client

	This function performs an additive update of the arbitrary strings
	containing the custom data for the user. In updating the custom data object,
	keys which already exist in the object will have their values overwritten,
	while keys with null values will be removed. New keys will be added, with
	the given values. No other key-value pairs will be changed apart from those
	specified in the call.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/player-data-management/updateuserpublisherdata).

	### Errors
	- PublisherNotSet

]]
function Apis.UpdateUserPublisherData(request: Types.UpdateUserDataRequest, sessionTicket: string): Result<Types.UpdateUserDataResult, string>
	return makeApiCall(
		"/Client/UpdateUserPublisherData",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Adds, updates, and removes data keys for a shared group object. If the
	permission is set to Public, all fields updated or added in this call will
	be readable by users not in the group. By default, data permissions are set
	to Private. Regardless of the permission setting, only members of the group
	can update the data. Shared Groups are designed for sharing data between a
	very small number of players, please see our guide:
	https://docs.microsoft.com/gaming/playfab/features/social/groups/using-shared-group-data

	Note that in the case of multiple calls to write to the same shared group
	data keys, the last write received by the PlayFab service will determine the
	value available to subsequent read operations. For scenarios requiring
	coordination of data updates, it is recommended that titles make use of user
	data with read permission set to public, or a combination of user data and
	shared group data.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/shared-group-data/updatesharedgroupdata).

]]
function Apis.UpdateSharedGroupData(request: Types.UpdateSharedGroupDataRequest, sessionTicket: string): Result<Types.UpdateSharedGroupDataResult, string>
	return makeApiCall(
		"/Client/UpdateSharedGroupData",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Retrieves the unique PlayFab identifiers for the given set of PlayStation
	:tm: Network identifiers.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/account-management/getplayfabidsfrompsnaccountids).

	### Errors
	- InvalidPSNAuthCode

]]
function Apis.GetPlayFabIDsFromPSNAccountIDs(request: Types.GetPlayFabIDsFromPSNAccountIDsRequest, sessionTicket: string): Result<Types.GetPlayFabIDsFromPSNAccountIDsResult, string>
	return makeApiCall(
		"/Client/GetPlayFabIDsFromPSNAccountIDs",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Adds or updates a contact email to the player's profile.

	This API adds a contact email to the player's profile. If the player's
	profile already contains a contact email, it will update the contact email
	to the email address specified.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/account-management/addorupdatecontactemail).

]]
function Apis.AddOrUpdateContactEmail(request: Types.AddOrUpdateContactEmailRequest, sessionTicket: string): Result<Types.AddOrUpdateContactEmailResult, string>
	return makeApiCall(
		"/Client/AddOrUpdateContactEmail",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Cancels an open trade (one that has not yet been accepted or cancelled).
	Note that only the player who created the trade can cancel it via this API
	call, to prevent griefing of the trade system (cancelling trades in order to
	prevent other players from accepting them, for trades that can be claimed by
	more than one player).

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/trading/canceltrade).

	### Errors
	- TradeAlreadyFilled
	- TradeCancelled
	- TradeDoesNotExist
	- TradeStatusNotValidForCancelling
	- TradeWaitForStatusTimeout

]]
function Apis.CancelTrade(request: Types.CancelTradeRequest, sessionTicket: string): Result<Types.CancelTradeResponse, string>
	return makeApiCall(
		"/Client/CancelTrade",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Retrieves a list of all of the user's characters for the given statistic.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/characters/getleaderboardforusercharacters).

]]
function Apis.GetLeaderboardForUserCharacters(request: Types.GetLeaderboardForUsersCharactersRequest, sessionTicket: string): Result<Types.GetLeaderboardForUsersCharactersResult, string>
	return makeApiCall(
		"/Client/GetLeaderboardForUserCharacters",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Retrieves the current friend list for the local user, constrained to users
	who have PlayFab accounts. Friends from linked accounts (Facebook, Steam)
	are also included. You may optionally exclude some linked services' friends.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/friend-list-management/getfriendslist).

	### Errors
	- AccountNotFound
	- ExpiredXboxLiveToken
	- FacebookAPIError
	- InvalidXboxLiveToken
	- XboxInaccessible
	- XboxServiceTooManyRequests
	- XboxXASSExchangeFailure

]]
function Apis.GetFriendsList(request: Types.GetFriendsListRequest, sessionTicket: string): Result<Types.GetFriendsListResult, string>
	return makeApiCall(
		"/Client/GetFriendsList",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Unlinks the related Steam account from the user's PlayFab account

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/account-management/unlinksteamaccount).

	### Errors
	- AccountNotLinked

]]
function Apis.UnlinkSteamAccount(request: Types.UnlinkSteamAccountRequest, sessionTicket: string): Result<Types.UnlinkSteamAccountResult, string>
	return makeApiCall(
		"/Client/UnlinkSteamAccount",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Retrieves the unique PlayFab identifiers for the given set of generic
	service identifiers. A generic identifier is the service name plus the
	service-specific ID for the player, as specified by the title when the
	generic identifier was added to the player account.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/account-management/getplayfabidsfromgenericids).

]]
function Apis.GetPlayFabIDsFromGenericIDs(request: Types.GetPlayFabIDsFromGenericIDsRequest, sessionTicket: string): Result<Types.GetPlayFabIDsFromGenericIDsResult, string>
	return makeApiCall(
		"/Client/GetPlayFabIDsFromGenericIDs",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Retrieves the unique PlayFab identifiers for the given set of Nintendo
	Switch Device identifiers.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/account-management/getplayfabidsfromnintendoswitchdeviceids).

]]
function Apis.GetPlayFabIDsFromNintendoSwitchDeviceIds(request: Types.GetPlayFabIDsFromNintendoSwitchDeviceIdsRequest, sessionTicket: string): Result<Types.GetPlayFabIDsFromNintendoSwitchDeviceIdsResult, string>
	return makeApiCall(
		"/Client/GetPlayFabIDsFromNintendoSwitchDeviceIds",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Writes a title-based event into PlayStream.

	This API is designed to write a multitude of different client-defined events
	into PlayStream. It supports a flexible JSON schema, which allowsfor
	arbitrary key-value pairs to describe any title-based event. The created
	event will be locked to the authenticated title.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/analytics/writetitleevent).

	### Errors
	- InvalidEventField
	- NoWritePermissionsForEvent

]]
function Apis.WriteTitleEvent(request: Types.WriteTitleEventRequest, sessionTicket: string): Result<Types.WriteEventResponse, string>
	return makeApiCall(
		"/Client/WriteTitleEvent",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Retrieves the unique PlayFab identifiers for the given set of PlayStation
	:tm: Network identifiers.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/account-management/getplayfabidsfrompsnonlineids).

	### Errors
	- InvalidPSNAuthCode

]]
function Apis.GetPlayFabIDsFromPSNOnlineIDs(request: Types.GetPlayFabIDsFromPSNOnlineIDsRequest, sessionTicket: string): Result<Types.GetPlayFabIDsFromPSNOnlineIDsResult, string>
	return makeApiCall(
		"/Client/GetPlayFabIDsFromPSNOnlineIDs",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Links the custom identifier, generated by the title, to the user's PlayFab
	account

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/account-management/linkcustomid).

	### Errors
	- LinkedIdentifierAlreadyClaimed

]]
function Apis.LinkCustomID(request: Types.LinkCustomIDRequest, sessionTicket: string): Result<Types.LinkCustomIDResult, string>
	return makeApiCall(
		"/Client/LinkCustomID",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Retrieves the unique PlayFab identifiers for the given set of Game Center
	identifiers (referenced in the Game Center Programming Guide as the Player
	Identifier).

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/account-management/getplayfabidsfromgamecenterids).

]]
function Apis.GetPlayFabIDsFromGameCenterIDs(request: Types.GetPlayFabIDsFromGameCenterIDsRequest, sessionTicket: string): Result<Types.GetPlayFabIDsFromGameCenterIDsResult, string>
	return makeApiCall(
		"/Client/GetPlayFabIDsFromGameCenterIDs",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Unlinks the related Facebook Instant Game Ids from the user's PlayFab
	account

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/account-management/unlinkfacebookinstantgamesid).

	### Errors
	- AccountNotLinked
	- FacebookInstantGamesIdNotLinked

]]
function Apis.UnlinkFacebookInstantGamesId(request: Types.UnlinkFacebookInstantGamesIdRequest, sessionTicket: string): Result<Types.UnlinkFacebookInstantGamesIdResult, string>
	return makeApiCall(
		"/Client/UnlinkFacebookInstantGamesId",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Unlinks the related Facebook account from the user's PlayFab account

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/account-management/unlinkfacebookaccount).

	### Errors
	- AccountNotLinked

]]
function Apis.UnlinkFacebookAccount(request: Types.UnlinkFacebookAccountRequest, sessionTicket: string): Result<Types.UnlinkFacebookAccountResult, string>
	return makeApiCall(
		"/Client/UnlinkFacebookAccount",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Retrieves the unique PlayFab identifiers for the given set of Nintendo
	Service Account identifiers.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/account-management/getplayfabidsfromnintendoserviceaccountids).

]]
function Apis.GetPlayFabIDsFromNintendoServiceAccountIds(request: Types.GetPlayFabIDsFromNintendoServiceAccountIdsRequest, sessionTicket: string): Result<Types.GetPlayFabIDsFromNintendoServiceAccountIdsResult, string>
	return makeApiCall(
		"/Client/GetPlayFabIDsFromNintendoServiceAccountIds",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Unlinks the related custom identifier from the user's PlayFab account

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/account-management/unlinkcustomid).

	### Errors
	- AccountNotLinked
	- CustomIdNotLinked

]]
function Apis.UnlinkCustomID(request: Types.UnlinkCustomIDRequest, sessionTicket: string): Result<Types.UnlinkCustomIDResult, string>
	return makeApiCall(
		"/Client/UnlinkCustomID",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Returns a list of ad placements and a reward for each

	Using an AppId to return a list of valid ad placements for a player.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/advertising/getadplacements).

]]
function Apis.GetAdPlacements(request: Types.GetAdPlacementsRequest, sessionTicket: string): Result<Types.GetAdPlacementsResult, string>
	return makeApiCall(
		"/Client/GetAdPlacements",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Retrieves the title-specific custom data for the user which can only be read
	by the client

	Data is stored as JSON key-value pairs. Every time the data is updated via
	any source, the version counter is incremented. If the Version parameter is
	provided, then this call will only return data if the current version on the
	system is greater than the value provided. If the Keys parameter is
	provided, the data object returned will only contain the data specific to
	the indicated Keys. Otherwise, the full set of custom user data will be
	returned.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/player-data-management/getuserreadonlydata).

]]
function Apis.GetUserReadOnlyData(request: Types.GetUserDataRequest, sessionTicket: string): Result<Types.GetUserDataResult, string>
	return makeApiCall(
		"/Client/GetUserReadOnlyData",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Sets the player's secret if it is not already set. Player secrets are used
	to sign API requests. To reset a player's secret use the Admin or Server API
	method SetPlayerSecret.

	APIs that require signatures require that the player have a configured
	Player Secret Key that is used to sign all requests. Players that don't have
	a secret will be blocked from making API calls until it is configured. To
	create a signature header add a SHA256 hashed string containing UTF8 encoded
	JSON body as it will be sent to the server, the current time in UTC
	formatted to ISO 8601, and the players secret formatted as
	'body.date.secret'. Place the resulting hash into the header
	X-PlayFab-Signature, along with a header X-PlayFab-Timestamp of the same UTC
	timestamp used in the signature.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/authentication/setplayersecret).

	### Errors
	- EncryptionKeyMissing
	- PlayerSecretAlreadyConfigured
	- PlayerSecretNotConfigured

]]
function Apis.SetPlayerSecret(request: Types.SetPlayerSecretRequest, sessionTicket: string): Result<Types.SetPlayerSecretResult, string>
	return makeApiCall(
		"/Client/SetPlayerSecret",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Links the Facebook account associated with the provided Facebook access
	token to the user's PlayFab account

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

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/account-management/linkfacebookaccount).

	### Errors
	- AccountAlreadyLinked
	- AccountNotFound
	- FacebookAPIError
	- InvalidFacebookToken
	- LinkedAccountAlreadyClaimed

]]
function Apis.LinkFacebookAccount(request: Types.LinkFacebookAccountRequest, sessionTicket: string): Result<Types.LinkFacebookAccountResult, string>
	return makeApiCall(
		"/Client/LinkFacebookAccount",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Retrieves the unique PlayFab identifiers for the given set of Kongregate
	identifiers. The Kongregate identifiers are the IDs for the user accounts,
	available as "user_id" from the Kongregate API methods(ex:
	http://developers.kongregate.com/docs/client/getUserId).

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/account-management/getplayfabidsfromkongregateids).

]]
function Apis.GetPlayFabIDsFromKongregateIDs(request: Types.GetPlayFabIDsFromKongregateIDsRequest, sessionTicket: string): Result<Types.GetPlayFabIDsFromKongregateIDsResult, string>
	return makeApiCall(
		"/Client/GetPlayFabIDsFromKongregateIDs",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Retrieves a list of ranked users for the given statistic, starting from the
	indicated point in the leaderboard

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/player-data-management/getleaderboard).

	### Errors
	- LeaderboardVersionNotAvailable

]]
function Apis.GetLeaderboard(request: Types.GetLeaderboardRequest, sessionTicket: string): Result<Types.GetLeaderboardResult, string>
	return makeApiCall(
		"/Client/GetLeaderboard",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	_NOTE: This is a Legacy Economy API, and is in bugfix-only mode. All new
	Economy features are being developed only for version 2._ Selects a payment
	option for purchase order created via StartPurchase

	This is the second step in the purchasing process, initiating the purchase
	transaction with the payment provider (if applicable). For payment provider
	scenarios, the title should next present the user with the payment
	provider'sinterface for payment. Once the player has completed the payment
	with the provider, the title should call ConfirmPurchase tofinalize the
	process and add the appropriate items to the player inventory.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/player-item-management/payforpurchase).

	### Errors
	- DuplicatePurchaseTransactionId
	- FailedByPaymentProvider
	- InsufficientFunds
	- InvalidPaymentProvider
	- InvalidPurchaseTransactionStatus
	- PurchaseDoesNotExist
	- PurchaseInitializationFailure

]]
function Apis.PayForPurchase(request: Types.PayForPurchaseRequest, sessionTicket: string): Result<Types.PayForPurchaseResult, string>
	return makeApiCall(
		"/Client/PayForPurchase",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Unlinks the related Game Center account from the user's PlayFab account

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/account-management/unlinkgamecenteraccount).

	### Errors
	- AccountNotLinked

]]
function Apis.UnlinkGameCenterAccount(request: Types.UnlinkGameCenterAccountRequest, sessionTicket: string): Result<Types.UnlinkGameCenterAccountResult, string>
	return makeApiCall(
		"/Client/UnlinkGameCenterAccount",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Creates and updates the title-specific custom data for the user which is
	readable and writable by the client

	This function performs an additive update of the arbitrary strings
	containing the custom data for the user. In updating the custom data object,
	keys which already exist in the object will have their values overwritten,
	while keys with null values will be removed. New keys will be added, with
	the given values. No other key-value pairs will be changed apart from those
	specified in the call.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/player-data-management/updateuserdata).

]]
function Apis.UpdateUserData(request: Types.UpdateUserDataRequest, sessionTicket: string): Result<Types.UpdateUserDataResult, string>
	return makeApiCall(
		"/Client/UpdateUserData",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Signs the user in using their Google Play Games account credentials

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

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/authentication/loginwithgoogleplaygamesservices).

	### Errors
	- EncryptionKeyMissing
	- EvaluationModePlayerCountExceeded
	- GoogleOAuthError
	- GoogleOAuthNotConfiguredForTitle
	- InvalidGooglePlayGamesServerAuthCode
	- InvalidGoogleToken
	- InvalidGoogleToken
	- PlayerSecretAlreadyConfigured
	- PlayerSecretNotConfigured
	- RequestViewConstraintParamsNotAllowed

]]
function Apis.LoginWithGooglePlayGamesServices(request: Types.LoginWithGooglePlayGamesServicesRequest): Result<Types.LoginResult, string>
	return makeApiCall(
		"/Client/LoginWithGooglePlayGamesServices",
		request,
		"None"
	)
end

--[[
	Retrieves the key-value store of custom publisher settings

	This API is designed to return publisher-specific values which can be read,
	but not written to, by the client. This data is shared across all titles
	assigned to a particular publisher, and can be used for cross-game
	coordination. Only titles assigned to a publisher can use this API. For more
	information email helloplayfab@microsoft.com. Note that there may up to a
	minute delay in between updating title data and this API call returning the
	newest value.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/title-wide-data-management/getpublisherdata).

	### Errors
	- PublisherNotSet

]]
function Apis.GetPublisherData(request: Types.GetPublisherDataRequest, sessionTicket: string): Result<Types.GetPublisherDataResult, string>
	return makeApiCall(
		"/Client/GetPublisherData",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Uses the supplied OAuth code to refresh the internally cached player
	PlayStation :tm: Network auth token

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/platform-specific-methods/refreshpsnauthtoken).

	### Errors
	- InvalidPSNAuthCode
	- PSNInaccessible

]]
function Apis.RefreshPSNAuthToken(request: Types.RefreshPSNAuthTokenRequest, sessionTicket: string): Result<Types.EmptyResponse, string>
	return makeApiCall(
		"/Client/RefreshPSNAuthToken",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Links the currently signed-in user account to their Google account, using
	their Google account credentials

	Google sign-in is accomplished by obtaining a Google OAuth 2.0 credential
	using the Google sign-in for Android APIs on the device and passing it to
	this API.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/account-management/linkgoogleaccount).

	### Errors
	- AccountAlreadyLinked
	- GoogleOAuthError
	- GoogleOAuthNoIdTokenIncludedInResponse
	- GoogleOAuthNotConfiguredForTitle
	- InvalidGoogleToken
	- LinkedAccountAlreadyClaimed

]]
function Apis.LinkGoogleAccount(request: Types.LinkGoogleAccountRequest, sessionTicket: string): Result<Types.LinkGoogleAccountResult, string>
	return makeApiCall(
		"/Client/LinkGoogleAccount",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Retrieves all of the user's different kinds of info.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/account-management/getplayercombinedinfo).

	### Errors
	- RequestViewConstraintParamsNotAllowed

]]
function Apis.GetPlayerCombinedInfo(request: Types.GetPlayerCombinedInfoRequest, sessionTicket: string): Result<Types.GetPlayerCombinedInfoResult, string>
	return makeApiCall(
		"/Client/GetPlayerCombinedInfo",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Retrieves a list of ranked characters for the given statistic, centered on
	the requested Character ID

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/characters/getleaderboardaroundcharacter).

]]
function Apis.GetLeaderboardAroundCharacter(request: Types.GetLeaderboardAroundCharacterRequest, sessionTicket: string): Result<Types.GetLeaderboardAroundCharacterResult, string>
	return makeApiCall(
		"/Client/GetLeaderboardAroundCharacter",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	_NOTE: This is a Legacy Economy API, and is in bugfix-only mode. All new
	Economy features are being developed only for version 2._ Validates a Google
	Play purchase and gives the corresponding item to the player.

	The packageName and productId are defined in the GooglePlay store. The
	productId must match the ItemId of the inventory item in the PlayFab catalog
	for the title. This enables the PlayFab service to securely validate that
	the purchase is for the correct item, in order to prevent uses from passing
	valid receipts as being for more expensive items (passing a receipt for a
	99-cent purchase as being for a $19.99 purchase, for example). Each receipt
	may be validated only once to avoid granting the same item over and over
	from a single purchase.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/platform-specific-methods/validategoogleplaypurchase).

	### Errors
	- GoogleAPIServiceUnavailable
	- GoogleAPIServiceUnknownError
	- GoogleServiceAccountFailedAuth
	- GoogleServiceAccountInvalid
	- InvalidBundleID
	- InvalidProductForSubscription
	- InvalidPurchaseTransactionStatus
	- InvalidReceipt
	- MissingTitleGoogleProperties
	- NoMatchingCatalogItemForReceipt
	- NoRealMoneyPriceForCatalogItem
	- ReceiptAlreadyUsed
	- ReceiptCancelled
	- SubscriptionAlreadyTaken

]]
function Apis.ValidateGooglePlayPurchase(request: Types.ValidateGooglePlayPurchaseRequest, sessionTicket: string): Result<Types.ValidateGooglePlayPurchaseResult, string>
	return makeApiCall(
		"/Client/ValidateGooglePlayPurchase",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Signs the user in using an iOS Game Center player identifier, returning a
	session identifier that can subsequently be used for API calls which require
	an authenticated user. Logging in with a Game Center ID is insecure if you
	do not include the optional PublicKeyUrl, Salt, Signature, and Timestamp
	parameters in this request. It is recommended you require these parameters
	on all Game Center calls by going to the Apple Add-ons page in the PlayFab
	Game Manager and enabling the 'Require secure authentication only for this
	app' option.

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

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/authentication/loginwithgamecenter).

	### Errors
	- EncryptionKeyMissing
	- EvaluationModePlayerCountExceeded
	- GameCenterAuthenticationFailed
	- InvalidGameCenterAuthRequest
	- InvalidGameCenterId
	- PlayerSecretAlreadyConfigured
	- PlayerSecretNotConfigured
	- RequestViewConstraintParamsNotAllowed

]]
function Apis.LoginWithGameCenter(request: Types.LoginWithGameCenterRequest): Result<Types.LoginResult, string>
	return makeApiCall(
		"/Client/LoginWithGameCenter",
		request,
		"None"
	)
end

--[[
	Signs in the user with a Sign in with Apple identity token.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/authentication/loginwithapple).

	### Errors
	- AppleNotEnabledForTitle
	- EncryptionKeyMissing
	- EvaluationModePlayerCountExceeded
	- InvalidSignature
	- InvalidSignatureTime
	- PlayerSecretAlreadyConfigured
	- PlayerSecretNotConfigured
	- RequestViewConstraintParamsNotAllowed
	- TokenSigningKeyNotFound

]]
function Apis.LoginWithApple(request: Types.LoginWithAppleRequest): Result<Types.LoginResult, string>
	return makeApiCall(
		"/Client/LoginWithApple",
		request,
		"None"
	)
end

--[[
	Links the vendor-specific iOS device identifier to the user's PlayFab
	account

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/account-management/linkiosdeviceid).

	### Errors
	- LinkedDeviceAlreadyClaimed

]]
function Apis.LinkIOSDeviceID(request: Types.LinkIOSDeviceIDRequest, sessionTicket: string): Result<Types.LinkIOSDeviceIDResult, string>
	return makeApiCall(
		"/Client/LinkIOSDeviceID",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Signs the user into the PlayFab account, returning a session identifier that
	can subsequently be used for API calls which require an authenticated user.
	Unlike most other login API calls, LoginWithPlayFab does not permit the
	creation of new accounts via the CreateAccountFlag. Username/Password
	credentials may be used to create accounts via RegisterPlayFabUser, or added
	to existing accounts using AddUsernamePassword.

	Username and password lengths are provided for information purposes. The
	server will validate that data passed in conforms to the field definition
	and report errors appropriately. It is recommended that developers not
	perform this validation locally, so that future updates to the username or
	password do not require client updates.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/authentication/loginwithplayfab).

	### Errors
	- InvalidSignature
	- InvalidUsernameOrPassword
	- RequestViewConstraintParamsNotAllowed

]]
function Apis.LoginWithPlayFab(request: Types.LoginWithPlayFabRequest): Result<Types.LoginResult, string>
	return makeApiCall(
		"/Client/LoginWithPlayFab",
		request,
		"None"
	)
end

--[[
	Links the Kongregate identifier to the user's PlayFab account

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/account-management/linkkongregate).

	### Errors
	- FeatureNotConfiguredForTitle
	- InvalidKongregateToken
	- LinkedAccountAlreadyClaimed

]]
function Apis.LinkKongregate(request: Types.LinkKongregateAccountRequest, sessionTicket: string): Result<Types.LinkKongregateAccountResult, string>
	return makeApiCall(
		"/Client/LinkKongregate",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Updates the values of the specified title-specific statistics for the
	specific character. By default, clients are not permitted to update
	statistics. Developers may override this setting in the Game Manager >
	Settings > API Features.

	Enable this option with the 'Allow Client to Post Player Statistics' option
	in PlayFab GameManager for your title. However, this is not best practice,
	as this data will no longer be safely controlled by the server. This
	operation is additive. Character Statistics not currently defined will be
	added, while those already defined will be updated with the given values.
	All other user statistics will remain unchanged. Character statistics are
	used by the character-leaderboard apis, and accessible for custom
	game-logic.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/characters/updatecharacterstatistics).

	### Errors
	- APINotEnabledForGameClientAccess
	- CharacterNotFound
	- InvalidCharacterStatistics

]]
function Apis.UpdateCharacterStatistics(request: Types.UpdateCharacterStatisticsRequest, sessionTicket: string): Result<Types.UpdateCharacterStatisticsResult, string>
	return makeApiCall(
		"/Client/UpdateCharacterStatistics",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Adds the PlayFab user, based upon a match against a supplied unique
	identifier, to the friend list of the local user. At least one of
	FriendPlayFabId,FriendUsername,FriendEmail, or FriendTitleDisplayName should
	be initialized.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/friend-list-management/addfriend).

	### Errors
	- UsersAlreadyFriends

]]
function Apis.AddFriend(request: Types.AddFriendRequest, sessionTicket: string): Result<Types.AddFriendResult, string>
	return makeApiCall(
		"/Client/AddFriend",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Signs the user in using the vendor-specific iOS device identifier, returning
	a session identifier that can subsequently be used for API calls which
	require an authenticated user

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

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/authentication/loginwithiosdeviceid).

	### Errors
	- EncryptionKeyMissing
	- EvaluationModePlayerCountExceeded
	- InvalidSignature
	- InvalidSignatureTime
	- PlayerCreationDisabled
	- PlayerSecretAlreadyConfigured
	- PlayerSecretNotConfigured
	- RequestViewConstraintParamsNotAllowed
	- SignedRequestNotAllowed

]]
function Apis.LoginWithIOSDeviceID(request: Types.LoginWithIOSDeviceIDRequest): Result<Types.LoginResult, string>
	return makeApiCall(
		"/Client/LoginWithIOSDeviceID",
		request,
		"None"
	)
end

--[[
	Retrieves the unique PlayFab identifiers for the given set of Steam
	identifiers. The Steam identifiers are persona names.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/account-management/getplayfabidsfromsteamnames).

]]
function Apis.GetPlayFabIDsFromSteamNames(request: Types.GetPlayFabIDsFromSteamNamesRequest, sessionTicket: string): Result<Types.GetPlayFabIDsFromSteamNamesResult, string>
	return makeApiCall(
		"/Client/GetPlayFabIDsFromSteamNames",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Links the Game Center account associated with the provided Game Center ID to
	the user's PlayFab account. Logging in with a Game Center ID is insecure if
	you do not include the optional PublicKeyUrl, Salt, Signature, and Timestamp
	parameters in this request. It is recommended you require these parameters
	on all Game Center calls by going to the Apple Add-ons page in the PlayFab
	Game Manager and enabling the 'Require secure authentication only for this
	app' option.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/account-management/linkgamecenteraccount).

	### Errors
	- AccountAlreadyLinked
	- GameCenterAuthenticationFailed
	- InvalidGameCenterAuthRequest
	- LinkedAccountAlreadyClaimed

]]
function Apis.LinkGameCenterAccount(request: Types.LinkGameCenterAccountRequest, sessionTicket: string): Result<Types.LinkGameCenterAccountResult, string>
	return makeApiCall(
		"/Client/LinkGameCenterAccount",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	_NOTE: This is a Legacy Economy API, and is in bugfix-only mode. All new
	Economy features are being developed only for version 2._ Increments the
	user's balance of the specified virtual currency by the stated amount

	This API must be enabled for use as an option in the game manager website.
	It is disabled by default.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/player-item-management/adduservirtualcurrency).

	### Errors
	- APINotEnabledForGameClientAccess
	- InvalidVirtualCurrency
	- VirtualCurrencyCurrentlyUnavailable

]]
function Apis.AddUserVirtualCurrency(request: Types.AddUserVirtualCurrencyRequest, sessionTicket: string): Result<Types.ModifyUserVirtualCurrencyResult, string>
	return makeApiCall(
		"/Client/AddUserVirtualCurrency",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Unlinks the related Apple account from the user's PlayFab account.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/account-management/unlinkapple).

	### Errors
	- AccountNotLinked
	- AppleNotEnabledForTitle

]]
function Apis.UnlinkApple(request: Types.UnlinkAppleRequest, sessionTicket: string): Result<Types.EmptyResponse, string>
	return makeApiCall(
		"/Client/UnlinkApple",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Deletes title-specific custom properties for a player

	Deletes custom properties for the specified player. The list of provided
	property names must be non-empty.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/player-data-management/deleteplayercustomproperties).

	### Errors
	- PlayerCustomPropertiesVersionMismatch

]]
function Apis.DeletePlayerCustomProperties(request: Types.DeletePlayerCustomPropertiesRequest, sessionTicket: string): Result<Types.DeletePlayerCustomPropertiesResult, string>
	return makeApiCall(
		"/Client/DeletePlayerCustomProperties",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Retrieves the publisher-specific custom data for the user which is readable
	and writable by the client

	Data is stored as JSON key-value pairs. Every time the data is updated via
	any source, the version counter is incremented. If the Version parameter is
	provided, then this call will only return data if the current version on the
	system is greater than the value provided. If the Keys parameter is
	provided, the data object returned will only contain the data specific to
	the indicated Keys. Otherwise, the full set of custom user data will be
	returned.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/player-data-management/getuserpublisherdata).

	### Errors
	- PublisherNotSet

]]
function Apis.GetUserPublisherData(request: Types.GetUserDataRequest, sessionTicket: string): Result<Types.GetUserDataResult, string>
	return makeApiCall(
		"/Client/GetUserPublisherData",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	_NOTE: This is a Legacy Economy API, and is in bugfix-only mode. All new
	Economy features are being developed only for version 2._ Adds the virtual
	goods associated with the coupon to the user's inventory. Coupons can be
	generated via the Economy->Catalogs tab in the PlayFab Game Manager.

	Coupon codes can be created for any item, or set of items, in the catalog
	for the title. This operation causes the coupon to be consumed, and the
	specific items to be awarded to the user. Attempting to re-use an already
	consumed code, or a code which has not yet been created in the service, will
	result in an error.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/player-item-management/redeemcoupon).

	### Errors
	- CatalogNotConfigured
	- CharacterNotFound
	- CouponAlreadyRedeemed
	- CouponCodeNotFound

]]
function Apis.RedeemCoupon(request: Types.RedeemCouponRequest, sessionTicket: string): Result<Types.RedeemCouponResult, string>
	return makeApiCall(
		"/Client/RedeemCoupon",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	_NOTE: This is a Legacy Economy API, and is in bugfix-only mode. All new
	Economy features are being developed only for version 2._ Validates with
	Windows that the receipt for an Windows App Store in-app purchase is valid
	and that it matches the purchased catalog item

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/platform-specific-methods/validatewindowsstorereceipt).

	### Errors
	- InvalidReceipt
	- MissingAmazonSharedKey
	- NoMatchingCatalogItemForReceipt
	- ReceiptAlreadyUsed

]]
function Apis.ValidateWindowsStoreReceipt(request: Types.ValidateWindowsReceiptRequest, sessionTicket: string): Result<Types.ValidateWindowsReceiptResult, string>
	return makeApiCall(
		"/Client/ValidateWindowsStoreReceipt",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Signs the user in using a custom unique identifier generated by the title,
	returning a session identifier that can subsequently be used for API calls
	which require an authenticated user

	It is highly recommended that developers ensure that it is extremely
	unlikely that a customer could generate an ID which is already in use by
	another customer. If this is the first time a user has signed in with the
	Custom ID and CreateAccount is set to true, a new PlayFab account will be
	created and linked to the Custom ID. In this case, no email or username will
	be associated with the PlayFab account. Otherwise, if no PlayFab account is
	linked to the Custom ID, an error indicating this will be returned, so that
	the title can guide the user through creation of a PlayFab account.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/authentication/loginwithcustomid).

	### Errors
	- EncryptedRequestNotAllowed
	- EncryptionKeyMissing
	- EvaluationModePlayerCountExceeded
	- InvalidSignature
	- InvalidSignatureTime
	- PlayerCreationDisabled
	- PlayerSecretAlreadyConfigured
	- PlayerSecretNotConfigured
	- RequestViewConstraintParamsNotAllowed
	- SignedRequestNotAllowed

]]
function Apis.LoginWithCustomID(request: Types.LoginWithCustomIDRequest): Result<Types.LoginResult, string>
	return makeApiCall(
		"/Client/LoginWithCustomID",
		request,
		"None"
	)
end

--[[
	Report player's ad activity

	Report ad activity

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/advertising/reportadactivity).

	### Errors
	- InvalidAdPlacementAndReward

]]
function Apis.ReportAdActivity(request: Types.ReportAdActivityRequest, sessionTicket: string): Result<Types.ReportAdActivityResult, string>
	return makeApiCall(
		"/Client/ReportAdActivity",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Checks for any new consumable entitlements. If any are found, they are
	consumed and added as PlayFab items

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/platform-specific-methods/consumepsnentitlements).

	### Errors
	- ExpiredAuthToken
	- FailedToGetEntitlements
	- PSNInaccessible

]]
function Apis.ConsumePSNEntitlements(request: Types.ConsumePSNEntitlementsRequest, sessionTicket: string): Result<Types.ConsumePSNEntitlementsResult, string>
	return makeApiCall(
		"/Client/ConsumePSNEntitlements",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Links the NintendoSwitchDeviceId to the user's PlayFab account

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/account-management/linknintendoswitchdeviceid).

	### Errors
	- LinkedIdentifierAlreadyClaimed

]]
function Apis.LinkNintendoSwitchDeviceId(request: Types.LinkNintendoSwitchDeviceIdRequest, sessionTicket: string): Result<Types.LinkNintendoSwitchDeviceIdResult, string>
	return makeApiCall(
		"/Client/LinkNintendoSwitchDeviceId",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Reward player's ad activity

	Details on which placement and reward to perform a grant on

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/advertising/rewardadactivity).

	### Errors
	- ActionGroupNotFound
	- AllAdPlacementViewsAlreadyConsumed
	- InvalidAdPlacementAndReward

]]
function Apis.RewardAdActivity(request: Types.RewardAdActivityRequest, sessionTicket: string): Result<Types.RewardAdActivityResult, string>
	return makeApiCall(
		"/Client/RewardAdActivity",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Retrieves title-specific custom property values for a player.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/player-data-management/listplayercustomproperties).

]]
function Apis.ListPlayerCustomProperties(request: Types.ListPlayerCustomPropertiesRequest, sessionTicket: string): Result<Types.ListPlayerCustomPropertiesResult, string>
	return makeApiCall(
		"/Client/ListPlayerCustomProperties",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Retrieves the information on the available versions of the specified
	statistic.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/player-data-management/getplayerstatisticversions).

	### Errors
	- StatisticNotFound

]]
function Apis.GetPlayerStatisticVersions(request: Types.GetPlayerStatisticVersionsRequest, sessionTicket: string): Result<Types.GetPlayerStatisticVersionsResult, string>
	return makeApiCall(
		"/Client/GetPlayerStatisticVersions",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Unlinks the related Xbox Live account from the user's PlayFab account

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/account-management/unlinkxboxaccount).

	### Errors
	- AccountNotLinked
	- InvalidXboxLiveToken

]]
function Apis.UnlinkXboxAccount(request: Types.UnlinkXboxAccountRequest, sessionTicket: string): Result<Types.UnlinkXboxAccountResult, string>
	return makeApiCall(
		"/Client/UnlinkXboxAccount",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Signs in the user with a Nintendo service account token.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/authentication/loginwithnintendoserviceaccount).

	### Errors
	- EncryptionKeyMissing
	- EvaluationModePlayerCountExceeded
	- InvalidSignature
	- InvalidSignatureTime
	- NintendoSwitchNotEnabledForTitle
	- PlayerSecretAlreadyConfigured
	- PlayerSecretNotConfigured
	- RequestViewConstraintParamsNotAllowed

]]
function Apis.LoginWithNintendoServiceAccount(request: Types.LoginWithNintendoServiceAccountRequest): Result<Types.LoginResult, string>
	return makeApiCall(
		"/Client/LoginWithNintendoServiceAccount",
		request,
		"None"
	)
end

--[[
	Adds playfab username/password auth to an existing account created via an
	anonymous auth method, e.g. automatic device ID login.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/account-management/addusernamepassword).

	### Errors
	- AccountAlreadyLinked
	- EmailAddressNotAvailable
	- InvalidEmailAddress
	- InvalidPassword
	- InvalidUsername
	- UsernameNotAvailable

]]
function Apis.AddUsernamePassword(request: Types.AddUsernamePasswordRequest, sessionTicket: string): Result<Types.AddUsernamePasswordResult, string>
	return makeApiCall(
		"/Client/AddUsernamePassword",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Retrieves the unique PlayFab identifiers for the given set of Facebook
	Instant Game identifiers.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/account-management/getplayfabidsfromfacebookinstantgamesids).

]]
function Apis.GetPlayFabIDsFromFacebookInstantGamesIds(request: Types.GetPlayFabIDsFromFacebookInstantGamesIdsRequest, sessionTicket: string): Result<Types.GetPlayFabIDsFromFacebookInstantGamesIdsResult, string>
	return makeApiCall(
		"/Client/GetPlayFabIDsFromFacebookInstantGamesIds",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Removes a specified user from the friend list of the local user

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/friend-list-management/removefriend).

]]
function Apis.RemoveFriend(request: Types.RemoveFriendRequest, sessionTicket: string): Result<Types.RemoveFriendResult, string>
	return makeApiCall(
		"/Client/RemoveFriend",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Removes users from the set of those able to update the shared data and the
	set of users in the group. Only users in the group can remove members. If as
	a result of the call, zero users remain with access, the group and its
	associated data will be deleted. Shared Groups are designed for sharing data
	between a very small number of players, please see our guide:
	https://docs.microsoft.com/gaming/playfab/features/social/groups/using-shared-group-data

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/shared-group-data/removesharedgroupmembers).

]]
function Apis.RemoveSharedGroupMembers(request: Types.RemoveSharedGroupMembersRequest, sessionTicket: string): Result<Types.RemoveSharedGroupMembersResult, string>
	return makeApiCall(
		"/Client/RemoveSharedGroupMembers",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Signs the user in using a Kongregate player account.

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

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/authentication/loginwithkongregate).

	### Errors
	- EncryptionKeyMissing
	- EvaluationModePlayerCountExceeded
	- FeatureNotConfiguredForTitle
	- InvalidKongregateToken
	- PlayerSecretAlreadyConfigured
	- PlayerSecretNotConfigured
	- RequestViewConstraintParamsNotAllowed

]]
function Apis.LoginWithKongregate(request: Types.LoginWithKongregateRequest): Result<Types.LoginResult, string>
	return makeApiCall(
		"/Client/LoginWithKongregate",
		request,
		"None"
	)
end

--[[
	Submit a report for another player (due to bad bahavior, etc.), so that
	customer service representatives for the title can take action concerning
	potentially toxic players.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/account-management/reportplayer).

]]
function Apis.ReportPlayer(request: Types.ReportPlayerClientRequest, sessionTicket: string): Result<Types.ReportPlayerClientResult, string>
	return makeApiCall(
		"/Client/ReportPlayer",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Links the Battle.net account associated with the token to the user's PlayFab
	account.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/account-management/linkbattlenetaccount).

	### Errors
	- BattleNetNotEnabledForTitle
	- InvalidIdentityProviderId
	- LinkedIdentifierAlreadyClaimed
	- TokenSigningKeyNotFound

]]
function Apis.LinkBattleNetAccount(request: Types.LinkBattleNetAccountRequest, sessionTicket: string): Result<Types.EmptyResponse, string>
	return makeApiCall(
		"/Client/LinkBattleNetAccount",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Accepts an open trade (one that has not yet been accepted or cancelled), if
	the locally signed-in player is in the allowed player list for the trade, or
	it is open to all players. If the call is successful, the offered and
	accepted items will be swapped between the two players' inventories.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/trading/accepttrade).

	### Errors
	- TradeAcceptedCatalogItemInvalid
	- TradeAcceptedItemsMismatch
	- TradeAcceptingUserNotAllowed
	- TradeAllowedUsersInvalid
	- TradeAlreadyFilled
	- TradeCancelled
	- TradeDoesNotExist
	- TradeInventoryItemDoesNotExist
	- TradeInventoryItemExpired
	- TradeInventoryItemInvalidStatus
	- TradeInventoryItemIsAssignedToCharacter
	- TradeInventoryItemIsBundle
	- TradeInventoryItemIsConsumed
	- TradeInventoryItemIsNotTradable
	- TradeInventoryItemIsStackable
	- TradeStatusNotValidForAccepting
	- TradeWaitForStatusTimeout

]]
function Apis.AcceptTrade(request: Types.AcceptTradeRequest, sessionTicket: string): Result<Types.AcceptTradeResponse, string>
	return makeApiCall(
		"/Client/AcceptTrade",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Links the PlayStation :tm: Network account associated with the provided
	access code to the user's PlayFab account

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/account-management/linkpsnaccount).

	### Errors
	- AccountAlreadyLinked
	- InvalidPSNAuthCode
	- InvalidPSNAuthCode
	- InvalidPSNIssuerId
	- LinkedAccountAlreadyClaimed
	- PSNInaccessible

]]
function Apis.LinkPSNAccount(request: Types.LinkPSNAccountRequest, sessionTicket: string): Result<Types.LinkPSNAccountResult, string>
	return makeApiCall(
		"/Client/LinkPSNAccount",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Retrieves the player's profile

	This API allows for access to details regarding a user in the PlayFab
	service, usually for purposes of customer support. Note that data returned
	may be Personally Identifying Information (PII), such as email address, and
	so care should be taken in how this data is stored and managed. Since this
	call will always return the relevant information for users who have accessed
	the title, the recommendation is to not store this data locally.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/account-management/getplayerprofile).

	### Errors
	- PlayerNotInGame
	- RequestViewConstraintParamsNotAllowed

]]
function Apis.GetPlayerProfile(request: Types.GetPlayerProfileRequest, sessionTicket: string): Result<Types.GetPlayerProfileResult, string>
	return makeApiCall(
		"/Client/GetPlayerProfile",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Unlinks the related Android device identifier from the user's PlayFab
	account

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/account-management/unlinkandroiddeviceid).

	### Errors
	- AccountNotLinked
	- DeviceNotLinked

]]
function Apis.UnlinkAndroidDeviceID(request: Types.UnlinkAndroidDeviceIDRequest, sessionTicket: string): Result<Types.UnlinkAndroidDeviceIDResult, string>
	return makeApiCall(
		"/Client/UnlinkAndroidDeviceID",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Links the Xbox Live account associated with the provided access code to the
	user's PlayFab account

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/account-management/linkxboxaccount).

	### Errors
	- AccountAlreadyLinked
	- ExpiredXboxLiveToken
	- InvalidXboxLiveToken
	- LinkedAccountAlreadyClaimed

]]
function Apis.LinkXboxAccount(request: Types.LinkXboxAccountRequest, sessionTicket: string): Result<Types.LinkXboxAccountResult, string>
	return makeApiCall(
		"/Client/LinkXboxAccount",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Signs the user into the PlayFab account, returning a session identifier that
	can subsequently be used for API calls which require an authenticated user.
	Unlike most other login API calls, LoginWithEmailAddress does not permit the
	creation of new accounts via the CreateAccountFlag. Email addresses may be
	used to create accounts via RegisterPlayFabUser.

	Email address and password lengths are provided for information purposes.
	The server will validate that data passed in conforms to the field
	definition and report errors appropriately. It is recommended that
	developers not perform this validation locally, so that future updates do
	not require client updates.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/authentication/loginwithemailaddress).

	### Errors
	- InvalidEmailOrPassword
	- RequestViewConstraintParamsNotAllowed

]]
function Apis.LoginWithEmailAddress(request: Types.LoginWithEmailAddressRequest): Result<Types.LoginResult, string>
	return makeApiCall(
		"/Client/LoginWithEmailAddress",
		request,
		"None"
	)
end

--[[
	_NOTE: This is a Legacy Economy API, and is in bugfix-only mode. All new
	Economy features are being developed only for version 2._ Searches target
	inventory for an ItemInstance matching the given CatalogItemId, if necessary
	unlocks it using an appropriate key, and returns the contents of the opened
	container. If the container (and key when relevant) are consumable
	(RemainingUses > 0), their RemainingUses will be decremented, consistent
	with the operation of ConsumeItem.

	Specify the type of container to open and optionally the catalogVersion for
	the container to open

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/player-item-management/unlockcontaineritem).

	### Errors
	- CharacterNotFound
	- ContainerKeyInvalid
	- ContainerNotOwned
	- InvalidContainerItem
	- InvalidItemIdInTable
	- InvalidItemProperties
	- KeyNotOwned

]]
function Apis.UnlockContainerItem(request: Types.UnlockContainerItemRequest, sessionTicket: string): Result<Types.UnlockContainerItemResult, string>
	return makeApiCall(
		"/Client/UnlockContainerItem",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Unlinks the related Google Play Games account from the user's PlayFab
	account.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/account-management/unlinkgoogleplaygamesservicesaccount).

	### Errors
	- AccountNotLinked

]]
function Apis.UnlinkGooglePlayGamesServicesAccount(request: Types.UnlinkGooglePlayGamesServicesAccountRequest, sessionTicket: string): Result<Types.UnlinkGooglePlayGamesServicesAccountResult, string>
	return makeApiCall(
		"/Client/UnlinkGooglePlayGamesServicesAccount",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	_NOTE: This is a Legacy Economy API, and is in bugfix-only mode. All new
	Economy features are being developed only for version 2._ Retrieves the
	specified character's current inventory of virtual goods

	All items currently in the character inventory will be returned,
	irrespective of how they were acquired (via purchasing, grants, coupons,
	etc.). Items that are expired, fully consumed, or are no longer valid are
	not considered to be in the user's current inventory, and so will not be not
	included. Also returns their virtual currency balances.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/player-item-management/getcharacterinventory).

	### Errors
	- CharacterNotFound

]]
function Apis.GetCharacterInventory(request: Types.GetCharacterInventoryRequest, sessionTicket: string): Result<Types.GetCharacterInventoryResult, string>
	return makeApiCall(
		"/Client/GetCharacterInventory",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Retrieves a list of ranked friends of the current player for the given
	statistic, starting from the indicated point in the leaderboard

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/player-data-management/getfriendleaderboard).

	### Errors
	- ExpiredXboxLiveToken
	- FacebookAPIError
	- InvalidXboxLiveToken
	- LeaderboardVersionNotAvailable
	- XboxInaccessible
	- XboxServiceTooManyRequests
	- XboxXASSExchangeFailure

]]
function Apis.GetFriendLeaderboard(request: Types.GetFriendLeaderboardRequest, sessionTicket: string): Result<Types.GetLeaderboardResult, string>
	return makeApiCall(
		"/Client/GetFriendLeaderboard",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Retrieves the unique PlayFab identifiers for the given set of Twitch
	identifiers. The Twitch identifiers are the IDs for the user accounts,
	available as "_id" from the Twitch API methods (ex:
	https://github.com/justintv/Twitch-API/blob/master/v3_resources/users.md#get-usersuser).

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/account-management/getplayfabidsfromtwitchids).

]]
function Apis.GetPlayFabIDsFromTwitchIDs(request: Types.GetPlayFabIDsFromTwitchIDsRequest, sessionTicket: string): Result<Types.GetPlayFabIDsFromTwitchIDsResult, string>
	return makeApiCall(
		"/Client/GetPlayFabIDsFromTwitchIDs",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Links the currently signed-in user account to their Google Play Games
	account, using their Google Play Games account credentials

	Google Play Games sign-in is accomplished by obtaining a Google OAuth 2.0
	credential using the Google Play Games sign-in for Android APIs on the
	device and passing it to this API.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/account-management/linkgoogleplaygamesservicesaccount).

	### Errors
	- AccountAlreadyLinked
	- GoogleOAuthError
	- GoogleOAuthNotConfiguredForTitle
	- InvalidGooglePlayGamesServerAuthCode
	- InvalidGoogleToken
	- LinkedAccountAlreadyClaimed

]]
function Apis.LinkGooglePlayGamesServicesAccount(request: Types.LinkGooglePlayGamesServicesAccountRequest, sessionTicket: string): Result<Types.LinkGooglePlayGamesServicesAccountResult, string>
	return makeApiCall(
		"/Client/LinkGooglePlayGamesServicesAccount",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Grants the specified character type to the user. CharacterIds are not
	globally unique; characterId must be evaluated with the parent PlayFabId to
	guarantee uniqueness.

	Grants a character to the user of the type specified by the item ID. The
	user must already have an instance of this item in their inventory in order
	to allow character creation. This item can come from a purchase or grant,
	which must be done before calling to create the character.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/characters/grantcharactertouser).

	### Errors
	- InvalidItemProperties
	- ItemNotOwned

]]
function Apis.GrantCharacterToUser(request: Types.GrantCharacterToUserRequest, sessionTicket: string): Result<Types.GrantCharacterToUserResult, string>
	return makeApiCall(
		"/Client/GrantCharacterToUser",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Signs the user in using a Facebook access token, returning a session
	identifier that can subsequently be used for API calls which require an
	authenticated user

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

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/authentication/loginwithfacebook).

	### Errors
	- EncryptionKeyMissing
	- EvaluationModePlayerCountExceeded
	- FacebookAPIError
	- InvalidFacebookToken
	- PlayerSecretAlreadyConfigured
	- PlayerSecretNotConfigured
	- RequestViewConstraintParamsNotAllowed

]]
function Apis.LoginWithFacebook(request: Types.LoginWithFacebookRequest): Result<Types.LoginResult, string>
	return makeApiCall(
		"/Client/LoginWithFacebook",
		request,
		"None"
	)
end

--[[
	Retrieves the unique PlayFab identifiers for the given set of Google Play
	Games identifiers. The Google Play Games identifiers are the IDs for the
	user accounts, available as "playerId" in the Google Play Games Services -
	Players API calls.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/account-management/getplayfabidsfromgoogleplaygamesplayerids).

]]
function Apis.GetPlayFabIDsFromGooglePlayGamesPlayerIDs(request: Types.GetPlayFabIDsFromGooglePlayGamesPlayerIDsRequest, sessionTicket: string): Result<Types.GetPlayFabIDsFromGooglePlayGamesPlayerIDsResult, string>
	return makeApiCall(
		"/Client/GetPlayFabIDsFromGooglePlayGamesPlayerIDs",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Lists all of the characters that belong to a specific user. CharacterIds are
	not globally unique; characterId must be evaluated with the parent PlayFabId
	to guarantee uniqueness.

	Returns a list of every character that currently belongs to a user.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/characters/getalluserscharacters).

]]
function Apis.GetAllUsersCharacters(request: Types.ListUsersCharactersRequest, sessionTicket: string): Result<Types.ListUsersCharactersResult, string>
	return makeApiCall(
		"/Client/GetAllUsersCharacters",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Unlinks the related NintendoSwitchDeviceId from the user's PlayFab account

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/account-management/unlinknintendoswitchdeviceid).

	### Errors
	- AccountNotLinked
	- NintendoSwitchDeviceIdNotLinked

]]
function Apis.UnlinkNintendoSwitchDeviceId(request: Types.UnlinkNintendoSwitchDeviceIdRequest, sessionTicket: string): Result<Types.UnlinkNintendoSwitchDeviceIdResult, string>
	return makeApiCall(
		"/Client/UnlinkNintendoSwitchDeviceId",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	_NOTE: This is a Legacy Economy API, and is in bugfix-only mode. All new
	Economy features are being developed only for version 2._ Validates with the
	Apple store that the receipt for an iOS in-app purchase is valid and that it
	matches the purchased catalog item

	The CurrencyCode and PurchasePrice must match the price which was set up for
	the item in the Apple store. In addition, The ItemId of the inventory in the
	PlayFab Catalog must match the Product ID as it was set up in the Apple
	store. This enables the PlayFab service to securely validate that the
	purchase is for the correct item, in order to prevent uses from passing
	valid receipts as being for more expensive items (passing a receipt for a
	99-cent purchase as being for a $19.99 purchase, for example).

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/platform-specific-methods/validateiosreceipt).

	### Errors
	- InvalidBundleID
	- InvalidCurrencyCode
	- InvalidEnvironmentForReceipt
	- InvalidProductForSubscription
	- InvalidReceipt
	- InvalidVirtualCurrency
	- NoMatchingCatalogItemForReceipt
	- ReceiptAlreadyUsed
	- ReceiptContainsMultipleInAppItems
	- ReceiptDoesNotContainInAppItems
	- SubscriptionAlreadyTaken

]]
function Apis.ValidateIOSReceipt(request: Types.ValidateIOSReceiptRequest, sessionTicket: string): Result<Types.ValidateIOSReceiptResult, string>
	return makeApiCall(
		"/Client/ValidateIOSReceipt",
		request,
		"X-Authorization",
		sessionTicket
	)
end

--[[
	Writes a character-based event into PlayStream.

	This API is designed to write a multitude of different client-defined events
	into PlayStream. It supports a flexible JSON schema, which allowsfor
	arbitrary key-value pairs to describe any character-based event. The created
	event will be locked to the authenticated title and player.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/client/analytics/writecharacterevent).

	### Errors
	- CharacterNotFound
	- InvalidEventField
	- NoWritePermissionsForEvent

]]
function Apis.WriteCharacterEvent(request: Types.WriteClientCharacterEventRequest, sessionTicket: string): Result<Types.WriteEventResponse, string>
	return makeApiCall(
		"/Client/WriteCharacterEvent",
		request,
		"X-Authorization",
		sessionTicket
	)
end

return Apis
