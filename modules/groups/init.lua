--!strict
--[=[
	# GroupsApi

	The Groups API is designed for any permanent or semi-permanent collections of 
	Entities (players, or non-players). If you want to make Guilds/Clans/Corporations/etc., 
	then you should use groups. Groups can also be used to make chatrooms, parties, 
	or any other persistent collection of entities. 
]=]

local PlayFabInternal = require(script.Parent.PlayFabInternal)

local GroupsApi = {}

function GroupsApi.SetSettings(settings: PlayFabInternal.ISettings)
	PlayFabInternal.SetSettings(settings)
end

--- Accepts an outstanding invitation to to join a group if the invited entity is 
--- not blocked by the group. Nothing is returned in the case of success. 
export type AcceptGroupApplicationRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- Type of the entity to accept as. Must be the same entity as the claimant or 
	--- an entity that is a child of the claimant entity. 
	Entity: EntityKey,
	--- The identifier of the group 
	Group: EntityKey,
}

--- Accepts an outstanding invitation to join the group if the invited entity is 
--- not blocked by the group. Only the invited entity or a parent in its chain (e.g. 
--- title) may accept the invitation on the invited entity's behalf. Nothing is 
--- returned in the case of success. 
export type AcceptGroupInvitationRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The optional entity to perform this action on. Defaults to the currently logged 
	--- in entity. 
	Entity: EntityKey?,
	--- The identifier of the group 
	Group: EntityKey,
}

--- Adds members to a group or role. Existing members of the group will added to 
--- roles within the group, but if the user is not already a member of the group, 
--- only title claimants may add them to the group, and others must use the group 
--- application or invite system to add new members to a group. Returns nothing 
--- if successful. 
export type AddMembersRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The identifier of the group 
	Group: EntityKey,
	--- List of entities to add to the group. Only entities of type title_player_account 
	--- and character may be added to groups. 
	Members: {EntityKey},
	--- Optional: The ID of the existing role to add the entities to. If this is not 
	--- specified, the default member role for the group will be used. Role IDs must 
	--- be between 1 and 64 characters long. 
	RoleId: string?,
}

--- The basic wrapper around every failed API response 
export type ApiErrorWrapper = {
	--- Numerical HTTP code 
	code: number,
	--- Playfab error code 
	error: string?,
	--- Numerical PlayFab error code 
	errorCode: number,
	--- Detailed description of individual issues with the request object 
	errorDetails: {[any]: any}?,
	--- Description for the PlayFab errorCode 
	errorMessage: string?,
	--- String HTTP code 
	status: string?,
}

--- Creates an application to join a group. Calling this while a group application 
--- already exists will return the same application instead of an error and will 
--- not refresh the time before the application expires. By default, if the entity 
--- has an invitation to join the group outstanding, this will accept the invitation 
--- to join the group instead and return an error indicating such, rather than creating 
--- a duplicate application to join that will need to be cleaned up later. Returns 
--- information about the application or an error indicating an invitation was accepted 
--- instead. 
export type ApplyToGroupRequest = {
	--- Optional, default true. Automatically accept an outstanding invitation if one 
	--- exists instead of creating an application 
	AutoAcceptOutstandingInvite: boolean?,
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The optional entity to perform this action on. Defaults to the currently logged 
	--- in entity. 
	Entity: EntityKey?,
	--- The identifier of the group 
	Group: EntityKey,
}

--- Describes an application to join a group 
export type ApplyToGroupResponse = {
	--- Type of entity that requested membership 
	Entity: EntityWithLineage?,
	--- When the application to join will expire and be deleted 
	Expires: string,
	--- ID of the group that the entity requesting membership to 
	Group: EntityKey?,
}

--- Blocks a list of entities from joining a group. Blocked entities may not create 
--- new applications to join, be invited to join, accept an invitation, or have 
--- an application accepted. Failure due to being blocked does not clean up existing 
--- applications or invitations to the group. No data is returned in the case of 
--- success. 
export type BlockEntityRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The entity to perform this action on. 
	Entity: EntityKey,
	--- The identifier of the group 
	Group: EntityKey,
}

--- Changes the role membership of a list of entities from one role to another in 
--- in a single operation. The destination role must already exist. This is equivalent 
--- to adding the entities to the destination role and removing from the origin 
--- role. Returns nothing if successful. 
export type ChangeMemberRoleRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The ID of the role that the entities will become a member of. This must be an 
	--- existing role. Role IDs must be between 1 and 64 characters long. 
	DestinationRoleId: string?,
	--- The identifier of the group 
	Group: EntityKey,
	--- List of entities to move between roles in the group. All entities in this list 
	--- must be members of the group and origin role. 
	Members: {EntityKey},
	--- The ID of the role that the entities currently are a member of. Role IDs must 
	--- be between 1 and 64 characters long. 
	OriginRoleId: string,
}

--- Creates a new group, as well as administration and member roles, based off of 
--- a title's group template. Returns information about the group that was created. 
export type CreateGroupRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The optional entity to perform this action on. Defaults to the currently logged 
	--- in entity. 
	Entity: EntityKey?,
	--- The name of the group. This is unique at the title level by default. 
	GroupName: string,
}

export type CreateGroupResponse = {
	--- The ID of the administrator role for the group. 
	AdminRoleId: string?,
	--- The server date and time the group was created. 
	Created: string,
	--- The identifier of the group 
	Group: EntityKey,
	--- The name of the group. 
	GroupName: string?,
	--- The ID of the default member role for the group. 
	MemberRoleId: string?,
	--- The current version of the profile, can be used for concurrency control during 
	--- updates. 
	ProfileVersion: number,
	--- The list of roles and names that belong to the group. 
	Roles: {[any]: any}?,
}

--- Creates a new role within an existing group, with no members. Both the role 
--- ID and role name must be unique within the group, but the name can be the same 
--- as the ID. The role ID is set at creation and cannot be changed. Returns information 
--- about the role that was created. 
export type CreateGroupRoleRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The identifier of the group 
	Group: EntityKey,
	--- The ID of the role. This must be unique within the group and cannot be changed. 
	--- Role IDs must be between 1 and 64 characters long and are restricted to a-Z, 
	--- A-Z, 0-9, '(', ')', '_', '-' and '.'. 
	RoleId: string,
	--- The name of the role. This must be unique within the group and can be changed 
	--- later. Role names must be between 1 and 100 characters long 
	RoleName: string,
}

export type CreateGroupRoleResponse = {
	--- The current version of the group profile, can be used for concurrency control 
	--- during updates. 
	ProfileVersion: number,
	--- ID for the role 
	RoleId: string?,
	--- The name of the role 
	RoleName: string?,
}

--- Deletes a group and all roles, invitations, join requests, and blocks associated 
--- with it. Permission to delete is only required the group itself to execute this 
--- action. The group and data cannot be cannot be recovered once removed, but any 
--- abuse reports about the group will remain. No data is returned in the case of 
--- success. 
export type DeleteGroupRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- ID of the group or role to remove 
	Group: EntityKey,
}

--- Returns information about the role 
export type DeleteRoleRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The identifier of the group 
	Group: EntityKey,
	--- The ID of the role to delete. Role IDs must be between 1 and 64 characters long. 
	RoleId: string?,
}

export type EmptyResponse = {
}

--- Combined entity type and ID structure which uniquely identifies a single entity. 
export type EntityKey = {
	--- Unique ID of the entity. 
	Id: string,
	--- Entity type. See https://docs.microsoft.com/gaming/playfab/features/data/entities/available-built-in-entity-types 
	Type: string?,
}

export type EntityMemberRole = {
	--- The list of members in the role 
	Members: {EntityWithLineage}?,
	--- The ID of the role. 
	RoleId: string?,
	--- The name of the role 
	RoleName: string?,
}

--- Entity wrapper class that contains the entity key and the entities that make 
--- up the lineage of the entity. 
export type EntityWithLineage = {
	--- The entity key for the specified entity 
	Key: EntityKey?,
	--- Dictionary of entity keys for related entities. Dictionary key is entity type. 
	Lineage: EntityKey?,
}

--- Returns the ID, name, role list and other non-membership related information 
--- about a group. 
export type GetGroupRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The identifier of the group 
	Group: EntityKey?,
	--- The full name of the group 
	GroupName: string?,
}

export type GetGroupResponse = {
	--- The ID of the administrator role for the group. 
	AdminRoleId: string?,
	--- The server date and time the group was created. 
	Created: string,
	--- The identifier of the group 
	Group: EntityKey,
	--- The name of the group. 
	GroupName: string?,
	--- The ID of the default member role for the group. 
	MemberRoleId: string?,
	--- The current version of the profile, can be used for concurrency control during 
	--- updates. 
	ProfileVersion: number,
	--- The list of roles and names that belong to the group. 
	Roles: {[any]: any}?,
}

--- Describes an application to join a group 
export type GroupApplication = {
	--- Type of entity that requested membership 
	Entity: EntityWithLineage?,
	--- When the application to join will expire and be deleted 
	Expires: string,
	--- ID of the group that the entity requesting membership to 
	Group: EntityKey?,
}

--- Describes an entity that is blocked from joining a group. 
export type GroupBlock = {
	--- The entity that is blocked 
	Entity: EntityWithLineage?,
	--- ID of the group that the entity is blocked from 
	Group: EntityKey,
}

--- Describes an invitation to a group. 
export type GroupInvitation = {
	--- When the invitation will expire and be deleted 
	Expires: string,
	--- The group that the entity invited to 
	Group: EntityKey?,
	--- The entity that created the invitation 
	InvitedByEntity: EntityWithLineage?,
	--- The entity that is invited 
	InvitedEntity: EntityWithLineage?,
	--- ID of the role in the group to assign the user to. 
	RoleId: string?,
}

--- Describes a group role 
export type GroupRole = {
	--- ID for the role 
	RoleId: string?,
	--- The name of the role 
	RoleName: string?,
}

--- Describes a group and the roles that it contains 
export type GroupWithRoles = {
	--- ID for the group 
	Group: EntityKey?,
	--- The name of the group 
	GroupName: string?,
	--- The current version of the profile, can be used for concurrency control during 
	--- updates. 
	ProfileVersion: number,
	--- The list of roles within the group 
	Roles: {GroupRole}?,
}

--- Invites a player to join a group, if they are not blocked by the group. An optional 
--- role can be provided to automatically assign the player to the role if they 
--- accept the invitation. By default, if the entity has an application to the group 
--- outstanding, this will accept the application instead and return an error indicating 
--- such, rather than creating a duplicate invitation to join that will need to 
--- be cleaned up later. Returns information about the new invitation or an error 
--- indicating an existing application to join was accepted. 
export type InviteToGroupRequest = {
	--- Optional, default true. Automatically accept an application if one exists instead 
	--- of creating an invitation 
	AutoAcceptOutstandingApplication: boolean?,
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The entity to perform this action on. 
	Entity: EntityKey,
	--- The identifier of the group 
	Group: EntityKey,
	--- Optional. ID of an existing a role in the group to assign the user to. The group's 
	--- default member role is used if this is not specified. Role IDs must be between 
	--- 1 and 64 characters long. 
	RoleId: string?,
}

--- Describes an invitation to a group. 
export type InviteToGroupResponse = {
	--- When the invitation will expire and be deleted 
	Expires: string,
	--- The group that the entity invited to 
	Group: EntityKey?,
	--- The entity that created the invitation 
	InvitedByEntity: EntityWithLineage?,
	--- The entity that is invited 
	InvitedEntity: EntityWithLineage?,
	--- ID of the role in the group to assign the user to. 
	RoleId: string?,
}

--- Checks to see if an entity is a member of a group or role within the group. 
--- A result indicating if the entity is a member of the group is returned, or a 
--- permission error if the caller does not have permission to read the group's 
--- member list. 
export type IsMemberRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The entity to perform this action on. 
	Entity: EntityKey,
	--- The identifier of the group 
	Group: EntityKey,
	--- Optional: ID of the role to check membership of. Defaults to any role (that 
	--- is, check to see if the entity is a member of the group in any capacity) if 
	--- not specified. 
	RoleId: string?,
}

export type IsMemberResponse = {
	--- A value indicating whether or not the entity is a member. 
	IsMember: boolean,
}

--- Lists all outstanding requests to join a group. Returns a list of all requests 
--- to join, as well as when the request will expire. To get the group applications 
--- for a specific entity, use ListMembershipOpportunities. 
export type ListGroupApplicationsRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The identifier of the group 
	Group: EntityKey,
}

export type ListGroupApplicationsResponse = {
	--- The requested list of applications to the group. 
	Applications: {GroupApplication}?,
}

--- Lists all entities blocked from joining a group. A list of blocked entities 
--- is returned 
export type ListGroupBlocksRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The identifier of the group 
	Group: EntityKey,
}

export type ListGroupBlocksResponse = {
	--- The requested list blocked entities. 
	BlockedEntities: {GroupBlock}?,
}

--- Lists all outstanding invitations for a group. Returns a list of entities that 
--- have been invited, as well as when the invitation will expire. To get the group 
--- invitations for a specific entity, use ListMembershipOpportunities. 
export type ListGroupInvitationsRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The identifier of the group 
	Group: EntityKey,
}

export type ListGroupInvitationsResponse = {
	--- The requested list of group invitations. 
	Invitations: {GroupInvitation}?,
}

--- Gets a list of members and the roles they belong to within the group. If the 
--- caller does not have permission to view the role, and the member is in no other 
--- role, the member is not displayed. Returns a list of entities that are members 
--- of the group. 
export type ListGroupMembersRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- ID of the group to list the members and roles for 
	Group: EntityKey,
}

export type ListGroupMembersResponse = {
	--- The requested list of roles and member entity IDs. 
	Members: {EntityMemberRole}?,
}

--- Lists all outstanding group applications and invitations for an entity. Anyone 
--- may call this for any entity, but data will only be returned for the entity 
--- or a parent of that entity. To list invitations or applications for a group 
--- to check if a player is trying to join, use ListGroupInvitations and ListGroupApplications. 
export type ListMembershipOpportunitiesRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The optional entity to perform this action on. Defaults to the currently logged 
	--- in entity. 
	Entity: EntityKey?,
}

export type ListMembershipOpportunitiesResponse = {
	--- The requested list of group applications. 
	Applications: {GroupApplication}?,
	--- The requested list of group invitations. 
	Invitations: {GroupInvitation}?,
}

--- Lists the groups and roles that an entity is a part of, checking to see if group 
--- and role metadata and memberships should be visible to the caller. If the entity 
--- is not in any roles that are visible to the caller, the group is not returned 
--- in the results, even if the caller otherwise has permission to see that the 
--- entity is a member of that group. 
export type ListMembershipRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The optional entity to perform this action on. Defaults to the currently logged 
	--- in entity. 
	Entity: EntityKey?,
}

export type ListMembershipResponse = {
	--- The list of groups 
	Groups: {GroupWithRoles}?,
}

export type OperationTypes = 
	"Created"
	| "Updated"
	| "Deleted"
	| "None"

--- Removes an existing application to join the group. This is used for both rejection 
--- of an application as well as withdrawing an application. The applying entity 
--- or a parent in its chain (e.g. title) may withdraw the application, and any 
--- caller with appropriate access in the group may reject an application. No data 
--- is returned in the case of success. 
export type RemoveGroupApplicationRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The entity to perform this action on. 
	Entity: EntityKey,
	--- The identifier of the group 
	Group: EntityKey,
}

--- Removes an existing invitation to join the group. This is used for both rejection 
--- of an invitation as well as rescinding an invitation. The invited entity or 
--- a parent in its chain (e.g. title) may reject the invitation by calling this 
--- method, and any caller with appropriate access in the group may rescind an invitation. 
--- No data is returned in the case of success. 
export type RemoveGroupInvitationRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The entity to perform this action on. 
	Entity: EntityKey,
	--- The identifier of the group 
	Group: EntityKey,
}

--- Removes members from a group. A member can always remove themselves from a group, 
--- regardless of permissions. Returns nothing if successful. 
export type RemoveMembersRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The identifier of the group 
	Group: EntityKey,
	--- List of entities to remove 
	Members: {EntityKey},
	--- The ID of the role to remove the entities from. 
	RoleId: string?,
}

--- Unblocks a list of entities from joining a group. No data is returned in the 
--- case of success. 
export type UnblockEntityRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The entity to perform this action on. 
	Entity: EntityKey,
	--- The identifier of the group 
	Group: EntityKey,
}

--- Updates data about a group, such as the name or default member role. Returns 
--- information about whether the update was successful. Only title claimants may 
--- modify the administration role for a group. 
export type UpdateGroupRequest = {
	--- Optional: the ID of an existing role to set as the new administrator role for 
	--- the group 
	AdminRoleId: string?,
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- Optional field used for concurrency control. By specifying the previously returned 
	--- value of ProfileVersion from the GetGroup API, you can ensure that the group 
	--- data update will only be performed if the group has not been updated by any 
	--- other clients since the version you last loaded. 
	ExpectedProfileVersion: number?,
	--- The identifier of the group 
	Group: EntityKey,
	--- Optional: the new name of the group 
	GroupName: string?,
	--- Optional: the ID of an existing role to set as the new member role for the group 
	MemberRoleId: string?,
}

export type UpdateGroupResponse = {
	--- Optional reason to explain why the operation was the result that it was. 
	OperationReason: string?,
	--- New version of the group data. 
	ProfileVersion: number,
	--- Indicates which operation was completed, either Created, Updated, Deleted or 
	--- None. 
	SetResult: string?,
}

--- Updates the role name. Returns information about whether the update was successful. 
export type UpdateGroupRoleRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- Optional field used for concurrency control. By specifying the previously returned 
	--- value of ProfileVersion from the GetGroup API, you can ensure that the group 
	--- data update will only be performed if the group has not been updated by any 
	--- other clients since the version you last loaded. 
	ExpectedProfileVersion: number?,
	--- The identifier of the group 
	Group: EntityKey,
	--- ID of the role to update. Role IDs must be between 1 and 64 characters long. 
	RoleId: string?,
	--- The new name of the role 
	RoleName: string,
}

export type UpdateGroupRoleResponse = {
	--- Optional reason to explain why the operation was the result that it was. 
	OperationReason: string?,
	--- New version of the role data. 
	ProfileVersion: number,
	--- Indicates which operation was completed, either Created, Updated, Deleted or 
	--- None. 
	SetResult: string?,
}


--- Accepts an outstanding invitation to to join a group if the invited entity is 
--- not blocked by the group. Nothing is returned in the case of success. 
---
--- https://docs.microsoft.com/rest/api/playfab/groups/groups/acceptgroupapplication
function GroupsApi.AcceptGroupApplicationAsync(
	entityToken: string, 
	request: AcceptGroupApplicationRequest
): EmptyResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Groups/AcceptGroupApplication",
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
function GroupsApi.AcceptGroupInvitationAsync(
	entityToken: string, 
	request: AcceptGroupInvitationRequest
): EmptyResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Groups/AcceptGroupInvitation",
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
function GroupsApi.AddMembersAsync(
	entityToken: string, 
	request: AddMembersRequest
): EmptyResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Groups/AddMembers",
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
function GroupsApi.ApplyToGroupAsync(
	entityToken: string, 
	request: ApplyToGroupRequest
): ApplyToGroupResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Groups/ApplyToGroup",
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
function GroupsApi.BlockEntityAsync(
	entityToken: string, 
	request: BlockEntityRequest
): EmptyResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Groups/BlockEntity",
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
function GroupsApi.ChangeMemberRoleAsync(
	entityToken: string, 
	request: ChangeMemberRoleRequest
): EmptyResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Groups/ChangeMemberRole",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Creates a new group, as well as administration and member roles, based off of 
--- a title's group template. Returns information about the group that was created. 
---
--- https://docs.microsoft.com/rest/api/playfab/groups/groups/creategroup
function GroupsApi.CreateGroupAsync(
	entityToken: string, 
	request: CreateGroupRequest
): CreateGroupResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Groups/CreateGroup",
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
function GroupsApi.CreateRoleAsync(
	entityToken: string, 
	request: CreateGroupRoleRequest
): CreateGroupRoleResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Groups/CreateRole",
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
function GroupsApi.DeleteGroupAsync(
	entityToken: string, 
	request: DeleteGroupRequest
): EmptyResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Groups/DeleteGroup",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Returns information about the role 
---
--- https://docs.microsoft.com/rest/api/playfab/groups/groups/deleterole
function GroupsApi.DeleteRoleAsync(
	entityToken: string, 
	request: DeleteRoleRequest
): EmptyResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Groups/DeleteRole",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Returns the ID, name, role list and other non-membership related information 
--- about a group. 
---
--- https://docs.microsoft.com/rest/api/playfab/groups/groups/getgroup
function GroupsApi.GetGroupAsync(
	entityToken: string, 
	request: GetGroupRequest
): GetGroupResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Groups/GetGroup",
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
function GroupsApi.InviteToGroupAsync(
	entityToken: string, 
	request: InviteToGroupRequest
): InviteToGroupResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Groups/InviteToGroup",
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
function GroupsApi.IsMemberAsync(
	entityToken: string, 
	request: IsMemberRequest
): IsMemberResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Groups/IsMember",
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
function GroupsApi.ListGroupApplicationsAsync(
	entityToken: string, 
	request: ListGroupApplicationsRequest
): ListGroupApplicationsResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Groups/ListGroupApplications",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Lists all entities blocked from joining a group. A list of blocked entities 
--- is returned 
---
--- https://docs.microsoft.com/rest/api/playfab/groups/groups/listgroupblocks
function GroupsApi.ListGroupBlocksAsync(
	entityToken: string, 
	request: ListGroupBlocksRequest
): ListGroupBlocksResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Groups/ListGroupBlocks",
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
function GroupsApi.ListGroupInvitationsAsync(
	entityToken: string, 
	request: ListGroupInvitationsRequest
): ListGroupInvitationsResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Groups/ListGroupInvitations",
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
function GroupsApi.ListGroupMembersAsync(
	entityToken: string, 
	request: ListGroupMembersRequest
): ListGroupMembersResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Groups/ListGroupMembers",
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
function GroupsApi.ListMembershipAsync(
	entityToken: string, 
	request: ListMembershipRequest
): ListMembershipResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Groups/ListMembership",
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
function GroupsApi.ListMembershipOpportunitiesAsync(
	entityToken: string, 
	request: ListMembershipOpportunitiesRequest
): ListMembershipOpportunitiesResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Groups/ListMembershipOpportunities",
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
function GroupsApi.RemoveGroupApplicationAsync(
	entityToken: string, 
	request: RemoveGroupApplicationRequest
): EmptyResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Groups/RemoveGroupApplication",
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
function GroupsApi.RemoveGroupInvitationAsync(
	entityToken: string, 
	request: RemoveGroupInvitationRequest
): EmptyResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Groups/RemoveGroupInvitation",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Removes members from a group. A member can always remove themselves from a group, 
--- regardless of permissions. Returns nothing if successful. 
---
--- https://docs.microsoft.com/rest/api/playfab/groups/groups/removemembers
function GroupsApi.RemoveMembersAsync(
	entityToken: string, 
	request: RemoveMembersRequest
): EmptyResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Groups/RemoveMembers",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Unblocks a list of entities from joining a group. No data is returned in the 
--- case of success. 
---
--- https://docs.microsoft.com/rest/api/playfab/groups/groups/unblockentity
function GroupsApi.UnblockEntityAsync(
	entityToken: string, 
	request: UnblockEntityRequest
): EmptyResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Groups/UnblockEntity",
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
function GroupsApi.UpdateGroupAsync(
	entityToken: string, 
	request: UpdateGroupRequest
): UpdateGroupResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Groups/UpdateGroup",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Updates the role name. Returns information about whether the update was successful. 
---
--- https://docs.microsoft.com/rest/api/playfab/groups/groups/updaterole
function GroupsApi.UpdateRoleAsync(
	entityToken: string, 
	request: UpdateGroupRoleRequest
): UpdateGroupRoleResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Groups/UpdateRole",
		request,
		"X-EntityToken",
		entityToken
	)
end

return GroupsApi

