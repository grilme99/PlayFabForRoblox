--[[
	This file was generated on 2025-08-03 at 00:04 UTC. Do not edit directly.

]]

export type CatalogConfig = {
	--[[
		A list of deep link formats. Up to 10 can be added.

	]]
	DeepLinkFormats: { DeepLinkFormat }?,
	Catalog: CatalogSpecificConfig?,
	--[[
		A set of player entity keys that are allowed to review content. There is a
		maximum of 128 entities that can be added.

	]]
	ReviewerEntities: { EntityKey }?,
	--[[
		A list of display properties to index. Up to 5 mappings can be added per
		Display Property Type. More info on display properties can be found here:
		https://learn.microsoft.com/en-us/gaming/playfab/features/economy-v2/catalog/content-types-tags-and-properties#displayproperties

	]]
	DisplayPropertyIndexInfos: { DisplayPropertyIndexInfo }?,
	Image: ImageConfig?,
	--[[
		A list of player entity keys that will have admin permissions. There is a
		maximum of 64 entities that can be added.

	]]
	AdminEntities: { EntityKey }?,
	--[[
		A list of Platforms that can be applied to catalog items. Each platform can
		have a maximum character length of 40 and up to 128 platforms can be listed.

	]]
	Platforms: { string }?,
	Review: ReviewConfig?,
	File: FileConfig?,
	--[[
		Flag defining whether catalog is enabled.

	]]
	IsCatalogEnabled: boolean,
	UserGeneratedContent: UserGeneratedContentSpecificConfig?,
}

export type CatalogAlternateId = {
	--[[
		Value of the alternate ID.

	]]
	Value: string?,
	--[[
		Type of the alternate ID.

	]]
	Type: string?,
}

--[[
	Get item result.

]]
export type GetItemResponse = {
	Item: CatalogItem?,
}

export type CatalogPriceOverride = {
	--[[
		The currency amounts utilized in the override for a singular price.

	]]
	Amounts: { CatalogPriceAmountOverride }?,
}

export type GetItemsRequest = {
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey?,
	--[[
		List of item alternate IDs.

	]]
	AlternateIds: { CatalogAlternateId }?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		List of Item Ids.

	]]
	Ids: { string }?,
}

export type RedeemAppleAppStoreInventoryItemsResponse = {
	--[[
		The Transaction IDs associated with the inventory modifications

	]]
	TransactionIds: { string }?,
	--[[
		The list of failed redemptions from the external marketplace.

	]]
	Failed: { RedemptionFailure }?,
	--[[
		The list of successful redemptions from the external marketplace.

	]]
	Succeeded: { RedemptionSuccess }?,
}

export type RedeemSteamInventoryItemsResponse = {
	--[[
		The Transaction IDs associated with the inventory modifications

	]]
	TransactionIds: { string }?,
	--[[
		The list of failed redemptions from the external marketplace.

	]]
	Failed: { RedemptionFailure }?,
	--[[
		The list of successful redemptions from the external marketplace.

	]]
	Succeeded: { RedemptionSuccess }?,
}

export type DeepLink = {
	--[[
		Target platform for this deep link.

	]]
	Platform: string?,
	--[[
		The deep link for this platform.

	]]
	Url: string?,
}

export type FilterOptions = {
	--[[
		The OData filter utilized. Mutually exclusive with 'IncludeAllItems'. More
		info about Filter Complexity limits can be found here:
		https://learn.microsoft.com/en-us/gaming/playfab/features/economy-v2/catalog/search#limits

	]]
	Filter: string?,
	--[[
		The flag that overrides the filter and allows for returning all catalog items.
		Mutually exclusive with 'Filter'.

	]]
	IncludeAllItems: boolean?,
}

export type UserGeneratedContentSpecificConfig = {
	--[[
		The set of content types that will be used for validation.

	]]
	ContentTypes: { string }?,
	--[[
		The set of tags that will be used for validation.

	]]
	Tags: { string }?,
}

export type ReportItemRequest = {
	AlternateId: CatalogAlternateId?,
	ConcernCategory: ConcernCategory?,
	--[[
		The unique ID of the item.

	]]
	Id: string?,
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
		The string reason for this report.

	]]
	Reason: string?,
}

export type TransactionClawbackDetails = {
	--[[
		The id of the clawed back operation.

	]]
	TransactionIdClawedback: string?,
}

export type CatalogPrice = {
	--[[
		The per-unit amount this price can be used to purchase.

	]]
	UnitAmount: number?,
	--[[
		The amounts of the catalog item price. Each price can have up to 15 item
		amounts.

	]]
	Amounts: { CatalogPriceAmount }?,
	--[[
		The per-unit duration this price can be used to purchase. The maximum duration
		is 100 years.

	]]
	UnitDurationInSeconds: number?,
}

export type CreateUploadUrlsResponse = {
	--[[
		List of URLs metadata for the files to be uploaded by the client.

	]]
	UploadUrls: { UploadUrlMetadata }?,
}

export type AddInventoryItemsOperation = {
	NewStackValues: InitialValues?,
	--[[
		The duration to add to the current item expiration date.

	]]
	DurationInSeconds: number?,
	Item: InventoryItemReference?,
	--[[
		The amount to add to the current item amount.

	]]
	Amount: number?,
}

export type GetEntityItemReviewResponse = {
	Review: Review?,
}

export type SubtractInventoryItemsResponse = {
	--[[
		ETags are used for concurrency checking when updating resources. More
		information about using ETags can be found here:
		https://learn.microsoft.com/en-us/gaming/playfab/features/economy-v2/catalog/etags

	]]
	ETag: string?,
	--[[
		The ids of transactions that occurred as a result of the request.

	]]
	TransactionIds: { string }?,
	--[[
		The idempotency id used in the request.

	]]
	IdempotencyId: string?,
}

export type TransferInventoryItemsOperation = {
	GivingItem: InventoryItemReference?,
	--[[
		The amount to transfer.

	]]
	Amount: number?,
	NewStackValues: InitialValues?,
	--[[
		Indicates whether stacks reduced to an amount of 0 during the operation should
		be deleted from the inventory. (Default = false)

	]]
	DeleteEmptyStacks: boolean,
	ReceivingItem: InventoryItemReference?,
}

export type ReviewItemResponse = {
	-- No properties defined in spec
	[string]: any
}

--[[
	The item will not be published to the public catalog until the PublishItem
	API is called for the item.

]]
export type CreateDraftItemRequest = {
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	Item: CatalogItem?,
	--[[
		Whether the item should be published immediately. This value is optional,
		defaults to false.

	]]
	Publish: boolean,
}

export type SetItemModerationStateResponse = {
	-- No properties defined in spec
	[string]: any
}

export type GetCatalogConfigRequest = {
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

--[[
	Redeem items from the Microsoft Store.

]]
export type RedeemMicrosoftStoreInventoryItemsRequest = {
	--[[
		The OneStore Collections Id Key used for AAD authentication.

	]]
	CollectionsIdKey: string?,
	--[[
		Xbox Token used for delegated business partner authentication. Token provided
		by the Xbox Live SDK method GetTokenAndSignatureAsync("POST",
		"https://playfabapi.com/", "").

	]]
	XboxToken: string?,
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey?,
	--[[
		The id of the entity's collection to perform this action on.
		(Default="default")

	]]
	CollectionId: string?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type UpdateInventoryItemsOperation = {
	Item: InventoryItem?,
}

export type TransferInventoryItemsResponse = {
	--[[
		The transfer operation status. Possible values are 'InProgress' or
		'Completed'. If the operation has completed, the response code will be 200.
		Otherwise, it will be 202.

	]]
	OperationStatus: string?,
	--[[
		The token that can be used to get the status of the transfer operation. This
		will only have a value if OperationStatus is 'InProgress'.

	]]
	OperationToken: string?,
	--[[
		The ids of transactions that occurred as a result of the request's giving
		action.

	]]
	GivingTransactionIds: { string }?,
	--[[
		The idempotency id for the request.

	]]
	IdempotencyId: string?,
	--[[
		The ids of transactions that occurred as a result of the request's receiving
		action.

	]]
	ReceivingTransactionIds: { string }?,
	--[[
		ETags are used for concurrency checking when updating resources (after
		transferring from). More information about using ETags can be found here:
		https://learn.microsoft.com/en-us/gaming/playfab/features/economy-v2/catalog/etags

	]]
	GivingETag: string?,
}

--[[
	Redeem items from the Apple App Store.

]]
export type RedeemAppleAppStoreInventoryItemsRequest = {
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey?,
	--[[
		The id of the entity's collection to perform this action on.
		(Default="default")

	]]
	CollectionId: string?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		The receipt provided by the Apple marketplace upon successful purchase.

	]]
	Receipt: string?,
}

export type UploadInfo = {
	--[[
		Name of the file to be uploaded.

	]]
	FileName: string?,
}

export type SubmitItemReviewVoteRequest = {
	Vote: HelpfulnessVote?,
	--[[
		The ID of the review to submit a helpfulness vote for.

	]]
	ReviewId: string?,
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	AlternateId: CatalogAlternateId?,
	--[[
		The string ID of the item associated with the review.

	]]
	ItemId: string?,
}

export type UpdateCatalogConfigRequest = {
	Config: CatalogConfig?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

--[[
	Get the status of an Inventory Operation using an OperationToken.

]]
export type GetInventoryOperationStatusRequest = {
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey?,
	--[[
		The id of the entity's collection to perform this action on.
		(Default="default")

	]]
	CollectionId: string?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type RealMoneyPriceDetails = {
	--[[
		The 'MicrosoftStore' price amount per CurrencyCode. 'USD' supported only.

	]]
	MicrosoftStorePrices: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		The 'GooglePlay' price amount per CurrencyCode. 'USD' supported only.

	]]
	GooglePlayPrices: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		The 'AppleAppStore' price amount per CurrencyCode. 'USD' supported only.

	]]
	AppleAppStorePrices: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		The 'PlayStationStore' price amount per CurrencyCode. 'USD' supported only.

	]]
	PlayStationStorePrices: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		The 'Steam' price amount per CurrencyCode. 'USD' supported only.

	]]
	SteamPrices: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		The 'NintendoEShop' price amount per CurrencyCode. 'USD' supported only.

	]]
	NintendoEShopPrices: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type GetEntityDraftItemsRequest = {
	--[[
		An opaque token used to retrieve the next page of items created by the caller,
		if any are available. Should be null on initial request.

	]]
	ContinuationToken: string?,
	--[[
		OData Filter to refine the items returned. CatalogItem properties 'type' can
		be used in the filter. For example: "type eq 'ugc'"

	]]
	Filter: string?,
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey?,
	--[[
		Number of items to retrieve. This value is optional. Default value is 10.

	]]
	Count: number,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type GetMicrosoftStoreAccessTokensResponse = {
	--[[
		The collections access token for calling
		https://onestore.microsoft.com/b2b/keys/create/collections to obtain a
		CollectionsIdKey for the user

	]]
	CollectionsAccessToken: string?,
	--[[
		The date the collections access token expires

	]]
	CollectionsAccessTokenExpirationDate: string,
}

export type DeleteItemRequest = {
	--[[
		The unique ID of the item.

	]]
	Id: string?,
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey?,
	AlternateId: CatalogAlternateId?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type PurchaseInventoryItemsOperation = {
	Item: InventoryItemReference?,
	--[[
		The duration to purchase.

	]]
	DurationInSeconds: number?,
	--[[
		The amount to purchase.

	]]
	Amount: number?,
	NewStackValues: InitialValues?,
	--[[
		The per-item price the item is expected to be purchased at. This must match a
		value configured in the Catalog or specified Store.

	]]
	PriceAmounts: { PurchasePriceAmount }?,
	--[[
		Indicates whether stacks reduced to an amount of 0 during the operation should
		be deleted from the inventory. (Default = false)

	]]
	DeleteEmptyStacks: boolean,
	--[[
		The id of the Store to purchase the item from.

	]]
	StoreId: string?,
}

--[[
	Given an entity type, entity identifier and container details, will add the
	specified inventory items.

]]
export type AddInventoryItemsRequest = {
	--[[
		The duration to add to the current item expiration date.

	]]
	DurationInSeconds: number?,
	--[[
		The id of the entity's collection to perform this action on.
		(Default="default"). The number of inventory collections is unlimited.

	]]
	CollectionId: string?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	Item: InventoryItemReference?,
	--[[
		The amount to add for the current item.

	]]
	Amount: number?,
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey?,
	--[[
		ETags are used for concurrency checking when updating resources. More
		information about using ETags can be found here:
		https://learn.microsoft.com/en-us/gaming/playfab/features/economy-v2/catalog/etags

	]]
	ETag: string?,
	--[[
		The Idempotency ID for this request. Idempotency IDs can be used to prevent
		operation replay in the medium term but will be garbage collected eventually.

	]]
	IdempotencyId: string?,
	NewStackValues: InitialValues?,
}

export type PublishDraftItemResponse = {
	-- No properties defined in spec
	[string]: any
}

--[[
	Redeem inventory items from Steam.

]]
export type RedeemSteamInventoryItemsRequest = {
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey?,
	--[[
		The id of the entity's collection to perform this action on.
		(Default="default")

	]]
	CollectionId: string?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type AlternateId = {
	--[[
		Value of the alternate ID.

	]]
	Value: string?,
	--[[
		Type of the alternate ID.

	]]
	Type: string?,
}

export type DeleteInventoryItemsOperation = {
	Item: InventoryItemReference?,
}

export type DeleteItemResponse = {
	-- No properties defined in spec
	[string]: any
}

--[[
	Get a list of Inventory Collection Ids for the specified Entity

]]
export type GetInventoryCollectionIdsRequest = {
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey?,
	--[[
		An opaque token used to retrieve the next page of collection ids, if any are
		available.

	]]
	ContinuationToken: string?,
	--[[
		Number of items to retrieve. This value is optional. The default value is 10

	]]
	Count: number,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type GetItemModerationStateResponse = {
	State: ModerationState?,
}

--[[
	Gets the access tokens for Microsoft Store authentication.

]]
export type GetMicrosoftStoreAccessTokensRequest = {
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type UploadUrlMetadata = {
	--[[
		Unique ID for the binary content to be uploaded to the target URL.

	]]
	Id: string?,
	--[[
		URL for the binary content to be uploaded to.

	]]
	Url: string?,
	--[[
		Name of the file for which this upload URL was requested.

	]]
	FileName: string?,
}

export type CatalogSpecificConfig = {
	--[[
		The set of content types that will be used for validation. Each content type
		can have a maximum character length of 40 and up to 128 types can be listed.

	]]
	ContentTypes: { string }?,
	--[[
		The set of tags that will be used for validation. Each tag can have a maximum
		character length of 32 and up to 1024 tags can be listed.

	]]
	Tags: { string }?,
}

export type GetItemContainersResponse = {
	--[[
		An opaque token used to retrieve the next page of items, if any are available.

	]]
	ContinuationToken: string?,
	--[[
		List of Bundles and Stores containing the requested items.

	]]
	Containers: { CatalogItem }?,
}

export type GetItemPublishStatusRequest = {
	--[[
		The unique ID of the item.

	]]
	Id: string?,
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey?,
	AlternateId: CatalogAlternateId?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type GetEntityDraftItemsResponse = {
	--[[
		An opaque token used to retrieve the next page of items, if any are available.

	]]
	ContinuationToken: string?,
	--[[
		A set of items created by the entity.

	]]
	Items: { CatalogItem }?,
}

export type Review = {
	--[[
		The star rating associated with each selected category in this review.

	]]
	CategoryRatings: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		The full text of this review.

	]]
	ReviewText: string?,
	--[[
		The ID of the review.

	]]
	ReviewId: string?,
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	ReviewerEntity: EntityKey?,
	--[[
		The number of positive helpfulness votes for this review.

	]]
	HelpfulPositive: number,
	--[[
		The locale for which this review was submitted in.

	]]
	Locale: string?,
	--[[
		The version of the item being reviewed.

	]]
	ItemVersion: string?,
	--[[
		The title of this review.

	]]
	Title: string?,
	--[[
		The date and time this review was last submitted.

	]]
	Submitted: string,
	--[[
		Indicates whether the review author has the item installed.

	]]
	IsInstalled: boolean,
	--[[
		Star rating associated with this review.

	]]
	Rating: number,
	--[[
		The number of negative helpfulness votes for this review.

	]]
	HelpfulNegative: number,
	--[[
		The ID of the item being reviewed.

	]]
	ItemId: string?,
}

export type ReviewItemRequest = {
	AlternateId: CatalogAlternateId?,
	Review: Review?,
	--[[
		The unique ID of the item.

	]]
	Id: string?,
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type TransactionTransferDetails = {
	--[[
		The collection id the items were transferred to or null if it was the current
		collection.

	]]
	ReceivingCollectionId: string?,
	--[[
		The collection id the items were transferred from or null if it was the
		current collection.

	]]
	GivingCollectionId: string?,
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	GivingEntity: EntityKey?,
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	ReceivingEntity: EntityKey?,
	--[[
		The id of the transfer that occurred.

	]]
	TransferId: string?,
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

export type CategoryRatingConfig = {
	--[[
		Name of the category.

	]]
	Name: string?,
}

export type UpdateDraftItemResponse = {
	Item: CatalogItem?,
}

export type CatalogPriceOptionsOverride = {
	--[[
		The prices utilized in the override.

	]]
	Prices: { CatalogPriceOverride }?,
}

export type ReviewConfig = {
	--[[
		A set of categories that can be applied toward ratings and reviews.

	]]
	CategoryRatings: { CategoryRatingConfig }?,
}

export type SubmitItemReviewVoteResponse = {
	-- No properties defined in spec
	[string]: any
}

export type ImageConfig = {
	--[[
		The set of tags that will be used for validation. Each tag can have a maximum
		character length of 32 and up to 1024 tags can be listed.

	]]
	Tags: { string }?,
}

export type GetItemModerationStateRequest = {
	--[[
		The unique ID of the item.

	]]
	Id: string?,
	AlternateId: CatalogAlternateId?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type CatalogItemReference = {
	--[[
		The unique ID of the catalog item.

	]]
	Id: string?,
	--[[
		The amount of the catalog item.

	]]
	Amount: number?,
	PriceOptions: CatalogPriceOptions?,
}

export type GetDraftItemResponse = {
	Item: CatalogItem?,
}

export type PurchaseInventoryItemsResponse = {
	--[[
		ETags are used for concurrency checking when updating resources. More
		information about using ETags can be found here:
		https://learn.microsoft.com/en-us/gaming/playfab/features/economy-v2/catalog/etags

	]]
	ETag: string?,
	--[[
		The ids of transactions that occurred as a result of the request.

	]]
	TransactionIds: { string }?,
	--[[
		The idempotency id used in the request.

	]]
	IdempotencyId: string?,
}

export type CatalogPriceAmountOverride = {
	--[[
		The exact value that should be utilized in the override.

	]]
	FixedValue: number?,
	--[[
		The multiplier that will be applied to the base Catalog value to determine
		what value should be utilized in the override.

	]]
	Multiplier: number?,
	--[[
		The id of the item this override should utilize.

	]]
	ItemId: string?,
}

export type SearchItemsRequest = {
	--[[
		An OData select query option used to augment the search results. If not
		defined, the default search result metadata will be returned.

	]]
	Select: string?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		An OData orderBy used to order the results of the search query. For example:
		"rating/average asc"

	]]
	OrderBy: string?,
	--[[
		Number of items to retrieve. This value is optional. Maximum page size is 50.
		Default value is 10.

	]]
	Count: number,
	--[[
		An opaque token used to retrieve the next page of items, if any are available.

	]]
	ContinuationToken: string?,
	--[[
		An OData filter used to refine the search query (For example: "type eq
		'ugc'"). More info about Filter Complexity limits can be found here:
		https://learn.microsoft.com/en-us/gaming/playfab/features/economy-v2/catalog/search#limits

	]]
	Filter: string?,
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey?,
	--[[
		The locale to be returned in the result.

	]]
	Language: string?,
	Store: StoreReference?,
	--[[
		The text to search for.

	]]
	Search: string?,
}

export type InventoryOperation = {
	Subtract: SubtractInventoryItemsOperation?,
	Purchase: PurchaseInventoryItemsOperation?,
	Delete: DeleteInventoryItemsOperation?,
	Transfer: TransferInventoryItemsOperation?,
	Update: UpdateInventoryItemsOperation?,
	Add: AddInventoryItemsOperation?,
}

--[[
	Given an entity type, entity identifier and container details, will get the
	entity's inventory items.

]]
export type GetInventoryItemsRequest = {
	--[[
		An opaque token used to retrieve the next page of items in the inventory, if
		any are available. Should be null on initial request.

	]]
	ContinuationToken: string?,
	--[[
		OData Filter to refine the items returned. InventoryItem properties 'type',
		'id', and 'stackId' can be used in the filter. For example: "type eq
		'currency'"

	]]
	Filter: string?,
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey?,
	--[[
		The id of the entity's collection to perform this action on.
		(Default="default")

	]]
	CollectionId: string?,
	--[[
		Number of items to retrieve. This value is optional. Maximum page size is 50.
		The default value is 10

	]]
	Count: number,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type RedeemNintendoEShopInventoryItemsResponse = {
	--[[
		The Transaction IDs associated with the inventory modifications

	]]
	TransactionIds: { string }?,
	--[[
		The list of failed redemptions from the external marketplace.

	]]
	Failed: { RedemptionFailure }?,
	--[[
		The list of successful redemptions from the external marketplace.

	]]
	Succeeded: { RedemptionSuccess }?,
}

--[[
	Submit a request to takedown one or more reviews, removing them from public
	view. Authors will still be able to see their reviews after being taken
	down.

]]
export type TakedownItemReviewsRequest = {
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		The set of reviews to take down.

	]]
	Reviews: { ReviewTakedown }?,
}

export type DeleteEntityItemReviewsRequest = {
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

--[[
	Delete an Inventory Collection by the specified Id for an Entity

]]
export type DeleteInventoryCollectionRequest = {
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey?,
	--[[
		The inventory collection id the request applies to.

	]]
	CollectionId: string?,
	--[[
		ETags are used for concurrency checking when updating resources. More
		information about using ETags can be found here:
		https://learn.microsoft.com/en-us/gaming/playfab/features/economy-v2/catalog/etags

	]]
	ETag: string?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type Image = {
	--[[
		The image unique ID.

	]]
	Id: string?,
	--[[
		Images can be defined as either a "thumbnail" or "screenshot". There can only
		be one "thumbnail" image per item.

	]]
	Type: string?,
	--[[
		The URL for retrieval of the image.

	]]
	Url: string?,
	--[[
		The client-defined tag associated with this image. Tags must be defined in the
		Catalog Config before being used in images

	]]
	Tag: string?,
}

export type CatalogPriceOptions = {
	--[[
		Prices of the catalog item. An item can have up to 15 prices

	]]
	Prices: { CatalogPrice }?,
}

export type StoreDetails = {
	Permissions: Permissions?,
	PriceOptionsOverride: CatalogPriceOptionsOverride?,
	FilterOptions: FilterOptions?,
}

export type GetDraftItemRequest = {
	--[[
		The unique ID of the item.

	]]
	Id: string?,
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey?,
	AlternateId: CatalogAlternateId?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type DisplayPropertyIndexInfo = {
	--[[
		The property name in the 'DisplayProperties' property to be indexed.

	]]
	Name: string?,
	Type: DisplayPropertyType?,
}

export type DeleteInventoryCollectionResponse = {
	-- No properties defined in spec
	[string]: any
}

export type DeepLinkFormat = {
	--[[
		The format of the deep link to return. The format should contain '{id}' to
		represent where the item ID should be placed.

	]]
	Format: string?,
	--[[
		The target platform for the deep link.

	]]
	Platform: string?,
}

export type TransactionOperation = {
	--[[
		The stack id of the items in this transaction.

	]]
	StackId: string?,
	--[[
		The duration modified in this transaction.

	]]
	DurationInSeconds: number?,
	--[[
		The amount of items in this transaction.

	]]
	Amount: number?,
	--[[
		The type of the operation that occurred.

	]]
	Type: string?,
	--[[
		The friendly id of the items in this transaction.

	]]
	ItemFriendlyId: string?,
	--[[
		The type of item that the operation occurred on.

	]]
	ItemType: string?,
	--[[
		The item id of the items in this transaction.

	]]
	ItemId: string?,
}

export type ExecuteTransferOperationsResponse = {
	--[[
		The transfer operation status. Possible values are 'InProgress' or
		'Completed'. If the operation has completed, the response code will be 200.
		Otherwise, it will be 202.

	]]
	OperationStatus: string?,
	--[[
		The ids of transactions that occurred as a result of the request's receiving
		action.

	]]
	ReceivingTransactionIds: { string }?,
	--[[
		The ids of transactions that occurred as a result of the request's giving
		action.

	]]
	GivingTransactionIds: { string }?,
	--[[
		The token that can be used to get the status of the transfer operation. This
		will only have a value if OperationStatus is 'InProgress'.

	]]
	OperationToken: string?,
	--[[
		The Idempotency ID for this request.

	]]
	IdempotencyId: string?,
	--[[
		ETags are used for concurrency checking when updating resources (before
		transferring to). This value will be empty if the operation has not completed
		yet.

	]]
	ReceivingETag: string?,
	--[[
		ETags are used for concurrency checking when updating resources (before
		transferring from). This value will be empty if the operation has not
		completed yet. More information about using ETags can be found here:
		https://learn.microsoft.com/en-us/gaming/playfab/features/economy-v2/catalog/etags

	]]
	GivingETag: string?,
}

export type SetItemModerationStateRequest = {
	AlternateId: CatalogAlternateId?,
	Status: ModerationStatus?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		The unique ID of the item.

	]]
	Id: string?,
	--[[
		The reason for the moderation state change for the associated item.

	]]
	Reason: string?,
}

export type StoreReference = {
	AlternateId: CatalogAlternateId?,
	--[[
		The unique ID of the store.

	]]
	Id: string?,
}

export type GetInventoryCollectionIdsResponse = {
	--[[
		The requested inventory collection ids.

	]]
	CollectionIds: { string }?,
	--[[
		An opaque token used to retrieve the next page of collection ids, if any are
		available.

	]]
	ContinuationToken: string?,
}

export type GetItemReviewsResponse = {
	--[[
		An opaque token used to retrieve the next page of items, if any are available.

	]]
	ContinuationToken: string?,
	--[[
		The paginated set of results.

	]]
	Reviews: { Review }?,
}

export type GetItemRequest = {
	--[[
		The unique ID of the item.

	]]
	Id: string?,
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey?,
	AlternateId: CatalogAlternateId?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type GetItemReviewSummaryRequest = {
	--[[
		The unique ID of the item.

	]]
	Id: string?,
	AlternateId: CatalogAlternateId?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type DeleteEntityItemReviewsResponse = {
	-- No properties defined in spec
	[string]: any
}

export type GetItemReviewSummaryResponse = {
	Rating: Rating?,
	LeastFavorableReview: Review?,
	--[[
		The total number of reviews associated with this item.

	]]
	ReviewsCount: number,
	MostFavorableReview: Review?,
}

export type Content = {
	--[[
		The client-defined type of the content. Content Types must be defined in the
		Catalog Config before being used.

	]]
	Type: string?,
	--[[
		The list of tags that are associated with this content. Tags must be defined
		in the Catalog Config before being used in content.

	]]
	Tags: { string }?,
	--[[
		The content unique ID.

	]]
	Id: string?,
	--[[
		The Azure CDN URL for retrieval of the catalog item binary content.

	]]
	Url: string?,
	--[[
		The maximum client version that this content is compatible with. Client
		Versions can be up to 3 segments separated by periods(.) and each segment can
		have a maximum value of 65535.

	]]
	MaxClientVersion: string?,
	--[[
		The minimum client version that this content is compatible with. Client
		Versions can be up to 3 segments separated by periods(.) and each segment can
		have a maximum value of 65535.

	]]
	MinClientVersion: string?,
}

export type GooglePlayProductPurchase = {
	--[[
		The token provided to the player's device when the product was purchased

	]]
	Token: string?,
	--[[
		The Product ID (SKU) of the InApp product purchased from the Google Play
		store.

	]]
	ProductId: string?,
}

export type SubtractInventoryItemsOperation = {
	Item: InventoryItemReference?,
	--[[
		Indicates whether stacks reduced to an amount of 0 during the request should
		be deleted from the inventory. (Default = false).

	]]
	DeleteEmptyStacks: boolean,
	--[[
		The duration to subtract from the current item expiration date.

	]]
	DurationInSeconds: number?,
	--[[
		The amount to subtract from the current item amount.

	]]
	Amount: number?,
}

--[[
	Redeem items from the PlayStation Store.

]]
export type RedeemPlayStationStoreInventoryItemsRequest = {
	--[[
		Auth code returned by PlayStation :tm: Network OAuth system.

	]]
	AuthorizationCode: string?,
	--[[
		Optional Service Label to pass into the request.

	]]
	ServiceLabel: string?,
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey?,
	--[[
		The id of the entity's collection to perform this action on.
		(Default="default")

	]]
	CollectionId: string?,
	--[[
		Redirect URI supplied to PlayStation :tm: Network when requesting an auth
		code.

	]]
	RedirectUri: string?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type GetEntityItemReviewRequest = {
	--[[
		The unique ID of the item.

	]]
	Id: string?,
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey?,
	AlternateId: CatalogAlternateId?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type GetInventoryItemsResponse = {
	--[[
		The requested inventory items.

	]]
	Items: { InventoryItem }?,
	--[[
		ETags are used for concurrency checking when updating resources. More
		information about using ETags can be found here:
		https://learn.microsoft.com/en-us/gaming/playfab/features/economy-v2/catalog/etags

	]]
	ETag: string?,
	--[[
		An opaque token used to retrieve the next page of items, if any are available.

	]]
	ContinuationToken: string?,
}

export type GetItemsResponse = {
	--[[
		Metadata of set of items.

	]]
	Items: { CatalogItem }?,
}

--[[
	Redeem items from the Google Play Store.

]]
export type RedeemGooglePlayInventoryItemsRequest = {
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey?,
	--[[
		The id of the entity's collection to perform this action on.
		(Default="default")

	]]
	CollectionId: string?,
	--[[
		The list of purchases to redeem

	]]
	Purchases: { GooglePlayProductPurchase }?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

--[[
	The call kicks off a workflow to publish the item to the public catalog. The
	Publish Status API should be used to monitor the publish job.

]]
export type PublishDraftItemRequest = {
	AlternateId: CatalogAlternateId?,
	--[[
		The unique ID of the item.

	]]
	Id: string?,
	--[[
		ETag of the catalog item to published from the working catalog to the public
		catalog. Used for optimistic concurrency. If the provided ETag does not match
		the ETag in the current working catalog, the request will be rejected. If not
		provided, the current version of the document in the working catalog will be
		published.

	]]
	ETag: string?,
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

--[[
	Get transaction history for specified entity and collection.

]]
export type GetTransactionHistoryRequest = {
	--[[
		An OData orderby to order TransactionHistory results. The only supported
		values are 'timestamp asc' or 'timestamp desc'. Default orderby is 'timestamp
		asc'

	]]
	OrderBy: string?,
	--[[
		An opaque token used to retrieve the next page of items, if any are available.
		Should be null on initial request.

	]]
	ContinuationToken: string?,
	--[[
		An OData filter used to refine the TransactionHistory. Transaction properties
		'timestamp', 'transactionid', 'apiname' and 'operationtype' can be used in the
		filter. Properties 'transactionid', 'apiname', and 'operationtype' cannot be
		used together in a single request. The 'timestamp' property can be combined
		with 'apiname' or 'operationtype' in a single request. For example: "timestamp
		ge 2023-06-20T23:30Z" or "transactionid eq '10'" or "(timestamp ge
		2023-06-20T23:30Z) and (apiname eq 'AddInventoryItems')". By default, a 6
		month timespan from the current date is used.

	]]
	Filter: string?,
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey?,
	--[[
		The id of the entity's collection to perform this action on.
		(Default="default")

	]]
	CollectionId: string?,
	--[[
		Number of items to retrieve. This value is optional. The default value is 10

	]]
	Count: number,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type GetTransactionHistoryResponse = {
	--[[
		An opaque token used to retrieve the next page of items, if any are available.
		Should be null on initial request.

	]]
	ContinuationToken: string?,
	--[[
		The requested inventory transactions.

	]]
	Transactions: { Transaction }?,
}

export type DeleteInventoryItemsResponse = {
	--[[
		ETags are used for concurrency checking when updating resources.

	]]
	ETag: string?,
	--[[
		The ids of transactions that occurred as a result of the request.

	]]
	TransactionIds: { string }?,
	--[[
		The idempotency id used in the request.

	]]
	IdempotencyId: string?,
}

export type AddInventoryItemsResponse = {
	--[[
		ETags are used for concurrency checking when updating resources. More
		information about using ETags can be found here:
		https://learn.microsoft.com/en-us/gaming/playfab/features/economy-v2/catalog/etags

	]]
	ETag: string?,
	--[[
		The ids of transactions that occurred as a result of the request.

	]]
	TransactionIds: { string }?,
	--[[
		The idempotency id used in the request.

	]]
	IdempotencyId: string?,
}

--[[
	Purchase a single item or bundle, paying the associated price.

]]
export type PurchaseInventoryItemsRequest = {
	--[[
		The duration to purchase.

	]]
	DurationInSeconds: number?,
	--[[
		The id of the entity's collection to perform this action on.
		(Default="default"). The number of inventory collections is unlimited.

	]]
	CollectionId: string?,
	--[[
		The Idempotency ID for this request. Idempotency IDs can be used to prevent
		operation replay in the medium term but will be garbage collected eventually.

	]]
	IdempotencyId: string?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		The per-item price the item is expected to be purchased at. This must match a
		value configured in the Catalog or specified Store.

	]]
	PriceAmounts: { PurchasePriceAmount }?,
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey?,
	--[[
		The id of the Store to purchase the item from.

	]]
	StoreId: string?,
	--[[
		The amount to purchase.

	]]
	Amount: number?,
	NewStackValues: InitialValues?,
	--[[
		ETags are used for concurrency checking when updating resources. More
		information about using ETags can be found here:
		https://learn.microsoft.com/en-us/gaming/playfab/features/economy-v2/catalog/etags

	]]
	ETag: string?,
	--[[
		Indicates whether stacks reduced to an amount of 0 during the request should
		be deleted from the inventory. (Default=false)

	]]
	DeleteEmptyStacks: boolean,
	Item: InventoryItemReference?,
}

export type CatalogItem = {
	--[[
		The set of content/files associated with this item. Up to 100 files can be
		added to an item.

	]]
	Contents: { Content }?,
	--[[
		The images associated with this item. Images can be thumbnails or screenshots.
		Up to 100 images can be added to an item. Only .png, .jpg, .gif, and .bmp file
		types can be uploaded

	]]
	Images: { Image }?,
	--[[
		The set of platform specific deep links for this item.

	]]
	DeepLinks: { DeepLink }?,
	Moderation: ModerationState?,
	--[[
		The item references associated with this item. For example, the items in a
		Bundle/Store/Subscription. Every item can have up to 50 item references.

	]]
	ItemReferences: { CatalogItemReference }?,
	--[[
		A dictionary of localized descriptions. Key is language code and localized
		string is the value. The NEUTRAL locale is required. Descriptions have a 10000
		character limit per country code.

	]]
	Description: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		The Stack Id that will be used as default for this item in Inventory when an
		explicit one is not provided. This DefaultStackId can be a static stack id or
		'{guid}', which will generate a unique stack id for the item. If null,
		Inventory's default stack id will be used.

	]]
	DefaultStackId: string?,
	--[[
		Game specific properties for display purposes. This is an arbitrary JSON blob.
		The Display Properties field has a 10000 byte limit per item.

	]]
	DisplayProperties: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		The date of when the item will be available. If not provided then the product
		will appear immediately.

	]]
	StartDate: string?,
	Rating: Rating?,
	RealMoneyPriceDetails: RealMoneyPriceDetails?,
	--[[
		The date of when the item will cease to be available. If not provided then the
		product will be available indefinitely.

	]]
	EndDate: string?,
	--[[
		Indicates if the item is hidden.

	]]
	IsHidden: boolean?,
	--[[
		The high-level type of the item. The following item types are supported:
		bundle, catalogItem, currency, store, ugc, subscription.

	]]
	Type: string?,
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	CreatorEntity: EntityKey?,
	--[[
		The list of tags that are associated with this item. Up to 32 tags can be
		added to an item.

	]]
	Tags: { string }?,
	--[[
		The user provided version of the item for display purposes. Maximum character
		length of 50.

	]]
	DisplayVersion: string?,
	Keywords: KeywordSet?,
	--[[
		The unique ID of the item.

	]]
	Id: string?,
	--[[
		The alternate IDs associated with this item. An alternate ID can be set to
		'FriendlyId' or any of the supported marketplace names.

	]]
	AlternateIds: { CatalogAlternateId }?,
	--[[
		The date and time when this item was created.

	]]
	CreationDate: string?,
	--[[
		The date and time this item was last updated.

	]]
	LastModifiedDate: string?,
	--[[
		A dictionary of localized titles. Key is language code and localized string is
		the value. The NEUTRAL locale is required. Titles have a 512 character limit
		per country code.

	]]
	Title: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		The platforms supported by this item.

	]]
	Platforms: { string }?,
	--[[
		The client-defined type of the item.

	]]
	ContentType: string?,
	--[[
		The current ETag value that can be used for optimistic concurrency in the
		If-None-Match header.

	]]
	ETag: string?,
	PriceOptions: CatalogPriceOptions?,
	StoreDetails: StoreDetails?,
}

export type Rating = {
	--[[
		The total count of 5 star ratings for this item.

	]]
	Count5Star: number?,
	--[[
		The total count of 1 star ratings for this item.

	]]
	Count1Star: number?,
	--[[
		The total count of 2 star ratings for this item.

	]]
	Count2Star: number?,
	--[[
		The total count of 4 star ratings for this item.

	]]
	Count4Star: number?,
	--[[
		The total count of ratings for this item.

	]]
	TotalCount: number?,
	--[[
		The average rating for this item.

	]]
	Average: number?,
	--[[
		The total count of 3 star ratings for this item.

	]]
	Count3Star: number?,
}

export type Transaction = {
	--[[
		The operations that occurred.

	]]
	Operations: { TransactionOperation }?,
	--[[
		The type of operation that was run.

	]]
	OperationType: string?,
	RedeemDetails: TransactionRedeemDetails?,
	--[[
		The id of the transaction. This should be treated like an opaque token.

	]]
	TransactionId: string?,
	ClawbackDetails: TransactionClawbackDetails?,
	--[[
		The type of item that the the operation occurred on.

	]]
	ItemType: string?,
	--[[
		The API call that caused this transaction.

	]]
	ApiName: string?,
	--[[
		The custom tags associated with this transactions.

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		The time this transaction occurred in UTC.

	]]
	Timestamp: string,
	TransferDetails: TransactionTransferDetails?,
	PurchaseDetails: TransactionPurchaseDetails?,
}

export type TakedownItemReviewsResponse = {
	-- No properties defined in spec
	[string]: any
}

--[[
	Upload URLs point to Azure Blobs; clients must follow the Microsoft Azure
	Storage Blob Service REST API pattern for uploading content. The response
	contains upload URLs and IDs for each file. The IDs and URLs returned must
	be added to the item metadata and committed using the CreateDraftItem or
	UpdateDraftItem Item APIs.

]]
export type CreateUploadUrlsRequest = {
	--[[
		Description of the files to be uploaded by the client.

	]]
	Files: { UploadInfo }?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

--[[
	Transfer the specified list of inventory items of an entity's container Id
	to another entity's container Id.

]]
export type ExecuteTransferOperationsRequest = {
	--[[
		The transfer operations to run transactionally. The operations will be
		executed in-order sequentially and will succeed or fail as a batch. Up to 50
		operations can be added.

	]]
	Operations: { TransferInventoryItemsOperation }?,
	--[[
		The inventory collection id the request is transferring to.
		(Default="default")

	]]
	ReceivingCollectionId: string?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		ETags are used for concurrency checking when updating resources. More
		information about using ETags can be found here:
		https://learn.microsoft.com/en-us/gaming/playfab/features/economy-v2/catalog/etags

	]]
	GivingETag: string?,
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	GivingEntity: EntityKey?,
	--[[
		The idempotency id for the request.

	]]
	IdempotencyId: string?,
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	ReceivingEntity: EntityKey?,
	--[[
		The inventory collection id the request is transferring from.
		(Default="default")

	]]
	GivingCollectionId: string?,
}

export type GetInventoryOperationStatusResponse = {
	--[[
		The inventory operation status.

	]]
	OperationStatus: string?,
}

export type CreateDraftItemResponse = {
	Item: CatalogItem?,
}

export type KeywordSet = {
	--[[
		A list of localized keywords.

	]]
	Values: { string }?,
}

export type GetItemPublishStatusResponse = {
	Result: PublishResult?,
	--[[
		Descriptive message about the current status of the publish.

	]]
	StatusMessage: string?,
}

--[[
	Given an item, return a set of bundles and stores containing the item.

]]
export type GetItemContainersRequest = {
	AlternateId: CatalogAlternateId?,
	--[[
		An opaque token used to retrieve the next page of items in the inventory, if
		any are available. Should be null on initial request.

	]]
	ContinuationToken: string?,
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey?,
	--[[
		Number of items to retrieve. This value is optional. Default value is 10.

	]]
	Count: number,
	--[[
		The unique ID of the item.

	]]
	Id: string?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type TransactionPurchaseDetails = {
	--[[
		The friendly id of the Store the item was purchased from or null.

	]]
	StoreFriendlyId: string?,
	--[[
		The id of the Store the item was purchased from or null.

	]]
	StoreId: string?,
}

export type FileConfig = {
	--[[
		The set of content types that will be used for validation. Each content type
		can have a maximum character length of 40 and up to 128 types can be listed.

	]]
	ContentTypes: { string }?,
	--[[
		The set of tags that will be used for validation. Each tag can have a maximum
		character length of 32 and up to 1024 tags can be listed.

	]]
	Tags: { string }?,
}

export type InventoryItem = {
	--[[
		Only used for subscriptions. The date of when the item will expire in UTC.

	]]
	ExpirationDate: string?,
	--[[
		Game specific properties for display purposes. This is an arbitrary JSON blob.
		The Display Properties field has a 1000 byte limit.

	]]
	DisplayProperties: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		The amount of the item.

	]]
	Amount: number?,
	--[[
		The id of the item. This should correspond to the item id in the catalog.

	]]
	Id: string?,
	--[[
		The stack id of the item.

	]]
	StackId: string?,
	--[[
		The type of the item. This should correspond to the item type in the catalog.

	]]
	Type: string?,
}

--[[
	Execute a list of Inventory Operations for an Entity

]]
export type ExecuteInventoryOperationsRequest = {
	--[[
		The operations to run transactionally. The operations will be executed
		in-order sequentially and will succeed or fail as a batch. Up to 50 operations
		can be added.

	]]
	Operations: { InventoryOperation }?,
	--[[
		The Idempotency ID for this request. Idempotency IDs can be used to prevent
		operation replay in the medium term but will be garbage collected eventually.

	]]
	IdempotencyId: string?,
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey?,
	--[[
		The id of the entity's collection to perform this action on.
		(Default="default"). The number of inventory collections is unlimited.

	]]
	CollectionId: string?,
	--[[
		ETags are used for concurrency checking when updating resources. More
		information about using ETags can be found here:
		https://learn.microsoft.com/en-us/gaming/playfab/features/economy-v2/catalog/etags

	]]
	ETag: string?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type RedeemMicrosoftStoreInventoryItemsResponse = {
	--[[
		The Transaction IDs associated with the inventory modifications

	]]
	TransactionIds: { string }?,
	--[[
		The list of failed redemptions from the external marketplace.

	]]
	Failed: { RedemptionFailure }?,
	--[[
		The list of successful redemptions from the external marketplace.

	]]
	Succeeded: { RedemptionSuccess }?,
}

--[[
	Redeem items from the Nintendo EShop.

]]
export type RedeemNintendoEShopInventoryItemsRequest = {
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey?,
	--[[
		The id of the entity's collection to perform this action on.
		(Default="default")

	]]
	CollectionId: string?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		The Nintendo provided token authorizing redemption

	]]
	NintendoServiceAccountIdToken: string?,
}

export type PurchaseOverridesInfo = {
	-- No properties defined in spec
	[string]: any
}

export type CatalogPriceAmount = {
	--[[
		The amount of the price.

	]]
	Amount: number,
	--[[
		The Item Id of the price.

	]]
	ItemId: string?,
}

export type ReportItemResponse = {
	-- No properties defined in spec
	[string]: any
}

export type ReportItemReviewResponse = {
	-- No properties defined in spec
	[string]: any
}

export type SearchItemsResponse = {
	--[[
		An opaque token used to retrieve the next page of items, if any are available.

	]]
	ContinuationToken: string?,
	--[[
		The paginated set of results for the search query.

	]]
	Items: { CatalogItem }?,
}

export type InventoryItemReference = {
	--[[
		The inventory item id the request applies to.

	]]
	Id: string?,
	--[[
		The inventory stack id the request should redeem to. (Default="default")

	]]
	StackId: string?,
	AlternateId: AlternateId?,
}

--[[
	Submit a report for an inappropriate review, allowing the submitting user to
	specify their concern.

]]
export type ReportItemReviewRequest = {
	ConcernCategory: ConcernCategory?,
	AlternateId: CatalogAlternateId?,
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
		The string ID of the item associated with the review.

	]]
	ItemId: string?,
	--[[
		The ID of the review to submit a report for.

	]]
	ReviewId: string?,
	--[[
		The string reason for this report.

	]]
	Reason: string?,
}

export type ModerationState = {
	Status: ModerationStatus?,
	--[[
		The date and time this moderation state was last updated.

	]]
	LastModifiedDate: string?,
	--[[
		The current stated reason for the associated item being moderated.

	]]
	Reason: string?,
}

export type GetItemReviewsRequest = {
	--[[
		An OData orderBy used to order the results of the query. Possible values are
		Helpfulness, Rating, and Submitted (For example: "Submitted desc")

	]]
	OrderBy: string?,
	AlternateId: CatalogAlternateId?,
	--[[
		The unique ID of the item.

	]]
	Id: string?,
	--[[
		An opaque token used to retrieve the next page of items, if any are available.

	]]
	ContinuationToken: string?,
	--[[
		Number of items to retrieve. This value is optional. Default value is 10.

	]]
	Count: number,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

--[[
	Given an entity type, entity identifier and container details, will subtract
	the specified inventory items.

]]
export type SubtractInventoryItemsRequest = {
	--[[
		The duration to subtract from the current item expiration date.

	]]
	DurationInSeconds: number?,
	--[[
		The id of the entity's collection to perform this action on.
		(Default="default"). The number of inventory collections is unlimited.

	]]
	CollectionId: string?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	Item: InventoryItemReference?,
	--[[
		The amount to subtract for the current item.

	]]
	Amount: number?,
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey?,
	--[[
		ETags are used for concurrency checking when updating resources. More
		information about using ETags can be found here:
		https://learn.microsoft.com/en-us/gaming/playfab/features/economy-v2/catalog/etags

	]]
	ETag: string?,
	--[[
		Indicates whether stacks reduced to an amount of 0 during the request should
		be deleted from the inventory. (Default=false)

	]]
	DeleteEmptyStacks: boolean,
	--[[
		The Idempotency ID for this request. Idempotency IDs can be used to prevent
		operation replay in the medium term but will be garbage collected eventually.

	]]
	IdempotencyId: string?,
}

export type ModerationStatus = 
	| "Unknown"
	| "AwaitingModeration"
	| "Approved"
	| "Rejected"

export type Permissions = {
	--[[
		The list of ids of Segments that the a player can be in to purchase from the
		store. When a value is provided, the player must be in at least one of the
		segments listed for the purchase to be allowed.

	]]
	SegmentIds: { string }?,
}

--[[
	Given an entity type, entity identifier and container details, will update
	the entity's inventory items

]]
export type UpdateInventoryItemsRequest = {
	Item: InventoryItem?,
	--[[
		The Idempotency ID for this request. Idempotency IDs can be used to prevent
		operation replay in the medium term but will be garbage collected eventually.

	]]
	IdempotencyId: string?,
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey?,
	--[[
		The id of the entity's collection to perform this action on.
		(Default="default"). The number of inventory collections is unlimited.

	]]
	CollectionId: string?,
	--[[
		ETags are used for concurrency checking when updating resources. More
		information about using ETags can be found here:
		https://learn.microsoft.com/en-us/gaming/playfab/features/economy-v2/catalog/etags

	]]
	ETag: string?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
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

export type ReviewTakedown = {
	--[[
		The ID of the review to take down.

	]]
	ReviewId: string?,
	AlternateId: CatalogAlternateId?,
	--[[
		The ID of the item associated with the review to take down.

	]]
	ItemId: string?,
}

--[[
	Given an entity type, entity identifier and container details, will delete
	the entity's inventory items

]]
export type DeleteInventoryItemsRequest = {
	Item: InventoryItemReference?,
	--[[
		The Idempotency ID for this request. Idempotency IDs can be used to prevent
		operation replay in the medium term but will be garbage collected eventually.

	]]
	IdempotencyId: string?,
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey?,
	--[[
		The id of the entity's collection to perform this action on.
		(Default="default"). The number of inventory collections is unlimited.

	]]
	CollectionId: string?,
	--[[
		ETags are used for concurrency checking when updating resources. More
		information about using ETags can be found here:
		https://learn.microsoft.com/en-us/gaming/playfab/features/economy-v2/catalog/etags

	]]
	ETag: string?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type HelpfulnessVote = 
	| "None"
	| "UnHelpful"
	| "Helpful"

export type TransactionRedeemDetails = {
	--[[
		The marketplace that the offer is being redeemed from.

	]]
	Marketplace: string?,
	--[[
		The transaction Id returned from the marketplace.

	]]
	MarketplaceTransactionId: string?,
	--[[
		The offer Id of the item being redeemed.

	]]
	OfferId: string?,
}

export type GetCatalogConfigResponse = {
	Config: CatalogConfig?,
}

--[[
	Transfer the specified inventory items of an entity's container Id to
	another entity's container Id.

]]
export type TransferInventoryItemsRequest = {
	ReceivingItem: InventoryItemReference?,
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	GivingEntity: EntityKey?,
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	ReceivingEntity: EntityKey?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		The inventory collection id the request is transferring from.
		(Default="default")

	]]
	GivingCollectionId: string?,
	GivingItem: InventoryItemReference?,
	--[[
		The idempotency id for the request.

	]]
	IdempotencyId: string?,
	--[[
		The amount to transfer .

	]]
	Amount: number?,
	NewStackValues: InitialValues?,
	--[[
		The inventory collection id the request is transferring to.
		(Default="default")

	]]
	ReceivingCollectionId: string?,
	--[[
		Indicates whether stacks reduced to an amount of 0 during the request should
		be deleted from the inventory. (Default = false)

	]]
	DeleteEmptyStacks: boolean,
	--[[
		ETags are used for concurrency checking when updating resources (before
		transferring from). More information about using ETags can be found here:
		https://learn.microsoft.com/en-us/gaming/playfab/features/economy-v2/catalog/etags

	]]
	GivingETag: string?,
}

export type RedeemGooglePlayInventoryItemsResponse = {
	--[[
		The Transaction IDs associated with the inventory modifications

	]]
	TransactionIds: { string }?,
	--[[
		The list of failed redemptions from the external marketplace.

	]]
	Failed: { RedemptionFailure }?,
	--[[
		The list of successful redemptions from the external marketplace.

	]]
	Succeeded: { RedemptionSuccess }?,
}

export type UpdateCatalogConfigResponse = {
	-- No properties defined in spec
	[string]: any
}

export type UpdateInventoryItemsResponse = {
	--[[
		ETags are used for concurrency checking when updating resources. More
		information about using ETags can be found here:
		https://learn.microsoft.com/en-us/gaming/playfab/features/economy-v2/catalog/etags

	]]
	ETag: string?,
	--[[
		The ids of transactions that occurred as a result of the request.

	]]
	TransactionIds: { string }?,
	--[[
		The idempotency id used in the request.

	]]
	IdempotencyId: string?,
}

export type UpdateDraftItemRequest = {
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	Item: CatalogItem?,
	--[[
		Whether the item should be published immediately. This value is optional,
		defaults to false.

	]]
	Publish: boolean,
}

export type RedeemPlayStationStoreInventoryItemsResponse = {
	--[[
		The Transaction IDs associated with the inventory modifications

	]]
	TransactionIds: { string }?,
	--[[
		The list of failed redemptions from the external marketplace.

	]]
	Failed: { RedemptionFailure }?,
	--[[
		The list of successful redemptions from the external marketplace.

	]]
	Succeeded: { RedemptionSuccess }?,
}

export type PublishResult = 
	| "Unknown"
	| "Pending"
	| "Succeeded"
	| "Failed"
	| "Canceled"

export type DisplayPropertyType = 
	| "None"
	| "QueryDateTime"
	| "QueryDouble"
	| "QueryString"
	| "SearchString"

export type ConcernCategory = 
	| "None"
	| "OffensiveContent"
	| "ChildExploitation"
	| "MalwareOrVirus"
	| "PrivacyConcerns"
	| "MisleadingApp"
	| "PoorPerformance"
	| "ReviewResponse"
	| "SpamAdvertising"
	| "Profanity"

export type RedemptionSuccess = {
	--[[
		The Marketplace Alternate ID being redeemed.

	]]
	MarketplaceAlternateId: string?,
	--[[
		The transaction id in the external marketplace.

	]]
	MarketplaceTransactionId: string?,
	--[[
		The timestamp for when the redeem was completed.

	]]
	SuccessTimestamp: string,
}

export type PurchasePriceAmount = {
	--[[
		The inventory stack id the to use in the purchase. Set to "default" by default

	]]
	StackId: string?,
	--[[
		The amount of the inventory item to use in the purchase .

	]]
	Amount: number,
	--[[
		The inventory item id to use in the purchase .

	]]
	ItemId: string?,
}

export type GetDraftItemsRequest = {
	--[[
		An opaque token used to retrieve the next page of items created by the caller,
		if any are available. Should be null on initial request.

	]]
	ContinuationToken: string?,
	--[[
		List of Item Ids.

	]]
	Ids: { string }?,
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey?,
	--[[
		List of item alternate IDs.

	]]
	AlternateIds: { CatalogAlternateId }?,
	--[[
		Number of items to retrieve. This value is optional. Default value is 10.

	]]
	Count: number?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type RedemptionFailure = {
	--[[
		The Marketplace Alternate ID being redeemed.

	]]
	MarketplaceAlternateId: string?,
	--[[
		The marketplace failure code.

	]]
	FailureCode: string?,
	--[[
		The marketplace error details explaining why the offer failed to redeem.

	]]
	FailureDetails: string?,
	--[[
		The transaction id in the external marketplace.

	]]
	MarketplaceTransactionId: string?,
}

export type GetDraftItemsResponse = {
	--[[
		An opaque token used to retrieve the next page of items, if any are available.

	]]
	ContinuationToken: string?,
	--[[
		A set of items created by the entity.

	]]
	Items: { CatalogItem }?,
}

export type ExecuteInventoryOperationsResponse = {
	--[[
		ETags are used for concurrency checking when updating resources. More
		information about using ETags can be found here:
		https://learn.microsoft.com/en-us/gaming/playfab/features/economy-v2/catalog/etags

	]]
	ETag: string?,
	--[[
		The ids of the transactions that occurred as a result of the request.

	]]
	TransactionIds: { string }?,
	--[[
		The idempotency id used in the request.

	]]
	IdempotencyId: string?,
}

export type InitialValues = {
	--[[
		Game specific properties for display purposes. The Display Properties field
		has a 1000 byte limit.

	]]
	DisplayProperties: {
		-- No properties defined in spec
		[string]: any
	}?,
}



return nil
