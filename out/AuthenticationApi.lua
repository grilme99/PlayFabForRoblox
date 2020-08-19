-- Compiled with https://roblox-ts.github.io v0.3.2
-- August 19, 2020, 6:00 PM British Summer Time

local TS = _G[script];
local exports = {};
local MakeRequest = TS.import(script, script.Parent, "HTTP").default;
local Settings = TS.import(script, script.Parent, "Settings").default;
local PlayerData = TS.import(script, script.Parent, "PlayFab").PlayerData;
local GetEntityToken = TS.async(function(request, player)
	local authKey;
	local authValue;
	if player then
		local data = PlayerData[player];
		local _0 = data.SessionTicket;
		if _0 ~= "" and _0 then
			authKey = 'X-Authorization';
			authValue = data.SessionTicket;
		else
			local _1 = data.EntityToken;
			if _1 ~= "" and _1 then
				authKey = 'X-EntityToken';
				authValue = data.EntityToken;
			end;
		end;
	else
		local _0 = Settings.settings.secretKey;
		if _0 ~= "" and _0 then
			authKey = 'X-SecretKey';
			authValue = Settings.settings.secretKey;
		end;
	end;
	local result = TS.await(MakeRequest('/Authentication/GetEntityToken', request, authKey, authValue));
	return result;
end);
exports.GetEntityToken = GetEntityToken;
return exports;
