local MakeRequest = require(script.Parent.HTTP).MakePlayFabApiCall
local Promise = require(script.Parent.Promise)
local Settings = require(script.Parent.Settings)
local TS = require(script.Parent.TS)

local GetGlobalPolicy = Promise.promisify(function(request)
	if Settings._internalSettings.entityToken == "" then
		error("Must have Settings._internalSettings.entityToken set to call this method")
	end

	return TS.await(MakeRequest("/Profile/GetGlobalPolicy", request, "X-EntityToken", Settings._internalSettings.entityToken))
end)

local GetProfile = Promise.promisify(function(request)
	if Settings._internalSettings.entityToken == "" then
		error("Must have Settings._internalSettings.entityToken set to call this method")
	end

	return TS.await(MakeRequest("/Profile/GetProfile", request, "X-EntityToken", Settings._internalSettings.entityToken))
end)

local GetProfiles = Promise.promisify(function(request)
	if Settings._internalSettings.entityToken == "" then
		error("Must have Settings._internalSettings.entityToken set to call this method")
	end

	return TS.await(MakeRequest("/Profile/GetProfiles", request, "X-EntityToken", Settings._internalSettings.entityToken))
end)

local GetTitlePlayersFromMasterPlayerAccountIds = Promise.promisify(function(request)
	if Settings._internalSettings.entityToken == "" then
		error("Must have Settings._internalSettings.entityToken set to call this method")
	end

	return TS.await(MakeRequest("/Profile/GetTitlePlayersFromMasterPlayerAccountIds", request, "X-EntityToken", Settings._internalSettings.entityToken))
end)

local SetGlobalPolicy = Promise.promisify(function(request)
	if Settings._internalSettings.entityToken == "" then
		error("Must have Settings._internalSettings.entityToken set to call this method")
	end

	return TS.await(MakeRequest("/Profile/SetGlobalPolicy", request, "X-EntityToken", Settings._internalSettings.entityToken))
end)

local SetProfileLanguage = Promise.promisify(function(request)
	if Settings._internalSettings.entityToken == "" then
		error("Must have Settings._internalSettings.entityToken set to call this method")
	end

	return TS.await(MakeRequest("/Profile/SetProfileLanguage", request, "X-EntityToken", Settings._internalSettings.entityToken))
end)

local SetProfilePolicy = Promise.promisify(function(request)
	if Settings._internalSettings.entityToken == "" then
		error("Must have Settings._internalSettings.entityToken set to call this method")
	end

	return TS.await(MakeRequest("/Profile/SetProfilePolicy", request, "X-EntityToken", Settings._internalSettings.entityToken))
end)

return {
	GetGlobalPolicy = GetGlobalPolicy,
	GetProfile = GetProfile,
	GetProfiles = GetProfiles,
	GetTitlePlayersFromMasterPlayerAccountIds = GetTitlePlayersFromMasterPlayerAccountIds,
	SetGlobalPolicy = SetGlobalPolicy,
	SetProfileLanguage = SetProfileLanguage,
	SetProfilePolicy = SetProfilePolicy,
}