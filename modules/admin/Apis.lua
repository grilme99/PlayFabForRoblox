--!strict

local PlayFabInternal = require(script.Parent.Parent.PlayFabInternal)
local Types = require(script.Parent.Types)

local Apis = {}

--- If the task instance has already completed, there will be no-op. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/scheduledtask/aborttaskinstance
function Apis.AbortTaskInstanceAsync(
	secretKey: string, 
	request: Types.AbortTaskInstanceRequest
): Types.EmptyResponse
	return PlayFabInternal.MakeApiCall(
		"/Admin/AbortTaskInstance",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/addlocalizednews
function Apis.AddLocalizedNewsAsync(
	secretKey: string, 
	request: Types.AddLocalizedNewsRequest
): Types.AddLocalizedNewsResult
	return PlayFabInternal.MakeApiCall(
		"/Admin/AddLocalizedNews",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/addnews
function Apis.AddNewsAsync(
	secretKey: string, 
	request: Types.AddNewsRequest
): Types.AddNewsResult
	return PlayFabInternal.MakeApiCall(
		"/Admin/AddNews",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- This API will trigger a player_tag_added event and add a tag with the given 
--- TagName and PlayFabID to the corresponding player profile. TagName can be used 
--- for segmentation and it is limited to 256 characters. Also there is a limit 
--- on the number of tags a title can have. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/playstream/addplayertag
function Apis.AddPlayerTagAsync(
	secretKey: string, 
	request: Types.AddPlayerTagRequest
): Types.AddPlayerTagResult
	return PlayFabInternal.MakeApiCall(
		"/Admin/AddPlayerTag",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/admin/player-item-management/adduservirtualcurrency
function Apis.AddUserVirtualCurrencyAsync(
	secretKey: string, 
	request: Types.AddUserVirtualCurrencyRequest
): Types.ModifyUserVirtualCurrencyResult
	return PlayFabInternal.MakeApiCall(
		"/Admin/AddUserVirtualCurrency",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- This operation is additive. Any new currencies defined in the array will be 
--- added to the set of those available for the title, while any CurrencyCode identifiers 
--- matching existing ones in the game will be overwritten with the new values. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/addvirtualcurrencytypes
function Apis.AddVirtualCurrencyTypesAsync(
	secretKey: string, 
	request: Types.AddVirtualCurrencyTypesRequest
): Types.BlankResult
	return PlayFabInternal.MakeApiCall(
		"/Admin/AddVirtualCurrencyTypes",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- The existence of each user will not be verified. When banning by IP or MAC address, 
--- multiple players may be affected, so use this feature with caution. Returns 
--- information about the new bans. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/account-management/banusers
function Apis.BanUsersAsync(
	secretKey: string, 
	request: Types.BanUsersRequest
): Types.BanUsersResult
	return PlayFabInternal.MakeApiCall(
		"/Admin/BanUsers",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- This returns the total number of these items available. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/player-item-management/checklimitededitionitemavailability
function Apis.CheckLimitedEditionItemAvailabilityAsync(
	secretKey: string, 
	request: Types.CheckLimitedEditionItemAvailabilityRequest
): Types.CheckLimitedEditionItemAvailabilityResult
	return PlayFabInternal.MakeApiCall(
		"/Admin/CheckLimitedEditionItemAvailability",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- Task name is unique within a title. Using a task name that's already taken will 
--- cause a name conflict error. Too many create-task requests within a short time 
--- will cause a create conflict error. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/scheduledtask/createactionsonplayersinsegmenttask
function Apis.CreateActionsOnPlayersInSegmentTaskAsync(
	secretKey: string, 
	request: Types.CreateActionsOnPlayerSegmentTaskRequest
): Types.CreateTaskResult
	return PlayFabInternal.MakeApiCall(
		"/Admin/CreateActionsOnPlayersInSegmentTask",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- Task name is unique within a title. Using a task name that's already taken will 
--- cause a name conflict error. Too many create-task requests within a short time 
--- will cause a create conflict error. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/scheduledtask/createcloudscripttask
function Apis.CreateCloudScriptTaskAsync(
	secretKey: string, 
	request: Types.CreateCloudScriptTaskRequest
): Types.CreateTaskResult
	return PlayFabInternal.MakeApiCall(
		"/Admin/CreateCloudScriptTask",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- Task name is unique within a title. Using a task name that's already taken will 
--- cause a name conflict error. Too many create-task requests within a short time 
--- will cause a create conflict error. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/scheduledtask/createinsightsscheduledscalingtask
function Apis.CreateInsightsScheduledScalingTaskAsync(
	secretKey: string, 
	request: Types.CreateInsightsScheduledScalingTaskRequest
): Types.CreateTaskResult
	return PlayFabInternal.MakeApiCall(
		"/Admin/CreateInsightsScheduledScalingTask",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/admin/authentication/createopenidconnection
function Apis.CreateOpenIdConnectionAsync(
	secretKey: string, 
	request: Types.CreateOpenIdConnectionRequest
): Types.EmptyResponse
	return PlayFabInternal.MakeApiCall(
		"/Admin/CreateOpenIdConnection",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- Player Shared Secret Keys are used for the call to Client/GetTitlePublicKey, 
--- which exchanges the shared secret for an RSA CSP blob to be used to encrypt 
--- the payload of account creation requests when that API requires a signature 
--- header. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/authentication/createplayersharedsecret
function Apis.CreatePlayerSharedSecretAsync(
	secretKey: string, 
	request: Types.CreatePlayerSharedSecretRequest
): Types.CreatePlayerSharedSecretResult
	return PlayFabInternal.MakeApiCall(
		"/Admin/CreatePlayerSharedSecret",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- Statistics are numeric values, with each statistic in the title also generating 
--- a leaderboard. The ResetInterval enables automatically resetting leaderboards 
--- on a specified interval. Upon reset, the statistic updates to a new version 
--- with no values (effectively removing all players from the leaderboard). The 
--- previous version's statistic values are also archived for retrieval, if needed 
--- (see GetPlayerStatisticVersions). Statistics not created via a call to CreatePlayerStatisticDefinition 
--- by default have a VersionChangeInterval of Never, meaning they do not reset 
--- on a schedule, but they can be set to do so via a call to UpdatePlayerStatisticDefinition. 
--- Once a statistic has been reset (sometimes referred to as versioned or incremented), 
--- the now-previous version can still be written to for up a short, pre-defined 
--- period (currently 10 seconds), to prevent issues with levels completing around 
--- the time of the reset. Also, once reset, the historical statistics for players 
--- in the title may be retrieved using the URL specified in the version information 
--- (GetPlayerStatisticVersions). The AggregationMethod determines what action is 
--- taken when a new statistic value is submitted - always update with the new value 
--- (Last), use the highest of the old and new values (Max), use the smallest (Min), 
--- or add them together (Sum). 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/createplayerstatisticdefinition
function Apis.CreatePlayerStatisticDefinitionAsync(
	secretKey: string, 
	request: Types.CreatePlayerStatisticDefinitionRequest
): Types.CreatePlayerStatisticDefinitionResult
	return PlayFabInternal.MakeApiCall(
		"/Admin/CreatePlayerStatisticDefinition",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- Send all the segment details part of CreateSegmentRequest 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/segments/createsegment
function Apis.CreateSegmentAsync(
	secretKey: string, 
	request: Types.CreateSegmentRequest
): Types.CreateSegmentResponse
	return PlayFabInternal.MakeApiCall(
		"/Admin/CreateSegment",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/admin/content/deletecontent
function Apis.DeleteContentAsync(
	secretKey: string, 
	request: Types.DeleteContentRequest
): Types.BlankResult
	return PlayFabInternal.MakeApiCall(
		"/Admin/DeleteContent",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- Deletes all data associated with the master player account, including data from 
--- all titles the player has played, such as statistics, custom data, inventory, 
--- purchases, virtual currency balances, characters, group memberships, publisher 
--- data, credential data, account linkages, friends list and PlayStream event history. 
--- Removes the player from all leaderboards and player search indexes. Note, this 
--- API queues the player for deletion and returns a receipt immediately. Record 
--- the receipt ID for future reference. It may take some time before all player 
--- data is fully deleted. Upon completion of the deletion, an email will be sent 
--- to the notification email address configured for the title confirming the deletion. 
--- Until the player data is fully deleted, attempts to recreate the player with 
--- the same user account in the same title will fail with the 'AccountDeleted' 
--- error. It is highly recommended to know the impact of the deletion by calling 
--- GetPlayedTitleList, before calling this API. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/account-management/deletemasterplayeraccount
function Apis.DeleteMasterPlayerAccountAsync(
	secretKey: string, 
	request: Types.DeleteMasterPlayerAccountRequest
): Types.DeleteMasterPlayerAccountResult
	return PlayFabInternal.MakeApiCall(
		"/Admin/DeleteMasterPlayerAccount",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- This API lets developers delete a membership subscription. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/account-management/deletemembershipsubscription
function Apis.DeleteMembershipSubscriptionAsync(
	secretKey: string, 
	request: Types.DeleteMembershipSubscriptionRequest
): Types.DeleteMembershipSubscriptionResult
	return PlayFabInternal.MakeApiCall(
		"/Admin/DeleteMembershipSubscription",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/admin/authentication/deleteopenidconnection
function Apis.DeleteOpenIdConnectionAsync(
	secretKey: string, 
	request: Types.DeleteOpenIdConnectionRequest
): Types.EmptyResponse
	return PlayFabInternal.MakeApiCall(
		"/Admin/DeleteOpenIdConnection",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- Deletes all data associated with the player, including statistics, custom data, 
--- inventory, purchases, virtual currency balances, characters and shared group 
--- memberships. Removes the player from all leaderboards and player search indexes. 
--- Does not delete PlayStream event history associated with the player. Does not 
--- delete the publisher user account that created the player in the title nor associated 
--- data such as username, password, email address, account linkages, or friends 
--- list. Note, this API queues the player for deletion and returns immediately. 
--- It may take several minutes or more before all player data is fully deleted. 
--- Until the player data is fully deleted, attempts to recreate the player with 
--- the same user account in the same title will fail with the 'AccountDeleted' 
--- error. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/account-management/deleteplayer
function Apis.DeletePlayerAsync(
	secretKey: string, 
	request: Types.DeletePlayerRequest
): Types.DeletePlayerResult
	return PlayFabInternal.MakeApiCall(
		"/Admin/DeletePlayer",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- Player Shared Secret Keys are used for the call to Client/GetTitlePublicKey, 
--- which exchanges the shared secret for an RSA CSP blob to be used to encrypt 
--- the payload of account creation requests when that API requires a signature 
--- header. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/authentication/deleteplayersharedsecret
function Apis.DeletePlayerSharedSecretAsync(
	secretKey: string, 
	request: Types.DeletePlayerSharedSecretRequest
): Types.DeletePlayerSharedSecretResult
	return PlayFabInternal.MakeApiCall(
		"/Admin/DeletePlayerSharedSecret",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- Send segment id planning to delete part of DeleteSegmentRequest object 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/segments/deletesegment
function Apis.DeleteSegmentAsync(
	secretKey: string, 
	request: Types.DeleteSegmentRequest
): Types.DeleteSegmentsResponse
	return PlayFabInternal.MakeApiCall(
		"/Admin/DeleteSegment",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- This non-reversible operation will permanently delete the requested store. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/deletestore
function Apis.DeleteStoreAsync(
	secretKey: string, 
	request: Types.DeleteStoreRequest
): Types.DeleteStoreResult
	return PlayFabInternal.MakeApiCall(
		"/Admin/DeleteStore",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- After a task is deleted, for tracking purposes, the task instances belonging 
--- to this task will still remain. They will become orphaned and does not belongs 
--- to any task. Executions of any in-progress task instances will continue. If 
--- the task specified does not exist, the deletion is considered a success. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/scheduledtask/deletetask
function Apis.DeleteTaskAsync(
	secretKey: string, 
	request: Types.DeleteTaskRequest
): Types.EmptyResponse
	return PlayFabInternal.MakeApiCall(
		"/Admin/DeleteTask",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- Deletes all data associated with the title, including catalog, virtual currencies, 
--- leaderboard statistics, Cloud Script revisions, segment definitions, event rules, 
--- tasks, add-ons, secret keys, data encryption keys, and permission policies. 
--- Removes the title from its studio and removes all associated developer roles 
--- and permissions. Does not delete PlayStream event history associated with the 
--- title. Note, this API queues the title for deletion and returns immediately. 
--- It may take several hours or more before all title data is fully deleted. All 
--- player accounts in the title must be deleted before deleting the title. If any 
--- player accounts exist, the API will return a 'TitleContainsUserAccounts' error. 
--- Until the title data is fully deleted, attempts to call APIs with the title 
--- will fail with the 'TitleDeleted' error. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/account-management/deletetitle
function Apis.DeleteTitleAsync(
	secretKey: string, 
	request: Types.DeleteTitleRequest
): Types.DeleteTitleResult
	return PlayFabInternal.MakeApiCall(
		"/Admin/DeleteTitle",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- This API method is designed to delete specified title data overrides associated 
--- with the given label. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/deletetitledataoverride
function Apis.DeleteTitleDataOverrideAsync(
	secretKey: string, 
	request: Types.DeleteTitleDataOverrideRequest
): Types.DeleteTitleDataOverrideResult
	return PlayFabInternal.MakeApiCall(
		"/Admin/DeleteTitleDataOverride",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- Exports all data associated with the master player account, including data from 
--- all titles the player has played, such as statistics, custom data, inventory, 
--- purchases, virtual currency balances, characters, group memberships, publisher 
--- data, credential data, account linkages, friends list and PlayStream event history. 
--- Note, this API queues the player for export and returns a receipt immediately. 
--- Record the receipt ID for future reference. It may take some time before the 
--- export is available for download. Upon completion of the export, an email containing 
--- the URL to download the export dump will be sent to the notification email address 
--- configured for the title. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/account-management/exportmasterplayerdata
function Apis.ExportMasterPlayerDataAsync(
	secretKey: string, 
	request: Types.ExportMasterPlayerDataRequest
): Types.ExportMasterPlayerDataResult
	return PlayFabInternal.MakeApiCall(
		"/Admin/ExportMasterPlayerData",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- Request must contain the Segment ID 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/playstream/exportplayersinsegment
function Apis.ExportPlayersInSegmentAsync(
	secretKey: string, 
	request: Types.ExportPlayersInSegmentRequest
): Types.ExportPlayersInSegmentResult
	return PlayFabInternal.MakeApiCall(
		"/Admin/ExportPlayersInSegment",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- The result includes detail information that's specific to an ActionsOnPlayersInSegment 
--- task. To get a list of task instances with generic basic information, use GetTaskInstances. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/scheduledtask/getactionsonplayersinsegmenttaskinstance
function Apis.GetActionsOnPlayersInSegmentTaskInstanceAsync(
	secretKey: string, 
	request: Types.GetTaskInstanceRequest
): Types.GetActionsOnPlayersInSegmentTaskInstanceResult
	return PlayFabInternal.MakeApiCall(
		"/Admin/GetActionsOnPlayersInSegmentTaskInstance",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- Request has no paramaters. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/playstream/getallsegments
function Apis.GetAllSegmentsAsync(
	secretKey: string, 
	request: Types.GetAllSegmentsRequest
): Types.GetAllSegmentsResult
	return PlayFabInternal.MakeApiCall(
		"/Admin/GetAllSegments",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/getcatalogitems
function Apis.GetCatalogItemsAsync(
	secretKey: string, 
	request: Types.GetCatalogItemsRequest
): Types.GetCatalogItemsResult
	return PlayFabInternal.MakeApiCall(
		"/Admin/GetCatalogItems",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/admin/server-side-cloud-script/getcloudscriptrevision
function Apis.GetCloudScriptRevisionAsync(
	secretKey: string, 
	request: Types.GetCloudScriptRevisionRequest
): Types.GetCloudScriptRevisionResult
	return PlayFabInternal.MakeApiCall(
		"/Admin/GetCloudScriptRevision",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- The result includes detail information that's specific to a CloudScript task. 
--- Only CloudScript tasks configured as "Run Cloud Script function once" will be 
--- retrieved. To get a list of task instances by task, status, or time range, use 
--- GetTaskInstances. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/scheduledtask/getcloudscripttaskinstance
function Apis.GetCloudScriptTaskInstanceAsync(
	secretKey: string, 
	request: Types.GetTaskInstanceRequest
): Types.GetCloudScriptTaskInstanceResult
	return PlayFabInternal.MakeApiCall(
		"/Admin/GetCloudScriptTaskInstance",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/admin/server-side-cloud-script/getcloudscriptversions
function Apis.GetCloudScriptVersionsAsync(
	secretKey: string, 
	request: Types.GetCloudScriptVersionsRequest
): Types.GetCloudScriptVersionsResult
	return PlayFabInternal.MakeApiCall(
		"/Admin/GetCloudScriptVersions",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/admin/content/getcontentlist
function Apis.GetContentListAsync(
	secretKey: string, 
	request: Types.GetContentListRequest
): Types.GetContentListResult
	return PlayFabInternal.MakeApiCall(
		"/Admin/GetContentList",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/admin/content/getcontentuploadurl
function Apis.GetContentUploadUrlAsync(
	secretKey: string, 
	request: Types.GetContentUploadUrlRequest
): Types.GetContentUploadUrlResult
	return PlayFabInternal.MakeApiCall(
		"/Admin/GetContentUploadUrl",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- Gets the download URL for the requested report data (in CSV form). The reports 
--- available through this API call are those available in the Game Manager, in 
--- the Analytics->Reports tab. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/getdatareport
function Apis.GetDataReportAsync(
	secretKey: string, 
	request: Types.GetDataReportRequest
): Types.GetDataReportResult
	return PlayFabInternal.MakeApiCall(
		"/Admin/GetDataReport",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/admin/matchmaking/getmatchmakergameinfo
function Apis.GetMatchmakerGameInfoAsync(
	secretKey: string, 
	request: Types.GetMatchmakerGameInfoRequest
): Types.GetMatchmakerGameInfoResult
	return PlayFabInternal.MakeApiCall(
		"/Admin/GetMatchmakerGameInfo",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- These details are used by the PlayFab matchmaking service to determine if an 
--- existing Game Server Instance has room for additional users, and by the PlayFab 
--- game server management service to determine when a new Game Server Host should 
--- be created in order to prevent excess load on existing Hosts. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/matchmaking/getmatchmakergamemodes
function Apis.GetMatchmakerGameModesAsync(
	secretKey: string, 
	request: Types.GetMatchmakerGameModesRequest
): Types.GetMatchmakerGameModesResult
	return PlayFabInternal.MakeApiCall(
		"/Admin/GetMatchmakerGameModes",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- Useful for identifying titles of which the player's data will be deleted by 
--- DeleteMasterPlayer. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/account-management/getplayedtitlelist
function Apis.GetPlayedTitleListAsync(
	secretKey: string, 
	request: Types.GetPlayedTitleListRequest
): Types.GetPlayedTitleListResult
	return PlayFabInternal.MakeApiCall(
		"/Admin/GetPlayedTitleList",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- Gets a player ID from an auth token. The token expires after 30 minutes and 
--- cannot be used to look up a player when expired. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/account-management/getplayeridfromauthtoken
function Apis.GetPlayerIdFromAuthTokenAsync(
	secretKey: string, 
	request: Types.GetPlayerIdFromAuthTokenRequest
): Types.GetPlayerIdFromAuthTokenResult
	return PlayFabInternal.MakeApiCall(
		"/Admin/GetPlayerIdFromAuthToken",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- This API allows for access to details regarding a user in the PlayFab service, 
--- usually for purposes of customer support. Note that data returned may be Personally 
--- Identifying Information (PII), such as email address, and so care should be 
--- taken in how this data is stored and managed. Since this call will always return 
--- the relevant information for users who have accessed the title, the recommendation 
--- is to not store this data locally. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/account-management/getplayerprofile
function Apis.GetPlayerProfileAsync(
	secretKey: string, 
	request: Types.GetPlayerProfileRequest
): Types.GetPlayerProfileResult
	return PlayFabInternal.MakeApiCall(
		"/Admin/GetPlayerProfile",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/admin/playstream/getplayersegments
function Apis.GetPlayerSegmentsAsync(
	secretKey: string, 
	request: Types.GetPlayersSegmentsRequest
): Types.GetPlayerSegmentsResult
	return PlayFabInternal.MakeApiCall(
		"/Admin/GetPlayerSegments",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- Player Shared Secret Keys are used for the call to Client/GetTitlePublicKey, 
--- which exchanges the shared secret for an RSA CSP blob to be used to encrypt 
--- the payload of account creation requests when that API requires a signature 
--- header. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/authentication/getplayersharedsecrets
function Apis.GetPlayerSharedSecretsAsync(
	secretKey: string, 
	request: Types.GetPlayerSharedSecretsRequest
): Types.GetPlayerSharedSecretsResult
	return PlayFabInternal.MakeApiCall(
		"/Admin/GetPlayerSharedSecrets",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/getplayerstatisticdefinitions
function Apis.GetPlayerStatisticDefinitionsAsync(
	secretKey: string, 
	request: Types.GetPlayerStatisticDefinitionsRequest
): Types.GetPlayerStatisticDefinitionsResult
	return PlayFabInternal.MakeApiCall(
		"/Admin/GetPlayerStatisticDefinitions",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/getplayerstatisticversions
function Apis.GetPlayerStatisticVersionsAsync(
	secretKey: string, 
	request: Types.GetPlayerStatisticVersionsRequest
): Types.GetPlayerStatisticVersionsResult
	return PlayFabInternal.MakeApiCall(
		"/Admin/GetPlayerStatisticVersions",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- This API will return a list of canonical tags which includes both namespace 
--- and tag's name. If namespace is not provided, the result is a list of all canonical 
--- tags. TagName can be used for segmentation and Namespace is limited to 128 characters. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/playstream/getplayertags
function Apis.GetPlayerTagsAsync(
	secretKey: string, 
	request: Types.GetPlayerTagsRequest
): Types.GetPlayerTagsResult
	return PlayFabInternal.MakeApiCall(
		"/Admin/GetPlayerTags",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- Initial request must contain at least a Segment ID. Subsequent requests must 
--- contain the Segment ID as well as the Continuation Token. Failure to send the 
--- Continuation Token will result in a new player segment list being generated. 
--- Each time the Continuation Token is passed in the length of the Total Seconds 
--- to Live is refreshed. If too much time passes between requests to the point 
--- that a subsequent request is past the Total Seconds to Live an error will be 
--- returned and paging will be terminated. This API is resource intensive and should 
--- not be used in scenarios which might generate high request volumes. Only one 
--- request to this API at a time should be made per title. Concurrent requests 
--- to the API may be rejected with the APIConcurrentRequestLimitExceeded error. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/playstream/getplayersinsegment
function Apis.GetPlayersInSegmentAsync(
	secretKey: string, 
	request: Types.GetPlayersInSegmentRequest
): Types.GetPlayersInSegmentResult
	return PlayFabInternal.MakeApiCall(
		"/Admin/GetPlayersInSegment",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- Views the requested policy. Today, the only supported policy is 'ApiPolicy'. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/authentication/getpolicy
function Apis.GetPolicyAsync(
	secretKey: string, 
	request: Types.GetPolicyRequest
): Types.GetPolicyResponse
	return PlayFabInternal.MakeApiCall(
		"/Admin/GetPolicy",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- This API is designed to return publisher-specific values which can be read, 
--- but not written to, by the client. This data is shared across all titles assigned 
--- to a particular publisher, and can be used for cross-game coordination. Only 
--- titles assigned to a publisher can use this API. For more information email 
--- helloplayfab@microsoft.com. This AdminAPI call for getting title data guarantees 
--- no delay in between update and retrieval of newly set data. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/getpublisherdata
function Apis.GetPublisherDataAsync(
	secretKey: string, 
	request: Types.GetPublisherDataRequest
): Types.GetPublisherDataResult
	return PlayFabInternal.MakeApiCall(
		"/Admin/GetPublisherData",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/getrandomresulttables
function Apis.GetRandomResultTablesAsync(
	secretKey: string, 
	request: Types.GetRandomResultTablesRequest
): Types.GetRandomResultTablesResult
	return PlayFabInternal.MakeApiCall(
		"/Admin/GetRandomResultTables",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- Request must contain the ExportId 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/playstream/getsegmentexport
function Apis.GetSegmentExportAsync(
	secretKey: string, 
	request: Types.GetPlayersInSegmentExportRequest
): Types.GetPlayersInSegmentExportResponse
	return PlayFabInternal.MakeApiCall(
		"/Admin/GetSegmentExport",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- Send segment filter details part of GetSegmentsRequest object 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/segments/getsegments
function Apis.GetSegmentsAsync(
	secretKey: string, 
	request: Types.GetSegmentsRequest
): Types.GetSegmentsResponse
	return PlayFabInternal.MakeApiCall(
		"/Admin/GetSegments",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- A store contains an array of references to items defined in the catalog, along 
--- with the prices for the item, in both real world and virtual currencies. These 
--- prices act as an override to any prices defined in the catalog. In this way, 
--- the base definitions of the items may be defined in the catalog, with all associated 
--- properties, while the pricing can be set for each store, as needed. This allows 
--- for subsets of goods to be defined for different purposes (in order to simplify 
--- showing some, but not all catalog items to users, based upon different characteristics), 
--- along with unique prices. Note that all prices defined in the catalog and store 
--- definitions for the item are considered valid, and that a compromised client 
--- can be made to send a request for an item based upon any of these definitions. 
--- If no price is specified in the store for an item, the price set in the catalog 
--- should be displayed to the user. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/getstoreitems
function Apis.GetStoreItemsAsync(
	secretKey: string, 
	request: Types.GetStoreItemsRequest
): Types.GetStoreItemsResult
	return PlayFabInternal.MakeApiCall(
		"/Admin/GetStoreItems",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- Only the most recent 100 task instances are returned, ordered by start time 
--- descending. The results are generic basic information for task instances. To 
--- get detail information specific to each task type, use Get*TaskInstance based 
--- on its corresponding task type. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/scheduledtask/gettaskinstances
function Apis.GetTaskInstancesAsync(
	secretKey: string, 
	request: Types.GetTaskInstancesRequest
): Types.GetTaskInstancesResult
	return PlayFabInternal.MakeApiCall(
		"/Admin/GetTaskInstances",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/admin/scheduledtask/gettasks
function Apis.GetTasksAsync(
	secretKey: string, 
	request: Types.GetTasksRequest
): Types.GetTasksResult
	return PlayFabInternal.MakeApiCall(
		"/Admin/GetTasks",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- This API method is designed to return title specific values which can be read 
--- by the client. For example, a developer could choose to store values which modify 
--- the user experience, such as enemy spawn rates, weapon strengths, movement speeds, 
--- etc. This allows a developer to update the title without the need to create, 
--- test, and ship a new build. If an override label is specified in the request, 
--- the overrides are applied automatically and returned with the title data. Note 
--- that due to caching, there may up to a minute delay in between updating title 
--- data and a query returning the newest value. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/gettitledata
function Apis.GetTitleDataAsync(
	secretKey: string, 
	request: Types.GetTitleDataRequest
): Types.GetTitleDataResult
	return PlayFabInternal.MakeApiCall(
		"/Admin/GetTitleData",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- This API method is designed to return title specific values which are accessible 
--- only by the server. These values can be used to tweak settings used by game 
--- servers and Cloud Scripts without the need to update and re-deploy. Note that 
--- due to caching, there may up to a minute delay in between updating title data 
--- and this query returning the newest value. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/gettitleinternaldata
function Apis.GetTitleInternalDataAsync(
	secretKey: string, 
	request: Types.GetTitleDataRequest
): Types.GetTitleDataResult
	return PlayFabInternal.MakeApiCall(
		"/Admin/GetTitleInternalData",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- This API allows for access to details regarding a user in the PlayFab service, 
--- usually for purposes of customer support. Note that data returned may be Personally 
--- Identifying Information (PII), such as email address, and so care should be 
--- taken in how this data is stored and managed. Since this call will always return 
--- the relevant information for users who have accessed the title, the recommendation 
--- is to not store this data locally. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/account-management/getuseraccountinfo
function Apis.GetUserAccountInfoAsync(
	secretKey: string, 
	request: Types.LookupUserAccountInfoRequest
): Types.LookupUserAccountInfoResult
	return PlayFabInternal.MakeApiCall(
		"/Admin/GetUserAccountInfo",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- Get all bans for a user, including inactive and expired bans.  
---
--- https://docs.microsoft.com/rest/api/playfab/admin/account-management/getuserbans
function Apis.GetUserBansAsync(
	secretKey: string, 
	request: Types.GetUserBansRequest
): Types.GetUserBansResult
	return PlayFabInternal.MakeApiCall(
		"/Admin/GetUserBans",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- Data is stored as JSON key-value pairs. If the Keys parameter is provided, the 
--- data object returned will only contain the data specific to the indicated Keys. 
--- Otherwise, the full set of custom user data will be returned. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/getuserdata
function Apis.GetUserDataAsync(
	secretKey: string, 
	request: Types.GetUserDataRequest
): Types.GetUserDataResult
	return PlayFabInternal.MakeApiCall(
		"/Admin/GetUserData",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- Data is stored as JSON key-value pairs. If the Keys parameter is provided, the 
--- data object returned will only contain the data specific to the indicated Keys. 
--- Otherwise, the full set of custom user data will be returned. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/getuserinternaldata
function Apis.GetUserInternalDataAsync(
	secretKey: string, 
	request: Types.GetUserDataRequest
): Types.GetUserDataResult
	return PlayFabInternal.MakeApiCall(
		"/Admin/GetUserInternalData",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- All items currently in the user inventory will be returned, irrespective of 
--- how they were acquired (via purchasing, grants, coupons, etc.). Items that are 
--- expired, fully consumed, or are no longer valid are not considered to be in 
--- the user's current inventory, and so will not be not included. There can be 
--- a delay of up to a half a second for inventory changes to be reflected in the 
--- GetUserInventory API response. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/player-item-management/getuserinventory
function Apis.GetUserInventoryAsync(
	secretKey: string, 
	request: Types.GetUserInventoryRequest
): Types.GetUserInventoryResult
	return PlayFabInternal.MakeApiCall(
		"/Admin/GetUserInventory",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- Data is stored as JSON key-value pairs. If the Keys parameter is provided, the 
--- data object returned will only contain the data specific to the indicated Keys. 
--- Otherwise, the full set of custom user data will be returned. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/getuserpublisherdata
function Apis.GetUserPublisherDataAsync(
	secretKey: string, 
	request: Types.GetUserDataRequest
): Types.GetUserDataResult
	return PlayFabInternal.MakeApiCall(
		"/Admin/GetUserPublisherData",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- Data is stored as JSON key-value pairs. If the Keys parameter is provided, the 
--- data object returned will only contain the data specific to the indicated Keys. 
--- Otherwise, the full set of custom user data will be returned. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/getuserpublisherinternaldata
function Apis.GetUserPublisherInternalDataAsync(
	secretKey: string, 
	request: Types.GetUserDataRequest
): Types.GetUserDataResult
	return PlayFabInternal.MakeApiCall(
		"/Admin/GetUserPublisherInternalData",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- Data is stored as JSON key-value pairs. If the Keys parameter is provided, the 
--- data object returned will only contain the data specific to the indicated Keys. 
--- Otherwise, the full set of custom user data will be returned. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/getuserpublisherreadonlydata
function Apis.GetUserPublisherReadOnlyDataAsync(
	secretKey: string, 
	request: Types.GetUserDataRequest
): Types.GetUserDataResult
	return PlayFabInternal.MakeApiCall(
		"/Admin/GetUserPublisherReadOnlyData",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- Data is stored as JSON key-value pairs. If the Keys parameter is provided, the 
--- data object returned will only contain the data specific to the indicated Keys. 
--- Otherwise, the full set of custom user data will be returned. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/getuserreadonlydata
function Apis.GetUserReadOnlyDataAsync(
	secretKey: string, 
	request: Types.GetUserDataRequest
): Types.GetUserDataResult
	return PlayFabInternal.MakeApiCall(
		"/Admin/GetUserReadOnlyData",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- This function directly adds inventory items to user inventories. As a result 
--- of this operations, the user will not be charged any transaction fee, regardless 
--- of the inventory item catalog definition. Please note that the processing time 
--- for inventory grants and purchases increases fractionally the more items are 
--- in the inventory, and the more items are in the grant/purchase operation. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/player-item-management/grantitemstousers
function Apis.GrantItemsToUsersAsync(
	secretKey: string, 
	request: Types.GrantItemsToUsersRequest
): Types.GrantItemsToUsersResult
	return PlayFabInternal.MakeApiCall(
		"/Admin/GrantItemsToUsers",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- This operation will increment the global counter for the number of these items 
--- available. This number cannot be decremented, except by actual grants. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/player-item-management/incrementlimitededitionitemavailability
function Apis.IncrementLimitedEditionItemAvailabilityAsync(
	secretKey: string, 
	request: Types.IncrementLimitedEditionItemAvailabilityRequest
): Types.IncrementLimitedEditionItemAvailabilityResult
	return PlayFabInternal.MakeApiCall(
		"/Admin/IncrementLimitedEditionItemAvailability",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- Statistics are numeric values, with each statistic in the title also generating 
--- a leaderboard. When this call is made on a given statistic, this forces a reset 
--- of that statistic. Upon reset, the statistic updates to a new version with no 
--- values (effectively removing all players from the leaderboard). The previous 
--- version's statistic values are also archived for retrieval, if needed (see GetPlayerStatisticVersions). 
--- Statistics not created via a call to CreatePlayerStatisticDefinition by default 
--- have a VersionChangeInterval of Never, meaning they do not reset on a schedule, 
--- but they can be set to do so via a call to UpdatePlayerStatisticDefinition. 
--- Once a statistic has been reset (sometimes referred to as versioned or incremented), 
--- the now-previous version can still be written to for up a short, pre-defined 
--- period (currently 10 seconds), to prevent issues with levels completing around 
--- the time of the reset. Also, once reset, the historical statistics for players 
--- in the title may be retrieved using the URL specified in the version information 
--- (GetPlayerStatisticVersions). 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/incrementplayerstatisticversion
function Apis.IncrementPlayerStatisticVersionAsync(
	secretKey: string, 
	request: Types.IncrementPlayerStatisticVersionRequest
): Types.IncrementPlayerStatisticVersionResult
	return PlayFabInternal.MakeApiCall(
		"/Admin/IncrementPlayerStatisticVersion",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/admin/authentication/listopenidconnection
function Apis.ListOpenIdConnectionAsync(
	secretKey: string, 
	request: Types.ListOpenIdConnectionRequest
): Types.ListOpenIdConnectionResponse
	return PlayFabInternal.MakeApiCall(
		"/Admin/ListOpenIdConnection",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/listvirtualcurrencytypes
function Apis.ListVirtualCurrencyTypesAsync(
	secretKey: string, 
	request: Types.ListVirtualCurrencyTypesRequest
): Types.ListVirtualCurrencyTypesResult
	return PlayFabInternal.MakeApiCall(
		"/Admin/ListVirtualCurrencyTypes",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/admin/custom-server-management/modifyserverbuild
function Apis.ModifyServerBuildAsync(
	secretKey: string, 
	request: Types.ModifyServerBuildRequest
): Types.ModifyServerBuildResult
	return PlayFabInternal.MakeApiCall(
		"/Admin/ModifyServerBuild",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/refundpurchase
function Apis.RefundPurchaseAsync(
	secretKey: string, 
	request: Types.RefundPurchaseRequest
): Types.RefundPurchaseResponse
	return PlayFabInternal.MakeApiCall(
		"/Admin/RefundPurchase",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- This API will trigger a player_tag_removed event and remove a tag with the given 
--- TagName and PlayFabID from the corresponding player profile. TagName can be 
--- used for segmentation and it is limited to 256 characters 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/playstream/removeplayertag
function Apis.RemovePlayerTagAsync(
	secretKey: string, 
	request: Types.RemovePlayerTagRequest
): Types.RemovePlayerTagResult
	return PlayFabInternal.MakeApiCall(
		"/Admin/RemovePlayerTag",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- Virtual currencies to be removed cannot have entries in any catalog nor store 
--- for the title. Note that this operation will not remove player balances for 
--- the removed currencies; if a deleted currency is recreated at any point, user 
--- balances will be in an undefined state. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/removevirtualcurrencytypes
function Apis.RemoveVirtualCurrencyTypesAsync(
	secretKey: string, 
	request: Types.RemoveVirtualCurrencyTypesRequest
): Types.BlankResult
	return PlayFabInternal.MakeApiCall(
		"/Admin/RemoveVirtualCurrencyTypes",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- Note that this action cannot be un-done. All statistics for this character will 
--- be deleted, removing the user from all leaderboards for the game. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/characters/resetcharacterstatistics
function Apis.ResetCharacterStatisticsAsync(
	secretKey: string, 
	request: Types.ResetCharacterStatisticsRequest
): Types.ResetCharacterStatisticsResult
	return PlayFabInternal.MakeApiCall(
		"/Admin/ResetCharacterStatistics",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- Resets a player's password taking in a new password based and validating the 
--- user based off of a token sent to the playerto their email. The token expires 
--- after 30 minutes. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/account-management/resetpassword
function Apis.ResetPasswordAsync(
	secretKey: string, 
	request: Types.ResetPasswordRequest
): Types.ResetPasswordResult
	return PlayFabInternal.MakeApiCall(
		"/Admin/ResetPassword",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- Note that this action cannot be un-done. All statistics for this user will be 
--- deleted, removing the user from all leaderboards for the game. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/resetuserstatistics
function Apis.ResetUserStatisticsAsync(
	secretKey: string, 
	request: Types.ResetUserStatisticsRequest
): Types.ResetUserStatisticsResult
	return PlayFabInternal.MakeApiCall(
		"/Admin/ResetUserStatistics",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/resolvepurchasedispute
function Apis.ResolvePurchaseDisputeAsync(
	secretKey: string, 
	request: Types.ResolvePurchaseDisputeRequest
): Types.ResolvePurchaseDisputeResponse
	return PlayFabInternal.MakeApiCall(
		"/Admin/ResolvePurchaseDispute",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- Setting the active state of all non-expired bans for a user to Inactive. Expired 
--- bans with an Active state will be ignored, however. Returns information about 
--- applied updates only. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/account-management/revokeallbansforuser
function Apis.RevokeAllBansForUserAsync(
	secretKey: string, 
	request: Types.RevokeAllBansForUserRequest
): Types.RevokeAllBansForUserResult
	return PlayFabInternal.MakeApiCall(
		"/Admin/RevokeAllBansForUser",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- Setting the active state of all bans requested to Inactive regardless of whether 
--- that ban has already expired. BanIds that do not exist will be skipped. Returns 
--- information about applied updates only.  
---
--- https://docs.microsoft.com/rest/api/playfab/admin/account-management/revokebans
function Apis.RevokeBansAsync(
	secretKey: string, 
	request: Types.RevokeBansRequest
): Types.RevokeBansResult
	return PlayFabInternal.MakeApiCall(
		"/Admin/RevokeBans",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- In cases where the inventory item in question is a "crate", and the items it 
--- contained have already been dispensed, this will not revoke access or otherwise 
--- remove the items which were dispensed. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/player-item-management/revokeinventoryitem
function Apis.RevokeInventoryItemAsync(
	secretKey: string, 
	request: Types.RevokeInventoryItemRequest
): Types.RevokeInventoryResult
	return PlayFabInternal.MakeApiCall(
		"/Admin/RevokeInventoryItem",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- In cases where the inventory item in question is a "crate", and the items it 
--- contained have already been dispensed, this will not revoke access or otherwise 
--- remove the items which were dispensed. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/player-item-management/revokeinventoryitems
function Apis.RevokeInventoryItemsAsync(
	secretKey: string, 
	request: Types.RevokeInventoryItemsRequest
): Types.RevokeInventoryItemsResult
	return PlayFabInternal.MakeApiCall(
		"/Admin/RevokeInventoryItems",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- The returned task instance ID can be used to query for task execution status. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/scheduledtask/runtask
function Apis.RunTaskAsync(
	secretKey: string, 
	request: Types.RunTaskRequest
): Types.RunTaskResult
	return PlayFabInternal.MakeApiCall(
		"/Admin/RunTask",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- If the account in question is a "temporary" account (for example, one that was 
--- created via a call to LoginFromIOSDeviceID), thisfunction will have no effect. 
--- Only PlayFab accounts which have valid email addresses will be able to receive 
--- a password reset email using this API. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/account-management/sendaccountrecoveryemail
function Apis.SendAccountRecoveryEmailAsync(
	secretKey: string, 
	request: Types.SendAccountRecoveryEmailRequest
): Types.SendAccountRecoveryEmailResult
	return PlayFabInternal.MakeApiCall(
		"/Admin/SendAccountRecoveryEmail",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- When used for SetCatalogItems, this operation is not additive. Using it will 
--- cause the indicated catalog version to be created from scratch. If there is 
--- an existing catalog with the version number in question, it will be deleted 
--- and replaced with only the items specified in this call. When used for UpdateCatalogItems, 
--- this operation is additive. Items with ItemId values not currently in the catalog 
--- will be added, while those with ItemId values matching items currently in the 
--- catalog will overwrite those items with the given values. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/setcatalogitems
function Apis.SetCatalogItemsAsync(
	secretKey: string, 
	request: Types.UpdateCatalogItemsRequest
): Types.UpdateCatalogItemsResult
	return PlayFabInternal.MakeApiCall(
		"/Admin/SetCatalogItems",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- This API lets developers set overrides for membership expirations, independent 
--- of any subscriptions setting it. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/account-management/setmembershipoverride
function Apis.SetMembershipOverrideAsync(
	secretKey: string, 
	request: Types.SetMembershipOverrideRequest
): Types.SetMembershipOverrideResult
	return PlayFabInternal.MakeApiCall(
		"/Admin/SetMembershipOverride",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- APIs that require signatures require that the player have a configured Player 
--- Secret Key that is used to sign all requests. Players that don't have a secret 
--- will be blocked from making API calls until it is configured. To create a signature 
--- header add a SHA256 hashed string containing UTF8 encoded JSON body as it will 
--- be sent to the server, the current time in UTC formatted to ISO 8601, and the 
--- players secret formatted as 'body.date.secret'. Place the resulting hash into 
--- the header X-PlayFab-Signature, along with a header X-PlayFab-Timestamp of the 
--- same UTC timestamp used in the signature. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/authentication/setplayersecret
function Apis.SetPlayerSecretAsync(
	secretKey: string, 
	request: Types.SetPlayerSecretRequest
): Types.SetPlayerSecretResult
	return PlayFabInternal.MakeApiCall(
		"/Admin/SetPlayerSecret",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/admin/server-side-cloud-script/setpublishedrevision
function Apis.SetPublishedRevisionAsync(
	secretKey: string, 
	request: Types.SetPublishedRevisionRequest
): Types.SetPublishedRevisionResult
	return PlayFabInternal.MakeApiCall(
		"/Admin/SetPublishedRevision",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- This API is designed to store publisher-specific values which can be read, but 
--- not written to, by the client. This data is shared across all titles assigned 
--- to a particular publisher, and can be used for cross-game coordination. Only 
--- titles assigned to a publisher can use this API. This operation is additive. 
--- If a Key does not exist in the current dataset, it will be added with the specified 
--- Value. If it already exists, the Value for that key will be overwritten with 
--- the new Value. For more information email helloplayfab@microsoft.com 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/shared-group-data/setpublisherdata
function Apis.SetPublisherDataAsync(
	secretKey: string, 
	request: Types.SetPublisherDataRequest
): Types.SetPublisherDataResult
	return PlayFabInternal.MakeApiCall(
		"/Admin/SetPublisherData",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- When used for SetStoreItems, this operation is not additive. Using it will cause 
--- the indicated virtual store to be created from scratch. If there is an existing 
--- store with the same storeId, it will be deleted and replaced with only the items 
--- specified in this call. When used for UpdateStoreItems, this operation is additive. 
--- Items with ItemId values not currently in the store will be added, while those 
--- with ItemId values matching items currently in the catalog will overwrite those 
--- items with the given values. In both cases, a store contains an array of references 
--- to items defined in the catalog, along with the prices for the item, in both 
--- real world and virtual currencies. These prices act as an override to any prices 
--- defined in the catalog. In this way, the base definitions of the items may be 
--- defined in the catalog, with all associated properties, while the pricing can 
--- be set for each store, as needed. This allows for subsets of goods to be defined 
--- for different purposes (in order to simplify showing some, but not all catalog 
--- items to users, based upon different characteristics), along with unique prices. 
--- Note that all prices defined in the catalog and store definitions for the item 
--- are considered valid, and that a compromised client can be made to send a request 
--- for an item based upon any of these definitions. If no price is specified in 
--- the store for an item, the price set in the catalog should be displayed to the 
--- user. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/setstoreitems
function Apis.SetStoreItemsAsync(
	secretKey: string, 
	request: Types.UpdateStoreItemsRequest
): Types.UpdateStoreItemsResult
	return PlayFabInternal.MakeApiCall(
		"/Admin/SetStoreItems",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- This API method is designed to store title specific values which can be read 
--- by the client. For example, a developer could choose to store values which modify 
--- the user experience, such as enemy spawn rates, weapon strengths, movement speeds, 
--- etc. This allows a developer to update the title without the need to create, 
--- test, and ship a new build. This operation is additive. If a Key does not exist 
--- in the current dataset, it will be added with the specified Value. If it already 
--- exists, the Value for that key will be overwritten with the new Value. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/settitledata
function Apis.SetTitleDataAsync(
	secretKey: string, 
	request: Types.SetTitleDataRequest
): Types.SetTitleDataResult
	return PlayFabInternal.MakeApiCall(
		"/Admin/SetTitleData",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- This API method is designed to set and delete key-value pairs in a title data 
--- override instance. If the key exists and the new value is empty, the method 
--- will delete the key; otherwise, the method will update the current value with 
--- the new value. Keys are trimmed and cannot start with '!'. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/settitledataandoverrides
function Apis.SetTitleDataAndOverridesAsync(
	secretKey: string, 
	request: Types.SetTitleDataAndOverridesRequest
): Types.SetTitleDataAndOverridesResult
	return PlayFabInternal.MakeApiCall(
		"/Admin/SetTitleDataAndOverrides",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- This API method is designed to store title specific values which are accessible 
--- only by the server. These values can be used to tweak settings used by game 
--- servers and Cloud Scripts without the need to update and re-deploy. This operation 
--- is additive. If a Key does not exist in the current dataset, it will be added 
--- with the specified Value. If it already exists, the Value for that key will 
--- be overwritten with the new Value. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/settitleinternaldata
function Apis.SetTitleInternalDataAsync(
	secretKey: string, 
	request: Types.SetTitleDataRequest
): Types.SetTitleDataResult
	return PlayFabInternal.MakeApiCall(
		"/Admin/SetTitleInternalData",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- When using the Apple Push Notification service (APNS) or the development version 
--- (APNS_SANDBOX), the APNS Private Key should be used as the Credential in this 
--- call. With Google Cloud Messaging (GCM), the Android API Key should be used. 
--- The current ARN (if one exists) can be overwritten by setting the OverwriteOldARN 
--- boolean to true. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/setuppushnotification
function Apis.SetupPushNotificationAsync(
	secretKey: string, 
	request: Types.SetupPushNotificationRequest
): Types.SetupPushNotificationResult
	return PlayFabInternal.MakeApiCall(
		"/Admin/SetupPushNotification",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/admin/player-item-management/subtractuservirtualcurrency
function Apis.SubtractUserVirtualCurrencyAsync(
	secretKey: string, 
	request: Types.SubtractUserVirtualCurrencyRequest
): Types.ModifyUserVirtualCurrencyResult
	return PlayFabInternal.MakeApiCall(
		"/Admin/SubtractUserVirtualCurrency",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- For each ban, only updates the values that are set. Leave any value to null 
--- for no change. If a ban could not be found, the rest are still applied. Returns 
--- information about applied updates only. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/account-management/updatebans
function Apis.UpdateBansAsync(
	secretKey: string, 
	request: Types.UpdateBansRequest
): Types.UpdateBansResult
	return PlayFabInternal.MakeApiCall(
		"/Admin/UpdateBans",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- When used for SetCatalogItems, this operation is not additive. Using it will 
--- cause the indicated catalog version to be created from scratch. If there is 
--- an existing catalog with the version number in question, it will be deleted 
--- and replaced with only the items specified in this call. When used for UpdateCatalogItems, 
--- this operation is additive. Items with ItemId values not currently in the catalog 
--- will be added, while those with ItemId values matching items currently in the 
--- catalog will overwrite those items with the given values. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/updatecatalogitems
function Apis.UpdateCatalogItemsAsync(
	secretKey: string, 
	request: Types.UpdateCatalogItemsRequest
): Types.UpdateCatalogItemsResult
	return PlayFabInternal.MakeApiCall(
		"/Admin/UpdateCatalogItems",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/admin/server-side-cloud-script/updatecloudscript
function Apis.UpdateCloudScriptAsync(
	secretKey: string, 
	request: Types.UpdateCloudScriptRequest
): Types.UpdateCloudScriptResult
	return PlayFabInternal.MakeApiCall(
		"/Admin/UpdateCloudScript",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- https://docs.microsoft.com/rest/api/playfab/admin/authentication/updateopenidconnection
function Apis.UpdateOpenIdConnectionAsync(
	secretKey: string, 
	request: Types.UpdateOpenIdConnectionRequest
): Types.EmptyResponse
	return PlayFabInternal.MakeApiCall(
		"/Admin/UpdateOpenIdConnection",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- Player Shared Secret Keys are used for the call to Client/GetTitlePublicKey, 
--- which exchanges the shared secret for an RSA CSP blob to be used to encrypt 
--- the payload of account creation requests when that API requires a signature 
--- header. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/authentication/updateplayersharedsecret
function Apis.UpdatePlayerSharedSecretAsync(
	secretKey: string, 
	request: Types.UpdatePlayerSharedSecretRequest
): Types.UpdatePlayerSharedSecretResult
	return PlayFabInternal.MakeApiCall(
		"/Admin/UpdatePlayerSharedSecret",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- Statistics are numeric values, with each statistic in the title also generating 
--- a leaderboard. The ResetInterval enables automatically resetting leaderboards 
--- on a specified interval. Upon reset, the statistic updates to a new version 
--- with no values (effectively removing all players from the leaderboard). The 
--- previous version's statistic values are also archived for retrieval, if needed 
--- (see GetPlayerStatisticVersions). Statistics not created via a call to CreatePlayerStatisticDefinition 
--- by default have a VersionChangeInterval of Never, meaning they do not reset 
--- on a schedule, but they can be set to do so via a call to UpdatePlayerStatisticDefinition. 
--- Once a statistic has been reset (sometimes referred to as versioned or incremented), 
--- the now-previous version can still be written to for up a short, pre-defined 
--- period (currently 10 seconds), to prevent issues with levels completing around 
--- the time of the reset. Also, once reset, the historical statistics for players 
--- in the title may be retrieved using the URL specified in the version information 
--- (GetPlayerStatisticVersions). The AggregationMethod determines what action is 
--- taken when a new statistic value is submitted - always update with the new value 
--- (Last), use the highest of the old and new values (Max), use the smallest (Min), 
--- or add them together (Sum). 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/updateplayerstatisticdefinition
function Apis.UpdatePlayerStatisticDefinitionAsync(
	secretKey: string, 
	request: Types.UpdatePlayerStatisticDefinitionRequest
): Types.UpdatePlayerStatisticDefinitionResult
	return PlayFabInternal.MakeApiCall(
		"/Admin/UpdatePlayerStatisticDefinition",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- Updates permissions for your title. Policies affect what is allowed to happen 
--- on your title. Your policy is a collection of statements that, together, govern 
--- particular area for your title. Today, the only allowed policy is called 'ApiPolicy' 
--- and it governs what API calls are allowed. To verify that you have the latest 
--- version always download the current policy from GetPolicy before uploading a 
--- new policy. PlayFab updates the base policy periodically and will automatically 
--- apply it to the uploaded policy. Overwriting the combined policy blindly may 
--- result in unexpected API errors. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/authentication/updatepolicy
function Apis.UpdatePolicyAsync(
	secretKey: string, 
	request: Types.UpdatePolicyRequest
): Types.UpdatePolicyResponse
	return PlayFabInternal.MakeApiCall(
		"/Admin/UpdatePolicy",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- This operation is additive. Tables with TableId values not currently defined 
--- will be added, while those with TableId values matching Tables currently in 
--- the catalog will be overwritten with the given values. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/updaterandomresulttables
function Apis.UpdateRandomResultTablesAsync(
	secretKey: string, 
	request: Types.UpdateRandomResultTablesRequest
): Types.UpdateRandomResultTablesResult
	return PlayFabInternal.MakeApiCall(
		"/Admin/UpdateRandomResultTables",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- Update segment properties data which are planning to update 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/segments/updatesegment
function Apis.UpdateSegmentAsync(
	secretKey: string, 
	request: Types.UpdateSegmentRequest
): Types.UpdateSegmentResponse
	return PlayFabInternal.MakeApiCall(
		"/Admin/UpdateSegment",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- When used for SetStoreItems, this operation is not additive. Using it will cause 
--- the indicated virtual store to be created from scratch. If there is an existing 
--- store with the same storeId, it will be deleted and replaced with only the items 
--- specified in this call. When used for UpdateStoreItems, this operation is additive. 
--- Items with ItemId values not currently in the store will be added, while those 
--- with ItemId values matching items currently in the catalog will overwrite those 
--- items with the given values. In both cases, a store contains an array of references 
--- to items defined in the catalog, along with the prices for the item, in both 
--- real world and virtual currencies. These prices act as an override to any prices 
--- defined in the catalog. In this way, the base definitions of the items may be 
--- defined in the catalog, with all associated properties, while the pricing can 
--- be set for each store, as needed. This allows for subsets of goods to be defined 
--- for different purposes (in order to simplify showing some, but not all catalog 
--- items to users, based upon different characteristics), along with unique prices. 
--- Note that all prices defined in the catalog and store definitions for the item 
--- are considered valid, and that a compromised client can be made to send a request 
--- for an item based upon any of these definitions. If no price is specified in 
--- the store for an item, the price set in the catalog should be displayed to the 
--- user. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/updatestoreitems
function Apis.UpdateStoreItemsAsync(
	secretKey: string, 
	request: Types.UpdateStoreItemsRequest
): Types.UpdateStoreItemsResult
	return PlayFabInternal.MakeApiCall(
		"/Admin/UpdateStoreItems",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- Note that when calling this API, all properties of the task have to be provided, 
--- including properties that you do not want to change. Parameters not specified 
--- would be set to default value. If the task name in the update request is new, 
--- a task rename operation will be executed before updating other fields of the 
--- task. WARNING: Renaming of a task may break logics where the task name is used 
--- as an identifier. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/scheduledtask/updatetask
function Apis.UpdateTaskAsync(
	secretKey: string, 
	request: Types.UpdateTaskRequest
): Types.EmptyResponse
	return PlayFabInternal.MakeApiCall(
		"/Admin/UpdateTask",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- This function performs an additive update of the arbitrary JSON object containing 
--- the custom data for the user. In updating the custom data object, keys which 
--- already exist in the object will have their values overwritten, while keys with 
--- null values will be removed. No other key-value pairs will be changed apart 
--- from those specified in the call. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/updateuserdata
function Apis.UpdateUserDataAsync(
	secretKey: string, 
	request: Types.UpdateUserDataRequest
): Types.UpdateUserDataResult
	return PlayFabInternal.MakeApiCall(
		"/Admin/UpdateUserData",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- This function performs an additive update of the arbitrary JSON object containing 
--- the custom data for the user. In updating the custom data object, keys which 
--- already exist in the object will have their values overwritten, keys with null 
--- values will be removed. No other key-value pairs will be changed apart from 
--- those specified in the call. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/updateuserinternaldata
function Apis.UpdateUserInternalDataAsync(
	secretKey: string, 
	request: Types.UpdateUserInternalDataRequest
): Types.UpdateUserDataResult
	return PlayFabInternal.MakeApiCall(
		"/Admin/UpdateUserInternalData",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- This function performs an additive update of the arbitrary JSON object containing 
--- the custom data for the user. In updating the custom data object, keys which 
--- already exist in the object will have their values overwritten, while keys with 
--- null values will be removed. No other key-value pairs will be changed apart 
--- from those specified in the call. Note that in the example call provided, title-specific 
--- data is used, as there may be a need to share this across titles (in sequels, 
--- for example). 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/updateuserpublisherdata
function Apis.UpdateUserPublisherDataAsync(
	secretKey: string, 
	request: Types.UpdateUserDataRequest
): Types.UpdateUserDataResult
	return PlayFabInternal.MakeApiCall(
		"/Admin/UpdateUserPublisherData",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- This function performs an additive update of the arbitrary JSON object containing 
--- the custom data for the user. In updating the custom data object, keys which 
--- already exist in the object will have their values overwritten, keys with null 
--- values will be removed. No other key-value pairs will be changed apart from 
--- those specified in the call. Note that in the example call provided, title-specific 
--- data is used, as there may be a need to share this across titles (in sequels, 
--- for example). 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/updateuserpublisherinternaldata
function Apis.UpdateUserPublisherInternalDataAsync(
	secretKey: string, 
	request: Types.UpdateUserInternalDataRequest
): Types.UpdateUserDataResult
	return PlayFabInternal.MakeApiCall(
		"/Admin/UpdateUserPublisherInternalData",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- This function performs an additive update of the arbitrary JSON object containing 
--- the custom data for the user. In updating the custom data object, keys which 
--- already exist in the object will have their values overwritten, keys with null 
--- values will be removed. No other key-value pairs will be changed apart from 
--- those specified in the call. Note that in the example call provided, title-specific 
--- data is used, as there may be a need to share this across titles (in sequels, 
--- for example). 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/updateuserpublisherreadonlydata
function Apis.UpdateUserPublisherReadOnlyDataAsync(
	secretKey: string, 
	request: Types.UpdateUserDataRequest
): Types.UpdateUserDataResult
	return PlayFabInternal.MakeApiCall(
		"/Admin/UpdateUserPublisherReadOnlyData",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- This function performs an additive update of the arbitrary JSON object containing 
--- the custom data for the user. In updating the custom data object, keys which 
--- already exist in the object will have their values overwritten, keys with null 
--- values will be removed. No other key-value pairs will be changed apart from 
--- those specified in the call. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/updateuserreadonlydata
function Apis.UpdateUserReadOnlyDataAsync(
	secretKey: string, 
	request: Types.UpdateUserDataRequest
): Types.UpdateUserDataResult
	return PlayFabInternal.MakeApiCall(
		"/Admin/UpdateUserReadOnlyData",
		request,
		"X-SecretKey",
		secretKey
	)
end

--- In addition to the PlayFab username, titles can make use of a DisplayName which 
--- is also a unique identifier, but specific to the title. This allows for unique 
--- names which more closely match the theme or genre of a title, for example. This 
--- API enables changing that name, whether due to a customer request, an offensive 
--- name choice, etc. 
---
--- https://docs.microsoft.com/rest/api/playfab/admin/account-management/updateusertitledisplayname
function Apis.UpdateUserTitleDisplayNameAsync(
	secretKey: string, 
	request: Types.UpdateUserTitleDisplayNameRequest
): Types.UpdateUserTitleDisplayNameResult
	return PlayFabInternal.MakeApiCall(
		"/Admin/UpdateUserTitleDisplayName",
		request,
		"X-SecretKey",
		secretKey
	)
end

return Apis

