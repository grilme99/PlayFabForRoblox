--!strict
--[=[
	# MatchmakerApi

	Enables the use of an external match-making service in conjunction with PlayFab 
	hosted Game Server instances. 

	API Version: 1.220926.4
]=]

local PlayFabInternal = require(script.Parent.PlayFabInternal)

local MatchmakerApi = {}

function MatchmakerApi.SetSettings(settings: PlayFabInternal.ISettings)
	PlayFabInternal.SetSettings(settings)
end

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

--- This API allows the external match-making service to confirm that the user has 
--- a valid Session Ticket for the title, in order to securely enable match-making. 
--- The client passes the user's Session Ticket to the external match-making service, 
--- which then passes the Session Ticket in as the AuthorizationTicket in this call. 
export type AuthUserRequest = {
	--- Session Ticket provided by the client. 
	AuthorizationTicket: string,
}

export type AuthUserResponse = {
	--- Boolean indicating if the user has been authorized to use the external match-making 
	--- service. 
	Authorized: boolean,
	--- PlayFab unique identifier of the account that has been authorized. 
	PlayFabId: string?,
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

export type PlayerJoinedRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- Unique identifier of the Game Server Instance the user is joining. This must 
	--- be a Game Server Instance started with the Matchmaker/StartGame API. 
	LobbyId: string,
	--- PlayFab unique identifier for the player joining. 
	PlayFabId: string,
}

export type PlayerJoinedResponse = {
}

export type PlayerLeftRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- Unique identifier of the Game Server Instance the user is leaving. This must 
	--- be a Game Server Instance started with the Matchmaker/StartGame API. 
	LobbyId: string,
	--- PlayFab unique identifier for the player leaving. 
	PlayFabId: string,
}

export type PlayerLeftResponse = {
}

export type UserInfoRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- Minimum catalog version for which data is requested (filters the results to 
	--- only contain inventory items which have a catalog version of this or higher). 
	MinCatalogVersion: number,
	--- PlayFab unique identifier of the user whose information is being requested. 
	PlayFabId: string,
}

export type UserInfoResponse = {
	--- Array of inventory items in the user's current inventory. 
	Inventory: {ItemInstance}?,
	--- Boolean indicating whether the user is a developer. 
	IsDeveloper: boolean,
	--- PlayFab unique identifier of the user whose information was requested. 
	PlayFabId: string?,
	--- Steam unique identifier, if the user has an associated Steam account. 
	SteamId: string?,
	--- Title specific display name, if set. 
	TitleDisplayName: string?,
	--- PlayFab unique user name. 
	Username: string?,
	--- Array of virtual currency balance(s) belonging to the user. 
	VirtualCurrency: {[any]: any}?,
	--- Array of remaining times and timestamps for virtual currencies. 
	VirtualCurrencyRechargeTimes: VirtualCurrencyRechargeTime?,
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


--- This API allows the external match-making service to confirm that the user has 
--- a valid Session Ticket for the title, in order to securely enable match-making. 
--- The client passes the user's Session Ticket to the external match-making service, 
--- which then passes the Session Ticket in as the AuthorizationTicket in this call. 
---
--- https://docs.microsoft.com/rest/api/playfab/matchmaker/matchmaking/authuser
function MatchmakerApi.AuthUserAsync(
	secretKey: string, 
	request: AuthUserRequest
): AuthUserResponse
	return PlayFabInternal.MakeApiCall(
		"/Matchmaker/AuthUser",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/matchmaker/matchmaking/playerjoined
function MatchmakerApi.PlayerJoinedAsync(
	secretKey: string, 
	request: PlayerJoinedRequest
): PlayerJoinedResponse
	return PlayFabInternal.MakeApiCall(
		"/Matchmaker/PlayerJoined",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/matchmaker/matchmaking/playerleft
function MatchmakerApi.PlayerLeftAsync(
	secretKey: string, 
	request: PlayerLeftRequest
): PlayerLeftResponse
	return PlayFabInternal.MakeApiCall(
		"/Matchmaker/PlayerLeft",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/matchmaker/matchmaking/userinfo
function MatchmakerApi.UserInfoAsync(
	secretKey: string, 
	request: UserInfoRequest
): UserInfoResponse
	return PlayFabInternal.MakeApiCall(
		"/Matchmaker/UserInfo",
		request,
		"X-SecretKey",
		secretKey
	)
end

return MatchmakerApi

