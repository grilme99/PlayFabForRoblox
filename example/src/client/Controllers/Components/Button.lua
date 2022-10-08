--!strict

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Packages = ReplicatedStorage:WaitForChild("Packages")
local Fusion = require(Packages:WaitForChild("Fusion"))

local New = Fusion.New
local Children = Fusion.Children
local OnEvent = Fusion.OnEvent
local Computed = Fusion.Computed

export type Props = {
    AnchorPoint: Vector2?,
    Position: UDim2?,
    Size: UDim2?,
    BackgroundColor3: Color3?,
    TextColor3: Color3?,
    TextSize: number?,
    Text: never?, -- Not sure how to type Values
    Enabled: never?, -- Not sure how to type Values

    OnClick: () -> nil,
}

return function(props: Props)
    local disabled = Computed(function()
        if props.Enabled == nil then
            return false
        else
            return not props.Enabled:get()
        end
    end)

    local backgroundColor = Computed(function()
        return if disabled:get() then Color3.new(0.8, 0.8, 0.8) else props.BackgroundColor3
    end)

    local textColor = Computed(function()
        return if disabled:get() then Color3.new(0.2, 0.2, 0.2) else props.TextColor3
    end)

    return New("TextButton") {
        AnchorPoint = props.AnchorPoint,
        Position = props.Position,
        Size = props.Size,

        BackgroundColor3 = backgroundColor,
        TextColor3 = textColor,
        AutoButtonColor = true,

        Text = props.Text,
        Font = Enum.Font.GothamBlack,
        TextSize = props.TextSize,

        [OnEvent("Activated")] = function()
            props.OnClick()
        end,

        [Children] = {
            New("UICorner") {
                CornerRadius = UDim.new(0, 8),
            },
        },
    }
end
