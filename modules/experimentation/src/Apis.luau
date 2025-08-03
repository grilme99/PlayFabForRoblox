--[[
	This file was generated on 2025-08-03 at 00:04 UTC. Do not edit directly.

]]

local Types = require(script.Parent.Types)

local Common = require(script.Parent.Parent.PlayFabCommon)
local makeApiCall = Common.makeApiCall
type Result<T, E> = Common.Result<T, E>

local Apis = {}

--[[
	Gets the treatment assignments for a player for every running experiment in
	the title.

	Given a title player or a title entity token, returns the treatment variants
	and variables assigned to the entity across all running experiments

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/experimentation/experimentation/gettreatmentassignment).

	### Errors
	- ExperimentationClientTimeout
	- ExperimentationTreatmentAssignmentDisabled
	- ExperimentationTreatmentAssignmentFailed
	- FeatureNotConfiguredForTitle
	- InvalidEntityType

]]
function Apis.GetTreatmentAssignment(request: Types.GetTreatmentAssignmentRequest, entityToken: string): Result<Types.GetTreatmentAssignmentResult, string>
	return makeApiCall(
		"/Experimentation/GetTreatmentAssignment",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Gets the details of all experiments for a title.

	Given a title entity token will return the list of all experiments for a
	title, including scheduled, started, stopped or completed experiments.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/experimentation/experimentation/getexperiments).

	### Errors
	- FeatureNotConfiguredForTitle

]]
function Apis.GetExperiments(request: Types.GetExperimentsRequest, entityToken: string): Result<Types.GetExperimentsResult, string>
	return makeApiCall(
		"/Experimentation/GetExperiments",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Gets the details of all exclusion groups for a title.

	Given a title entity token will return the list of all exclusion groups for
	a title.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/experimentation/experimentation/getexclusiongroups).

	### Errors
	- FeatureNotConfiguredForTitle

]]
function Apis.GetExclusionGroups(request: Types.GetExclusionGroupsRequest, entityToken: string): Result<Types.GetExclusionGroupsResult, string>
	return makeApiCall(
		"/Experimentation/GetExclusionGroups",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Creates a new experiment for a title.

	Given a title entity token and experiment details, will create a new
	experiment for the title.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/experimentation/experimentation/createexperiment).

	### Errors
	- ExperimentationExclusionGroupInsufficientCapacity
	- ExperimentationExclusionGroupNotFound
	- ExperimentationInvalidEndDate
	- ExperimentationInvalidStartDate
	- ExperimentationMaxDurationExceeded
	- FeatureNotConfiguredForTitle
	- SegmentNotFound

]]
function Apis.CreateExperiment(request: Types.CreateExperimentRequest, entityToken: string): Result<Types.CreateExperimentResult, string>
	return makeApiCall(
		"/Experimentation/CreateExperiment",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Gets the latest scorecard of the experiment for the title.

	Given a title entity token and experiment details, will return the latest
	available scorecard.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/experimentation/experimentation/getlatestscorecard).

	### Errors
	- ExperimentationExperimentNotFound
	- ExperimentationNoScorecard
	- FeatureNotConfiguredForTitle

]]
function Apis.GetLatestScorecard(request: Types.GetLatestScorecardRequest, entityToken: string): Result<Types.GetLatestScorecardResult, string>
	return makeApiCall(
		"/Experimentation/GetLatestScorecard",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Updates an existing experiment for a title.

	Given a title entity token and experiment details, this API updates the
	experiment. If an experiment is already running, only the description and
	duration properties can be updated.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/experimentation/experimentation/updateexperiment).

	### Errors
	- ExperimentationExclusionGroupInsufficientCapacity
	- ExperimentationExclusionGroupNotFound
	- ExperimentationExperimentNotFound
	- ExperimentationExperimentRunning
	- ExperimentationExperimentStopped
	- ExperimentationInvalidDuration
	- ExperimentationInvalidEndDate
	- ExperimentationInvalidStartDate
	- ExperimentationLegacyExperimentInvalidOperation
	- ExperimentationMaxDurationExceeded
	- FeatureNotConfiguredForTitle
	- SegmentNotFound

]]
function Apis.UpdateExperiment(request: Types.UpdateExperimentRequest, entityToken: string): Result<Types.EmptyResponse, string>
	return makeApiCall(
		"/Experimentation/UpdateExperiment",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Updates an existing exclusion group for a title.

	Given an entity token and exclusion group details this API updates the
	exclusion group.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/experimentation/experimentation/updateexclusiongroup).

	### Errors
	- ExperimentationExclusionGroupNotFound
	- FeatureNotConfiguredForTitle

]]
function Apis.UpdateExclusionGroup(request: Types.UpdateExclusionGroupRequest, entityToken: string): Result<Types.EmptyResponse, string>
	return makeApiCall(
		"/Experimentation/UpdateExclusionGroup",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Deletes an existing exclusion group for a title.

	Given an entity token and an exclusion group ID this API deletes the
	exclusion group.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/experimentation/experimentation/deleteexclusiongroup).

	### Errors
	- ExperimentationExclusionGroupCannotDelete
	- ExperimentationExclusionGroupNotFound
	- FeatureNotConfiguredForTitle

]]
function Apis.DeleteExclusionGroup(request: Types.DeleteExclusionGroupRequest, entityToken: string): Result<Types.EmptyResponse, string>
	return makeApiCall(
		"/Experimentation/DeleteExclusionGroup",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Gets the details of all exclusion groups for a title.

	Given a title entity token and an exclusion group ID, will return the list
	of traffic allocations for the exclusion group.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/experimentation/experimentation/getexclusiongrouptraffic).

	### Errors
	- ExperimentationExclusionGroupNotFound
	- FeatureNotConfiguredForTitle

]]
function Apis.GetExclusionGroupTraffic(request: Types.GetExclusionGroupTrafficRequest, entityToken: string): Result<Types.GetExclusionGroupTrafficResult, string>
	return makeApiCall(
		"/Experimentation/GetExclusionGroupTraffic",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Creates a new experiment exclusion group for a title.

	Given a title entity token and exclusion group details, will create a new
	exclusion group for the title.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/experimentation/experimentation/createexclusiongroup).

	### Errors
	- ExperimentationExclusionGroupInvalidName
	- FeatureNotConfiguredForTitle

]]
function Apis.CreateExclusionGroup(request: Types.CreateExclusionGroupRequest, entityToken: string): Result<Types.CreateExclusionGroupResult, string>
	return makeApiCall(
		"/Experimentation/CreateExclusionGroup",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Starts an existing experiment for a title.

	Given a title entity token and an experiment ID, this API starts the
	experiment.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/experimentation/experimentation/startexperiment).

	### Errors
	- ExperimentationExperimentNotFound
	- ExperimentationExperimentRunning
	- ExperimentationExperimentStopped
	- ExperimentationLegacyExperimentInvalidOperation
	- FeatureNotConfiguredForTitle

]]
function Apis.StartExperiment(request: Types.StartExperimentRequest, entityToken: string): Result<Types.EmptyResponse, string>
	return makeApiCall(
		"/Experimentation/StartExperiment",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Stops an existing experiment for a title.

	Given a title entity token and an experiment ID, this API stops the
	experiment if it is running.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/experimentation/experimentation/stopexperiment).

	### Errors
	- ExperimentationExperimentNeverStarted
	- ExperimentationExperimentNotFound
	- ExperimentationExperimentStopped
	- FeatureNotConfiguredForTitle

]]
function Apis.StopExperiment(request: Types.StopExperimentRequest, entityToken: string): Result<Types.EmptyResponse, string>
	return makeApiCall(
		"/Experimentation/StopExperiment",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Deletes an existing experiment for a title.

	Given an entity token and an experiment ID this API deletes the experiment.
	A running experiment must be stopped before it can be deleted.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/experimentation/experimentation/deleteexperiment).

	### Errors
	- ExperimentationExperimentNotFound
	- ExperimentationExperimentRunning
	- FeatureNotConfiguredForTitle

]]
function Apis.DeleteExperiment(request: Types.DeleteExperimentRequest, entityToken: string): Result<Types.EmptyResponse, string>
	return makeApiCall(
		"/Experimentation/DeleteExperiment",
		request,
		"X-EntityToken",
		entityToken
	)
end

return Apis
