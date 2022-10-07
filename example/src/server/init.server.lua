--!strict

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Packages = ReplicatedStorage.Packages
local PlayFabClient = require(Packages.PlayFabClient)

local TITLE_ID = "1234"

PlayFabClient.SetSettings({
	titleId = TITLE_ID,
	secretKey = "", -- Not required in this example. Only using "client" APIs to
	-- avoid using a secret key.

	productionUrl = ".playfabapi.com",
})

Players.PlayerAdded:Connect(function(player)
	local a = PlayFabClient.LoginWithCustomIDAsync({
		TitleId = TITLE_ID,
		CreateAccount = true,
		CustomId = tostring(player.UserId),
	})

	print(a)
end)
