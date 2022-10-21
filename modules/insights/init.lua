--!strict
--[=[
	# InsightsApi

	Manage the Insights performance level and data storage retention settings. 

	API Version: 1.221009.0
]=]

local PlayFabInternal = require(script.Parent.PlayFabInternal)
local Types = require(script.Types)

local InsightsApi = require(script.Apis)

function InsightsApi.SetSettings(settings: PlayFabInternal.ISettings)
	PlayFabInternal.SetSettings(settings)
end

export type ApiErrorWrapper = Types.ApiErrorWrapper
export type InsightsEmptyRequest = Types.InsightsEmptyRequest
export type InsightsGetDetailsResponse = Types.InsightsGetDetailsResponse
export type InsightsGetLimitsResponse = Types.InsightsGetLimitsResponse
export type InsightsGetOperationStatusRequest = Types.InsightsGetOperationStatusRequest
export type InsightsGetOperationStatusResponse = Types.InsightsGetOperationStatusResponse
export type InsightsGetPendingOperationsRequest = Types.InsightsGetPendingOperationsRequest
export type InsightsGetPendingOperationsResponse = Types.InsightsGetPendingOperationsResponse
export type InsightsOperationResponse = Types.InsightsOperationResponse
export type InsightsPerformanceLevel = Types.InsightsPerformanceLevel
export type InsightsSetPerformanceRequest = Types.InsightsSetPerformanceRequest
export type InsightsSetStorageRetentionRequest = Types.InsightsSetStorageRetentionRequest

return InsightsApi

