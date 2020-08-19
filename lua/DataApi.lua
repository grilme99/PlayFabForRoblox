local MakeRequest = require(script.Parent.HTTP).MakePlayFabApiCall
local Promise = require(script.Parent.Promise)
local Settings = require(script.Parent.Settings)
local TS = require(script.Parent.TS)

local GetObjects = Promise.promisify(function(request)
	if Settings._internalSettings.entityToken == "" then
		error("Must have Settings._internalSettings.entityToken set to call this method")
	end

	return TS.await(MakeRequest("/Object/GetObjects", request, "X-EntityToken", Settings._internalSettings.entityToken))
end)

local SetObjects = Promise.promisify(function(request)
	if Settings._internalSettings.entityToken == "" then
		error("Must have Settings._internalSettings.entityToken set to call this method")
	end

	return TS.await(MakeRequest("/Object/SetObjects", request, "X-EntityToken", Settings._internalSettings.entityToken))
end)

return {
	GetObjects = GetObjects,
	SetObjects = SetObjects,
}