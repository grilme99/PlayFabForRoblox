--[[
	This file was generated on 2025-08-03 at 00:04 UTC. Do not edit directly.

]]

export type InsightsOperationResponse = {
	--[[
		Optional message related to the operation details.

	]]
	Message: string?,
	--[[
		The type of operation, SetPerformance or SetStorageRetention.

	]]
	OperationType: string?,
	--[[
		Id of the Insights operation.

	]]
	OperationId: string?,
}

export type InsightsGetOperationStatusResponse = {
	--[[
		Optional message related to the operation details.

	]]
	Message: string?,
	--[[
		Time the operation was completed.

	]]
	OperationCompletedTime: string,
	--[[
		The type of operation, SetPerformance or SetStorageRetention.

	]]
	OperationType: string?,
	--[[
		The value requested for the operation.

	]]
	OperationValue: number,
	--[[
		Current status of the operation.

	]]
	Status: string?,
	--[[
		Time the operation status was last updated.

	]]
	OperationLastUpdated: string,
	--[[
		Time the operation started.

	]]
	OperationStartedTime: string,
	--[[
		Id of the Insights operation.

	]]
	OperationId: string?,
}

export type InsightsEmptyRequest = {
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

--[[
	Returns the current status for the requested operation id.

]]
export type InsightsGetOperationStatusRequest = {
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		Id of the Insights operation.

	]]
	OperationId: string?,
}

--[[
	Sets the data storage retention to the requested value. Use the GetLimits
	method to get the range of allowed values.

]]
export type InsightsSetStorageRetentionRequest = {
	--[[
		The Insights data storage retention value (in days) to apply to the title.

	]]
	RetentionDays: number,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

--[[
	Sets the performance level to the requested value. Use the GetLimits method
	to get the allowed values.

]]
export type InsightsSetPerformanceRequest = {
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		The Insights performance level to apply to the title.

	]]
	PerformanceLevel: number,
}

--[[
	The basic wrapper around every failed API response

]]
export type ApiErrorWrapper = {
	--[[
		Detailed description of individual issues with the request object

	]]
	errorDetails: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		Numerical HTTP code

	]]
	code: number,
	--[[
		String HTTP code

	]]
	status: string?,
	--[[
		Numerical PlayFab error code

	]]
	errorCode: number,
	--[[
		Playfab error code

	]]
	error: string?,
	--[[
		Description for the PlayFab errorCode

	]]
	errorMessage: string?,
}

export type InsightsGetPendingOperationsResponse = {
	--[[
		List of pending Insights operations.

	]]
	PendingOperations: { InsightsGetOperationStatusResponse }?,
}

export type InsightsGetLimitsResponse = {
	--[[
		List of Insights submeter limits for the allowed performance levels.

	]]
	SubMeters: { InsightsPerformanceLevel }?,
	--[[
		Default Insights performance level.

	]]
	DefaultPerformanceLevel: number,
	--[[
		Default Insights data storage retention days.

	]]
	DefaultStorageRetentionDays: number,
	--[[
		Maximum allowed data storage retention days.

	]]
	StorageMaxRetentionDays: number,
	--[[
		Minimum allowed data storage retention days.

	]]
	StorageMinRetentionDays: number,
}

export type InsightsPerformanceLevel = {
	--[[
		Maximum events per second.

	]]
	EventsPerSecond: number,
	--[[
		Number of Insights credits consumed per minute.

	]]
	CreditsPerMinute: number,
	--[[
		Maximum number of concurrent queries.

	]]
	Concurrency: number,
	--[[
		Maximum amount of memory allowed per query.

	]]
	MaxMemoryPerQueryMB: number,
	--[[
		Number of allowed active event exports.

	]]
	ActiveEventExports: number,
	--[[
		Performance level.

	]]
	Level: number,
	--[[
		Amount of compute power allocated for queries and operations.

	]]
	VirtualCpuCores: number,
	--[[
		Maximum cache size.

	]]
	CacheSizeMB: number,
}

--[[
	Returns a list of operations that are in the pending state for the requested
	operation type.

]]
export type InsightsGetPendingOperationsRequest = {
	--[[
		The type of pending operations requested, or blank for all operation types.

	]]
	OperationType: string?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type InsightsGetDetailsResponse = {
	--[[
		Amount of data (in MB) currently used by Insights.

	]]
	DataUsageMb: number,
	--[[
		Current Insights performance level setting.

	]]
	PerformanceLevel: number,
	Limits: InsightsGetLimitsResponse?,
	--[[
		Details of any error that occurred while retrieving Insights details.

	]]
	ErrorMessage: string?,
	--[[
		List of pending Insights operations for the title.

	]]
	PendingOperations: { InsightsGetOperationStatusResponse }?,
	--[[
		Current Insights data storage retention value in days.

	]]
	RetentionDays: number,
}



return nil
