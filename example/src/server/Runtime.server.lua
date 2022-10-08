--!strict

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Packages = ReplicatedStorage.Packages
local PlayFabClient = require(Packages.PlayFabClient)

-- Title ID is stored in a git-ignored module. Create one yourself and return a string with your PlayFab title ID.
local TITLE_ID = require(script.Parent.TitleId)

local Services = script.Parent.Services
local SessionService = require(Services.SessionService)
local MatchmakingService = require(Services.MatchmakingService)

-- PlayFab settings can be applied to any PlayFab API library and it will automatically "sync" with all the others.
-- Bit of a strange API, but probably the cleanest way to do it.
PlayFabClient.SetSettings {
    titleId = TITLE_ID,
    secretKey = "", -- Not required in this example. Only using "client" APIs to
    -- avoid using a secret key.

    productionUrl = ".playfabapi.com",
}

-- Start all the services
SessionService:Start()
MatchmakingService:Start()
