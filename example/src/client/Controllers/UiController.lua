--!strict

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

local Packages = ReplicatedStorage:WaitForChild("Packages")
local Fusion = require(Packages:WaitForChild("Fusion"))

local New = Fusion.New
local Children = Fusion.Children
local Value = Fusion.Value

local Components = script.Parent:WaitForChild("Components")
local Button = require(Components:WaitForChild("Button"))

local Controllers = script.Parent
local MatchmakingController = require(Controllers:WaitForChild("MatchmakingController"))

local UiController = {}

function UiController:Start()
    local localPlayer = Players.LocalPlayer

    local ui = self:_createRootUi()
    ui.Parent = localPlayer.PlayerGui
end

function UiController:_createRootUi()
    local buttonEnabled = Value(true)
    local buttonText = Value("Join Queue")

    return New("ScreenGui") {
        ResetOnSpawn = false,

        [Children] = {
            New("Frame") {
                AnchorPoint = Vector2.new(0.5, 1),
                Position = UDim2.new(0.5, 0, 1, -20),
                Size = UDim2.new(1, 0, 0, 80),
                BackgroundTransparency = 1,

                [Children] = {
                    Button {
                        AnchorPoint = Vector2.new(0.5, 1),
                        Position = UDim2.fromScale(0.5, 1),
                        Size = UDim2.fromOffset(160, 48),
                        BackgroundColor3 = Color3.new(0, 0.8, 0),
                        TextColor3 = Color3.new(1, 1, 1),
                        TextSize = 16,
                        Text = buttonText,
                        Enabled = buttonEnabled,
                        OnClick = function()
                            buttonEnabled:set(false)
                            buttonText:set("Joined Queue")

                            MatchmakingController:JoinQueue()
                        end,
                    },
                },
            },
        },
    }
end

return UiController
