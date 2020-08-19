local MakeRequest = require(script.Parent.HTTP).MakePlayFabApiCall
local Promise = require(script.Parent.Promise)
local Settings = require(script.Parent.Settings)
local TS = require(script.Parent.TS)

local CancelAllMatchmakingTicketsForPlayer = Promise.promisify(function(request)
	if Settings._internalSettings.entityToken == "" then
		error("Must have Settings._internalSettings.entityToken set to call this method")
	end

	return TS.await(MakeRequest("/Match/CancelAllMatchmakingTicketsForPlayer", request, "X-EntityToken", Settings._internalSettings.entityToken))
end)

local CancelAllServerBackfillTicketsForPlayer = Promise.promisify(function(request)
	if Settings._internalSettings.entityToken == "" then
		error("Must have Settings._internalSettings.entityToken set to call this method")
	end

	return TS.await(MakeRequest("/Match/CancelAllServerBackfillTicketsForPlayer", request, "X-EntityToken", Settings._internalSettings.entityToken))
end)

local CancelMatchmakingTicket = Promise.promisify(function(request)
	if Settings._internalSettings.entityToken == "" then
		error("Must have Settings._internalSettings.entityToken set to call this method")
	end

	return TS.await(MakeRequest("/Match/CancelMatchmakingTicket", request, "X-EntityToken", Settings._internalSettings.entityToken))
end)

local CancelServerBackfillTicket = Promise.promisify(function(request)
	if Settings._internalSettings.entityToken == "" then
		error("Must have Settings._internalSettings.entityToken set to call this method")
	end

	return TS.await(MakeRequest("/Match/CancelServerBackfillTicket", request, "X-EntityToken", Settings._internalSettings.entityToken))
end)

local CreateMatchmakingTicket = Promise.promisify(function(request)
	if Settings._internalSettings.entityToken == "" then
		error("Must have Settings._internalSettings.entityToken set to call this method")
	end

	return TS.await(MakeRequest("/Match/CreateMatchmakingTicket", request, "X-EntityToken", Settings._internalSettings.entityToken))
end)

local CreateServerBackfillTicket = Promise.promisify(function(request)
	if Settings._internalSettings.entityToken == "" then
		error("Must have Settings._internalSettings.entityToken set to call this method")
	end

	return TS.await(MakeRequest("/Match/CreateServerBackfillTicket", request, "X-EntityToken", Settings._internalSettings.entityToken))
end)

local CreateServerMatchmakingTicket = Promise.promisify(function(request)
	if Settings._internalSettings.entityToken == "" then
		error("Must have Settings._internalSettings.entityToken set to call this method")
	end

	return TS.await(MakeRequest("/Match/CreateServerMatchmakingTicket", request, "X-EntityToken", Settings._internalSettings.entityToken))
end)

local GetMatchmakingQueue = Promise.promisify(function(request)
	if Settings._internalSettings.entityToken == "" then
		error("Must have Settings._internalSettings.entityToken set to call this method")
	end

	return TS.await(MakeRequest("/Match/GetMatchmakingQueue", request, "X-EntityToken", Settings._internalSettings.entityToken))
end)

local GetMatchmakingTicket = Promise.promisify(function(request)
	if Settings._internalSettings.entityToken == "" then
		error("Must have Settings._internalSettings.entityToken set to call this method")
	end

	return TS.await(MakeRequest("/Match/GetMatchmakingTicket", request, "X-EntityToken", Settings._internalSettings.entityToken))
end)

local GetQueueStatistics = Promise.promisify(function(request)
	if Settings._internalSettings.entityToken == "" then
		error("Must have Settings._internalSettings.entityToken set to call this method")
	end

	return TS.await(MakeRequest("/Match/GetQueueStatistics", request, "X-EntityToken", Settings._internalSettings.entityToken))
end)

local GetServerBackfillTicket = Promise.promisify(function(request)
	if Settings._internalSettings.entityToken == "" then
		error("Must have Settings._internalSettings.entityToken set to call this method")
	end

	return TS.await(MakeRequest("/Match/GetServerBackfillTicket", request, "X-EntityToken", Settings._internalSettings.entityToken))
end)

local JoinMatchmakingTicket = Promise.promisify(function(request)
	if Settings._internalSettings.entityToken == "" then
		error("Must have Settings._internalSettings.entityToken set to call this method")
	end

	return TS.await(MakeRequest("/Match/JoinMatchmakingTicket", request, "X-EntityToken", Settings._internalSettings.entityToken))
end)

local ListMatchmakingQueues = Promise.promisify(function(request)
	if Settings._internalSettings.entityToken == "" then
		error("Must have Settings._internalSettings.entityToken set to call this method")
	end

	return TS.await(MakeRequest("/Match/ListMatchmakingQueues", request, "X-EntityToken", Settings._internalSettings.entityToken))
end)

local ListMatchmakingTicketsForPlayer = Promise.promisify(function(request)
	if Settings._internalSettings.entityToken == "" then
		error("Must have Settings._internalSettings.entityToken set to call this method")
	end

	return TS.await(MakeRequest("/Match/ListMatchmakingTicketsForPlayer", request, "X-EntityToken", Settings._internalSettings.entityToken))
end)

local ListServerBackfillTicketsForPlayer = Promise.promisify(function(request)
	if Settings._internalSettings.entityToken == "" then
		error("Must have Settings._internalSettings.entityToken set to call this method")
	end

	return TS.await(MakeRequest("/Match/ListServerBackfillTicketsForPlayer", request, "X-EntityToken", Settings._internalSettings.entityToken))
end)

local RemoveMatchmakingQueue = Promise.promisify(function(request)
	if Settings._internalSettings.entityToken == "" then
		error("Must have Settings._internalSettings.entityToken set to call this method")
	end

	return TS.await(MakeRequest("/Match/RemoveMatchmakingQueue", request, "X-EntityToken", Settings._internalSettings.entityToken))
end)

local SetMatchmakingQueue = Promise.promisify(function(request)
	if Settings._internalSettings.entityToken == "" then
		error("Must have Settings._internalSettings.entityToken set to call this method")
	end

	return TS.await(MakeRequest("/Match/SetMatchmakingQueue", request, "X-EntityToken", Settings._internalSettings.entityToken))
end)

return {
	CancelAllMatchmakingTicketsForPlayer = CancelAllMatchmakingTicketsForPlayer,
	CancelAllServerBackfillTicketsForPlayer = CancelAllServerBackfillTicketsForPlayer,
	CancelMatchmakingTicket = CancelMatchmakingTicket,
	CancelServerBackfillTicket = CancelServerBackfillTicket,
	CreateMatchmakingTicket = CreateMatchmakingTicket,
	CreateServerBackfillTicket = CreateServerBackfillTicket,
	CreateServerMatchmakingTicket = CreateServerMatchmakingTicket,
	GetMatchmakingQueue = GetMatchmakingQueue,
	GetMatchmakingTicket = GetMatchmakingTicket,
	GetQueueStatistics = GetQueueStatistics,
	GetServerBackfillTicket = GetServerBackfillTicket,
	JoinMatchmakingTicket = JoinMatchmakingTicket,
	ListMatchmakingQueues = ListMatchmakingQueues,
	ListMatchmakingTicketsForPlayer = ListMatchmakingTicketsForPlayer,
	ListServerBackfillTicketsForPlayer = ListServerBackfillTicketsForPlayer,
	RemoveMatchmakingQueue = RemoveMatchmakingQueue,
	SetMatchmakingQueue = SetMatchmakingQueue,
}