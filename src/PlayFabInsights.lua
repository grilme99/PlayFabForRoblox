-- PlayFab Insights API
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

local PlayFabInsightsApi = {
    settings = PlayFabSettings.settings
}

--[[
    Gets the current values for the Insights performance and data storage retention, list of pending operations, and the
    performance and data storage retention limits.
    https://docs.microsoft.com/rest/api/playfab/insights/analytics/getdetails
--]]
function PlayFabInsightsApi:GetDetails(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Insights/GetDetails", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

--[[
    Retrieves the range of allowed values for performance and data storage retention values as well as the submeter details
    for each performance level.
    https://docs.microsoft.com/rest/api/playfab/insights/analytics/getlimits
--]]
function PlayFabInsightsApi:GetLimits(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Insights/GetLimits", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

--[[
    Gets the status of a SetPerformance or SetStorageRetention operation.
    https://docs.microsoft.com/rest/api/playfab/insights/analytics/getoperationstatus
--]]
function PlayFabInsightsApi:GetOperationStatus(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Insights/GetOperationStatus", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

--[[
    Gets a list of pending SetPerformance and/or SetStorageRetention operations for the title.
    https://docs.microsoft.com/rest/api/playfab/insights/analytics/getpendingoperations
--]]
function PlayFabInsightsApi:GetPendingOperations(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Insights/GetPendingOperations", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

--[[
    Sets the Insights performance level value for the title.
    https://docs.microsoft.com/rest/api/playfab/insights/analytics/setperformance
--]]
function PlayFabInsightsApi:SetPerformance(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Insights/SetPerformance", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

--[[
    Sets the Insights data storage retention days value for the title.
    https://docs.microsoft.com/rest/api/playfab/insights/analytics/setstorageretention
--]]
function PlayFabInsightsApi:SetStorageRetention(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Insights/SetStorageRetention", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

return PlayFabInsightsApi
