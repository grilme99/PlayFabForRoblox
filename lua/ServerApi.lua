local MakeRequest = require(script.Parent.HTTP).MakePlayFabApiCall
local Promise = require(script.Parent.Promise)
local Settings = require(script.Parent.Settings)
local TS = require(script.Parent.TS)

local AddCharacterVirtualCurrency = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Server/AddCharacterVirtualCurrency", request, "X-SecretKey", secretKey))
end)

local AddFriend = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Server/AddFriend", request, "X-SecretKey", secretKey))
end)

local AddGenericID = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Server/AddGenericID", request, "X-SecretKey", secretKey))
end)

local AddPlayerTag = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Server/AddPlayerTag", request, "X-SecretKey", secretKey))
end)

local AddSharedGroupMembers = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Server/AddSharedGroupMembers", request, "X-SecretKey", secretKey))
end)

local AddUserVirtualCurrency = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Server/AddUserVirtualCurrency", request, "X-SecretKey", secretKey))
end)

local AuthenticateSessionTicket = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Server/AuthenticateSessionTicket", request, "X-SecretKey", secretKey))
end)

local BanUsers = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Server/BanUsers", request, "X-SecretKey", secretKey))
end)

local ConsumeItem = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Server/ConsumeItem", request, "X-SecretKey", secretKey))
end)

local CreateSharedGroup = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Server/CreateSharedGroup", request, "X-SecretKey", secretKey))
end)

local DeleteCharacterFromUser = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Server/DeleteCharacterFromUser", request, "X-SecretKey", secretKey))
end)

local DeletePlayer = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Server/DeletePlayer", request, "X-SecretKey", secretKey))
end)

local DeleteSharedGroup = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Server/DeleteSharedGroup", request, "X-SecretKey", secretKey))
end)

local DeregisterGame = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Server/DeregisterGame", request, "X-SecretKey", secretKey))
end)

local EvaluateRandomResultTable = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Server/EvaluateRandomResultTable", request, "X-SecretKey", secretKey))
end)

local ExecuteCloudScript = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Server/ExecuteCloudScript", request, "X-SecretKey", secretKey))
end)

local GetAllSegments = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Server/GetAllSegments", request, "X-SecretKey", secretKey))
end)

local GetAllUsersCharacters = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Server/GetAllUsersCharacters", request, "X-SecretKey", secretKey))
end)

local GetCatalogItems = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Server/GetCatalogItems", request, "X-SecretKey", secretKey))
end)

local GetCharacterData = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Server/GetCharacterData", request, "X-SecretKey", secretKey))
end)

local GetCharacterInternalData = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Server/GetCharacterInternalData", request, "X-SecretKey", secretKey))
end)

local GetCharacterInventory = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Server/GetCharacterInventory", request, "X-SecretKey", secretKey))
end)

local GetCharacterLeaderboard = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Server/GetCharacterLeaderboard", request, "X-SecretKey", secretKey))
end)

local GetCharacterReadOnlyData = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Server/GetCharacterReadOnlyData", request, "X-SecretKey", secretKey))
end)

local GetCharacterStatistics = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Server/GetCharacterStatistics", request, "X-SecretKey", secretKey))
end)

local GetContentDownloadUrl = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Server/GetContentDownloadUrl", request, "X-SecretKey", secretKey))
end)

local GetFriendLeaderboard = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Server/GetFriendLeaderboard", request, "X-SecretKey", secretKey))
end)

local GetFriendsList = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Server/GetFriendsList", request, "X-SecretKey", secretKey))
end)

local GetLeaderboard = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Server/GetLeaderboard", request, "X-SecretKey", secretKey))
end)

local GetLeaderboardAroundCharacter = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Server/GetLeaderboardAroundCharacter", request, "X-SecretKey", secretKey))
end)

local GetLeaderboardForUserCharacters = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Server/GetLeaderboardForUserCharacters", request, "X-SecretKey", secretKey))
end)

local GetPlayerCombinedInfo = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Server/GetPlayerCombinedInfo", request, "X-SecretKey", secretKey))
end)

local GetPlayerProfile = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Server/GetPlayerProfile", request, "X-SecretKey", secretKey))
end)

local GetPlayerSegments = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Server/GetPlayerSegments", request, "X-SecretKey", secretKey))
end)

local GetPlayersInSegment = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Server/GetPlayersInSegment", request, "X-SecretKey", secretKey))
end)

local GetPlayerStatistics = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Server/GetPlayerStatistics", request, "X-SecretKey", secretKey))
end)

local GetPlayerStatisticVersions = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Server/GetPlayerStatisticVersions", request, "X-SecretKey", secretKey))
end)

local GetPlayerTags = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Server/GetPlayerTags", request, "X-SecretKey", secretKey))
end)

local GetPlayFabIDsFromGenericIDs = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Server/GetPlayFabIDsFromGenericIDs", request, "X-SecretKey", secretKey))
end)

local GetPublisherData = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Server/GetPublisherData", request, "X-SecretKey", secretKey))
end)

local GetRandomResultTables = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Server/GetRandomResultTables", request, "X-SecretKey", secretKey))
end)

local GetServerCustomIDsFromPlayFabIDs = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Server/GetServerCustomIDsFromPlayFabIDs", request, "X-SecretKey", secretKey))
end)

local GetSharedGroupData = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Server/GetSharedGroupData", request, "X-SecretKey", secretKey))
end)

local GetStoreItems = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Server/GetStoreItems", request, "X-SecretKey", secretKey))
end)

local GetTime = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Server/GetTime", request, "X-SecretKey", secretKey))
end)

local GetTitleData = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Server/GetTitleData", request, "X-SecretKey", secretKey))
end)

local GetTitleInternalData = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Server/GetTitleInternalData", request, "X-SecretKey", secretKey))
end)

local GetTitleNews = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Server/GetTitleNews", request, "X-SecretKey", secretKey))
end)

local GetUserAccountInfo = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Server/GetUserAccountInfo", request, "X-SecretKey", secretKey))
end)

local GetUserBans = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Server/GetUserBans", request, "X-SecretKey", secretKey))
end)

local GetUserData = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Server/GetUserData", request, "X-SecretKey", secretKey))
end)

local GetUserInternalData = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Server/GetUserInternalData", request, "X-SecretKey", secretKey))
end)

local GetUserInventory = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Server/GetUserInventory", request, "X-SecretKey", secretKey))
end)

local GetUserPublisherData = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Server/GetUserPublisherData", request, "X-SecretKey", secretKey))
end)

local GetUserPublisherInternalData = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Server/GetUserPublisherInternalData", request, "X-SecretKey", secretKey))
end)

local GetUserPublisherReadOnlyData = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Server/GetUserPublisherReadOnlyData", request, "X-SecretKey", secretKey))
end)

local GetUserReadOnlyData = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Server/GetUserReadOnlyData", request, "X-SecretKey", secretKey))
end)

local GrantCharacterToUser = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Server/GrantCharacterToUser", request, "X-SecretKey", secretKey))
end)

local GrantItemsToCharacter = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Server/GrantItemsToCharacter", request, "X-SecretKey", secretKey))
end)

local GrantItemsToUser = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Server/GrantItemsToUser", request, "X-SecretKey", secretKey))
end)

local GrantItemsToUsers = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Server/GrantItemsToUsers", request, "X-SecretKey", secretKey))
end)

local LinkServerCustomId = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Server/LinkServerCustomId", request, "X-SecretKey", secretKey))
end)

local LoginWithServerCustomId = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Server/LoginWithServerCustomId", request, "X-SecretKey", secretKey))
end)

local ModifyItemUses = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Server/ModifyItemUses", request, "X-SecretKey", secretKey))
end)

local MoveItemToCharacterFromCharacter = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Server/MoveItemToCharacterFromCharacter", request, "X-SecretKey", secretKey))
end)

local MoveItemToCharacterFromUser = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Server/MoveItemToCharacterFromUser", request, "X-SecretKey", secretKey))
end)

local MoveItemToUserFromCharacter = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Server/MoveItemToUserFromCharacter", request, "X-SecretKey", secretKey))
end)

local NotifyMatchmakerPlayerLeft = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Server/NotifyMatchmakerPlayerLeft", request, "X-SecretKey", secretKey))
end)

local RedeemCoupon = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Server/RedeemCoupon", request, "X-SecretKey", secretKey))
end)

local RedeemMatchmakerTicket = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Server/RedeemMatchmakerTicket", request, "X-SecretKey", secretKey))
end)

local RemoveFriend = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Server/RemoveFriend", request, "X-SecretKey", secretKey))
end)

local RemoveGenericID = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Server/RemoveGenericID", request, "X-SecretKey", secretKey))
end)

local RemovePlayerTag = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Server/RemovePlayerTag", request, "X-SecretKey", secretKey))
end)

local RemoveSharedGroupMembers = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Server/RemoveSharedGroupMembers", request, "X-SecretKey", secretKey))
end)

local ReportPlayer = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Server/ReportPlayer", request, "X-SecretKey", secretKey))
end)

local RevokeAllBansForUser = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Server/RevokeAllBansForUser", request, "X-SecretKey", secretKey))
end)

local RevokeBans = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Server/RevokeBans", request, "X-SecretKey", secretKey))
end)

local RevokeInventoryItem = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Server/RevokeInventoryItem", request, "X-SecretKey", secretKey))
end)

local RevokeInventoryItems = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Server/RevokeInventoryItems", request, "X-SecretKey", secretKey))
end)

local SetFriendTags = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Server/SetFriendTags", request, "X-SecretKey", secretKey))
end)

local SetPlayerSecret = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Server/SetPlayerSecret", request, "X-SecretKey", secretKey))
end)

local SetPublisherData = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Server/SetPublisherData", request, "X-SecretKey", secretKey))
end)

local SetTitleData = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Server/SetTitleData", request, "X-SecretKey", secretKey))
end)

local SetTitleInternalData = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Server/SetTitleInternalData", request, "X-SecretKey", secretKey))
end)

local SubtractCharacterVirtualCurrency = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Server/SubtractCharacterVirtualCurrency", request, "X-SecretKey", secretKey))
end)

local SubtractUserVirtualCurrency = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Server/SubtractUserVirtualCurrency", request, "X-SecretKey", secretKey))
end)

local UnlinkServerCustomId = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Server/UnlinkServerCustomId", request, "X-SecretKey", secretKey))
end)

local UnlockContainerItem = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Server/UnlockContainerItem", request, "X-SecretKey", secretKey))
end)

local UpdateAvatarUrl = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Server/UpdateAvatarUrl", request, "X-SecretKey", secretKey))
end)

local UpdateBans = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Server/UpdateBans", request, "X-SecretKey", secretKey))
end)

local UpdateCharacterData = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Server/UpdateCharacterData", request, "X-SecretKey", secretKey))
end)

local UpdateCharacterInternalData = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Server/UpdateCharacterInternalData", request, "X-SecretKey", secretKey))
end)

local UpdateCharacterReadOnlyData = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Server/UpdateCharacterReadOnlyData", request, "X-SecretKey", secretKey))
end)

local UpdateCharacterStatistics = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Server/UpdateCharacterStatistics", request, "X-SecretKey", secretKey))
end)

local UpdatePlayerStatistics = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Server/UpdatePlayerStatistics", request, "X-SecretKey", secretKey))
end)

local UpdateSharedGroupData = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Server/UpdateSharedGroupData", request, "X-SecretKey", secretKey))
end)

local UpdateUserData = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Server/UpdateUserData", request, "X-SecretKey", secretKey))
end)

local UpdateUserInternalData = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Server/UpdateUserInternalData", request, "X-SecretKey", secretKey))
end)

local UpdateUserInventoryItemCustomData = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Server/UpdateUserInventoryItemCustomData", request, "X-SecretKey", secretKey))
end)

local UpdateUserPublisherData = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Server/UpdateUserPublisherData", request, "X-SecretKey", secretKey))
end)

local UpdateUserPublisherInternalData = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Server/UpdateUserPublisherInternalData", request, "X-SecretKey", secretKey))
end)

local UpdateUserPublisherReadOnlyData = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Server/UpdateUserPublisherReadOnlyData", request, "X-SecretKey", secretKey))
end)

local UpdateUserReadOnlyData = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Server/UpdateUserReadOnlyData", request, "X-SecretKey", secretKey))
end)

local WriteCharacterEvent = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Server/WriteCharacterEvent", request, "X-SecretKey", secretKey))
end)

local WritePlayerEvent = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Server/WritePlayerEvent", request, "X-SecretKey", secretKey))
end)

local WriteTitleEvent = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Server/WriteTitleEvent", request, "X-SecretKey", secretKey))
end)

return {
	AddCharacterVirtualCurrency = AddCharacterVirtualCurrency,
	AddFriend = AddFriend,
	AddGenericID = AddGenericID,
	AddPlayerTag = AddPlayerTag,
	AddSharedGroupMembers = AddSharedGroupMembers,
	AddUserVirtualCurrency = AddUserVirtualCurrency,
	AuthenticateSessionTicket = AuthenticateSessionTicket,
	BanUsers = BanUsers,
	ConsumeItem = ConsumeItem,
	CreateSharedGroup = CreateSharedGroup,
	DeleteCharacterFromUser = DeleteCharacterFromUser,
	DeletePlayer = DeletePlayer,
	DeleteSharedGroup = DeleteSharedGroup,
	DeregisterGame = DeregisterGame,
	EvaluateRandomResultTable = EvaluateRandomResultTable,
	ExecuteCloudScript = ExecuteCloudScript,
	GetAllSegments = GetAllSegments,
	GetAllUsersCharacters = GetAllUsersCharacters,
	GetCatalogItems = GetCatalogItems,
	GetCharacterData = GetCharacterData,
	GetCharacterInternalData = GetCharacterInternalData,
	GetCharacterInventory = GetCharacterInventory,
	GetCharacterLeaderboard = GetCharacterLeaderboard,
	GetCharacterReadOnlyData = GetCharacterReadOnlyData,
	GetCharacterStatistics = GetCharacterStatistics,
	GetContentDownloadUrl = GetContentDownloadUrl,
	GetFriendLeaderboard = GetFriendLeaderboard,
	GetFriendsList = GetFriendsList,
	GetLeaderboard = GetLeaderboard,
	GetLeaderboardAroundCharacter = GetLeaderboardAroundCharacter,
	GetLeaderboardForUserCharacters = GetLeaderboardForUserCharacters,
	GetPlayerCombinedInfo = GetPlayerCombinedInfo,
	GetPlayerProfile = GetPlayerProfile,
	GetPlayerSegments = GetPlayerSegments,
	GetPlayersInSegment = GetPlayersInSegment,
	GetPlayerStatistics = GetPlayerStatistics,
	GetPlayerStatisticVersions = GetPlayerStatisticVersions,
	GetPlayerTags = GetPlayerTags,
	GetPlayFabIDsFromGenericIDs = GetPlayFabIDsFromGenericIDs,
	GetPublisherData = GetPublisherData,
	GetRandomResultTables = GetRandomResultTables,
	GetServerCustomIDsFromPlayFabIDs = GetServerCustomIDsFromPlayFabIDs,
	GetSharedGroupData = GetSharedGroupData,
	GetStoreItems = GetStoreItems,
	GetTime = GetTime,
	GetTitleData = GetTitleData,
	GetTitleInternalData = GetTitleInternalData,
	GetTitleNews = GetTitleNews,
	GetUserAccountInfo = GetUserAccountInfo,
	GetUserBans = GetUserBans,
	GetUserData = GetUserData,
	GetUserInternalData = GetUserInternalData,
	GetUserInventory = GetUserInventory,
	GetUserPublisherData = GetUserPublisherData,
	GetUserPublisherInternalData = GetUserPublisherInternalData,
	GetUserPublisherReadOnlyData = GetUserPublisherReadOnlyData,
	GetUserReadOnlyData = GetUserReadOnlyData,
	GrantCharacterToUser = GrantCharacterToUser,
	GrantItemsToCharacter = GrantItemsToCharacter,
	GrantItemsToUser = GrantItemsToUser,
	GrantItemsToUsers = GrantItemsToUsers,
	LinkServerCustomId = LinkServerCustomId,
	LoginWithServerCustomId = LoginWithServerCustomId,
	ModifyItemUses = ModifyItemUses,
	MoveItemToCharacterFromCharacter = MoveItemToCharacterFromCharacter,
	MoveItemToCharacterFromUser = MoveItemToCharacterFromUser,
	MoveItemToUserFromCharacter = MoveItemToUserFromCharacter,
	NotifyMatchmakerPlayerLeft = NotifyMatchmakerPlayerLeft,
	RedeemCoupon = RedeemCoupon,
	RedeemMatchmakerTicket = RedeemMatchmakerTicket,
	RemoveFriend = RemoveFriend,
	RemoveGenericID = RemoveGenericID,
	RemovePlayerTag = RemovePlayerTag,
	RemoveSharedGroupMembers = RemoveSharedGroupMembers,
	ReportPlayer = ReportPlayer,
	RevokeAllBansForUser = RevokeAllBansForUser,
	RevokeBans = RevokeBans,
	RevokeInventoryItem = RevokeInventoryItem,
	RevokeInventoryItems = RevokeInventoryItems,
	SetFriendTags = SetFriendTags,
	SetPlayerSecret = SetPlayerSecret,
	SetPublisherData = SetPublisherData,
	SetTitleData = SetTitleData,
	SetTitleInternalData = SetTitleInternalData,
	SubtractCharacterVirtualCurrency = SubtractCharacterVirtualCurrency,
	SubtractUserVirtualCurrency = SubtractUserVirtualCurrency,
	UnlinkServerCustomId = UnlinkServerCustomId,
	UnlockContainerItem = UnlockContainerItem,
	UpdateAvatarUrl = UpdateAvatarUrl,
	UpdateBans = UpdateBans,
	UpdateCharacterData = UpdateCharacterData,
	UpdateCharacterInternalData = UpdateCharacterInternalData,
	UpdateCharacterReadOnlyData = UpdateCharacterReadOnlyData,
	UpdateCharacterStatistics = UpdateCharacterStatistics,
	UpdatePlayerStatistics = UpdatePlayerStatistics,
	UpdateSharedGroupData = UpdateSharedGroupData,
	UpdateUserData = UpdateUserData,
	UpdateUserInternalData = UpdateUserInternalData,
	UpdateUserInventoryItemCustomData = UpdateUserInventoryItemCustomData,
	UpdateUserPublisherData = UpdateUserPublisherData,
	UpdateUserPublisherInternalData = UpdateUserPublisherInternalData,
	UpdateUserPublisherReadOnlyData = UpdateUserPublisherReadOnlyData,
	UpdateUserReadOnlyData = UpdateUserReadOnlyData,
	WriteCharacterEvent = WriteCharacterEvent,
	WritePlayerEvent = WritePlayerEvent,
	WriteTitleEvent = WriteTitleEvent,
}