--!strict
--[=[
	# EconomyApi

	API methods for managing the catalog. Inventory manages in-game assets for any 
	given entity. 

	API Version: 1.221008.0
]=]

local PlayFabInternal = require(script.Parent.PlayFabInternal)
local Types = require(script.Types)

local EconomyApi = require(script.Apis)

function EconomyApi.SetSettings(settings: PlayFabInternal.ISettings)
	PlayFabInternal.SetSettings(settings)
end

export type AddInventoryItemsOperation = Types.AddInventoryItemsOperation
export type AddInventoryItemsRequest = Types.AddInventoryItemsRequest
export type AddInventoryItemsResponse = Types.AddInventoryItemsResponse
export type AlternateId = Types.AlternateId
export type ApiErrorWrapper = Types.ApiErrorWrapper
export type CatalogAlternateId = Types.CatalogAlternateId
export type CatalogConfig = Types.CatalogConfig
export type CatalogItem = Types.CatalogItem
export type CatalogItemReference = Types.CatalogItemReference
export type CatalogPrice = Types.CatalogPrice
export type CatalogPriceAmount = Types.CatalogPriceAmount
export type CatalogPriceAmountOverride = Types.CatalogPriceAmountOverride
export type CatalogPriceOptions = Types.CatalogPriceOptions
export type CatalogPriceOptionsOverride = Types.CatalogPriceOptionsOverride
export type CatalogPriceOverride = Types.CatalogPriceOverride
export type CatalogSpecificConfig = Types.CatalogSpecificConfig
export type ConcernCategory = Types.ConcernCategory
export type Content = Types.Content
export type ContentFeed = Types.ContentFeed
export type CountryCode = Types.CountryCode
export type CreateDraftItemRequest = Types.CreateDraftItemRequest
export type CreateDraftItemResponse = Types.CreateDraftItemResponse
export type CreateUploadUrlsRequest = Types.CreateUploadUrlsRequest
export type CreateUploadUrlsResponse = Types.CreateUploadUrlsResponse
export type DeepLink = Types.DeepLink
export type DeepLinkFormat = Types.DeepLinkFormat
export type DeleteEntityItemReviewsRequest = Types.DeleteEntityItemReviewsRequest
export type DeleteEntityItemReviewsResponse = Types.DeleteEntityItemReviewsResponse
export type DeleteInventoryCollectionRequest = Types.DeleteInventoryCollectionRequest
export type DeleteInventoryCollectionResponse = Types.DeleteInventoryCollectionResponse
export type DeleteInventoryItemsOperation = Types.DeleteInventoryItemsOperation
export type DeleteInventoryItemsRequest = Types.DeleteInventoryItemsRequest
export type DeleteInventoryItemsResponse = Types.DeleteInventoryItemsResponse
export type DeleteItemRequest = Types.DeleteItemRequest
export type DeleteItemResponse = Types.DeleteItemResponse
export type DisplayPropertyIndexInfo = Types.DisplayPropertyIndexInfo
export type DisplayPropertyType = Types.DisplayPropertyType
export type EntityKey = Types.EntityKey
export type ExecuteInventoryOperationsRequest = Types.ExecuteInventoryOperationsRequest
export type ExecuteInventoryOperationsResponse = Types.ExecuteInventoryOperationsResponse
export type FileConfig = Types.FileConfig
export type FilterOptions = Types.FilterOptions
export type GetCatalogConfigRequest = Types.GetCatalogConfigRequest
export type GetCatalogConfigResponse = Types.GetCatalogConfigResponse
export type GetDraftItemRequest = Types.GetDraftItemRequest
export type GetDraftItemResponse = Types.GetDraftItemResponse
export type GetDraftItemsRequest = Types.GetDraftItemsRequest
export type GetDraftItemsResponse = Types.GetDraftItemsResponse
export type GetEntityDraftItemsRequest = Types.GetEntityDraftItemsRequest
export type GetEntityDraftItemsResponse = Types.GetEntityDraftItemsResponse
export type GetEntityItemReviewRequest = Types.GetEntityItemReviewRequest
export type GetEntityItemReviewResponse = Types.GetEntityItemReviewResponse
export type GetInventoryCollectionIdsRequest = Types.GetInventoryCollectionIdsRequest
export type GetInventoryCollectionIdsResponse = Types.GetInventoryCollectionIdsResponse
export type GetInventoryItemsRequest = Types.GetInventoryItemsRequest
export type GetInventoryItemsResponse = Types.GetInventoryItemsResponse
export type GetItemContainersRequest = Types.GetItemContainersRequest
export type GetItemContainersResponse = Types.GetItemContainersResponse
export type GetItemModerationStateRequest = Types.GetItemModerationStateRequest
export type GetItemModerationStateResponse = Types.GetItemModerationStateResponse
export type GetItemPublishStatusRequest = Types.GetItemPublishStatusRequest
export type GetItemPublishStatusResponse = Types.GetItemPublishStatusResponse
export type GetItemRequest = Types.GetItemRequest
export type GetItemResponse = Types.GetItemResponse
export type GetItemReviewSummaryRequest = Types.GetItemReviewSummaryRequest
export type GetItemReviewSummaryResponse = Types.GetItemReviewSummaryResponse
export type GetItemReviewsRequest = Types.GetItemReviewsRequest
export type GetItemReviewsResponse = Types.GetItemReviewsResponse
export type GetItemsRequest = Types.GetItemsRequest
export type GetItemsResponse = Types.GetItemsResponse
export type GetMicrosoftStoreAccessTokensRequest = Types.GetMicrosoftStoreAccessTokensRequest
export type GetMicrosoftStoreAccessTokensResponse = Types.GetMicrosoftStoreAccessTokensResponse
export type GooglePlayProductPurchase = Types.GooglePlayProductPurchase
export type HelpfulnessVote = Types.HelpfulnessVote
export type Image = Types.Image
export type ImageConfig = Types.ImageConfig
export type InventoryItem = Types.InventoryItem
export type InventoryItemReference = Types.InventoryItemReference
export type InventoryOperation = Types.InventoryOperation
export type KeywordSet = Types.KeywordSet
export type ModerationState = Types.ModerationState
export type ModerationStatus = Types.ModerationStatus
export type PayoutDetails = Types.PayoutDetails
export type PublishDraftItemRequest = Types.PublishDraftItemRequest
export type PublishDraftItemResponse = Types.PublishDraftItemResponse
export type PublishResult = Types.PublishResult
export type PurchaseInventoryItemsOperation = Types.PurchaseInventoryItemsOperation
export type PurchaseInventoryItemsRequest = Types.PurchaseInventoryItemsRequest
export type PurchaseInventoryItemsResponse = Types.PurchaseInventoryItemsResponse
export type PurchaseOverride = Types.PurchaseOverride
export type PurchasePriceAmount = Types.PurchasePriceAmount
export type Rating = Types.Rating
export type RedeemAppleAppStoreInventoryItemsRequest = Types.RedeemAppleAppStoreInventoryItemsRequest
export type RedeemAppleAppStoreInventoryItemsResponse = Types.RedeemAppleAppStoreInventoryItemsResponse
export type RedeemGooglePlayInventoryItemsRequest = Types.RedeemGooglePlayInventoryItemsRequest
export type RedeemGooglePlayInventoryItemsResponse = Types.RedeemGooglePlayInventoryItemsResponse
export type RedeemMicrosoftStoreInventoryItemsRequest = Types.RedeemMicrosoftStoreInventoryItemsRequest
export type RedeemMicrosoftStoreInventoryItemsResponse = Types.RedeemMicrosoftStoreInventoryItemsResponse
export type RedeemNintendoEShopInventoryItemsRequest = Types.RedeemNintendoEShopInventoryItemsRequest
export type RedeemNintendoEShopInventoryItemsResponse = Types.RedeemNintendoEShopInventoryItemsResponse
export type RedeemPlayStationStoreInventoryItemsRequest = Types.RedeemPlayStationStoreInventoryItemsRequest
export type RedeemPlayStationStoreInventoryItemsResponse = Types.RedeemPlayStationStoreInventoryItemsResponse
export type RedeemSteamInventoryItemsRequest = Types.RedeemSteamInventoryItemsRequest
export type RedeemSteamInventoryItemsResponse = Types.RedeemSteamInventoryItemsResponse
export type RedemptionFailure = Types.RedemptionFailure
export type RedemptionSuccess = Types.RedemptionSuccess
export type ReportItemRequest = Types.ReportItemRequest
export type ReportItemResponse = Types.ReportItemResponse
export type ReportItemReviewRequest = Types.ReportItemReviewRequest
export type ReportItemReviewResponse = Types.ReportItemReviewResponse
export type Review = Types.Review
export type ReviewItemRequest = Types.ReviewItemRequest
export type ReviewItemResponse = Types.ReviewItemResponse
export type ReviewTakedown = Types.ReviewTakedown
export type ScanResult = Types.ScanResult
export type SearchItemsRequest = Types.SearchItemsRequest
export type SearchItemsResponse = Types.SearchItemsResponse
export type SetItemModerationStateRequest = Types.SetItemModerationStateRequest
export type SetItemModerationStateResponse = Types.SetItemModerationStateResponse
export type StoreDetails = Types.StoreDetails
export type StoreReference = Types.StoreReference
export type SubmitItemReviewVoteRequest = Types.SubmitItemReviewVoteRequest
export type SubmitItemReviewVoteResponse = Types.SubmitItemReviewVoteResponse
export type SubscriptionDetails = Types.SubscriptionDetails
export type SubtractInventoryItemsOperation = Types.SubtractInventoryItemsOperation
export type SubtractInventoryItemsRequest = Types.SubtractInventoryItemsRequest
export type SubtractInventoryItemsResponse = Types.SubtractInventoryItemsResponse
export type TakedownItemReviewsRequest = Types.TakedownItemReviewsRequest
export type TakedownItemReviewsResponse = Types.TakedownItemReviewsResponse
export type TransferInventoryItemsOperation = Types.TransferInventoryItemsOperation
export type TransferInventoryItemsRequest = Types.TransferInventoryItemsRequest
export type TransferInventoryItemsResponse = Types.TransferInventoryItemsResponse
export type UpdateCatalogConfigRequest = Types.UpdateCatalogConfigRequest
export type UpdateCatalogConfigResponse = Types.UpdateCatalogConfigResponse
export type UpdateDraftItemRequest = Types.UpdateDraftItemRequest
export type UpdateDraftItemResponse = Types.UpdateDraftItemResponse
export type UpdateInventoryItemsOperation = Types.UpdateInventoryItemsOperation
export type UpdateInventoryItemsRequest = Types.UpdateInventoryItemsRequest
export type UpdateInventoryItemsResponse = Types.UpdateInventoryItemsResponse
export type UploadInfo = Types.UploadInfo
export type UploadUrlMetadata = Types.UploadUrlMetadata
export type UserGeneratedContentSpecificConfig = Types.UserGeneratedContentSpecificConfig

return EconomyApi

