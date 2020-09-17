local ReplicatedStorage = game:GetService("ReplicatedStorage")

local TS = require(ReplicatedStorage.rbxts_include.RuntimeLib)
local TestEZ = require(ReplicatedStorage.rbxts_include.node_modules.testez.src)

local testsFolder = ReplicatedStorage.TS

for _, script in pairs(testsFolder:GetDescendants()) do
	if script.Name:match(".spec") then
		_G[script] = TS
	end
end

local results = TestEZ.TestBootstrap:run({testsFolder}, TestEZ.Reporters.TextReporter)

if #results.errors > 0 or results.failureCount > 0 then
	error("Tests failed")
end