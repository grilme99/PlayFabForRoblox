-- Compiled with https://roblox-ts.github.io v0.3.2
-- August 19, 2020, 6:07 PM British Summer Time

local TS = _G[script];
local exports = {};
local MakeRequest = TS.import(script, script.Parent, "HTTP").default;
local Settings = TS.import(script, script.Parent, "Settings").default;
local CreateExperiment = TS.async(function(request)
	if Settings._internalSettings.entityToken == '' then
		error('Must have Settings._internalSettings.entityToken set to call this method');
	end;
	local result = TS.await(MakeRequest('/Experimentation/CreateExperiment', request, 'X-EntityToken', Settings._internalSettings.entityToken));
	return result;
end);
local DeleteExperiment = TS.async(function(request)
	if Settings._internalSettings.entityToken == '' then
		error('Must have Settings._internalSettings.entityToken set to call this method');
	end;
	local result = TS.await(MakeRequest('/Experimentation/DeleteExperiment', request, 'X-EntityToken', Settings._internalSettings.entityToken));
	return result;
end);
local GetExperiments = TS.async(function(request)
	if Settings._internalSettings.entityToken == '' then
		error('Must have Settings._internalSettings.entityToken set to call this method');
	end;
	local result = TS.await(MakeRequest('/Experimentation/GetExperiments', request, 'X-EntityToken', Settings._internalSettings.entityToken));
	return result;
end);
local GetLatestScorecard = TS.async(function(request)
	if Settings._internalSettings.entityToken == '' then
		error('Must have Settings._internalSettings.entityToken set to call this method');
	end;
	local result = TS.await(MakeRequest('/Experimentation/GetLatestScorecard', request, 'X-EntityToken', Settings._internalSettings.entityToken));
	return result;
end);
local GetTreatmentAssignment = TS.async(function(request)
	if Settings._internalSettings.entityToken == '' then
		error('Must have Settings._internalSettings.entityToken set to call this method');
	end;
	local result = TS.await(MakeRequest('/Experimentation/GetTreatmentAssignment', request, 'X-EntityToken', Settings._internalSettings.entityToken));
	return result;
end);
local StartExperiment = TS.async(function(request)
	if Settings._internalSettings.entityToken == '' then
		error('Must have Settings._internalSettings.entityToken set to call this method');
	end;
	local result = TS.await(MakeRequest('/Experimentation/StartExperiment', request, 'X-EntityToken', Settings._internalSettings.entityToken));
	return result;
end);
local StopExperiment = TS.async(function(request)
	if Settings._internalSettings.entityToken == '' then
		error('Must have Settings._internalSettings.entityToken set to call this method');
	end;
	local result = TS.await(MakeRequest('/Experimentation/StopExperiment', request, 'X-EntityToken', Settings._internalSettings.entityToken));
	return result;
end);
local UpdateExperiment = TS.async(function(request)
	if Settings._internalSettings.entityToken == '' then
		error('Must have Settings._internalSettings.entityToken set to call this method');
	end;
	local result = TS.await(MakeRequest('/Experimentation/UpdateExperiment', request, 'X-EntityToken', Settings._internalSettings.entityToken));
	return result;
end);
exports.CreateExperiment = CreateExperiment;
exports.DeleteExperiment = DeleteExperiment;
exports.GetExperiments = GetExperiments;
exports.GetLatestScorecard = GetLatestScorecard;
exports.GetTreatmentAssignment = GetTreatmentAssignment;
exports.StartExperiment = StartExperiment;
exports.StopExperiment = StopExperiment;
exports.UpdateExperiment = UpdateExperiment;
return exports;
