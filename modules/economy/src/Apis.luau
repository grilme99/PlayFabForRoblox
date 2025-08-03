--[[
	This file was generated on 2025-08-03 at 00:04 UTC. Do not edit directly.

]]

local Types = require(script.Parent.Types)

local Common = require(script.Parent.Parent.PlayFabCommon)
local makeApiCall = Common.makeApiCall
type Result<T, E> = Common.Result<T, E>

local Apis = {}

--[[
	Gets the status of a publish of an item.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/economy/catalog/getitempublishstatus).

	### Errors
	- DatabaseThroughputExceeded
	- ItemNotFound

]]
function Apis.GetItemPublishStatus(request: Types.GetItemPublishStatusRequest, entityToken: string): Result<Types.GetItemPublishStatusResponse, string>
	return makeApiCall(
		"/Catalog/GetItemPublishStatus",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Redeem items.

	Redeem inventory items from Steam.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/economy/inventory/redeemsteaminventoryitems).

	### Errors
	- AccountNotLinked
	- InvalidCatalogItemConfiguration

]]
function Apis.RedeemSteamInventoryItems(request: Types.RedeemSteamInventoryItemsRequest, entityToken: string): Result<Types.RedeemSteamInventoryItemsResponse, string>
	return makeApiCall(
		"/Inventory/RedeemSteamInventoryItems",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Get a paginated set of reviews associated with the specified item.
	Individual ratings and reviews data update in near real time with delays
	within a few seconds.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/economy/catalog/getitemreviews).

	### Errors
	- DatabaseThroughputExceeded
	- ItemNotFound

]]
function Apis.GetItemReviews(request: Types.GetItemReviewsRequest, entityToken: string): Result<Types.GetItemReviewsResponse, string>
	return makeApiCall(
		"/Catalog/GetItemReviews",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Purchase an item or bundle. Up to 10,000 stacks of items can be added to a
	single inventory collection. Stack size is uncapped.

	Purchase a single item or bundle, paying the associated price.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/economy/inventory/purchaseinventoryitems).

	### Errors
	- DatabaseThroughputExceeded
	- InsufficientFunds
	- InvalidCatalogItemConfiguration
	- ItemNotFound

]]
function Apis.PurchaseInventoryItems(request: Types.PurchaseInventoryItemsRequest, entityToken: string): Result<Types.PurchaseInventoryItemsResponse, string>
	return makeApiCall(
		"/Inventory/PurchaseInventoryItems",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Updates the configuration for the catalog. Only Title Entities can call this
	API. There is a limit of 10 requests in 10 seconds for this API. More
	information about the Catalog Config can be found here:
	https://learn.microsoft.com/en-us/gaming/playfab/features/economy-v2/settings

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/economy/catalog/updatecatalogconfig).

	### Errors
	- BillingInformationRequired
	- CatalogConfigInvalid
	- InvalidEntityType

]]
function Apis.UpdateCatalogConfig(request: Types.UpdateCatalogConfigRequest, entityToken: string): Result<Types.UpdateCatalogConfigResponse, string>
	return makeApiCall(
		"/Catalog/UpdateCatalogConfig",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Redeem items.

	Redeem items from the PlayStation Store.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/economy/inventory/redeemplaystationstoreinventoryitems).

	### Errors
	- AccountNotLinked
	- InvalidCatalogItemConfiguration
	- InvalidPSNAuthCode
	- NotAuthorized

]]
function Apis.RedeemPlayStationStoreInventoryItems(request: Types.RedeemPlayStationStoreInventoryItemsRequest, entityToken: string): Result<Types.RedeemPlayStationStoreInventoryItemsResponse, string>
	return makeApiCall(
		"/Inventory/RedeemPlayStationStoreInventoryItems",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Submit a report for a review

	Submit a report for an inappropriate review, allowing the submitting user to
	specify their concern.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/economy/catalog/reportitemreview).

	### Errors
	- DatabaseThroughputExceeded

]]
function Apis.ReportItemReview(request: Types.ReportItemReviewRequest, entityToken: string): Result<Types.ReportItemReviewResponse, string>
	return makeApiCall(
		"/Catalog/ReportItemReview",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Delete inventory items

	Given an entity type, entity identifier and container details, will delete
	the entity's inventory items

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/economy/inventory/deleteinventoryitems).

	### Errors
	- DatabaseThroughputExceeded
	- ItemNotFound

]]
function Apis.DeleteInventoryItems(request: Types.DeleteInventoryItemsRequest, entityToken: string): Result<Types.DeleteInventoryItemsResponse, string>
	return makeApiCall(
		"/Inventory/DeleteInventoryItems",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Gets the access tokens.

	Gets the access tokens for Microsoft Store authentication.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/economy/inventory/getmicrosoftstoreaccesstokens).

	### Errors
	- NotImplemented

]]
function Apis.GetMicrosoftStoreAccessTokens(request: Types.GetMicrosoftStoreAccessTokensRequest, entityToken: string): Result<Types.GetMicrosoftStoreAccessTokensResponse, string>
	return makeApiCall(
		"/Inventory/GetMicrosoftStoreAccessTokens",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Get Inventory Collection Ids. Up to 50 Ids can be returned at once (or 250
	with response compression enabled). You can use continuation tokens to
	paginate through results that return greater than the limit. It can take a
	few seconds for new collection Ids to show up.

	Get a list of Inventory Collection Ids for the specified Entity

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/economy/inventory/getinventorycollectionids).

]]
function Apis.GetInventoryCollectionIds(request: Types.GetInventoryCollectionIdsRequest, entityToken: string): Result<Types.GetInventoryCollectionIdsResponse, string>
	return makeApiCall(
		"/Inventory/GetInventoryCollectionIds",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Retrieves an item from the public catalog. GetItem does not work off a cache
	of the Catalog and should be used when trying to get recent item updates.
	However, please note that item references data is cached and may take a few
	moments for changes to propagate.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/economy/catalog/getitem).

	### Errors
	- DatabaseThroughputExceeded
	- ItemNotFound

]]
function Apis.GetItem(request: Types.GetItemRequest, entityToken: string): Result<Types.GetItemResponse, string>
	return makeApiCall(
		"/Catalog/GetItem",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Get the status of an inventory operation using an OperationToken. You can
	check on the operation status at anytime within 1 day of the request by
	passing the TransactionToken to the this API.

	Get the status of an Inventory Operation using an OperationToken.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/economy/inventory/getinventoryoperationstatus).

]]
function Apis.GetInventoryOperationStatus(request: Types.GetInventoryOperationStatusRequest, entityToken: string): Result<Types.GetInventoryOperationStatusResponse, string>
	return makeApiCall(
		"/Inventory/GetInventoryOperationStatus",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Search for a given item and return a set of bundles and stores containing
	the item. Up to 50 items can be returned at once. You can use continuation
	tokens to paginate through results that return greater than the limit. This
	API is intended for tooling/automation scenarios and has a reduced RPS with
	Player Entities limited to 30 requests in 300 seconds and Title Entities
	limited to 100 requests in 10 seconds.

	Given an item, return a set of bundles and stores containing the item.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/economy/catalog/getitemcontainers).

	### Errors
	- ItemNotFound

]]
function Apis.GetItemContainers(request: Types.GetItemContainersRequest, entityToken: string): Result<Types.GetItemContainersResponse, string>
	return makeApiCall(
		"/Catalog/GetItemContainers",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Redeem items.

	Redeem items from the Apple App Store.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/economy/inventory/redeemappleappstoreinventoryitems).

	### Errors
	- InvalidCatalogItemConfiguration

]]
function Apis.RedeemAppleAppStoreInventoryItems(request: Types.RedeemAppleAppStoreInventoryItemsRequest, entityToken: string): Result<Types.RedeemAppleAppStoreInventoryItemsResponse, string>
	return makeApiCall(
		"/Inventory/RedeemAppleAppStoreInventoryItems",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Update the metadata for an item in the working catalog. Note: SAS tokens
	provided are valid for 1 hour.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/economy/catalog/updatedraftitem).

	### Errors
	- DatabaseThroughputExceeded
	- InvalidRequest
	- ItemNotFound

]]
function Apis.UpdateDraftItem(request: Types.UpdateDraftItemRequest, entityToken: string): Result<Types.UpdateDraftItemResponse, string>
	return makeApiCall(
		"/Catalog/UpdateDraftItem",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Retrieves an item from the working catalog. This item represents the current
	working state of the item. GetDraftItem does not work off a cache of the
	Catalog and should be used when trying to get recent item updates. However,
	please note that item references data is cached and may take a few moments
	for changes to propagate. Note: SAS tokens provided are valid for 1 hour.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/economy/catalog/getdraftitem).

	### Errors
	- DatabaseThroughputExceeded
	- ItemNotFound
	- NotImplemented

]]
function Apis.GetDraftItem(request: Types.GetDraftItemRequest, entityToken: string): Result<Types.GetDraftItemResponse, string>
	return makeApiCall(
		"/Catalog/GetDraftItem",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Retrieves a paginated list of the items from the draft catalog. Up to 50 IDs
	can be retrieved in a single request. GetDraftItems does not work off a
	cache of the Catalog and should be used when trying to get recent item
	updates. Note: SAS tokens provided are valid for 1 hour.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/economy/catalog/getdraftitems).

	### Errors
	- DatabaseThroughputExceeded
	- ItemNotFound

]]
function Apis.GetDraftItems(request: Types.GetDraftItemsRequest, entityToken: string): Result<Types.GetDraftItemsResponse, string>
	return makeApiCall(
		"/Catalog/GetDraftItems",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Creates a new item in the working catalog using provided metadata. Note: SAS
	tokens provided are valid for 1 hour.

	The item will not be published to the public catalog until the PublishItem
	API is called for the item.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/economy/catalog/createdraftitem).

	### Errors
	- DatabaseThroughputExceeded
	- InvalidRequest
	- ItemNotFound
	- NotImplemented

]]
function Apis.CreateDraftItem(request: Types.CreateDraftItemRequest, entityToken: string): Result<Types.CreateDraftItemResponse, string>
	return makeApiCall(
		"/Catalog/CreateDraftItem",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Gets the moderation state for an item, including the concern category and
	string reason. More information about moderation states can be found here:
	https://learn.microsoft.com/en-us/gaming/playfab/features/economy-v2/ugc/moderation

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/economy/catalog/getitemmoderationstate).

	### Errors
	- DatabaseThroughputExceeded
	- ItemNotFound

]]
function Apis.GetItemModerationState(request: Types.GetItemModerationStateRequest, entityToken: string): Result<Types.GetItemModerationStateResponse, string>
	return makeApiCall(
		"/Catalog/GetItemModerationState",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Gets the configuration for the catalog. Only Title Entities can call this
	API. There is a limit of 100 requests in 10 seconds for this API. More
	information about the Catalog Config can be found here:
	https://learn.microsoft.com/en-us/gaming/playfab/features/economy-v2/settings

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/economy/catalog/getcatalogconfig).

	### Errors
	- BillingInformationRequired
	- InvalidEntityType

]]
function Apis.GetCatalogConfig(request: Types.GetCatalogConfigRequest, entityToken: string): Result<Types.GetCatalogConfigResponse, string>
	return makeApiCall(
		"/Catalog/GetCatalogConfig",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Redeem items.

	Redeem items from the Microsoft Store.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/economy/inventory/redeemmicrosoftstoreinventoryitems).

	### Errors
	- AccountNotLinked
	- InvalidCatalogItemConfiguration
	- InvalidXboxLiveToken
	- XboxInaccessible
	- XboxXASSExchangeFailure

]]
function Apis.RedeemMicrosoftStoreInventoryItems(request: Types.RedeemMicrosoftStoreInventoryItemsRequest, entityToken: string): Result<Types.RedeemMicrosoftStoreInventoryItemsResponse, string>
	return makeApiCall(
		"/Inventory/RedeemMicrosoftStoreInventoryItems",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Submit a vote for a review, indicating whether the review was helpful or
	unhelpful.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/economy/catalog/submititemreviewvote).

	### Errors
	- DatabaseThroughputExceeded

]]
function Apis.SubmitItemReviewVote(request: Types.SubmitItemReviewVoteRequest, entityToken: string): Result<Types.SubmitItemReviewVoteResponse, string>
	return makeApiCall(
		"/Catalog/SubmitItemReviewVote",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Subtract inventory items.

	Given an entity type, entity identifier and container details, will subtract
	the specified inventory items.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/economy/inventory/subtractinventoryitems).

	### Errors
	- DatabaseThroughputExceeded
	- InsufficientFunds
	- ItemNotFound

]]
function Apis.SubtractInventoryItems(request: Types.SubtractInventoryItemsRequest, entityToken: string): Result<Types.SubtractInventoryItemsResponse, string>
	return makeApiCall(
		"/Inventory/SubtractInventoryItems",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Creates one or more upload URLs which can be used by the client to upload
	raw file data. Content URls and uploaded content will be garbage collected
	after 24 hours if not attached to a draft or published item. Detailed
	pricing info around uploading content can be found here:
	https://learn.microsoft.com/en-us/gaming/playfab/features/pricing/meters/catalog-meters

	Upload URLs point to Azure Blobs; clients must follow the Microsoft Azure
	Storage Blob Service REST API pattern for uploading content. The response
	contains upload URLs and IDs for each file. The IDs and URLs returned must
	be added to the item metadata and committed using the CreateDraftItem or
	UpdateDraftItem Item APIs.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/economy/catalog/createuploadurls).

]]
function Apis.CreateUploadUrls(request: Types.CreateUploadUrlsRequest, entityToken: string): Result<Types.CreateUploadUrlsResponse, string>
	return makeApiCall(
		"/Catalog/CreateUploadUrls",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Delete an Inventory Collection. More information about Inventory Collections
	can be found here:
	https://learn.microsoft.com/en-us/gaming/playfab/features/economy-v2/inventory/collections

	Delete an Inventory Collection by the specified Id for an Entity

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/economy/inventory/deleteinventorycollection).

]]
function Apis.DeleteInventoryCollection(request: Types.DeleteInventoryCollectionRequest, entityToken: string): Result<Types.DeleteInventoryCollectionResponse, string>
	return makeApiCall(
		"/Inventory/DeleteInventoryCollection",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Get transaction history for a player. Up to 250 Events can be returned at
	once. You can use continuation tokens to paginate through results that
	return greater than the limit. Getting transaction history has a lower RPS
	limit than getting a Player's inventory with Player Entities having a limit
	of 30 requests in 300 seconds.

	Get transaction history for specified entity and collection.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/economy/inventory/gettransactionhistory).

]]
function Apis.GetTransactionHistory(request: Types.GetTransactionHistoryRequest, entityToken: string): Result<Types.GetTransactionHistoryResponse, string>
	return makeApiCall(
		"/Inventory/GetTransactionHistory",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Submit a report for an item, indicating in what way the item is
	inappropriate.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/economy/catalog/reportitem).

	### Errors
	- DatabaseThroughputExceeded
	- ItemNotFound

]]
function Apis.ReportItem(request: Types.ReportItemRequest, entityToken: string): Result<Types.ReportItemResponse, string>
	return makeApiCall(
		"/Catalog/ReportItem",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Creates or updates a review for the specified item. More information around
	the caching surrounding item ratings and reviews can be found here:
	https://learn.microsoft.com/en-us/gaming/playfab/features/economy-v2/catalog/ratings#ratings-design-and-caching

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/economy/catalog/reviewitem).

	### Errors
	- DatabaseThroughputExceeded
	- ItemNotFound

]]
function Apis.ReviewItem(request: Types.ReviewItemRequest, entityToken: string): Result<Types.ReviewItemResponse, string>
	return makeApiCall(
		"/Catalog/ReviewItem",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Transfer inventory items. When transferring across collections, a 202
	response indicates that the transfer did not complete within the timeframe
	of the request. You can identify the pending operations by looking for
	OperationStatus = 'InProgress'. You can check on the operation status at
	anytime within 1 day of the request by passing the TransactionToken to the
	GetInventoryOperationStatus API. More information about item transfer
	scenarios can be found here:
	https://learn.microsoft.com/en-us/gaming/playfab/features/economy-v2/inventory/?tabs=inventory-game-manager#transfer-inventory-items

	Transfer the specified inventory items of an entity's container Id to
	another entity's container Id.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/economy/inventory/transferinventoryitems).

	### Errors
	- DatabaseThroughputExceeded
	- InsufficientFunds
	- ItemNotFound

]]
function Apis.TransferInventoryItems(request: Types.TransferInventoryItemsRequest, entityToken: string): Result<Types.TransferInventoryItemsResponse, string>
	return makeApiCall(
		"/Inventory/TransferInventoryItems",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Add inventory items. Up to 10,000 stacks of items can be added to a single
	inventory collection. Stack size is uncapped.

	Given an entity type, entity identifier and container details, will add the
	specified inventory items.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/economy/inventory/addinventoryitems).

	### Errors
	- DatabaseThroughputExceeded
	- InvalidCatalogItemConfiguration
	- ItemNotFound

]]
function Apis.AddInventoryItems(request: Types.AddInventoryItemsRequest, entityToken: string): Result<Types.AddInventoryItemsResponse, string>
	return makeApiCall(
		"/Inventory/AddInventoryItems",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Redeem items.

	Redeem items from the Nintendo EShop.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/economy/inventory/redeemnintendoeshopinventoryitems).

	### Errors
	- AccountNotLinked
	- InvalidCatalogItemConfiguration
	- InvalidNintendoSwitchAccountId

]]
function Apis.RedeemNintendoEShopInventoryItems(request: Types.RedeemNintendoEShopInventoryItemsRequest, entityToken: string): Result<Types.RedeemNintendoEShopInventoryItemsResponse, string>
	return makeApiCall(
		"/Inventory/RedeemNintendoEShopInventoryItems",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Deletes all reviews, helpfulness votes, and ratings submitted by the entity
	specified.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/economy/catalog/deleteentityitemreviews).

	### Errors
	- ProfileDoesNotExist

]]
function Apis.DeleteEntityItemReviews(request: Types.DeleteEntityItemReviewsRequest, entityToken: string): Result<Types.DeleteEntityItemReviewsResponse, string>
	return makeApiCall(
		"/Catalog/DeleteEntityItemReviews",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Retrieves items from the public catalog. Up to 50 items can be returned at
	once. GetItems does not work off a cache of the Catalog and should be used
	when trying to get recent item updates. However, please note that item
	references data is cached and may take a few moments for changes to
	propagate.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/economy/catalog/getitems).

	### Errors
	- ItemNotFound
	- NotImplemented

]]
function Apis.GetItems(request: Types.GetItemsRequest, entityToken: string): Result<Types.GetItemsResponse, string>
	return makeApiCall(
		"/Catalog/GetItems",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Initiates a publish of an item from the working catalog to the public
	catalog. You can use the GetItemPublishStatus API to track the state of the
	item publish.

	The call kicks off a workflow to publish the item to the public catalog. The
	Publish Status API should be used to monitor the publish job.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/economy/catalog/publishdraftitem).

	### Errors
	- DatabaseThroughputExceeded
	- ItemNotFound

]]
function Apis.PublishDraftItem(request: Types.PublishDraftItemRequest, entityToken: string): Result<Types.PublishDraftItemResponse, string>
	return makeApiCall(
		"/Catalog/PublishDraftItem",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Update inventory items

	Given an entity type, entity identifier and container details, will update
	the entity's inventory items

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/economy/inventory/updateinventoryitems).

	### Errors
	- DatabaseThroughputExceeded
	- ItemNotFound

]]
function Apis.UpdateInventoryItems(request: Types.UpdateInventoryItemsRequest, entityToken: string): Result<Types.UpdateInventoryItemsResponse, string>
	return makeApiCall(
		"/Inventory/UpdateInventoryItems",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Execute a list of Inventory Operations. A maximum list of 50 operations can
	be performed by a single request. There is also a limit to 300 items that
	can be modified/added in a single request. For example, adding a bundle with
	50 items counts as 50 items modified. All operations must be done within a
	single inventory collection. This API has a reduced RPS compared to an
	individual inventory operation with Player Entities limited to 60 requests
	in 90 seconds.

	Execute a list of Inventory Operations for an Entity

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/economy/inventory/executeinventoryoperations).

	### Errors
	- DatabaseThroughputExceeded
	- InsufficientFunds
	- InvalidCatalogItemConfiguration
	- ItemNotFound

]]
function Apis.ExecuteInventoryOperations(request: Types.ExecuteInventoryOperationsRequest, entityToken: string): Result<Types.ExecuteInventoryOperationsResponse, string>
	return makeApiCall(
		"/Inventory/ExecuteInventoryOperations",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Removes an item from working catalog and all published versions from the
	public catalog.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/economy/catalog/deleteitem).

	### Errors
	- DatabaseThroughputExceeded
	- ItemNotFound

]]
function Apis.DeleteItem(request: Types.DeleteItemRequest, entityToken: string): Result<Types.DeleteItemResponse, string>
	return makeApiCall(
		"/Catalog/DeleteItem",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Get current inventory items.

	Given an entity type, entity identifier and container details, will get the
	entity's inventory items.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/economy/inventory/getinventoryitems).

	### Errors
	- AccountDeleted
	- DatabaseThroughputExceeded

]]
function Apis.GetInventoryItems(request: Types.GetInventoryItemsRequest, entityToken: string): Result<Types.GetInventoryItemsResponse, string>
	return makeApiCall(
		"/Inventory/GetInventoryItems",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Executes a search against the public catalog using the provided search
	parameters and returns a set of paginated results. SearchItems uses a cache
	of the catalog with item updates taking up to a few minutes to propagate.
	You should use the GetItem API for when trying to immediately get recent
	item updates. More information about the Search API can be found here:
	https://learn.microsoft.com/en-us/gaming/playfab/features/economy-v2/catalog/search

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/economy/catalog/searchitems).

	### Errors
	- DatabaseThroughputExceeded
	- ItemNotFound
	- NotImplemented

]]
function Apis.SearchItems(request: Types.SearchItemsRequest, entityToken: string): Result<Types.SearchItemsResponse, string>
	return makeApiCall(
		"/Catalog/SearchItems",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Sets the moderation state for an item, including the concern category and
	string reason. More information about moderation states can be found here:
	https://learn.microsoft.com/en-us/gaming/playfab/features/economy-v2/ugc/moderation

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/economy/catalog/setitemmoderationstate).

	### Errors
	- DatabaseThroughputExceeded
	- ItemNotFound

]]
function Apis.SetItemModerationState(request: Types.SetItemModerationStateRequest, entityToken: string): Result<Types.SetItemModerationStateResponse, string>
	return makeApiCall(
		"/Catalog/SetItemModerationState",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Transfer a list of inventory items. A maximum list of 50 operations can be
	performed by a single request. When the response code is 202, one or more
	operations did not complete within the timeframe of the request. You can
	identify the pending operations by looking for OperationStatus =
	'InProgress'. You can check on the operation status at anytime within 1 day
	of the request by passing the TransactionToken to the
	GetInventoryOperationStatus API.

	Transfer the specified list of inventory items of an entity's container Id
	to another entity's container Id.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/economy/inventory/executetransferoperations).

	### Errors
	- DatabaseThroughputExceeded
	- InsufficientFunds
	- ItemNotFound

]]
function Apis.ExecuteTransferOperations(request: Types.ExecuteTransferOperationsRequest, entityToken: string): Result<Types.ExecuteTransferOperationsResponse, string>
	return makeApiCall(
		"/Inventory/ExecuteTransferOperations",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Gets the submitted review for the specified item by the authenticated
	entity. Individual ratings and reviews data update in near real time with
	delays within a few seconds.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/economy/catalog/getentityitemreview).

	### Errors
	- DatabaseThroughputExceeded
	- ItemNotFound

]]
function Apis.GetEntityItemReview(request: Types.GetEntityItemReviewRequest, entityToken: string): Result<Types.GetEntityItemReviewResponse, string>
	return makeApiCall(
		"/Catalog/GetEntityItemReview",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Submit a request to takedown one or more reviews.

	Submit a request to takedown one or more reviews, removing them from public
	view. Authors will still be able to see their reviews after being taken
	down.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/economy/catalog/takedownitemreviews).

	### Errors
	- DatabaseThroughputExceeded
	- ItemNotFound

]]
function Apis.TakedownItemReviews(request: Types.TakedownItemReviewsRequest, entityToken: string): Result<Types.TakedownItemReviewsResponse, string>
	return makeApiCall(
		"/Catalog/TakedownItemReviews",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Redeem items.

	Redeem items from the Google Play Store.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/economy/inventory/redeemgoogleplayinventoryitems).

	### Errors
	- InvalidCatalogItemConfiguration

]]
function Apis.RedeemGooglePlayInventoryItems(request: Types.RedeemGooglePlayInventoryItemsRequest, entityToken: string): Result<Types.RedeemGooglePlayInventoryItemsResponse, string>
	return makeApiCall(
		"/Inventory/RedeemGooglePlayInventoryItems",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Get a summary of all ratings and reviews associated with the specified item.
	Summary ratings data is cached with update data coming within 15 minutes.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/economy/catalog/getitemreviewsummary).

	### Errors
	- DatabaseThroughputExceeded
	- ItemNotFound

]]
function Apis.GetItemReviewSummary(request: Types.GetItemReviewSummaryRequest, entityToken: string): Result<Types.GetItemReviewSummaryResponse, string>
	return makeApiCall(
		"/Catalog/GetItemReviewSummary",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Retrieves a paginated list of the items from the draft catalog created by
	the Entity. Up to 50 items can be returned at once. You can use continuation
	tokens to paginate through results that return greater than the limit.
	GetEntityDraftItems does not work off a cache of the Catalog and should be
	used when trying to get recent item updates.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/economy/catalog/getentitydraftitems).

	### Errors
	- DatabaseThroughputExceeded
	- ItemNotFound

]]
function Apis.GetEntityDraftItems(request: Types.GetEntityDraftItemsRequest, entityToken: string): Result<Types.GetEntityDraftItemsResponse, string>
	return makeApiCall(
		"/Catalog/GetEntityDraftItems",
		request,
		"X-EntityToken",
		entityToken
	)
end

return Apis
