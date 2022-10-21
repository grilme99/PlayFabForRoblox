--!strict
--[=[
	# ServerApi

	Provides functionality to allow external (developer-controlled) servers to interact 
	with user inventories and data in a trusted manner, and to handle matchmaking 
	and client connection orchestration. 

	API Version: 1.221010.0
]=]

local PlayFabInternal = require(script.Parent.PlayFabInternal)
local Types = require(script.Parent.Types)
local ServerApi = require(script.Apis)

function ServerApi.SetSettings(settings: PlayFabInternal.ISettings)
	PlayFabInternal.SetSettings(settings)
end

export type AdCampaignAttribution = Types.AdCampaignAttribution
export type AdCampaignAttributionModel = Types.AdCampaignAttributionModel
export type AddCharacterVirtualCurrencyRequest = Types.AddCharacterVirtualCurrencyRequest
export type AddFriendRequest = Types.AddFriendRequest
export type AddGenericIDRequest = Types.AddGenericIDRequest
export type AddPlayerTagRequest = Types.AddPlayerTagRequest
export type AddPlayerTagResult = Types.AddPlayerTagResult
export type AddSharedGroupMembersRequest = Types.AddSharedGroupMembersRequest
export type AddSharedGroupMembersResult = Types.AddSharedGroupMembersResult
export type AddUserVirtualCurrencyRequest = Types.AddUserVirtualCurrencyRequest
export type AdvancedPushPlatformMsg = Types.AdvancedPushPlatformMsg
export type ApiErrorWrapper = Types.ApiErrorWrapper
export type AuthenticateSessionTicketRequest = Types.AuthenticateSessionTicketRequest
export type AuthenticateSessionTicketResult = Types.AuthenticateSessionTicketResult
export type AwardSteamAchievementItem = Types.AwardSteamAchievementItem
export type AwardSteamAchievementRequest = Types.AwardSteamAchievementRequest
export type AwardSteamAchievementResult = Types.AwardSteamAchievementResult
export type BanInfo = Types.BanInfo
export type BanRequest = Types.BanRequest
export type BanUsersRequest = Types.BanUsersRequest
export type BanUsersResult = Types.BanUsersResult
export type CatalogItem = Types.CatalogItem
export type CatalogItemBundleInfo = Types.CatalogItemBundleInfo
export type CatalogItemConsumableInfo = Types.CatalogItemConsumableInfo
export type CatalogItemContainerInfo = Types.CatalogItemContainerInfo
export type CharacterInventory = Types.CharacterInventory
export type CharacterLeaderboardEntry = Types.CharacterLeaderboardEntry
export type CharacterResult = Types.CharacterResult
export type CloudScriptRevisionOption = Types.CloudScriptRevisionOption
export type ConsumeItemRequest = Types.ConsumeItemRequest
export type ConsumeItemResult = Types.ConsumeItemResult
export type ContactEmailInfo = Types.ContactEmailInfo
export type ContactEmailInfoModel = Types.ContactEmailInfoModel
export type ContinentCode = Types.ContinentCode
export type CountryCode = Types.CountryCode
export type CreateSharedGroupRequest = Types.CreateSharedGroupRequest
export type CreateSharedGroupResult = Types.CreateSharedGroupResult
export type Currency = Types.Currency
export type DeleteCharacterFromUserRequest = Types.DeleteCharacterFromUserRequest
export type DeleteCharacterFromUserResult = Types.DeleteCharacterFromUserResult
export type DeletePlayerRequest = Types.DeletePlayerRequest
export type DeletePlayerResult = Types.DeletePlayerResult
export type DeletePushNotificationTemplateRequest = Types.DeletePushNotificationTemplateRequest
export type DeletePushNotificationTemplateResult = Types.DeletePushNotificationTemplateResult
export type DeleteSharedGroupRequest = Types.DeleteSharedGroupRequest
export type DeregisterGameRequest = Types.DeregisterGameRequest
export type DeregisterGameResponse = Types.DeregisterGameResponse
export type EmailVerificationStatus = Types.EmailVerificationStatus
export type EmptyResponse = Types.EmptyResponse
export type EmptyResult = Types.EmptyResult
export type EntityKey = Types.EntityKey
export type EntityTokenResponse = Types.EntityTokenResponse
export type EvaluateRandomResultTableRequest = Types.EvaluateRandomResultTableRequest
export type EvaluateRandomResultTableResult = Types.EvaluateRandomResultTableResult
export type ExecuteCloudScriptResult = Types.ExecuteCloudScriptResult
export type ExecuteCloudScriptServerRequest = Types.ExecuteCloudScriptServerRequest
export type FacebookInstantGamesPlayFabIdPair = Types.FacebookInstantGamesPlayFabIdPair
export type FacebookPlayFabIdPair = Types.FacebookPlayFabIdPair
export type FriendInfo = Types.FriendInfo
export type GameInstanceState = Types.GameInstanceState
export type GenericErrorCodes = Types.GenericErrorCodes
export type GenericPlayFabIdPair = Types.GenericPlayFabIdPair
export type GenericServiceId = Types.GenericServiceId
export type GetAllSegmentsRequest = Types.GetAllSegmentsRequest
export type GetAllSegmentsResult = Types.GetAllSegmentsResult
export type GetCatalogItemsRequest = Types.GetCatalogItemsRequest
export type GetCatalogItemsResult = Types.GetCatalogItemsResult
export type GetCharacterDataRequest = Types.GetCharacterDataRequest
export type GetCharacterDataResult = Types.GetCharacterDataResult
export type GetCharacterInventoryRequest = Types.GetCharacterInventoryRequest
export type GetCharacterInventoryResult = Types.GetCharacterInventoryResult
export type GetCharacterLeaderboardRequest = Types.GetCharacterLeaderboardRequest
export type GetCharacterLeaderboardResult = Types.GetCharacterLeaderboardResult
export type GetCharacterStatisticsRequest = Types.GetCharacterStatisticsRequest
export type GetCharacterStatisticsResult = Types.GetCharacterStatisticsResult
export type GetContentDownloadUrlRequest = Types.GetContentDownloadUrlRequest
export type GetContentDownloadUrlResult = Types.GetContentDownloadUrlResult
export type GetFriendLeaderboardRequest = Types.GetFriendLeaderboardRequest
export type GetFriendsListRequest = Types.GetFriendsListRequest
export type GetFriendsListResult = Types.GetFriendsListResult
export type GetLeaderboardAroundCharacterRequest = Types.GetLeaderboardAroundCharacterRequest
export type GetLeaderboardAroundCharacterResult = Types.GetLeaderboardAroundCharacterResult
export type GetLeaderboardAroundUserRequest = Types.GetLeaderboardAroundUserRequest
export type GetLeaderboardAroundUserResult = Types.GetLeaderboardAroundUserResult
export type GetLeaderboardForUsersCharactersRequest = Types.GetLeaderboardForUsersCharactersRequest
export type GetLeaderboardForUsersCharactersResult = Types.GetLeaderboardForUsersCharactersResult
export type GetLeaderboardRequest = Types.GetLeaderboardRequest
export type GetLeaderboardResult = Types.GetLeaderboardResult
export type GetPlayFabIDsFromFacebookIDsRequest = Types.GetPlayFabIDsFromFacebookIDsRequest
export type GetPlayFabIDsFromFacebookIDsResult = Types.GetPlayFabIDsFromFacebookIDsResult
export type GetPlayFabIDsFromFacebookInstantGamesIdsRequest = Types.GetPlayFabIDsFromFacebookInstantGamesIdsRequest
export type GetPlayFabIDsFromFacebookInstantGamesIdsResult = Types.GetPlayFabIDsFromFacebookInstantGamesIdsResult
export type GetPlayFabIDsFromGenericIDsRequest = Types.GetPlayFabIDsFromGenericIDsRequest
export type GetPlayFabIDsFromGenericIDsResult = Types.GetPlayFabIDsFromGenericIDsResult
export type GetPlayFabIDsFromNintendoServiceAccountIdsRequest = Types.GetPlayFabIDsFromNintendoServiceAccountIdsRequest
export type GetPlayFabIDsFromNintendoServiceAccountIdsResult = Types.GetPlayFabIDsFromNintendoServiceAccountIdsResult
export type GetPlayFabIDsFromNintendoSwitchDeviceIdsRequest = Types.GetPlayFabIDsFromNintendoSwitchDeviceIdsRequest
export type GetPlayFabIDsFromNintendoSwitchDeviceIdsResult = Types.GetPlayFabIDsFromNintendoSwitchDeviceIdsResult
export type GetPlayFabIDsFromPSNAccountIDsRequest = Types.GetPlayFabIDsFromPSNAccountIDsRequest
export type GetPlayFabIDsFromPSNAccountIDsResult = Types.GetPlayFabIDsFromPSNAccountIDsResult
export type GetPlayFabIDsFromSteamIDsRequest = Types.GetPlayFabIDsFromSteamIDsRequest
export type GetPlayFabIDsFromSteamIDsResult = Types.GetPlayFabIDsFromSteamIDsResult
export type GetPlayFabIDsFromTwitchIDsRequest = Types.GetPlayFabIDsFromTwitchIDsRequest
export type GetPlayFabIDsFromTwitchIDsResult = Types.GetPlayFabIDsFromTwitchIDsResult
export type GetPlayFabIDsFromXboxLiveIDsRequest = Types.GetPlayFabIDsFromXboxLiveIDsRequest
export type GetPlayFabIDsFromXboxLiveIDsResult = Types.GetPlayFabIDsFromXboxLiveIDsResult
export type GetPlayerCombinedInfoRequest = Types.GetPlayerCombinedInfoRequest
export type GetPlayerCombinedInfoRequestParams = Types.GetPlayerCombinedInfoRequestParams
export type GetPlayerCombinedInfoResult = Types.GetPlayerCombinedInfoResult
export type GetPlayerCombinedInfoResultPayload = Types.GetPlayerCombinedInfoResultPayload
export type GetPlayerProfileRequest = Types.GetPlayerProfileRequest
export type GetPlayerProfileResult = Types.GetPlayerProfileResult
export type GetPlayerSegmentsResult = Types.GetPlayerSegmentsResult
export type GetPlayerStatisticVersionsRequest = Types.GetPlayerStatisticVersionsRequest
export type GetPlayerStatisticVersionsResult = Types.GetPlayerStatisticVersionsResult
export type GetPlayerStatisticsRequest = Types.GetPlayerStatisticsRequest
export type GetPlayerStatisticsResult = Types.GetPlayerStatisticsResult
export type GetPlayerTagsRequest = Types.GetPlayerTagsRequest
export type GetPlayerTagsResult = Types.GetPlayerTagsResult
export type GetPlayersInSegmentRequest = Types.GetPlayersInSegmentRequest
export type GetPlayersInSegmentResult = Types.GetPlayersInSegmentResult
export type GetPlayersSegmentsRequest = Types.GetPlayersSegmentsRequest
export type GetPublisherDataRequest = Types.GetPublisherDataRequest
export type GetPublisherDataResult = Types.GetPublisherDataResult
export type GetRandomResultTablesRequest = Types.GetRandomResultTablesRequest
export type GetRandomResultTablesResult = Types.GetRandomResultTablesResult
export type GetSegmentResult = Types.GetSegmentResult
export type GetServerCustomIDsFromPlayFabIDsRequest = Types.GetServerCustomIDsFromPlayFabIDsRequest
export type GetServerCustomIDsFromPlayFabIDsResult = Types.GetServerCustomIDsFromPlayFabIDsResult
export type GetSharedGroupDataRequest = Types.GetSharedGroupDataRequest
export type GetSharedGroupDataResult = Types.GetSharedGroupDataResult
export type GetStoreItemsResult = Types.GetStoreItemsResult
export type GetStoreItemsServerRequest = Types.GetStoreItemsServerRequest
export type GetTimeRequest = Types.GetTimeRequest
export type GetTimeResult = Types.GetTimeResult
export type GetTitleDataRequest = Types.GetTitleDataRequest
export type GetTitleDataResult = Types.GetTitleDataResult
export type GetTitleNewsRequest = Types.GetTitleNewsRequest
export type GetTitleNewsResult = Types.GetTitleNewsResult
export type GetUserAccountInfoRequest = Types.GetUserAccountInfoRequest
export type GetUserAccountInfoResult = Types.GetUserAccountInfoResult
export type GetUserBansRequest = Types.GetUserBansRequest
export type GetUserBansResult = Types.GetUserBansResult
export type GetUserDataRequest = Types.GetUserDataRequest
export type GetUserDataResult = Types.GetUserDataResult
export type GetUserInventoryRequest = Types.GetUserInventoryRequest
export type GetUserInventoryResult = Types.GetUserInventoryResult
export type GrantCharacterToUserRequest = Types.GrantCharacterToUserRequest
export type GrantCharacterToUserResult = Types.GrantCharacterToUserResult
export type GrantItemsToCharacterRequest = Types.GrantItemsToCharacterRequest
export type GrantItemsToCharacterResult = Types.GrantItemsToCharacterResult
export type GrantItemsToUserRequest = Types.GrantItemsToUserRequest
export type GrantItemsToUserResult = Types.GrantItemsToUserResult
export type GrantItemsToUsersRequest = Types.GrantItemsToUsersRequest
export type GrantItemsToUsersResult = Types.GrantItemsToUsersResult
export type GrantedItemInstance = Types.GrantedItemInstance
export type ItemGrant = Types.ItemGrant
export type ItemInstance = Types.ItemInstance
export type LinkNintendoServiceAccountRequest = Types.LinkNintendoServiceAccountRequest
export type LinkNintendoSwitchDeviceIdRequest = Types.LinkNintendoSwitchDeviceIdRequest
export type LinkNintendoSwitchDeviceIdResult = Types.LinkNintendoSwitchDeviceIdResult
export type LinkPSNAccountRequest = Types.LinkPSNAccountRequest
export type LinkPSNAccountResult = Types.LinkPSNAccountResult
export type LinkServerCustomIdRequest = Types.LinkServerCustomIdRequest
export type LinkServerCustomIdResult = Types.LinkServerCustomIdResult
export type LinkXboxAccountRequest = Types.LinkXboxAccountRequest
export type LinkXboxAccountResult = Types.LinkXboxAccountResult
export type LinkedPlatformAccountModel = Types.LinkedPlatformAccountModel
export type ListUsersCharactersRequest = Types.ListUsersCharactersRequest
export type ListUsersCharactersResult = Types.ListUsersCharactersResult
export type LocalizedPushNotificationProperties = Types.LocalizedPushNotificationProperties
export type LocationModel = Types.LocationModel
export type LogStatement = Types.LogStatement
export type LoginIdentityProvider = Types.LoginIdentityProvider
export type LoginWithServerCustomIdRequest = Types.LoginWithServerCustomIdRequest
export type LoginWithSteamIdRequest = Types.LoginWithSteamIdRequest
export type LoginWithXboxIdRequest = Types.LoginWithXboxIdRequest
export type LoginWithXboxRequest = Types.LoginWithXboxRequest
export type MembershipModel = Types.MembershipModel
export type ModifyCharacterVirtualCurrencyResult = Types.ModifyCharacterVirtualCurrencyResult
export type ModifyItemUsesRequest = Types.ModifyItemUsesRequest
export type ModifyItemUsesResult = Types.ModifyItemUsesResult
export type ModifyUserVirtualCurrencyResult = Types.ModifyUserVirtualCurrencyResult
export type MoveItemToCharacterFromCharacterRequest = Types.MoveItemToCharacterFromCharacterRequest
export type MoveItemToCharacterFromCharacterResult = Types.MoveItemToCharacterFromCharacterResult
export type MoveItemToCharacterFromUserRequest = Types.MoveItemToCharacterFromUserRequest
export type MoveItemToCharacterFromUserResult = Types.MoveItemToCharacterFromUserResult
export type MoveItemToUserFromCharacterRequest = Types.MoveItemToUserFromCharacterRequest
export type MoveItemToUserFromCharacterResult = Types.MoveItemToUserFromCharacterResult
export type NintendoServiceAccountPlayFabIdPair = Types.NintendoServiceAccountPlayFabIdPair
export type NintendoSwitchPlayFabIdPair = Types.NintendoSwitchPlayFabIdPair
export type NotifyMatchmakerPlayerLeftRequest = Types.NotifyMatchmakerPlayerLeftRequest
export type NotifyMatchmakerPlayerLeftResult = Types.NotifyMatchmakerPlayerLeftResult
export type PSNAccountPlayFabIdPair = Types.PSNAccountPlayFabIdPair
export type PlayerConnectionState = Types.PlayerConnectionState
export type PlayerLeaderboardEntry = Types.PlayerLeaderboardEntry
export type PlayerLinkedAccount = Types.PlayerLinkedAccount
export type PlayerLocation = Types.PlayerLocation
export type PlayerProfile = Types.PlayerProfile
export type PlayerProfileModel = Types.PlayerProfileModel
export type PlayerProfileViewConstraints = Types.PlayerProfileViewConstraints
export type PlayerStatistic = Types.PlayerStatistic
export type PlayerStatisticVersion = Types.PlayerStatisticVersion
export type PushNotificationPackage = Types.PushNotificationPackage
export type PushNotificationPlatform = Types.PushNotificationPlatform
export type PushNotificationRegistration = Types.PushNotificationRegistration
export type PushNotificationRegistrationModel = Types.PushNotificationRegistrationModel
export type RandomResultTableListing = Types.RandomResultTableListing
export type RedeemCouponRequest = Types.RedeemCouponRequest
export type RedeemCouponResult = Types.RedeemCouponResult
export type RedeemMatchmakerTicketRequest = Types.RedeemMatchmakerTicketRequest
export type RedeemMatchmakerTicketResult = Types.RedeemMatchmakerTicketResult
export type RefreshGameServerInstanceHeartbeatRequest = Types.RefreshGameServerInstanceHeartbeatRequest
export type RefreshGameServerInstanceHeartbeatResult = Types.RefreshGameServerInstanceHeartbeatResult
export type Region = Types.Region
export type RegisterGameRequest = Types.RegisterGameRequest
export type RegisterGameResponse = Types.RegisterGameResponse
export type RemoveFriendRequest = Types.RemoveFriendRequest
export type RemoveGenericIDRequest = Types.RemoveGenericIDRequest
export type RemovePlayerTagRequest = Types.RemovePlayerTagRequest
export type RemovePlayerTagResult = Types.RemovePlayerTagResult
export type RemoveSharedGroupMembersRequest = Types.RemoveSharedGroupMembersRequest
export type RemoveSharedGroupMembersResult = Types.RemoveSharedGroupMembersResult
export type ReportPlayerServerRequest = Types.ReportPlayerServerRequest
export type ReportPlayerServerResult = Types.ReportPlayerServerResult
export type ResultTableNode = Types.ResultTableNode
export type ResultTableNodeType = Types.ResultTableNodeType
export type RevokeAllBansForUserRequest = Types.RevokeAllBansForUserRequest
export type RevokeAllBansForUserResult = Types.RevokeAllBansForUserResult
export type RevokeBansRequest = Types.RevokeBansRequest
export type RevokeBansResult = Types.RevokeBansResult
export type RevokeInventoryItem = Types.RevokeInventoryItem
export type RevokeInventoryItemRequest = Types.RevokeInventoryItemRequest
export type RevokeInventoryItemsRequest = Types.RevokeInventoryItemsRequest
export type RevokeInventoryItemsResult = Types.RevokeInventoryItemsResult
export type RevokeInventoryResult = Types.RevokeInventoryResult
export type RevokeItemError = Types.RevokeItemError
export type SavePushNotificationTemplateRequest = Types.SavePushNotificationTemplateRequest
export type SavePushNotificationTemplateResult = Types.SavePushNotificationTemplateResult
export type ScriptExecutionError = Types.ScriptExecutionError
export type SendCustomAccountRecoveryEmailRequest = Types.SendCustomAccountRecoveryEmailRequest
export type SendCustomAccountRecoveryEmailResult = Types.SendCustomAccountRecoveryEmailResult
export type SendEmailFromTemplateRequest = Types.SendEmailFromTemplateRequest
export type SendEmailFromTemplateResult = Types.SendEmailFromTemplateResult
export type SendPushNotificationFromTemplateRequest = Types.SendPushNotificationFromTemplateRequest
export type SendPushNotificationRequest = Types.SendPushNotificationRequest
export type SendPushNotificationResult = Types.SendPushNotificationResult
export type ServerCustomIDPlayFabIDPair = Types.ServerCustomIDPlayFabIDPair
export type ServerLoginResult = Types.ServerLoginResult
export type SetFriendTagsRequest = Types.SetFriendTagsRequest
export type SetGameServerInstanceDataRequest = Types.SetGameServerInstanceDataRequest
export type SetGameServerInstanceDataResult = Types.SetGameServerInstanceDataResult
export type SetGameServerInstanceStateRequest = Types.SetGameServerInstanceStateRequest
export type SetGameServerInstanceStateResult = Types.SetGameServerInstanceStateResult
export type SetGameServerInstanceTagsRequest = Types.SetGameServerInstanceTagsRequest
export type SetGameServerInstanceTagsResult = Types.SetGameServerInstanceTagsResult
export type SetPlayerSecretRequest = Types.SetPlayerSecretRequest
export type SetPlayerSecretResult = Types.SetPlayerSecretResult
export type SetPublisherDataRequest = Types.SetPublisherDataRequest
export type SetPublisherDataResult = Types.SetPublisherDataResult
export type SetTitleDataRequest = Types.SetTitleDataRequest
export type SetTitleDataResult = Types.SetTitleDataResult
export type SharedGroupDataRecord = Types.SharedGroupDataRecord
export type SourceType = Types.SourceType
export type StatisticModel = Types.StatisticModel
export type StatisticNameVersion = Types.StatisticNameVersion
export type StatisticUpdate = Types.StatisticUpdate
export type StatisticValue = Types.StatisticValue
export type SteamPlayFabIdPair = Types.SteamPlayFabIdPair
export type StoreItem = Types.StoreItem
export type StoreMarketingModel = Types.StoreMarketingModel
export type SubscriptionModel = Types.SubscriptionModel
export type SubscriptionProviderStatus = Types.SubscriptionProviderStatus
export type SubtractCharacterVirtualCurrencyRequest = Types.SubtractCharacterVirtualCurrencyRequest
export type SubtractUserVirtualCurrencyRequest = Types.SubtractUserVirtualCurrencyRequest
export type TagModel = Types.TagModel
export type TitleActivationStatus = Types.TitleActivationStatus
export type TitleNewsItem = Types.TitleNewsItem
export type TreatmentAssignment = Types.TreatmentAssignment
export type TwitchPlayFabIdPair = Types.TwitchPlayFabIdPair
export type UnlinkNintendoServiceAccountRequest = Types.UnlinkNintendoServiceAccountRequest
export type UnlinkNintendoSwitchDeviceIdRequest = Types.UnlinkNintendoSwitchDeviceIdRequest
export type UnlinkNintendoSwitchDeviceIdResult = Types.UnlinkNintendoSwitchDeviceIdResult
export type UnlinkPSNAccountRequest = Types.UnlinkPSNAccountRequest
export type UnlinkPSNAccountResult = Types.UnlinkPSNAccountResult
export type UnlinkServerCustomIdRequest = Types.UnlinkServerCustomIdRequest
export type UnlinkServerCustomIdResult = Types.UnlinkServerCustomIdResult
export type UnlinkXboxAccountRequest = Types.UnlinkXboxAccountRequest
export type UnlinkXboxAccountResult = Types.UnlinkXboxAccountResult
export type UnlockContainerInstanceRequest = Types.UnlockContainerInstanceRequest
export type UnlockContainerItemRequest = Types.UnlockContainerItemRequest
export type UnlockContainerItemResult = Types.UnlockContainerItemResult
export type UpdateAvatarUrlRequest = Types.UpdateAvatarUrlRequest
export type UpdateBanRequest = Types.UpdateBanRequest
export type UpdateBansRequest = Types.UpdateBansRequest
export type UpdateBansResult = Types.UpdateBansResult
export type UpdateCharacterDataRequest = Types.UpdateCharacterDataRequest
export type UpdateCharacterDataResult = Types.UpdateCharacterDataResult
export type UpdateCharacterStatisticsRequest = Types.UpdateCharacterStatisticsRequest
export type UpdateCharacterStatisticsResult = Types.UpdateCharacterStatisticsResult
export type UpdatePlayerStatisticsRequest = Types.UpdatePlayerStatisticsRequest
export type UpdatePlayerStatisticsResult = Types.UpdatePlayerStatisticsResult
export type UpdateSharedGroupDataRequest = Types.UpdateSharedGroupDataRequest
export type UpdateSharedGroupDataResult = Types.UpdateSharedGroupDataResult
export type UpdateUserDataRequest = Types.UpdateUserDataRequest
export type UpdateUserDataResult = Types.UpdateUserDataResult
export type UpdateUserInternalDataRequest = Types.UpdateUserInternalDataRequest
export type UpdateUserInventoryItemDataRequest = Types.UpdateUserInventoryItemDataRequest
export type UserAccountInfo = Types.UserAccountInfo
export type UserAndroidDeviceInfo = Types.UserAndroidDeviceInfo
export type UserAppleIdInfo = Types.UserAppleIdInfo
export type UserCustomIdInfo = Types.UserCustomIdInfo
export type UserDataPermission = Types.UserDataPermission
export type UserDataRecord = Types.UserDataRecord
export type UserFacebookInfo = Types.UserFacebookInfo
export type UserFacebookInstantGamesIdInfo = Types.UserFacebookInstantGamesIdInfo
export type UserGameCenterInfo = Types.UserGameCenterInfo
export type UserGoogleInfo = Types.UserGoogleInfo
export type UserGooglePlayGamesInfo = Types.UserGooglePlayGamesInfo
export type UserIosDeviceInfo = Types.UserIosDeviceInfo
export type UserKongregateInfo = Types.UserKongregateInfo
export type UserNintendoSwitchAccountIdInfo = Types.UserNintendoSwitchAccountIdInfo
export type UserNintendoSwitchDeviceIdInfo = Types.UserNintendoSwitchDeviceIdInfo
export type UserOpenIdInfo = Types.UserOpenIdInfo
export type UserOrigination = Types.UserOrigination
export type UserPrivateAccountInfo = Types.UserPrivateAccountInfo
export type UserPsnInfo = Types.UserPsnInfo
export type UserSettings = Types.UserSettings
export type UserSteamInfo = Types.UserSteamInfo
export type UserTitleInfo = Types.UserTitleInfo
export type UserTwitchInfo = Types.UserTwitchInfo
export type UserXboxInfo = Types.UserXboxInfo
export type ValueToDateModel = Types.ValueToDateModel
export type Variable = Types.Variable
export type VirtualCurrencyRechargeTime = Types.VirtualCurrencyRechargeTime
export type WriteEventResponse = Types.WriteEventResponse
export type WriteServerCharacterEventRequest = Types.WriteServerCharacterEventRequest
export type WriteServerPlayerEventRequest = Types.WriteServerPlayerEventRequest
export type WriteTitleEventRequest = Types.WriteTitleEventRequest
export type XboxLiveAccountPlayFabIdPair = Types.XboxLiveAccountPlayFabIdPair

return ServerApi

