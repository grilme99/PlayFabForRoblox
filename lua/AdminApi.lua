local MakeRequest = require(script.Parent.HTTP).MakePlayFabApiCall
local Promise = require(script.Parent.Promise)
local Settings = require(script.Parent.Settings)
local TS = require(script.Parent.TS)

local AbortTaskInstance = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Admin/AbortTaskInstance", request, "X-SecretKey", secretKey))
end)

local AddLocalizedNews = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Admin/AddLocalizedNews", request, "X-SecretKey", secretKey))
end)

local AddNews = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Admin/AddNews", request, "X-SecretKey", secretKey))
end)

local AddPlayerTag = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Admin/AddPlayerTag", request, "X-SecretKey", secretKey))
end)

local AddUserVirtualCurrency = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Admin/AddUserVirtualCurrency", request, "X-SecretKey", secretKey))
end)

local AddVirtualCurrencyTypes = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Admin/AddVirtualCurrencyTypes", request, "X-SecretKey", secretKey))
end)

local BanUsers = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Admin/BanUsers", request, "X-SecretKey", secretKey))
end)

local CheckLimitedEditionItemAvailability = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Admin/CheckLimitedEditionItemAvailability", request, "X-SecretKey", secretKey))
end)

local CreateActionsOnPlayersInSegmentTask = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Admin/CreateActionsOnPlayersInSegmentTask", request, "X-SecretKey", secretKey))
end)

local CreateCloudScriptTask = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Admin/CreateCloudScriptTask", request, "X-SecretKey", secretKey))
end)

local CreateInsightsScheduledScalingTask = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Admin/CreateInsightsScheduledScalingTask", request, "X-SecretKey", secretKey))
end)

local CreatePlayerSharedSecret = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Admin/CreatePlayerSharedSecret", request, "X-SecretKey", secretKey))
end)

local CreatePlayerStatisticDefinition = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Admin/CreatePlayerStatisticDefinition", request, "X-SecretKey", secretKey))
end)

local DeleteContent = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Admin/DeleteContent", request, "X-SecretKey", secretKey))
end)

local DeleteMasterPlayerAccount = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Admin/DeleteMasterPlayerAccount", request, "X-SecretKey", secretKey))
end)

local DeletePlayer = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Admin/DeletePlayer", request, "X-SecretKey", secretKey))
end)

local DeletePlayerSharedSecret = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Admin/DeletePlayerSharedSecret", request, "X-SecretKey", secretKey))
end)

local DeleteStore = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Admin/DeleteStore", request, "X-SecretKey", secretKey))
end)

local DeleteTask = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Admin/DeleteTask", request, "X-SecretKey", secretKey))
end)

local DeleteTitle = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Admin/DeleteTitle", request, "X-SecretKey", secretKey))
end)

local DeleteTitleDataOverride = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Admin/DeleteTitleDataOverride", request, "X-SecretKey", secretKey))
end)

local ExportMasterPlayerData = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Admin/ExportMasterPlayerData", request, "X-SecretKey", secretKey))
end)

local GetActionsOnPlayersInSegmentTaskInstance = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Admin/GetActionsOnPlayersInSegmentTaskInstance", request, "X-SecretKey", secretKey))
end)

local GetAllSegments = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Admin/GetAllSegments", request, "X-SecretKey", secretKey))
end)

local GetCatalogItems = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Admin/GetCatalogItems", request, "X-SecretKey", secretKey))
end)

local GetCloudScriptRevision = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Admin/GetCloudScriptRevision", request, "X-SecretKey", secretKey))
end)

local GetCloudScriptTaskInstance = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Admin/GetCloudScriptTaskInstance", request, "X-SecretKey", secretKey))
end)

local GetCloudScriptVersions = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Admin/GetCloudScriptVersions", request, "X-SecretKey", secretKey))
end)

local GetContentList = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Admin/GetContentList", request, "X-SecretKey", secretKey))
end)

local GetContentUploadUrl = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Admin/GetContentUploadUrl", request, "X-SecretKey", secretKey))
end)

local GetDataReport = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Admin/GetDataReport", request, "X-SecretKey", secretKey))
end)

local GetMatchmakerGameInfo = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Admin/GetMatchmakerGameInfo", request, "X-SecretKey", secretKey))
end)

local GetMatchmakerGameModes = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Admin/GetMatchmakerGameModes", request, "X-SecretKey", secretKey))
end)

local GetPlayedTitleList = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Admin/GetPlayedTitleList", request, "X-SecretKey", secretKey))
end)

local GetPlayerIdFromAuthToken = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Admin/GetPlayerIdFromAuthToken", request, "X-SecretKey", secretKey))
end)

local GetPlayerProfile = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Admin/GetPlayerProfile", request, "X-SecretKey", secretKey))
end)

local GetPlayerSegments = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Admin/GetPlayerSegments", request, "X-SecretKey", secretKey))
end)

local GetPlayerSharedSecrets = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Admin/GetPlayerSharedSecrets", request, "X-SecretKey", secretKey))
end)

local GetPlayersInSegment = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Admin/GetPlayersInSegment", request, "X-SecretKey", secretKey))
end)

local GetPlayerStatisticDefinitions = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Admin/GetPlayerStatisticDefinitions", request, "X-SecretKey", secretKey))
end)

local GetPlayerStatisticVersions = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Admin/GetPlayerStatisticVersions", request, "X-SecretKey", secretKey))
end)

local GetPlayerTags = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Admin/GetPlayerTags", request, "X-SecretKey", secretKey))
end)

local GetPolicy = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Admin/GetPolicy", request, "X-SecretKey", secretKey))
end)

local GetPublisherData = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Admin/GetPublisherData", request, "X-SecretKey", secretKey))
end)

local GetRandomResultTables = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Admin/GetRandomResultTables", request, "X-SecretKey", secretKey))
end)

local GetStoreItems = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Admin/GetStoreItems", request, "X-SecretKey", secretKey))
end)

local GetTaskInstances = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Admin/GetTaskInstances", request, "X-SecretKey", secretKey))
end)

local GetTasks = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Admin/GetTasks", request, "X-SecretKey", secretKey))
end)

local GetTitleData = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Admin/GetTitleData", request, "X-SecretKey", secretKey))
end)

local GetTitleInternalData = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Admin/GetTitleInternalData", request, "X-SecretKey", secretKey))
end)

local GetUserAccountInfo = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Admin/GetUserAccountInfo", request, "X-SecretKey", secretKey))
end)

local GetUserBans = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Admin/GetUserBans", request, "X-SecretKey", secretKey))
end)

local GetUserData = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Admin/GetUserData", request, "X-SecretKey", secretKey))
end)

local GetUserInternalData = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Admin/GetUserInternalData", request, "X-SecretKey", secretKey))
end)

local GetUserInventory = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Admin/GetUserInventory", request, "X-SecretKey", secretKey))
end)

local GetUserPublisherData = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Admin/GetUserPublisherData", request, "X-SecretKey", secretKey))
end)

local GetUserPublisherInternalData = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Admin/GetUserPublisherInternalData", request, "X-SecretKey", secretKey))
end)

local GetUserPublisherReadOnlyData = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Admin/GetUserPublisherReadOnlyData", request, "X-SecretKey", secretKey))
end)

local GetUserReadOnlyData = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Admin/GetUserReadOnlyData", request, "X-SecretKey", secretKey))
end)

local GrantItemsToUsers = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Admin/GrantItemsToUsers", request, "X-SecretKey", secretKey))
end)

local IncrementLimitedEditionItemAvailability = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Admin/IncrementLimitedEditionItemAvailability", request, "X-SecretKey", secretKey))
end)

local IncrementPlayerStatisticVersion = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Admin/IncrementPlayerStatisticVersion", request, "X-SecretKey", secretKey))
end)

local ListVirtualCurrencyTypes = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Admin/ListVirtualCurrencyTypes", request, "X-SecretKey", secretKey))
end)

local ModifyMatchmakerGameModes = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Admin/ModifyMatchmakerGameModes", request, "X-SecretKey", secretKey))
end)

local RemovePlayerTag = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Admin/RemovePlayerTag", request, "X-SecretKey", secretKey))
end)

local RemoveVirtualCurrencyTypes = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Admin/RemoveVirtualCurrencyTypes", request, "X-SecretKey", secretKey))
end)

local ResetCharacterStatistics = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Admin/ResetCharacterStatistics", request, "X-SecretKey", secretKey))
end)

local RevokeAllBansForUser = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Admin/RevokeAllBansForUser", request, "X-SecretKey", secretKey))
end)

local RevokeBans = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Admin/RevokeBans", request, "X-SecretKey", secretKey))
end)

local RevokeInventoryItem = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Admin/RevokeInventoryItem", request, "X-SecretKey", secretKey))
end)

local RevokeInventoryItems = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Admin/RevokeInventoryItems", request, "X-SecretKey", secretKey))
end)

local RunTask = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Admin/RunTask", request, "X-SecretKey", secretKey))
end)

local SetCatalogItems = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Admin/SetCatalogItems", request, "X-SecretKey", secretKey))
end)

local SetPlayerSecret = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Admin/SetPlayerSecret", request, "X-SecretKey", secretKey))
end)

local SetPublishedRevision = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Admin/SetPublishedRevision", request, "X-SecretKey", secretKey))
end)

local SetPublisherData = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Admin/SetPublisherData", request, "X-SecretKey", secretKey))
end)

local SetStoreItems = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Admin/SetStoreItems", request, "X-SecretKey", secretKey))
end)

local SetTitleData = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Admin/SetTitleData", request, "X-SecretKey", secretKey))
end)

local SubtractUserVirtualCurrency = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Admin/SubtractUserVirtualCurrency", request, "X-SecretKey", secretKey))
end)

local UpdateBans = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Admin/UpdateBans", request, "X-SecretKey", secretKey))
end)

local UpdateCatalogItems = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Admin/UpdateCatalogItems", request, "X-SecretKey", secretKey))
end)

local UpdatePlayerSharedSecret = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Admin/UpdatePlayerSharedSecret", request, "X-SecretKey", secretKey))
end)

local UpdatePlayerStatisticDefinition = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Admin/UpdatePlayerStatisticDefinition", request, "X-SecretKey", secretKey))
end)

local UpdateRandomResultTables = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Admin/UpdateRandomResultTables", request, "X-SecretKey", secretKey))
end)

local UpdateUserData = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Admin/UpdateUserData", request, "X-SecretKey", secretKey))
end)

local UpdateUserInternalData = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Admin/UpdateUserInternalData", request, "X-SecretKey", secretKey))
end)

local UpdateUserPublisherData = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Admin/UpdateUserPublisherData", request, "X-SecretKey", secretKey))
end)

local UpdateUserPublisherInternalData = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Admin/UpdateUserPublisherInternalData", request, "X-SecretKey", secretKey))
end)

local UpdateUserPublisherReadOnlyData = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Admin/UpdateUserPublisherReadOnlyData", request, "X-SecretKey", secretKey))
end)

local UpdateUserReadOnlyData = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Admin/UpdateUserReadOnlyData", request, "X-SecretKey", secretKey))
end)

local UpdateUserTitleDisplayName = Promise.promisify(function(request)
	local secretKey = Settings.settings.secretKey
	if not (secretKey ~= "" and secretKey) then
		error("Must have Settings.settings.secretKey set to call this method")
	end

	return TS.await(MakeRequest("/Admin/UpdateUserTitleDisplayName", request, "X-SecretKey", secretKey))
end)

return {
	AbortTaskInstance = AbortTaskInstance,
	AddLocalizedNews = AddLocalizedNews,
	AddNews = AddNews,
	AddPlayerTag = AddPlayerTag,
	AddUserVirtualCurrency = AddUserVirtualCurrency,
	AddVirtualCurrencyTypes = AddVirtualCurrencyTypes,
	BanUsers = BanUsers,
	CheckLimitedEditionItemAvailability = CheckLimitedEditionItemAvailability,
	CreateActionsOnPlayersInSegmentTask = CreateActionsOnPlayersInSegmentTask,
	CreateCloudScriptTask = CreateCloudScriptTask,
	CreateInsightsScheduledScalingTask = CreateInsightsScheduledScalingTask,
	CreatePlayerSharedSecret = CreatePlayerSharedSecret,
	CreatePlayerStatisticDefinition = CreatePlayerStatisticDefinition,
	DeleteContent = DeleteContent,
	DeleteMasterPlayerAccount = DeleteMasterPlayerAccount,
	DeletePlayer = DeletePlayer,
	DeletePlayerSharedSecret = DeletePlayerSharedSecret,
	DeleteStore = DeleteStore,
	DeleteTask = DeleteTask,
	DeleteTitle = DeleteTitle,
	DeleteTitleDataOverride = DeleteTitleDataOverride,
	ExportMasterPlayerData = ExportMasterPlayerData,
	GetActionsOnPlayersInSegmentTaskInstance = GetActionsOnPlayersInSegmentTaskInstance,
	GetAllSegments = GetAllSegments,
	GetCatalogItems = GetCatalogItems,
	GetCloudScriptRevision = GetCloudScriptRevision,
	GetCloudScriptTaskInstance = GetCloudScriptTaskInstance,
	GetCloudScriptVersions = GetCloudScriptVersions,
	GetContentList = GetContentList,
	GetContentUploadUrl = GetContentUploadUrl,
	GetDataReport = GetDataReport,
	GetMatchmakerGameInfo = GetMatchmakerGameInfo,
	GetMatchmakerGameModes = GetMatchmakerGameModes,
	GetPlayedTitleList = GetPlayedTitleList,
	GetPlayerIdFromAuthToken = GetPlayerIdFromAuthToken,
	GetPlayerProfile = GetPlayerProfile,
	GetPlayerSegments = GetPlayerSegments,
	GetPlayerSharedSecrets = GetPlayerSharedSecrets,
	GetPlayersInSegment = GetPlayersInSegment,
	GetPlayerStatisticDefinitions = GetPlayerStatisticDefinitions,
	GetPlayerStatisticVersions = GetPlayerStatisticVersions,
	GetPlayerTags = GetPlayerTags,
	GetPolicy = GetPolicy,
	GetPublisherData = GetPublisherData,
	GetRandomResultTables = GetRandomResultTables,
	GetStoreItems = GetStoreItems,
	GetTaskInstances = GetTaskInstances,
	GetTasks = GetTasks,
	GetTitleData = GetTitleData,
	GetTitleInternalData = GetTitleInternalData,
	GetUserAccountInfo = GetUserAccountInfo,
	GetUserBans = GetUserBans,
	GetUserData = GetUserData,
	GetUserInternalData = GetUserInternalData,
	GetUserInventory = GetUserInventory,
	GetUserPublisherData = GetUserPublisherData,
	GetUserPublisherInternalData = GetUserPublisherInternalData,
	GetUserPublisherReadOnlyData = GetUserPublisherReadOnlyData,
	GetUserReadOnlyData = GetUserReadOnlyData,
	GrantItemsToUsers = GrantItemsToUsers,
	IncrementLimitedEditionItemAvailability = IncrementLimitedEditionItemAvailability,
	IncrementPlayerStatisticVersion = IncrementPlayerStatisticVersion,
	ListVirtualCurrencyTypes = ListVirtualCurrencyTypes,
	ModifyMatchmakerGameModes = ModifyMatchmakerGameModes,
	RemovePlayerTag = RemovePlayerTag,
	RemoveVirtualCurrencyTypes = RemoveVirtualCurrencyTypes,
	ResetCharacterStatistics = ResetCharacterStatistics,
	RevokeAllBansForUser = RevokeAllBansForUser,
	RevokeBans = RevokeBans,
	RevokeInventoryItem = RevokeInventoryItem,
	RevokeInventoryItems = RevokeInventoryItems,
	RunTask = RunTask,
	SetCatalogItems = SetCatalogItems,
	SetPlayerSecret = SetPlayerSecret,
	SetPublishedRevision = SetPublishedRevision,
	SetPublisherData = SetPublisherData,
	SetStoreItems = SetStoreItems,
	SetTitleData = SetTitleData,
	SubtractUserVirtualCurrency = SubtractUserVirtualCurrency,
	UpdateBans = UpdateBans,
	UpdateCatalogItems = UpdateCatalogItems,
	UpdatePlayerSharedSecret = UpdatePlayerSharedSecret,
	UpdatePlayerStatisticDefinition = UpdatePlayerStatisticDefinition,
	UpdateRandomResultTables = UpdateRandomResultTables,
	UpdateUserData = UpdateUserData,
	UpdateUserInternalData = UpdateUserInternalData,
	UpdateUserPublisherData = UpdateUserPublisherData,
	UpdateUserPublisherInternalData = UpdateUserPublisherInternalData,
	UpdateUserPublisherReadOnlyData = UpdateUserPublisherReadOnlyData,
	UpdateUserReadOnlyData = UpdateUserReadOnlyData,
	UpdateUserTitleDisplayName = UpdateUserTitleDisplayName,
}