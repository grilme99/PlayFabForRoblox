--!strict
--[=[
	# EconomyApi

	API methods for managing the catalog. Inventory manages in-game assets for any 
	given entity. 
]=]

local PlayFabInternal = require(script.Parent.PlayFabInternal)

local EconomyApi = {}

export type AddInventoryItemsOperation = {
	Amount: number, --- The amount to add to the current item amount.
	Item: InventoryItemReference?, --- The inventory item the operation applies to.
}

--- Given an entity type, entity identifier and container details, will add the 
--- specified inventory items. 
export type AddInventoryItemsRequest = {
	Amount: number, --- The amount to add for the current item.
	CollectionId: string?, --- The id of the entity's collection to perform this action on. (Default="default")
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	Entity: EntityKey?, --- The entity to perform this action on.
	IdempotencyId: string?, --- The Idempotency ID for this request.
	Item: InventoryItemReference?, --- The inventory item the request applies to.
}

export type AddInventoryItemsResponse = {
	IdempotencyId: string?, --- The idempotency id used in the request.
	TransactionIds: {any}?, --- The ids of transactions that occurred as a result of the request.
}

export type AlternateId = {
	Type: string?, --- Type of the alternate ID.
	Value: string?, --- Value of the alternate ID.
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

export type CatalogAlternateId = {
	Type: string?, --- Type of the alternate ID.
	Value: string?, --- Value of the alternate ID.
}

export type CatalogConfig = {
	AdminEntities: {EntityKey}?, --- A list of player entity keys that will have admin permissions.
	Catalog: CatalogSpecificConfig?, --- The set of configuration that only applies to catalog items.
	DeepLinkFormats: {DeepLinkFormat}?, --- A list of deep link formats.
	DisplayPropertyIndexInfos: {DisplayPropertyIndexInfo}?, --- A list of display properties to index.
	File: FileConfig?, --- The set of configuration that only applies to Files.
	Image: ImageConfig?, --- The set of configuration that only applies to Images.
	IsCatalogEnabled: boolean, --- Flag defining whether catalog is enabled.
	Platforms: {any}?, --- A list of Platforms that can be applied to catalog items.
	ReviewerEntities: {EntityKey}?, --- A set of player entity keys that are allowed to review content.
	UserGeneratedContent: UserGeneratedContentSpecificConfig?, --- The set of configuration that only applies to user generated contents.
}

export type CatalogItem = {
	AlternateIds: {CatalogAlternateId}?, --- The alternate IDs associated with this item.
	ContentType: string?, --- The client-defined type of the item.
	Contents: {Content}?, --- The set of contents associated with this item.
	CreationDate: string?, --- The date and time when this item was created.
	CreatorEntity: EntityKey?, --- The ID of the creator of this catalog item.
	DeepLinks: {DeepLink}?, --- The set of platform specific deep links for this item.
	Description: {[any]: any}?, --- A dictionary of localized descriptions. Key is language code and localized string is the value. The neutral locale is required.
	DisplayProperties: {[any]: any}?, --- Game specific properties for display purposes. This is an arbitrary JSON blob.
	DisplayVersion: string?, --- The user provided version of the item for display purposes.
	ETag: string?, --- The current ETag value that can be used for optimistic concurrency in the If-None-Match header.
	EndDate: string?, --- The date of when the item will cease to be available. If not provided then the product will be available indefinitely.
	Id: string?, --- The unique ID of the item.
	Images: {Image}?, --- The images associated with this item. Images can be thumbnails or screenshots.
	IsHidden: boolean?, --- Indicates if the item is hidden.
	ItemReferences: {CatalogItemReference}?, --- The item references associated with this item.
	Keywords: KeywordSet?, --- A dictionary of localized keywords. Key is language code and localized list of keywords is the value.
	LastModifiedDate: string?, --- The date and time this item was last updated.
	Moderation: ModerationState?, --- The moderation state for this item.
	Platforms: {any}?, --- The platforms supported by this item.
	PriceOptions: CatalogPriceOptions?, --- The base price of this item.
	Rating: Rating?, --- Rating summary for this item.
	StartDate: string?, --- The date of when the item will be available. If not provided then the product will appear immediately.
	StoreDetails: StoreDetails?, --- Optional details for stores items.
	Tags: {any}?, --- The list of tags that are associated with this item.
	Title: {[any]: any}?, --- A dictionary of localized titles. Key is language code and localized string is the value. The neutral locale is required.
	Type: string?, --- The high-level type of the item. The following item types are supported: bundle, catalogItem, currency, store, ugc.
}

export type CatalogItemReference = {
	Amount: number?, --- The amount of the catalog item.
	Id: string?, --- The unique ID of the catalog item.
	PriceOptions: CatalogPriceOptions?, --- The prices the catalog item can be purchased for.
}

export type CatalogPrice = {
	Amounts: {CatalogPriceAmount}?, --- The amounts of the catalog item price.
}

export type CatalogPriceAmount = {
	Amount: number, --- The amount of the price.
	ItemId: string?, --- The Item Id of the price.
}

export type CatalogPriceAmountOverride = {
	FixedValue: number?, --- The exact value that should be utilized in the override.
	ItemId: string?, --- The id of the item this override should utilize.
	Multiplier: number?, --- The multiplier that will be applied to the base Catalog value to determine what value should be utilized in the override.
}

export type CatalogPriceOptions = {
	Prices: {CatalogPrice}?, --- Prices of the catalog item.
}

export type CatalogPriceOptionsOverride = {
	Prices: {CatalogPriceOverride}?, --- The prices utilized in the override.
}

export type CatalogPriceOverride = {
	Amounts: {CatalogPriceAmountOverride}?, --- The currency amounts utilized in the override for a singular price.
}

export type CatalogSpecificConfig = {
	ContentTypes: {any}?, --- The set of content types that will be used for validation.
	Tags: {any}?, --- The set of tags that will be used for validation.
}

export type ConcernCategory = 
	"None"
	| "OffensiveContent"
	| "ChildExploitation"
	| "MalwareOrVirus"
	| "PrivacyConcerns"
	| "MisleadingApp"
	| "PoorPerformance"
	| "ReviewResponse"
	| "SpamAdvertising"
	| "Profanity"

export type Content = {
	Id: string?, --- The content unique ID.
	MaxClientVersion: string?, --- The maximum client version that this content is compatible with.
	MinClientVersion: string?, --- The minimum client version that this content is compatible with.
	Tags: {any}?, --- The list of tags that are associated with this content.
	Type: string?, --- The client-defined type of the content.
	Url: string?, --- The Azure CDN URL for retrieval of the catalog item binary content.
}

export type ContentFeed = {
}

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

--- The item will not be published to the public catalog until the PublishItem API 
--- is called for the item. 
export type CreateDraftItemRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	Item: CatalogItem?, --- Metadata describing the new catalog item to be created.
	Publish: boolean, --- Whether the item should be published immediately.
}

export type CreateDraftItemResponse = {
	Item: CatalogItem?, --- Updated metadata describing the catalog item just created.
}

--- Upload URLs point to Azure Blobs; clients must follow the Microsoft Azure Storage 
--- Blob Service REST API pattern for uploading content. The response contains upload 
--- URLs and IDs for each file. The IDs and URLs returned must be added to the item 
--- metadata and committed using the CreateDraftItem or UpdateDraftItem Item APIs. 
export type CreateUploadUrlsRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	Files: {UploadInfo}?, --- Description of the files to be uploaded by the client.
}

export type CreateUploadUrlsResponse = {
	UploadUrls: {UploadUrlMetadata}?, --- List of URLs metadata for the files to be uploaded by the client.
}

export type DeepLink = {
	Platform: string?, --- Target platform for this deep link.
	Url: string?, --- The deep link for this platform.
}

export type DeepLinkFormat = {
	Format: string?, --- The format of the deep link to return. The format should contain '{id}' to represent where the item ID should be placed.
	Platform: string?, --- The target platform for the deep link.
}

export type DeleteEntityItemReviewsRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	Entity: EntityKey?, --- The entity to perform this action on.
}

export type DeleteEntityItemReviewsResponse = {
}

--- Delete an Inventory Collection by the specified Id for an Entity 
export type DeleteInventoryCollectionRequest = {
	CollectionId: string?, --- The inventory collection id the request applies to.
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	Entity: EntityKey?, --- The entity the request is about. Set to the caller by default.
}

export type DeleteInventoryCollectionResponse = {
}

export type DeleteInventoryItemsOperation = {
	Item: InventoryItemReference?, --- The inventory item the operation applies to.
}

--- Given an entity type, entity identifier and container details, will delete the 
--- entity's inventory items 
export type DeleteInventoryItemsRequest = {
	CollectionId: string?, --- The id of the entity's collection to perform this action on. (Default="default")
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	Entity: EntityKey?, --- The entity to perform this action on.
	IdempotencyId: string?, --- The Idempotency ID for this request.
	Item: InventoryItemReference?, --- The inventory item the request applies to.
}

export type DeleteInventoryItemsResponse = {
	IdempotencyId: string?, --- The idempotency id used in the request.
	TransactionIds: {any}?, --- The ids of transactions that occurred as a result of the request.
}

export type DeleteItemRequest = {
	AlternateId: CatalogAlternateId?, --- An alternate ID associated with this item.
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	Entity: EntityKey?, --- The entity to perform this action on.
	Id: string?, --- The unique ID of the item.
}

export type DeleteItemResponse = {
}

export type DisplayPropertyIndexInfo = {
	Name: string?, --- The property name in the 'DisplayProperties' property to be indexed.
	Type: string?, --- The type of the property to be indexed.
}

export type DisplayPropertyType = 
	"None"
	| "QueryDateTime"
	| "QueryDouble"
	| "QueryString"
	| "SearchString"

--- Combined entity type and ID structure which uniquely identifies a single entity. 
export type EntityKey = {
	Id: string, --- Unique ID of the entity.
	Type: string?, --- Entity type. See https://docs.microsoft.com/gaming/playfab/features/data/entities/available-built-in-entity-types
}

--- Execute a list of Inventory Operations for an Entity 
export type ExecuteInventoryOperationsRequest = {
	CollectionId: string?, --- The id of the entity's collection to perform this action on. (Default="default")
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	Entity: EntityKey?, --- The entity to perform this action on.
	IdempotencyId: string?, --- The Idempotency ID for this request.
	Operations: {InventoryOperation}?, --- The operations to run transactionally. The operations will be executed in-order sequentially and will succeed or fail as a batch.
}

export type ExecuteInventoryOperationsResponse = {
	IdempotencyId: string?, --- The idempotency id used in the request.
	TransactionIds: {any}?, --- The ids of the transactions that occurred as a result of the request.
}

export type FileConfig = {
	ContentTypes: {any}?, --- The set of content types that will be used for validation.
	Tags: {any}?, --- The set of tags that will be used for validation.
}

export type FilterOptions = {
	Filter: string?, --- The OData filter utilized. Mutually exclusive with 'IncludeAllItems'.
	IncludeAllItems: boolean?, --- The flag that overrides the filter and allows for returning all catalog items. Mutually exclusive with 'Filter'.
}

export type GetCatalogConfigRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
}

export type GetCatalogConfigResponse = {
	Config: CatalogConfig?, --- The catalog configuration.
}

export type GetDraftItemRequest = {
	AlternateId: CatalogAlternateId?, --- An alternate ID associated with this item.
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	Entity: EntityKey?, --- The entity to perform this action on.
	Id: string?, --- The unique ID of the item.
}

export type GetDraftItemResponse = {
	Item: CatalogItem?, --- Full metadata of the catalog item requested.
}

export type GetDraftItemsRequest = {
	AlternateIds: {CatalogAlternateId}?, --- List of item alternate IDs.
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	Entity: EntityKey?, --- The entity to perform this action on.
	Ids: {any}?, --- List of Item Ids.
}

export type GetDraftItemsResponse = {
	ContinuationToken: string?, --- An opaque token used to retrieve the next page of items, if any are available.
	Items: {CatalogItem}?, --- A set of items created by the entity.
}

export type GetEntityDraftItemsRequest = {
	ContinuationToken: string?, --- An opaque token used to retrieve the next page of items created by the caller, if any are available. Should be null on initial request.
	Count: number, --- Number of items to retrieve. Maximum page size is 10.
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	Entity: EntityKey?, --- The entity to perform this action on.
	Filter: string?, --- OData Filter to specify ItemType.
}

export type GetEntityDraftItemsResponse = {
	ContinuationToken: string?, --- An opaque token used to retrieve the next page of items, if any are available.
	Items: {CatalogItem}?, --- A set of items created by the entity.
}

export type GetEntityItemReviewRequest = {
	AlternateId: CatalogAlternateId?, --- An alternate ID associated with this item.
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	Entity: EntityKey?, --- The entity to perform this action on.
	Id: string?, --- The unique ID of the item.
}

export type GetEntityItemReviewResponse = {
	Review: Review?, --- The review the entity submitted for the requested item.
}

--- Get a list of Inventory Collection Ids for the specified Entity 
export type GetInventoryCollectionIdsRequest = {
	ContinuationToken: string?, --- An opaque token used to retrieve the next page of collection ids, if any are available.
	Count: number, --- Number of items to retrieve. (Default = 10)
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	Entity: EntityKey?, --- The entity the request is about. Set to the caller by default.
}

export type GetInventoryCollectionIdsResponse = {
	CollectionIds: {any}?, --- The requested inventory collection ids.
	ContinuationToken: string?, --- An opaque token used to retrieve the next page of collection ids, if any are available.
}

--- Given an entity type, entity identifier and container details, will get the 
--- entity's inventory items.  
export type GetInventoryItemsRequest = {
	CollectionId: string?, --- The id of the entity's collection to perform this action on. (Default="default")
	ContinuationToken: string?, --- An opaque token used to retrieve the next page of items in the inventory, if any are available. Should be null on initial request.
	Count: number, --- Number of items to retrieve. Maximum page size is 50. (Default=10)
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	Entity: EntityKey?, --- The entity to perform this action on.
	Filter: string?, --- The filters to limit what is returned to the client.
}

export type GetInventoryItemsResponse = {
	ContinuationToken: string?, --- An opaque token used to retrieve the next page of items, if any are available.
	Items: {InventoryItem}?, --- The requested inventory items.
}

--- Given an item, return a set of bundles and stores containing the item. 
export type GetItemContainersRequest = {
	AlternateId: CatalogAlternateId?, --- An alternate ID associated with this item.
	ContinuationToken: string?, --- An opaque token used to retrieve the next page of items in the inventory, if any are available. Should be null on initial request.
	Count: number, --- Number of items to retrieve. Maximum page size is 25.
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	Entity: EntityKey?, --- The entity to perform this action on.
	Id: string?, --- The unique ID of the item.
}

export type GetItemContainersResponse = {
	Containers: {CatalogItem}?, --- List of Bundles and Stores containing the requested items.
	ContinuationToken: string?, --- An opaque token used to retrieve the next page of items, if any are available.
}

export type GetItemModerationStateRequest = {
	AlternateId: CatalogAlternateId?, --- An alternate ID associated with this item.
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	Id: string?, --- The unique ID of the item.
}

export type GetItemModerationStateResponse = {
	State: ModerationState?, --- The current moderation state for the requested item.
}

export type GetItemPublishStatusRequest = {
	AlternateId: CatalogAlternateId?, --- An alternate ID associated with this item.
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	Entity: EntityKey?, --- The entity to perform this action on.
	Id: string?, --- The unique ID of the item.
}

export type GetItemPublishStatusResponse = {
	Result: string?, --- High level status of the published item.
	StatusMessage: string?, --- Descriptive message about the current status of the publish.
}

export type GetItemRequest = {
	AlternateId: CatalogAlternateId?, --- An alternate ID associated with this item.
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	Entity: EntityKey?, --- The entity to perform this action on.
	Id: string?, --- The unique ID of the item.
}

--- Get item result. 
export type GetItemResponse = {
	Item: CatalogItem?, --- The item result.
}

export type GetItemReviewSummaryRequest = {
	AlternateId: CatalogAlternateId?, --- An alternate ID associated with this item.
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	Id: string?, --- The unique ID of the item.
}

export type GetItemReviewSummaryResponse = {
	LeastFavorableReview: Review?, --- The least favorable review for this item.
	MostFavorableReview: Review?, --- The most favorable review for this item.
	Rating: Rating?, --- The summary of ratings associated with this item.
	ReviewsCount: number, --- The total number of reviews associated with this item.
}

export type GetItemReviewsRequest = {
	AlternateId: CatalogAlternateId?, --- An alternate ID associated with this item.
	ContinuationToken: string?, --- An opaque token used to retrieve the next page of items, if any are available.
	Count: number, --- Number of items to retrieve. Maximum page size is 200. If not specified, defaults to 10.
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	Id: string?, --- The unique ID of the item.
	OrderBy: string?, --- An OData orderBy used to order the results of the query.
}

export type GetItemReviewsResponse = {
	ContinuationToken: string?, --- An opaque token used to retrieve the next page of items, if any are available.
	Reviews: {Review}?, --- The paginated set of results.
}

export type GetItemsRequest = {
	AlternateIds: {CatalogAlternateId}?, --- List of item alternate IDs.
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	Entity: EntityKey?, --- The entity to perform this action on.
	Ids: {any}?, --- List of Item Ids.
}

export type GetItemsResponse = {
	Items: {CatalogItem}?, --- Metadata of set of items.
}

--- Gets the access tokens for Microsoft Store authentication. 
export type GetMicrosoftStoreAccessTokensRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
}

export type GetMicrosoftStoreAccessTokensResponse = {
	CollectionsAccessToken: string?, --- The collections access token for calling https://onestore.microsoft.com/b2b/keys/create/collections to obtain a CollectionsIdKey for the user
	CollectionsAccessTokenExpirationDate: string, --- The date the collections access token expires
}

export type GooglePlayProductPurchase = {
	ProductId: string?, --- The Product ID (SKU) of the InApp product purchased from the Google Play store.
	Token: string?, --- The token provided to the player's device when the product was purchased
}

export type HelpfulnessVote = 
	"None"
	| "UnHelpful"
	| "Helpful"

export type Image = {
	Id: string?, --- The image unique ID.
	Tag: string?, --- The client-defined tag associated with this image.
	Type: string?, --- The client-defined type of this image.
	Url: string?, --- The URL for retrieval of the image.
}

export type ImageConfig = {
	Tags: {any}?, --- The set of tags that will be used for validation.
}

export type InventoryItem = {
	Amount: number, --- The amount of the item.
	Id: string?, --- The id of the item. This should correspond to the item id in the catalog.
	StackId: string?, --- The stack id of the item.
	Type: string?, --- The type of the item. This should correspond to the item type in the catalog.
}

export type InventoryItemReference = {
	AlternateId: AlternateId?, --- The inventory item alternate id the request applies to.
	Id: string?, --- The inventory item id the request applies to.
	StackId: string?, --- The inventory stack id the request should redeem to. (Default="default")
}

export type InventoryOperation = {
	Add: AddInventoryItemsOperation?, --- The add operation.
	Delete: DeleteInventoryItemsOperation?, --- The delete operation.
	Purchase: PurchaseInventoryItemsOperation?, --- The purchase operation.
	Subtract: SubtractInventoryItemsOperation?, --- The subtract operation.
	Transfer: TransferInventoryItemsOperation?, --- The transfer operation.
	Update: UpdateInventoryItemsOperation?, --- The update operation.
}

export type KeywordSet = {
	Values: {any}?, --- A list of localized keywords.
}

export type ModerationState = {
	LastModifiedDate: string?, --- The date and time this moderation state was last updated.
	Reason: string?, --- The current stated reason for the associated item being moderated.
	Status: string?, --- The current moderation status for the associated item.
}

export type ModerationStatus = 
	"Unknown"
	| "AwaitingModeration"
	| "Approved"
	| "Rejected"

export type PayoutDetails = {
}

--- The call kicks off a workflow to publish the item to the public catalog. The 
--- Publish Status API should be used to monitor the publish job. 
export type PublishDraftItemRequest = {
	AlternateId: CatalogAlternateId?, --- An alternate ID associated with this item.
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	ETag: string?, --- ETag of the catalog item to published from the working catalog to the public catalog. Used for optimistic concurrency. If the provided ETag does not match the ETag in the current working catalog, the request will be rejected. If not provided, the current version of the document in the working catalog will be published.
	Entity: EntityKey?, --- The entity to perform this action on.
	Id: string?, --- The unique ID of the item.
}

export type PublishDraftItemResponse = {
}

export type PublishResult = 
	"Unknown"
	| "Pending"
	| "Succeeded"
	| "Failed"
	| "Canceled"

export type PurchaseInventoryItemsOperation = {
	Amount: number, --- The amount to purchase.
	DeleteEmptyStacks: boolean, --- Indicates whether stacks reduced to an amount of 0 during the operation should be deleted from the inventory. (Default = false)
	Item: InventoryItemReference?, --- The inventory item the operation applies to.
	PriceAmounts: {PurchasePriceAmount}?, --- The per-item price the item is expected to be purchased at. This must match a value configured in the Catalog or specified Store.
	StoreId: string?, --- The id of the Store to purchase the item from.
}

--- Purchase a single item or bundle, paying the associated price. 
export type PurchaseInventoryItemsRequest = {
	Amount: number, --- The amount to purchase.
	CollectionId: string?, --- The id of the entity's collection to perform this action on. (Default="default")
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	DeleteEmptyStacks: boolean, --- Indicates whether stacks reduced to an amount of 0 during the request should be deleted from the inventory. (Default=false)
	Entity: EntityKey?, --- The entity to perform this action on.
	IdempotencyId: string?, --- The Idempotency ID for this request.
	Item: InventoryItemReference?, --- The inventory item the request applies to.
	PriceAmounts: {PurchasePriceAmount}?, --- The per-item price the item is expected to be purchased at. This must match a value configured in the Catalog or specified Store. 
	StoreId: string?, --- The id of the Store to purchase the item from.
}

export type PurchaseInventoryItemsResponse = {
	IdempotencyId: string?, --- The idempotency id used in the request.
	TransactionIds: {any}?, --- The ids of transactions that occurred as a result of the request.
}

export type PurchaseOverride = {
}

export type PurchasePriceAmount = {
	Amount: number, --- The amount of the inventory item to use in the purchase .
	ItemId: string?, --- The inventory item id to use in the purchase .
	StackId: string?, --- The inventory stack id the to use in the purchase. Set to "default" by default
}

export type Rating = {
	Average: number?, --- The average rating for this item.
	Count1Star: number?, --- The total count of 1 star ratings for this item.
	Count2Star: number?, --- The total count of 2 star ratings for this item.
	Count3Star: number?, --- The total count of 3 star ratings for this item.
	Count4Star: number?, --- The total count of 4 star ratings for this item.
	Count5Star: number?, --- The total count of 5 star ratings for this item.
	TotalCount: number?, --- The total count of ratings for this item.
}

--- Redeem items from the Apple App Store. 
export type RedeemAppleAppStoreInventoryItemsRequest = {
	CollectionId: string?, --- The id of the entity's collection to perform this action on. (Default="default")
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	Entity: EntityKey?, --- The entity to perform this action on.
	Receipt: string?, --- The receipt provided by the Apple marketplace upon successful purchase.
}

export type RedeemAppleAppStoreInventoryItemsResponse = {
	Failed: {RedemptionFailure}?, --- The list of failed redemptions from the external marketplace.
	Succeeded: {RedemptionSuccess}?, --- The list of successful redemptions from the external marketplace.
	TransactionIds: {any}?, --- The Transaction IDs associated with the inventory modifications
}

--- Redeem items from the Google Play Store. 
export type RedeemGooglePlayInventoryItemsRequest = {
	CollectionId: string?, --- The id of the entity's collection to perform this action on. (Default="default")
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	Entity: EntityKey?, --- The entity to perform this action on.
	Purchases: {GooglePlayProductPurchase}?, --- The list of purchases to redeem
}

export type RedeemGooglePlayInventoryItemsResponse = {
	Failed: {RedemptionFailure}?, --- The list of failed redemptions from the external marketplace.
	Succeeded: {RedemptionSuccess}?, --- The list of successful redemptions from the external marketplace.
	TransactionIds: {any}?, --- The Transaction IDs associated with the inventory modifications
}

--- Redeem items from the Microsoft Store. 
export type RedeemMicrosoftStoreInventoryItemsRequest = {
	CollectionId: string?, --- The id of the entity's collection to perform this action on. (Default="default")
	CollectionsIdKey: string?, --- The OneStore Collections Id Key used for AAD authentication.
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	Entity: EntityKey?, --- The entity to perform this action on.
	XboxToken: string?, --- Xbox Token used for delegated business partner authentication.
}

export type RedeemMicrosoftStoreInventoryItemsResponse = {
	Failed: {RedemptionFailure}?, --- The list of failed redemptions from the external marketplace.
	Succeeded: {RedemptionSuccess}?, --- The list of successful redemptions from the external marketplace.
	TransactionIds: {any}?, --- The Transaction IDs associated with the inventory modifications
}

--- Redeem items from the Nintendo EShop. 
export type RedeemNintendoEShopInventoryItemsRequest = {
	CollectionId: string?, --- The id of the entity's collection to perform this action on. (Default="default")
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	Entity: EntityKey?, --- The entity to perform this action on.
	NintendoServiceAccountIdToken: string?, --- The Nintendo provided token authorizing redemption
}

export type RedeemNintendoEShopInventoryItemsResponse = {
	Failed: {RedemptionFailure}?, --- The list of failed redemptions from the external marketplace.
	Succeeded: {RedemptionSuccess}?, --- The list of successful redemptions from the external marketplace.
	TransactionIds: {any}?, --- The Transaction IDs associated with the inventory modifications
}

--- Redeem items from the PlayStation Store. 
export type RedeemPlayStationStoreInventoryItemsRequest = {
	AuthorizationCode: string?, --- Authorization code provided by the PlayStation OAuth provider.
	CollectionId: string?, --- The id of the entity's collection to perform this action on. (Default="default")
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	Entity: EntityKey?, --- The entity to perform this action on.
	ServiceLabel: string?, --- Optional Service Label to pass into the request.
}

export type RedeemPlayStationStoreInventoryItemsResponse = {
	Failed: {RedemptionFailure}?, --- The list of failed redemptions from the external marketplace.
	Succeeded: {RedemptionSuccess}?, --- The list of successful redemptions from the external marketplace.
	TransactionIds: {any}?, --- The Transaction IDs associated with the inventory modifications
}

--- Redeem inventory items from Steam. 
export type RedeemSteamInventoryItemsRequest = {
	CollectionId: string?, --- The id of the entity's collection to perform this action on. (Default="default")
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	Entity: EntityKey?, --- The entity to perform this action on.
}

export type RedeemSteamInventoryItemsResponse = {
	Failed: {RedemptionFailure}?, --- The list of failed redemptions from the external marketplace.
	Succeeded: {RedemptionSuccess}?, --- The list of successful redemptions from the external marketplace.
	TransactionIds: {any}?, --- The Transaction IDs associated with the inventory modifications
}

export type RedemptionFailure = {
	FailureCode: string?, --- The marketplace failure code.
	FailureDetails: string?, --- The marketplace error details explaining why the offer failed to redeem.
	MarketplaceTransactionId: string?, --- The transaction id in the external marketplace.
	OfferId: string?, --- The ID of the offer being redeemed.
}

export type RedemptionSuccess = {
	MarketplaceTransactionId: string?, --- The transaction id in the external marketplace.
	OfferId: string?, --- The ID of the offer being redeemed.
	SuccessTimestamp: string, --- The timestamp for when the redeem was completed.
}

export type ReportItemRequest = {
	AlternateId: CatalogAlternateId?, --- An alternate ID associated with this item.
	ConcernCategory: string?, --- Category of concern for this report.
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	Entity: EntityKey?, --- The entity to perform this action on.
	Id: string?, --- The unique ID of the item.
	Reason: string?, --- The string reason for this report.
}

export type ReportItemResponse = {
}

--- Submit a report for an inappropriate review, allowing the submitting user to 
--- specify their concern. 
export type ReportItemReviewRequest = {
	AlternateId: CatalogAlternateId?, --- An alternate ID of the item associated with the review.
	ConcernCategory: string?, --- The reason this review is being reported.
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	Entity: EntityKey?, --- The entity to perform this action on.
	ItemId: string?, --- The string ID of the item associated with the review.
	Reason: string?, --- The string reason for this report.
	ReviewId: string?, --- The ID of the review to submit a report for.
}

export type ReportItemReviewResponse = {
}

export type Review = {
	HelpfulNegative: number, --- The number of negative helpfulness votes for this review.
	HelpfulPositive: number, --- The number of positive helpfulness votes for this review.
	IsInstalled: boolean, --- Indicates whether the review author has the item installed.
	ItemId: string?, --- The ID of the item being reviewed.
	ItemVersion: string?, --- The version of the item being reviewed.
	Locale: string?, --- The locale for which this review was submitted in.
	Rating: number, --- Star rating associated with this review.
	ReviewId: string?, --- The ID of the review.
	ReviewText: string?, --- The full text of this review.
	ReviewerEntity: EntityKey?, --- The ID of the author of the review.
	ReviewerId: string?, --- Deprecated. Use ReviewerEntity instead. This property will be removed in a future release.
	Submitted: string, --- The date and time this review was last submitted.
	Title: string?, --- The title of this review.
}

export type ReviewItemRequest = {
	AlternateId: CatalogAlternateId?, --- An alternate ID associated with this item.
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	Entity: EntityKey?, --- The entity to perform this action on.
	Id: string?, --- The unique ID of the item.
	Review: Review?, --- The review to submit.
}

export type ReviewItemResponse = {
}

export type ReviewTakedown = {
	AlternateId: CatalogAlternateId?, --- An alternate ID associated with this item.
	ItemId: string?, --- The ID of the item associated with the review to take down.
	ReviewId: string?, --- The ID of the review to take down.
}

export type ScanResult = {
	Url: string?, --- The URL of the item which failed the scan.
}

export type SearchItemsRequest = {
	ContinuationToken: string?, --- An opaque token used to retrieve the next page of items, if any are available.
	Count: number, --- Number of items to retrieve. Maximum page size is 225. Default value is 10.
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	Entity: EntityKey?, --- The entity to perform this action on.
	Filter: string?, --- An OData filter used to refine the search query.
	OrderBy: string?, --- An OData orderBy used to order the results of the search query.
	Search: string?, --- The text to search for.
	Select: string?, --- An OData select query option used to augment the search results. If not defined, the default search result metadata will be returned.
	Store: StoreReference?, --- The store to restrict the search request to.
}

export type SearchItemsResponse = {
	ContinuationToken: string?, --- An opaque token used to retrieve the next page of items, if any are available.
	Items: {CatalogItem}?, --- The paginated set of results for the search query.
}

export type SetItemModerationStateRequest = {
	AlternateId: CatalogAlternateId?, --- An alternate ID associated with this item.
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	Id: string?, --- The unique ID of the item.
	Reason: string?, --- The reason for the moderation state change for the associated item.
	Status: string?, --- The status to set for the associated item.
}

export type SetItemModerationStateResponse = {
}

export type StoreDetails = {
	FilterOptions: FilterOptions?, --- The options for the filter in filter-based stores. These options are mutually exclusive with item references.
	PriceOptionsOverride: CatalogPriceOptionsOverride?, --- The global prices utilized in the store. These options are mutually exclusive with price options in item references.
}

export type StoreReference = {
	AlternateId: CatalogAlternateId?, --- An alternate ID of the store.
	Id: string?, --- The unique ID of the store.
}

export type SubmitItemReviewVoteRequest = {
	AlternateId: CatalogAlternateId?, --- An alternate ID of the item associated with the review.
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	Entity: EntityKey?, --- The entity to perform this action on.
	ItemId: string?, --- The string ID of the item associated with the review.
	ReviewId: string?, --- The ID of the review to submit a helpfulness vote for.
	Vote: string?, --- The helpfulness vote of the review.
}

export type SubmitItemReviewVoteResponse = {
}

export type SubscriptionDetails = {
	DurationInSeconds: number, --- The length of time that the subscription will last in seconds.
}

export type SubtractInventoryItemsOperation = {
	Amount: number, --- The amount to subtract from the current item amount.
	DeleteEmptyStacks: boolean, --- Indicates whether stacks reduced to an amount of 0 during the request should be deleted from the inventory. (Default = false).
	Item: InventoryItemReference?, --- The inventory item the operation applies to.
}

--- Given an entity type, entity identifier and container details, will subtract 
--- the specified inventory items.  
export type SubtractInventoryItemsRequest = {
	Amount: number, --- The amount to add for the current item.
	CollectionId: string?, --- The id of the entity's collection to perform this action on. (Default="default")
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	DeleteEmptyStacks: boolean, --- Indicates whether stacks reduced to an amount of 0 during the request should be deleted from the inventory. (Default=false)
	Entity: EntityKey?, --- The entity to perform this action on.
	IdempotencyId: string?, --- The Idempotency ID for this request.
	Item: InventoryItemReference?, --- The inventory item the request applies to.
}

export type SubtractInventoryItemsResponse = {
	IdempotencyId: string?, --- The idempotency id used in the request.
	TransactionIds: {any}?, --- The ids of transactions that occurred as a result of the request.
}

--- Submit a request to takedown one or more reviews, removing them from public 
--- view. Authors will still be able to see their reviews after being taken down. 
export type TakedownItemReviewsRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	Reviews: {ReviewTakedown}?, --- The set of reviews to take down.
}

export type TakedownItemReviewsResponse = {
}

export type TransferInventoryItemsOperation = {
	Amount: number, --- The amount to transfer.
	DeleteEmptyStacks: boolean, --- Indicates whether stacks reduced to an amount of 0 during the operation should be deleted from the inventory. (Default = false)
	GivingItem: InventoryItemReference?, --- The inventory item the operation is transferring from.
	ReceivingItem: InventoryItemReference?, --- The inventory item the operation is transferring to.
}

--- Transfer the specified inventory items of an entity's container Id to another 
--- entity's container Id. 
export type TransferInventoryItemsRequest = {
	Amount: number, --- The amount to transfer .
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	DeleteEmptyStacks: boolean, --- Indicates whether stacks reduced to an amount of 0 during the request should be deleted from the inventory. (Default = false)
	GivingCollectionId: string?, --- The inventory collection id the request is transferring from. (Default="default")
	GivingEntity: EntityKey?, --- The entity the request is transferring from. Set to the caller by default.
	GivingItem: InventoryItemReference?, --- The inventory item the request is transferring from.
	IdempotencyId: string?, --- The idempotency id for the request.
	ReceivingCollectionId: string?, --- The inventory collection id the request is transferring to. (Default="default")
	ReceivingEntity: EntityKey?, --- The entity the request is transferring to. Set to the caller by default.
	ReceivingItem: InventoryItemReference?, --- The inventory item the request is transferring to.
}

export type TransferInventoryItemsResponse = {
	GivingTransactionIds: {any}?, --- The ids of transactions that occurred as a result of the request's giving action.
	IdempotencyId: string?, --- The idempotency id for the request.
	ReceivingTransactionIds: {any}?, --- The ids of transactions that occurred as a result of the request's receiving action.
}

export type UpdateCatalogConfigRequest = {
	Config: CatalogConfig?, --- The updated catalog configuration.
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
}

export type UpdateCatalogConfigResponse = {
}

export type UpdateDraftItemRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	Item: CatalogItem?, --- Updated metadata describing the catalog item to be updated.
	Publish: boolean, --- Whether the item should be published immediately.
}

export type UpdateDraftItemResponse = {
	Item: CatalogItem?, --- Updated metadata describing the catalog item just updated.
}

export type UpdateInventoryItemsOperation = {
	Item: InventoryItem?, --- The inventory item to update with the specified values.
}

--- Given an entity type, entity identifier and container details, will update the 
--- entity's inventory items 
export type UpdateInventoryItemsRequest = {
	CollectionId: string?, --- The id of the entity's collection to perform this action on. (Default="default")
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	Entity: EntityKey?, --- The entity to perform this action on.
	IdempotencyId: string?, --- The Idempotency ID for this request.
	Item: InventoryItem?, --- The inventory item to update with the specified values.
}

export type UpdateInventoryItemsResponse = {
	IdempotencyId: string?, --- The idempotency id used in the request.
	TransactionIds: {any}?, --- The ids of transactions that occurred as a result of the request.
}

export type UploadInfo = {
	FileName: string?, --- Name of the file to be uploaded.
}

export type UploadUrlMetadata = {
	FileName: string?, --- Name of the file for which this upload URL was requested.
	Id: string?, --- Unique ID for the binary content to be uploaded to the target URL.
	Url: string?, --- URL for the binary content to be uploaded to.
}

export type UserGeneratedContentSpecificConfig = {
	ContentTypes: {any}?, --- The set of content types that will be used for validation.
	Tags: {any}?, --- The set of tags that will be used for validation.
}


--- The item will not be published to the public catalog until the PublishItem API 
--- is called for the item. 
---
--- https://docs.microsoft.com/rest/api/playfab/economy/catalog/createdraftitem
function EconomyApi.CreateDraftItemAsync(
	entityToken: string, 
	request: CreateDraftItemRequest
): CreateDraftItemResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Economy/CreateDraftItem",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Upload URLs point to Azure Blobs; clients must follow the Microsoft Azure Storage 
--- Blob Service REST API pattern for uploading content. The response contains upload 
--- URLs and IDs for each file. The IDs and URLs returned must be added to the item 
--- metadata and committed using the CreateDraftItem or UpdateDraftItem Item APIs. 
---
--- https://docs.microsoft.com/rest/api/playfab/economy/catalog/createuploadurls
function EconomyApi.CreateUploadUrlsAsync(
	entityToken: string, 
	request: CreateUploadUrlsRequest
): CreateUploadUrlsResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Economy/CreateUploadUrls",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/economy/catalog/deleteentityitemreviews
function EconomyApi.DeleteEntityItemReviewsAsync(
	entityToken: string, 
	request: DeleteEntityItemReviewsRequest
): DeleteEntityItemReviewsResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Economy/DeleteEntityItemReviews",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/economy/catalog/deleteitem
function EconomyApi.DeleteItemAsync(
	entityToken: string, 
	request: DeleteItemRequest
): DeleteItemResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Economy/DeleteItem",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/economy/catalog/getcatalogconfig
function EconomyApi.GetCatalogConfigAsync(
	entityToken: string, 
	request: GetCatalogConfigRequest
): GetCatalogConfigResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Economy/GetCatalogConfig",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/economy/catalog/getdraftitem
function EconomyApi.GetDraftItemAsync(
	entityToken: string, 
	request: GetDraftItemRequest
): GetDraftItemResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Economy/GetDraftItem",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/economy/catalog/getdraftitems
function EconomyApi.GetDraftItemsAsync(
	entityToken: string, 
	request: GetDraftItemsRequest
): GetDraftItemsResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Economy/GetDraftItems",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/economy/catalog/getentitydraftitems
function EconomyApi.GetEntityDraftItemsAsync(
	entityToken: string, 
	request: GetEntityDraftItemsRequest
): GetEntityDraftItemsResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Economy/GetEntityDraftItems",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/economy/catalog/getentityitemreview
function EconomyApi.GetEntityItemReviewAsync(
	entityToken: string, 
	request: GetEntityItemReviewRequest
): GetEntityItemReviewResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Economy/GetEntityItemReview",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/economy/catalog/getitem
function EconomyApi.GetItemAsync(
	entityToken: string, 
	request: GetItemRequest
): GetItemResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Economy/GetItem",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Given an item, return a set of bundles and stores containing the item. 
---
--- https://docs.microsoft.com/rest/api/playfab/economy/catalog/getitemcontainers
function EconomyApi.GetItemContainersAsync(
	entityToken: string, 
	request: GetItemContainersRequest
): GetItemContainersResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Economy/GetItemContainers",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/economy/catalog/getitemmoderationstate
function EconomyApi.GetItemModerationStateAsync(
	entityToken: string, 
	request: GetItemModerationStateRequest
): GetItemModerationStateResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Economy/GetItemModerationState",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/economy/catalog/getitempublishstatus
function EconomyApi.GetItemPublishStatusAsync(
	entityToken: string, 
	request: GetItemPublishStatusRequest
): GetItemPublishStatusResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Economy/GetItemPublishStatus",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/economy/catalog/getitemreviewsummary
function EconomyApi.GetItemReviewSummaryAsync(
	entityToken: string, 
	request: GetItemReviewSummaryRequest
): GetItemReviewSummaryResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Economy/GetItemReviewSummary",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/economy/catalog/getitemreviews
function EconomyApi.GetItemReviewsAsync(
	entityToken: string, 
	request: GetItemReviewsRequest
): GetItemReviewsResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Economy/GetItemReviews",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/economy/catalog/getitems
function EconomyApi.GetItemsAsync(
	entityToken: string, 
	request: GetItemsRequest
): GetItemsResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Economy/GetItems",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- The call kicks off a workflow to publish the item to the public catalog. The 
--- Publish Status API should be used to monitor the publish job. 
---
--- https://docs.microsoft.com/rest/api/playfab/economy/catalog/publishdraftitem
function EconomyApi.PublishDraftItemAsync(
	entityToken: string, 
	request: PublishDraftItemRequest
): PublishDraftItemResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Economy/PublishDraftItem",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/economy/catalog/reportitem
function EconomyApi.ReportItemAsync(
	entityToken: string, 
	request: ReportItemRequest
): ReportItemResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Economy/ReportItem",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Submit a report for an inappropriate review, allowing the submitting user to 
--- specify their concern. 
---
--- https://docs.microsoft.com/rest/api/playfab/economy/catalog/reportitemreview
function EconomyApi.ReportItemReviewAsync(
	entityToken: string, 
	request: ReportItemReviewRequest
): ReportItemReviewResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Economy/ReportItemReview",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/economy/catalog/reviewitem
function EconomyApi.ReviewItemAsync(
	entityToken: string, 
	request: ReviewItemRequest
): ReviewItemResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Economy/ReviewItem",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/economy/catalog/searchitems
function EconomyApi.SearchItemsAsync(
	entityToken: string, 
	request: SearchItemsRequest
): SearchItemsResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Economy/SearchItems",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/economy/catalog/setitemmoderationstate
function EconomyApi.SetItemModerationStateAsync(
	entityToken: string, 
	request: SetItemModerationStateRequest
): SetItemModerationStateResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Economy/SetItemModerationState",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/economy/catalog/submititemreviewvote
function EconomyApi.SubmitItemReviewVoteAsync(
	entityToken: string, 
	request: SubmitItemReviewVoteRequest
): SubmitItemReviewVoteResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Economy/SubmitItemReviewVote",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Submit a request to takedown one or more reviews, removing them from public 
--- view. Authors will still be able to see their reviews after being taken down. 
---
--- https://docs.microsoft.com/rest/api/playfab/economy/catalog/takedownitemreviews
function EconomyApi.TakedownItemReviewsAsync(
	entityToken: string, 
	request: TakedownItemReviewsRequest
): TakedownItemReviewsResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Economy/TakedownItemReviews",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/economy/catalog/updatecatalogconfig
function EconomyApi.UpdateCatalogConfigAsync(
	entityToken: string, 
	request: UpdateCatalogConfigRequest
): UpdateCatalogConfigResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Economy/UpdateCatalogConfig",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/economy/catalog/updatedraftitem
function EconomyApi.UpdateDraftItemAsync(
	entityToken: string, 
	request: UpdateDraftItemRequest
): UpdateDraftItemResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Economy/UpdateDraftItem",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Given an entity type, entity identifier and container details, will add the 
--- specified inventory items. 
---
--- https://docs.microsoft.com/rest/api/playfab/economy/inventory/addinventoryitems
function EconomyApi.AddInventoryItemsAsync(
	entityToken: string, 
	request: AddInventoryItemsRequest
): AddInventoryItemsResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Economy/AddInventoryItems",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Delete an Inventory Collection by the specified Id for an Entity 
---
--- https://docs.microsoft.com/rest/api/playfab/economy/inventory/deleteinventorycollection
function EconomyApi.DeleteInventoryCollectionAsync(
	entityToken: string, 
	request: DeleteInventoryCollectionRequest
): DeleteInventoryCollectionResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Economy/DeleteInventoryCollection",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Given an entity type, entity identifier and container details, will delete the 
--- entity's inventory items 
---
--- https://docs.microsoft.com/rest/api/playfab/economy/inventory/deleteinventoryitems
function EconomyApi.DeleteInventoryItemsAsync(
	entityToken: string, 
	request: DeleteInventoryItemsRequest
): DeleteInventoryItemsResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Economy/DeleteInventoryItems",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Execute a list of Inventory Operations for an Entity 
---
--- https://docs.microsoft.com/rest/api/playfab/economy/inventory/executeinventoryoperations
function EconomyApi.ExecuteInventoryOperationsAsync(
	entityToken: string, 
	request: ExecuteInventoryOperationsRequest
): ExecuteInventoryOperationsResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Economy/ExecuteInventoryOperations",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Get a list of Inventory Collection Ids for the specified Entity 
---
--- https://docs.microsoft.com/rest/api/playfab/economy/inventory/getinventorycollectionids
function EconomyApi.GetInventoryCollectionIdsAsync(
	entityToken: string, 
	request: GetInventoryCollectionIdsRequest
): GetInventoryCollectionIdsResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Economy/GetInventoryCollectionIds",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Given an entity type, entity identifier and container details, will get the 
--- entity's inventory items.  
---
--- https://docs.microsoft.com/rest/api/playfab/economy/inventory/getinventoryitems
function EconomyApi.GetInventoryItemsAsync(
	entityToken: string, 
	request: GetInventoryItemsRequest
): GetInventoryItemsResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Economy/GetInventoryItems",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Gets the access tokens for Microsoft Store authentication. 
---
--- https://docs.microsoft.com/rest/api/playfab/economy/inventory/getmicrosoftstoreaccesstokens
function EconomyApi.GetMicrosoftStoreAccessTokensAsync(
	entityToken: string, 
	request: GetMicrosoftStoreAccessTokensRequest
): GetMicrosoftStoreAccessTokensResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Economy/GetMicrosoftStoreAccessTokens",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Purchase a single item or bundle, paying the associated price. 
---
--- https://docs.microsoft.com/rest/api/playfab/economy/inventory/purchaseinventoryitems
function EconomyApi.PurchaseInventoryItemsAsync(
	entityToken: string, 
	request: PurchaseInventoryItemsRequest
): PurchaseInventoryItemsResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Economy/PurchaseInventoryItems",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Redeem items from the Apple App Store. 
---
--- https://docs.microsoft.com/rest/api/playfab/economy/inventory/redeemappleappstoreinventoryitems
function EconomyApi.RedeemAppleAppStoreInventoryItemsAsync(
	entityToken: string, 
	request: RedeemAppleAppStoreInventoryItemsRequest
): RedeemAppleAppStoreInventoryItemsResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Economy/RedeemAppleAppStoreInventoryItems",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Redeem items from the Google Play Store. 
---
--- https://docs.microsoft.com/rest/api/playfab/economy/inventory/redeemgoogleplayinventoryitems
function EconomyApi.RedeemGooglePlayInventoryItemsAsync(
	entityToken: string, 
	request: RedeemGooglePlayInventoryItemsRequest
): RedeemGooglePlayInventoryItemsResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Economy/RedeemGooglePlayInventoryItems",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Redeem items from the Microsoft Store. 
---
--- https://docs.microsoft.com/rest/api/playfab/economy/inventory/redeemmicrosoftstoreinventoryitems
function EconomyApi.RedeemMicrosoftStoreInventoryItemsAsync(
	entityToken: string, 
	request: RedeemMicrosoftStoreInventoryItemsRequest
): RedeemMicrosoftStoreInventoryItemsResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Economy/RedeemMicrosoftStoreInventoryItems",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Redeem items from the Nintendo EShop. 
---
--- https://docs.microsoft.com/rest/api/playfab/economy/inventory/redeemnintendoeshopinventoryitems
function EconomyApi.RedeemNintendoEShopInventoryItemsAsync(
	entityToken: string, 
	request: RedeemNintendoEShopInventoryItemsRequest
): RedeemNintendoEShopInventoryItemsResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Economy/RedeemNintendoEShopInventoryItems",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Redeem items from the PlayStation Store. 
---
--- https://docs.microsoft.com/rest/api/playfab/economy/inventory/redeemplaystationstoreinventoryitems
function EconomyApi.RedeemPlayStationStoreInventoryItemsAsync(
	entityToken: string, 
	request: RedeemPlayStationStoreInventoryItemsRequest
): RedeemPlayStationStoreInventoryItemsResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Economy/RedeemPlayStationStoreInventoryItems",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Redeem inventory items from Steam. 
---
--- https://docs.microsoft.com/rest/api/playfab/economy/inventory/redeemsteaminventoryitems
function EconomyApi.RedeemSteamInventoryItemsAsync(
	entityToken: string, 
	request: RedeemSteamInventoryItemsRequest
): RedeemSteamInventoryItemsResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Economy/RedeemSteamInventoryItems",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Given an entity type, entity identifier and container details, will subtract 
--- the specified inventory items.  
---
--- https://docs.microsoft.com/rest/api/playfab/economy/inventory/subtractinventoryitems
function EconomyApi.SubtractInventoryItemsAsync(
	entityToken: string, 
	request: SubtractInventoryItemsRequest
): SubtractInventoryItemsResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Economy/SubtractInventoryItems",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Transfer the specified inventory items of an entity's container Id to another 
--- entity's container Id. 
---
--- https://docs.microsoft.com/rest/api/playfab/economy/inventory/transferinventoryitems
function EconomyApi.TransferInventoryItemsAsync(
	entityToken: string, 
	request: TransferInventoryItemsRequest
): TransferInventoryItemsResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Economy/TransferInventoryItems",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Given an entity type, entity identifier and container details, will update the 
--- entity's inventory items 
---
--- https://docs.microsoft.com/rest/api/playfab/economy/inventory/updateinventoryitems
function EconomyApi.UpdateInventoryItemsAsync(
	entityToken: string, 
	request: UpdateInventoryItemsRequest
): UpdateInventoryItemsResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Economy/UpdateInventoryItems",
		request,
		"X-EntityToken",
		entityToken
	)
end

return EconomyApi

