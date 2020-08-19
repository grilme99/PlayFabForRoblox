-- Compiled with https://roblox-ts.github.io v0.3.2
-- August 19, 2020, 6:12 PM British Summer Time

local TS = _G[script];
local exports = {};
local MakeRequest = TS.import(script, script.Parent, "HTTP").default;
local _0 = TS.import(script, script.Parent, "PlayFab");
local PlayerData, IsClientLoggedIn = _0.PlayerData, _0.IsClientLoggedIn;
local AcceptGroupApplication = TS.async(function(player, request)
	local data = PlayerData[player];
	if (not (IsClientLoggedIn(player))) or (not (data)) then
		error('Must be logged in to call this method');
	end;
	local result = TS.await(MakeRequest('/Group/AcceptGroupApplication', request, 'X-EntityToken', data.EntityToken));
	return result;
end);
local AcceptGroupInvitation = TS.async(function(player, request)
	local data = PlayerData[player];
	if (not (IsClientLoggedIn(player))) or (not (data)) then
		error('Must be logged in to call this method');
	end;
	local result = TS.await(MakeRequest('/Group/AcceptGroupInvitation', request, 'X-EntityToken', data.EntityToken));
	return result;
end);
local AddMembers = TS.async(function(player, request)
	local data = PlayerData[player];
	if (not (IsClientLoggedIn(player))) or (not (data)) then
		error('Must be logged in to call this method');
	end;
	local result = TS.await(MakeRequest('/Group/AddMembers', request, 'X-EntityToken', data.EntityToken));
	return result;
end);
local ApplyToGroup = TS.async(function(player, request)
	local data = PlayerData[player];
	if (not (IsClientLoggedIn(player))) or (not (data)) then
		error('Must be logged in to call this method');
	end;
	local result = TS.await(MakeRequest('/Group/ApplyToGroup', request, 'X-EntityToken', data.EntityToken));
	return result;
end);
local BlockEntity = TS.async(function(player, request)
	local data = PlayerData[player];
	if (not (IsClientLoggedIn(player))) or (not (data)) then
		error('Must be logged in to call this method');
	end;
	local result = TS.await(MakeRequest('/Group/BlockEntity', request, 'X-EntityToken', data.EntityToken));
	return result;
end);
local ChangeMemberRole = TS.async(function(player, request)
	local data = PlayerData[player];
	if (not (IsClientLoggedIn(player))) or (not (data)) then
		error('Must be logged in to call this method');
	end;
	local result = TS.await(MakeRequest('/Group/ChangeMemberRole', request, 'X-EntityToken', data.EntityToken));
	return result;
end);
local CreateGroup = TS.async(function(player, request)
	local data = PlayerData[player];
	if (not (IsClientLoggedIn(player))) or (not (data)) then
		error('Must be logged in to call this method');
	end;
	local result = TS.await(MakeRequest('/Group/CreateGroup', request, 'X-EntityToken', data.EntityToken));
	return result;
end);
local CreateRole = TS.async(function(player, request)
	local data = PlayerData[player];
	if (not (IsClientLoggedIn(player))) or (not (data)) then
		error('Must be logged in to call this method');
	end;
	local result = TS.await(MakeRequest('/Group/CreateRole', request, 'X-EntityToken', data.EntityToken));
	return result;
end);
local DeleteGroup = TS.async(function(player, request)
	local data = PlayerData[player];
	if (not (IsClientLoggedIn(player))) or (not (data)) then
		error('Must be logged in to call this method');
	end;
	local result = TS.await(MakeRequest('/Group/DeleteGroup', request, 'X-EntityToken', data.EntityToken));
	return result;
end);
local GetGroup = TS.async(function(player, request)
	local data = PlayerData[player];
	if (not (IsClientLoggedIn(player))) or (not (data)) then
		error('Must be logged in to call this method');
	end;
	local result = TS.await(MakeRequest('/Group/GetGroup', request, 'X-EntityToken', data.EntityToken));
	return result;
end);
local InviteToGroup = TS.async(function(player, request)
	local data = PlayerData[player];
	if (not (IsClientLoggedIn(player))) or (not (data)) then
		error('Must be logged in to call this method');
	end;
	local result = TS.await(MakeRequest('/Group/InviteToGroup', request, 'X-EntityToken', data.EntityToken));
	return result;
end);
local IsMember = TS.async(function(player, request)
	local data = PlayerData[player];
	if (not (IsClientLoggedIn(player))) or (not (data)) then
		error('Must be logged in to call this method');
	end;
	local result = TS.await(MakeRequest('/Group/IsMember', request, 'X-EntityToken', data.EntityToken));
	return result;
end);
local ListGroupApplications = TS.async(function(player, request)
	local data = PlayerData[player];
	if (not (IsClientLoggedIn(player))) or (not (data)) then
		error('Must be logged in to call this method');
	end;
	local result = TS.await(MakeRequest('/Group/ListGroupApplications', request, 'X-EntityToken', data.EntityToken));
	return result;
end);
local ListGroupMembers = TS.async(function(player, request)
	local data = PlayerData[player];
	if (not (IsClientLoggedIn(player))) or (not (data)) then
		error('Must be logged in to call this method');
	end;
	local result = TS.await(MakeRequest('/Group/ListGroupMembers', request, 'X-EntityToken', data.EntityToken));
	return result;
end);
local ListMembership = TS.async(function(player, request)
	local data = PlayerData[player];
	if (not (IsClientLoggedIn(player))) or (not (data)) then
		error('Must be logged in to call this method');
	end;
	local result = TS.await(MakeRequest('/Group/ListMembership', request, 'X-EntityToken', data.EntityToken));
	return result;
end);
local ListMembershipOpportunities = TS.async(function(player, request)
	local data = PlayerData[player];
	if (not (IsClientLoggedIn(player))) or (not (data)) then
		error('Must be logged in to call this method');
	end;
	local result = TS.await(MakeRequest('/Group/ListMembershipOpportunities', request, 'X-EntityToken', data.EntityToken));
	return result;
end);
local RemoveGroupApplication = TS.async(function(player, request)
	local data = PlayerData[player];
	if (not (IsClientLoggedIn(player))) or (not (data)) then
		error('Must be logged in to call this method');
	end;
	local result = TS.await(MakeRequest('/Group/RemoveGroupApplication', request, 'X-EntityToken', data.EntityToken));
	return result;
end);
local RemoveGroupInvitation = TS.async(function(player, request)
	local data = PlayerData[player];
	if (not (IsClientLoggedIn(player))) or (not (data)) then
		error('Must be logged in to call this method');
	end;
	local result = TS.await(MakeRequest('/Group/RemoveGroupInvitation', request, 'X-EntityToken', data.EntityToken));
	return result;
end);
local RemoveMembers = TS.async(function(player, request)
	local data = PlayerData[player];
	if (not (IsClientLoggedIn(player))) or (not (data)) then
		error('Must be logged in to call this method');
	end;
	local result = TS.await(MakeRequest('/Group/RemoveMembers', request, 'X-EntityToken', data.EntityToken));
	return result;
end);
local UnblockEntity = TS.async(function(player, request)
	local data = PlayerData[player];
	if (not (IsClientLoggedIn(player))) or (not (data)) then
		error('Must be logged in to call this method');
	end;
	local result = TS.await(MakeRequest('/Group/UnblockEntity', request, 'X-EntityToken', data.EntityToken));
	return result;
end);
local UpdateGroup = TS.async(function(player, request)
	local data = PlayerData[player];
	if (not (IsClientLoggedIn(player))) or (not (data)) then
		error('Must be logged in to call this method');
	end;
	local result = TS.await(MakeRequest('/Group/UpdateGroup', request, 'X-EntityToken', data.EntityToken));
	return result;
end);
local UpdateRole = TS.async(function(player, request)
	local data = PlayerData[player];
	if (not (IsClientLoggedIn(player))) or (not (data)) then
		error('Must be logged in to call this method');
	end;
	local result = TS.await(MakeRequest('/Group/UpdateRole', request, 'X-EntityToken', data.EntityToken));
	return result;
end);
exports.AcceptGroupApplication = AcceptGroupApplication;
exports.AcceptGroupInvitation = AcceptGroupInvitation;
exports.AddMembers = AddMembers;
exports.ApplyToGroup = ApplyToGroup;
exports.BlockEntity = BlockEntity;
exports.ChangeMemberRole = ChangeMemberRole;
exports.CreateGroup = CreateGroup;
exports.CreateRole = CreateRole;
exports.DeleteGroup = DeleteGroup;
exports.GetGroup = GetGroup;
exports.InviteToGroup = InviteToGroup;
exports.IsMember = IsMember;
exports.ListGroupApplications = ListGroupApplications;
exports.ListGroupMembers = ListGroupMembers;
exports.ListMembership = ListMembership;
exports.ListMembershipOpportunities = ListMembershipOpportunities;
exports.RemoveGroupApplication = RemoveGroupApplication;
exports.RemoveGroupInvitation = RemoveGroupInvitation;
exports.RemoveMembers = RemoveMembers;
exports.UnblockEntity = UnblockEntity;
exports.UpdateGroup = UpdateGroup;
exports.UpdateRole = UpdateRole;
return exports;
