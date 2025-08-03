--[[
	This file was generated on 2025-08-03 at 00:04 UTC. Do not edit directly.

]]

local Types = require(script.Parent.Types)

local Common = require(script.Parent.Parent.PlayFabCommon)
local makeApiCall = Common.makeApiCall
type Result<T, E> = Common.Result<T, E>

local Apis = {}

--[[
	Lists all outstanding requests to join a group

	Lists all outstanding requests to join a group. Returns a list of all
	requests to join, as well as when the request will expire. To get the group
	applications for a specific entity, use ListMembershipOpportunities.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/groups/groups/listgroupapplications).

]]
function Apis.ListGroupApplications(request: Types.ListGroupApplicationsRequest, entityToken: string): Result<Types.ListGroupApplicationsResponse, string>
	return makeApiCall(
		"/Group/ListGroupApplications",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Deletes a group and all roles, invitations, join requests, and blocks
	associated with it.

	Deletes a group and all roles, invitations, join requests, and blocks
	associated with it. Permission to delete is only required the group itself
	to execute this action. The group and data cannot be cannot be recovered
	once removed, but any abuse reports about the group will remain. No data is
	returned in the case of success.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/groups/groups/deletegroup).

]]
function Apis.DeleteGroup(request: Types.DeleteGroupRequest, entityToken: string): Result<Types.EmptyResponse, string>
	return makeApiCall(
		"/Group/DeleteGroup",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Unblocks a list of entities from joining a group

	Unblocks a list of entities from joining a group. No data is returned in the
	case of success.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/groups/groups/unblockentity).

]]
function Apis.UnblockEntity(request: Types.UnblockEntityRequest, entityToken: string): Result<Types.EmptyResponse, string>
	return makeApiCall(
		"/Group/UnblockEntity",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Accepts an invitation to join a group

	Accepts an outstanding invitation to join the group if the invited entity is
	not blocked by the group. Only the invited entity or a parent in its chain
	(e.g. title) may accept the invitation on the invited entity's behalf.
	Nothing is returned in the case of success.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/groups/groups/acceptgroupinvitation).

	### Errors
	- EntityBlockedByGroup
	- EntityIsAlreadyMember
	- GroupInvitationNotFound
	- RoleDoesNotExist

]]
function Apis.AcceptGroupInvitation(request: Types.AcceptGroupInvitationRequest, entityToken: string): Result<Types.EmptyResponse, string>
	return makeApiCall(
		"/Group/AcceptGroupInvitation",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Blocks a list of entities from joining a group.

	Blocks a list of entities from joining a group. Blocked entities may not
	create new applications to join, be invited to join, accept an invitation,
	or have an application accepted. Failure due to being blocked does not clean
	up existing applications or invitations to the group. No data is returned in
	the case of success.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/groups/groups/blockentity).

]]
function Apis.BlockEntity(request: Types.BlockEntityRequest, entityToken: string): Result<Types.EmptyResponse, string>
	return makeApiCall(
		"/Group/BlockEntity",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Lists all outstanding invitations and group applications for an entity

	Lists all outstanding group applications and invitations for an entity.
	Anyone may call this for any entity, but data will only be returned for the
	entity or a parent of that entity. To list invitations or applications for a
	group to check if a player is trying to join, use ListGroupInvitations and
	ListGroupApplications.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/groups/groups/listmembershipopportunities).

]]
function Apis.ListMembershipOpportunities(request: Types.ListMembershipOpportunitiesRequest, entityToken: string): Result<Types.ListMembershipOpportunitiesResponse, string>
	return makeApiCall(
		"/Group/ListMembershipOpportunities",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Accepts an outstanding invitation to to join a group

	Accepts an outstanding invitation to to join a group if the invited entity
	is not blocked by the group. Nothing is returned in the case of success.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/groups/groups/acceptgroupapplication).

	### Errors
	- EntityBlockedByGroup
	- EntityIsAlreadyMember
	- GroupApplicationNotFound

]]
function Apis.AcceptGroupApplication(request: Types.AcceptGroupApplicationRequest, entityToken: string): Result<Types.EmptyResponse, string>
	return makeApiCall(
		"/Group/AcceptGroupApplication",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Adds members to a group or role.

	Adds members to a group or role. Existing members of the group will added to
	roles within the group, but if the user is not already a member of the
	group, only title claimants may add them to the group, and others must use
	the group application or invite system to add new members to a group.
	Returns nothing if successful.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/groups/groups/addmembers).

	### Errors
	- RoleDoesNotExist

]]
function Apis.AddMembers(request: Types.AddMembersRequest, entityToken: string): Result<Types.EmptyResponse, string>
	return makeApiCall(
		"/Group/AddMembers",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Removes members from a group.

	Removes members from a group. A member can always remove themselves from a
	group, regardless of permissions. Returns nothing if successful.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/groups/groups/removemembers).

	### Errors
	- RoleDoesNotExist

]]
function Apis.RemoveMembers(request: Types.RemoveMembersRequest, entityToken: string): Result<Types.EmptyResponse, string>
	return makeApiCall(
		"/Group/RemoveMembers",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Changes the role membership of a list of entities from one role to another.

	Changes the role membership of a list of entities from one role to another
	in in a single operation. The destination role must already exist. This is
	equivalent to adding the entities to the destination role and removing from
	the origin role. Returns nothing if successful.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/groups/groups/changememberrole).

	### Errors
	- RoleDoesNotExist

]]
function Apis.ChangeMemberRole(request: Types.ChangeMemberRoleRequest, entityToken: string): Result<Types.EmptyResponse, string>
	return makeApiCall(
		"/Group/ChangeMemberRole",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Creates a new group role.

	Creates a new role within an existing group, with no members. Both the role
	ID and role name must be unique within the group, but the name can be the
	same as the ID. The role ID is set at creation and cannot be changed.
	Returns information about the role that was created.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/groups/groups/createrole).

	### Errors
	- DuplicateRoleId
	- RoleNameNotAvailable

]]
function Apis.CreateRole(request: Types.CreateGroupRoleRequest, entityToken: string): Result<Types.CreateGroupRoleResponse, string>
	return makeApiCall(
		"/Group/CreateRole",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Creates a new group.

	Creates a new group, as well as administration and member roles, based off
	of a title's group template. Returns information about the group that was
	created.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/groups/groups/creategroup).

	### Errors
	- GroupNameNotAvailable

]]
function Apis.CreateGroup(request: Types.CreateGroupRequest, entityToken: string): Result<Types.CreateGroupResponse, string>
	return makeApiCall(
		"/Group/CreateGroup",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Gets information about a group and its roles

	Returns the ID, name, role list and other non-membership related information
	about a group.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/groups/groups/getgroup).

]]
function Apis.GetGroup(request: Types.GetGroupRequest, entityToken: string): Result<Types.GetGroupResponse, string>
	return makeApiCall(
		"/Group/GetGroup",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Deletes an existing role in a group.

	Returns information about the role

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/groups/groups/deleterole).

	### Errors
	- RoleDoesNotExist
	- RoleIsGroupAdmin
	- RoleIsGroupDefaultMember

]]
function Apis.DeleteRole(request: Types.DeleteRoleRequest, entityToken: string): Result<Types.EmptyResponse, string>
	return makeApiCall(
		"/Group/DeleteRole",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Invites a player to join a group

	Invites a player to join a group, if they are not blocked by the group. An
	optional role can be provided to automatically assign the player to the role
	if they accept the invitation. By default, if the entity has an application
	to the group outstanding, this will accept the application instead and
	return an error indicating such, rather than creating a duplicate invitation
	to join that will need to be cleaned up later. Returns information about the
	new invitation or an error indicating an existing application to join was
	accepted.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/groups/groups/invitetogroup).

	### Errors
	- EntityBlockedByGroup
	- EntityIsAlreadyMember
	- OutstandingApplicationAcceptedInstead
	- RoleDoesNotExist

]]
function Apis.InviteToGroup(request: Types.InviteToGroupRequest, entityToken: string): Result<Types.InviteToGroupResponse, string>
	return makeApiCall(
		"/Group/InviteToGroup",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Lists all groups and roles for an entity

	Lists the groups and roles that an entity is a part of, checking to see if
	group and role metadata and memberships should be visible to the caller. If
	the entity is not in any roles that are visible to the caller, the group is
	not returned in the results, even if the caller otherwise has permission to
	see that the entity is a member of that group.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/groups/groups/listmembership).

]]
function Apis.ListMembership(request: Types.ListMembershipRequest, entityToken: string): Result<Types.ListMembershipResponse, string>
	return makeApiCall(
		"/Group/ListMembership",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Lists all entities blocked from joining a group

	Lists all entities blocked from joining a group. A list of blocked entities
	is returned

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/groups/groups/listgroupblocks).

]]
function Apis.ListGroupBlocks(request: Types.ListGroupBlocksRequest, entityToken: string): Result<Types.ListGroupBlocksResponse, string>
	return makeApiCall(
		"/Group/ListGroupBlocks",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Applies to join a group

	Creates an application to join a group. Calling this while a group
	application already exists will return the same application instead of an
	error and will not refresh the time before the application expires. By
	default, if the entity has an invitation to join the group outstanding, this
	will accept the invitation to join the group instead and return an error
	indicating such, rather than creating a duplicate application to join that
	will need to be cleaned up later. Returns information about the application
	or an error indicating an invitation was accepted instead.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/groups/groups/applytogroup).

	### Errors
	- EntityBlockedByGroup
	- EntityIsAlreadyMember
	- OutstandingInvitationAcceptedInstead
	- RoleDoesNotExist

]]
function Apis.ApplyToGroup(request: Types.ApplyToGroupRequest, entityToken: string): Result<Types.ApplyToGroupResponse, string>
	return makeApiCall(
		"/Group/ApplyToGroup",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Lists all outstanding invitations for a group

	Lists all outstanding invitations for a group. Returns a list of entities
	that have been invited, as well as when the invitation will expire. To get
	the group invitations for a specific entity, use
	ListMembershipOpportunities.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/groups/groups/listgroupinvitations).

]]
function Apis.ListGroupInvitations(request: Types.ListGroupInvitationsRequest, entityToken: string): Result<Types.ListGroupInvitationsResponse, string>
	return makeApiCall(
		"/Group/ListGroupInvitations",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Updates non-membership data about a group.

	Updates data about a group, such as the name or default member role. Returns
	information about whether the update was successful. Only title claimants
	may modify the administration role for a group.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/groups/groups/updategroup).

	### Errors
	- GroupNameNotAvailable
	- RoleDoesNotExist

]]
function Apis.UpdateGroup(request: Types.UpdateGroupRequest, entityToken: string): Result<Types.UpdateGroupResponse, string>
	return makeApiCall(
		"/Group/UpdateGroup",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Lists all members for a group

	Gets a list of members and the roles they belong to within the group. If the
	caller does not have permission to view the role, and the member is in no
	other role, the member is not displayed. Returns a list of entities that are
	members of the group.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/groups/groups/listgroupmembers).

]]
function Apis.ListGroupMembers(request: Types.ListGroupMembersRequest, entityToken: string): Result<Types.ListGroupMembersResponse, string>
	return makeApiCall(
		"/Group/ListGroupMembers",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Updates metadata about a role.

	Updates the role name. Returns information about whether the update was
	successful.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/groups/groups/updaterole).

	### Errors
	- RoleDoesNotExist

]]
function Apis.UpdateRole(request: Types.UpdateGroupRoleRequest, entityToken: string): Result<Types.UpdateGroupRoleResponse, string>
	return makeApiCall(
		"/Group/UpdateRole",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Checks to see if an entity is a member of a group or role within the group

	Checks to see if an entity is a member of a group or role within the group.
	A result indicating if the entity is a member of the group is returned, or a
	permission error if the caller does not have permission to read the group's
	member list.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/groups/groups/ismember).

	### Errors
	- RoleDoesNotExist

]]
function Apis.IsMember(request: Types.IsMemberRequest, entityToken: string): Result<Types.IsMemberResponse, string>
	return makeApiCall(
		"/Group/IsMember",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Removes an application to join a group

	Removes an existing application to join the group. This is used for both
	rejection of an application as well as withdrawing an application. The
	applying entity or a parent in its chain (e.g. title) may withdraw the
	application, and any caller with appropriate access in the group may reject
	an application. No data is returned in the case of success.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/groups/groups/removegroupapplication).

	### Errors
	- GroupApplicationNotFound

]]
function Apis.RemoveGroupApplication(request: Types.RemoveGroupApplicationRequest, entityToken: string): Result<Types.EmptyResponse, string>
	return makeApiCall(
		"/Group/RemoveGroupApplication",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Removes an invitation join a group

	Removes an existing invitation to join the group. This is used for both
	rejection of an invitation as well as rescinding an invitation. The invited
	entity or a parent in its chain (e.g. title) may reject the invitation by
	calling this method, and any caller with appropriate access in the group may
	rescind an invitation. No data is returned in the case of success.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/groups/groups/removegroupinvitation).

	### Errors
	- GroupInvitationNotFound

]]
function Apis.RemoveGroupInvitation(request: Types.RemoveGroupInvitationRequest, entityToken: string): Result<Types.EmptyResponse, string>
	return makeApiCall(
		"/Group/RemoveGroupInvitation",
		request,
		"X-EntityToken",
		entityToken
	)
end

return Apis
