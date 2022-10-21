--!strict
--[=[
	# ProfilesApi

	All PlayFab entities have profiles, which hold top-level properties about the 
	entity. These APIs give you the tools needed to manage entity profiles. The 
	Master Player APIs allow you to perform operations on a master player account. 

	API Version: 1.221007.2
]=]

local PlayFabInternal = require(script.Parent.PlayFabInternal)
local Types = require(script.Types)

local ProfilesApi = require(script.Apis)

function ProfilesApi.SetSettings(settings: PlayFabInternal.ISettings)
	PlayFabInternal.SetSettings(settings)
end

export type ApiErrorWrapper = Types.ApiErrorWrapper
export type EffectType = Types.EffectType
export type EntityDataObject = Types.EntityDataObject
export type EntityKey = Types.EntityKey
export type EntityLineage = Types.EntityLineage
export type EntityPermissionStatement = Types.EntityPermissionStatement
export type EntityProfileBody = Types.EntityProfileBody
export type EntityProfileFileMetadata = Types.EntityProfileFileMetadata
export type EntityStatisticChildValue = Types.EntityStatisticChildValue
export type EntityStatisticValue = Types.EntityStatisticValue
export type GetEntityProfileRequest = Types.GetEntityProfileRequest
export type GetEntityProfileResponse = Types.GetEntityProfileResponse
export type GetEntityProfilesRequest = Types.GetEntityProfilesRequest
export type GetEntityProfilesResponse = Types.GetEntityProfilesResponse
export type GetGlobalPolicyRequest = Types.GetGlobalPolicyRequest
export type GetGlobalPolicyResponse = Types.GetGlobalPolicyResponse
export type GetTitlePlayersFromMasterPlayerAccountIdsRequest = Types.GetTitlePlayersFromMasterPlayerAccountIdsRequest
export type GetTitlePlayersFromMasterPlayerAccountIdsResponse = Types.GetTitlePlayersFromMasterPlayerAccountIdsResponse
export type OperationTypes = Types.OperationTypes
export type SetEntityProfilePolicyRequest = Types.SetEntityProfilePolicyRequest
export type SetEntityProfilePolicyResponse = Types.SetEntityProfilePolicyResponse
export type SetGlobalPolicyRequest = Types.SetGlobalPolicyRequest
export type SetGlobalPolicyResponse = Types.SetGlobalPolicyResponse
export type SetProfileLanguageRequest = Types.SetProfileLanguageRequest
export type SetProfileLanguageResponse = Types.SetProfileLanguageResponse

return ProfilesApi

