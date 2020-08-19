/// <reference path="AdminApi.d.ts" />

import MakeRequest from './HTTP'
import Settings from './Settings'

/**
 * Abort an ongoing task instance.
 * https://docs.microsoft.com/rest/api/playfab/admin/scheduledtask/aborttaskinstance
 */
export const AbortTaskInstance = async (request: AbortTaskInstanceRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<EmptyResponse>('/Admin/AbortTaskInstance', request, 'X-SecretKey', Settings.settings.secretKey)
        .catch((e: string) => { throw e })
    return result
}

/**
 * Update news item to include localized version
 * https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/addlocalizednews
 */
export const AddLocalizedNews = async (request: AddLocalizedNewsRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<AddLocalizedNewsResult>('/Admin/AddLocalizedNews', request, 'X-SecretKey', Settings.settings.secretKey)
        .catch((e: string) => { throw e })
    return result
}

/**
 * Adds a new news item to the title's news feed
 * https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/addnews
 */
export const AddNews = async (request: AddNewsRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<AddNewsResult>('/Admin/AddNews', request, 'X-SecretKey', Settings.settings.secretKey)
        .catch((e: string) => { throw e })
    return result
}

/**
 * Adds a given tag to a player profile. The tag's namespace is automatically generated based on the source of the tag.
 * https://docs.microsoft.com/rest/api/playfab/admin/playstream/addplayertag
 */
export const AddPlayerTag = async (request: AddPlayerTagRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<AddPlayerTagResult>('/Admin/AddPlayerTag', request, 'X-SecretKey', Settings.settings.secretKey)
        .catch((e: string) => { throw e })
    return result
}

/**
 * Increments the specified virtual currency by the stated amount
 * https://docs.microsoft.com/rest/api/playfab/admin/player-item-management/adduservirtualcurrency
 */
export const AddUserVirtualCurrency = async (request: AddUserVirtualCurrencyRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<ModifyUserVirtualCurrencyResult>('/Admin/AddUserVirtualCurrency', request, 'X-SecretKey', Settings.settings.secretKey)
        .catch((e: string) => { throw e })
    return result
}

/**
 * Adds one or more virtual currencies to the set defined for the title. Virtual Currencies have a maximum value of
 * 2,147,483,647 when granted to a player. Any value over that will be discarded.
 * https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/addvirtualcurrencytypes
 */
export const AddVirtualCurrencyTypes = async (request: AddVirtualCurrencyTypesRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<BlankResult>('/Admin/AddVirtualCurrencyTypes', request, 'X-SecretKey', Settings.settings.secretKey)
        .catch((e: string) => { throw e })
    return result
}

/**
 * Bans users by PlayFab ID with optional IP address, or MAC address for the provided game.
 * https://docs.microsoft.com/rest/api/playfab/admin/account-management/banusers
 */
export const BanUsers = async (request: BanUsersRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<BanUsersResult>('/Admin/BanUsers', request, 'X-SecretKey', Settings.settings.secretKey)
        .catch((e: string) => { throw e })
    return result
}

/**
 * Checks the global count for the limited edition item.
 * https://docs.microsoft.com/rest/api/playfab/admin/player-item-management/checklimitededitionitemavailability
 */
export const CheckLimitedEditionItemAvailability = async (request: CheckLimitedEditionItemAvailabilityRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<CheckLimitedEditionItemAvailabilityResult>('/Admin/CheckLimitedEditionItemAvailability', request, 'X-SecretKey', Settings.settings.secretKey)
        .catch((e: string) => { throw e })
    return result
}

/**
 * Create an ActionsOnPlayersInSegment task, which iterates through all players in a segment to execute action.
 * https://docs.microsoft.com/rest/api/playfab/admin/scheduledtask/createactionsonplayersinsegmenttask
 */
export const CreateActionsOnPlayersInSegmentTask = async (request: CreateActionsOnPlayerSegmentTaskRequest ) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<CreateTaskResult>('/Admin/CreateActionsOnPlayersInSegmentTask', request, 'X-SecretKey', Settings.settings.secretKey)
        .catch((e: string) => { throw e })
    return result
}

/**
 * Create a CloudScript task, which can run a CloudScript on a schedule.
 * https://docs.microsoft.com/rest/api/playfab/admin/scheduledtask/createcloudscripttask
 */
export const CreateCloudScriptTask = async (request: CreateCloudScriptTaskRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<CreateTaskResult>('/Admin/CreateCloudScriptTask', request, 'X-SecretKey', Settings.settings.secretKey)
        .catch((e: string) => { throw e })
    return result
}

/**
 * Create a Insights Scheduled Scaling task, which can scale Insights Performance Units on a schedule
 * https://docs.microsoft.com/rest/api/playfab/admin/scheduledtask/createinsightsscheduledscalingtask
 */
export const CreateInsightsScheduledScalingTask = async (request: CreateInsightsScheduledScalingTaskRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<CreateTaskResult>('/Admin/CreateInsightsScheduledScalingTask', request, 'X-SecretKey', Settings.settings.secretKey)
        .catch((e: string) => { throw e })
    return result
}

/**
 * Creates a new Player Shared Secret Key. It may take up to 5 minutes for this key to become generally available after
 * this API returns.
 * https://docs.microsoft.com/rest/api/playfab/admin/authentication/createplayersharedsecret
 */
export const CreatePlayerSharedSecret = async (request: CreatePlayerSharedSecretRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<CreatePlayerSharedSecretResult>('/Admin/CreatePlayerSharedSecret', request, 'X-SecretKey', Settings.settings.secretKey)
        .catch((e: string) => { throw e })
    return result
}

/**
 * Adds a new player statistic configuration to the title, optionally allowing the developer to specify a reset interval
 * and an aggregation method.
 * https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/createplayerstatisticdefinition
 */
export const CreatePlayerStatisticDefinition = async (request: CreatePlayerStatisticDefinitionRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<CreatePlayerStatisticDefinitionResult>('/Admin/CreatePlayerStatisticDefinition', request, 'X-SecretKey', Settings.settings.secretKey)
        .catch((e: string) => { throw e })
    return result
}

/**
 * Delete a content file from the title. When deleting a file that does not exist, it returns success.
 * https://docs.microsoft.com/rest/api/playfab/admin/content/deletecontent
 */
export const DeleteContent = async (request: DeleteContentRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<BlankResult>('/Admin/DeleteContent', request, 'X-SecretKey', Settings.settings.secretKey)
        .catch((e: string) => { throw e })
    return result
}

/**
 * Removes a master player account entirely from all titles and deletes all associated data
 * https://docs.microsoft.com/rest/api/playfab/admin/account-management/deletemasterplayeraccount
 */
export const DeleteMasterPlayerAccount = async (request: DeleteMasterPlayerAccountRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<DeleteMasterPlayerAccountResult>('/Admin/DeleteMasterPlayerAccount', request, 'X-SecretKey', Settings.settings.secretKey)
        .catch((e: string) => { throw e })
    return result
}

/**
 * Removes a user's player account from a title and deletes all associated data
 * https://docs.microsoft.com/rest/api/playfab/admin/account-management/deleteplayer
 */
export const DeletePlayer = async (request: DeletePlayerRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<DeletePlayerResult>('/Admin/DeletePlayer', request, 'X-SecretKey', Settings.settings.secretKey)
        .catch((e: string) => { throw e })
    return result
}

/**
 * Deletes an existing Player Shared Secret Key. It may take up to 5 minutes for this delete to be reflected after this API
 * returns.
 * https://docs.microsoft.com/rest/api/playfab/admin/authentication/deleteplayersharedsecret
 */
export const DeletePlayerSharedSecret = async (request: DeletePlayerSharedSecretRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<DeletePlayerSharedSecretResult>('/Admin/DeletePlayerSharedSecret', request, 'X-SecretKey', Settings.settings.secretKey)
        .catch((e: string) => { throw e })
    return result
}

/**
 * Deletes an existing virtual item store
 * https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/deletestore
 */
export const DeleteStore = async (request: DeleteStoreRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<DeleteStoreResult>('/Admin/DeleteStore', request, 'X-SecretKey', Settings.settings.secretKey)
        .catch((e: string) => { throw e })
    return result
}

/**
 * Delete a task.
 * https://docs.microsoft.com/rest/api/playfab/admin/scheduledtask/deletetask
 */
export const DeleteTask = async (request: DeleteTaskRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<EmptyResponse>('/Admin/DeleteTask', request, 'X-SecretKey', Settings.settings.secretKey)
        .catch((e: string) => { throw e })
    return result
}

/**
 * Permanently deletes a title and all associated configuration
 * https://docs.microsoft.com/rest/api/playfab/admin/account-management/deletetitle
 */
export const DeleteTitle = async (request: DeleteTitleRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<DeleteTitleResult>('/Admin/DeleteTitle', request, 'X-SecretKey', Settings.settings.secretKey)
        .catch((e: string) => { throw e })
    return result
}

/**
 * Deletes a specified set of title data overrides.
 * https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/deletetitledataoverride
 */
export const DeleteTitleDataOverride = async (request: DeleteTitleDataOverrideRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<DeleteTitleDataOverrideResult>('/Admin/DeleteTitleDataOverride', request, 'X-SecretKey', Settings.settings.secretKey)
        .catch((e: string) => { throw e })
    return result
}

/**
 * Exports all associated data of a master player account
 * https://docs.microsoft.com/rest/api/playfab/admin/account-management/exportmasterplayerdata
 */
export const ExportMasterPlayerData = async (request: ExportMasterPlayerDataRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<ExportMasterPlayerDataResult>('/Admin/ExportMasterPlayerData', request, 'X-SecretKey', Settings.settings.secretKey)
        .catch((e: string) => { throw e })
    return result
}

/**
 * Get information about a ActionsOnPlayersInSegment task instance.
 * https://docs.microsoft.com/rest/api/playfab/admin/scheduledtask/getactionsonplayersinsegmenttaskinstance
 */
export const GetActionsOnPlayersInSegmentTaskInstance = async (request: GetTaskInstanceRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<GetActionsOnPlayersInSegmentTaskInstanceResult>('/Admin/GetActionsOnPlayersInSegmentTaskInstance', request, 'X-SecretKey', Settings.settings.secretKey)
        .catch((e: string) => { throw e })
    return result
}

/**
 * Retrieves an array of player segment definitions. Results from this can be used in subsequent API calls such as
 * GetPlayersInSegment which requires a Segment ID. While segment names can change the ID for that segment will not change.
 * https://docs.microsoft.com/rest/api/playfab/admin/playstream/getallsegments
 */
export const GetAllSegments = async (request: GetAllSegmentsRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<GetAllSegmentsResult>('/Admin/GetAllSegments', request, 'X-SecretKey', Settings.settings.secretKey)
        .catch((e: string) => { throw e })
    return result
}

/**
 * Retrieves the specified version of the title's catalog of virtual goods, including all defined properties
 * https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/getcatalogitems
 */
export const GetCatalogItems = async (request: GetCatalogItemsRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<GetCatalogItemsResult>('/Admin/GetCatalogItems', request, 'X-SecretKey', Settings.settings.secretKey)
        .catch((e: string) => { throw e })
    return result
}

/**
 * Gets the contents and information of a specific Cloud Script revision.
 * https://docs.microsoft.com/rest/api/playfab/admin/server-side-cloud-script/getcloudscriptrevision
 */
export const GetCloudScriptRevision = async (request: GetCloudScriptRevisionRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<GetCloudScriptRevisionResult>('/Admin/GetCloudScriptRevision', request, 'X-SecretKey', Settings.settings.secretKey)
        .catch((e: string) => { throw e })
    return result
}

/**
 * Get detail information about a CloudScript task instance.
 * https://docs.microsoft.com/rest/api/playfab/admin/scheduledtask/getcloudscripttaskinstance
 */
export const GetCloudScriptTaskInstance = async (request: GetTaskInstanceRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<GetCloudScriptTaskInstanceResult>('/Admin/GetCloudScriptTaskInstance', request, 'X-SecretKey', Settings.settings.secretKey)
        .catch((e: string) => { throw e })
    return result
}

/**
 * Lists all the current cloud script versions. For each version, information about the current published and latest
 * revisions is also listed.
 * https://docs.microsoft.com/rest/api/playfab/admin/server-side-cloud-script/getcloudscriptversions
 */
export const GetCloudScriptVersions = async (request: GetCloudScriptVersionsRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<GetCloudScriptVersionsResult>('/Admin/GetCloudScriptVersions', request, 'X-SecretKey', Settings.settings.secretKey)
        .catch((e: string) => { throw e })
    return result
}

/**
 * List all contents of the title and get statistics such as size
 * https://docs.microsoft.com/rest/api/playfab/admin/content/getcontentlist
 */
export const GetContentList = async (request: GetContentListRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<GetContentListResult>('/Admin/GetContentList', request, 'X-SecretKey', Settings.settings.secretKey)
        .catch((e: string) => { throw e })
    return result
}

/**
 * Retrieves the pre-signed URL for uploading a content file. A subsequent HTTP PUT to the returned URL uploads the
 * content. Also, please be aware that the Content service is specifically PlayFab's CDN offering, for which standard CDN
 * rates apply.
 * https://docs.microsoft.com/rest/api/playfab/admin/content/getcontentuploadurl
 */
export const GetContentUploadUrl = async (request: GetContentUploadUrlRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<GetContentUploadUrlResult>('/Admin/GetContentUploadUrl', request, 'X-SecretKey', Settings.settings.secretKey)
        .catch((e: string) => { throw e })
    return result
}

/**
 * Retrieves a download URL for the requested report
 * https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/getdatareport
 */
export const GetDataReport = async (request: GetDataReportRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<GetDataReportResult>('/Admin/GetDataReport', request, 'X-SecretKey', Settings.settings.secretKey)
        .catch((e: string) => { throw e })
    return result
}

/**
 * Retrieves the details for a specific completed session, including links to standard out and standard error logs
 * https://docs.microsoft.com/rest/api/playfab/admin/matchmaking/getmatchmakergameinfo
 */
export const GetMatchmakerGameInfo = async (request: GetMatchmakerGameInfoRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<GetMatchmakerGameInfoResult>('/Admin/GetMatchmakerGameInfo', request, 'X-SecretKey', Settings.settings.secretKey)
        .catch((e: string) => { throw e })
    return result
}

/**
 * Retrieves the details of defined game modes for the specified game server executable
 * https://docs.microsoft.com/rest/api/playfab/admin/matchmaking/getmatchmakergamemodes
 */
export const GetMatchmakerGameModes = async (request: GetMatchmakerGameModesRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<GetMatchmakerGameModesResult>('/Admin/GetMatchmakerGameModes', request, 'X-SecretKey', Settings.settings.secretKey)
        .catch((e: string) => { throw e })
    return result
}

/**
 * Get the list of titles that the player has played
 * https://docs.microsoft.com/rest/api/playfab/admin/account-management/getplayedtitlelist
 */
export const GetPlayedTitleList = async (request: GetPlayedTitleListRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<GetPlayedTitleListResult>('/Admin/GetPlayedTitleList', request, 'X-SecretKey', Settings.settings.secretKey)
        .catch((e: string) => { throw e })
    return result
}

/**
 * Gets a player's ID from an auth token.
 * https://docs.microsoft.com/rest/api/playfab/admin/account-management/getplayeridfromauthtoken
 */
export const GetPlayerIdFromAuthToken = async (request: GetPlayerIdFromAuthTokenRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<GetPlayerIdFromAuthTokenResult>('/Admin/GetPlayerIdFromAuthToken', request, 'X-SecretKey', Settings.settings.secretKey)
        .catch((e: string) => { throw e })
    return result
}

/**
 * Retrieves the player's profile
 * https://docs.microsoft.com/rest/api/playfab/admin/account-management/getplayerprofile
 */
export const GetPlayerProfile = async (request: GetPlayerProfileRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<GetPlayerProfileResult>('/Admin/GetPlayerProfile', request, 'X-SecretKey', Settings.settings.secretKey)
        .catch((e: string) => { throw e })
    return result
}

/**
 * List all segments that a player currently belongs to at this moment in time.
 * https://docs.microsoft.com/rest/api/playfab/admin/playstream/getplayersegments
 */
export const GetPlayerSegments = async (request: GetPlayerSegmentsRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<GetPlayerSegmentsResult>('/Admin/GetPlayerSegments', request, 'X-SecretKey', Settings.settings.secretKey)
        .catch((e: string) => { throw e })
    return result
}

/**
 * Returns all Player Shared Secret Keys including disabled and expired.
 * https://docs.microsoft.com/rest/api/playfab/admin/authentication/getplayersharedsecrets
 */
export const GetPlayerSharedSecrets = async (request: GetPlayerSharedSecretsRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<GetPlayerSharedSecretsResult>('/Admin/GetPlayerSharedSecrets', request, 'X-SecretKey', Settings.settings.secretKey)
        .catch((e: string) => { throw e })
    return result
}

/**
 * Allows for paging through all players in a given segment. This API creates a snapshot of all player profiles that match
 * the segment definition at the time of its creation and lives through the Total Seconds to Live, refreshing its life span
 * on each subsequent use of the Continuation Token. Profiles that change during the course of paging will not be reflected
 * in the results. AB Test segments are currently not supported by this operation. NOTE: This API is limited to being
 * called 30 times in one minute. You will be returned an error if you exceed this threshold.
 * https://docs.microsoft.com/rest/api/playfab/admin/playstream/getplayersinsegment
 */
export const GetPlayersInSegment = async (request: GetPlayersInSegmentRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<GetPlayersInSegmentResult>('/Admin/GetPlayersInSegment', request, 'X-SecretKey', Settings.settings.secretKey)
        .catch((e: string) => { throw e })
    return result
}

/**
 * Retrieves the configuration information for all player statistics defined in the title, regardless of whether they have
 * a reset interval.
 * https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/getplayerstatisticdefinitions
 */
export const GetPlayerStatisticDefinitions = async (request: GetPlayerStatisticDefinitionsRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<GetPlayerStatisticDefinitionsResult>('/Admin/GetPlayerStatisticDefinitions', request, 'X-SecretKey', Settings.settings.secretKey)
        .catch((e: string) => { throw e })
    return result
}

/**
 * Retrieves the information on the available versions of the specified statistic.
 * https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/getplayerstatisticversions
 */
export const GetPlayerStatisticVersions = async (request: GetPlayerStatisticVersionsRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<GetPlayerStatisticVersionsResult>('/Admin/GetPlayerStatisticVersions', request, 'X-SecretKey', Settings.settings.secretKey)
        .catch((e: string) => { throw e })
    return result
}

/**
 * Get all tags with a given Namespace (optional) from a player profile.
 * https://docs.microsoft.com/rest/api/playfab/admin/playstream/getplayertags
 */
export const GetPlayerTags = async (request: GetPlayerTagsRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<GetPlayerTagsResult>('/Admin/GetPlayerTags', request, 'X-SecretKey', Settings.settings.secretKey)
        .catch((e: string) => { throw e })
    return result
}

/**
 * Gets the requested policy.
 * https://docs.microsoft.com/rest/api/playfab/admin/authentication/getpolicy
 */
export const GetPolicy = async (request: GetPolicyRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<GetPolicyResponse>('/Admin/GetPolicy', request, 'X-SecretKey', Settings.settings.secretKey)
        .catch((e: string) => { throw e })
    return result
}

/**
 * Retrieves the key-value store of custom publisher settings
 * https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/getpublisherdata
 */
export const GetPublisherData = async (request: GetPublisherDataRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<GetPublisherDataResult>('/Admin/GetPublisherData', request, 'X-SecretKey', Settings.settings.secretKey)
        .catch((e: string) => { throw e })
    return result
}

/**
 * Retrieves the random drop table configuration for the title
 * https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/getrandomresulttables
 */
export const GetRandomResultTables = async (request: GetRandomResultTablesRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<GetRandomResultTablesResult>('/Admin/GetRandomResultTables', request, 'X-SecretKey', Settings.settings.secretKey)
        .catch((e: string) => { throw e })
    return result
}

/**
 * Retrieves the set of items defined for the specified store, including all prices defined
 * https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/getstoreitems
 */
export const GetStoreItems = async (request: GetStoreItemsRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<GetStoreItemsResult>('/Admin/GetStoreItems', request, 'X-SecretKey', Settings.settings.secretKey)
        .catch((e: string) => { throw e })
    return result
}

/**
 * Query for task instances by task, status, or time range.
 * https://docs.microsoft.com/rest/api/playfab/admin/scheduledtask/gettaskinstances
 */
export const GetTaskInstances = async (request: GetTaskInstancesRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<GetTaskInstancesResult>('/Admin/GetTaskInstances', request, 'X-SecretKey', Settings.settings.secretKey)
        .catch((e: string) => { throw e })
    return result
}

/**
 * Get definition information on a specified task or all tasks within a title.
 * https://docs.microsoft.com/rest/api/playfab/admin/scheduledtask/gettasks
 */
export const GetTasks = async (request: GetTasksRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<GetTasksResult>('/Admin/GetTasks', request, 'X-SecretKey', Settings.settings.secretKey)
        .catch((e: string) => { throw e })
    return result
}

/**
 * Retrieves the key-value store of custom title settings which can be read by the client
 * https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/gettitledata
 */
export const GetTitleData = async (request: GetTitleDataRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<GetTitleDataResult>('/Admin/GetTitleData', request, 'X-SecretKey', Settings.settings.secretKey)
        .catch((e: string) => { throw e })
    return result
}

/**
 * Retrieves the key-value store of custom title settings which cannot be read by the client
 * https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/gettitleinternaldata
 */
export const GetTitleInternalData = async (request: GetTitleDataRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<GetTitleDataResult>('/Admin/GetTitleInternalData', request, 'X-SecretKey', Settings.settings.secretKey)
        .catch((e: string) => { throw e })
    return result
}

/**
 * Retrieves the relevant details for a specified user, based upon a match against a supplied unique identifier
 * https://docs.microsoft.com/rest/api/playfab/admin/account-management/getuseraccountinfo
 */
export const GetUserAccountInfo = async (request: LookupUserAccountInfoRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<LookupUserAccountInfoResult>('/Admin/GetUserAccountInfo', request, 'X-SecretKey', Settings.settings.secretKey)
        .catch((e: string) => { throw e })
    return result
}

/**
 * Gets all bans for a user.
 * https://docs.microsoft.com/rest/api/playfab/admin/account-management/getuserbans
 */
export const GetUserBans = async (request: GetUserBansRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<GetUserBansResult>('/Admin/GetUserBans', request, 'X-SecretKey', Settings.settings.secretKey)
        .catch((e: string) => { throw e })
    return result
}

/**
 * Retrieves the title-specific custom data for the user which is readable and writable by the client
 * https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/getuserdata
 */
export const GetUserData = async (request: GetUserDataRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<GetUserDataResult>('/Admin/GetUserData', request, 'X-SecretKey', Settings.settings.secretKey)
        .catch((e: string) => { throw e })
    return result
}

/**
 * Retrieves the title-specific custom data for the user which cannot be accessed by the client
 * https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/getuserinternaldata
 */
export const GetUserInternalData = async (request: GetUserDataRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<GetUserDataResult>('/Admin/GetUserInternalData', request, 'X-SecretKey', Settings.settings.secretKey)
        .catch((e: string) => { throw e })
    return result
}

/**
 * Retrieves the specified user's current inventory of virtual goods
 * https://docs.microsoft.com/rest/api/playfab/admin/player-item-management/getuserinventory
 */
export const GetUserInventory = async (request: GetUserInventoryRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<GetUserInventoryResult>('/Admin/GetUserInventory', request, 'X-SecretKey', Settings.settings.secretKey)
        .catch((e: string) => { throw e })
    return result
}

/**
 * Retrieves the publisher-specific custom data for the user which is readable and writable by the client
 * https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/getuserpublisherdata
 */
export const GetUserPublisherData = async (request: GetUserDataRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<GetUserDataResult>('/Admin/GetUserPublisherData', request, 'X-SecretKey', Settings.settings.secretKey)
        .catch((e: string) => { throw e })
    return result
}

/**
 * Retrieves the publisher-specific custom data for the user which cannot be accessed by the client
 * https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/getuserpublisherinternaldata
 */
export const GetUserPublisherInternalData = async (request: GetUserDataRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<GetUserDataResult>('/Admin/GetUserPublisherInternalData', request, 'X-SecretKey', Settings.settings.secretKey)
        .catch((e: string) => { throw e })
    return result
}

/**
 * Retrieves the publisher-specific custom data for the user which can only be read by the client
 * https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/getuserpublisherreadonlydata
 */
export const GetUserPublisherReadOnlyData = async (request: GetUserDataRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<GetUserDataResult>('/Admin/GetUserPublisherReadOnlyData', request, 'X-SecretKey', Settings.settings.secretKey)
        .catch((e: string) => { throw e })
    return result
}

/**
 * Retrieves the title-specific custom data for the user which can only be read by the client
 * https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/getuserreadonlydata
 */
export const GetUserReadOnlyData = async (request: GetUserDataRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<GetUserDataResult>('/Admin/GetUserReadOnlyData', request, 'X-SecretKey', Settings.settings.secretKey)
        .catch((e: string) => { throw e })
    return result
}

/**
 * Adds the specified items to the specified user inventories
 * https://docs.microsoft.com/rest/api/playfab/admin/player-item-management/grantitemstousers
 */
export const GrantItemsToUsers = async (request: GrantItemsToUsersRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<GrantItemsToUsersResult>('/Admin/GrantItemsToUsers', request, 'X-SecretKey', Settings.settings.secretKey)
        .catch((e: string) => { throw e })
    return result
}

/**
 * Increases the global count for the given scarce resource.
 * https://docs.microsoft.com/rest/api/playfab/admin/player-item-management/incrementlimitededitionitemavailability
 */
export const IncrementLimitedEditionItemAvailability = async (request: IncrementLimitedEditionItemAvailabilityRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<IncrementLimitedEditionItemAvailabilityResult>('/Admin/IncrementLimitedEditionItemAvailability', request, 'X-SecretKey', Settings.settings.secretKey)
        .catch((e: string) => { throw e })
    return result
}

/**
 * Resets the indicated statistic, removing all player entries for it and backing up the old values.
 * https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/incrementplayerstatisticversion
 */
export const IncrementPlayerStatisticVersion = async (request: IncrementPlayerStatisticVersionRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<IncrementPlayerStatisticVersionResult>('/Admin/IncrementPlayerStatisticVersion', request, 'X-SecretKey', Settings.settings.secretKey)
        .catch((e: string) => { throw e })
    return result
}

/**
 * Returns the list of all defined virtual currencies for the title
 * https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/listvirtualcurrencytypes
 */
export const ListVirtualCurrencyTypes = async (request: ListVirtualCurrencyTypesRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<ListVirtualCurrencyTypesResult>('/Admin/ListVirtualCurrencyTypes', request, 'X-SecretKey', Settings.settings.secretKey)
        .catch((e: string) => { throw e })
    return result
}

/**
 * Updates the game server mode details for the specified game server executable
 * https://docs.microsoft.com/rest/api/playfab/admin/matchmaking/modifymatchmakergamemodes
 */
export const ModifyMatchmakerGameModes = async (request: ModifyMatchmakerGameModesRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<ModifyMatchmakerGameModesResult>('/Admin/ModifyMatchmakerGameModes', request, 'X-SecretKey', Settings.settings.secretKey)
        .catch((e: string) => { throw e })
    return result
}

/**
 * Remove a given tag from a player profile. The tag's namespace is automatically generated based on the source of the tag.
 * https://docs.microsoft.com/rest/api/playfab/admin/playstream/removeplayertag
 */
export const RemovePlayerTag = async (request: RemovePlayerTagRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<RemovePlayerTagResult>('/Admin/RemovePlayerTag', request, 'X-SecretKey', Settings.settings.secretKey)
        .catch((e: string) => { throw e })
    return result
}

/**
 * Removes one or more virtual currencies from the set defined for the title.
 * https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/removevirtualcurrencytypes
 */
export const RemoveVirtualCurrencyTypes = async (request: RemoveVirtualCurrencyTypesRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<BlankResult>('/Admin/RemoveVirtualCurrencyTypes', request, 'X-SecretKey', Settings.settings.secretKey)
        .catch((e: string) => { throw e })
    return result
}

/**
 * Completely removes all statistics for the specified character, for the current game
 * https://docs.microsoft.com/rest/api/playfab/admin/characters/resetcharacterstatistics
 */
export const ResetCharacterStatistics = async (request: ResetCharacterStatisticsRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<ResetCharacterStatisticsResult>('/Admin/ResetCharacterStatistics', request, 'X-SecretKey', Settings.settings.secretKey)
        .catch((e: string) => { throw e })
    return result
}

/**
 * Revoke all active bans for a user.
 * https://docs.microsoft.com/rest/api/playfab/admin/account-management/revokeallbansforuser
 */
export const RevokeAllBansForUser = async (request: RevokeAllBansForUserRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<RevokeAllBansForUserResult>('/Admin/RevokeAllBansForUser', request, 'X-SecretKey', Settings.settings.secretKey)
        .catch((e: string) => { throw e })
    return result
}

/**
 * Revoke all active bans specified with BanId.
 * https://docs.microsoft.com/rest/api/playfab/admin/account-management/revokebans
 */
export const RevokeBans = async (request: RevokeBansRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<RevokeBansResult>('/Admin/RevokeBans', request, 'X-SecretKey', Settings.settings.secretKey)
        .catch((e: string) => { throw e })
    return result
}

/**
 * Revokes access to an item in a user's inventory
 * https://docs.microsoft.com/rest/api/playfab/admin/player-item-management/revokeinventoryitem
 */
export const RevokeInventoryItem = async (request: RevokeInventoryItemRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<RevokeInventoryResult>('/Admin/RevokeInventoryItem', request, 'X-SecretKey', Settings.settings.secretKey)
        .catch((e: string) => { throw e })
    return result
}

/**
 * Revokes access for up to 25 items across multiple users and characters.
 * https://docs.microsoft.com/rest/api/playfab/admin/player-item-management/revokeinventoryitems
 */
export const RevokeInventoryItems = async (request: RevokeInventoryItemsRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<RevokeInventoryItemsResult>('/Admin/RevokeInventoryItems', request, 'X-SecretKey', Settings.settings.secretKey)
        .catch((e: string) => { throw e })
    return result
}

/**
 * Run a task immediately regardless of its schedule.
 * https://docs.microsoft.com/rest/api/playfab/admin/scheduledtask/runtask
 */
export const RunTask = async (request: RunTaskRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<RunTaskResult>('/Admin/RunTask', request, 'X-SecretKey', Settings.settings.secretKey)
        .catch((e: string) => { throw e })
    return result
}

/**
 * Creates the catalog configuration of all virtual goods for the specified catalog version
 * https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/setcatalogitems
 */
export const SetCatalogItems = async (request: UpdateCatalogItemsRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<UpdateCatalogItemsResult>('/Admin/SetCatalogItems', request, 'X-SecretKey', Settings.settings.secretKey)
        .catch((e: string) => { throw e })
    return result
}

/**
 * Sets or resets the player's secret. Player secrets are used to sign API requests.
 * https://docs.microsoft.com/rest/api/playfab/admin/authentication/setplayersecret
 */
export const SetPlayerSecret = async (request: SetPlayerSecretRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<SetPlayerSecretResult>('/Admin/SetPlayerSecret', request, 'X-SecretKey', Settings.settings.secretKey)
        .catch((e: string) => { throw e })
    return result
}

/**
 * Sets the currently published revision of a title Cloud Script
 * https://docs.microsoft.com/rest/api/playfab/admin/server-side-cloud-script/setpublishedrevision
 */
export const SetPublishedRevision = async (request: SetPublishedRevisionRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<SetPublishedRevisionResult>('/Admin/SetPublishedRevision', request, 'X-SecretKey', Settings.settings.secretKey)
        .catch((e: string) => { throw e })
    return result
}

/**
 * Updates the key-value store of custom publisher settings
 * https://docs.microsoft.com/rest/api/playfab/admin/shared-group-data/setpublisherdata
 */
export const SetPublisherData = async (request: SetPublisherDataRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<SetPublisherDataResult>('/Admin/SetPublisherData', request, 'X-SecretKey', Settings.settings.secretKey)
        .catch((e: string) => { throw e })
    return result
}

/**
 * Sets all the items in one virtual store
 * https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/setstoreitems
 */
export const SetStoreItems = async (request: UpdateStoreItemsRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<UpdateStoreItemsResult>('/Admin/SetStoreItems', request, 'X-SecretKey', Settings.settings.secretKey)
        .catch((e: string) => { throw e })
    return result
}

/**
 * Creates and updates the key-value store of custom title settings which can be read by the client
 * https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/settitledata
 */
export const SetTitleData = async (request: SetTitleDataRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<SetTitleDataResult>('/Admin/SetTitleData', request, 'X-SecretKey', Settings.settings.secretKey)
        .catch((e: string) => { throw e })
    return result
}

/**
 * Decrements the specified virtual currency by the stated amount
 * https://docs.microsoft.com/rest/api/playfab/admin/player-item-management/subtractuservirtualcurrency
 */
export const SubtractUserVirtualCurrency = async (request: SubtractUserVirtualCurrencyRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<ModifyUserVirtualCurrencyResult>('/Admin/SubtractUserVirtualCurrency', request, 'X-SecretKey', Settings.settings.secretKey)
        .catch((e: string) => { throw e })
    return result
}

/**
 * Updates information of a list of existing bans specified with Ban Ids.
 * https://docs.microsoft.com/rest/api/playfab/admin/account-management/updatebans
 */
export const UpdateBans = async (request: UpdateBansRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<UpdateBansResult>('/Admin/UpdateBans', request, 'X-SecretKey', Settings.settings.secretKey)
        .catch((e: string) => { throw e })
    return result
}

/**
 * Updates the catalog configuration for virtual goods in the specified catalog version
 * https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/updatecatalogitems
 */
export const UpdateCatalogItems = async (request: UpdateCatalogItemsRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<UpdateCatalogItemsResult>('/Admin/UpdateCatalogItems', request, 'X-SecretKey', Settings.settings.secretKey)
        .catch((e: string) => { throw e })
    return result
}

/**
 * Updates a existing Player Shared Secret Key. It may take up to 5 minutes for this update to become generally available
 * after this API returns.
 * https://docs.microsoft.com/rest/api/playfab/admin/authentication/updateplayersharedsecret
 */
export const UpdatePlayerSharedSecret = async (request: UpdatePlayerSharedSecretRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<UpdatePlayerSharedSecretResult>('/Admin/UpdatePlayerSharedSecret', request, 'X-SecretKey', Settings.settings.secretKey)
        .catch((e: string) => { throw e })
    return result
}

/**
 * Updates a player statistic configuration for the title, optionally allowing the developer to specify a reset interval.
 * https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/updateplayerstatisticdefinition
 */
export const UpdatePlayerStatisticDefinition = async (request: UpdatePlayerStatisticDefinitionRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<UpdatePlayerStatisticDefinitionResult>('/Admin/UpdatePlayerStatisticDefinition', request, 'X-SecretKey', Settings.settings.secretKey)
        .catch((e: string) => { throw e })
    return result
}

/**
 * Updates the random drop table configuration for the title
 * https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/updaterandomresulttables
 */
export const UpdateRandomResultTables = async (request: UpdateRandomResultTablesRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<UpdateRandomResultTablesResult>('/Admin/UpdateRandomResultTables', request, 'X-SecretKey', Settings.settings.secretKey)
        .catch((e: string) => { throw e })
    return result
}

/**
 * Updates the title-specific custom data for the user which is readable and writable by the client
 * https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/updateuserdata
 */
export const UpdateUserData = async (request: UpdateUserDataRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<UpdateUserDataResult>('/Admin/UpdateUserData', request, 'X-SecretKey', Settings.settings.secretKey)
        .catch((e: string) => { throw e })
    return result
}

/**
 * Updates the title-specific custom data for the user which cannot be accessed by the client
 * https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/updateuserinternaldata
 */
export const UpdateUserInternalData = async (request: UpdateUserInternalDataRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<UpdateUserDataResult>('/Admin/UpdateUserInternalData', request, 'X-SecretKey', Settings.settings.secretKey)
        .catch((e: string) => { throw e })
    return result
}

/**
 * Updates the publisher-specific custom data for the user which is readable and writable by the client
 * https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/updateuserpublisherdata
 */
export const UpdateUserPublisherData = async (request: UpdateUserDataRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<UpdateUserDataResult>('/Admin/UpdateUserPublisherData', request, 'X-SecretKey', Settings.settings.secretKey)
        .catch((e: string) => { throw e })
    return result
}

/**
 * Updates the publisher-specific custom data for the user which cannot be accessed by the client
 * https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/updateuserpublisherinternaldata
 */
export const UpdateUserPublisherInternalData = async (request: UpdateUserDataRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<UpdateUserDataResult>('/Admin/UpdateUserPublisherInternalData', request, 'X-SecretKey', Settings.settings.secretKey)
        .catch((e: string) => { throw e })
    return result
}

/**
 * Updates the publisher-specific custom data for the user which can only be read by the client
 * https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/updateuserpublisherreadonlydata
 */
export const UpdateUserPublisherReadOnlyData = async (request: UpdateUserDataRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<UpdateUserDataResult>('/Admin/UpdateUserPublisherReadOnlyData', request, 'X-SecretKey', Settings.settings.secretKey)
        .catch((e: string) => { throw e })
    return result
}

/**
 * Updates the title-specific custom data for the user which can only be read by the client
 * https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/updateuserreadonlydata
 */
export const UpdateUserReadOnlyData = async (request: UpdateUserDataRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<UpdateUserDataResult>('/Admin/UpdateUserReadOnlyData', request, 'X-SecretKey', Settings.settings.secretKey)
        .catch((e: string) => { throw e })
    return result
}

/**
 * Updates the title specific display name for a user
 * https://docs.microsoft.com/rest/api/playfab/admin/account-management/updateusertitledisplayname
 */
export const UpdateUserTitleDisplayName = async (request: UpdateUserTitleDisplayNameRequest) => {
    if (!Settings.settings.secretKey) throw 'Must have Settings.settings.secretKey set to call this method'
    const result = await MakeRequest<UpdateUserTitleDisplayNameResult>('/Admin/UpdateUserTitleDisplayName', request, 'X-SecretKey', Settings.settings.secretKey)
        .catch((e: string) => { throw e })
    return result
}