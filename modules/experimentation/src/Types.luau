--[[
	This file was generated on 2025-08-03 at 00:04 UTC. Do not edit directly.

]]

export type ExperimentExclusionGroup = {
	--[[
		Id of the exclusion group.

	]]
	ExclusionGroupId: string?,
	--[[
		Description of the exclusion group.

	]]
	Description: string?,
	--[[
		Friendly name of the exclusion group.

	]]
	Name: string?,
}

--[[
	Given an entity token and an experiment ID this API deletes the experiment.
	A running experiment must be stopped before it can be deleted.

]]
export type DeleteExperimentRequest = {
	--[[
		The ID of the experiment to delete.

	]]
	ExperimentId: string,
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
	Given a title entity token will return the list of all experiments for a
	title, including scheduled, started, stopped or completed experiments.

]]
export type GetExperimentsRequest = {
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type Experiment = {
	--[[
		Description of the experiment.

	]]
	Description: string?,
	--[[
		Id of the segment to which this experiment applies. Defaults to the 'All
		Players' segment.

	]]
	SegmentId: string?,
	--[[
		Id of the experiment.

	]]
	Id: string?,
	--[[
		Id of the exclusion group for this experiment.

	]]
	ExclusionGroupId: string?,
	--[[
		When experiment should end/was ended.

	]]
	EndDate: string?,
	State: ExperimentState?,
	--[[
		Friendly name of the experiment.

	]]
	Name: string?,
	--[[
		List of variants for the experiment.

	]]
	Variants: { Variant }?,
	--[[
		Percentage of exclusion group traffic that will see this experiment.

	]]
	ExclusionGroupTrafficAllocation: number?,
	--[[
		When experiment should start/was started.

	]]
	StartDate: string,
	ExperimentType: ExperimentType?,
	--[[
		List of title player account IDs that automatically receive treatments in the
		experiment, but are not included when calculating experiment metrics.

	]]
	TitlePlayerAccountTestIds: { string }?,
}

export type CreateExclusionGroupResult = {
	--[[
		Identifier of the exclusion group.

	]]
	ExclusionGroupId: string?,
}

export type Variant = {
	--[[
		Name of the variant.

	]]
	Name: string,
	--[[
		Description of the variant.

	]]
	Description: string?,
	--[[
		Specifies if variant is control for experiment.

	]]
	IsControl: boolean,
	--[[
		Id of the variant.

	]]
	Id: string?,
	--[[
		Percentage of target audience traffic that will see this variant.

	]]
	TrafficPercentage: number,
	--[[
		Id of the TitleDataOverride to use with this variant.

	]]
	TitleDataOverrideLabel: string?,
	--[[
		Variables returned by this variant.

	]]
	Variables: { Variable }?,
}

--[[
	Given a title entity token and an exclusion group ID, will return the list
	of traffic allocations for the exclusion group.

]]
export type GetExclusionGroupTrafficRequest = {
	--[[
		The ID of the exclusion group.

	]]
	ExclusionGroupId: string,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type GetExperimentsResult = {
	--[[
		List of experiments for the title.

	]]
	Experiments: { Experiment }?,
}

export type GetExclusionGroupTrafficResult = {
	--[[
		List of traffic allocations for the exclusion group.

	]]
	TrafficAllocations: { ExclusionGroupTrafficAllocation }?,
}

export type ScorecardDataRow = {
	--[[
		Name of the variant of analysis.

	]]
	VariantName: string?,
	--[[
		Represents whether the variant is control or not.

	]]
	IsControl: boolean,
	--[[
		Represents the player count in the variant.

	]]
	PlayerCount: number,
	MetricDataRows: MetricData?,
}

--[[
	Given a title entity token and experiment details, will return the latest
	available scorecard.

]]
export type GetLatestScorecardRequest = {
	--[[
		The ID of the experiment.

	]]
	ExperimentId: string?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type ExperimentState = 
	| "New"
	| "Started"
	| "Stopped"
	| "Deleted"

export type Variable = {
	--[[
		Name of the variable.

	]]
	Name: string,
	--[[
		Value of the variable.

	]]
	Value: string?,
}

--[[
	Given an entity token and exclusion group details this API updates the
	exclusion group.

]]
export type UpdateExclusionGroupRequest = {
	--[[
		Friendly name of the exclusion group.

	]]
	Name: string,
	--[[
		Description of the exclusion group.

	]]
	Description: string?,
	--[[
		The ID of the exclusion group to update.

	]]
	ExclusionGroupId: string,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type GetLatestScorecardResult = {
	Scorecard: Scorecard?,
}

export type ExperimentType = 
	| "Active"
	| "Snapshot"

--[[
	Given a title entity token and an experiment ID, this API starts the
	experiment.

]]
export type StartExperimentRequest = {
	--[[
		The ID of the experiment to start.

	]]
	ExperimentId: string,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type EmptyResponse = {
	-- No properties defined in spec
	[string]: any
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

export type ExclusionGroupTrafficAllocation = {
	--[[
		Id of the experiment.

	]]
	ExperimentId: string?,
	--[[
		Percentage of exclusion group traffic that will see this experiment.

	]]
	TrafficAllocation: number,
}

--[[
	Given a title entity token and experiment details, will create a new
	experiment for the title.

]]
export type CreateExperimentRequest = {
	--[[
		Description of the experiment.

	]]
	Description: string?,
	--[[
		Id of the segment to which this experiment applies. Defaults to the 'All
		Players' segment.

	]]
	SegmentId: string?,
	--[[
		Id of the exclusion group.

	]]
	ExclusionGroupId: string?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		List of variants for the experiment.

	]]
	Variants: { Variant },
	--[[
		Friendly name of the experiment.

	]]
	Name: string,
	ExperimentType: ExperimentType?,
	--[[
		Percentage of exclusion group traffic that will see this experiment.

	]]
	ExclusionGroupTrafficAllocation: number?,
	--[[
		When experiment should start.

	]]
	StartDate: string,
	--[[
		When experiment should end.

	]]
	EndDate: string?,
	--[[
		List of title player account IDs that automatically receive treatments in the
		experiment, but are not included when calculating experiment metrics.

	]]
	TitlePlayerAccountTestIds: { string }?,
}

--[[
	Given a title entity token and an experiment ID, this API stops the
	experiment if it is running.

]]
export type StopExperimentRequest = {
	--[[
		The ID of the experiment to stop.

	]]
	ExperimentId: string,
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
	Given an entity token and an exclusion group ID this API deletes the
	exclusion group.

]]
export type DeleteExclusionGroupRequest = {
	--[[
		The ID of the exclusion group to delete.

	]]
	ExclusionGroupId: string,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type CreateExperimentResult = {
	--[[
		The ID of the new experiment.

	]]
	ExperimentId: string?,
}

export type GetExclusionGroupsResult = {
	--[[
		List of exclusion groups for the title.

	]]
	ExclusionGroups: { ExperimentExclusionGroup }?,
}

--[[
	Combined entity type and ID structure which uniquely identifies a single
	entity.

]]
export type EntityKey = {
	--[[
		Unique ID of the entity.

	]]
	Id: string,
	--[[
		Entity type. See
		https://docs.microsoft.com/gaming/playfab/features/data/entities/available-built-in-entity-types

	]]
	Type: string?,
}

export type Scorecard = {
	--[[
		Friendly name of the experiment.

	]]
	ExperimentName: string?,
	--[[
		Scorecard containing list of analysis.

	]]
	ScorecardDataRows: { ScorecardDataRow }?,
	--[[
		Id of the experiment.

	]]
	ExperimentId: string?,
	LatestJobStatus: AnalysisTaskState?,
	--[[
		Represents the presence of a sample ratio mismatch in the scorecard data.

	]]
	SampleRatioMismatch: boolean,
	--[[
		Represents the duration of scorecard analysis.

	]]
	Duration: string?,
	--[[
		Represents the date the scorecard was generated.

	]]
	DateGenerated: string?,
	--[[
		Represents the number of events processed for the generation of this scorecard

	]]
	EventsProcessed: number,
}

--[[
	Given a title entity token and exclusion group details, will create a new
	exclusion group for the title.

]]
export type CreateExclusionGroupRequest = {
	--[[
		Friendly name of the exclusion group.

	]]
	Name: string,
	--[[
		Description of the exclusion group.

	]]
	Description: string?,
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
	Given a title player or a title entity token, returns the treatment variants
	and variables assigned to the entity across all running experiments

]]
export type GetTreatmentAssignmentRequest = {
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type GetTreatmentAssignmentResult = {
	TreatmentAssignment: TreatmentAssignment?,
}

--[[
	Given a title entity token will return the list of all exclusion groups for
	a title.

]]
export type GetExclusionGroupsRequest = {
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type MetricData = {
	--[[
		The relative delta ratio between TreatmentStats.Average and
		ControlStats.Average.

	]]
	DeltaRelativeChange: number,
	--[[
		The lower bound of the confidence interval for the relative delta
		(Delta.RelativeValue).

	]]
	ConfidenceIntervalStart: number,
	--[[
		The machine name of the metric.

	]]
	InternalName: string?,
	--[[
		The upper bound of the confidence interval for the relative delta
		(Delta.RelativeValue).

	]]
	ConfidenceIntervalEnd: number,
	--[[
		The expectation that a movement is real

	]]
	PMove: number,
	--[[
		The absolute delta between TreatmentStats.Average and ControlStats.Average.

	]]
	DeltaAbsoluteChange: number,
	--[[
		The readable name of the metric.

	]]
	Name: string?,
	--[[
		Indicates if a movement was detected on that metric.

	]]
	Movement: string?,
	--[[
		The p-value resulting from the statistical test run for this metric

	]]
	PValue: number,
	--[[
		Observed average value of the metric.

	]]
	Value: number,
	--[[
		Observed standard deviation value of the metric.

	]]
	StdDev: number,
	--[[
		The threshold for observing sample ratio mismatch.

	]]
	PValueThreshold: number,
	--[[
		Indicates if the movement is statistically significant.

	]]
	StatSigLevel: string?,
}

--[[
	Given a title entity token and experiment details, this API updates the
	experiment. If an experiment is already running, only the description and
	duration properties can be updated.

]]
export type UpdateExperimentRequest = {
	--[[
		Description of the experiment.

	]]
	Description: string?,
	--[[
		Id of the segment to which this experiment applies. Defaults to the 'All
		Players' segment.

	]]
	SegmentId: string?,
	--[[
		Id of the experiment.

	]]
	Id: string,
	--[[
		Id of the exclusion group.

	]]
	ExclusionGroupId: string?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		List of variants for the experiment.

	]]
	Variants: { Variant },
	--[[
		Friendly name of the experiment.

	]]
	Name: string,
	ExperimentType: ExperimentType?,
	--[[
		Percentage of exclusion group traffic that will see this experiment.

	]]
	ExclusionGroupTrafficAllocation: number?,
	--[[
		When experiment should start.

	]]
	StartDate: string,
	--[[
		When experiment should end.

	]]
	EndDate: string?,
	--[[
		List of title player account IDs that automatically receive treatments in the
		experiment, but are not included when calculating experiment metrics.

	]]
	TitlePlayerAccountTestIds: { string }?,
}

export type TreatmentAssignment = {
	--[[
		List of the experiment variables.

	]]
	Variables: { Variable }?,
	--[[
		List of the experiment variants.

	]]
	Variants: { string }?,
}

export type AnalysisTaskState = 
	| "Waiting"
	| "ReadyForSubmission"
	| "SubmittingToPipeline"
	| "Running"
	| "Completed"
	| "Failed"
	| "Canceled"



return nil
