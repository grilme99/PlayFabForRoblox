local MakeRequest = require(script.Parent.HTTP).MakePlayFabApiCall
local PlayerData = require(script.Parent.PlayFab).PlayerData
local Promise = require(script.Parent.Promise)
local Settings = require(script.Parent.Settings)
local TS = require(script.Parent.TS)

local GetEntityToken = Promise.promisify(function(request, player)
	local authKey
	local authValue
	if player then
		local data = PlayerData[player]
		local sessionTicket = data.SessionTicket
		if sessionTicket ~= "" then
			authKey = "X-Authorization"
			authValue = sessionTicket
		else
			local entityToken = data.EntityToken
			if entityToken ~= "" then
				authKey = "X-EntityToken"
				authValue = entityToken
			end
		end
	else
		local secretKey = Settings.settings.secretKey
		if secretKey ~= "" then
			authKey = "X-SecretKey"
			authValue = secretKey
		end
	end

	return TS.await(MakeRequest("/Authentication/GetEntityToken", request, authKey, authValue))
end)

return {
	GetEntityToken = GetEntityToken,
}