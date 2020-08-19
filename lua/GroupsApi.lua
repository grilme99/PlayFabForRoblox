local MakeRequest = require(script.Parent.HTTP).MakePlayFabApiCall
local PlayFab = require(script.Parent.PlayFab)
local Promise = require(script.Parent.Promise)
local TS = require(script.Parent.TS)

local PlayerData = PlayFab.PlayerData
local IsClientLoggedIn = PlayFab.IsClientLoggedIn

local AcceptGroupApplication = Promise.promisify(function(player, request)
	local data = PlayerData[player]
	if not IsClientLoggedIn(player) or not data then
		error("Must be logged in to call this method")
	end

	return TS.await(MakeRequest("/Group/AcceptGroupApplication", request, "X-EntityToken", data.EntityToken))
end)

local AcceptGroupInvitation = Promise.promisify(function(player, request)
	local data = PlayerData[player]
	if not IsClientLoggedIn(player) or not data then
		error("Must be logged in to call this method")
	end

	return TS.await(MakeRequest("/Group/AcceptGroupInvitation", request, "X-EntityToken", data.EntityToken))
end)

local AddMembers = Promise.promisify(function(player, request)
	local data = PlayerData[player]
	if not IsClientLoggedIn(player) or not data then
		error("Must be logged in to call this method")
	end

	return TS.await(MakeRequest("/Group/AddMembers", request, "X-EntityToken", data.EntityToken))
end)

local ApplyToGroup = Promise.promisify(function(player, request)
	local data = PlayerData[player]
	if not IsClientLoggedIn(player) or not data then
		error("Must be logged in to call this method")
	end

	return TS.await(MakeRequest("/Group/ApplyToGroup", request, "X-EntityToken", data.EntityToken))
end)

local BlockEntity = Promise.promisify(function(player, request)
	local data = PlayerData[player]
	if not IsClientLoggedIn(player) or not data then
		error("Must be logged in to call this method")
	end

	return TS.await(MakeRequest("/Group/BlockEntity", request, "X-EntityToken", data.EntityToken))
end)

local ChangeMemberRole = Promise.promisify(function(player, request)
	local data = PlayerData[player]
	if not IsClientLoggedIn(player) or not data then
		error("Must be logged in to call this method")
	end

	return TS.await(MakeRequest("/Group/ChangeMemberRole", request, "X-EntityToken", data.EntityToken))
end)

local CreateGroup = Promise.promisify(function(player, request)
	local data = PlayerData[player]
	if not IsClientLoggedIn(player) or not data then
		error("Must be logged in to call this method")
	end

	return TS.await(MakeRequest("/Group/CreateGroup", request, "X-EntityToken", data.EntityToken))
end)

local CreateRole = Promise.promisify(function(player, request)
	local data = PlayerData[player]
	if not IsClientLoggedIn(player) or not data then
		error("Must be logged in to call this method")
	end

	return TS.await(MakeRequest("/Group/CreateRole", request, "X-EntityToken", data.EntityToken))
end)

local DeleteGroup = Promise.promisify(function(player, request)
	local data = PlayerData[player]
	if not IsClientLoggedIn(player) or not data then
		error("Must be logged in to call this method")
	end

	return TS.await(MakeRequest("/Group/DeleteGroup", request, "X-EntityToken", data.EntityToken))
end)

local GetGroup = Promise.promisify(function(player, request)
	local data = PlayerData[player]
	if not IsClientLoggedIn(player) or not data then
		error("Must be logged in to call this method")
	end

	return TS.await(MakeRequest("/Group/GetGroup", request, "X-EntityToken", data.EntityToken))
end)

local InviteToGroup = Promise.promisify(function(player, request)
	local data = PlayerData[player]
	if not IsClientLoggedIn(player) or not data then
		error("Must be logged in to call this method")
	end

	return TS.await(MakeRequest("/Group/InviteToGroup", request, "X-EntityToken", data.EntityToken))
end)

local IsMember = Promise.promisify(function(player, request)
	local data = PlayerData[player]
	if not IsClientLoggedIn(player) or not data then
		error("Must be logged in to call this method")
	end

	return TS.await(MakeRequest("/Group/IsMember", request, "X-EntityToken", data.EntityToken))
end)

local ListGroupApplications = Promise.promisify(function(player, request)
	local data = PlayerData[player]
	if not IsClientLoggedIn(player) or not data then
		error("Must be logged in to call this method")
	end

	return TS.await(MakeRequest("/Group/ListGroupApplications", request, "X-EntityToken", data.EntityToken))
end)

local ListGroupMembers = Promise.promisify(function(player, request)
	local data = PlayerData[player]
	if not IsClientLoggedIn(player) or not data then
		error("Must be logged in to call this method")
	end

	return TS.await(MakeRequest("/Group/ListGroupMembers", request, "X-EntityToken", data.EntityToken))
end)

local ListMembership = Promise.promisify(function(player, request)
	local data = PlayerData[player]
	if not IsClientLoggedIn(player) or not data then
		error("Must be logged in to call this method")
	end

	return TS.await(MakeRequest("/Group/ListMembership", request, "X-EntityToken", data.EntityToken))
end)

local ListMembershipOpportunities = Promise.promisify(function(player, request)
	local data = PlayerData[player]
	if not IsClientLoggedIn(player) or not data then
		error("Must be logged in to call this method")
	end

	return TS.await(MakeRequest("/Group/ListMembershipOpportunities", request, "X-EntityToken", data.EntityToken))
end)

local RemoveGroupApplication = Promise.promisify(function(player, request)
	local data = PlayerData[player]
	if not IsClientLoggedIn(player) or not data then
		error("Must be logged in to call this method")
	end

	return TS.await(MakeRequest("/Group/RemoveGroupApplication", request, "X-EntityToken", data.EntityToken))
end)

local RemoveGroupInvitation = Promise.promisify(function(player, request)
	local data = PlayerData[player]
	if not IsClientLoggedIn(player) or not data then
		error("Must be logged in to call this method")
	end

	return TS.await(MakeRequest("/Group/RemoveGroupInvitation", request, "X-EntityToken", data.EntityToken))
end)

local RemoveMembers = Promise.promisify(function(player, request)
	local data = PlayerData[player]
	if not IsClientLoggedIn(player) or not data then
		error("Must be logged in to call this method")
	end

	return TS.await(MakeRequest("/Group/RemoveMembers", request, "X-EntityToken", data.EntityToken))
end)

local UnblockEntity = Promise.promisify(function(player, request)
	local data = PlayerData[player]
	if not IsClientLoggedIn(player) or not data then
		error("Must be logged in to call this method")
	end

	return TS.await(MakeRequest("/Group/UnblockEntity", request, "X-EntityToken", data.EntityToken))
end)

local UpdateGroup = Promise.promisify(function(player, request)
	local data = PlayerData[player]
	if not IsClientLoggedIn(player) or not data then
		error("Must be logged in to call this method")
	end

	return TS.await(MakeRequest("/Group/UpdateGroup", request, "X-EntityToken", data.EntityToken))
end)

local UpdateRole = Promise.promisify(function(player, request)
	local data = PlayerData[player]
	if not IsClientLoggedIn(player) or not data then
		error("Must be logged in to call this method")
	end

	return TS.await(MakeRequest("/Group/UpdateRole", request, "X-EntityToken", data.EntityToken))
end)

return {
	AcceptGroupApplication = AcceptGroupApplication,
	AcceptGroupInvitation = AcceptGroupInvitation,
	AddMembers = AddMembers,
	ApplyToGroup = ApplyToGroup,
	BlockEntity = BlockEntity,
	ChangeMemberRole = ChangeMemberRole,
	CreateGroup = CreateGroup,
	CreateRole = CreateRole,
	DeleteGroup = DeleteGroup,
	GetGroup = GetGroup,
	InviteToGroup = InviteToGroup,
	IsMember = IsMember,
	ListGroupApplications = ListGroupApplications,
	ListGroupMembers = ListGroupMembers,
	ListMembership = ListMembership,
	ListMembershipOpportunities = ListMembershipOpportunities,
	RemoveGroupApplication = RemoveGroupApplication,
	RemoveGroupInvitation = RemoveGroupInvitation,
	RemoveMembers = RemoveMembers,
	UnblockEntity = UnblockEntity,
	UpdateGroup = UpdateGroup,
	UpdateRole = UpdateRole,
}