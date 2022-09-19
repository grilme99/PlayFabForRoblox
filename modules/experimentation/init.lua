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
	code: number, --- Numerical HTTP code
	error: string?, --- Playfab error code
	errorCode: number, --- Numerical PlayFab error code
	errorDetails: {[any]: any}?, --- Detailed description of individual issues with the request object
	errorMessage: string?, --- Description for the PlayFab errorCode
	status: string?, --- String HTTP code
}

--- Given a title entity token and exclusion group details, will create a new exclusion 
--- group for the title. 
export type CreateExclusionGroupRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	Description: string?, --- Description of the exclusion group.
	Name: string, --- Friendly name of the exclusion group.
}

export type CreateExclusionGroupResult = {
	ExclusionGroupId: string?, --- Identifier of the exclusion group.
}

--- Given a title entity token and experiment details, will create a new experiment 
--- for the title. 
export type CreateExperimentRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	Description: string?, --- Description of the experiment.
	EndDate: string?, --- When experiment should end.
	ExclusionGroupId: string?, --- Id of the exclusion group.
	ExclusionGroupTrafficAllocation: number?, --- Percentage of exclusion group traffic that will see this experiment.
	ExperimentType: string?, --- Type of experiment.
	Name: string, --- Friendly name of the experiment.
	SegmentId: string?, --- Id of the segment to which this experiment applies. Defaults to the 'All Players' segment.
	StartDate: string, --- When experiment should start.
	TitlePlayerAccountTestIds: {any}?, --- List of title player account IDs that automatically receive treatments in the experiment, but are not included when calculating experiment metrics.
	Variants: {Variant}, --- List of variants for the experiment.
}

export type CreateExperimentResult = {
	ExperimentId: string?, --- The ID of the new experiment.
}

--- Given an entity token and an exclusion group ID this API deletes the exclusion 
--- group. 
export type DeleteExclusionGroupRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	ExclusionGroupId: string, --- The ID of the exclusion group to delete.
}

--- Given an entity token and an experiment ID this API deletes the experiment. 
--- A running experiment must be stopped before it can be deleted. 
export type DeleteExperimentRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	ExperimentId: string, --- The ID of the experiment to delete.
}

export type EmptyResponse = {
}

--- Combined entity type and ID structure which uniquely identifies a single entity. 
export type EntityKey = {
	Id: string, --- Unique ID of the entity.
	Type: string?, --- Entity type. See https://docs.microsoft.com/gaming/playfab/features/data/entities/available-built-in-entity-types
}

export type ExclusionGroupTrafficAllocation = {
	ExperimentId: string?, --- Id of the experiment.
	TrafficAllocation: number, --- Percentage of exclusion group traffic that will see this experiment.
}

export type Experiment = {
	Description: string?, --- Description of the experiment.
	EndDate: string?, --- When experiment should end/was ended.
	ExclusionGroupId: string?, --- Id of the exclusion group for this experiment.
	ExclusionGroupTrafficAllocation: number?, --- Percentage of exclusion group traffic that will see this experiment.
	ExperimentType: string?, --- Type of experiment.
	Id: string?, --- Id of the experiment.
	Name: string?, --- Friendly name of the experiment.
	SegmentId: string?, --- Id of the segment to which this experiment applies. Defaults to the 'All Players' segment.
	StartDate: string, --- When experiment should start/was started.
	State: string?, --- State experiment is currently in.
	TitlePlayerAccountTestIds: {any}?, --- List of title player account IDs that automatically receive treatments in the experiment, but are not included when calculating experiment metrics.
	Variants: {Variant}?, --- List of variants for the experiment.
}

export type ExperimentExclusionGroup = {
	Description: string?, --- Description of the exclusion group.
	ExclusionGroupId: string?, --- Id of the exclusion group.
	Name: string?, --- Friendly name of the exclusion group.
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
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	ExclusionGroupId: string, --- The ID of the exclusion group.
}

export type GetExclusionGroupTrafficResult = {
	TrafficAllocations: {ExclusionGroupTrafficAllocation}?, --- List of traffic allocations for the exclusion group.
}

--- Given a title entity token will return the list of all exclusion groups for 
--- a title. 
export type GetExclusionGroupsRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
}

export type GetExclusionGroupsResult = {
	ExclusionGroups: {ExperimentExclusionGroup}?, --- List of exclusion groups for the title.
}

--- Given a title entity token will return the list of all experiments for a title, 
--- including scheduled, started, stopped or completed experiments. 
export type GetExperimentsRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
}

export type GetExperimentsResult = {
	Experiments: {Experiment}?, --- List of experiments for the title.
}

--- Given a title entity token and experiment details, will return the latest available 
--- scorecard. 
export type GetLatestScorecardRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	ExperimentId: string?, --- The ID of the experiment.
}

export type GetLatestScorecardResult = {
	Scorecard: Scorecard?, --- Scorecard for the experiment of the title.
}

--- Given a title player or a title entity token, returns the treatment variants 
--- and variables assigned to the entity across all running experiments 
export type GetTreatmentAssignmentRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	Entity: EntityKey?, --- The optional entity to perform this action on. Defaults to the currently logged in entity.
}

export type GetTreatmentAssignmentResult = {
	TreatmentAssignment: TreatmentAssignment?, --- Treatment assignment for the entity.
}

export type MetricData = {
	ConfidenceIntervalEnd: number, --- The upper bound of the confidence interval for the relative delta (Delta.RelativeValue).
	ConfidenceIntervalStart: number, --- The lower bound of the confidence interval for the relative delta (Delta.RelativeValue).
	DeltaAbsoluteChange: number, --- The absolute delta between TreatmentStats.Average and ControlStats.Average.
	DeltaRelativeChange: number, --- The relative delta ratio between TreatmentStats.Average and ControlStats.Average.
	InternalName: string?, --- The machine name of the metric.
	Movement: string?, --- Indicates if a movement was detected on that metric.
	Name: string?, --- The readable name of the metric.
	PMove: number, --- The expectation that a movement is real
	PValue: number, --- The p-value resulting from the statistical test run for this metric
	PValueThreshold: number, --- The threshold for observing sample ratio mismatch.
	StatSigLevel: string?, --- Indicates if the movement is statistically significant.
	StdDev: number, --- Observed standard deviation value of the metric.
	Value: number, --- Observed average value of the metric.
}

export type Scorecard = {
	DateGenerated: string?, --- Represents the date the scorecard was generated.
	Duration: string?, --- Represents the duration of scorecard analysis.
	EventsProcessed: number, --- Represents the number of events processed for the generation of this scorecard
	ExperimentId: string?, --- Id of the experiment.
	ExperimentName: string?, --- Friendly name of the experiment.
	LatestJobStatus: string?, --- Represents the latest compute job status.
	SampleRatioMismatch: boolean, --- Represents the presence of a sample ratio mismatch in the scorecard data.
	ScorecardDataRows: {ScorecardDataRow}?, --- Scorecard containing list of analysis.
}

export type ScorecardDataRow = {
	IsControl: boolean, --- Represents whether the variant is control or not.
	MetricDataRows: MetricData?, --- Data of the analysis with the internal name of the metric as the key and an object of metric data as value.
	PlayerCount: number, --- Represents the player count in the variant.
	VariantName: string?, --- Name of the variant of analysis.
}

--- Given a title entity token and an experiment ID, this API starts the experiment. 
export type StartExperimentRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	ExperimentId: string, --- The ID of the experiment to start.
}

--- Given a title entity token and an experiment ID, this API stops the experiment 
--- if it is running. 
export type StopExperimentRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	ExperimentId: string, --- The ID of the experiment to stop.
}

export type TreatmentAssignment = {
	Variables: {Variable}?, --- List of the experiment variables.
	Variants: {any}?, --- List of the experiment variants.
}

--- Given an entity token and exclusion group details this API updates the exclusion 
--- group. 
export type UpdateExclusionGroupRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	Description: string?, --- Description of the exclusion group.
	ExclusionGroupId: string, --- The ID of the exclusion group to update.
	Name: string, --- Friendly name of the exclusion group.
}

--- Given a title entity token and experiment details, this API updates the experiment. 
--- If an experiment is already running, only the description and duration properties 
--- can be updated. 
export type UpdateExperimentRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	Description: string?, --- Description of the experiment.
	EndDate: string?, --- When experiment should end.
	ExclusionGroupId: string?, --- Id of the exclusion group.
	ExclusionGroupTrafficAllocation: number?, --- Percentage of exclusion group traffic that will see this experiment.
	ExperimentType: string?, --- Type of experiment.
	Id: string, --- Id of the experiment.
	Name: string, --- Friendly name of the experiment.
	SegmentId: string?, --- Id of the segment to which this experiment applies. Defaults to the 'All Players' segment.
	StartDate: string, --- When experiment should start.
	TitlePlayerAccountTestIds: {any}?, --- List of title player account IDs that automatically receive treatments in the experiment, but are not included when calculating experiment metrics.
	Variants: {Variant}, --- List of variants for the experiment.
}

export type Variable = {
	Name: string, --- Name of the variable.
	Value: string?, --- Value of the variable.
}

export type Variant = {
	Description: string?, --- Description of the variant.
	Id: string?, --- Id of the variant.
	IsControl: boolean, --- Specifies if variant is control for experiment.
	Name: string, --- Name of the variant.
	TitleDataOverrideLabel: string?, --- Id of the TitleDataOverride to use with this variant.
	TrafficPercentage: number, --- Percentage of target audience traffic that will see this variant.
	Variables: {Variable}?, --- Variables returned by this variant.
}


--- https://docs.microsoft.com/rest/api/playfab/experimentation/experimentation/createexclusiongroup
function ExperimentationApi.CreateExclusionGroupAsync(
	entityToken: string, 
	request: CreateExclusionGroupRequest
): CreateExclusionGroupResult | ApiErrorWrapper
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
): CreateExperimentResult | ApiErrorWrapper
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
): EmptyResponse | ApiErrorWrapper
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
): EmptyResponse | ApiErrorWrapper
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
): GetExclusionGroupTrafficResult | ApiErrorWrapper
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
): GetExclusionGroupsResult | ApiErrorWrapper
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
): GetExperimentsResult | ApiErrorWrapper
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
): GetLatestScorecardResult | ApiErrorWrapper
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
): GetTreatmentAssignmentResult | ApiErrorWrapper
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
): EmptyResponse | ApiErrorWrapper
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
): EmptyResponse | ApiErrorWrapper
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
): EmptyResponse | ApiErrorWrapper
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
): EmptyResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Experimentation/UpdateExperiment",
		request,
		"X-EntityToken",
		entityToken
	)
end

return ExperimentationApi

