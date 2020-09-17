-- PlayFab Localization API
-- You should not require this file directly
-- All api calls are documented here: https://docs.microsoft.com/gaming/playfab/api-references/

-- Check if the roblox-ts promise implementation exists for Typescript users
local rbxts_include = game.ReplicatedStorage:FindFirstChild('rbxts_include')
local Promise
if (rbxts_include and rbxts_include:FindFirstChild('Promise')) then
    Promise = require(rbxts_include.Promise)
else
    Promise = require(script.Parent.Promise)
end

local IPlayFabHttps = require(script.Parent.IPlayFabHttps)
local PlayFabSettings = require(script.Parent.PlayFabSettings)

local PlayFabLocalizationApi = {
    settings = PlayFabSettings.settings
}

--[[
    Retrieves the list of allowed languages, only accessible by title entities
    https://docs.microsoft.com/rest/api/playfab/localization/localization/getlanguagelist
--]]
function PlayFabLocalizationApi:GetLanguageList(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Locale/GetLanguageList", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

return PlayFabLocalizationApi
