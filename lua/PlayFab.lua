local PlayerData = {}

local function IsClientLoggedIn(player: Player): boolean
	local data = PlayerData[player]
	if not data then
		return false
	end

	local doesHaveSession = data.SessionTicket ~= nil
	local isValidSession = doesHaveSession and #data.SessionTicket > 0
	return isValidSession and data.EntityToken ~= ""
end

return {
	PlayerData = PlayerData,
	IsClientLoggedIn = IsClientLoggedIn,
}