local Settings = require(script.PlayFabSettings);

local PlayFabAdmin = require(script.PlayFabAdmin);
local PlayFabClient = require(script.PlayFabClient);
local PlayFabMatchmaker = require(script.PlayFabMatchmaker);
local PlayFabServer = require(script.PlayFabServer);
local PlayFabAuthentication = require(script.PlayFabAuthentication);
local PlayFabCloudScript = require(script.PlayFabCloudScript);
local PlayFabData = require(script.PlayFabData);
local PlayFabEvents = require(script.PlayFabEvents);
local PlayFabExperimentation = require(script.PlayFabExperimentation);
local PlayFabInsights = require(script.PlayFabInsights);
local PlayFabGroups = require(script.PlayFabGroups);
local PlayFabLocalization = require(script.PlayFabLocalization);
local PlayFabMultiplayer = require(script.PlayFabMultiplayer);
local PlayFabProfiles = require(script.PlayFabProfiles);

return {
    PlayFabAdmin = PlayFabAdmin,
    PlayFabClient = PlayFabClient,
    PlayFabMatchmaker = PlayFabMatchmaker,
    PlayFabServer = PlayFabServer,
    PlayFabAuthentication = PlayFabAuthentication,
    PlayFabCloudScript = PlayFabCloudScript,
    PlayFabData = PlayFabData,
    PlayFabEvents = PlayFabEvents,
    PlayFabExperimentation = PlayFabExperimentation,
    PlayFabInsights = PlayFabInsights,
    PlayFabGroups = PlayFabGroups,
    PlayFabLocalization = PlayFabLocalization,
    PlayFabMultiplayer = PlayFabMultiplayer,
    PlayFabProfiles = PlayFabProfiles,
    Settings = Settings.settings
};