-- Compiled with https://roblox-ts.github.io v0.3.2
-- August 19, 2020, 6:00 PM British Summer Time

local TS = _G[script];
local exports = {};
local MakeRequest = TS.import(script, script.Parent, "HTTP").default;
local Settings = TS.import(script, script.Parent, "Settings").default;
local _0 = TS.import(script, script.Parent, "PlayFab");
local PlayerData, IsClientLoggedIn = _0.PlayerData, _0.IsClientLoggedIn;
local AcceptTrade = TS.async(function(player, request)
	local data = PlayerData[player];
	if (not (IsClientLoggedIn(player))) or (not (data)) then
		error('Must be logged in to call this method');
	end;
	local result = TS.await(MakeRequest('/Client/AcceptTrade', request, 'X-Authorization', data.SessionTicket));
	return result;
end);
local AddFriend = TS.async(function(player, request)
	local data = PlayerData[player];
	if (not (IsClientLoggedIn(player))) or (not (data)) then
		error('Must be logged in to call this method');
	end;
	local result = TS.await(MakeRequest('/Client/AddFriend', request, 'X-Authorization', data.SessionTicket));
	return result;
end);
local AddGenericID = TS.async(function(player, request)
	local data = PlayerData[player];
	if (not (IsClientLoggedIn(player))) or (not (data)) then
		error('Must be logged in to call this method');
	end;
	local result = TS.await(MakeRequest('/Client/AddGenericID', request, 'X-Authorization', data.SessionTicket));
	return result;
end);
local AddSharedGroupMembers = TS.async(function(player, request)
	local data = PlayerData[player];
	if (not (IsClientLoggedIn(player))) or (not (data)) then
		error('Must be logged in to call this method');
	end;
	local result = TS.await(MakeRequest('/Client/AddSharedGroupMembers', request, 'X-Authorization', data.SessionTicket));
	return result;
end);
local AddUserVirtualCurrency = TS.async(function(player, request)
	local data = PlayerData[player];
	if (not (IsClientLoggedIn(player))) or (not (data)) then
		error('Must be logged in to call this method');
	end;
	local result = TS.await(MakeRequest('/Client/AddUserVirtualCurrency', request, 'X-Authorization', data.SessionTicket));
	return result;
end);
local CancelTrade = TS.async(function(player, request)
	local data = PlayerData[player];
	if (not (IsClientLoggedIn(player))) or (not (data)) then
		error('Must be logged in to call this method');
	end;
	local result = TS.await(MakeRequest('/Client/CancelTrade', request, 'X-Authorization', data.SessionTicket));
	return result;
end);
local ConfirmPurchase = TS.async(function(player, request)
	local data = PlayerData[player];
	if (not (IsClientLoggedIn(player))) or (not (data)) then
		error('Must be logged in to call this method');
	end;
	local result = TS.await(MakeRequest('/Client/ConfirmPurchase', request, 'X-Authorization', data.SessionTicket));
	return result;
end);
local ConsumeItem = TS.async(function(player, request)
	local data = PlayerData[player];
	if (not (IsClientLoggedIn(player))) or (not (data)) then
		error('Must be logged in to call this method');
	end;
	local result = TS.await(MakeRequest('/Client/ConsumeItem', request, 'X-Authorization', data.SessionTicket));
	return result;
end);
local CreateSharedGroup = TS.async(function(player, request)
	local data = PlayerData[player];
	if (not (IsClientLoggedIn(player))) or (not (data)) then
		error('Must be logged in to call this method');
	end;
	local result = TS.await(MakeRequest('/Client/CreateSharedGroup', request, 'X-Authorization', data.SessionTicket));
	return result;
end);
local ExecuteCloudScript = TS.async(function(player, request)
	local data = PlayerData[player];
	if (not (IsClientLoggedIn(player))) or (not (data)) then
		error('Must be logged in to call this method');
	end;
	local result = TS.await(MakeRequest('/Client/ExecuteCloudScript', request, 'X-Authorization', data.SessionTicket));
	return result;
end);
local GetAccountInfo = TS.async(function(player, request)
	local data = PlayerData[player];
	if (not (IsClientLoggedIn(player))) or (not (data)) then
		error('Must be logged in to call this method');
	end;
	local result = TS.await(MakeRequest('/Client/GetAccountInfo', request, 'X-Authorization', data.SessionTicket));
	return result;
end);
local GetAllUsersCharacters = TS.async(function(player, request)
	local data = PlayerData[player];
	if (not (IsClientLoggedIn(player))) or (not (data)) then
		error('Must be logged in to call this method');
	end;
	local result = TS.await(MakeRequest('/Client/GetAllUsersCharacters', request, 'X-Authorization', data.SessionTicket));
	return result;
end);
local GetCatalogItems = TS.async(function(player, request)
	local data = PlayerData[player];
	if (not (IsClientLoggedIn(player))) or (not (data)) then
		error('Must be logged in to call this method');
	end;
	local result = TS.await(MakeRequest('/Client/GetCatalogItems', request, 'X-Authorization', data.SessionTicket));
	return result;
end);
local GetCharacterData = TS.async(function(player, request)
	local data = PlayerData[player];
	if (not (IsClientLoggedIn(player))) or (not (data)) then
		error('Must be logged in to call this method');
	end;
	local result = TS.await(MakeRequest('/Client/GetCharacterData', request, 'X-Authorization', data.SessionTicket));
	return result;
end);
local GetCharacterInventory = TS.async(function(player, request)
	local data = PlayerData[player];
	if (not (IsClientLoggedIn(player))) or (not (data)) then
		error('Must be logged in to call this method');
	end;
	local result = TS.await(MakeRequest('/Client/GetCharacterInventory', request, 'X-Authorization', data.SessionTicket));
	return result;
end);
local GetCharacterLeaderboard = TS.async(function(player, request)
	local data = PlayerData[player];
	if (not (IsClientLoggedIn(player))) or (not (data)) then
		error('Must be logged in to call this method');
	end;
	local result = TS.await(MakeRequest('/Client/GetCharacterLeaderboard', request, 'X-Authorization', data.SessionTicket));
	return result;
end);
local GetCharacterReadOnlyData = TS.async(function(player, request)
	local data = PlayerData[player];
	if (not (IsClientLoggedIn(player))) or (not (data)) then
		error('Must be logged in to call this method');
	end;
	local result = TS.await(MakeRequest('/Client/GetCharacterReadOnlyData', request, 'X-Authorization', data.SessionTicket));
	return result;
end);
local GetCharacterStatistics = TS.async(function(player, request)
	local data = PlayerData[player];
	if (not (IsClientLoggedIn(player))) or (not (data)) then
		error('Must be logged in to call this method');
	end;
	local result = TS.await(MakeRequest('/Client/GetCharacterStatistics', request, 'X-Authorization', data.SessionTicket));
	return result;
end);
local GetContentDownloadUrl = TS.async(function(player, request)
	local data = PlayerData[player];
	if (not (IsClientLoggedIn(player))) or (not (data)) then
		error('Must be logged in to call this method');
	end;
	local result = TS.await(MakeRequest('/Client/GetContentDownloadUrl', request, 'X-Authorization', data.SessionTicket));
	return result;
end);
local GetFriendLeaderboard = TS.async(function(player, request)
	local data = PlayerData[player];
	if (not (IsClientLoggedIn(player))) or (not (data)) then
		error('Must be logged in to call this method');
	end;
	local result = TS.await(MakeRequest('/Client/GetFriendLeaderboard', request, 'X-Authorization', data.SessionTicket));
	return result;
end);
local GetFriendLeaderboardAroundPlayer = TS.async(function(player, request)
	local data = PlayerData[player];
	if (not (IsClientLoggedIn(player))) or (not (data)) then
		error('Must be logged in to call this method');
	end;
	local result = TS.await(MakeRequest('/Client/GetFriendLeaderboardAroundPlayer', request, 'X-Authorization', data.SessionTicket));
	return result;
end);
local GetFriendsList = TS.async(function(player, request)
	local data = PlayerData[player];
	if (not (IsClientLoggedIn(player))) or (not (data)) then
		error('Must be logged in to call this method');
	end;
	local result = TS.await(MakeRequest('/Client/GetFriendsList', request, 'X-Authorization', data.SessionTicket));
	return result;
end);
local GetLeaderboard = TS.async(function(player, request)
	local data = PlayerData[player];
	if (not (IsClientLoggedIn(player))) or (not (data)) then
		error('Must be logged in to call this method');
	end;
	local result = TS.await(MakeRequest('/Client/GetLeaderboard', request, 'X-Authorization', data.SessionTicket));
	return result;
end);
local GetLeaderboardAroundCharacter = TS.async(function(player, request)
	local data = PlayerData[player];
	if (not (IsClientLoggedIn(player))) or (not (data)) then
		error('Must be logged in to call this method');
	end;
	local result = TS.await(MakeRequest('/Client/GetLeaderboardAroundCharacter', request, 'X-Authorization', data.SessionTicket));
	return result;
end);
local GetLeaderboardAroundPlayer = TS.async(function(player, request)
	local data = PlayerData[player];
	if (not (IsClientLoggedIn(player))) or (not (data)) then
		error('Must be logged in to call this method');
	end;
	local result = TS.await(MakeRequest('/Client/GetLeaderboardAroundPlayer', request, 'X-Authorization', data.SessionTicket));
	return result;
end);
local GetPlayerCombinedInfo = TS.async(function(player, request)
	local data = PlayerData[player];
	if (not (IsClientLoggedIn(player))) or (not (data)) then
		error('Must be logged in to call this method');
	end;
	local result = TS.await(MakeRequest('/Client/GetPlayerCombinedInfo', request, 'X-Authorization', data.SessionTicket));
	return result;
end);
local GetPlayerProfile = TS.async(function(player, request)
	local data = PlayerData[player];
	if (not (IsClientLoggedIn(player))) or (not (data)) then
		error('Must be logged in to call this method');
	end;
	local result = TS.await(MakeRequest('/Client/GetPlayerProfile', request, 'X-Authorization', data.SessionTicket));
	return result;
end);
local GetPlayerSegments = TS.async(function(player, request)
	local data = PlayerData[player];
	if (not (IsClientLoggedIn(player))) or (not (data)) then
		error('Must be logged in to call this method');
	end;
	local result = TS.await(MakeRequest('/Client/GetPlayerSegments', request, 'X-Authorization', data.SessionTicket));
	return result;
end);
local GetPlayerStatistics = TS.async(function(player, request)
	local data = PlayerData[player];
	if (not (IsClientLoggedIn(player))) or (not (data)) then
		error('Must be logged in to call this method');
	end;
	local result = TS.await(MakeRequest('/Client/GetPlayerStatistics', request, 'X-Authorization', data.SessionTicket));
	return result;
end);
local GetPlayerStatisticVersions = TS.async(function(player, request)
	local data = PlayerData[player];
	if (not (IsClientLoggedIn(player))) or (not (data)) then
		error('Must be logged in to call this method');
	end;
	local result = TS.await(MakeRequest('/Client/GetPlayerStatisticVersions', request, 'X-Authorization', data.SessionTicket));
	return result;
end);
local GetPlayerTags = TS.async(function(player, request)
	local data = PlayerData[player];
	if (not (IsClientLoggedIn(player))) or (not (data)) then
		error('Must be logged in to call this method');
	end;
	local result = TS.await(MakeRequest('/Client/GetPlayerTags', request, 'X-Authorization', data.SessionTicket));
	return result;
end);
local GetPlayerTrades = TS.async(function(player, request)
	local data = PlayerData[player];
	if (not (IsClientLoggedIn(player))) or (not (data)) then
		error('Must be logged in to call this method');
	end;
	local result = TS.await(MakeRequest('/Client/GetPlayerTrades', request, 'X-Authorization', data.SessionTicket));
	return result;
end);
local GetPlayFabIDsFromGenericIDs = TS.async(function(player, request)
	local data = PlayerData[player];
	if (not (IsClientLoggedIn(player))) or (not (data)) then
		error('Must be logged in to call this method');
	end;
	local result = TS.await(MakeRequest('/Client/GetPlayFabIDsFromGenericIDs', request, 'X-Authorization', data.SessionTicket));
	return result;
end);
local GetPublisherData = TS.async(function(player, request)
	local data = PlayerData[player];
	if (not (IsClientLoggedIn(player))) or (not (data)) then
		error('Must be logged in to call this method');
	end;
	local result = TS.await(MakeRequest('/Client/GetPublisherData', request, 'X-Authorization', data.SessionTicket));
	return result;
end);
local GetPurchase = TS.async(function(player, request)
	local data = PlayerData[player];
	if (not (IsClientLoggedIn(player))) or (not (data)) then
		error('Must be logged in to call this method');
	end;
	local result = TS.await(MakeRequest('/Client/GetPurchase', request, 'X-Authorization', data.SessionTicket));
	return result;
end);
local GetSharedGroupData = TS.async(function(player, request)
	local data = PlayerData[player];
	if (not (IsClientLoggedIn(player))) or (not (data)) then
		error('Must be logged in to call this method');
	end;
	local result = TS.await(MakeRequest('/Client/GetSharedGroupData', request, 'X-Authorization', data.SessionTicket));
	return result;
end);
local GetStoreItems = TS.async(function(player, request)
	local data = PlayerData[player];
	if (not (IsClientLoggedIn(player))) or (not (data)) then
		error('Must be logged in to call this method');
	end;
	local result = TS.await(MakeRequest('/Client/GetStoreItems', request, 'X-Authorization', data.SessionTicket));
	return result;
end);
local GetTime = TS.async(function(player, request)
	local data = PlayerData[player];
	if (not (IsClientLoggedIn(player))) or (not (data)) then
		error('Must be logged in to call this method');
	end;
	local result = TS.await(MakeRequest('/Client/GetTime', request, 'X-Authorization', data.SessionTicket));
	return result;
end);
local GetTitleData = TS.async(function(player, request)
	local data = PlayerData[player];
	if (not (IsClientLoggedIn(player))) or (not (data)) then
		error('Must be logged in to call this method');
	end;
	local result = TS.await(MakeRequest('/Client/GetTitleData', request, 'X-Authorization', data.SessionTicket));
	return result;
end);
local GetTitleNews = TS.async(function(player, request)
	local data = PlayerData[player];
	if (not (IsClientLoggedIn(player))) or (not (data)) then
		error('Must be logged in to call this method');
	end;
	local result = TS.await(MakeRequest('/Client/GetTitleNews', request, 'X-Authorization', data.SessionTicket));
	return result;
end);
local GetTitlePublicKey = TS.async(function(player, request)
	local data = PlayerData[player];
	if (not (IsClientLoggedIn(player))) or (not (data)) then
		error('Must be logged in to call this method');
	end;
	local result = TS.await(MakeRequest('/Client/GetTitlePublicKey', request, 'X-Authorization', data.SessionTicket));
	return result;
end);
local GetTradeStatus = TS.async(function(player, request)
	local data = PlayerData[player];
	if (not (IsClientLoggedIn(player))) or (not (data)) then
		error('Must be logged in to call this method');
	end;
	local result = TS.await(MakeRequest('/Client/GetTradeStatus', request, 'X-Authorization', data.SessionTicket));
	return result;
end);
local GetUserData = TS.async(function(player, request)
	local data = PlayerData[player];
	if (not (IsClientLoggedIn(player))) or (not (data)) then
		error('Must be logged in to call this method');
	end;
	local result = TS.await(MakeRequest('/Client/GetUserData', request, 'X-Authorization', data.SessionTicket));
	return result;
end);
local GetUserInventory = TS.async(function(player, request)
	local data = PlayerData[player];
	if (not (IsClientLoggedIn(player))) or (not (data)) then
		error('Must be logged in to call this method');
	end;
	local result = TS.await(MakeRequest('/Client/GetUserInventory', request, 'X-Authorization', data.SessionTicket));
	return result;
end);
local GetUserPublisherData = TS.async(function(player, request)
	local data = PlayerData[player];
	if (not (IsClientLoggedIn(player))) or (not (data)) then
		error('Must be logged in to call this method');
	end;
	local result = TS.await(MakeRequest('/Client/GetUserPublisherData', request, 'X-Authorization', data.SessionTicket));
	return result;
end);
local GetUserPublisherReadOnlyData = TS.async(function(player, request)
	local data = PlayerData[player];
	if (not (IsClientLoggedIn(player))) or (not (data)) then
		error('Must be logged in to call this method');
	end;
	local result = TS.await(MakeRequest('/Client/GetUserPublisherReadOnlyData', request, 'X-Authorization', data.SessionTicket));
	return result;
end);
local GetUserReadOnlyData = TS.async(function(player, request)
	local data = PlayerData[player];
	if (not (IsClientLoggedIn(player))) or (not (data)) then
		error('Must be logged in to call this method');
	end;
	local result = TS.await(MakeRequest('/Client/GetUserReadOnlyData', request, 'X-Authorization', data.SessionTicket));
	return result;
end);
local GrantCharacterToUser = TS.async(function(player, request)
	local data = PlayerData[player];
	if (not (IsClientLoggedIn(player))) or (not (data)) then
		error('Must be logged in to call this method');
	end;
	local result = TS.await(MakeRequest('/Client/GrantCharacterToUser', request, 'X-Authorization', data.SessionTicket));
	return result;
end);
local LinkCustomID = TS.async(function(player, request)
	local data = PlayerData[player];
	if (not (IsClientLoggedIn(player))) or (not (data)) then
		error('Must be logged in to call this method');
	end;
	local result = TS.await(MakeRequest('/Client/LinkCustomID', request, 'X-Authorization', data.SessionTicket));
	return result;
end);
local LoginWithCustomID = TS.async(function(player, request)
	local _1 = request.TitleId;
	if not (_1 ~= "" and _1) then
		request.TitleId = Settings.settings.titleId;
	end;
	local _2 = request.TitleId;
	if not (_2 ~= "" and _2) then
		error('Must be have settings.titleId set to call this method');
	end;
	local result = TS.await(MakeRequest('/Client/LoginWithCustomID', request));
	local _3 = result.SessionTicket;
	if not (_3 ~= "" and _3) then
		error('No session ticket');
	end;
	local _5 = not (result.EntityToken);
	if not (_5) then
		local _4 = result.EntityToken.EntityToken;
		_5 = not (_4 ~= "" and _4);
	end;
	local _7 = _5;
	if not (_7) then
		local _6 = result.EntityToken.TokenExpiration;
		_7 = not (_6 ~= "" and _6);
	end;
	if _7 then
		error('No entity token');
	end;
	PlayerData[player] = {
		SessionTicket = result.SessionTicket;
		EntityToken = result.EntityToken.EntityToken;
		TokenExpiration = result.EntityToken.TokenExpiration;
	};
end);
local Matchmake = TS.async(function(player, request)
	local data = PlayerData[player];
	if (not (IsClientLoggedIn(player))) or (not (data)) then
		error('Must be logged in to call this method');
	end;
	local result = TS.await(MakeRequest('/Client/Matchmake', request, 'X-Authorization', data.SessionTicket));
	return result;
end);
local OpenTrade = TS.async(function(player, request)
	local data = PlayerData[player];
	if (not (IsClientLoggedIn(player))) or (not (data)) then
		error('Must be logged in to call this method');
	end;
	local result = TS.await(MakeRequest('/Client/OpenTrade', request, 'X-Authorization', data.SessionTicket));
	return result;
end);
local PayForPurchase = TS.async(function(player, request)
	local data = PlayerData[player];
	if (not (IsClientLoggedIn(player))) or (not (data)) then
		error('Must be logged in to call this method');
	end;
	local result = TS.await(MakeRequest('/Client/PayForPurchase', request, 'X-Authorization', data.SessionTicket));
	return result;
end);
local PurchaseItem = TS.async(function(player, request)
	local data = PlayerData[player];
	if (not (IsClientLoggedIn(player))) or (not (data)) then
		error('Must be logged in to call this method');
	end;
	local result = TS.await(MakeRequest('/Client/PurchaseItem', request, 'X-Authorization', data.SessionTicket));
	return result;
end);
local RedeemCoupon = TS.async(function(player, request)
	local data = PlayerData[player];
	if (not (IsClientLoggedIn(player))) or (not (data)) then
		error('Must be logged in to call this method');
	end;
	local result = TS.await(MakeRequest('/Client/RedeemCoupon', request, 'X-Authorization', data.SessionTicket));
	return result;
end);
local RemoveFriend = TS.async(function(player, request)
	local data = PlayerData[player];
	if (not (IsClientLoggedIn(player))) or (not (data)) then
		error('Must be logged in to call this method');
	end;
	local result = TS.await(MakeRequest('/Client/RemoveFriend', request, 'X-Authorization', data.SessionTicket));
	return result;
end);
local RemoveGenericID = TS.async(function(player, request)
	local data = PlayerData[player];
	if (not (IsClientLoggedIn(player))) or (not (data)) then
		error('Must be logged in to call this method');
	end;
	local result = TS.await(MakeRequest('/Client/RemoveGenericID', request, 'X-Authorization', data.SessionTicket));
	return result;
end);
local RemoveSharedGroupMembers = TS.async(function(player, request)
	local data = PlayerData[player];
	if (not (IsClientLoggedIn(player))) or (not (data)) then
		error('Must be logged in to call this method');
	end;
	local result = TS.await(MakeRequest('/Client/RemoveSharedGroupMembers', request, 'X-Authorization', data.SessionTicket));
	return result;
end);
local ReportPlayer = TS.async(function(player, request)
	local data = PlayerData[player];
	if (not (IsClientLoggedIn(player))) or (not (data)) then
		error('Must be logged in to call this method');
	end;
	local result = TS.await(MakeRequest('/Client/ReportPlayer', request, 'X-Authorization', data.SessionTicket));
	return result;
end);
local SetFriendTags = TS.async(function(player, request)
	local data = PlayerData[player];
	if (not (IsClientLoggedIn(player))) or (not (data)) then
		error('Must be logged in to call this method');
	end;
	local result = TS.await(MakeRequest('/Client/SetFriendTags', request, 'X-Authorization', data.SessionTicket));
	return result;
end);
local SetPlayerSecret = TS.async(function(player, request)
	local data = PlayerData[player];
	if (not (IsClientLoggedIn(player))) or (not (data)) then
		error('Must be logged in to call this method');
	end;
	local result = TS.await(MakeRequest('/Client/SetPlayerSecret', request, 'X-Authorization', data.SessionTicket));
	return result;
end);
local StartPurchase = TS.async(function(player, request)
	local data = PlayerData[player];
	if (not (IsClientLoggedIn(player))) or (not (data)) then
		error('Must be logged in to call this method');
	end;
	local result = TS.await(MakeRequest('/Client/StartPurchase', request, 'X-Authorization', data.SessionTicket));
	return result;
end);
local SubtractUserVirtualCurrency = TS.async(function(player, request)
	local data = PlayerData[player];
	if (not (IsClientLoggedIn(player))) or (not (data)) then
		error('Must be logged in to call this method');
	end;
	local result = TS.await(MakeRequest('/Client/SubtractUserVirtualCurrency', request, 'X-Authorization', data.SessionTicket));
	return result;
end);
local UnlinkCustomID = TS.async(function(player, request)
	local data = PlayerData[player];
	if (not (IsClientLoggedIn(player))) or (not (data)) then
		error('Must be logged in to call this method');
	end;
	local result = TS.await(MakeRequest('/Client/UnlinkCustomID', request, 'X-Authorization', data.SessionTicket));
	return result;
end);
local UnlockContainerInstance = TS.async(function(player, request)
	local data = PlayerData[player];
	if (not (IsClientLoggedIn(player))) or (not (data)) then
		error('Must be logged in to call this method');
	end;
	local result = TS.await(MakeRequest('/Client/UnlockContainerInstance', request, 'X-Authorization', data.SessionTicket));
	return result;
end);
local UnlockContainerItem = TS.async(function(player, request)
	local data = PlayerData[player];
	if (not (IsClientLoggedIn(player))) or (not (data)) then
		error('Must be logged in to call this method');
	end;
	local result = TS.await(MakeRequest('/Client/UnlockContainerItem', request, 'X-Authorization', data.SessionTicket));
	return result;
end);
local UpdateAvatarUrl = TS.async(function(player, request)
	local data = PlayerData[player];
	if (not (IsClientLoggedIn(player))) or (not (data)) then
		error('Must be logged in to call this method');
	end;
	local result = TS.await(MakeRequest('/Client/UpdateAvatarUrl', request, 'X-Authorization', data.SessionTicket));
	return result;
end);
local UpdateCharacterData = TS.async(function(player, request)
	local data = PlayerData[player];
	if (not (IsClientLoggedIn(player))) or (not (data)) then
		error('Must be logged in to call this method');
	end;
	local result = TS.await(MakeRequest('/Client/UpdateCharacterData', request, 'X-Authorization', data.SessionTicket));
	return result;
end);
local UpdateCharacterStatistics = TS.async(function(player, request)
	local data = PlayerData[player];
	if (not (IsClientLoggedIn(player))) or (not (data)) then
		error('Must be logged in to call this method');
	end;
	local result = TS.await(MakeRequest('/Client/UpdateCharacterStatistics', request, 'X-Authorization', data.SessionTicket));
	return result;
end);
local UpdatePlayerStatistics = TS.async(function(player, request)
	local data = PlayerData[player];
	if (not (IsClientLoggedIn(player))) or (not (data)) then
		error('Must be logged in to call this method');
	end;
	local result = TS.await(MakeRequest('/Client/UpdatePlayerStatistics', request, 'X-Authorization', data.SessionTicket));
	return result;
end);
local UpdateSharedGroupData = TS.async(function(player, request)
	local data = PlayerData[player];
	if (not (IsClientLoggedIn(player))) or (not (data)) then
		error('Must be logged in to call this method');
	end;
	local result = TS.await(MakeRequest('/Client/UpdateSharedGroupData', request, 'X-Authorization', data.SessionTicket));
	return result;
end);
local UpdateUserData = TS.async(function(player, request)
	local data = PlayerData[player];
	if (not (IsClientLoggedIn(player))) or (not (data)) then
		error('Must be logged in to call this method');
	end;
	local result = TS.await(MakeRequest('/Client/UpdateUserData', request, 'X-Authorization', data.SessionTicket));
	return result;
end);
local UpdateUserPublisherData = TS.async(function(player, request)
	local data = PlayerData[player];
	if (not (IsClientLoggedIn(player))) or (not (data)) then
		error('Must be logged in to call this method');
	end;
	local result = TS.await(MakeRequest('/Client/UpdateUserPublisherData', request, 'X-Authorization', data.SessionTicket));
	return result;
end);
local UpdateUserTitleDisplayName = TS.async(function(player, request)
	local data = PlayerData[player];
	if (not (IsClientLoggedIn(player))) or (not (data)) then
		error('Must be logged in to call this method');
	end;
	local result = TS.await(MakeRequest('/Client/UpdateUserTitleDisplayName', request, 'X-Authorization', data.SessionTicket));
	return result;
end);
local WriteCharacterEvent = TS.async(function(player, request)
	local data = PlayerData[player];
	if (not (IsClientLoggedIn(player))) or (not (data)) then
		error('Must be logged in to call this method');
	end;
	local result = TS.await(MakeRequest('/Client/WriteCharacterEvent', request, 'X-Authorization', data.SessionTicket));
	return result;
end);
local WritePlayerEvent = TS.async(function(player, request)
	local data = PlayerData[player];
	if (not (IsClientLoggedIn(player))) or (not (data)) then
		error('Must be logged in to call this method');
	end;
	local result = TS.await(MakeRequest('/Client/WritePlayerEvent', request, 'X-Authorization', data.SessionTicket));
	return result;
end);
local WriteTitleEvent = TS.async(function(player, request)
	local data = PlayerData[player];
	if (not (IsClientLoggedIn(player))) or (not (data)) then
		error('Must be logged in to call this method');
	end;
	local result = TS.await(MakeRequest('/Client/WriteTitleEvent', request, 'X-Authorization', data.SessionTicket));
	return result;
end);
exports.AcceptTrade = AcceptTrade;
exports.AddFriend = AddFriend;
exports.AddGenericID = AddGenericID;
exports.AddSharedGroupMembers = AddSharedGroupMembers;
exports.AddUserVirtualCurrency = AddUserVirtualCurrency;
exports.CancelTrade = CancelTrade;
exports.ConfirmPurchase = ConfirmPurchase;
exports.ConsumeItem = ConsumeItem;
exports.CreateSharedGroup = CreateSharedGroup;
exports.ExecuteCloudScript = ExecuteCloudScript;
exports.GetAccountInfo = GetAccountInfo;
exports.GetAllUsersCharacters = GetAllUsersCharacters;
exports.GetCatalogItems = GetCatalogItems;
exports.GetCharacterData = GetCharacterData;
exports.GetCharacterInventory = GetCharacterInventory;
exports.GetCharacterLeaderboard = GetCharacterLeaderboard;
exports.GetCharacterReadOnlyData = GetCharacterReadOnlyData;
exports.GetCharacterStatistics = GetCharacterStatistics;
exports.GetContentDownloadUrl = GetContentDownloadUrl;
exports.GetFriendLeaderboard = GetFriendLeaderboard;
exports.GetFriendLeaderboardAroundPlayer = GetFriendLeaderboardAroundPlayer;
exports.GetFriendsList = GetFriendsList;
exports.GetLeaderboard = GetLeaderboard;
exports.GetLeaderboardAroundCharacter = GetLeaderboardAroundCharacter;
exports.GetLeaderboardAroundPlayer = GetLeaderboardAroundPlayer;
exports.GetPlayerCombinedInfo = GetPlayerCombinedInfo;
exports.GetPlayerProfile = GetPlayerProfile;
exports.GetPlayerSegments = GetPlayerSegments;
exports.GetPlayerStatistics = GetPlayerStatistics;
exports.GetPlayerStatisticVersions = GetPlayerStatisticVersions;
exports.GetPlayerTags = GetPlayerTags;
exports.GetPlayerTrades = GetPlayerTrades;
exports.GetPlayFabIDsFromGenericIDs = GetPlayFabIDsFromGenericIDs;
exports.GetPublisherData = GetPublisherData;
exports.GetPurchase = GetPurchase;
exports.GetSharedGroupData = GetSharedGroupData;
exports.GetStoreItems = GetStoreItems;
exports.GetTime = GetTime;
exports.GetTitleData = GetTitleData;
exports.GetTitleNews = GetTitleNews;
exports.GetTitlePublicKey = GetTitlePublicKey;
exports.GetTradeStatus = GetTradeStatus;
exports.GetUserData = GetUserData;
exports.GetUserInventory = GetUserInventory;
exports.GetUserPublisherData = GetUserPublisherData;
exports.GetUserPublisherReadOnlyData = GetUserPublisherReadOnlyData;
exports.GetUserReadOnlyData = GetUserReadOnlyData;
exports.GrantCharacterToUser = GrantCharacterToUser;
exports.LinkCustomID = LinkCustomID;
exports.LoginWithCustomID = LoginWithCustomID;
exports.Matchmake = Matchmake;
exports.OpenTrade = OpenTrade;
exports.PayForPurchase = PayForPurchase;
exports.PurchaseItem = PurchaseItem;
exports.RedeemCoupon = RedeemCoupon;
exports.RemoveFriend = RemoveFriend;
exports.RemoveGenericID = RemoveGenericID;
exports.RemoveSharedGroupMembers = RemoveSharedGroupMembers;
exports.ReportPlayer = ReportPlayer;
exports.SetFriendTags = SetFriendTags;
exports.SetPlayerSecret = SetPlayerSecret;
exports.StartPurchase = StartPurchase;
exports.SubtractUserVirtualCurrency = SubtractUserVirtualCurrency;
exports.UnlinkCustomID = UnlinkCustomID;
exports.UnlockContainerInstance = UnlockContainerInstance;
exports.UnlockContainerItem = UnlockContainerItem;
exports.UpdateAvatarUrl = UpdateAvatarUrl;
exports.UpdateCharacterData = UpdateCharacterData;
exports.UpdateCharacterStatistics = UpdateCharacterStatistics;
exports.UpdatePlayerStatistics = UpdatePlayerStatistics;
exports.UpdateSharedGroupData = UpdateSharedGroupData;
exports.UpdateUserData = UpdateUserData;
exports.UpdateUserPublisherData = UpdateUserPublisherData;
exports.UpdateUserTitleDisplayName = UpdateUserTitleDisplayName;
exports.WriteCharacterEvent = WriteCharacterEvent;
exports.WritePlayerEvent = WritePlayerEvent;
exports.WriteTitleEvent = WriteTitleEvent;
return exports;
