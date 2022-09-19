--!strict
--[=[
	# MatchmakerApi

	Enables the use of an external match-making service in conjunction with PlayFab 
	hosted Game Server instances. 
]=]

local PlayFabInternal = require(script.Parent.PlayFabInternal)

local MatchmakerApi = {}

--- The basic wrapper around every failed API response 
export type ApiErrorWrapper = {
	code: number, --- Numerical HTTP code
	error: string?, --- Playfab error code
	errorCode: number, --- Numerical PlayFab error code
	errorDetails: {[any]: any}?, --- Detailed description of individual issues with the request object
	errorMessage: string?, --- Description for the PlayFab errorCode
	status: string?, --- String HTTP code
}

--- This API allows the external match-making service to confirm that the user has 
--- a valid Session Ticket for the title, in order to securely enable match-making. 
--- The client passes the user's Session Ticket to the external match-making service, 
--- which then passes the Session Ticket in as the AuthorizationTicket in this call. 
export type AuthUserRequest = {
	AuthorizationTicket: string, --- Session Ticket provided by the client.
}

export type AuthUserResponse = {
	Authorized: boolean, --- Boolean indicating if the user has been authorized to use the external match-making service.
	PlayFabId: string?, --- PlayFab unique identifier of the account that has been authorized.
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

export type PlayerJoinedRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	LobbyId: string, --- Unique identifier of the Game Server Instance the user is joining. This must be a Game Server Instance started with the Matchmaker/StartGame API.
	PlayFabId: string, --- PlayFab unique identifier for the player joining.
}

export type PlayerJoinedResponse = {
}

export type PlayerLeftRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	LobbyId: string, --- Unique identifier of the Game Server Instance the user is leaving. This must be a Game Server Instance started with the Matchmaker/StartGame API.
	PlayFabId: string, --- PlayFab unique identifier for the player leaving.
}

export type PlayerLeftResponse = {
}

export type UserInfoRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	MinCatalogVersion: number, --- Minimum catalog version for which data is requested (filters the results to only contain inventory items which have a catalog version of this or higher).
	PlayFabId: string, --- PlayFab unique identifier of the user whose information is being requested.
}

export type UserInfoResponse = {
	Inventory: {ItemInstance}?, --- Array of inventory items in the user's current inventory.
	IsDeveloper: boolean, --- Boolean indicating whether the user is a developer.
	PlayFabId: string?, --- PlayFab unique identifier of the user whose information was requested.
	SteamId: string?, --- Steam unique identifier, if the user has an associated Steam account.
	TitleDisplayName: string?, --- Title specific display name, if set.
	Username: string?, --- PlayFab unique user name.
	VirtualCurrency: {[any]: any}?, --- Array of virtual currency balance(s) belonging to the user.
	VirtualCurrencyRechargeTimes: VirtualCurrencyRechargeTime?, --- Array of remaining times and timestamps for virtual currencies.
}

export type VirtualCurrencyRechargeTime = {
	RechargeMax: number, --- Maximum value to which the regenerating currency will automatically increment. Note that it can exceed this value through use of the AddUserVirtualCurrency API call. However, it will not regenerate automatically until it has fallen below this value.
	RechargeTime: string, --- Server timestamp in UTC indicating the next time the virtual currency will be incremented.
	SecondsToRecharge: number, --- Time remaining (in seconds) before the next recharge increment of the virtual currency.
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
): AuthUserResponse | ApiErrorWrapper
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
): PlayerJoinedResponse | ApiErrorWrapper
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
): PlayerLeftResponse | ApiErrorWrapper
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
): UserInfoResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Matchmaker/UserInfo",
		request,
		"X-SecretKey",
		secretKey
	)
end

return MatchmakerApi

