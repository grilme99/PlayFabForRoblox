--!strict
--[=[
	# CloudScriptApi

	API methods for executing CloudScript using an Entity Profile. 

	API Version: 1.221008.0
]=]

local PlayFabInternal = require(script.Parent.PlayFabInternal)
local Types = require(script.Types)

local CloudScriptApi = require(script.Apis)

function CloudScriptApi.SetSettings(settings: PlayFabInternal.ISettings)
	PlayFabInternal.SetSettings(settings)
end

export type AdCampaignAttributionModel = Types.AdCampaignAttributionModel
export type ApiErrorWrapper = Types.ApiErrorWrapper
export type CloudScriptRevisionOption = Types.CloudScriptRevisionOption
export type ContactEmailInfoModel = Types.ContactEmailInfoModel
export type ContinentCode = Types.ContinentCode
export type CountryCode = Types.CountryCode
export type EmailVerificationStatus = Types.EmailVerificationStatus
export type EmptyResult = Types.EmptyResult
export type EntityKey = Types.EntityKey
export type ExecuteCloudScriptResult = Types.ExecuteCloudScriptResult
export type ExecuteEntityCloudScriptRequest = Types.ExecuteEntityCloudScriptRequest
export type ExecuteFunctionRequest = Types.ExecuteFunctionRequest
export type ExecuteFunctionResult = Types.ExecuteFunctionResult
export type FunctionExecutionError = Types.FunctionExecutionError
export type FunctionModel = Types.FunctionModel
export type GetFunctionRequest = Types.GetFunctionRequest
export type GetFunctionResult = Types.GetFunctionResult
export type HttpFunctionModel = Types.HttpFunctionModel
export type LinkedPlatformAccountModel = Types.LinkedPlatformAccountModel
export type ListFunctionsRequest = Types.ListFunctionsRequest
export type ListFunctionsResult = Types.ListFunctionsResult
export type ListHttpFunctionsResult = Types.ListHttpFunctionsResult
export type ListQueuedFunctionsResult = Types.ListQueuedFunctionsResult
export type LocationModel = Types.LocationModel
export type LogStatement = Types.LogStatement
export type LoginIdentityProvider = Types.LoginIdentityProvider
export type MembershipModel = Types.MembershipModel
export type NameIdentifier = Types.NameIdentifier
export type PlayStreamEventEnvelopeModel = Types.PlayStreamEventEnvelopeModel
export type PlayerProfileModel = Types.PlayerProfileModel
export type PostFunctionResultForEntityTriggeredActionRequest = Types.PostFunctionResultForEntityTriggeredActionRequest
export type PostFunctionResultForFunctionExecutionRequest = Types.PostFunctionResultForFunctionExecutionRequest
export type PostFunctionResultForPlayerTriggeredActionRequest = Types.PostFunctionResultForPlayerTriggeredActionRequest
export type PostFunctionResultForScheduledTaskRequest = Types.PostFunctionResultForScheduledTaskRequest
export type PushNotificationPlatform = Types.PushNotificationPlatform
export type PushNotificationRegistrationModel = Types.PushNotificationRegistrationModel
export type QueuedFunctionModel = Types.QueuedFunctionModel
export type RegisterHttpFunctionRequest = Types.RegisterHttpFunctionRequest
export type RegisterQueuedFunctionRequest = Types.RegisterQueuedFunctionRequest
export type ScriptExecutionError = Types.ScriptExecutionError
export type StatisticModel = Types.StatisticModel
export type SubscriptionModel = Types.SubscriptionModel
export type SubscriptionProviderStatus = Types.SubscriptionProviderStatus
export type TagModel = Types.TagModel
export type TriggerType = Types.TriggerType
export type UnregisterFunctionRequest = Types.UnregisterFunctionRequest
export type ValueToDateModel = Types.ValueToDateModel

return CloudScriptApi

