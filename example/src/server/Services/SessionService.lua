--!strict
-- SessionManager handles all interaction with PlayFab and managing a player's PlayFab session.

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Packages = ReplicatedStorage.Packages
local PlayFabClient = require(Packages.PlayFabClient)

type IPlayerSession = {
	sessionTicket: string,
	playFabId: string,
	entityToken: string,
	entityKey: {
		Id: string,
		Type: string,
	},
}

local SessionService = {}
local PlayerSessions: { [Player]: IPlayerSession } = {}

function SessionService:Start()
	Players.PlayerAdded:Connect(function(player)
		self:_handlePlayerJoin(player)
	end)

	Players.PlayerRemoving:Connect(function(player)
		PlayerSessions[player] = nil
	end)
end

function SessionService:GetPlayerSession(player: Player): IPlayerSession
	if not PlayerSessions[player] then
		error("Player doesn't have a session yet!")
	end

	return PlayerSessions[player]
end

function SessionService:_handlePlayerJoin(player: Player)
	-- Probably a good place to add some retry and error handling logic. Remember that we're technically using
	-- client-side PlayFab APIs here, so they're a little trigger-happy with rate-limiting API requests.
	--
	-- If you didn't read the docs, we want to use PlayFab "client" APIs because PlayFab is designed to be accessed from
	-- the client in standard deployments (Unity, Unreal, etc), but we can only send HTTP requests from the server on
	-- Roblox. PlayFab's client APIs are just much nicer and better to use than the server ones.
	local response = PlayFabClient.LoginWithCustomIDAsync({
		CustomId = tostring(player.UserId),
		CreateAccount = true, -- Create an account if one doesn't exist
	})

	if response.EntityToken and response.EntityToken.Entity then
		-- Type assert here because technically these properties *can* be nil, but checking for that is too much code
		-- for an example. Do it yourself!
		local playfabId = response.PlayFabId :: string
		local sessionTicket = response.SessionTicket :: string
		local entityId = response.EntityToken.Entity.Id :: string
		local entityType = response.EntityToken.Entity.Type :: string
		local entityToken = response.EntityToken.EntityToken :: string

		PlayerSessions[player] = {
			playFabId = playfabId,
			sessionTicket = sessionTicket,
			entityToken = entityToken,
			entityKey = {
				Id = entityId,
				Type = entityType,
			},
		}

		-- Stylua formats this a little funky
		print(
			"----------------------\nPlayer "
				.. player.Name
				.. " authenticated with PlayFab:"
				.. "\n    PlayFab ID: "
				.. playfabId
				.. "\n    Entity ID: "
				.. entityId
				.. "\n    Entity Type: "
				.. entityType
				.. "\n    Session Ticket: "
				.. sessionTicket
				.. "\n    Entity Token: "
				.. entityToken
				.. "\n----------------------"
				.. "\n"
		)
	else
		error("Something went wrong!")
	end
end

return SessionService
