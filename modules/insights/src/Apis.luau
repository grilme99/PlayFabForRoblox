--[[
	This file was generated on 2025-08-03 at 00:04 UTC. Do not edit directly.

]]

local Types = require(script.Parent.Types)

local Common = require(script.Parent.Parent.PlayFabCommon)
local makeApiCall = Common.makeApiCall
type Result<T, E> = Common.Result<T, E>

local Apis = {}

--[[
	Sets the Insights performance level value for the title.

	Sets the performance level to the requested value. Use the GetLimits method
	to get the allowed values.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/insights/analytics/setperformance).

	### Errors
	- InsightsManagementDatabaseNotFound
	- InsightsManagementErrorPendingOperationExists
	- InsightsManagementNewActiveEventExportLimitInvalid
	- InsightsManagementSetPerformanceLevelInvalidParameter
	- PaidInsightsFeaturesNotEnabled
	- TitleNotOnUpdatedPricingPlan

]]
function Apis.SetPerformance(request: Types.InsightsSetPerformanceRequest, entityToken: string): Result<Types.InsightsOperationResponse, string>
	return makeApiCall(
		"/Insights/SetPerformance",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Gets a list of pending SetPerformance and/or SetStorageRetention operations
	for the title.

	Returns a list of operations that are in the pending state for the requested
	operation type.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/insights/analytics/getpendingoperations).

]]
function Apis.GetPendingOperations(request: Types.InsightsGetPendingOperationsRequest, entityToken: string): Result<Types.InsightsGetPendingOperationsResponse, string>
	return makeApiCall(
		"/Insights/GetPendingOperations",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Gets the current values for the Insights performance and data storage
	retention, list of pending operations, and the performance and data storage
	retention limits.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/insights/analytics/getdetails).

]]
function Apis.GetDetails(request: Types.InsightsEmptyRequest, entityToken: string): Result<Types.InsightsGetDetailsResponse, string>
	return makeApiCall(
		"/Insights/GetDetails",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Retrieves the range of allowed values for performance and data storage
	retention values as well as the submeter details for each performance level.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/insights/analytics/getlimits).

]]
function Apis.GetLimits(request: Types.InsightsEmptyRequest, entityToken: string): Result<Types.InsightsGetLimitsResponse, string>
	return makeApiCall(
		"/Insights/GetLimits",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Gets the status of a SetPerformance or SetStorageRetention operation.

	Returns the current status for the requested operation id.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/insights/analytics/getoperationstatus).

	### Errors
	- InsightsManagementGetOperationStatusInvalidParameter
	- InsightsManagementOperationNotFound

]]
function Apis.GetOperationStatus(request: Types.InsightsGetOperationStatusRequest, entityToken: string): Result<Types.InsightsGetOperationStatusResponse, string>
	return makeApiCall(
		"/Insights/GetOperationStatus",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Sets the Insights data storage retention days value for the title.

	Sets the data storage retention to the requested value. Use the GetLimits
	method to get the range of allowed values.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/insights/analytics/setstorageretention).

	### Errors
	- InsightsManagementDatabaseNotFound
	- InsightsManagementErrorPendingOperationExists
	- InsightsManagementSetStorageRetentionAboveMaximum
	- InsightsManagementSetStorageRetentionBelowMinimum
	- InsightsManagementSetStorageRetentionInvalidParameter
	- PaidInsightsFeaturesNotEnabled
	- TelemetryKeyLongInsightsRetentionNotAllowed
	- TitleNotOnUpdatedPricingPlan

]]
function Apis.SetStorageRetention(request: Types.InsightsSetStorageRetentionRequest, entityToken: string): Result<Types.InsightsOperationResponse, string>
	return makeApiCall(
		"/Insights/SetStorageRetention",
		request,
		"X-EntityToken",
		entityToken
	)
end

return Apis
