local MakeRequest = require(script.Parent.HTTP).MakePlayFabApiCall
local Promise = require(script.Parent.Promise)
local Settings = require(script.Parent.Settings)
local TS = require(script.Parent.TS)

local CreateExperiment = Promise.promisify(function(request)
	if Settings._internalSettings.entityToken == "" then
		error("Must have Settings._internalSettings.entityToken set to call this method")
	end

	return TS.await(MakeRequest("/Experimentation/CreateExperiment", request, "X-EntityToken", Settings._internalSettings.entityToken))
end)

local DeleteExperiment = Promise.promisify(function(request)
	if Settings._internalSettings.entityToken == "" then
		error("Must have Settings._internalSettings.entityToken set to call this method")
	end

	return TS.await(MakeRequest("/Experimentation/DeleteExperiment", request, "X-EntityToken", Settings._internalSettings.entityToken))
end)

local GetExperiments = Promise.promisify(function(request)
	if Settings._internalSettings.entityToken == "" then
		error("Must have Settings._internalSettings.entityToken set to call this method")
	end

	return TS.await(MakeRequest("/Experimentation/GetExperiments", request, "X-EntityToken", Settings._internalSettings.entityToken))
end)

local GetLatestScorecard = Promise.promisify(function(request)
	if Settings._internalSettings.entityToken == "" then
		error("Must have Settings._internalSettings.entityToken set to call this method")
	end

	return TS.await(MakeRequest("/Experimentation/GetLatestScorecard", request, "X-EntityToken", Settings._internalSettings.entityToken))
end)

local GetTreatmentAssignment = Promise.promisify(function(request)
	if Settings._internalSettings.entityToken == "" then
		error("Must have Settings._internalSettings.entityToken set to call this method")
	end

	return TS.await(MakeRequest("/Experimentation/GetTreatmentAssignment", request, "X-EntityToken", Settings._internalSettings.entityToken))
end)

local StartExperiment = Promise.promisify(function(request)
	if Settings._internalSettings.entityToken == "" then
		error("Must have Settings._internalSettings.entityToken set to call this method")
	end

	return TS.await(MakeRequest("/Experimentation/StartExperiment", request, "X-EntityToken", Settings._internalSettings.entityToken))
end)

local StopExperiment = Promise.promisify(function(request)
	if Settings._internalSettings.entityToken == "" then
		error("Must have Settings._internalSettings.entityToken set to call this method")
	end

	return TS.await(MakeRequest("/Experimentation/StopExperiment", request, "X-EntityToken", Settings._internalSettings.entityToken))
end)

local UpdateExperiment = Promise.promisify(function(request)
	if Settings._internalSettings.entityToken == "" then
		error("Must have Settings._internalSettings.entityToken set to call this method")
	end

	return TS.await(MakeRequest("/Experimentation/UpdateExperiment", request, "X-EntityToken", Settings._internalSettings.entityToken))
end)


return {
	CreateExperiment = CreateExperiment,
	DeleteExperiment = DeleteExperiment,
	GetExperiments = GetExperiments,
	GetLatestScorecard = GetLatestScorecard,
	GetTreatmentAssignment = GetTreatmentAssignment,
	StartExperiment = StartExperiment,
	StopExperiment = StopExperiment,
	UpdateExperiment = UpdateExperiment,
}