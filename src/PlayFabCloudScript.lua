-- PlayFab CloudScript API
-- You should not require this file directly
-- All api calls are documented here: https://docs.microsoft.com/gaming/playfab/api-references/

local Promise = require(script.Parent.Promise)
local IPlayFabHttps = require(script.Parent.IPlayFabHttps)
local PlayFabSettings = require(script.Parent.PlayFabSettings)

local PlayFabCloudScriptApi = {
    settings = PlayFabSettings.settings
}

--[[
    Cloud Script is one of PlayFab's most versatile features. It allows client code to request execution of any kind of
    custom server-side functionality you can implement, and it can be used in conjunction with virtually anything.
    https://docs.microsoft.com/rest/api/playfab/cloudscript/server-side-cloud-script/executeentitycloudscript
--]]
function PlayFabCloudScriptApi:ExecuteEntityCloudScript(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/CloudScript/ExecuteEntityCloudScript", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

--[[
    Cloud Script is one of PlayFab's most versatile features. It allows client code to request execution of any kind of
    custom server-side functionality you can implement, and it can be used in conjunction with virtually anything.
    https://docs.microsoft.com/rest/api/playfab/cloudscript/server-side-cloud-script/executefunction
--]]
function PlayFabCloudScriptApi:ExecuteFunction(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/CloudScript/ExecuteFunction", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

--[[
    Lists all currently registered Azure Functions for a given title.
    https://docs.microsoft.com/rest/api/playfab/cloudscript/server-side-cloud-script/listfunctions
--]]
function PlayFabCloudScriptApi:ListFunctions(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/CloudScript/ListFunctions", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

--[[
    Lists all currently registered HTTP triggered Azure Functions for a given title.
    https://docs.microsoft.com/rest/api/playfab/cloudscript/server-side-cloud-script/listhttpfunctions
--]]
function PlayFabCloudScriptApi:ListHttpFunctions(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/CloudScript/ListHttpFunctions", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

--[[
    Lists all currently registered Queue triggered Azure Functions for a given title.
    https://docs.microsoft.com/rest/api/playfab/cloudscript/server-side-cloud-script/listqueuedfunctions
--]]
function PlayFabCloudScriptApi:ListQueuedFunctions(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/CloudScript/ListQueuedFunctions", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

--[[
    Generate an entity PlayStream event for the provided function result.
    https://docs.microsoft.com/rest/api/playfab/cloudscript/server-side-cloud-script/postfunctionresultforentitytriggeredaction
--]]
function PlayFabCloudScriptApi:PostFunctionResultForEntityTriggeredAction(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/CloudScript/PostFunctionResultForEntityTriggeredAction", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

--[[
    Generate an entity PlayStream event for the provided function result.
    https://docs.microsoft.com/rest/api/playfab/cloudscript/server-side-cloud-script/postfunctionresultforfunctionexecution
--]]
function PlayFabCloudScriptApi:PostFunctionResultForFunctionExecution(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/CloudScript/PostFunctionResultForFunctionExecution", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

--[[
    Generate a player PlayStream event for the provided function result.
    https://docs.microsoft.com/rest/api/playfab/cloudscript/server-side-cloud-script/postfunctionresultforplayertriggeredaction
--]]
function PlayFabCloudScriptApi:PostFunctionResultForPlayerTriggeredAction(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/CloudScript/PostFunctionResultForPlayerTriggeredAction", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

--[[
    Generate a PlayStream event for the provided function result.
    https://docs.microsoft.com/rest/api/playfab/cloudscript/server-side-cloud-script/postfunctionresultforscheduledtask
--]]
function PlayFabCloudScriptApi:PostFunctionResultForScheduledTask(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/CloudScript/PostFunctionResultForScheduledTask", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

--[[
    Registers an HTTP triggered Azure function with a title.
    https://docs.microsoft.com/rest/api/playfab/cloudscript/server-side-cloud-script/registerhttpfunction
--]]
function PlayFabCloudScriptApi:RegisterHttpFunction(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/CloudScript/RegisterHttpFunction", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

--[[
    Registers a queue triggered Azure Function with a title.
    https://docs.microsoft.com/rest/api/playfab/cloudscript/server-side-cloud-script/registerqueuedfunction
--]]
function PlayFabCloudScriptApi:RegisterQueuedFunction(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/CloudScript/RegisterQueuedFunction", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

--[[
    Unregisters an Azure Function with a title.
    https://docs.microsoft.com/rest/api/playfab/cloudscript/server-side-cloud-script/unregisterfunction
--]]
function PlayFabCloudScriptApi:UnregisterFunction(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/CloudScript/UnregisterFunction", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

return PlayFabCloudScriptApi
