-- Holds the basic settings for PlayFab
-- PlayFabSettings.settings is public and contains the following:
--     titleId -- You must set this before making any PlayFab API calls
--     devSecretKey -- Server/Admin only, required for any non-client call

local PlayFabSettings = {
    _internalSettings = {
        sdkVersionString = "RobloxSdk_undefined",
        buildIdentifier = "default_manual_build",
        requestGetParams = {["sdk"] = "RobloxSdk_undefined"}
    },
    settings = {
        titleId = nil,
        devSecretKey = nil,

        -- Probably don't need to edit
        productionUrl = ".playfabapi.com",
        verticalName = nil -- The name of a customer vertical. This is only for customers running a private cluster. Generally you shouldn't touch this
    }
}

return PlayFabSettings