/// <reference path="PlayFab.d.ts" />

declare module PlayFabInsightsModule {
    export interface IPlayFabInsights {
        /**
         * Gets the current values for the Insights performance and data storage retention, list of pending operations, and the
         * performance and data storage retention limits.
         * https://docs.microsoft.com/rest/api/playfab/insights/analytics/getdetails
         */
        GetDetails(
            entityToken: string,
            request?: PlayFabInsightsModels.InsightsEmptyRequest
        ): Promise<PlayFabInsightsModels.InsightsGetDetailsResponse>;
        /**
         * Retrieves the range of allowed values for performance and data storage retention values as well as the submeter details
         * for each performance level.
         * https://docs.microsoft.com/rest/api/playfab/insights/analytics/getlimits
         */
        GetLimits(
            entityToken: string,
            request?: PlayFabInsightsModels.InsightsEmptyRequest
        ): Promise<PlayFabInsightsModels.InsightsGetLimitsResponse>;
        /**
         * Gets the status of a SetPerformance or SetStorageRetention operation.
         * https://docs.microsoft.com/rest/api/playfab/insights/analytics/getoperationstatus
         */
        GetOperationStatus(
            entityToken: string,
            request?: PlayFabInsightsModels.InsightsGetOperationStatusRequest
        ): Promise<PlayFabInsightsModels.InsightsGetOperationStatusResponse>;
        /**
         * Gets a list of pending SetPerformance and/or SetStorageRetention operations for the title.
         * https://docs.microsoft.com/rest/api/playfab/insights/analytics/getpendingoperations
         */
        GetPendingOperations(
            entityToken: string,
            request?: PlayFabInsightsModels.InsightsGetPendingOperationsRequest
        ): Promise<PlayFabInsightsModels.InsightsGetPendingOperationsResponse>;
        /**
         * Sets the Insights performance level value for the title.
         * https://docs.microsoft.com/rest/api/playfab/insights/analytics/setperformance
         */
        SetPerformance(
            entityToken: string,
            request?: PlayFabInsightsModels.InsightsSetPerformanceRequest
        ): Promise<PlayFabInsightsModels.InsightsOperationResponse>;
        /**
         * Sets the Insights data storage retention days value for the title.
         * https://docs.microsoft.com/rest/api/playfab/insights/analytics/setstorageretention
         */
        SetStorageRetention(
            entityToken: string,
            request?: PlayFabInsightsModels.InsightsSetStorageRetentionRequest
        ): Promise<PlayFabInsightsModels.InsightsOperationResponse>;

    }
}

declare module PlayFabInsightsModels {
    export interface InsightsEmptyRequest extends PlayFabModule.IPlayFabRequestCommon {
        /** The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.). */
        CustomTags?: { [key: string]: string | undefined };
    }

    export interface InsightsGetDetailsResponse extends PlayFabModule.IPlayFabResultCommon {
        /** Amount of data (in MB) currently used by Insights. */
        DataUsageMb: number;
        /** Details of any error that occurred while retrieving Insights details. */
        ErrorMessage?: string;
        /** Allowed range of values for performance level and data storage retention. */
        Limits?: InsightsGetLimitsResponse;
        /** List of pending Insights operations for the title. */
        PendingOperations?: InsightsGetOperationStatusResponse[];
        /** Current Insights performance level setting. */
        PerformanceLevel: number;
        /** Current Insights data storage retention value in days. */
        RetentionDays: number;
    }

    export interface InsightsGetLimitsResponse extends PlayFabModule.IPlayFabResultCommon {
        /** Default Insights performance level. */
        DefaultPerformanceLevel: number;
        /** Default Insights data storage retention days. */
        DefaultStorageRetentionDays: number;
        /** Maximum allowed data storage retention days. */
        StorageMaxRetentionDays: number;
        /** Minimum allowed data storage retention days. */
        StorageMinRetentionDays: number;
        /** List of Insights submeter limits for the allowed performance levels. */
        SubMeters?: InsightsPerformanceLevel[];
    }

    export interface InsightsGetOperationStatusRequest extends PlayFabModule.IPlayFabRequestCommon {
        /** The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.). */
        CustomTags?: { [key: string]: string | undefined };
        /** Id of the Insights operation. */
        OperationId?: string;
    }

    export interface InsightsGetOperationStatusResponse extends PlayFabModule.IPlayFabResultCommon {
        /** Optional message related to the operation details. */
        Message?: string;
        /** Time the operation was completed. */
        OperationCompletedTime: string;
        /** Id of the Insights operation. */
        OperationId?: string;
        /** Time the operation status was last updated. */
        OperationLastUpdated: string;
        /** Time the operation started. */
        OperationStartedTime: string;
        /** The type of operation, SetPerformance or SetStorageRetention. */
        OperationType?: string;
        /** The value requested for the operation. */
        OperationValue: number;
        /** Current status of the operation. */
        Status?: string;
    }

    export interface InsightsGetPendingOperationsRequest extends PlayFabModule.IPlayFabRequestCommon {
        /** The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.). */
        CustomTags?: { [key: string]: string | undefined };
        /** The type of pending operations requested, or blank for all operation types. */
        OperationType?: string;
    }

    export interface InsightsGetPendingOperationsResponse extends PlayFabModule.IPlayFabResultCommon {
        /** List of pending Insights operations. */
        PendingOperations?: InsightsGetOperationStatusResponse[];
    }

    export interface InsightsOperationResponse extends PlayFabModule.IPlayFabResultCommon {
        /** Optional message related to the operation details. */
        Message?: string;
        /** Id of the Insights operation. */
        OperationId?: string;
        /** The type of operation, SetPerformance or SetStorageRetention. */
        OperationType?: string;
    }

    export interface InsightsPerformanceLevel {
        /** Number of allowed active event exports. */
        ActiveEventExports: number;
        /** Maximum cache size. */
        CacheSizeMB: number;
        /** Maximum number of concurrent queries. */
        Concurrency: number;
        /** Number of Insights credits consumed per minute. */
        CreditsPerMinute: number;
        /** Maximum events per second. */
        EventsPerSecond: number;
        /** Performance level. */
        Level: number;
        /** Maximum amount of memory allowed per query. */
        MaxMemoryPerQueryMB: number;
        /** Amount of compute power allocated for queries and operations. */
        VirtualCpuCores: number;
    }

    export interface InsightsSetPerformanceRequest extends PlayFabModule.IPlayFabRequestCommon {
        /** The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.). */
        CustomTags?: { [key: string]: string | undefined };
        /** The Insights performance level to apply to the title. */
        PerformanceLevel: number;
    }

    export interface InsightsSetStorageRetentionRequest extends PlayFabModule.IPlayFabRequestCommon {
        /** The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.). */
        CustomTags?: { [key: string]: string | undefined };
        /** The Insights data storage retention value (in days) to apply to the title. */
        RetentionDays: number;
    }

}
