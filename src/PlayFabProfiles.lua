-- PlayFab Profiles API
-- You should not require this file directly
-- All api calls are documented here: https://docs.microsoft.com/gaming/playfab/api-references/

local Promise = require(script.Parent.Promise)
local IPlayFabHttps = require(script.Parent.IPlayFabHttps)
local PlayFabSettings = require(script.Parent.PlayFabSettings)

local PlayFabProfilesApi = {
    settings = PlayFabSettings.settings
}

--[[
    Gets the global title access policy
    https://docs.microsoft.com/rest/api/playfab/profiles/account-management/getglobalpolicy
--]]
function PlayFabProfilesApi:GetGlobalPolicy(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Profile/GetGlobalPolicy", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

--[[
    Retrieves the entity's profile.
    https://docs.microsoft.com/rest/api/playfab/profiles/account-management/getprofile
--]]
function PlayFabProfilesApi:GetProfile(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Profile/GetProfile", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

--[[
    Retrieves the entity's profile.
    https://docs.microsoft.com/rest/api/playfab/profiles/account-management/getprofiles
--]]
function PlayFabProfilesApi:GetProfiles(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Profile/GetProfiles", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

--[[
    Retrieves the title player accounts associated with the given master player account.
    https://docs.microsoft.com/rest/api/playfab/profiles/account-management/gettitleplayersfrommasterplayeraccountids
--]]
function PlayFabProfilesApi:GetTitlePlayersFromMasterPlayerAccountIds(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Profile/GetTitlePlayersFromMasterPlayerAccountIds", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

--[[
    Sets the global title access policy
    https://docs.microsoft.com/rest/api/playfab/profiles/account-management/setglobalpolicy
--]]
function PlayFabProfilesApi:SetGlobalPolicy(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Profile/SetGlobalPolicy", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

--[[
    Updates the entity's language. The precedence hierarchy for communication to the player is Title Player Account
    language, Master Player Account language, and then title default language if the first two aren't set or supported.
    https://docs.microsoft.com/rest/api/playfab/profiles/account-management/setprofilelanguage
--]]
function PlayFabProfilesApi:SetProfileLanguage(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Profile/SetProfileLanguage", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

--[[
    Sets the profiles access policy
    https://docs.microsoft.com/rest/api/playfab/profiles/account-management/setprofilepolicy
--]]
function PlayFabProfilesApi:SetProfilePolicy(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Profile/SetProfilePolicy", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

return PlayFabProfilesApi
