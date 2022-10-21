--!strict

local PlayFabInternal = require(script.Parent.Parent.PlayFabInternal)
local Types = require(script.Parent.Types)

local Apis = {}

--- https://docs.microsoft.com/rest/api/playfab/insights/analytics/getdetails
function Apis.GetDetailsAsync(
	entityToken: string, 
	request: Types.InsightsEmptyRequest
): Types.InsightsGetDetailsResponse
	return PlayFabInternal.MakeApiCall(
		"/Insights/GetDetails",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/insights/analytics/getlimits
function Apis.GetLimitsAsync(
	entityToken: string, 
	request: Types.InsightsEmptyRequest
): Types.InsightsGetLimitsResponse
	return PlayFabInternal.MakeApiCall(
		"/Insights/GetLimits",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/insights/analytics/getoperationstatus
function Apis.GetOperationStatusAsync(
	entityToken: string, 
	request: Types.InsightsGetOperationStatusRequest
): Types.InsightsGetOperationStatusResponse
	return PlayFabInternal.MakeApiCall(
		"/Insights/GetOperationStatus",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/insights/analytics/getpendingoperations
function Apis.GetPendingOperationsAsync(
	entityToken: string, 
	request: Types.InsightsGetPendingOperationsRequest
): Types.InsightsGetPendingOperationsResponse
	return PlayFabInternal.MakeApiCall(
		"/Insights/GetPendingOperations",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/insights/analytics/setperformance
function Apis.SetPerformanceAsync(
	entityToken: string, 
	request: Types.InsightsSetPerformanceRequest
): Types.InsightsOperationResponse
	return PlayFabInternal.MakeApiCall(
		"/Insights/SetPerformance",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/insights/analytics/setstorageretention
function Apis.SetStorageRetentionAsync(
	entityToken: string, 
	request: Types.InsightsSetStorageRetentionRequest
): Types.InsightsOperationResponse
	return PlayFabInternal.MakeApiCall(
		"/Insights/SetStorageRetention",
		request,
		"X-EntityToken",
		entityToken
	)
end

return Apis

