-- PlayFab Authentication API
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

local PlayFabAuthenticationApi = {
    settings = PlayFabSettings.settings
}

--[[
    Method to exchange a legacy AuthenticationTicket or title SecretKey for an Entity Token or to refresh a still valid
    Entity Token.
    https://docs.microsoft.com/rest/api/playfab/authentication/authentication/getentitytoken
--]]
function PlayFabAuthenticationApi:GetEntityToken(request)
    return Promise.new(function(resolve, reject)
         local authKey = nil
     local authValue = nil
     if (PlayFabSettings._internalSettings.entityToken) then
         authKey = "X-EntityToken"
         authValue = PlayFabSettings._internalSettings.entityToken
     end
     if (PlayFabSettings._internalSettings.sessionTicket) then
         authKey = "X-Authorization"
         authValue = PlayFabSettings._internalSettings.sessionTicket
     end
     if (PlayFabSettings.settings.devSecretKey) then
         authKey = "X-SecretKey"
         authValue = PlayFabSettings.settings.devSecretKey
     end
        IPlayFabHttps.MakePlayFabApiCall("/Authentication/GetEntityToken", request or {}, authKey, authValue, resolve, reject)
    end)
end

--[[
    Method for a server to validate a client provided EntityToken. Only callable by the title entity.
    https://docs.microsoft.com/rest/api/playfab/authentication/authentication/validateentitytoken
--]]
function PlayFabAuthenticationApi:ValidateEntityToken(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Authentication/ValidateEntityToken", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

return PlayFabAuthenticationApi
