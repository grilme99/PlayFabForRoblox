-- Compiled with https://roblox-ts.github.io v0.3.2
-- August 19, 2020, 5:44 PM British Summer Time

local TS = _G[script];
local exports = {};
local MakeRequest = TS.import(script, script.Parent, "HTTP").default;
local Settings = TS.import(script, script.Parent, "Settings").default;
local GetObjects = TS.async(function(request)
	if Settings._internalSettings.entityToken == '' then
		error('Must have Settings._internalSettings.entityToken set to call this method');
	end;
	local result = TS.await(MakeRequest('/Object/GetObjects', request, 'X-EntityToken', Settings._internalSettings.entityToken));
	return result;
end);
local SetObjects = TS.async(function(request)
	if Settings._internalSettings.entityToken == '' then
		error('Must have Settings._internalSettings.entityToken set to call this method');
	end;
	local result = TS.await(MakeRequest('/Object/SetObjects', request, 'X-EntityToken', Settings._internalSettings.entityToken));
	return result;
end);
exports.GetObjects = GetObjects;
exports.SetObjects = SetObjects;
return exports;
