--!strict
--[=[
	# InsightsApi

	Manage the Insights performance level and data storage retention settings. 
]=]

local PlayFabInternal = require(script.Parent.PlayFabInternal)

local InsightsApi = {}

function InsightsApi.SetSettings(settings: PlayFabInternal.ISettings)
	PlayFabInternal.SetSettings(settings)
end

--- The basic wrapper around every failed API response 
export type ApiErrorWrapper = {
	code: number, --- Numerical HTTP code
	error: string?, --- Playfab error code
	errorCode: number, --- Numerical PlayFab error code
	errorDetails: {[any]: any}?, --- Detailed description of individual issues with the request object
	errorMessage: string?, --- Description for the PlayFab errorCode
	status: string?, --- String HTTP code
}

export type InsightsEmptyRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
}

export type InsightsGetDetailsResponse = {
	DataUsageMb: number, --- Amount of data (in MB) currently used by Insights.
	ErrorMessage: string?, --- Details of any error that occurred while retrieving Insights details.
	Limits: InsightsGetLimitsResponse?, --- Allowed range of values for performance level and data storage retention.
	PendingOperations: {InsightsGetOperationStatusResponse}?, --- List of pending Insights operations for the title.
	PerformanceLevel: number, --- Current Insights performance level setting.
	RetentionDays: number, --- Current Insights data storage retention value in days.
}

export type InsightsGetLimitsResponse = {
	DefaultPerformanceLevel: number, --- Default Insights performance level.
	DefaultStorageRetentionDays: number, --- Default Insights data storage retention days.
	StorageMaxRetentionDays: number, --- Maximum allowed data storage retention days.
	StorageMinRetentionDays: number, --- Minimum allowed data storage retention days.
	SubMeters: {InsightsPerformanceLevel}?, --- List of Insights submeter limits for the allowed performance levels.
}

--- Returns the current status for the requested operation id. 
export type InsightsGetOperationStatusRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	OperationId: string?, --- Id of the Insights operation.
}

export type InsightsGetOperationStatusResponse = {
	Message: string?, --- Optional message related to the operation details.
	OperationCompletedTime: string, --- Time the operation was completed.
	OperationId: string?, --- Id of the Insights operation.
	OperationLastUpdated: string, --- Time the operation status was last updated.
	OperationStartedTime: string, --- Time the operation started.
	OperationType: string?, --- The type of operation, SetPerformance or SetStorageRetention.
	OperationValue: number, --- The value requested for the operation.
	Status: string?, --- Current status of the operation.
}

--- Returns a list of operations that are in the pending state for the requested 
--- operation type. 
export type InsightsGetPendingOperationsRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	OperationType: string?, --- The type of pending operations requested, or blank for all operation types.
}

export type InsightsGetPendingOperationsResponse = {
	PendingOperations: {InsightsGetOperationStatusResponse}?, --- List of pending Insights operations.
}

export type InsightsOperationResponse = {
	Message: string?, --- Optional message related to the operation details.
	OperationId: string?, --- Id of the Insights operation.
	OperationType: string?, --- The type of operation, SetPerformance or SetStorageRetention.
}

export type InsightsPerformanceLevel = {
	ActiveEventExports: number, --- Number of allowed active event exports.
	CacheSizeMB: number, --- Maximum cache size.
	Concurrency: number, --- Maximum number of concurrent queries.
	CreditsPerMinute: number, --- Number of Insights credits consumed per minute.
	EventsPerSecond: number, --- Maximum events per second.
	Level: number, --- Performance level.
	MaxMemoryPerQueryMB: number, --- Maximum amount of memory allowed per query.
	VirtualCpuCores: number, --- Amount of compute power allocated for queries and operations.
}

--- Sets the performance level to the requested value. Use the GetLimits method 
--- to get the allowed values. 
export type InsightsSetPerformanceRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	PerformanceLevel: number, --- The Insights performance level to apply to the title.
}

--- Sets the data storage retention to the requested value. Use the GetLimits method 
--- to get the range of allowed values. 
export type InsightsSetStorageRetentionRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	RetentionDays: number, --- The Insights data storage retention value (in days) to apply to the title.
}


--- https://docs.microsoft.com/rest/api/playfab/insights/analytics/getdetails
function InsightsApi.GetDetailsAsync(
	entityToken: string, 
	request: InsightsEmptyRequest
): InsightsGetDetailsResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Insights/GetDetails",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/insights/analytics/getlimits
function InsightsApi.GetLimitsAsync(
	entityToken: string, 
	request: InsightsEmptyRequest
): InsightsGetLimitsResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Insights/GetLimits",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/insights/analytics/getoperationstatus
function InsightsApi.GetOperationStatusAsync(
	entityToken: string, 
	request: InsightsGetOperationStatusRequest
): InsightsGetOperationStatusResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Insights/GetOperationStatus",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/insights/analytics/getpendingoperations
function InsightsApi.GetPendingOperationsAsync(
	entityToken: string, 
	request: InsightsGetPendingOperationsRequest
): InsightsGetPendingOperationsResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Insights/GetPendingOperations",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/insights/analytics/setperformance
function InsightsApi.SetPerformanceAsync(
	entityToken: string, 
	request: InsightsSetPerformanceRequest
): InsightsOperationResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Insights/SetPerformance",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/insights/analytics/setstorageretention
function InsightsApi.SetStorageRetentionAsync(
	entityToken: string, 
	request: InsightsSetStorageRetentionRequest
): InsightsOperationResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Insights/SetStorageRetention",
		request,
		"X-EntityToken",
		entityToken
	)
end

return InsightsApi

