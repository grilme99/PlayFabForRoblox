-- Compiled with https://roblox-ts.github.io v0.3.2
-- August 19, 2020, 6:09 PM British Summer Time

local TS = _G[script];
local exports = {};
local MakeRequest = TS.import(script, script.Parent, "HTTP").default;
local Settings = TS.import(script, script.Parent, "Settings").default;
local GetGlobalPolicy = TS.async(function(request)
	if Settings._internalSettings.entityToken == '' then
		error('Must have Settings._internalSettings.entityToken set to call this method');
	end;
	local result = TS.await(MakeRequest('/Profile/GetGlobalPolicy', request, 'X-EntityToken', Settings._internalSettings.entityToken));
	return result;
end);
local GetProfile = TS.async(function(request)
	if Settings._internalSettings.entityToken == '' then
		error('Must have Settings._internalSettings.entityToken set to call this method');
	end;
	local result = TS.await(MakeRequest('/Profile/GetProfile', request, 'X-EntityToken', Settings._internalSettings.entityToken));
	return result;
end);
local GetProfiles = TS.async(function(request)
	if Settings._internalSettings.entityToken == '' then
		error('Must have Settings._internalSettings.entityToken set to call this method');
	end;
	local result = TS.await(MakeRequest('/Profile/GetProfiles', request, 'X-EntityToken', Settings._internalSettings.entityToken));
	return result;
end);
local GetTitlePlayersFromMasterPlayerAccountIds = TS.async(function(request)
	if Settings._internalSettings.entityToken == '' then
		error('Must have Settings._internalSettings.entityToken set to call this method');
	end;
	local result = TS.await(MakeRequest('/Profile/GetTitlePlayersFromMasterPlayerAccountIds', request, 'X-EntityToken', Settings._internalSettings.entityToken));
	return result;
end);
local SetGlobalPolicy = TS.async(function(request)
	if Settings._internalSettings.entityToken == '' then
		error('Must have Settings._internalSettings.entityToken set to call this method');
	end;
	local result = TS.await(MakeRequest('/Profile/SetGlobalPolicy', request, 'X-EntityToken', Settings._internalSettings.entityToken));
	return result;
end);
local SetProfileLanguage = TS.async(function(request)
	if Settings._internalSettings.entityToken == '' then
		error('Must have Settings._internalSettings.entityToken set to call this method');
	end;
	local result = TS.await(MakeRequest('/Profile/SetProfileLanguage', request, 'X-EntityToken', Settings._internalSettings.entityToken));
	return result;
end);
local SetProfilePolicy = TS.async(function(request)
	if Settings._internalSettings.entityToken == '' then
		error('Must have Settings._internalSettings.entityToken set to call this method');
	end;
	local result = TS.await(MakeRequest('/Profile/SetProfilePolicy', request, 'X-EntityToken', Settings._internalSettings.entityToken));
	return result;
end);
exports.GetGlobalPolicy = GetGlobalPolicy;
exports.GetProfile = GetProfile;
exports.GetProfiles = GetProfiles;
exports.GetTitlePlayersFromMasterPlayerAccountIds = GetTitlePlayersFromMasterPlayerAccountIds;
exports.SetGlobalPolicy = SetGlobalPolicy;
exports.SetProfileLanguage = SetProfileLanguage;
exports.SetProfilePolicy = SetProfilePolicy;
return exports;
