--!strict

local Controllers = script.Parent:WaitForChild("Controllers")

local UiController = require(Controllers:WaitForChild("UiController"))
local MatchmakingController = require(Controllers:WaitForChild("MatchmakingController"))

UiController:Start()
MatchmakingController:Start()
