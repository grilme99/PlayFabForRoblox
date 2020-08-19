-- Compiled with https://roblox-ts.github.io v0.3.2
-- August 19, 2020, 6:12 PM British Summer Time

local TS = _G[script];
local exports = {};
local MakeRequest = TS.import(script, script.Parent, "HTTP").default;
local Settings = TS.import(script, script.Parent, "Settings").default;
local AddCharacterVirtualCurrency = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Server/AddCharacterVirtualCurrency', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local AddFriend = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Server/AddFriend', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local AddGenericID = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Server/AddGenericID', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local AddPlayerTag = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Server/AddPlayerTag', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local AddSharedGroupMembers = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Server/AddSharedGroupMembers', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local AddUserVirtualCurrency = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Server/AddUserVirtualCurrency', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local AuthenticateSessionTicket = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Server/AuthenticateSessionTicket', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local BanUsers = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Server/BanUsers', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local ConsumeItem = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Server/ConsumeItem', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local CreateSharedGroup = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Server/CreateSharedGroup', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local DeleteCharacterFromUser = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Server/DeleteCharacterFromUser', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local DeletePlayer = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Server/DeletePlayer', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local DeleteSharedGroup = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Server/DeleteSharedGroup', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local DeregisterGame = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Server/DeregisterGame', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local EvaluateRandomResultTable = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Server/EvaluateRandomResultTable', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local ExecuteCloudScript = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Server/ExecuteCloudScript', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local GetAllSegments = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Server/GetAllSegments', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local GetAllUsersCharacters = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Server/GetAllUsersCharacters', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local GetCatalogItems = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Server/GetCatalogItems', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local GetCharacterData = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Server/GetCharacterData', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local GetCharacterInternalData = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Server/GetCharacterInternalData', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local GetCharacterInventory = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Server/GetCharacterInventory', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local GetCharacterLeaderboard = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Server/GetCharacterLeaderboard', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local GetCharacterReadOnlyData = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Server/GetCharacterReadOnlyData', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local GetCharacterStatistics = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Server/GetCharacterStatistics', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local GetContentDownloadUrl = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Server/GetContentDownloadUrl', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local GetFriendLeaderboard = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Server/GetFriendLeaderboard', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local GetFriendsList = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Server/GetFriendsList', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local GetLeaderboard = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Server/GetLeaderboard', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local GetLeaderboardAroundCharacter = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Server/GetLeaderboardAroundCharacter', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local GetLeaderboardForUserCharacters = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Server/GetLeaderboardForUserCharacters', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local GetPlayerCombinedInfo = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Server/GetPlayerCombinedInfo', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local GetPlayerProfile = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Server/GetPlayerProfile', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local GetPlayerSegments = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Server/GetPlayerSegments', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local GetPlayersInSegment = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Server/GetPlayersInSegment', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local GetPlayerStatistics = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Server/GetPlayerStatistics', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local GetPlayerStatisticVersions = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Server/GetPlayerStatisticVersions', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local GetPlayerTags = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Server/GetPlayerTags', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local GetPlayFabIDsFromGenericIDs = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Server/GetPlayFabIDsFromGenericIDs', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local GetPublisherData = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Server/GetPublisherData', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local GetRandomResultTables = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Server/GetRandomResultTables', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local GetServerCustomIDsFromPlayFabIDs = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Server/GetServerCustomIDsFromPlayFabIDs', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local GetSharedGroupData = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Server/GetSharedGroupData', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local GetStoreItems = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Server/GetStoreItems', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local GetTime = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Server/GetTime', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local GetTitleData = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Server/GetTitleData', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local GetTitleInternalData = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Server/GetTitleInternalData', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local GetTitleNews = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Server/GetTitleNews', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local GetUserAccountInfo = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Server/GetUserAccountInfo', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local GetUserBans = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Server/GetUserBans', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local GetUserData = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Server/GetUserData', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local GetUserInternalData = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Server/GetUserInternalData', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local GetUserInventory = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Server/GetUserInventory', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local GetUserPublisherData = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Server/GetUserPublisherData', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local GetUserPublisherInternalData = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Server/GetUserPublisherInternalData', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local GetUserPublisherReadOnlyData = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Server/GetUserPublisherReadOnlyData', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local GetUserReadOnlyData = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Server/GetUserReadOnlyData', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local GrantCharacterToUser = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Server/GrantCharacterToUser', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local GrantItemsToCharacter = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Server/GrantItemsToCharacter', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local GrantItemsToUser = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Server/GrantItemsToUser', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local GrantItemsToUsers = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Server/GrantItemsToUsers', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local LinkServerCustomId = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Server/LinkServerCustomId', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local LoginWithServerCustomId = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Server/LoginWithServerCustomId', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local ModifyItemUses = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Server/ModifyItemUses', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local MoveItemToCharacterFromCharacter = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Server/MoveItemToCharacterFromCharacter', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local MoveItemToCharacterFromUser = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Server/MoveItemToCharacterFromUser', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local MoveItemToUserFromCharacter = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Server/MoveItemToUserFromCharacter', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local NotifyMatchmakerPlayerLeft = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Server/NotifyMatchmakerPlayerLeft', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local RedeemCoupon = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Server/RedeemCoupon', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local RedeemMatchmakerTicket = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Server/RedeemMatchmakerTicket', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local RemoveFriend = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Server/RemoveFriend', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local RemoveGenericID = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Server/RemoveGenericID', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local RemovePlayerTag = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Server/RemovePlayerTag', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local RemoveSharedGroupMembers = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Server/RemoveSharedGroupMembers', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local ReportPlayer = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Server/ReportPlayer', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local RevokeAllBansForUser = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Server/RevokeAllBansForUser', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local RevokeBans = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Server/RevokeBans', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local RevokeInventoryItem = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Server/RevokeInventoryItem', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local RevokeInventoryItems = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Server/RevokeInventoryItems', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local SetFriendTags = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Server/SetFriendTags', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local SetPlayerSecret = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Server/SetPlayerSecret', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local SetPublisherData = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Server/SetPublisherData', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local SetTitleData = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Server/SetTitleData', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local SetTitleInternalData = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Server/SetTitleInternalData', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local SubtractCharacterVirtualCurrency = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Server/SubtractCharacterVirtualCurrency', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local SubtractUserVirtualCurrency = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Server/SubtractUserVirtualCurrency', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local UnlinkServerCustomId = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Server/UnlinkServerCustomId', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local UnlockContainerItem = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Server/UnlockContainerItem', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local UpdateAvatarUrl = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Server/UpdateAvatarUrl', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local UpdateBans = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Server/UpdateBans', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local UpdateCharacterData = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Server/UpdateCharacterData', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local UpdateCharacterInternalData = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Server/UpdateCharacterInternalData', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local UpdateCharacterReadOnlyData = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Server/UpdateCharacterReadOnlyData', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local UpdateCharacterStatistics = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Server/UpdateCharacterStatistics', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local UpdatePlayerStatistics = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Server/UpdatePlayerStatistics', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local UpdateSharedGroupData = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Server/UpdateSharedGroupData', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local UpdateUserData = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Server/UpdateUserData', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local UpdateUserInternalData = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Server/UpdateUserInternalData', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local UpdateUserInventoryItemCustomData = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Server/UpdateUserInventoryItemCustomData', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local UpdateUserPublisherData = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Server/UpdateUserPublisherData', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local UpdateUserPublisherInternalData = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Server/UpdateUserPublisherInternalData', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local UpdateUserPublisherReadOnlyData = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Server/UpdateUserPublisherReadOnlyData', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local UpdateUserReadOnlyData = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Server/UpdateUserReadOnlyData', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local WriteCharacterEvent = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Server/WriteCharacterEvent', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local WritePlayerEvent = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Server/WritePlayerEvent', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local WriteTitleEvent = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Server/WriteTitleEvent', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
exports.AddCharacterVirtualCurrency = AddCharacterVirtualCurrency;
exports.AddFriend = AddFriend;
exports.AddGenericID = AddGenericID;
exports.AddPlayerTag = AddPlayerTag;
exports.AddSharedGroupMembers = AddSharedGroupMembers;
exports.AddUserVirtualCurrency = AddUserVirtualCurrency;
exports.AuthenticateSessionTicket = AuthenticateSessionTicket;
exports.BanUsers = BanUsers;
exports.ConsumeItem = ConsumeItem;
exports.CreateSharedGroup = CreateSharedGroup;
exports.DeleteCharacterFromUser = DeleteCharacterFromUser;
exports.DeletePlayer = DeletePlayer;
exports.DeleteSharedGroup = DeleteSharedGroup;
exports.DeregisterGame = DeregisterGame;
exports.EvaluateRandomResultTable = EvaluateRandomResultTable;
exports.ExecuteCloudScript = ExecuteCloudScript;
exports.GetAllSegments = GetAllSegments;
exports.GetAllUsersCharacters = GetAllUsersCharacters;
exports.GetCatalogItems = GetCatalogItems;
exports.GetCharacterData = GetCharacterData;
exports.GetCharacterInternalData = GetCharacterInternalData;
exports.GetCharacterInventory = GetCharacterInventory;
exports.GetCharacterLeaderboard = GetCharacterLeaderboard;
exports.GetCharacterReadOnlyData = GetCharacterReadOnlyData;
exports.GetCharacterStatistics = GetCharacterStatistics;
exports.GetContentDownloadUrl = GetContentDownloadUrl;
exports.GetFriendLeaderboard = GetFriendLeaderboard;
exports.GetFriendsList = GetFriendsList;
exports.GetLeaderboard = GetLeaderboard;
exports.GetLeaderboardAroundCharacter = GetLeaderboardAroundCharacter;
exports.GetLeaderboardForUserCharacters = GetLeaderboardForUserCharacters;
exports.GetPlayerCombinedInfo = GetPlayerCombinedInfo;
exports.GetPlayerProfile = GetPlayerProfile;
exports.GetPlayerSegments = GetPlayerSegments;
exports.GetPlayersInSegment = GetPlayersInSegment;
exports.GetPlayerStatistics = GetPlayerStatistics;
exports.GetPlayerStatisticVersions = GetPlayerStatisticVersions;
exports.GetPlayerTags = GetPlayerTags;
exports.GetPlayFabIDsFromGenericIDs = GetPlayFabIDsFromGenericIDs;
exports.GetPublisherData = GetPublisherData;
exports.GetRandomResultTables = GetRandomResultTables;
exports.GetServerCustomIDsFromPlayFabIDs = GetServerCustomIDsFromPlayFabIDs;
exports.GetSharedGroupData = GetSharedGroupData;
exports.GetStoreItems = GetStoreItems;
exports.GetTime = GetTime;
exports.GetTitleData = GetTitleData;
exports.GetTitleInternalData = GetTitleInternalData;
exports.GetTitleNews = GetTitleNews;
exports.GetUserAccountInfo = GetUserAccountInfo;
exports.GetUserBans = GetUserBans;
exports.GetUserData = GetUserData;
exports.GetUserInternalData = GetUserInternalData;
exports.GetUserInventory = GetUserInventory;
exports.GetUserPublisherData = GetUserPublisherData;
exports.GetUserPublisherInternalData = GetUserPublisherInternalData;
exports.GetUserPublisherReadOnlyData = GetUserPublisherReadOnlyData;
exports.GetUserReadOnlyData = GetUserReadOnlyData;
exports.GrantCharacterToUser = GrantCharacterToUser;
exports.GrantItemsToCharacter = GrantItemsToCharacter;
exports.GrantItemsToUser = GrantItemsToUser;
exports.GrantItemsToUsers = GrantItemsToUsers;
exports.LinkServerCustomId = LinkServerCustomId;
exports.LoginWithServerCustomId = LoginWithServerCustomId;
exports.ModifyItemUses = ModifyItemUses;
exports.MoveItemToCharacterFromCharacter = MoveItemToCharacterFromCharacter;
exports.MoveItemToCharacterFromUser = MoveItemToCharacterFromUser;
exports.MoveItemToUserFromCharacter = MoveItemToUserFromCharacter;
exports.NotifyMatchmakerPlayerLeft = NotifyMatchmakerPlayerLeft;
exports.RedeemCoupon = RedeemCoupon;
exports.RedeemMatchmakerTicket = RedeemMatchmakerTicket;
exports.RemoveFriend = RemoveFriend;
exports.RemoveGenericID = RemoveGenericID;
exports.RemovePlayerTag = RemovePlayerTag;
exports.RemoveSharedGroupMembers = RemoveSharedGroupMembers;
exports.ReportPlayer = ReportPlayer;
exports.RevokeAllBansForUser = RevokeAllBansForUser;
exports.RevokeBans = RevokeBans;
exports.RevokeInventoryItem = RevokeInventoryItem;
exports.RevokeInventoryItems = RevokeInventoryItems;
exports.SetFriendTags = SetFriendTags;
exports.SetPlayerSecret = SetPlayerSecret;
exports.SetPublisherData = SetPublisherData;
exports.SetTitleData = SetTitleData;
exports.SetTitleInternalData = SetTitleInternalData;
exports.SubtractCharacterVirtualCurrency = SubtractCharacterVirtualCurrency;
exports.SubtractUserVirtualCurrency = SubtractUserVirtualCurrency;
exports.UnlinkServerCustomId = UnlinkServerCustomId;
exports.UnlockContainerItem = UnlockContainerItem;
exports.UpdateAvatarUrl = UpdateAvatarUrl;
exports.UpdateBans = UpdateBans;
exports.UpdateCharacterData = UpdateCharacterData;
exports.UpdateCharacterInternalData = UpdateCharacterInternalData;
exports.UpdateCharacterReadOnlyData = UpdateCharacterReadOnlyData;
exports.UpdateCharacterStatistics = UpdateCharacterStatistics;
exports.UpdatePlayerStatistics = UpdatePlayerStatistics;
exports.UpdateSharedGroupData = UpdateSharedGroupData;
exports.UpdateUserData = UpdateUserData;
exports.UpdateUserInternalData = UpdateUserInternalData;
exports.UpdateUserInventoryItemCustomData = UpdateUserInventoryItemCustomData;
exports.UpdateUserPublisherData = UpdateUserPublisherData;
exports.UpdateUserPublisherInternalData = UpdateUserPublisherInternalData;
exports.UpdateUserPublisherReadOnlyData = UpdateUserPublisherReadOnlyData;
exports.UpdateUserReadOnlyData = UpdateUserReadOnlyData;
exports.WriteCharacterEvent = WriteCharacterEvent;
exports.WritePlayerEvent = WritePlayerEvent;
exports.WriteTitleEvent = WriteTitleEvent;
return exports;
