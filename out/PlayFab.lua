-- Compiled with https://roblox-ts.github.io v0.3.2
-- August 19, 2020, 6:09 PM British Summer Time

local exports = {};
local PlayerData = {};
local IsClientLoggedIn = function(player)
	local data = PlayerData[player];
	if not (data) then
		return false;
	end;
	local _0 = data.SessionTicket ~= nil;
	local _1 = _0 and #(data.SessionTicket) > 0;
	return _1 and data.EntityToken ~= '';
end;
exports.PlayerData = PlayerData;
exports.IsClientLoggedIn = IsClientLoggedIn;
return exports;
