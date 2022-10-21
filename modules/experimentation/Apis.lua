--!strict

local PlayFabInternal = require(script.Parent.PlayFabInternal)
local Types = require(script.Parent.Types)

local Apis = {}

--- https://docs.microsoft.com/rest/api/playfab/experimentation/experimentation/createexclusiongroup
function Apis.CreateExclusionGroupAsync(
	entityToken: string, 
	request: Types.CreateExclusionGroupRequest
): Types.CreateExclusionGroupResult
	return PlayFabInternal.MakeApiCall(
		"/Experimentation/CreateExclusionGroup",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/experimentation/experimentation/createexperiment
function Apis.CreateExperimentAsync(
	entityToken: string, 
	request: Types.CreateExperimentRequest
): Types.CreateExperimentResult
	return PlayFabInternal.MakeApiCall(
		"/Experimentation/CreateExperiment",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/experimentation/experimentation/deleteexclusiongroup
function Apis.DeleteExclusionGroupAsync(
	entityToken: string, 
	request: Types.DeleteExclusionGroupRequest
): Types.EmptyResponse
	return PlayFabInternal.MakeApiCall(
		"/Experimentation/DeleteExclusionGroup",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/experimentation/experimentation/deleteexperiment
function Apis.DeleteExperimentAsync(
	entityToken: string, 
	request: Types.DeleteExperimentRequest
): Types.EmptyResponse
	return PlayFabInternal.MakeApiCall(
		"/Experimentation/DeleteExperiment",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/experimentation/experimentation/getexclusiongrouptraffic
function Apis.GetExclusionGroupTrafficAsync(
	entityToken: string, 
	request: Types.GetExclusionGroupTrafficRequest
): Types.GetExclusionGroupTrafficResult
	return PlayFabInternal.MakeApiCall(
		"/Experimentation/GetExclusionGroupTraffic",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/experimentation/experimentation/getexclusiongroups
function Apis.GetExclusionGroupsAsync(
	entityToken: string, 
	request: Types.GetExclusionGroupsRequest
): Types.GetExclusionGroupsResult
	return PlayFabInternal.MakeApiCall(
		"/Experimentation/GetExclusionGroups",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/experimentation/experimentation/getexperiments
function Apis.GetExperimentsAsync(
	entityToken: string, 
	request: Types.GetExperimentsRequest
): Types.GetExperimentsResult
	return PlayFabInternal.MakeApiCall(
		"/Experimentation/GetExperiments",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/experimentation/experimentation/getlatestscorecard
function Apis.GetLatestScorecardAsync(
	entityToken: string, 
	request: Types.GetLatestScorecardRequest
): Types.GetLatestScorecardResult
	return PlayFabInternal.MakeApiCall(
		"/Experimentation/GetLatestScorecard",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/experimentation/experimentation/gettreatmentassignment
function Apis.GetTreatmentAssignmentAsync(
	entityToken: string, 
	request: Types.GetTreatmentAssignmentRequest
): Types.GetTreatmentAssignmentResult
	return PlayFabInternal.MakeApiCall(
		"/Experimentation/GetTreatmentAssignment",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/experimentation/experimentation/startexperiment
function Apis.StartExperimentAsync(
	entityToken: string, 
	request: Types.StartExperimentRequest
): Types.EmptyResponse
	return PlayFabInternal.MakeApiCall(
		"/Experimentation/StartExperiment",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/experimentation/experimentation/stopexperiment
function Apis.StopExperimentAsync(
	entityToken: string, 
	request: Types.StopExperimentRequest
): Types.EmptyResponse
	return PlayFabInternal.MakeApiCall(
		"/Experimentation/StopExperiment",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/experimentation/experimentation/updateexclusiongroup
function Apis.UpdateExclusionGroupAsync(
	entityToken: string, 
	request: Types.UpdateExclusionGroupRequest
): Types.EmptyResponse
	return PlayFabInternal.MakeApiCall(
		"/Experimentation/UpdateExclusionGroup",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/experimentation/experimentation/updateexperiment
function Apis.UpdateExperimentAsync(
	entityToken: string, 
	request: Types.UpdateExperimentRequest
): Types.EmptyResponse
	return PlayFabInternal.MakeApiCall(
		"/Experimentation/UpdateExperiment",
		request,
		"X-EntityToken",
		entityToken
	)
end

return Apis

