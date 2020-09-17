-- PlayFab Data API
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

local PlayFabDataApi = {
    settings = PlayFabSettings.settings
}

--[[
    Abort pending file uploads to an entity's profile.
    https://docs.microsoft.com/rest/api/playfab/data/file/abortfileuploads
--]]
function PlayFabDataApi:AbortFileUploads(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/File/AbortFileUploads", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

--[[
    Delete files on an entity's profile.
    https://docs.microsoft.com/rest/api/playfab/data/file/deletefiles
--]]
function PlayFabDataApi:DeleteFiles(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/File/DeleteFiles", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

--[[
    Finalize file uploads to an entity's profile.
    https://docs.microsoft.com/rest/api/playfab/data/file/finalizefileuploads
--]]
function PlayFabDataApi:FinalizeFileUploads(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/File/FinalizeFileUploads", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

--[[
    Retrieves file metadata from an entity's profile.
    https://docs.microsoft.com/rest/api/playfab/data/file/getfiles
--]]
function PlayFabDataApi:GetFiles(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/File/GetFiles", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

--[[
    Retrieves objects from an entity's profile.
    https://docs.microsoft.com/rest/api/playfab/data/object/getobjects
--]]
function PlayFabDataApi:GetObjects(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Object/GetObjects", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

--[[
    Initiates file uploads to an entity's profile.
    https://docs.microsoft.com/rest/api/playfab/data/file/initiatefileuploads
--]]
function PlayFabDataApi:InitiateFileUploads(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/File/InitiateFileUploads", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

--[[
    Sets objects on an entity's profile.
    https://docs.microsoft.com/rest/api/playfab/data/object/setobjects
--]]
function PlayFabDataApi:SetObjects(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Object/SetObjects", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

return PlayFabDataApi
