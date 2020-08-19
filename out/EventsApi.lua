-- Compiled with https://roblox-ts.github.io v0.3.2
-- August 19, 2020, 5:41 PM British Summer Time

local TS = _G[script];
local exports = {};
local MakeRequest = TS.import(script, script.Parent, "HTTP").default;
local _0 = TS.import(script, script.Parent, "PlayFab");
local PlayerData, IsClientLoggedIn = _0.PlayerData, _0.IsClientLoggedIn;
local WriteEvents = TS.async(function(player, request)
	local data = PlayerData[player];
	if (not (IsClientLoggedIn(player))) or (not (data)) then
		error('Must be logged in to call this method');
	end;
	local result = TS.await(MakeRequest('/Event/WriteEvents', request, 'X-EntityToken', data.EntityToken));
	return result;
end);
local WriteTelemetryEvents = TS.async(function(player, request)
	local data = PlayerData[player];
	if (not (IsClientLoggedIn(player))) or (not (data)) then
		error('Must be logged in to call this method');
	end;
	local result = TS.await(MakeRequest('/Event/WriteTelemetryEvents', request, 'X-EntityToken', data.EntityToken));
	return result;
end);
exports.WriteEvents = WriteEvents;
exports.WriteTelemetryEvents = WriteTelemetryEvents;
return exports;
