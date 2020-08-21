local MakeRequest = require(script.Parent.HTTP).MakePlayFabApiCall
local PlayFab = require(script.Parent.PlayFab)
local Promise = require(script.Parent.Promise)
local Settings = require(script.Parent.Settings)
local TS = require(script.Parent.TS)

local PlayerData = PlayFab.PlayerData
local IsClientLoggedIn = PlayFab.IsClientLoggedIn

local AcceptTrade = Promise.promisify(function(player, request)
	local data = PlayerData[player]
	if not IsClientLoggedIn(player) or not data then
		error("Must be logged in to call this method")
	end

	return TS.await(MakeRequest("/Client/AcceptTrade", request, "X-Authorization", data.SessionTicket))
end)

local AddFriend = Promise.promisify(function(player, request)
	local data = PlayerData[player]
	if not IsClientLoggedIn(player) or not data then
		error("Must be logged in to call this method")
	end

	return TS.await(MakeRequest("/Client/AddFriend", request, "X-Authorization", data.SessionTicket))
end)

local AddGenericID = Promise.promisify(function(player, request)
	local data = PlayerData[player]
	if not IsClientLoggedIn(player) or not data then
		error("Must be logged in to call this method")
	end

	return TS.await(MakeRequest("/Client/AddGenericID", request, "X-Authorization", data.SessionTicket))
end)

local AddSharedGroupMembers = Promise.promisify(function(player, request)
	local data = PlayerData[player]
	if not IsClientLoggedIn(player) or not data then
		error("Must be logged in to call this method")
	end

	return TS.await(MakeRequest("/Client/AddSharedGroupMembers", request, "X-Authorization", data.SessionTicket))
end)

local AddUserVirtualCurrency = Promise.promisify(function(player, request)
	local data = PlayerData[player]
	if not IsClientLoggedIn(player) or not data then
		error("Must be logged in to call this method")
	end

	return TS.await(MakeRequest("/Client/AddUserVirtualCurrency", request, "X-Authorization", data.SessionTicket))
end)

local CancelTrade = Promise.promisify(function(player, request)
	local data = PlayerData[player]
	if not IsClientLoggedIn(player) or not data then
		error("Must be logged in to call this method")
	end

	return TS.await(MakeRequest("/Client/CancelTrade", request, "X-Authorization", data.SessionTicket))
end)

local ConfirmPurchase = Promise.promisify(function(player, request)
	local data = PlayerData[player]
	if not IsClientLoggedIn(player) or not data then
		error("Must be logged in to call this method")
	end

	return TS.await(MakeRequest("/Client/ConfirmPurchase", request, "X-Authorization", data.SessionTicket))
end)

local ConsumeItem = Promise.promisify(function(player, request)
	local data = PlayerData[player]
	if not IsClientLoggedIn(player) or not data then
		error("Must be logged in to call this method")
	end

	return TS.await(MakeRequest("/Client/ConsumeItem", request, "X-Authorization", data.SessionTicket))
end)

local CreateSharedGroup = Promise.promisify(function(player, request)
	local data = PlayerData[player]
	if not IsClientLoggedIn(player) or not data then
		error("Must be logged in to call this method")
	end

	return TS.await(MakeRequest("/Client/CreateSharedGroup", request, "X-Authorization", data.SessionTicket))
end)

local ExecuteCloudScript = Promise.promisify(function(player, request)
	local data = PlayerData[player]
	if not IsClientLoggedIn(player) or not data then
		error("Must be logged in to call this method")
	end

	return TS.await(MakeRequest("/Client/ExecuteCloudScript", request, "X-Authorization", data.SessionTicket))
end)

local GetAccountInfo = Promise.promisify(function(player, request)
	local data = PlayerData[player]
	if not IsClientLoggedIn(player) or not data then
		error("Must be logged in to call this method")
	end

	return TS.await(MakeRequest("/Client/GetAccountInfo", request, "X-Authorization", data.SessionTicket))
end)

local GetAllUsersCharacters = Promise.promisify(function(player, request)
	local data = PlayerData[player]
	if not IsClientLoggedIn(player) or not data then
		error("Must be logged in to call this method")
	end

	return TS.await(MakeRequest("/Client/GetAllUsersCharacters", request, "X-Authorization", data.SessionTicket))
end)

local GetCatalogItems = Promise.promisify(function(player, request)
	local data = PlayerData[player]
	if not IsClientLoggedIn(player) or not data then
		error("Must be logged in to call this method")
	end

	return TS.await(MakeRequest("/Client/GetCatalogItems", request, "X-Authorization", data.SessionTicket))
end)

local GetCharacterData = Promise.promisify(function(player, request)
	local data = PlayerData[player]
	if not IsClientLoggedIn(player) or not data then
		error("Must be logged in to call this method")
	end

	return TS.await(MakeRequest("/Client/GetCharacterData", request, "X-Authorization", data.SessionTicket))
end)

local GetCharacterInventory = Promise.promisify(function(player, request)
	local data = PlayerData[player]
	if not IsClientLoggedIn(player) or not data then
		error("Must be logged in to call this method")
	end

	return TS.await(MakeRequest("/Client/GetCharacterInventory", request, "X-Authorization", data.SessionTicket))
end)

local GetCharacterLeaderboard = Promise.promisify(function(player, request)
	local data = PlayerData[player]
	if not IsClientLoggedIn(player) or not data then
		error("Must be logged in to call this method")
	end

	return TS.await(MakeRequest("/Client/GetCharacterLeaderboard", request, "X-Authorization", data.SessionTicket))
end)

local GetCharacterReadOnlyData = Promise.promisify(function(player, request)
	local data = PlayerData[player]
	if not IsClientLoggedIn(player) or not data then
		error("Must be logged in to call this method")
	end

	return TS.await(MakeRequest("/Client/GetCharacterReadOnlyData", request, "X-Authorization", data.SessionTicket))
end)

local GetCharacterStatistics = Promise.promisify(function(player, request)
	local data = PlayerData[player]
	if not IsClientLoggedIn(player) or not data then
		error("Must be logged in to call this method")
	end

	return TS.await(MakeRequest("/Client/GetCharacterStatistics", request, "X-Authorization", data.SessionTicket))
end)

local GetContentDownloadUrl = Promise.promisify(function(player, request)
	local data = PlayerData[player]
	if not IsClientLoggedIn(player) or not data then
		error("Must be logged in to call this method")
	end

	return TS.await(MakeRequest("/Client/GetContentDownloadUrl", request, "X-Authorization", data.SessionTicket))
end)

local GetFriendLeaderboard = Promise.promisify(function(player, request)
	local data = PlayerData[player]
	if not IsClientLoggedIn(player) or not data then
		error("Must be logged in to call this method")
	end

	return TS.await(MakeRequest("/Client/GetFriendLeaderboard", request, "X-Authorization", data.SessionTicket))
end)

local GetFriendLeaderboardAroundPlayer = Promise.promisify(function(player, request)
	local data = PlayerData[player]
	if not IsClientLoggedIn(player) or not data then
		error("Must be logged in to call this method")
	end

	return TS.await(MakeRequest("/Client/GetFriendLeaderboardAroundPlayer", request, "X-Authorization", data.SessionTicket))
end)

local GetFriendsList = Promise.promisify(function(player, request)
	local data = PlayerData[player]
	if not IsClientLoggedIn(player) or not data then
		error("Must be logged in to call this method")
	end

	return TS.await(MakeRequest("/Client/GetFriendsList", request, "X-Authorization", data.SessionTicket))
end)

local GetLeaderboard = Promise.promisify(function(player, request)
	local data = PlayerData[player]
	if not IsClientLoggedIn(player) or not data then
		error("Must be logged in to call this method")
	end

	return TS.await(MakeRequest("/Client/GetLeaderboard", request, "X-Authorization", data.SessionTicket))
end)

local GetLeaderboardAroundCharacter = Promise.promisify(function(player, request)
	local data = PlayerData[player]
	if not IsClientLoggedIn(player) or not data then
		error("Must be logged in to call this method")
	end

	return TS.await(MakeRequest("/Client/GetLeaderboardAroundCharacter", request, "X-Authorization", data.SessionTicket))
end)

local GetLeaderboardAroundPlayer = Promise.promisify(function(player, request)
	local data = PlayerData[player]
	if not IsClientLoggedIn(player) or not data then
		error("Must be logged in to call this method")
	end

	return TS.await(MakeRequest("/Client/GetLeaderboardAroundPlayer", request, "X-Authorization", data.SessionTicket))
end)

local GetPlayerCombinedInfo = Promise.promisify(function(player, request)
	local data = PlayerData[player]
	if not IsClientLoggedIn(player) or not data then
		error("Must be logged in to call this method")
	end

	return TS.await(MakeRequest("/Client/GetPlayerCombinedInfo", request, "X-Authorization", data.SessionTicket))
end)

local GetPlayerProfile = Promise.promisify(function(player, request)
	local data = PlayerData[player]
	if not IsClientLoggedIn(player) or not data then
		error("Must be logged in to call this method")
	end

	return TS.await(MakeRequest("/Client/GetPlayerProfile", request, "X-Authorization", data.SessionTicket))
end)

local GetPlayerSegments = Promise.promisify(function(player, request)
	local data = PlayerData[player]
	if not IsClientLoggedIn(player) or not data then
		error("Must be logged in to call this method")
	end

	return TS.await(MakeRequest("/Client/GetPlayerSegments", request, "X-Authorization", data.SessionTicket))
end)

local GetPlayerStatistics = Promise.promisify(function(player, request)
	local data = PlayerData[player]
	if not IsClientLoggedIn(player) or not data then
		error("Must be logged in to call this method")
	end

	return TS.await(MakeRequest("/Client/GetPlayerStatistics", request, "X-Authorization", data.SessionTicket))
end)

local GetPlayerStatisticVersions = Promise.promisify(function(player, request)
	local data = PlayerData[player]
	if not IsClientLoggedIn(player) or not data then
		error("Must be logged in to call this method")
	end

	return TS.await(MakeRequest("/Client/GetPlayerStatisticVersions", request, "X-Authorization", data.SessionTicket))
end)

local GetPlayerTags = Promise.promisify(function(player, request)
	local data = PlayerData[player]
	if not IsClientLoggedIn(player) or not data then
		error("Must be logged in to call this method")
	end

	return TS.await(MakeRequest("/Client/GetPlayerTags", request, "X-Authorization", data.SessionTicket))
end)

local GetPlayerTrades = Promise.promisify(function(player, request)
	local data = PlayerData[player]
	if not IsClientLoggedIn(player) or not data then
		error("Must be logged in to call this method")
	end

	return TS.await(MakeRequest("/Client/GetPlayerTrades", request, "X-Authorization", data.SessionTicket))
end)

local GetPlayFabIDsFromGenericIDs = Promise.promisify(function(player, request)
	local data = PlayerData[player]
	if not IsClientLoggedIn(player) or not data then
		error("Must be logged in to call this method")
	end

	return TS.await(MakeRequest("/Client/GetPlayFabIDsFromGenericIDs", request, "X-Authorization", data.SessionTicket))
end)

local GetPublisherData = Promise.promisify(function(player, request)
	local data = PlayerData[player]
	if not IsClientLoggedIn(player) or not data then
		error("Must be logged in to call this method")
	end

	return TS.await(MakeRequest("/Client/GetPublisherData", request, "X-Authorization", data.SessionTicket))
end)

local GetPurchase = Promise.promisify(function(player, request)
	local data = PlayerData[player]
	if not IsClientLoggedIn(player) or not data then
		error("Must be logged in to call this method")
	end

	return TS.await(MakeRequest("/Client/GetPurchase", request, "X-Authorization", data.SessionTicket))
end)

local GetSharedGroupData = Promise.promisify(function(player, request)
	local data = PlayerData[player]
	if not IsClientLoggedIn(player) or not data then
		error("Must be logged in to call this method")
	end

	return TS.await(MakeRequest("/Client/GetSharedGroupData", request, "X-Authorization", data.SessionTicket))
end)

local GetStoreItems = Promise.promisify(function(player, request)
	local data = PlayerData[player]
	if not IsClientLoggedIn(player) or not data then
		error("Must be logged in to call this method")
	end

	return TS.await(MakeRequest("/Client/GetStoreItems", request, "X-Authorization", data.SessionTicket))
end)

local GetTime = Promise.promisify(function(player, request)
	local data = PlayerData[player]
	if not IsClientLoggedIn(player) or not data then
		error("Must be logged in to call this method")
	end

	return TS.await(MakeRequest("/Client/GetTime", request, "X-Authorization", data.SessionTicket))
end)

local GetTitleData = Promise.promisify(function(player, request)
	local data = PlayerData[player]
	if not IsClientLoggedIn(player) or not data then
		error("Must be logged in to call this method")
	end

	return TS.await(MakeRequest("/Client/GetTitleData", request, "X-Authorization", data.SessionTicket))
end)

local GetTitleNews = Promise.promisify(function(player, request)
	local data = PlayerData[player]
	if not IsClientLoggedIn(player) or not data then
		error("Must be logged in to call this method")
	end

	return TS.await(MakeRequest("/Client/GetTitleNews", request, "X-Authorization", data.SessionTicket))
end)

local GetTitlePublicKey = Promise.promisify(function(player, request)
	local data = PlayerData[player]
	if not IsClientLoggedIn(player) or not data then
		error("Must be logged in to call this method")
	end

	return TS.await(MakeRequest("/Client/GetTitlePublicKey", request, "X-Authorization", data.SessionTicket))
end)

local GetTradeStatus = Promise.promisify(function(player, request)
	local data = PlayerData[player]
	if not IsClientLoggedIn(player) or not data then
		error("Must be logged in to call this method")
	end

	return TS.await(MakeRequest("/Client/GetTradeStatus", request, "X-Authorization", data.SessionTicket))
end)

local GetUserData = Promise.promisify(function(player, request)
	local data = PlayerData[player]
	if not IsClientLoggedIn(player) or not data then
		error("Must be logged in to call this method")
	end

	return TS.await(MakeRequest("/Client/GetUserData", request, "X-Authorization", data.SessionTicket))
end)

local GetUserInventory = Promise.promisify(function(player, request)
	local data = PlayerData[player]
	if not IsClientLoggedIn(player) or not data then
		error("Must be logged in to call this method")
	end

	return TS.await(MakeRequest("/Client/GetUserInventory", request, "X-Authorization", data.SessionTicket))
end)

local GetUserPublisherData = Promise.promisify(function(player, request)
	local data = PlayerData[player]
	if not IsClientLoggedIn(player) or not data then
		error("Must be logged in to call this method")
	end

	return TS.await(MakeRequest("/Client/GetUserPublisherData", request, "X-Authorization", data.SessionTicket))
end)

local GetUserPublisherReadOnlyData = Promise.promisify(function(player, request)
	local data = PlayerData[player]
	if not IsClientLoggedIn(player) or not data then
		error("Must be logged in to call this method")
	end

	return TS.await(MakeRequest("/Client/GetUserPublisherReadOnlyData", request, "X-Authorization", data.SessionTicket))
end)

local GetUserReadOnlyData = Promise.promisify(function(player, request)
	local data = PlayerData[player]
	if not IsClientLoggedIn(player) or not data then
		error("Must be logged in to call this method")
	end

	return TS.await(MakeRequest("/Client/GetUserReadOnlyData", request, "X-Authorization", data.SessionTicket))
end)

local GrantCharacterToUser = Promise.promisify(function(player, request)
	local data = PlayerData[player]
	if not IsClientLoggedIn(player) or not data then
		error("Must be logged in to call this method")
	end

	return TS.await(MakeRequest("/Client/GrantCharacterToUser", request, "X-Authorization", data.SessionTicket))
end)

local LinkCustomID = Promise.promisify(function(player, request)
	local data = PlayerData[player]
	if not IsClientLoggedIn(player) or not data then
		error("Must be logged in to call this method")
	end

	return TS.await(MakeRequest("/Client/LinkCustomID", request, "X-Authorization", data.SessionTicket))
end)

local LoginWithCustomID = Promise.promisify(function(player, request)
	local titleId = request.TitleId
	if not (titleId ~= "" and titleId) then
		request.TitleId = Settings.settings.titleId
		titleId = request.TitleId
	end

	if not (titleId ~= "" and titleId) then
		error("Must be have settings.titleId set to call this method")
	end

	local result = TS.await(MakeRequest("/Client/LoginWithCustomID", request))
	local sessionTicket = result.SessionTicket
	if not (sessionTicket ~= "" and sessionTicket) then
		error("No session ticket")
	end

	local entityToken = not result.EntityToken
	if not entityToken then
		local resultEntityToken = result.EntityToken.EntityToken
		entityToken = not (resultEntityToken ~= "" and resultEntityToken)
	end

	local entityToken2 = entityToken -- wasn't sure what to call this
	if not entityToken2 then
		local tokenExpiration = result.EntityToken.TokenExpiration
		entityToken2 = not (tokenExpiration ~= "" and tokenExpiration)
	end

	if entityToken2 then
		error("No entity token")
	end

	PlayerData[player] = {
		SessionTicket = result.SessionTicket,
		EntityToken = result.EntityToken.EntityToken,
		TokenExpiration = result.EntityToken.TokenExpiration,
		PlayFabId = result.PlayFabId
	}
end)

local Matchmake = Promise.promisify(function(player, request)
	local data = PlayerData[player]
	if not IsClientLoggedIn(player) or not data then
		error("Must be logged in to call this method")
	end

	return TS.await(MakeRequest("/Client/Matchmake", request, "X-Authorization", data.SessionTicket))
end)

local OpenTrade = Promise.promisify(function(player, request)
	local data = PlayerData[player]
	if not IsClientLoggedIn(player) or not data then
		error("Must be logged in to call this method")
	end

	return TS.await(MakeRequest("/Client/OpenTrade", request, "X-Authorization", data.SessionTicket))
end)

local PayForPurchase = Promise.promisify(function(player, request)
	local data = PlayerData[player]
	if not IsClientLoggedIn(player) or not data then
		error("Must be logged in to call this method")
	end

	return TS.await(MakeRequest("/Client/PayForPurchase", request, "X-Authorization", data.SessionTicket))
end)

local PurchaseItem = Promise.promisify(function(player, request)
	local data = PlayerData[player]
	if not IsClientLoggedIn(player) or not data then
		error("Must be logged in to call this method")
	end

	return TS.await(MakeRequest("/Client/PurchaseItem", request, "X-Authorization", data.SessionTicket))
end)

local RedeemCoupon = Promise.promisify(function(player, request)
	local data = PlayerData[player]
	if not IsClientLoggedIn(player) or not data then
		error("Must be logged in to call this method")
	end

	return TS.await(MakeRequest("/Client/RedeemCoupon", request, "X-Authorization", data.SessionTicket))
end)

local RemoveFriend = Promise.promisify(function(player, request)
	local data = PlayerData[player]
	if not IsClientLoggedIn(player) or not data then
		error("Must be logged in to call this method")
	end

	return TS.await(MakeRequest("/Client/RemoveFriend", request, "X-Authorization", data.SessionTicket))
end)

local RemoveGenericID = Promise.promisify(function(player, request)
	local data = PlayerData[player]
	if not IsClientLoggedIn(player) or not data then
		error("Must be logged in to call this method")
	end

	return TS.await(MakeRequest("/Client/RemoveGenericID", request, "X-Authorization", data.SessionTicket))
end)

local RemoveSharedGroupMembers = Promise.promisify(function(player, request)
	local data = PlayerData[player]
	if not IsClientLoggedIn(player) or not data then
		error("Must be logged in to call this method")
	end

	return TS.await(MakeRequest("/Client/RemoveSharedGroupMembers", request, "X-Authorization", data.SessionTicket))
end)

local ReportPlayer = Promise.promisify(function(player, request)
	local data = PlayerData[player]
	if not IsClientLoggedIn(player) or not data then
		error("Must be logged in to call this method")
	end

	return TS.await(MakeRequest("/Client/ReportPlayer", request, "X-Authorization", data.SessionTicket))
end)

local SetFriendTags = Promise.promisify(function(player, request)
	local data = PlayerData[player]
	if not IsClientLoggedIn(player) or not data then
		error("Must be logged in to call this method")
	end

	return TS.await(MakeRequest("/Client/SetFriendTags", request, "X-Authorization", data.SessionTicket))
end)

local SetPlayerSecret = Promise.promisify(function(player, request)
	local data = PlayerData[player]
	if not IsClientLoggedIn(player) or not data then
		error("Must be logged in to call this method")
	end

	return TS.await(MakeRequest("/Client/SetPlayerSecret", request, "X-Authorization", data.SessionTicket))
end)

local StartPurchase = Promise.promisify(function(player, request)
	local data = PlayerData[player]
	if not IsClientLoggedIn(player) or not data then
		error("Must be logged in to call this method")
	end

	return TS.await(MakeRequest("/Client/StartPurchase", request, "X-Authorization", data.SessionTicket))
end)

local SubtractUserVirtualCurrency = Promise.promisify(function(player, request)
	local data = PlayerData[player]
	if not IsClientLoggedIn(player) or not data then
		error("Must be logged in to call this method")
	end

	return TS.await(MakeRequest("/Client/SubtractUserVirtualCurrency", request, "X-Authorization", data.SessionTicket))
end)

local UnlinkCustomID = Promise.promisify(function(player, request)
	local data = PlayerData[player]
	if not IsClientLoggedIn(player) or not data then
		error("Must be logged in to call this method")
	end

	return TS.await(MakeRequest("/Client/UnlinkCustomID", request, "X-Authorization", data.SessionTicket))
end)

local UnlockContainerInstance = Promise.promisify(function(player, request)
	local data = PlayerData[player]
	if not IsClientLoggedIn(player) or not data then
		error("Must be logged in to call this method")
	end

	return TS.await(MakeRequest("/Client/UnlockContainerInstance", request, "X-Authorization", data.SessionTicket))
end)

local UnlockContainerItem = Promise.promisify(function(player, request)
	local data = PlayerData[player]
	if not IsClientLoggedIn(player) or not data then
		error("Must be logged in to call this method")
	end

	return TS.await(MakeRequest("/Client/UnlockContainerItem", request, "X-Authorization", data.SessionTicket))
end)

local UpdateAvatarUrl = Promise.promisify(function(player, request)
	local data = PlayerData[player]
	if not IsClientLoggedIn(player) or not data then
		error("Must be logged in to call this method")
	end

	return TS.await(MakeRequest("/Client/UpdateAvatarUrl", request, "X-Authorization", data.SessionTicket))
end)

local UpdateCharacterData = Promise.promisify(function(player, request)
	local data = PlayerData[player]
	if not IsClientLoggedIn(player) or not data then
		error("Must be logged in to call this method")
	end

	return TS.await(MakeRequest("/Client/UpdateCharacterData", request, "X-Authorization", data.SessionTicket))
end)

local UpdateCharacterStatistics = Promise.promisify(function(player, request)
	local data = PlayerData[player]
	if not IsClientLoggedIn(player) or not data then
		error("Must be logged in to call this method")
	end

	return TS.await(MakeRequest("/Client/UpdateCharacterStatistics", request, "X-Authorization", data.SessionTicket))
end)

local UpdatePlayerStatistics = Promise.promisify(function(player, request)
	local data = PlayerData[player]
	if not IsClientLoggedIn(player) or not data then
		error("Must be logged in to call this method")
	end

	return TS.await(MakeRequest("/Client/UpdatePlayerStatistics", request, "X-Authorization", data.SessionTicket))
end)

local UpdateSharedGroupData = Promise.promisify(function(player, request)
	local data = PlayerData[player]
	if not IsClientLoggedIn(player) or not data then
		error("Must be logged in to call this method")
	end

	return TS.await(MakeRequest("/Client/UpdateSharedGroupData", request, "X-Authorization", data.SessionTicket))
end)

local UpdateUserData = Promise.promisify(function(player, request)
	local data = PlayerData[player]
	if not IsClientLoggedIn(player) or not data then
		error("Must be logged in to call this method")
	end

	return TS.await(MakeRequest("/Client/UpdateUserData", request, "X-Authorization", data.SessionTicket))
end)

local UpdateUserPublisherData = Promise.promisify(function(player, request)
	local data = PlayerData[player]
	if not IsClientLoggedIn(player) or not data then
		error("Must be logged in to call this method")
	end

	return TS.await(MakeRequest("/Client/UpdateUserPublisherData", request, "X-Authorization", data.SessionTicket))
end)

local UpdateUserTitleDisplayName = Promise.promisify(function(player, request)
	local data = PlayerData[player]
	if not IsClientLoggedIn(player) or not data then
		error("Must be logged in to call this method")
	end

	return TS.await(MakeRequest("/Client/UpdateUserTitleDisplayName", request, "X-Authorization", data.SessionTicket))
end)

local WriteCharacterEvent = Promise.promisify(function(player, request)
	local data = PlayerData[player]
	if not IsClientLoggedIn(player) or not data then
		error("Must be logged in to call this method")
	end

	return TS.await(MakeRequest("/Client/WriteCharacterEvent", request, "X-Authorization", data.SessionTicket))
end)

local WritePlayerEvent = Promise.promisify(function(player, request)
	local data = PlayerData[player]
	if not IsClientLoggedIn(player) or not data then
		error("Must be logged in to call this method")
	end

	return TS.await(MakeRequest("/Client/WritePlayerEvent", request, "X-Authorization", data.SessionTicket))
end)

local WriteTitleEvent = Promise.promisify(function(player, request)
	local data = PlayerData[player]
	if not IsClientLoggedIn(player) or not data then
		error("Must be logged in to call this method")
	end

	return TS.await(MakeRequest("/Client/WriteTitleEvent", request, "X-Authorization", data.SessionTicket))
end)

return {
	AcceptTrade = AcceptTrade,
	AddFriend = AddFriend,
	AddGenericID = AddGenericID,
	AddSharedGroupMembers = AddSharedGroupMembers,
	AddUserVirtualCurrency = AddUserVirtualCurrency,
	CancelTrade = CancelTrade,
	ConfirmPurchase = ConfirmPurchase,
	ConsumeItem = ConsumeItem,
	CreateSharedGroup = CreateSharedGroup,
	ExecuteCloudScript = ExecuteCloudScript,
	GetAccountInfo = GetAccountInfo,
	GetAllUsersCharacters = GetAllUsersCharacters,
	GetCatalogItems = GetCatalogItems,
	GetCharacterData = GetCharacterData,
	GetCharacterInventory = GetCharacterInventory,
	GetCharacterLeaderboard = GetCharacterLeaderboard,
	GetCharacterReadOnlyData = GetCharacterReadOnlyData,
	GetCharacterStatistics = GetCharacterStatistics,
	GetContentDownloadUrl = GetContentDownloadUrl,
	GetFriendLeaderboard = GetFriendLeaderboard,
	GetFriendLeaderboardAroundPlayer = GetFriendLeaderboardAroundPlayer,
	GetFriendsList = GetFriendsList,
	GetLeaderboard = GetLeaderboard,
	GetLeaderboardAroundCharacter = GetLeaderboardAroundCharacter,
	GetLeaderboardAroundPlayer = GetLeaderboardAroundPlayer,
	GetPlayerCombinedInfo = GetPlayerCombinedInfo,
	GetPlayerProfile = GetPlayerProfile,
	GetPlayerSegments = GetPlayerSegments,
	GetPlayerStatistics = GetPlayerStatistics,
	GetPlayerStatisticVersions = GetPlayerStatisticVersions,
	GetPlayerTags = GetPlayerTags,
	GetPlayerTrades = GetPlayerTrades,
	GetPlayFabIDsFromGenericIDs = GetPlayFabIDsFromGenericIDs,
	GetPublisherData = GetPublisherData,
	GetPurchase = GetPurchase,
	GetSharedGroupData = GetSharedGroupData,
	GetStoreItems = GetStoreItems,
	GetTime = GetTime,
	GetTitleData = GetTitleData,
	GetTitleNews = GetTitleNews,
	GetTitlePublicKey = GetTitlePublicKey,
	GetTradeStatus = GetTradeStatus,
	GetUserData = GetUserData,
	GetUserInventory = GetUserInventory,
	GetUserPublisherData = GetUserPublisherData,
	GetUserPublisherReadOnlyData = GetUserPublisherReadOnlyData,
	GetUserReadOnlyData = GetUserReadOnlyData,
	GrantCharacterToUser = GrantCharacterToUser,
	LinkCustomID = LinkCustomID,
	LoginWithCustomID = LoginWithCustomID,
	Matchmake = Matchmake,
	OpenTrade = OpenTrade,
	PayForPurchase = PayForPurchase,
	PurchaseItem = PurchaseItem,
	RedeemCoupon = RedeemCoupon,
	RemoveFriend = RemoveFriend,
	RemoveGenericID = RemoveGenericID,
	RemoveSharedGroupMembers = RemoveSharedGroupMembers,
	ReportPlayer = ReportPlayer,
	SetFriendTags = SetFriendTags,
	SetPlayerSecret = SetPlayerSecret,
	StartPurchase = StartPurchase,
	SubtractUserVirtualCurrency = SubtractUserVirtualCurrency,
	UnlinkCustomID = UnlinkCustomID,
	UnlockContainerInstance = UnlockContainerInstance,
	UnlockContainerItem = UnlockContainerItem,
	UpdateAvatarUrl = UpdateAvatarUrl,
	UpdateCharacterData = UpdateCharacterData,
	UpdateCharacterStatistics = UpdateCharacterStatistics,
	UpdatePlayerStatistics = UpdatePlayerStatistics,
	UpdateSharedGroupData = UpdateSharedGroupData,
	UpdateUserData = UpdateUserData,
	UpdateUserPublisherData = UpdateUserPublisherData,
	UpdateUserTitleDisplayName = UpdateUserTitleDisplayName,
	WriteCharacterEvent = WriteCharacterEvent,
	WritePlayerEvent = WritePlayerEvent,
	WriteTitleEvent = WriteTitleEvent,
}