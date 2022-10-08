local ReplicatedStorage = game:GetService("ReplicatedStorage")

local JoinQueueRemote = ReplicatedStorage:WaitForChild("JoinQueue") :: RemoteFunction

local MatchmakingController = {}

function MatchmakingController:Start() end

function MatchmakingController:JoinQueue()
    print("Requesting to join matchmaking queue")
    local res = JoinQueueRemote:InvokeServer()
    print("Got join queue response:", res)
end

return MatchmakingController
