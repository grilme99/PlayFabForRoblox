--!strict
--[=[
	# ExperimentationApi

	APIs for managing experiments. 
]=]

local PlayFabInternal = require(script.Parent.PlayFabInternal)

local ExperimentationApi = {}

function ExperimentationApi.SetSettings(settings: PlayFabInternal.ISettings)
	PlayFabInternal.SetSettings(settings)
end

export type AnalysisTaskState = 
	"Waiting"
	| "ReadyForSubmission"
	| "SubmittingToPipeline"
	| "Running"
	| "Completed"
	| "Failed"
	| "Canceled"

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

--- Given a title entity token and exclusion group details, will create a new exclusion 
--- group for the title. 
export type CreateExclusionGroupRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- Description of the exclusion group. 
	Description: string?,
	--- Friendly name of the exclusion group. 
	Name: string,
}

export type CreateExclusionGroupResult = {
	--- Identifier of the exclusion group. 
	ExclusionGroupId: string?,
}

--- Given a title entity token and experiment details, will create a new experiment 
--- for the title. 
export type CreateExperimentRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- Description of the experiment. 
	Description: string?,
	--- When experiment should end. 
	EndDate: string?,
	--- Id of the exclusion group. 
	ExclusionGroupId: string?,
	--- Percentage of exclusion group traffic that will see this experiment. 
	ExclusionGroupTrafficAllocation: number?,
	--- Type of experiment. 
	ExperimentType: string?,
	--- Friendly name of the experiment. 
	Name: string,
	--- Id of the segment to which this experiment applies. Defaults to the 'All Players' 
	--- segment. 
	SegmentId: string?,
	--- When experiment should start. 
	StartDate: string,
	--- List of title player account IDs that automatically receive treatments in the 
	--- experiment, but are not included when calculating experiment metrics. 
	TitlePlayerAccountTestIds: {any}?,
	--- List of variants for the experiment. 
	Variants: {Variant},
}

export type CreateExperimentResult = {
	--- The ID of the new experiment. 
	ExperimentId: string?,
}

--- Given an entity token and an exclusion group ID this API deletes the exclusion 
--- group. 
export type DeleteExclusionGroupRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The ID of the exclusion group to delete. 
	ExclusionGroupId: string,
}

--- Given an entity token and an experiment ID this API deletes the experiment. 
--- A running experiment must be stopped before it can be deleted. 
export type DeleteExperimentRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The ID of the experiment to delete. 
	ExperimentId: string,
}

export type EmptyResponse = {
}

--- Combined entity type and ID structure which uniquely identifies a single entity. 
export type EntityKey = {
	--- Unique ID of the entity. 
	Id: string,
	--- Entity type. See https://docs.microsoft.com/gaming/playfab/features/data/entities/available-built-in-entity-types 
	Type: string?,
}

export type ExclusionGroupTrafficAllocation = {
	--- Id of the experiment. 
	ExperimentId: string?,
	--- Percentage of exclusion group traffic that will see this experiment. 
	TrafficAllocation: number,
}

export type Experiment = {
	--- Description of the experiment. 
	Description: string?,
	--- When experiment should end/was ended. 
	EndDate: string?,
	--- Id of the exclusion group for this experiment. 
	ExclusionGroupId: string?,
	--- Percentage of exclusion group traffic that will see this experiment. 
	ExclusionGroupTrafficAllocation: number?,
	--- Type of experiment. 
	ExperimentType: string?,
	--- Id of the experiment. 
	Id: string?,
	--- Friendly name of the experiment. 
	Name: string?,
	--- Id of the segment to which this experiment applies. Defaults to the 'All Players' 
	--- segment. 
	SegmentId: string?,
	--- When experiment should start/was started. 
	StartDate: string,
	--- State experiment is currently in. 
	State: string?,
	--- List of title player account IDs that automatically receive treatments in the 
	--- experiment, but are not included when calculating experiment metrics. 
	TitlePlayerAccountTestIds: {any}?,
	--- List of variants for the experiment. 
	Variants: {Variant}?,
}

export type ExperimentExclusionGroup = {
	--- Description of the exclusion group. 
	Description: string?,
	--- Id of the exclusion group. 
	ExclusionGroupId: string?,
	--- Friendly name of the exclusion group. 
	Name: string?,
}

export type ExperimentState = 
	"New"
	| "Started"
	| "Stopped"
	| "Deleted"

export type ExperimentType = 
	"Active"
	| "Snapshot"

--- Given a title entity token and an exclusion group ID, will return the list of 
--- traffic allocations for the exclusion group. 
export type GetExclusionGroupTrafficRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The ID of the exclusion group. 
	ExclusionGroupId: string,
}

export type GetExclusionGroupTrafficResult = {
	--- List of traffic allocations for the exclusion group. 
	TrafficAllocations: {ExclusionGroupTrafficAllocation}?,
}

--- Given a title entity token will return the list of all exclusion groups for 
--- a title. 
export type GetExclusionGroupsRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
}

export type GetExclusionGroupsResult = {
	--- List of exclusion groups for the title. 
	ExclusionGroups: {ExperimentExclusionGroup}?,
}

--- Given a title entity token will return the list of all experiments for a title, 
--- including scheduled, started, stopped or completed experiments. 
export type GetExperimentsRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
}

export type GetExperimentsResult = {
	--- List of experiments for the title. 
	Experiments: {Experiment}?,
}

--- Given a title entity token and experiment details, will return the latest available 
--- scorecard. 
export type GetLatestScorecardRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The ID of the experiment. 
	ExperimentId: string?,
}

export type GetLatestScorecardResult = {
	--- Scorecard for the experiment of the title. 
	Scorecard: Scorecard?,
}

--- Given a title player or a title entity token, returns the treatment variants 
--- and variables assigned to the entity across all running experiments 
export type GetTreatmentAssignmentRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The optional entity to perform this action on. Defaults to the currently logged 
	--- in entity. 
	Entity: EntityKey?,
}

export type GetTreatmentAssignmentResult = {
	--- Treatment assignment for the entity. 
	TreatmentAssignment: TreatmentAssignment?,
}

export type MetricData = {
	--- The upper bound of the confidence interval for the relative delta (Delta.RelativeValue). 
	ConfidenceIntervalEnd: number,
	--- The lower bound of the confidence interval for the relative delta (Delta.RelativeValue). 
	ConfidenceIntervalStart: number,
	--- The absolute delta between TreatmentStats.Average and ControlStats.Average. 
	DeltaAbsoluteChange: number,
	--- The relative delta ratio between TreatmentStats.Average and ControlStats.Average. 
	DeltaRelativeChange: number,
	--- The machine name of the metric. 
	InternalName: string?,
	--- Indicates if a movement was detected on that metric. 
	Movement: string?,
	--- The readable name of the metric. 
	Name: string?,
	--- The expectation that a movement is real 
	PMove: number,
	--- The p-value resulting from the statistical test run for this metric 
	PValue: number,
	--- The threshold for observing sample ratio mismatch. 
	PValueThreshold: number,
	--- Indicates if the movement is statistically significant. 
	StatSigLevel: string?,
	--- Observed standard deviation value of the metric. 
	StdDev: number,
	--- Observed average value of the metric. 
	Value: number,
}

export type Scorecard = {
	--- Represents the date the scorecard was generated. 
	DateGenerated: string?,
	--- Represents the duration of scorecard analysis. 
	Duration: string?,
	--- Represents the number of events processed for the generation of this scorecard 
	EventsProcessed: number,
	--- Id of the experiment. 
	ExperimentId: string?,
	--- Friendly name of the experiment. 
	ExperimentName: string?,
	--- Represents the latest compute job status. 
	LatestJobStatus: string?,
	--- Represents the presence of a sample ratio mismatch in the scorecard data. 
	SampleRatioMismatch: boolean,
	--- Scorecard containing list of analysis. 
	ScorecardDataRows: {ScorecardDataRow}?,
}

export type ScorecardDataRow = {
	--- Represents whether the variant is control or not. 
	IsControl: boolean,
	--- Data of the analysis with the internal name of the metric as the key and an 
	--- object of metric data as value. 
	MetricDataRows: MetricData?,
	--- Represents the player count in the variant. 
	PlayerCount: number,
	--- Name of the variant of analysis. 
	VariantName: string?,
}

--- Given a title entity token and an experiment ID, this API starts the experiment. 
export type StartExperimentRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The ID of the experiment to start. 
	ExperimentId: string,
}

--- Given a title entity token and an experiment ID, this API stops the experiment 
--- if it is running. 
export type StopExperimentRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The ID of the experiment to stop. 
	ExperimentId: string,
}

export type TreatmentAssignment = {
	--- List of the experiment variables. 
	Variables: {Variable}?,
	--- List of the experiment variants. 
	Variants: {any}?,
}

--- Given an entity token and exclusion group details this API updates the exclusion 
--- group. 
export type UpdateExclusionGroupRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- Description of the exclusion group. 
	Description: string?,
	--- The ID of the exclusion group to update. 
	ExclusionGroupId: string,
	--- Friendly name of the exclusion group. 
	Name: string,
}

--- Given a title entity token and experiment details, this API updates the experiment. 
--- If an experiment is already running, only the description and duration properties 
--- can be updated. 
export type UpdateExperimentRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- Description of the experiment. 
	Description: string?,
	--- When experiment should end. 
	EndDate: string?,
	--- Id of the exclusion group. 
	ExclusionGroupId: string?,
	--- Percentage of exclusion group traffic that will see this experiment. 
	ExclusionGroupTrafficAllocation: number?,
	--- Type of experiment. 
	ExperimentType: string?,
	--- Id of the experiment. 
	Id: string,
	--- Friendly name of the experiment. 
	Name: string,
	--- Id of the segment to which this experiment applies. Defaults to the 'All Players' 
	--- segment. 
	SegmentId: string?,
	--- When experiment should start. 
	StartDate: string,
	--- List of title player account IDs that automatically receive treatments in the 
	--- experiment, but are not included when calculating experiment metrics. 
	TitlePlayerAccountTestIds: {any}?,
	--- List of variants for the experiment. 
	Variants: {Variant},
}

export type Variable = {
	--- Name of the variable. 
	Name: string,
	--- Value of the variable. 
	Value: string?,
}

export type Variant = {
	--- Description of the variant. 
	Description: string?,
	--- Id of the variant. 
	Id: string?,
	--- Specifies if variant is control for experiment. 
	IsControl: boolean,
	--- Name of the variant. 
	Name: string,
	--- Id of the TitleDataOverride to use with this variant. 
	TitleDataOverrideLabel: string?,
	--- Percentage of target audience traffic that will see this variant. 
	TrafficPercentage: number,
	--- Variables returned by this variant. 
	Variables: {Variable}?,
}


--- https://docs.microsoft.com/rest/api/playfab/experimentation/experimentation/createexclusiongroup
function ExperimentationApi.CreateExclusionGroupAsync(
	entityToken: string, 
	request: CreateExclusionGroupRequest
): CreateExclusionGroupResult
	return PlayFabInternal.MakeApiCall(
		"/Experimentation/CreateExclusionGroup",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/experimentation/experimentation/createexperiment
function ExperimentationApi.CreateExperimentAsync(
	entityToken: string, 
	request: CreateExperimentRequest
): CreateExperimentResult
	return PlayFabInternal.MakeApiCall(
		"/Experimentation/CreateExperiment",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/experimentation/experimentation/deleteexclusiongroup
function ExperimentationApi.DeleteExclusionGroupAsync(
	entityToken: string, 
	request: DeleteExclusionGroupRequest
): EmptyResponse
	return PlayFabInternal.MakeApiCall(
		"/Experimentation/DeleteExclusionGroup",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/experimentation/experimentation/deleteexperiment
function ExperimentationApi.DeleteExperimentAsync(
	entityToken: string, 
	request: DeleteExperimentRequest
): EmptyResponse
	return PlayFabInternal.MakeApiCall(
		"/Experimentation/DeleteExperiment",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/experimentation/experimentation/getexclusiongrouptraffic
function ExperimentationApi.GetExclusionGroupTrafficAsync(
	entityToken: string, 
	request: GetExclusionGroupTrafficRequest
): GetExclusionGroupTrafficResult
	return PlayFabInternal.MakeApiCall(
		"/Experimentation/GetExclusionGroupTraffic",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/experimentation/experimentation/getexclusiongroups
function ExperimentationApi.GetExclusionGroupsAsync(
	entityToken: string, 
	request: GetExclusionGroupsRequest
): GetExclusionGroupsResult
	return PlayFabInternal.MakeApiCall(
		"/Experimentation/GetExclusionGroups",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/experimentation/experimentation/getexperiments
function ExperimentationApi.GetExperimentsAsync(
	entityToken: string, 
	request: GetExperimentsRequest
): GetExperimentsResult
	return PlayFabInternal.MakeApiCall(
		"/Experimentation/GetExperiments",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/experimentation/experimentation/getlatestscorecard
function ExperimentationApi.GetLatestScorecardAsync(
	entityToken: string, 
	request: GetLatestScorecardRequest
): GetLatestScorecardResult
	return PlayFabInternal.MakeApiCall(
		"/Experimentation/GetLatestScorecard",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/experimentation/experimentation/gettreatmentassignment
function ExperimentationApi.GetTreatmentAssignmentAsync(
	entityToken: string, 
	request: GetTreatmentAssignmentRequest
): GetTreatmentAssignmentResult
	return PlayFabInternal.MakeApiCall(
		"/Experimentation/GetTreatmentAssignment",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/experimentation/experimentation/startexperiment
function ExperimentationApi.StartExperimentAsync(
	entityToken: string, 
	request: StartExperimentRequest
): EmptyResponse
	return PlayFabInternal.MakeApiCall(
		"/Experimentation/StartExperiment",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/experimentation/experimentation/stopexperiment
function ExperimentationApi.StopExperimentAsync(
	entityToken: string, 
	request: StopExperimentRequest
): EmptyResponse
	return PlayFabInternal.MakeApiCall(
		"/Experimentation/StopExperiment",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/experimentation/experimentation/updateexclusiongroup
function ExperimentationApi.UpdateExclusionGroupAsync(
	entityToken: string, 
	request: UpdateExclusionGroupRequest
): EmptyResponse
	return PlayFabInternal.MakeApiCall(
		"/Experimentation/UpdateExclusionGroup",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/experimentation/experimentation/updateexperiment
function ExperimentationApi.UpdateExperimentAsync(
	entityToken: string, 
	request: UpdateExperimentRequest
): EmptyResponse
	return PlayFabInternal.MakeApiCall(
		"/Experimentation/UpdateExperiment",
		request,
		"X-EntityToken",
		entityToken
	)
end

return ExperimentationApi

