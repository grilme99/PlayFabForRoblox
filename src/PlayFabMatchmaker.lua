-- PlayFab Matchmaker API
-- You should not require this file directly
-- All api calls are documented here: https://docs.microsoft.com/gaming/playfab/api-references/

local Promise = require(script.Parent.Promise)
local IPlayFabHttps = require(script.Parent.IPlayFabHttps)
local PlayFabSettings = require(script.Parent.PlayFabSettings)

local PlayFabMatchmakerApi = {
    settings = PlayFabSettings.settings
}

--[[
    Validates a user with the PlayFab service
    https://docs.microsoft.com/rest/api/playfab/matchmaker/matchmaking/authuser
--]]
function PlayFabMatchmakerApi:AuthUser(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Matchmaker/AuthUser", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Informs the PlayFab game server hosting service that the indicated user has joined the Game Server Instance specified
    https://docs.microsoft.com/rest/api/playfab/matchmaker/matchmaking/playerjoined
--]]
function PlayFabMatchmakerApi:PlayerJoined(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Matchmaker/PlayerJoined", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Informs the PlayFab game server hosting service that the indicated user has left the Game Server Instance specified
    https://docs.microsoft.com/rest/api/playfab/matchmaker/matchmaking/playerleft
--]]
function PlayFabMatchmakerApi:PlayerLeft(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Matchmaker/PlayerLeft", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Instructs the PlayFab game server hosting service to instantiate a new Game Server Instance
    https://docs.microsoft.com/rest/api/playfab/matchmaker/matchmaking/startgame
--]]
function PlayFabMatchmakerApi:StartGame(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Matchmaker/StartGame", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

--[[
    Retrieves the relevant details for a specified user, which the external match-making service can then use to compute
    effective matches
    https://docs.microsoft.com/rest/api/playfab/matchmaker/matchmaking/userinfo
--]]
function PlayFabMatchmakerApi:UserInfo(request)
    return Promise.new(function(resolve, reject)
         if (not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey) then
            reject("Must have PlayFabSettings.settings.devSecretKey set to call this method")
        end
        IPlayFabHttps.MakePlayFabApiCall("/Matchmaker/UserInfo", request or {}, "X-SecretKey", PlayFabSettings.settings.developerSecretKey, resolve, reject)
    end)
end

return PlayFabMatchmakerApi
