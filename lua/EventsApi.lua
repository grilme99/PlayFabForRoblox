local MakeRequest = require(script.Parent.HTTP).MakePlayFabApiCall
local PlayFab = require(script.Parent.PlayFab)
local Promise = require(script.Parent.Promise)
local TS = require(script.Parent.TS)

local PlayerData = PlayFab.PlayerData
local IsClientLoggedIn = PlayFab.IsClientLoggedIn

local WriteEvents = Promise.promisify(function(player, request)
	local data = PlayerData[player]
	if not IsClientLoggedIn(player) or not data then
		error("Must be logged in to call this method")
	end

	return TS.await(MakeRequest("/Event/WriteEvents", request, "X-EntityToken", data.EntityToken))
end)

local WriteTelemetryEvents = Promise.promisify(function(player, request)
	local data = PlayerData[player]
	if not IsClientLoggedIn(player) or not data then
		error("Must be logged in to call this method")
	end

	return TS.await(MakeRequest("/Event/WriteTelemetryEvents", request, "X-EntityToken", data.EntityToken))
end)

return {
	WriteEvents = WriteEvents,
	WriteTelemetryEvents = WriteTelemetryEvents,
}