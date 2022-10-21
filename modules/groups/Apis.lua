--!strict

local PlayFabInternal = require(script.Parent.Parent.PlayFabInternal)
local Types = require(script.Parent.Types)

local Apis = {}

--- Accepts an outstanding invitation to to join a group if the invited entity is 
--- not blocked by the group. Nothing is returned in the case of success. 
---
--- https://docs.microsoft.com/rest/api/playfab/groups/groups/acceptgroupapplication
function Apis.AcceptGroupApplicationAsync(
	entityToken: string, 
	request: Types.AcceptGroupApplicationRequest
): Types.EmptyResponse
	return PlayFabInternal.MakeApiCall(
		"/Group/AcceptGroupApplication",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Accepts an outstanding invitation to join the group if the invited entity is 
--- not blocked by the group. Only the invited entity or a parent in its chain (e.g. 
--- title) may accept the invitation on the invited entity's behalf. Nothing is 
--- returned in the case of success. 
---
--- https://docs.microsoft.com/rest/api/playfab/groups/groups/acceptgroupinvitation
function Apis.AcceptGroupInvitationAsync(
	entityToken: string, 
	request: Types.AcceptGroupInvitationRequest
): Types.EmptyResponse
	return PlayFabInternal.MakeApiCall(
		"/Group/AcceptGroupInvitation",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Adds members to a group or role. Existing members of the group will added to 
--- roles within the group, but if the user is not already a member of the group, 
--- only title claimants may add them to the group, and others must use the group 
--- application or invite system to add new members to a group. Returns nothing 
--- if successful. 
---
--- https://docs.microsoft.com/rest/api/playfab/groups/groups/addmembers
function Apis.AddMembersAsync(
	entityToken: string, 
	request: Types.AddMembersRequest
): Types.EmptyResponse
	return PlayFabInternal.MakeApiCall(
		"/Group/AddMembers",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Creates an application to join a group. Calling this while a group application 
--- already exists will return the same application instead of an error and will 
--- not refresh the time before the application expires. By default, if the entity 
--- has an invitation to join the group outstanding, this will accept the invitation 
--- to join the group instead and return an error indicating such, rather than creating 
--- a duplicate application to join that will need to be cleaned up later. Returns 
--- information about the application or an error indicating an invitation was accepted 
--- instead. 
---
--- https://docs.microsoft.com/rest/api/playfab/groups/groups/applytogroup
function Apis.ApplyToGroupAsync(
	entityToken: string, 
	request: Types.ApplyToGroupRequest
): Types.ApplyToGroupResponse
	return PlayFabInternal.MakeApiCall(
		"/Group/ApplyToGroup",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Blocks a list of entities from joining a group. Blocked entities may not create 
--- new applications to join, be invited to join, accept an invitation, or have 
--- an application accepted. Failure due to being blocked does not clean up existing 
--- applications or invitations to the group. No data is returned in the case of 
--- success. 
---
--- https://docs.microsoft.com/rest/api/playfab/groups/groups/blockentity
function Apis.BlockEntityAsync(
	entityToken: string, 
	request: Types.BlockEntityRequest
): Types.EmptyResponse
	return PlayFabInternal.MakeApiCall(
		"/Group/BlockEntity",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Changes the role membership of a list of entities from one role to another in 
--- in a single operation. The destination role must already exist. This is equivalent 
--- to adding the entities to the destination role and removing from the origin 
--- role. Returns nothing if successful. 
---
--- https://docs.microsoft.com/rest/api/playfab/groups/groups/changememberrole
function Apis.ChangeMemberRoleAsync(
	entityToken: string, 
	request: Types.ChangeMemberRoleRequest
): Types.EmptyResponse
	return PlayFabInternal.MakeApiCall(
		"/Group/ChangeMemberRole",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Creates a new group, as well as administration and member roles, based off of 
--- a title's group template. Returns information about the group that was created. 
---
--- https://docs.microsoft.com/rest/api/playfab/groups/groups/creategroup
function Apis.CreateGroupAsync(
	entityToken: string, 
	request: Types.CreateGroupRequest
): Types.CreateGroupResponse
	return PlayFabInternal.MakeApiCall(
		"/Group/CreateGroup",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Creates a new role within an existing group, with no members. Both the role 
--- ID and role name must be unique within the group, but the name can be the same 
--- as the ID. The role ID is set at creation and cannot be changed. Returns information 
--- about the role that was created. 
---
--- https://docs.microsoft.com/rest/api/playfab/groups/groups/createrole
function Apis.CreateRoleAsync(
	entityToken: string, 
	request: Types.CreateGroupRoleRequest
): Types.CreateGroupRoleResponse
	return PlayFabInternal.MakeApiCall(
		"/Group/CreateRole",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Deletes a group and all roles, invitations, join requests, and blocks associated 
--- with it. Permission to delete is only required the group itself to execute this 
--- action. The group and data cannot be cannot be recovered once removed, but any 
--- abuse reports about the group will remain. No data is returned in the case of 
--- success. 
---
--- https://docs.microsoft.com/rest/api/playfab/groups/groups/deletegroup
function Apis.DeleteGroupAsync(
	entityToken: string, 
	request: Types.DeleteGroupRequest
): Types.EmptyResponse
	return PlayFabInternal.MakeApiCall(
		"/Group/DeleteGroup",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Returns information about the role 
---
--- https://docs.microsoft.com/rest/api/playfab/groups/groups/deleterole
function Apis.DeleteRoleAsync(
	entityToken: string, 
	request: Types.DeleteRoleRequest
): Types.EmptyResponse
	return PlayFabInternal.MakeApiCall(
		"/Group/DeleteRole",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Returns the ID, name, role list and other non-membership related information 
--- about a group. 
---
--- https://docs.microsoft.com/rest/api/playfab/groups/groups/getgroup
function Apis.GetGroupAsync(
	entityToken: string, 
	request: Types.GetGroupRequest
): Types.GetGroupResponse
	return PlayFabInternal.MakeApiCall(
		"/Group/GetGroup",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Invites a player to join a group, if they are not blocked by the group. An optional 
--- role can be provided to automatically assign the player to the role if they 
--- accept the invitation. By default, if the entity has an application to the group 
--- outstanding, this will accept the application instead and return an error indicating 
--- such, rather than creating a duplicate invitation to join that will need to 
--- be cleaned up later. Returns information about the new invitation or an error 
--- indicating an existing application to join was accepted. 
---
--- https://docs.microsoft.com/rest/api/playfab/groups/groups/invitetogroup
function Apis.InviteToGroupAsync(
	entityToken: string, 
	request: Types.InviteToGroupRequest
): Types.InviteToGroupResponse
	return PlayFabInternal.MakeApiCall(
		"/Group/InviteToGroup",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Checks to see if an entity is a member of a group or role within the group. 
--- A result indicating if the entity is a member of the group is returned, or a 
--- permission error if the caller does not have permission to read the group's 
--- member list. 
---
--- https://docs.microsoft.com/rest/api/playfab/groups/groups/ismember
function Apis.IsMemberAsync(
	entityToken: string, 
	request: Types.IsMemberRequest
): Types.IsMemberResponse
	return PlayFabInternal.MakeApiCall(
		"/Group/IsMember",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Lists all outstanding requests to join a group. Returns a list of all requests 
--- to join, as well as when the request will expire. To get the group applications 
--- for a specific entity, use ListMembershipOpportunities. 
---
--- https://docs.microsoft.com/rest/api/playfab/groups/groups/listgroupapplications
function Apis.ListGroupApplicationsAsync(
	entityToken: string, 
	request: Types.ListGroupApplicationsRequest
): Types.ListGroupApplicationsResponse
	return PlayFabInternal.MakeApiCall(
		"/Group/ListGroupApplications",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Lists all entities blocked from joining a group. A list of blocked entities 
--- is returned 
---
--- https://docs.microsoft.com/rest/api/playfab/groups/groups/listgroupblocks
function Apis.ListGroupBlocksAsync(
	entityToken: string, 
	request: Types.ListGroupBlocksRequest
): Types.ListGroupBlocksResponse
	return PlayFabInternal.MakeApiCall(
		"/Group/ListGroupBlocks",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Lists all outstanding invitations for a group. Returns a list of entities that 
--- have been invited, as well as when the invitation will expire. To get the group 
--- invitations for a specific entity, use ListMembershipOpportunities. 
---
--- https://docs.microsoft.com/rest/api/playfab/groups/groups/listgroupinvitations
function Apis.ListGroupInvitationsAsync(
	entityToken: string, 
	request: Types.ListGroupInvitationsRequest
): Types.ListGroupInvitationsResponse
	return PlayFabInternal.MakeApiCall(
		"/Group/ListGroupInvitations",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Gets a list of members and the roles they belong to within the group. If the 
--- caller does not have permission to view the role, and the member is in no other 
--- role, the member is not displayed. Returns a list of entities that are members 
--- of the group. 
---
--- https://docs.microsoft.com/rest/api/playfab/groups/groups/listgroupmembers
function Apis.ListGroupMembersAsync(
	entityToken: string, 
	request: Types.ListGroupMembersRequest
): Types.ListGroupMembersResponse
	return PlayFabInternal.MakeApiCall(
		"/Group/ListGroupMembers",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Lists the groups and roles that an entity is a part of, checking to see if group 
--- and role metadata and memberships should be visible to the caller. If the entity 
--- is not in any roles that are visible to the caller, the group is not returned 
--- in the results, even if the caller otherwise has permission to see that the 
--- entity is a member of that group. 
---
--- https://docs.microsoft.com/rest/api/playfab/groups/groups/listmembership
function Apis.ListMembershipAsync(
	entityToken: string, 
	request: Types.ListMembershipRequest
): Types.ListMembershipResponse
	return PlayFabInternal.MakeApiCall(
		"/Group/ListMembership",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Lists all outstanding group applications and invitations for an entity. Anyone 
--- may call this for any entity, but data will only be returned for the entity 
--- or a parent of that entity. To list invitations or applications for a group 
--- to check if a player is trying to join, use ListGroupInvitations and ListGroupApplications. 
---
--- https://docs.microsoft.com/rest/api/playfab/groups/groups/listmembershipopportunities
function Apis.ListMembershipOpportunitiesAsync(
	entityToken: string, 
	request: Types.ListMembershipOpportunitiesRequest
): Types.ListMembershipOpportunitiesResponse
	return PlayFabInternal.MakeApiCall(
		"/Group/ListMembershipOpportunities",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Removes an existing application to join the group. This is used for both rejection 
--- of an application as well as withdrawing an application. The applying entity 
--- or a parent in its chain (e.g. title) may withdraw the application, and any 
--- caller with appropriate access in the group may reject an application. No data 
--- is returned in the case of success. 
---
--- https://docs.microsoft.com/rest/api/playfab/groups/groups/removegroupapplication
function Apis.RemoveGroupApplicationAsync(
	entityToken: string, 
	request: Types.RemoveGroupApplicationRequest
): Types.EmptyResponse
	return PlayFabInternal.MakeApiCall(
		"/Group/RemoveGroupApplication",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Removes an existing invitation to join the group. This is used for both rejection 
--- of an invitation as well as rescinding an invitation. The invited entity or 
--- a parent in its chain (e.g. title) may reject the invitation by calling this 
--- method, and any caller with appropriate access in the group may rescind an invitation. 
--- No data is returned in the case of success. 
---
--- https://docs.microsoft.com/rest/api/playfab/groups/groups/removegroupinvitation
function Apis.RemoveGroupInvitationAsync(
	entityToken: string, 
	request: Types.RemoveGroupInvitationRequest
): Types.EmptyResponse
	return PlayFabInternal.MakeApiCall(
		"/Group/RemoveGroupInvitation",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Removes members from a group. A member can always remove themselves from a group, 
--- regardless of permissions. Returns nothing if successful. 
---
--- https://docs.microsoft.com/rest/api/playfab/groups/groups/removemembers
function Apis.RemoveMembersAsync(
	entityToken: string, 
	request: Types.RemoveMembersRequest
): Types.EmptyResponse
	return PlayFabInternal.MakeApiCall(
		"/Group/RemoveMembers",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Unblocks a list of entities from joining a group. No data is returned in the 
--- case of success. 
---
--- https://docs.microsoft.com/rest/api/playfab/groups/groups/unblockentity
function Apis.UnblockEntityAsync(
	entityToken: string, 
	request: Types.UnblockEntityRequest
): Types.EmptyResponse
	return PlayFabInternal.MakeApiCall(
		"/Group/UnblockEntity",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Updates data about a group, such as the name or default member role. Returns 
--- information about whether the update was successful. Only title claimants may 
--- modify the administration role for a group. 
---
--- https://docs.microsoft.com/rest/api/playfab/groups/groups/updategroup
function Apis.UpdateGroupAsync(
	entityToken: string, 
	request: Types.UpdateGroupRequest
): Types.UpdateGroupResponse
	return PlayFabInternal.MakeApiCall(
		"/Group/UpdateGroup",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Updates the role name. Returns information about whether the update was successful. 
---
--- https://docs.microsoft.com/rest/api/playfab/groups/groups/updaterole
function Apis.UpdateRoleAsync(
	entityToken: string, 
	request: Types.UpdateGroupRoleRequest
): Types.UpdateGroupRoleResponse
	return PlayFabInternal.MakeApiCall(
		"/Group/UpdateRole",
		request,
		"X-EntityToken",
		entityToken
	)
end

return Apis

