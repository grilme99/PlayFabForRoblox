--!strict

local PlayFabInternal = require(script.Parent.Parent.PlayFabInternal)
local Types = require(script.Parent.Types)

local Apis = {}

--- The item will not be published to the public catalog until the PublishItem API 
--- is called for the item. 
---
--- https://docs.microsoft.com/rest/api/playfab/economy/catalog/createdraftitem
function Apis.CreateDraftItemAsync(
	entityToken: string, 
	request: Types.CreateDraftItemRequest
): Types.CreateDraftItemResponse
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
function Apis.CreateUploadUrlsAsync(
	entityToken: string, 
	request: Types.CreateUploadUrlsRequest
): Types.CreateUploadUrlsResponse
	return PlayFabInternal.MakeApiCall(
		"/Catalog/CreateUploadUrls",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/economy/catalog/deleteentityitemreviews
function Apis.DeleteEntityItemReviewsAsync(
	entityToken: string, 
	request: Types.DeleteEntityItemReviewsRequest
): Types.DeleteEntityItemReviewsResponse
	return PlayFabInternal.MakeApiCall(
		"/Catalog/DeleteEntityItemReviews",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/economy/catalog/deleteitem
function Apis.DeleteItemAsync(
	entityToken: string, 
	request: Types.DeleteItemRequest
): Types.DeleteItemResponse
	return PlayFabInternal.MakeApiCall(
		"/Catalog/DeleteItem",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/economy/catalog/getcatalogconfig
function Apis.GetCatalogConfigAsync(
	entityToken: string, 
	request: Types.GetCatalogConfigRequest
): Types.GetCatalogConfigResponse
	return PlayFabInternal.MakeApiCall(
		"/Catalog/GetCatalogConfig",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/economy/catalog/getdraftitem
function Apis.GetDraftItemAsync(
	entityToken: string, 
	request: Types.GetDraftItemRequest
): Types.GetDraftItemResponse
	return PlayFabInternal.MakeApiCall(
		"/Catalog/GetDraftItem",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/economy/catalog/getdraftitems
function Apis.GetDraftItemsAsync(
	entityToken: string, 
	request: Types.GetDraftItemsRequest
): Types.GetDraftItemsResponse
	return PlayFabInternal.MakeApiCall(
		"/Catalog/GetDraftItems",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/economy/catalog/getentitydraftitems
function Apis.GetEntityDraftItemsAsync(
	entityToken: string, 
	request: Types.GetEntityDraftItemsRequest
): Types.GetEntityDraftItemsResponse
	return PlayFabInternal.MakeApiCall(
		"/Catalog/GetEntityDraftItems",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/economy/catalog/getentityitemreview
function Apis.GetEntityItemReviewAsync(
	entityToken: string, 
	request: Types.GetEntityItemReviewRequest
): Types.GetEntityItemReviewResponse
	return PlayFabInternal.MakeApiCall(
		"/Catalog/GetEntityItemReview",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/economy/catalog/getitem
function Apis.GetItemAsync(
	entityToken: string, 
	request: Types.GetItemRequest
): Types.GetItemResponse
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
function Apis.GetItemContainersAsync(
	entityToken: string, 
	request: Types.GetItemContainersRequest
): Types.GetItemContainersResponse
	return PlayFabInternal.MakeApiCall(
		"/Catalog/GetItemContainers",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/economy/catalog/getitemmoderationstate
function Apis.GetItemModerationStateAsync(
	entityToken: string, 
	request: Types.GetItemModerationStateRequest
): Types.GetItemModerationStateResponse
	return PlayFabInternal.MakeApiCall(
		"/Catalog/GetItemModerationState",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/economy/catalog/getitempublishstatus
function Apis.GetItemPublishStatusAsync(
	entityToken: string, 
	request: Types.GetItemPublishStatusRequest
): Types.GetItemPublishStatusResponse
	return PlayFabInternal.MakeApiCall(
		"/Catalog/GetItemPublishStatus",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/economy/catalog/getitemreviewsummary
function Apis.GetItemReviewSummaryAsync(
	entityToken: string, 
	request: Types.GetItemReviewSummaryRequest
): Types.GetItemReviewSummaryResponse
	return PlayFabInternal.MakeApiCall(
		"/Catalog/GetItemReviewSummary",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/economy/catalog/getitemreviews
function Apis.GetItemReviewsAsync(
	entityToken: string, 
	request: Types.GetItemReviewsRequest
): Types.GetItemReviewsResponse
	return PlayFabInternal.MakeApiCall(
		"/Catalog/GetItemReviews",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/economy/catalog/getitems
function Apis.GetItemsAsync(
	entityToken: string, 
	request: Types.GetItemsRequest
): Types.GetItemsResponse
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
function Apis.PublishDraftItemAsync(
	entityToken: string, 
	request: Types.PublishDraftItemRequest
): Types.PublishDraftItemResponse
	return PlayFabInternal.MakeApiCall(
		"/Catalog/PublishDraftItem",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/economy/catalog/reportitem
function Apis.ReportItemAsync(
	entityToken: string, 
	request: Types.ReportItemRequest
): Types.ReportItemResponse
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
function Apis.ReportItemReviewAsync(
	entityToken: string, 
	request: Types.ReportItemReviewRequest
): Types.ReportItemReviewResponse
	return PlayFabInternal.MakeApiCall(
		"/Catalog/ReportItemReview",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/economy/catalog/reviewitem
function Apis.ReviewItemAsync(
	entityToken: string, 
	request: Types.ReviewItemRequest
): Types.ReviewItemResponse
	return PlayFabInternal.MakeApiCall(
		"/Catalog/ReviewItem",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/economy/catalog/searchitems
function Apis.SearchItemsAsync(
	entityToken: string, 
	request: Types.SearchItemsRequest
): Types.SearchItemsResponse
	return PlayFabInternal.MakeApiCall(
		"/Catalog/SearchItems",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/economy/catalog/setitemmoderationstate
function Apis.SetItemModerationStateAsync(
	entityToken: string, 
	request: Types.SetItemModerationStateRequest
): Types.SetItemModerationStateResponse
	return PlayFabInternal.MakeApiCall(
		"/Catalog/SetItemModerationState",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/economy/catalog/submititemreviewvote
function Apis.SubmitItemReviewVoteAsync(
	entityToken: string, 
	request: Types.SubmitItemReviewVoteRequest
): Types.SubmitItemReviewVoteResponse
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
function Apis.TakedownItemReviewsAsync(
	entityToken: string, 
	request: Types.TakedownItemReviewsRequest
): Types.TakedownItemReviewsResponse
	return PlayFabInternal.MakeApiCall(
		"/Catalog/TakedownItemReviews",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/economy/catalog/updatecatalogconfig
function Apis.UpdateCatalogConfigAsync(
	entityToken: string, 
	request: Types.UpdateCatalogConfigRequest
): Types.UpdateCatalogConfigResponse
	return PlayFabInternal.MakeApiCall(
		"/Catalog/UpdateCatalogConfig",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/economy/catalog/updatedraftitem
function Apis.UpdateDraftItemAsync(
	entityToken: string, 
	request: Types.UpdateDraftItemRequest
): Types.UpdateDraftItemResponse
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
function Apis.AddInventoryItemsAsync(
	entityToken: string, 
	request: Types.AddInventoryItemsRequest
): Types.AddInventoryItemsResponse
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
function Apis.DeleteInventoryCollectionAsync(
	entityToken: string, 
	request: Types.DeleteInventoryCollectionRequest
): Types.DeleteInventoryCollectionResponse
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
function Apis.DeleteInventoryItemsAsync(
	entityToken: string, 
	request: Types.DeleteInventoryItemsRequest
): Types.DeleteInventoryItemsResponse
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
function Apis.ExecuteInventoryOperationsAsync(
	entityToken: string, 
	request: Types.ExecuteInventoryOperationsRequest
): Types.ExecuteInventoryOperationsResponse
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
function Apis.GetInventoryCollectionIdsAsync(
	entityToken: string, 
	request: Types.GetInventoryCollectionIdsRequest
): Types.GetInventoryCollectionIdsResponse
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
function Apis.GetInventoryItemsAsync(
	entityToken: string, 
	request: Types.GetInventoryItemsRequest
): Types.GetInventoryItemsResponse
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
function Apis.GetMicrosoftStoreAccessTokensAsync(
	entityToken: string, 
	request: Types.GetMicrosoftStoreAccessTokensRequest
): Types.GetMicrosoftStoreAccessTokensResponse
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
function Apis.PurchaseInventoryItemsAsync(
	entityToken: string, 
	request: Types.PurchaseInventoryItemsRequest
): Types.PurchaseInventoryItemsResponse
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
function Apis.RedeemAppleAppStoreInventoryItemsAsync(
	entityToken: string, 
	request: Types.RedeemAppleAppStoreInventoryItemsRequest
): Types.RedeemAppleAppStoreInventoryItemsResponse
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
function Apis.RedeemGooglePlayInventoryItemsAsync(
	entityToken: string, 
	request: Types.RedeemGooglePlayInventoryItemsRequest
): Types.RedeemGooglePlayInventoryItemsResponse
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
function Apis.RedeemMicrosoftStoreInventoryItemsAsync(
	entityToken: string, 
	request: Types.RedeemMicrosoftStoreInventoryItemsRequest
): Types.RedeemMicrosoftStoreInventoryItemsResponse
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
function Apis.RedeemNintendoEShopInventoryItemsAsync(
	entityToken: string, 
	request: Types.RedeemNintendoEShopInventoryItemsRequest
): Types.RedeemNintendoEShopInventoryItemsResponse
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
function Apis.RedeemPlayStationStoreInventoryItemsAsync(
	entityToken: string, 
	request: Types.RedeemPlayStationStoreInventoryItemsRequest
): Types.RedeemPlayStationStoreInventoryItemsResponse
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
function Apis.RedeemSteamInventoryItemsAsync(
	entityToken: string, 
	request: Types.RedeemSteamInventoryItemsRequest
): Types.RedeemSteamInventoryItemsResponse
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
function Apis.SubtractInventoryItemsAsync(
	entityToken: string, 
	request: Types.SubtractInventoryItemsRequest
): Types.SubtractInventoryItemsResponse
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
function Apis.TransferInventoryItemsAsync(
	entityToken: string, 
	request: Types.TransferInventoryItemsRequest
): Types.TransferInventoryItemsResponse
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
function Apis.UpdateInventoryItemsAsync(
	entityToken: string, 
	request: Types.UpdateInventoryItemsRequest
): Types.UpdateInventoryItemsResponse
	return PlayFabInternal.MakeApiCall(
		"/Inventory/UpdateInventoryItems",
		request,
		"X-EntityToken",
		entityToken
	)
end

return Apis

