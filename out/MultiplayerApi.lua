-- Compiled with https://roblox-ts.github.io v0.3.2
-- August 19, 2020, 7:42 PM British Summer Time

local TS = _G[script];
local exports = {};
local MakeRequest = TS.import(script, script.Parent, "HTTP").default;
local Settings = TS.import(script, script.Parent, "Settings").default;
local CancelAllMatchmakingTicketsForPlayer = TS.async(function(request)
	if Settings._internalSettings.entityToken == '' then
		error('Must have Settings._internalSettings.entityToken set to call this method');
	end;
	local result = TS.await(MakeRequest('/Match/CancelAllMatchmakingTicketsForPlayer', request, 'X-EntityToken', Settings._internalSettings.entityToken));
	return result;
end);
local CancelAllServerBackfillTicketsForPlayer = TS.async(function(request)
	if Settings._internalSettings.entityToken == '' then
		error('Must have Settings._internalSettings.entityToken set to call this method');
	end;
	local result = TS.await(MakeRequest('/Match/CancelAllServerBackfillTicketsForPlayer', request, 'X-EntityToken', Settings._internalSettings.entityToken));
	return result;
end);
local CancelMatchmakingTicket = TS.async(function(request)
	if Settings._internalSettings.entityToken == '' then
		error('Must have Settings._internalSettings.entityToken set to call this method');
	end;
	local result = TS.await(MakeRequest('/Match/CancelMatchmakingTicket', request, 'X-EntityToken', Settings._internalSettings.entityToken));
	return result;
end);
local CancelServerBackfillTicket = TS.async(function(request)
	if Settings._internalSettings.entityToken == '' then
		error('Must have Settings._internalSettings.entityToken set to call this method');
	end;
	local result = TS.await(MakeRequest('/Match/CancelServerBackfillTicket', request, 'X-EntityToken', Settings._internalSettings.entityToken));
	return result;
end);
local CreateMatchmakingTicket = TS.async(function(request)
	if Settings._internalSettings.entityToken == '' then
		error('Must have Settings._internalSettings.entityToken set to call this method');
	end;
	local result = TS.await(MakeRequest('/Match/CreateMatchmakingTicket', request, 'X-EntityToken', Settings._internalSettings.entityToken));
	return result;
end);
local CreateServerBackfillTicket = TS.async(function(request)
	if Settings._internalSettings.entityToken == '' then
		error('Must have Settings._internalSettings.entityToken set to call this method');
	end;
	local result = TS.await(MakeRequest('/Match/CreateServerBackfillTicket', request, 'X-EntityToken', Settings._internalSettings.entityToken));
	return result;
end);
local CreateServerMatchmakingTicket = TS.async(function(request)
	if Settings._internalSettings.entityToken == '' then
		error('Must have Settings._internalSettings.entityToken set to call this method');
	end;
	local result = TS.await(MakeRequest('/Match/CreateServerMatchmakingTicket', request, 'X-EntityToken', Settings._internalSettings.entityToken));
	return result;
end);
local GetMatchmakingQueue = TS.async(function(request)
	if Settings._internalSettings.entityToken == '' then
		error('Must have Settings._internalSettings.entityToken set to call this method');
	end;
	local result = TS.await(MakeRequest('/Match/GetMatchmakingQueue', request, 'X-EntityToken', Settings._internalSettings.entityToken));
	return result;
end);
local GetMatchmakingTicket = TS.async(function(request)
	if Settings._internalSettings.entityToken == '' then
		error('Must have Settings._internalSettings.entityToken set to call this method');
	end;
	local result = TS.await(MakeRequest('/Match/GetMatchmakingTicket', request, 'X-EntityToken', Settings._internalSettings.entityToken));
	return result;
end);
local GetQueueStatistics = TS.async(function(request)
	if Settings._internalSettings.entityToken == '' then
		error('Must have Settings._internalSettings.entityToken set to call this method');
	end;
	local result = TS.await(MakeRequest('/Match/GetQueueStatistics', request, 'X-EntityToken', Settings._internalSettings.entityToken));
	return result;
end);
local GetServerBackfillTicket = TS.async(function(request)
	if Settings._internalSettings.entityToken == '' then
		error('Must have Settings._internalSettings.entityToken set to call this method');
	end;
	local result = TS.await(MakeRequest('/Match/GetServerBackfillTicket', request, 'X-EntityToken', Settings._internalSettings.entityToken));
	return result;
end);
local JoinMatchmakingTicket = TS.async(function(request)
	if Settings._internalSettings.entityToken == '' then
		error('Must have Settings._internalSettings.entityToken set to call this method');
	end;
	local result = TS.await(MakeRequest('/Match/JoinMatchmakingTicket', request, 'X-EntityToken', Settings._internalSettings.entityToken));
	return result;
end);
local ListMatchmakingQueues = TS.async(function(request)
	if Settings._internalSettings.entityToken == '' then
		error('Must have Settings._internalSettings.entityToken set to call this method');
	end;
	local result = TS.await(MakeRequest('/Match/ListMatchmakingQueues', request, 'X-EntityToken', Settings._internalSettings.entityToken));
	return result;
end);
local ListMatchmakingTicketsForPlayer = TS.async(function(request)
	if Settings._internalSettings.entityToken == '' then
		error('Must have Settings._internalSettings.entityToken set to call this method');
	end;
	local result = TS.await(MakeRequest('/Match/ListMatchmakingTicketsForPlayer', request, 'X-EntityToken', Settings._internalSettings.entityToken));
	return result;
end);
local ListServerBackfillTicketsForPlayer = TS.async(function(request)
	if Settings._internalSettings.entityToken == '' then
		error('Must have Settings._internalSettings.entityToken set to call this method');
	end;
	local result = TS.await(MakeRequest('/Match/ListServerBackfillTicketsForPlayer', request, 'X-EntityToken', Settings._internalSettings.entityToken));
	return result;
end);
local RemoveMatchmakingQueue = TS.async(function(request)
	if Settings._internalSettings.entityToken == '' then
		error('Must have Settings._internalSettings.entityToken set to call this method');
	end;
	local result = TS.await(MakeRequest('/Match/RemoveMatchmakingQueue', request, 'X-EntityToken', Settings._internalSettings.entityToken));
	return result;
end);
local SetMatchmakingQueue = TS.async(function(request)
	if Settings._internalSettings.entityToken == '' then
		error('Must have Settings._internalSettings.entityToken set to call this method');
	end;
	local result = TS.await(MakeRequest('/Match/SetMatchmakingQueue', request, 'X-EntityToken', Settings._internalSettings.entityToken));
	return result;
end);
exports.CancelAllMatchmakingTicketsForPlayer = CancelAllMatchmakingTicketsForPlayer;
exports.CancelAllServerBackfillTicketsForPlayer = CancelAllServerBackfillTicketsForPlayer;
exports.CancelMatchmakingTicket = CancelMatchmakingTicket;
exports.CancelServerBackfillTicket = CancelServerBackfillTicket;
exports.CreateMatchmakingTicket = CreateMatchmakingTicket;
exports.CreateServerBackfillTicket = CreateServerBackfillTicket;
exports.CreateServerMatchmakingTicket = CreateServerMatchmakingTicket;
exports.GetMatchmakingQueue = GetMatchmakingQueue;
exports.GetMatchmakingTicket = GetMatchmakingTicket;
exports.GetQueueStatistics = GetQueueStatistics;
exports.GetServerBackfillTicket = GetServerBackfillTicket;
exports.JoinMatchmakingTicket = JoinMatchmakingTicket;
exports.ListMatchmakingQueues = ListMatchmakingQueues;
exports.ListMatchmakingTicketsForPlayer = ListMatchmakingTicketsForPlayer;
exports.ListServerBackfillTicketsForPlayer = ListServerBackfillTicketsForPlayer;
exports.RemoveMatchmakingQueue = RemoveMatchmakingQueue;
exports.SetMatchmakingQueue = SetMatchmakingQueue;
return exports;
