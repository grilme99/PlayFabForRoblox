-- PlayFab Experimentation API
-- You should not require this file directly
-- All api calls are documented here: https://docs.microsoft.com/gaming/playfab/api-references/

local Promise = require(script.Parent.Promise)
local IPlayFabHttps = require(script.Parent.IPlayFabHttps)
local PlayFabSettings = require(script.Parent.PlayFabSettings)

local PlayFabExperimentationApi = {
    settings = PlayFabSettings.settings
}

--[[
    Creates a new experiment for a title.
    https://docs.microsoft.com/rest/api/playfab/experimentation/experimentation/createexperiment
--]]
function PlayFabExperimentationApi:CreateExperiment(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Experimentation/CreateExperiment", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

--[[
    Deletes an existing experiment for a title.
    https://docs.microsoft.com/rest/api/playfab/experimentation/experimentation/deleteexperiment
--]]
function PlayFabExperimentationApi:DeleteExperiment(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Experimentation/DeleteExperiment", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

--[[
    Gets the details of all experiments for a title.
    https://docs.microsoft.com/rest/api/playfab/experimentation/experimentation/getexperiments
--]]
function PlayFabExperimentationApi:GetExperiments(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Experimentation/GetExperiments", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

--[[
    Gets the latest scorecard of the experiment for the title.
    https://docs.microsoft.com/rest/api/playfab/experimentation/experimentation/getlatestscorecard
--]]
function PlayFabExperimentationApi:GetLatestScorecard(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Experimentation/GetLatestScorecard", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

--[[
    Gets the treatment assignments for a player for every running experiment in the title.
    https://docs.microsoft.com/rest/api/playfab/experimentation/experimentation/gettreatmentassignment
--]]
function PlayFabExperimentationApi:GetTreatmentAssignment(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Experimentation/GetTreatmentAssignment", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

--[[
    Starts an existing experiment for a title.
    https://docs.microsoft.com/rest/api/playfab/experimentation/experimentation/startexperiment
--]]
function PlayFabExperimentationApi:StartExperiment(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Experimentation/StartExperiment", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

--[[
    Stops an existing experiment for a title.
    https://docs.microsoft.com/rest/api/playfab/experimentation/experimentation/stopexperiment
--]]
function PlayFabExperimentationApi:StopExperiment(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Experimentation/StopExperiment", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

--[[
    Updates an existing experiment for a title.
    https://docs.microsoft.com/rest/api/playfab/experimentation/experimentation/updateexperiment
--]]
function PlayFabExperimentationApi:UpdateExperiment(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Experimentation/UpdateExperiment", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

return PlayFabExperimentationApi
