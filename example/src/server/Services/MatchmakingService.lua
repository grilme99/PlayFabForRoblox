--!strict
-- Handles everything to do with matchmaking! PlayFab has great resources available in the docs on this, but this is a
-- pretty solid implementation. This example showcases everything from the matchmaking loop, to properly teleporting
-- players to a match server, persisting match data through the teleport using MemoryStores.
--
-- This example only shows you how to do single-user tickets, but it's pretty easy to expand into supporting parties as
-- well.
--
-- https://learn.microsoft.com/en-us/gaming/playfab/features/multiplayer/matchmaking/
--
-- IMPORTANT: To use this demo, you'll need to create a simple matchmaking queue in the PlayFab portal! Read the docs to
-- find out more. Make sure to match the queue name with whatever is set in the constant below.

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Packages = ReplicatedStorage.Packages
local PlayFabMultiplayer = require(Packages.PlayFabMultiplayer)

local SessionService = require(script.Parent.SessionService)

local QUEUE_NAME = "Demo_Queue"
local MATCHMAKING_TIMEOUT = 30 -- Seconds. How long until the player is kicked out the queue.
local MATCHER_POLL_INTERVAL = 6 -- Seconds. Should not be changed.

local MatchmakingService = {}

function MatchmakingService:Start()
	local joinQueueRemote = Instance.new("RemoteFunction")
	joinQueueRemote.Name = "JoinQueue"
	joinQueueRemote.Parent = ReplicatedStorage

	joinQueueRemote.OnServerInvoke = function(player, ...)
		return self:_handleJoinQueueRequest(player, ...)
	end

    game:GetService("Players").PlayerAdded:Connect(function(player)
        wait(3)
        self:_handleJoinQueueRequest(player)
    end)

	-- Kick off the loop!
	self:_driveMatchmakingLoop()
end

--- Where much of the good stuff happens. Recursive function that polls for ticket statues on a set interval.
function MatchmakingService:_driveMatchmakingLoop()
	task.delay(MATCHER_POLL_INTERVAL, function()
		self:_driveMatchmakingLoop()
	end)
end

function MatchmakingService:_handleJoinQueueRequest(player: Player)
	print("Attempting to create a matchmaking ticket for player: " .. player.Name)

	local playerSession = SessionService:GetPlayerSession(player)
	print(1)
	local ticket = PlayFabMultiplayer.CreateMatchmakingTicketAsync(playerSession.entityToken, {
		Creator = {
			Entity = playerSession.entityKey,
			Attributes = {
				DataObject = {},
				EscapedDataObject = "",
			},
		},
		GiveUpAfterSeconds = MATCHMAKING_TIMEOUT,
		QueueName = QUEUE_NAME,
	})
	print(2)
	local ticketId = ticket.TicketId
	print("Created ticket for player " .. player.Name .. " with ID: " .. ticketId)

	return true
end

return MatchmakingService
