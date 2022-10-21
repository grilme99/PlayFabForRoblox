--!strict
--[=[
	# ExperimentationApi

	APIs for managing experiments. 

	API Version: 1.221007.0
]=]

local PlayFabInternal = require(script.Parent.PlayFabInternal)
local Types = require(script.Parent.Types)
local ExperimentationApi = require(script.Apis)

function ExperimentationApi.SetSettings(settings: PlayFabInternal.ISettings)
	PlayFabInternal.SetSettings(settings)
end

export type AnalysisTaskState = Types.AnalysisTaskState
export type ApiErrorWrapper = Types.ApiErrorWrapper
export type CreateExclusionGroupRequest = Types.CreateExclusionGroupRequest
export type CreateExclusionGroupResult = Types.CreateExclusionGroupResult
export type CreateExperimentRequest = Types.CreateExperimentRequest
export type CreateExperimentResult = Types.CreateExperimentResult
export type DeleteExclusionGroupRequest = Types.DeleteExclusionGroupRequest
export type DeleteExperimentRequest = Types.DeleteExperimentRequest
export type EmptyResponse = Types.EmptyResponse
export type EntityKey = Types.EntityKey
export type ExclusionGroupTrafficAllocation = Types.ExclusionGroupTrafficAllocation
export type Experiment = Types.Experiment
export type ExperimentExclusionGroup = Types.ExperimentExclusionGroup
export type ExperimentState = Types.ExperimentState
export type ExperimentType = Types.ExperimentType
export type GetExclusionGroupTrafficRequest = Types.GetExclusionGroupTrafficRequest
export type GetExclusionGroupTrafficResult = Types.GetExclusionGroupTrafficResult
export type GetExclusionGroupsRequest = Types.GetExclusionGroupsRequest
export type GetExclusionGroupsResult = Types.GetExclusionGroupsResult
export type GetExperimentsRequest = Types.GetExperimentsRequest
export type GetExperimentsResult = Types.GetExperimentsResult
export type GetLatestScorecardRequest = Types.GetLatestScorecardRequest
export type GetLatestScorecardResult = Types.GetLatestScorecardResult
export type GetTreatmentAssignmentRequest = Types.GetTreatmentAssignmentRequest
export type GetTreatmentAssignmentResult = Types.GetTreatmentAssignmentResult
export type MetricData = Types.MetricData
export type Scorecard = Types.Scorecard
export type ScorecardDataRow = Types.ScorecardDataRow
export type StartExperimentRequest = Types.StartExperimentRequest
export type StopExperimentRequest = Types.StopExperimentRequest
export type TreatmentAssignment = Types.TreatmentAssignment
export type UpdateExclusionGroupRequest = Types.UpdateExclusionGroupRequest
export type UpdateExperimentRequest = Types.UpdateExperimentRequest
export type Variable = Types.Variable
export type Variant = Types.Variant

return ExperimentationApi

