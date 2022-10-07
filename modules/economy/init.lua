--!strict
--[=[
	# EconomyApi

	API methods for managing the catalog. Inventory manages in-game assets for any 
	given entity. 

	API Version: 1.220926.6
]=]

local PlayFabInternal = require(script.Parent.PlayFabInternal)

local EconomyApi = {}

function EconomyApi.SetSettings(settings: PlayFabInternal.ISettings)
	PlayFabInternal.SetSettings(settings)
end

export type AddInventoryItemsOperation = {
	--- The amount to add to the current item amount. 
	Amount: number,
	--- The inventory item the operation applies to. 
	Item: InventoryItemReference?,
}

--- Given an entity type, entity identifier and container details, will add the 
--- specified inventory items. 
export type AddInventoryItemsRequest = {
	--- The amount to add for the current item. 
	Amount: number,
	--- The id of the entity's collection to perform this action on. (Default="default") 
	CollectionId: string?,
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The entity to perform this action on. 
	Entity: EntityKey?,
	--- The Idempotency ID for this request. 
	IdempotencyId: string?,
	--- The inventory item the request applies to. 
	Item: InventoryItemReference?,
}

export type AddInventoryItemsResponse = {
	--- The idempotency id used in the request. 
	IdempotencyId: string?,
	--- The ids of transactions that occurred as a result of the request. 
	TransactionIds: {any}?,
}

export type AlternateId = {
	--- Type of the alternate ID. 
	Type: string?,
	--- Value of the alternate ID. 
	Value: string?,
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

export type CatalogAlternateId = {
	--- Type of the alternate ID. 
	Type: string?,
	--- Value of the alternate ID. 
	Value: string?,
}

export type CatalogConfig = {
	--- A list of player entity keys that will have admin permissions. 
	AdminEntities: {EntityKey}?,
	--- The set of configuration that only applies to catalog items. 
	Catalog: CatalogSpecificConfig?,
	--- A list of deep link formats. 
	DeepLinkFormats: {DeepLinkFormat}?,
	--- A list of display properties to index. 
	DisplayPropertyIndexInfos: {DisplayPropertyIndexInfo}?,
	--- The set of configuration that only applies to Files. 
	File: FileConfig?,
	--- The set of configuration that only applies to Images. 
	Image: ImageConfig?,
	--- Flag defining whether catalog is enabled. 
	IsCatalogEnabled: boolean,
	--- A list of Platforms that can be applied to catalog items. 
	Platforms: {any}?,
	--- A set of player entity keys that are allowed to review content. 
	ReviewerEntities: {EntityKey}?,
	--- The set of configuration that only applies to user generated contents. 
	UserGeneratedContent: UserGeneratedContentSpecificConfig?,
}

export type CatalogItem = {
	--- The alternate IDs associated with this item. 
	AlternateIds: {CatalogAlternateId}?,
	--- The client-defined type of the item. 
	ContentType: string?,
	--- The set of contents associated with this item. 
	Contents: {Content}?,
	--- The date and time when this item was created. 
	CreationDate: string?,
	--- The ID of the creator of this catalog item. 
	CreatorEntity: EntityKey?,
	--- The set of platform specific deep links for this item. 
	DeepLinks: {DeepLink}?,
	--- A dictionary of localized descriptions. Key is language code and localized string 
	--- is the value. The neutral locale is required. 
	Description: {[any]: any}?,
	--- Game specific properties for display purposes. This is an arbitrary JSON blob. 
	DisplayProperties: {[any]: any}?,
	--- The user provided version of the item for display purposes. 
	DisplayVersion: string?,
	--- The current ETag value that can be used for optimistic concurrency in the If-None-Match 
	--- header. 
	ETag: string?,
	--- The date of when the item will cease to be available. If not provided then the 
	--- product will be available indefinitely. 
	EndDate: string?,
	--- The unique ID of the item. 
	Id: string?,
	--- The images associated with this item. Images can be thumbnails or screenshots. 
	Images: {Image}?,
	--- Indicates if the item is hidden. 
	IsHidden: boolean?,
	--- The item references associated with this item. 
	ItemReferences: {CatalogItemReference}?,
	--- A dictionary of localized keywords. Key is language code and localized list 
	--- of keywords is the value. 
	Keywords: KeywordSet?,
	--- The date and time this item was last updated. 
	LastModifiedDate: string?,
	--- The moderation state for this item. 
	Moderation: ModerationState?,
	--- The platforms supported by this item. 
	Platforms: {any}?,
	--- The base price of this item. 
	PriceOptions: CatalogPriceOptions?,
	--- Rating summary for this item. 
	Rating: Rating?,
	--- The date of when the item will be available. If not provided then the product 
	--- will appear immediately. 
	StartDate: string?,
	--- Optional details for stores items. 
	StoreDetails: StoreDetails?,
	--- The list of tags that are associated with this item. 
	Tags: {any}?,
	--- A dictionary of localized titles. Key is language code and localized string 
	--- is the value. The neutral locale is required. 
	Title: {[any]: any}?,
	--- The high-level type of the item. The following item types are supported: bundle, 
	--- catalogItem, currency, store, ugc. 
	Type: string?,
}

export type CatalogItemReference = {
	--- The amount of the catalog item. 
	Amount: number?,
	--- The unique ID of the catalog item. 
	Id: string?,
	--- The prices the catalog item can be purchased for. 
	PriceOptions: CatalogPriceOptions?,
}

export type CatalogPrice = {
	--- The amounts of the catalog item price. 
	Amounts: {CatalogPriceAmount}?,
}

export type CatalogPriceAmount = {
	--- The amount of the price. 
	Amount: number,
	--- The Item Id of the price. 
	ItemId: string?,
}

export type CatalogPriceAmountOverride = {
	--- The exact value that should be utilized in the override. 
	FixedValue: number?,
	--- The id of the item this override should utilize. 
	ItemId: string?,
	--- The multiplier that will be applied to the base Catalog value to determine what 
	--- value should be utilized in the override. 
	Multiplier: number?,
}

export type CatalogPriceOptions = {
	--- Prices of the catalog item. 
	Prices: {CatalogPrice}?,
}

export type CatalogPriceOptionsOverride = {
	--- The prices utilized in the override. 
	Prices: {CatalogPriceOverride}?,
}

export type CatalogPriceOverride = {
	--- The currency amounts utilized in the override for a singular price. 
	Amounts: {CatalogPriceAmountOverride}?,
}

export type CatalogSpecificConfig = {
	--- The set of content types that will be used for validation. 
	ContentTypes: {any}?,
	--- The set of tags that will be used for validation. 
	Tags: {any}?,
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
	--- The content unique ID. 
	Id: string?,
	--- The maximum client version that this content is compatible with. 
	MaxClientVersion: string?,
	--- The minimum client version that this content is compatible with. 
	MinClientVersion: string?,
	--- The list of tags that are associated with this content. 
	Tags: {any}?,
	--- The client-defined type of the content. 
	Type: string?,
	--- The Azure CDN URL for retrieval of the catalog item binary content. 
	Url: string?,
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
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- Metadata describing the new catalog item to be created. 
	Item: CatalogItem?,
	--- Whether the item should be published immediately. 
	Publish: boolean,
}

export type CreateDraftItemResponse = {
	--- Updated metadata describing the catalog item just created. 
	Item: CatalogItem?,
}

--- Upload URLs point to Azure Blobs; clients must follow the Microsoft Azure Storage 
--- Blob Service REST API pattern for uploading content. The response contains upload 
--- URLs and IDs for each file. The IDs and URLs returned must be added to the item 
--- metadata and committed using the CreateDraftItem or UpdateDraftItem Item APIs. 
export type CreateUploadUrlsRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- Description of the files to be uploaded by the client. 
	Files: {UploadInfo}?,
}

export type CreateUploadUrlsResponse = {
	--- List of URLs metadata for the files to be uploaded by the client. 
	UploadUrls: {UploadUrlMetadata}?,
}

export type DeepLink = {
	--- Target platform for this deep link. 
	Platform: string?,
	--- The deep link for this platform. 
	Url: string?,
}

export type DeepLinkFormat = {
	--- The format of the deep link to return. The format should contain '{id}' to represent 
	--- where the item ID should be placed. 
	Format: string?,
	--- The target platform for the deep link. 
	Platform: string?,
}

export type DeleteEntityItemReviewsRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The entity to perform this action on. 
	Entity: EntityKey?,
}

export type DeleteEntityItemReviewsResponse = {
}

--- Delete an Inventory Collection by the specified Id for an Entity 
export type DeleteInventoryCollectionRequest = {
	--- The inventory collection id the request applies to. 
	CollectionId: string?,
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The entity the request is about. Set to the caller by default. 
	Entity: EntityKey?,
}

export type DeleteInventoryCollectionResponse = {
}

export type DeleteInventoryItemsOperation = {
	--- The inventory item the operation applies to. 
	Item: InventoryItemReference?,
}

--- Given an entity type, entity identifier and container details, will delete the 
--- entity's inventory items 
export type DeleteInventoryItemsRequest = {
	--- The id of the entity's collection to perform this action on. (Default="default") 
	CollectionId: string?,
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The entity to perform this action on. 
	Entity: EntityKey?,
	--- The Idempotency ID for this request. 
	IdempotencyId: string?,
	--- The inventory item the request applies to. 
	Item: InventoryItemReference?,
}

export type DeleteInventoryItemsResponse = {
	--- The idempotency id used in the request. 
	IdempotencyId: string?,
	--- The ids of transactions that occurred as a result of the request. 
	TransactionIds: {any}?,
}

export type DeleteItemRequest = {
	--- An alternate ID associated with this item. 
	AlternateId: CatalogAlternateId?,
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The entity to perform this action on. 
	Entity: EntityKey?,
	--- The unique ID of the item. 
	Id: string?,
}

export type DeleteItemResponse = {
}

export type DisplayPropertyIndexInfo = {
	--- The property name in the 'DisplayProperties' property to be indexed. 
	Name: string?,
	--- The type of the property to be indexed. 
	Type: string?,
}

export type DisplayPropertyType = 
	"None"
	| "QueryDateTime"
	| "QueryDouble"
	| "QueryString"
	| "SearchString"

--- Combined entity type and ID structure which uniquely identifies a single entity. 
export type EntityKey = {
	--- Unique ID of the entity. 
	Id: string,
	--- Entity type. See https://docs.microsoft.com/gaming/playfab/features/data/entities/available-built-in-entity-types 
	Type: string?,
}

--- Execute a list of Inventory Operations for an Entity 
export type ExecuteInventoryOperationsRequest = {
	--- The id of the entity's collection to perform this action on. (Default="default") 
	CollectionId: string?,
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The entity to perform this action on. 
	Entity: EntityKey?,
	--- The Idempotency ID for this request. 
	IdempotencyId: string?,
	--- The operations to run transactionally. The operations will be executed in-order 
	--- sequentially and will succeed or fail as a batch. 
	Operations: {InventoryOperation}?,
}

export type ExecuteInventoryOperationsResponse = {
	--- The idempotency id used in the request. 
	IdempotencyId: string?,
	--- The ids of the transactions that occurred as a result of the request. 
	TransactionIds: {any}?,
}

export type FileConfig = {
	--- The set of content types that will be used for validation. 
	ContentTypes: {any}?,
	--- The set of tags that will be used for validation. 
	Tags: {any}?,
}

export type FilterOptions = {
	--- The OData filter utilized. Mutually exclusive with 'IncludeAllItems'. 
	Filter: string?,
	--- The flag that overrides the filter and allows for returning all catalog items. 
	--- Mutually exclusive with 'Filter'. 
	IncludeAllItems: boolean?,
}

export type GetCatalogConfigRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
}

export type GetCatalogConfigResponse = {
	--- The catalog configuration. 
	Config: CatalogConfig?,
}

export type GetDraftItemRequest = {
	--- An alternate ID associated with this item. 
	AlternateId: CatalogAlternateId?,
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The entity to perform this action on. 
	Entity: EntityKey?,
	--- The unique ID of the item. 
	Id: string?,
}

export type GetDraftItemResponse = {
	--- Full metadata of the catalog item requested. 
	Item: CatalogItem?,
}

export type GetDraftItemsRequest = {
	--- List of item alternate IDs. 
	AlternateIds: {CatalogAlternateId}?,
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The entity to perform this action on. 
	Entity: EntityKey?,
	--- List of Item Ids. 
	Ids: {any}?,
}

export type GetDraftItemsResponse = {
	--- An opaque token used to retrieve the next page of items, if any are available. 
	ContinuationToken: string?,
	--- A set of items created by the entity. 
	Items: {CatalogItem}?,
}

export type GetEntityDraftItemsRequest = {
	--- An opaque token used to retrieve the next page of items created by the caller, 
	--- if any are available. Should be null on initial request. 
	ContinuationToken: string?,
	--- Number of items to retrieve. Maximum page size is 10. 
	Count: number,
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The entity to perform this action on. 
	Entity: EntityKey?,
	--- OData Filter to specify ItemType. 
	Filter: string?,
}

export type GetEntityDraftItemsResponse = {
	--- An opaque token used to retrieve the next page of items, if any are available. 
	ContinuationToken: string?,
	--- A set of items created by the entity. 
	Items: {CatalogItem}?,
}

export type GetEntityItemReviewRequest = {
	--- An alternate ID associated with this item. 
	AlternateId: CatalogAlternateId?,
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The entity to perform this action on. 
	Entity: EntityKey?,
	--- The unique ID of the item. 
	Id: string?,
}

export type GetEntityItemReviewResponse = {
	--- The review the entity submitted for the requested item. 
	Review: Review?,
}

--- Get a list of Inventory Collection Ids for the specified Entity 
export type GetInventoryCollectionIdsRequest = {
	--- An opaque token used to retrieve the next page of collection ids, if any are 
	--- available. 
	ContinuationToken: string?,
	--- Number of items to retrieve. (Default = 10) 
	Count: number,
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The entity the request is about. Set to the caller by default. 
	Entity: EntityKey?,
}

export type GetInventoryCollectionIdsResponse = {
	--- The requested inventory collection ids. 
	CollectionIds: {any}?,
	--- An opaque token used to retrieve the next page of collection ids, if any are 
	--- available. 
	ContinuationToken: string?,
}

--- Given an entity type, entity identifier and container details, will get the 
--- entity's inventory items.  
export type GetInventoryItemsRequest = {
	--- The id of the entity's collection to perform this action on. (Default="default") 
	CollectionId: string?,
	--- An opaque token used to retrieve the next page of items in the inventory, if 
	--- any are available. Should be null on initial request. 
	ContinuationToken: string?,
	--- Number of items to retrieve. Maximum page size is 50. (Default=10) 
	Count: number,
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The entity to perform this action on. 
	Entity: EntityKey?,
	--- The filters to limit what is returned to the client. 
	Filter: string?,
}

export type GetInventoryItemsResponse = {
	--- An opaque token used to retrieve the next page of items, if any are available. 
	ContinuationToken: string?,
	--- The requested inventory items. 
	Items: {InventoryItem}?,
}

--- Given an item, return a set of bundles and stores containing the item. 
export type GetItemContainersRequest = {
	--- An alternate ID associated with this item. 
	AlternateId: CatalogAlternateId?,
	--- An opaque token used to retrieve the next page of items in the inventory, if 
	--- any are available. Should be null on initial request. 
	ContinuationToken: string?,
	--- Number of items to retrieve. Maximum page size is 25. 
	Count: number,
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The entity to perform this action on. 
	Entity: EntityKey?,
	--- The unique ID of the item. 
	Id: string?,
}

export type GetItemContainersResponse = {
	--- List of Bundles and Stores containing the requested items. 
	Containers: {CatalogItem}?,
	--- An opaque token used to retrieve the next page of items, if any are available. 
	ContinuationToken: string?,
}

export type GetItemModerationStateRequest = {
	--- An alternate ID associated with this item. 
	AlternateId: CatalogAlternateId?,
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The unique ID of the item. 
	Id: string?,
}

export type GetItemModerationStateResponse = {
	--- The current moderation state for the requested item. 
	State: ModerationState?,
}

export type GetItemPublishStatusRequest = {
	--- An alternate ID associated with this item. 
	AlternateId: CatalogAlternateId?,
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The entity to perform this action on. 
	Entity: EntityKey?,
	--- The unique ID of the item. 
	Id: string?,
}

export type GetItemPublishStatusResponse = {
	--- High level status of the published item. 
	Result: string?,
	--- Descriptive message about the current status of the publish. 
	StatusMessage: string?,
}

export type GetItemRequest = {
	--- An alternate ID associated with this item. 
	AlternateId: CatalogAlternateId?,
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The entity to perform this action on. 
	Entity: EntityKey?,
	--- The unique ID of the item. 
	Id: string?,
}

--- Get item result. 
export type GetItemResponse = {
	--- The item result. 
	Item: CatalogItem?,
}

export type GetItemReviewSummaryRequest = {
	--- An alternate ID associated with this item. 
	AlternateId: CatalogAlternateId?,
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The unique ID of the item. 
	Id: string?,
}

export type GetItemReviewSummaryResponse = {
	--- The least favorable review for this item. 
	LeastFavorableReview: Review?,
	--- The most favorable review for this item. 
	MostFavorableReview: Review?,
	--- The summary of ratings associated with this item. 
	Rating: Rating?,
	--- The total number of reviews associated with this item. 
	ReviewsCount: number,
}

export type GetItemReviewsRequest = {
	--- An alternate ID associated with this item. 
	AlternateId: CatalogAlternateId?,
	--- An opaque token used to retrieve the next page of items, if any are available. 
	ContinuationToken: string?,
	--- Number of items to retrieve. Maximum page size is 200. If not specified, defaults 
	--- to 10. 
	Count: number,
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The unique ID of the item. 
	Id: string?,
	--- An OData orderBy used to order the results of the query. 
	OrderBy: string?,
}

export type GetItemReviewsResponse = {
	--- An opaque token used to retrieve the next page of items, if any are available. 
	ContinuationToken: string?,
	--- The paginated set of results. 
	Reviews: {Review}?,
}

export type GetItemsRequest = {
	--- List of item alternate IDs. 
	AlternateIds: {CatalogAlternateId}?,
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The entity to perform this action on. 
	Entity: EntityKey?,
	--- List of Item Ids. 
	Ids: {any}?,
}

export type GetItemsResponse = {
	--- Metadata of set of items. 
	Items: {CatalogItem}?,
}

--- Gets the access tokens for Microsoft Store authentication. 
export type GetMicrosoftStoreAccessTokensRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
}

export type GetMicrosoftStoreAccessTokensResponse = {
	--- The collections access token for calling https://onestore.microsoft.com/b2b/keys/create/collections 
	--- to obtain a CollectionsIdKey for the user 
	CollectionsAccessToken: string?,
	--- The date the collections access token expires 
	CollectionsAccessTokenExpirationDate: string,
}

export type GooglePlayProductPurchase = {
	--- The Product ID (SKU) of the InApp product purchased from the Google Play store. 
	ProductId: string?,
	--- The token provided to the player's device when the product was purchased 
	Token: string?,
}

export type HelpfulnessVote = 
	"None"
	| "UnHelpful"
	| "Helpful"

export type Image = {
	--- The image unique ID. 
	Id: string?,
	--- The client-defined tag associated with this image. 
	Tag: string?,
	--- The client-defined type of this image. 
	Type: string?,
	--- The URL for retrieval of the image. 
	Url: string?,
}

export type ImageConfig = {
	--- The set of tags that will be used for validation. 
	Tags: {any}?,
}

export type InventoryItem = {
	--- The amount of the item. 
	Amount: number,
	--- The id of the item. This should correspond to the item id in the catalog. 
	Id: string?,
	--- The stack id of the item. 
	StackId: string?,
	--- The type of the item. This should correspond to the item type in the catalog. 
	Type: string?,
}

export type InventoryItemReference = {
	--- The inventory item alternate id the request applies to. 
	AlternateId: AlternateId?,
	--- The inventory item id the request applies to. 
	Id: string?,
	--- The inventory stack id the request should redeem to. (Default="default") 
	StackId: string?,
}

export type InventoryOperation = {
	--- The add operation. 
	Add: AddInventoryItemsOperation?,
	--- The delete operation. 
	Delete: DeleteInventoryItemsOperation?,
	--- The purchase operation. 
	Purchase: PurchaseInventoryItemsOperation?,
	--- The subtract operation. 
	Subtract: SubtractInventoryItemsOperation?,
	--- The transfer operation. 
	Transfer: TransferInventoryItemsOperation?,
	--- The update operation. 
	Update: UpdateInventoryItemsOperation?,
}

export type KeywordSet = {
	--- A list of localized keywords. 
	Values: {any}?,
}

export type ModerationState = {
	--- The date and time this moderation state was last updated. 
	LastModifiedDate: string?,
	--- The current stated reason for the associated item being moderated. 
	Reason: string?,
	--- The current moderation status for the associated item. 
	Status: string?,
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
	--- An alternate ID associated with this item. 
	AlternateId: CatalogAlternateId?,
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- ETag of the catalog item to published from the working catalog to the public 
	--- catalog. Used for optimistic concurrency. If the provided ETag does not match 
	--- the ETag in the current working catalog, the request will be rejected. If not 
	--- provided, the current version of the document in the working catalog will be 
	--- published. 
	ETag: string?,
	--- The entity to perform this action on. 
	Entity: EntityKey?,
	--- The unique ID of the item. 
	Id: string?,
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
	--- The amount to purchase. 
	Amount: number,
	--- Indicates whether stacks reduced to an amount of 0 during the operation should 
	--- be deleted from the inventory. (Default = false) 
	DeleteEmptyStacks: boolean,
	--- The inventory item the operation applies to. 
	Item: InventoryItemReference?,
	--- The per-item price the item is expected to be purchased at. This must match 
	--- a value configured in the Catalog or specified Store. 
	PriceAmounts: {PurchasePriceAmount}?,
	--- The id of the Store to purchase the item from. 
	StoreId: string?,
}

--- Purchase a single item or bundle, paying the associated price. 
export type PurchaseInventoryItemsRequest = {
	--- The amount to purchase. 
	Amount: number,
	--- The id of the entity's collection to perform this action on. (Default="default") 
	CollectionId: string?,
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- Indicates whether stacks reduced to an amount of 0 during the request should 
	--- be deleted from the inventory. (Default=false) 
	DeleteEmptyStacks: boolean,
	--- The entity to perform this action on. 
	Entity: EntityKey?,
	--- The Idempotency ID for this request. 
	IdempotencyId: string?,
	--- The inventory item the request applies to. 
	Item: InventoryItemReference?,
	--- The per-item price the item is expected to be purchased at. This must match 
	--- a value configured in the Catalog or specified Store.  
	PriceAmounts: {PurchasePriceAmount}?,
	--- The id of the Store to purchase the item from. 
	StoreId: string?,
}

export type PurchaseInventoryItemsResponse = {
	--- The idempotency id used in the request. 
	IdempotencyId: string?,
	--- The ids of transactions that occurred as a result of the request. 
	TransactionIds: {any}?,
}

export type PurchaseOverride = {
}

export type PurchasePriceAmount = {
	--- The amount of the inventory item to use in the purchase . 
	Amount: number,
	--- The inventory item id to use in the purchase . 
	ItemId: string?,
	--- The inventory stack id the to use in the purchase. Set to "default" by default 
	StackId: string?,
}

export type Rating = {
	--- The average rating for this item. 
	Average: number?,
	--- The total count of 1 star ratings for this item. 
	Count1Star: number?,
	--- The total count of 2 star ratings for this item. 
	Count2Star: number?,
	--- The total count of 3 star ratings for this item. 
	Count3Star: number?,
	--- The total count of 4 star ratings for this item. 
	Count4Star: number?,
	--- The total count of 5 star ratings for this item. 
	Count5Star: number?,
	--- The total count of ratings for this item. 
	TotalCount: number?,
}

--- Redeem items from the Apple App Store. 
export type RedeemAppleAppStoreInventoryItemsRequest = {
	--- The id of the entity's collection to perform this action on. (Default="default") 
	CollectionId: string?,
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The entity to perform this action on. 
	Entity: EntityKey?,
	--- The receipt provided by the Apple marketplace upon successful purchase. 
	Receipt: string?,
}

export type RedeemAppleAppStoreInventoryItemsResponse = {
	--- The list of failed redemptions from the external marketplace. 
	Failed: {RedemptionFailure}?,
	--- The list of successful redemptions from the external marketplace. 
	Succeeded: {RedemptionSuccess}?,
	--- The Transaction IDs associated with the inventory modifications 
	TransactionIds: {any}?,
}

--- Redeem items from the Google Play Store. 
export type RedeemGooglePlayInventoryItemsRequest = {
	--- The id of the entity's collection to perform this action on. (Default="default") 
	CollectionId: string?,
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The entity to perform this action on. 
	Entity: EntityKey?,
	--- The list of purchases to redeem 
	Purchases: {GooglePlayProductPurchase}?,
}

export type RedeemGooglePlayInventoryItemsResponse = {
	--- The list of failed redemptions from the external marketplace. 
	Failed: {RedemptionFailure}?,
	--- The list of successful redemptions from the external marketplace. 
	Succeeded: {RedemptionSuccess}?,
	--- The Transaction IDs associated with the inventory modifications 
	TransactionIds: {any}?,
}

--- Redeem items from the Microsoft Store. 
export type RedeemMicrosoftStoreInventoryItemsRequest = {
	--- The id of the entity's collection to perform this action on. (Default="default") 
	CollectionId: string?,
	--- The OneStore Collections Id Key used for AAD authentication. 
	CollectionsIdKey: string?,
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The entity to perform this action on. 
	Entity: EntityKey?,
	--- Xbox Token used for delegated business partner authentication. 
	XboxToken: string?,
}

export type RedeemMicrosoftStoreInventoryItemsResponse = {
	--- The list of failed redemptions from the external marketplace. 
	Failed: {RedemptionFailure}?,
	--- The list of successful redemptions from the external marketplace. 
	Succeeded: {RedemptionSuccess}?,
	--- The Transaction IDs associated with the inventory modifications 
	TransactionIds: {any}?,
}

--- Redeem items from the Nintendo EShop. 
export type RedeemNintendoEShopInventoryItemsRequest = {
	--- The id of the entity's collection to perform this action on. (Default="default") 
	CollectionId: string?,
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The entity to perform this action on. 
	Entity: EntityKey?,
	--- The Nintendo provided token authorizing redemption 
	NintendoServiceAccountIdToken: string?,
}

export type RedeemNintendoEShopInventoryItemsResponse = {
	--- The list of failed redemptions from the external marketplace. 
	Failed: {RedemptionFailure}?,
	--- The list of successful redemptions from the external marketplace. 
	Succeeded: {RedemptionSuccess}?,
	--- The Transaction IDs associated with the inventory modifications 
	TransactionIds: {any}?,
}

--- Redeem items from the PlayStation Store. 
export type RedeemPlayStationStoreInventoryItemsRequest = {
	--- Authorization code provided by the PlayStation OAuth provider. 
	AuthorizationCode: string?,
	--- The id of the entity's collection to perform this action on. (Default="default") 
	CollectionId: string?,
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The entity to perform this action on. 
	Entity: EntityKey?,
	--- Optional Service Label to pass into the request. 
	ServiceLabel: string?,
}

export type RedeemPlayStationStoreInventoryItemsResponse = {
	--- The list of failed redemptions from the external marketplace. 
	Failed: {RedemptionFailure}?,
	--- The list of successful redemptions from the external marketplace. 
	Succeeded: {RedemptionSuccess}?,
	--- The Transaction IDs associated with the inventory modifications 
	TransactionIds: {any}?,
}

--- Redeem inventory items from Steam. 
export type RedeemSteamInventoryItemsRequest = {
	--- The id of the entity's collection to perform this action on. (Default="default") 
	CollectionId: string?,
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The entity to perform this action on. 
	Entity: EntityKey?,
}

export type RedeemSteamInventoryItemsResponse = {
	--- The list of failed redemptions from the external marketplace. 
	Failed: {RedemptionFailure}?,
	--- The list of successful redemptions from the external marketplace. 
	Succeeded: {RedemptionSuccess}?,
	--- The Transaction IDs associated with the inventory modifications 
	TransactionIds: {any}?,
}

export type RedemptionFailure = {
	--- The marketplace failure code. 
	FailureCode: string?,
	--- The marketplace error details explaining why the offer failed to redeem. 
	FailureDetails: string?,
	--- The transaction id in the external marketplace. 
	MarketplaceTransactionId: string?,
	--- The ID of the offer being redeemed. 
	OfferId: string?,
}

export type RedemptionSuccess = {
	--- The transaction id in the external marketplace. 
	MarketplaceTransactionId: string?,
	--- The ID of the offer being redeemed. 
	OfferId: string?,
	--- The timestamp for when the redeem was completed. 
	SuccessTimestamp: string,
}

export type ReportItemRequest = {
	--- An alternate ID associated with this item. 
	AlternateId: CatalogAlternateId?,
	--- Category of concern for this report. 
	ConcernCategory: string?,
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The entity to perform this action on. 
	Entity: EntityKey?,
	--- The unique ID of the item. 
	Id: string?,
	--- The string reason for this report. 
	Reason: string?,
}

export type ReportItemResponse = {
}

--- Submit a report for an inappropriate review, allowing the submitting user to 
--- specify their concern. 
export type ReportItemReviewRequest = {
	--- An alternate ID of the item associated with the review. 
	AlternateId: CatalogAlternateId?,
	--- The reason this review is being reported. 
	ConcernCategory: string?,
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The entity to perform this action on. 
	Entity: EntityKey?,
	--- The string ID of the item associated with the review. 
	ItemId: string?,
	--- The string reason for this report. 
	Reason: string?,
	--- The ID of the review to submit a report for. 
	ReviewId: string?,
}

export type ReportItemReviewResponse = {
}

export type Review = {
	--- The number of negative helpfulness votes for this review. 
	HelpfulNegative: number,
	--- The number of positive helpfulness votes for this review. 
	HelpfulPositive: number,
	--- Indicates whether the review author has the item installed. 
	IsInstalled: boolean,
	--- The ID of the item being reviewed. 
	ItemId: string?,
	--- The version of the item being reviewed. 
	ItemVersion: string?,
	--- The locale for which this review was submitted in. 
	Locale: string?,
	--- Star rating associated with this review. 
	Rating: number,
	--- The ID of the review. 
	ReviewId: string?,
	--- The full text of this review. 
	ReviewText: string?,
	--- The ID of the author of the review. 
	ReviewerEntity: EntityKey?,
	--- Deprecated. Use ReviewerEntity instead. This property will be removed in a future 
	--- release. 
	ReviewerId: string?,
	--- The date and time this review was last submitted. 
	Submitted: string,
	--- The title of this review. 
	Title: string?,
}

export type ReviewItemRequest = {
	--- An alternate ID associated with this item. 
	AlternateId: CatalogAlternateId?,
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The entity to perform this action on. 
	Entity: EntityKey?,
	--- The unique ID of the item. 
	Id: string?,
	--- The review to submit. 
	Review: Review?,
}

export type ReviewItemResponse = {
}

export type ReviewTakedown = {
	--- An alternate ID associated with this item. 
	AlternateId: CatalogAlternateId?,
	--- The ID of the item associated with the review to take down. 
	ItemId: string?,
	--- The ID of the review to take down. 
	ReviewId: string?,
}

export type ScanResult = {
	--- The URL of the item which failed the scan. 
	Url: string?,
}

export type SearchItemsRequest = {
	--- An opaque token used to retrieve the next page of items, if any are available. 
	ContinuationToken: string?,
	--- Number of items to retrieve. Maximum page size is 225. Default value is 10. 
	Count: number,
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The entity to perform this action on. 
	Entity: EntityKey?,
	--- An OData filter used to refine the search query. 
	Filter: string?,
	--- An OData orderBy used to order the results of the search query. 
	OrderBy: string?,
	--- The text to search for. 
	Search: string?,
	--- An OData select query option used to augment the search results. If not defined, 
	--- the default search result metadata will be returned. 
	Select: string?,
	--- The store to restrict the search request to. 
	Store: StoreReference?,
}

export type SearchItemsResponse = {
	--- An opaque token used to retrieve the next page of items, if any are available. 
	ContinuationToken: string?,
	--- The paginated set of results for the search query. 
	Items: {CatalogItem}?,
}

export type SetItemModerationStateRequest = {
	--- An alternate ID associated with this item. 
	AlternateId: CatalogAlternateId?,
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The unique ID of the item. 
	Id: string?,
	--- The reason for the moderation state change for the associated item. 
	Reason: string?,
	--- The status to set for the associated item. 
	Status: string?,
}

export type SetItemModerationStateResponse = {
}

export type StoreDetails = {
	--- The options for the filter in filter-based stores. These options are mutually 
	--- exclusive with item references. 
	FilterOptions: FilterOptions?,
	--- The global prices utilized in the store. These options are mutually exclusive 
	--- with price options in item references. 
	PriceOptionsOverride: CatalogPriceOptionsOverride?,
}

export type StoreReference = {
	--- An alternate ID of the store. 
	AlternateId: CatalogAlternateId?,
	--- The unique ID of the store. 
	Id: string?,
}

export type SubmitItemReviewVoteRequest = {
	--- An alternate ID of the item associated with the review. 
	AlternateId: CatalogAlternateId?,
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The entity to perform this action on. 
	Entity: EntityKey?,
	--- The string ID of the item associated with the review. 
	ItemId: string?,
	--- The ID of the review to submit a helpfulness vote for. 
	ReviewId: string?,
	--- The helpfulness vote of the review. 
	Vote: string?,
}

export type SubmitItemReviewVoteResponse = {
}

export type SubscriptionDetails = {
	--- The length of time that the subscription will last in seconds. 
	DurationInSeconds: number,
}

export type SubtractInventoryItemsOperation = {
	--- The amount to subtract from the current item amount. 
	Amount: number,
	--- Indicates whether stacks reduced to an amount of 0 during the request should 
	--- be deleted from the inventory. (Default = false). 
	DeleteEmptyStacks: boolean,
	--- The inventory item the operation applies to. 
	Item: InventoryItemReference?,
}

--- Given an entity type, entity identifier and container details, will subtract 
--- the specified inventory items.  
export type SubtractInventoryItemsRequest = {
	--- The amount to add for the current item. 
	Amount: number,
	--- The id of the entity's collection to perform this action on. (Default="default") 
	CollectionId: string?,
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- Indicates whether stacks reduced to an amount of 0 during the request should 
	--- be deleted from the inventory. (Default=false) 
	DeleteEmptyStacks: boolean,
	--- The entity to perform this action on. 
	Entity: EntityKey?,
	--- The Idempotency ID for this request. 
	IdempotencyId: string?,
	--- The inventory item the request applies to. 
	Item: InventoryItemReference?,
}

export type SubtractInventoryItemsResponse = {
	--- The idempotency id used in the request. 
	IdempotencyId: string?,
	--- The ids of transactions that occurred as a result of the request. 
	TransactionIds: {any}?,
}

--- Submit a request to takedown one or more reviews, removing them from public 
--- view. Authors will still be able to see their reviews after being taken down. 
export type TakedownItemReviewsRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The set of reviews to take down. 
	Reviews: {ReviewTakedown}?,
}

export type TakedownItemReviewsResponse = {
}

export type TransferInventoryItemsOperation = {
	--- The amount to transfer. 
	Amount: number,
	--- Indicates whether stacks reduced to an amount of 0 during the operation should 
	--- be deleted from the inventory. (Default = false) 
	DeleteEmptyStacks: boolean,
	--- The inventory item the operation is transferring from. 
	GivingItem: InventoryItemReference?,
	--- The inventory item the operation is transferring to. 
	ReceivingItem: InventoryItemReference?,
}

--- Transfer the specified inventory items of an entity's container Id to another 
--- entity's container Id. 
export type TransferInventoryItemsRequest = {
	--- The amount to transfer . 
	Amount: number,
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- Indicates whether stacks reduced to an amount of 0 during the request should 
	--- be deleted from the inventory. (Default = false) 
	DeleteEmptyStacks: boolean,
	--- The inventory collection id the request is transferring from. (Default="default") 
	GivingCollectionId: string?,
	--- The entity the request is transferring from. Set to the caller by default. 
	GivingEntity: EntityKey?,
	--- The inventory item the request is transferring from. 
	GivingItem: InventoryItemReference?,
	--- The idempotency id for the request. 
	IdempotencyId: string?,
	--- The inventory collection id the request is transferring to. (Default="default") 
	ReceivingCollectionId: string?,
	--- The entity the request is transferring to. Set to the caller by default. 
	ReceivingEntity: EntityKey?,
	--- The inventory item the request is transferring to. 
	ReceivingItem: InventoryItemReference?,
}

export type TransferInventoryItemsResponse = {
	--- The ids of transactions that occurred as a result of the request's giving action. 
	GivingTransactionIds: {any}?,
	--- The idempotency id for the request. 
	IdempotencyId: string?,
	--- The ids of transactions that occurred as a result of the request's receiving 
	--- action. 
	ReceivingTransactionIds: {any}?,
}

export type UpdateCatalogConfigRequest = {
	--- The updated catalog configuration. 
	Config: CatalogConfig?,
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
}

export type UpdateCatalogConfigResponse = {
}

export type UpdateDraftItemRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- Updated metadata describing the catalog item to be updated. 
	Item: CatalogItem?,
	--- Whether the item should be published immediately. 
	Publish: boolean,
}

export type UpdateDraftItemResponse = {
	--- Updated metadata describing the catalog item just updated. 
	Item: CatalogItem?,
}

export type UpdateInventoryItemsOperation = {
	--- The inventory item to update with the specified values. 
	Item: InventoryItem?,
}

--- Given an entity type, entity identifier and container details, will update the 
--- entity's inventory items 
export type UpdateInventoryItemsRequest = {
	--- The id of the entity's collection to perform this action on. (Default="default") 
	CollectionId: string?,
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The entity to perform this action on. 
	Entity: EntityKey?,
	--- The Idempotency ID for this request. 
	IdempotencyId: string?,
	--- The inventory item to update with the specified values. 
	Item: InventoryItem?,
}

export type UpdateInventoryItemsResponse = {
	--- The idempotency id used in the request. 
	IdempotencyId: string?,
	--- The ids of transactions that occurred as a result of the request. 
	TransactionIds: {any}?,
}

export type UploadInfo = {
	--- Name of the file to be uploaded. 
	FileName: string?,
}

export type UploadUrlMetadata = {
	--- Name of the file for which this upload URL was requested. 
	FileName: string?,
	--- Unique ID for the binary content to be uploaded to the target URL. 
	Id: string?,
	--- URL for the binary content to be uploaded to. 
	Url: string?,
}

export type UserGeneratedContentSpecificConfig = {
	--- The set of content types that will be used for validation. 
	ContentTypes: {any}?,
	--- The set of tags that will be used for validation. 
	Tags: {any}?,
}


--- The item will not be published to the public catalog until the PublishItem API 
--- is called for the item. 
---
--- https://docs.microsoft.com/rest/api/playfab/economy/catalog/createdraftitem
function EconomyApi.CreateDraftItemAsync(
	entityToken: string, 
	request: CreateDraftItemRequest
): CreateDraftItemResponse
	return PlayFabInternal.MakeApiCall(
		"/Catalog/CreateDraftItem",
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
): CreateUploadUrlsResponse
	return PlayFabInternal.MakeApiCall(
		"/Catalog/CreateUploadUrls",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/economy/catalog/deleteentityitemreviews
function EconomyApi.DeleteEntityItemReviewsAsync(
	entityToken: string, 
	request: DeleteEntityItemReviewsRequest
): DeleteEntityItemReviewsResponse
	return PlayFabInternal.MakeApiCall(
		"/Catalog/DeleteEntityItemReviews",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/economy/catalog/deleteitem
function EconomyApi.DeleteItemAsync(
	entityToken: string, 
	request: DeleteItemRequest
): DeleteItemResponse
	return PlayFabInternal.MakeApiCall(
		"/Catalog/DeleteItem",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/economy/catalog/getcatalogconfig
function EconomyApi.GetCatalogConfigAsync(
	entityToken: string, 
	request: GetCatalogConfigRequest
): GetCatalogConfigResponse
	return PlayFabInternal.MakeApiCall(
		"/Catalog/GetCatalogConfig",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/economy/catalog/getdraftitem
function EconomyApi.GetDraftItemAsync(
	entityToken: string, 
	request: GetDraftItemRequest
): GetDraftItemResponse
	return PlayFabInternal.MakeApiCall(
		"/Catalog/GetDraftItem",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/economy/catalog/getdraftitems
function EconomyApi.GetDraftItemsAsync(
	entityToken: string, 
	request: GetDraftItemsRequest
): GetDraftItemsResponse
	return PlayFabInternal.MakeApiCall(
		"/Catalog/GetDraftItems",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/economy/catalog/getentitydraftitems
function EconomyApi.GetEntityDraftItemsAsync(
	entityToken: string, 
	request: GetEntityDraftItemsRequest
): GetEntityDraftItemsResponse
	return PlayFabInternal.MakeApiCall(
		"/Catalog/GetEntityDraftItems",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/economy/catalog/getentityitemreview
function EconomyApi.GetEntityItemReviewAsync(
	entityToken: string, 
	request: GetEntityItemReviewRequest
): GetEntityItemReviewResponse
	return PlayFabInternal.MakeApiCall(
		"/Catalog/GetEntityItemReview",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/economy/catalog/getitem
function EconomyApi.GetItemAsync(
	entityToken: string, 
	request: GetItemRequest
): GetItemResponse
	return PlayFabInternal.MakeApiCall(
		"/Catalog/GetItem",
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
): GetItemContainersResponse
	return PlayFabInternal.MakeApiCall(
		"/Catalog/GetItemContainers",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/economy/catalog/getitemmoderationstate
function EconomyApi.GetItemModerationStateAsync(
	entityToken: string, 
	request: GetItemModerationStateRequest
): GetItemModerationStateResponse
	return PlayFabInternal.MakeApiCall(
		"/Catalog/GetItemModerationState",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/economy/catalog/getitempublishstatus
function EconomyApi.GetItemPublishStatusAsync(
	entityToken: string, 
	request: GetItemPublishStatusRequest
): GetItemPublishStatusResponse
	return PlayFabInternal.MakeApiCall(
		"/Catalog/GetItemPublishStatus",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/economy/catalog/getitemreviewsummary
function EconomyApi.GetItemReviewSummaryAsync(
	entityToken: string, 
	request: GetItemReviewSummaryRequest
): GetItemReviewSummaryResponse
	return PlayFabInternal.MakeApiCall(
		"/Catalog/GetItemReviewSummary",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/economy/catalog/getitemreviews
function EconomyApi.GetItemReviewsAsync(
	entityToken: string, 
	request: GetItemReviewsRequest
): GetItemReviewsResponse
	return PlayFabInternal.MakeApiCall(
		"/Catalog/GetItemReviews",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/economy/catalog/getitems
function EconomyApi.GetItemsAsync(
	entityToken: string, 
	request: GetItemsRequest
): GetItemsResponse
	return PlayFabInternal.MakeApiCall(
		"/Catalog/GetItems",
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
): PublishDraftItemResponse
	return PlayFabInternal.MakeApiCall(
		"/Catalog/PublishDraftItem",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/economy/catalog/reportitem
function EconomyApi.ReportItemAsync(
	entityToken: string, 
	request: ReportItemRequest
): ReportItemResponse
	return PlayFabInternal.MakeApiCall(
		"/Catalog/ReportItem",
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
): ReportItemReviewResponse
	return PlayFabInternal.MakeApiCall(
		"/Catalog/ReportItemReview",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/economy/catalog/reviewitem
function EconomyApi.ReviewItemAsync(
	entityToken: string, 
	request: ReviewItemRequest
): ReviewItemResponse
	return PlayFabInternal.MakeApiCall(
		"/Catalog/ReviewItem",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/economy/catalog/searchitems
function EconomyApi.SearchItemsAsync(
	entityToken: string, 
	request: SearchItemsRequest
): SearchItemsResponse
	return PlayFabInternal.MakeApiCall(
		"/Catalog/SearchItems",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/economy/catalog/setitemmoderationstate
function EconomyApi.SetItemModerationStateAsync(
	entityToken: string, 
	request: SetItemModerationStateRequest
): SetItemModerationStateResponse
	return PlayFabInternal.MakeApiCall(
		"/Catalog/SetItemModerationState",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/economy/catalog/submititemreviewvote
function EconomyApi.SubmitItemReviewVoteAsync(
	entityToken: string, 
	request: SubmitItemReviewVoteRequest
): SubmitItemReviewVoteResponse
	return PlayFabInternal.MakeApiCall(
		"/Catalog/SubmitItemReviewVote",
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
): TakedownItemReviewsResponse
	return PlayFabInternal.MakeApiCall(
		"/Catalog/TakedownItemReviews",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/economy/catalog/updatecatalogconfig
function EconomyApi.UpdateCatalogConfigAsync(
	entityToken: string, 
	request: UpdateCatalogConfigRequest
): UpdateCatalogConfigResponse
	return PlayFabInternal.MakeApiCall(
		"/Catalog/UpdateCatalogConfig",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/economy/catalog/updatedraftitem
function EconomyApi.UpdateDraftItemAsync(
	entityToken: string, 
	request: UpdateDraftItemRequest
): UpdateDraftItemResponse
	return PlayFabInternal.MakeApiCall(
		"/Catalog/UpdateDraftItem",
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
): AddInventoryItemsResponse
	return PlayFabInternal.MakeApiCall(
		"/Inventory/AddInventoryItems",
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
): DeleteInventoryCollectionResponse
	return PlayFabInternal.MakeApiCall(
		"/Inventory/DeleteInventoryCollection",
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
): DeleteInventoryItemsResponse
	return PlayFabInternal.MakeApiCall(
		"/Inventory/DeleteInventoryItems",
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
): ExecuteInventoryOperationsResponse
	return PlayFabInternal.MakeApiCall(
		"/Inventory/ExecuteInventoryOperations",
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
): GetInventoryCollectionIdsResponse
	return PlayFabInternal.MakeApiCall(
		"/Inventory/GetInventoryCollectionIds",
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
): GetInventoryItemsResponse
	return PlayFabInternal.MakeApiCall(
		"/Inventory/GetInventoryItems",
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
): GetMicrosoftStoreAccessTokensResponse
	return PlayFabInternal.MakeApiCall(
		"/Inventory/GetMicrosoftStoreAccessTokens",
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
): PurchaseInventoryItemsResponse
	return PlayFabInternal.MakeApiCall(
		"/Inventory/PurchaseInventoryItems",
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
): RedeemAppleAppStoreInventoryItemsResponse
	return PlayFabInternal.MakeApiCall(
		"/Inventory/RedeemAppleAppStoreInventoryItems",
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
): RedeemGooglePlayInventoryItemsResponse
	return PlayFabInternal.MakeApiCall(
		"/Inventory/RedeemGooglePlayInventoryItems",
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
): RedeemMicrosoftStoreInventoryItemsResponse
	return PlayFabInternal.MakeApiCall(
		"/Inventory/RedeemMicrosoftStoreInventoryItems",
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
): RedeemNintendoEShopInventoryItemsResponse
	return PlayFabInternal.MakeApiCall(
		"/Inventory/RedeemNintendoEShopInventoryItems",
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
): RedeemPlayStationStoreInventoryItemsResponse
	return PlayFabInternal.MakeApiCall(
		"/Inventory/RedeemPlayStationStoreInventoryItems",
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
): RedeemSteamInventoryItemsResponse
	return PlayFabInternal.MakeApiCall(
		"/Inventory/RedeemSteamInventoryItems",
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
): SubtractInventoryItemsResponse
	return PlayFabInternal.MakeApiCall(
		"/Inventory/SubtractInventoryItems",
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
): TransferInventoryItemsResponse
	return PlayFabInternal.MakeApiCall(
		"/Inventory/TransferInventoryItems",
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
): UpdateInventoryItemsResponse
	return PlayFabInternal.MakeApiCall(
		"/Inventory/UpdateInventoryItems",
		request,
		"X-EntityToken",
		entityToken
	)
end

return EconomyApi

