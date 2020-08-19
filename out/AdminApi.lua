-- Compiled with https://roblox-ts.github.io v0.3.2
-- August 19, 2020, 5:44 PM British Summer Time

local TS = _G[script];
local exports = {};
local MakeRequest = TS.import(script, script.Parent, "HTTP").default;
local Settings = TS.import(script, script.Parent, "Settings").default;
local AbortTaskInstance = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Admin/AbortTaskInstance', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local AddLocalizedNews = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Admin/AddLocalizedNews', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local AddNews = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Admin/AddNews', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local AddPlayerTag = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Admin/AddPlayerTag', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local AddUserVirtualCurrency = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Admin/AddUserVirtualCurrency', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local AddVirtualCurrencyTypes = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Admin/AddVirtualCurrencyTypes', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local BanUsers = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Admin/BanUsers', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local CheckLimitedEditionItemAvailability = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Admin/CheckLimitedEditionItemAvailability', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local CreateActionsOnPlayersInSegmentTask = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Admin/CreateActionsOnPlayersInSegmentTask', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local CreateCloudScriptTask = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Admin/CreateCloudScriptTask', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local CreateInsightsScheduledScalingTask = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Admin/CreateInsightsScheduledScalingTask', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local CreatePlayerSharedSecret = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Admin/CreatePlayerSharedSecret', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local CreatePlayerStatisticDefinition = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Admin/CreatePlayerStatisticDefinition', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local DeleteContent = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Admin/DeleteContent', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local DeleteMasterPlayerAccount = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Admin/DeleteMasterPlayerAccount', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local DeletePlayer = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Admin/DeletePlayer', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local DeletePlayerSharedSecret = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Admin/DeletePlayerSharedSecret', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local DeleteStore = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Admin/DeleteStore', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local DeleteTask = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Admin/DeleteTask', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local DeleteTitle = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Admin/DeleteTitle', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local DeleteTitleDataOverride = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Admin/DeleteTitleDataOverride', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local ExportMasterPlayerData = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Admin/ExportMasterPlayerData', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local GetActionsOnPlayersInSegmentTaskInstance = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Admin/GetActionsOnPlayersInSegmentTaskInstance', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local GetAllSegments = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Admin/GetAllSegments', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local GetCatalogItems = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Admin/GetCatalogItems', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local GetCloudScriptRevision = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Admin/GetCloudScriptRevision', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local GetCloudScriptTaskInstance = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Admin/GetCloudScriptTaskInstance', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local GetCloudScriptVersions = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Admin/GetCloudScriptVersions', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local GetContentList = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Admin/GetContentList', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local GetContentUploadUrl = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Admin/GetContentUploadUrl', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local GetDataReport = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Admin/GetDataReport', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local GetMatchmakerGameInfo = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Admin/GetMatchmakerGameInfo', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local GetMatchmakerGameModes = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Admin/GetMatchmakerGameModes', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local GetPlayedTitleList = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Admin/GetPlayedTitleList', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local GetPlayerIdFromAuthToken = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Admin/GetPlayerIdFromAuthToken', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local GetPlayerProfile = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Admin/GetPlayerProfile', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local GetPlayerSegments = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Admin/GetPlayerSegments', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local GetPlayerSharedSecrets = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Admin/GetPlayerSharedSecrets', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local GetPlayersInSegment = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Admin/GetPlayersInSegment', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local GetPlayerStatisticDefinitions = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Admin/GetPlayerStatisticDefinitions', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local GetPlayerStatisticVersions = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Admin/GetPlayerStatisticVersions', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local GetPlayerTags = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Admin/GetPlayerTags', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local GetPolicy = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Admin/GetPolicy', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local GetPublisherData = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Admin/GetPublisherData', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local GetRandomResultTables = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Admin/GetRandomResultTables', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local GetStoreItems = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Admin/GetStoreItems', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local GetTaskInstances = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Admin/GetTaskInstances', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local GetTasks = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Admin/GetTasks', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local GetTitleData = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Admin/GetTitleData', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local GetTitleInternalData = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Admin/GetTitleInternalData', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local GetUserAccountInfo = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Admin/GetUserAccountInfo', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local GetUserBans = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Admin/GetUserBans', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local GetUserData = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Admin/GetUserData', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local GetUserInternalData = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Admin/GetUserInternalData', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local GetUserInventory = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Admin/GetUserInventory', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local GetUserPublisherData = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Admin/GetUserPublisherData', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local GetUserPublisherInternalData = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Admin/GetUserPublisherInternalData', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local GetUserPublisherReadOnlyData = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Admin/GetUserPublisherReadOnlyData', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local GetUserReadOnlyData = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Admin/GetUserReadOnlyData', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local GrantItemsToUsers = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Admin/GrantItemsToUsers', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local IncrementLimitedEditionItemAvailability = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Admin/IncrementLimitedEditionItemAvailability', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local IncrementPlayerStatisticVersion = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Admin/IncrementPlayerStatisticVersion', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local ListVirtualCurrencyTypes = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Admin/ListVirtualCurrencyTypes', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local ModifyMatchmakerGameModes = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Admin/ModifyMatchmakerGameModes', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local RemovePlayerTag = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Admin/RemovePlayerTag', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local RemoveVirtualCurrencyTypes = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Admin/RemoveVirtualCurrencyTypes', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local ResetCharacterStatistics = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Admin/ResetCharacterStatistics', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local RevokeAllBansForUser = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Admin/RevokeAllBansForUser', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local RevokeBans = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Admin/RevokeBans', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local RevokeInventoryItem = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Admin/RevokeInventoryItem', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local RevokeInventoryItems = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Admin/RevokeInventoryItems', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local RunTask = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Admin/RunTask', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local SetCatalogItems = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Admin/SetCatalogItems', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local SetPlayerSecret = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Admin/SetPlayerSecret', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local SetPublishedRevision = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Admin/SetPublishedRevision', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local SetPublisherData = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Admin/SetPublisherData', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local SetStoreItems = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Admin/SetStoreItems', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local SetTitleData = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Admin/SetTitleData', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local SubtractUserVirtualCurrency = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Admin/SubtractUserVirtualCurrency', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local UpdateBans = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Admin/UpdateBans', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local UpdateCatalogItems = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Admin/UpdateCatalogItems', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local UpdatePlayerSharedSecret = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Admin/UpdatePlayerSharedSecret', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local UpdatePlayerStatisticDefinition = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Admin/UpdatePlayerStatisticDefinition', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local UpdateRandomResultTables = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Admin/UpdateRandomResultTables', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local UpdateUserData = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Admin/UpdateUserData', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local UpdateUserInternalData = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Admin/UpdateUserInternalData', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local UpdateUserPublisherData = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Admin/UpdateUserPublisherData', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local UpdateUserPublisherInternalData = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Admin/UpdateUserPublisherInternalData', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local UpdateUserPublisherReadOnlyData = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Admin/UpdateUserPublisherReadOnlyData', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local UpdateUserReadOnlyData = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Admin/UpdateUserReadOnlyData', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
local UpdateUserTitleDisplayName = TS.async(function(request)
	local _0 = Settings.settings.secretKey;
	if not (_0 ~= "" and _0) then
		error('Must have Settings.settings.secretKey set to call this method');
	end;
	local result = TS.await(MakeRequest('/Admin/UpdateUserTitleDisplayName', request, 'X-SecretKey', Settings.settings.secretKey));
	return result;
end);
exports.AbortTaskInstance = AbortTaskInstance;
exports.AddLocalizedNews = AddLocalizedNews;
exports.AddNews = AddNews;
exports.AddPlayerTag = AddPlayerTag;
exports.AddUserVirtualCurrency = AddUserVirtualCurrency;
exports.AddVirtualCurrencyTypes = AddVirtualCurrencyTypes;
exports.BanUsers = BanUsers;
exports.CheckLimitedEditionItemAvailability = CheckLimitedEditionItemAvailability;
exports.CreateActionsOnPlayersInSegmentTask = CreateActionsOnPlayersInSegmentTask;
exports.CreateCloudScriptTask = CreateCloudScriptTask;
exports.CreateInsightsScheduledScalingTask = CreateInsightsScheduledScalingTask;
exports.CreatePlayerSharedSecret = CreatePlayerSharedSecret;
exports.CreatePlayerStatisticDefinition = CreatePlayerStatisticDefinition;
exports.DeleteContent = DeleteContent;
exports.DeleteMasterPlayerAccount = DeleteMasterPlayerAccount;
exports.DeletePlayer = DeletePlayer;
exports.DeletePlayerSharedSecret = DeletePlayerSharedSecret;
exports.DeleteStore = DeleteStore;
exports.DeleteTask = DeleteTask;
exports.DeleteTitle = DeleteTitle;
exports.DeleteTitleDataOverride = DeleteTitleDataOverride;
exports.ExportMasterPlayerData = ExportMasterPlayerData;
exports.GetActionsOnPlayersInSegmentTaskInstance = GetActionsOnPlayersInSegmentTaskInstance;
exports.GetAllSegments = GetAllSegments;
exports.GetCatalogItems = GetCatalogItems;
exports.GetCloudScriptRevision = GetCloudScriptRevision;
exports.GetCloudScriptTaskInstance = GetCloudScriptTaskInstance;
exports.GetCloudScriptVersions = GetCloudScriptVersions;
exports.GetContentList = GetContentList;
exports.GetContentUploadUrl = GetContentUploadUrl;
exports.GetDataReport = GetDataReport;
exports.GetMatchmakerGameInfo = GetMatchmakerGameInfo;
exports.GetMatchmakerGameModes = GetMatchmakerGameModes;
exports.GetPlayedTitleList = GetPlayedTitleList;
exports.GetPlayerIdFromAuthToken = GetPlayerIdFromAuthToken;
exports.GetPlayerProfile = GetPlayerProfile;
exports.GetPlayerSegments = GetPlayerSegments;
exports.GetPlayerSharedSecrets = GetPlayerSharedSecrets;
exports.GetPlayersInSegment = GetPlayersInSegment;
exports.GetPlayerStatisticDefinitions = GetPlayerStatisticDefinitions;
exports.GetPlayerStatisticVersions = GetPlayerStatisticVersions;
exports.GetPlayerTags = GetPlayerTags;
exports.GetPolicy = GetPolicy;
exports.GetPublisherData = GetPublisherData;
exports.GetRandomResultTables = GetRandomResultTables;
exports.GetStoreItems = GetStoreItems;
exports.GetTaskInstances = GetTaskInstances;
exports.GetTasks = GetTasks;
exports.GetTitleData = GetTitleData;
exports.GetTitleInternalData = GetTitleInternalData;
exports.GetUserAccountInfo = GetUserAccountInfo;
exports.GetUserBans = GetUserBans;
exports.GetUserData = GetUserData;
exports.GetUserInternalData = GetUserInternalData;
exports.GetUserInventory = GetUserInventory;
exports.GetUserPublisherData = GetUserPublisherData;
exports.GetUserPublisherInternalData = GetUserPublisherInternalData;
exports.GetUserPublisherReadOnlyData = GetUserPublisherReadOnlyData;
exports.GetUserReadOnlyData = GetUserReadOnlyData;
exports.GrantItemsToUsers = GrantItemsToUsers;
exports.IncrementLimitedEditionItemAvailability = IncrementLimitedEditionItemAvailability;
exports.IncrementPlayerStatisticVersion = IncrementPlayerStatisticVersion;
exports.ListVirtualCurrencyTypes = ListVirtualCurrencyTypes;
exports.ModifyMatchmakerGameModes = ModifyMatchmakerGameModes;
exports.RemovePlayerTag = RemovePlayerTag;
exports.RemoveVirtualCurrencyTypes = RemoveVirtualCurrencyTypes;
exports.ResetCharacterStatistics = ResetCharacterStatistics;
exports.RevokeAllBansForUser = RevokeAllBansForUser;
exports.RevokeBans = RevokeBans;
exports.RevokeInventoryItem = RevokeInventoryItem;
exports.RevokeInventoryItems = RevokeInventoryItems;
exports.RunTask = RunTask;
exports.SetCatalogItems = SetCatalogItems;
exports.SetPlayerSecret = SetPlayerSecret;
exports.SetPublishedRevision = SetPublishedRevision;
exports.SetPublisherData = SetPublisherData;
exports.SetStoreItems = SetStoreItems;
exports.SetTitleData = SetTitleData;
exports.SubtractUserVirtualCurrency = SubtractUserVirtualCurrency;
exports.UpdateBans = UpdateBans;
exports.UpdateCatalogItems = UpdateCatalogItems;
exports.UpdatePlayerSharedSecret = UpdatePlayerSharedSecret;
exports.UpdatePlayerStatisticDefinition = UpdatePlayerStatisticDefinition;
exports.UpdateRandomResultTables = UpdateRandomResultTables;
exports.UpdateUserData = UpdateUserData;
exports.UpdateUserInternalData = UpdateUserInternalData;
exports.UpdateUserPublisherData = UpdateUserPublisherData;
exports.UpdateUserPublisherInternalData = UpdateUserPublisherInternalData;
exports.UpdateUserPublisherReadOnlyData = UpdateUserPublisherReadOnlyData;
exports.UpdateUserReadOnlyData = UpdateUserReadOnlyData;
exports.UpdateUserTitleDisplayName = UpdateUserTitleDisplayName;
return exports;
