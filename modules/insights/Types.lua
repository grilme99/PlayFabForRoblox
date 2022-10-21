--!strict

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

export type InsightsEmptyRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
}

export type InsightsGetDetailsResponse = {
	--- Amount of data (in MB) currently used by Insights. 
	DataUsageMb: number,
	--- Details of any error that occurred while retrieving Insights details. 
	ErrorMessage: string?,
	--- Allowed range of values for performance level and data storage retention. 
	Limits: InsightsGetLimitsResponse?,
	--- List of pending Insights operations for the title. 
	PendingOperations: {InsightsGetOperationStatusResponse}?,
	--- Current Insights performance level setting. 
	PerformanceLevel: number,
	--- Current Insights data storage retention value in days. 
	RetentionDays: number,
}

export type InsightsGetLimitsResponse = {
	--- Default Insights performance level. 
	DefaultPerformanceLevel: number,
	--- Default Insights data storage retention days. 
	DefaultStorageRetentionDays: number,
	--- Maximum allowed data storage retention days. 
	StorageMaxRetentionDays: number,
	--- Minimum allowed data storage retention days. 
	StorageMinRetentionDays: number,
	--- List of Insights submeter limits for the allowed performance levels. 
	SubMeters: {InsightsPerformanceLevel}?,
}

--- Returns the current status for the requested operation id. 
export type InsightsGetOperationStatusRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- Id of the Insights operation. 
	OperationId: string?,
}

export type InsightsGetOperationStatusResponse = {
	--- Optional message related to the operation details. 
	Message: string?,
	--- Time the operation was completed. 
	OperationCompletedTime: string,
	--- Id of the Insights operation. 
	OperationId: string?,
	--- Time the operation status was last updated. 
	OperationLastUpdated: string,
	--- Time the operation started. 
	OperationStartedTime: string,
	--- The type of operation, SetPerformance or SetStorageRetention. 
	OperationType: string?,
	--- The value requested for the operation. 
	OperationValue: number,
	--- Current status of the operation. 
	Status: string?,
}

--- Returns a list of operations that are in the pending state for the requested 
--- operation type. 
export type InsightsGetPendingOperationsRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The type of pending operations requested, or blank for all operation types. 
	OperationType: string?,
}

export type InsightsGetPendingOperationsResponse = {
	--- List of pending Insights operations. 
	PendingOperations: {InsightsGetOperationStatusResponse}?,
}

export type InsightsOperationResponse = {
	--- Optional message related to the operation details. 
	Message: string?,
	--- Id of the Insights operation. 
	OperationId: string?,
	--- The type of operation, SetPerformance or SetStorageRetention. 
	OperationType: string?,
}

export type InsightsPerformanceLevel = {
	--- Number of allowed active event exports. 
	ActiveEventExports: number,
	--- Maximum cache size. 
	CacheSizeMB: number,
	--- Maximum number of concurrent queries. 
	Concurrency: number,
	--- Number of Insights credits consumed per minute. 
	CreditsPerMinute: number,
	--- Maximum events per second. 
	EventsPerSecond: number,
	--- Performance level. 
	Level: number,
	--- Maximum amount of memory allowed per query. 
	MaxMemoryPerQueryMB: number,
	--- Amount of compute power allocated for queries and operations. 
	VirtualCpuCores: number,
}

--- Sets the performance level to the requested value. Use the GetLimits method 
--- to get the allowed values. 
export type InsightsSetPerformanceRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The Insights performance level to apply to the title. 
	PerformanceLevel: number,
}

--- Sets the data storage retention to the requested value. Use the GetLimits method 
--- to get the range of allowed values. 
export type InsightsSetStorageRetentionRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The Insights data storage retention value (in days) to apply to the title. 
	RetentionDays: number,
}


