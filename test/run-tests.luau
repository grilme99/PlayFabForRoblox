local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Packages = ReplicatedStorage.Packages
local Jest = require(Packages.Jest)

Jest.runCLI(ReplicatedStorage.PlayFab, {
	verbose = true,
	ci = false,
}, { ReplicatedStorage.PlayFab })
