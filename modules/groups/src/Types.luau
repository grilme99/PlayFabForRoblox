--[[
	This file was generated on 2025-08-03 at 00:04 UTC. Do not edit directly.

]]

--[[
	Accepts an outstanding invitation to join the group if the invited entity is
	not blocked by the group. Only the invited entity or a parent in its chain
	(e.g. title) may accept the invitation on the invited entity's behalf.
	Nothing is returned in the case of success.

]]
export type AcceptGroupInvitationRequest = {
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Group: EntityKey,
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type EntityMemberRole = {
	--[[
		The ID of the role.

	]]
	RoleId: string?,
	--[[
		The list of members in the role

	]]
	Members: { EntityWithLineage }?,
	--[[
		The name of the role

	]]
	RoleName: string?,
}

export type CreateGroupResponse = {
	--[[
		The server date and time the group was created.

	]]
	Created: string,
	--[[
		The ID of the administrator role for the group.

	]]
	AdminRoleId: string?,
	--[[
		The list of roles and names that belong to the group.

	]]
	Roles: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Group: EntityKey,
	--[[
		The ID of the default member role for the group.

	]]
	MemberRoleId: string?,
	--[[
		The name of the group.

	]]
	GroupName: string?,
	--[[
		The current version of the profile, can be used for concurrency control during
		updates.

	]]
	ProfileVersion: number,
}

--[[
	Describes an application to join a group

]]
export type ApplyToGroupResponse = {
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Group: EntityKey?,
	--[[
		When the application to join will expire and be deleted

	]]
	Expires: string,
	--[[
		Entity wrapper class that contains the entity key and the entities that make
		up the lineage of the entity.

	]]
	Entity: EntityWithLineage?,
}

--[[
	Lists the groups and roles that an entity is a part of, checking to see if
	group and role metadata and memberships should be visible to the caller. If
	the entity is not in any roles that are visible to the caller, the group is
	not returned in the results, even if the caller otherwise has permission to
	see that the entity is a member of that group.

]]
export type ListMembershipRequest = {
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

--[[
	Describes an invitation to a group.

]]
export type InviteToGroupResponse = {
	--[[
		When the invitation will expire and be deleted

	]]
	Expires: string,
	--[[
		Entity wrapper class that contains the entity key and the entities that make
		up the lineage of the entity.

	]]
	InvitedByEntity: EntityWithLineage?,
	--[[
		Entity wrapper class that contains the entity key and the entities that make
		up the lineage of the entity.

	]]
	InvitedEntity: EntityWithLineage?,
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Group: EntityKey?,
	--[[
		ID of the role in the group to assign the user to.

	]]
	RoleId: string?,
}

--[[
	Describes a group and the roles that it contains

]]
export type GroupWithRoles = {
	--[[
		The list of roles within the group

	]]
	Roles: { GroupRole }?,
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Group: EntityKey?,
	--[[
		The name of the group

	]]
	GroupName: string?,
	--[[
		The current version of the profile, can be used for concurrency control during
		updates.

	]]
	ProfileVersion: number,
}

export type GetGroupResponse = {
	--[[
		The server date and time the group was created.

	]]
	Created: string,
	--[[
		The ID of the administrator role for the group.

	]]
	AdminRoleId: string?,
	--[[
		The list of roles and names that belong to the group.

	]]
	Roles: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Group: EntityKey,
	--[[
		The ID of the default member role for the group.

	]]
	MemberRoleId: string?,
	--[[
		The name of the group.

	]]
	GroupName: string?,
	--[[
		The current version of the profile, can be used for concurrency control during
		updates.

	]]
	ProfileVersion: number,
}

--[[
	Lists all outstanding group applications and invitations for an entity.
	Anyone may call this for any entity, but data will only be returned for the
	entity or a parent of that entity. To list invitations or applications for a
	group to check if a player is trying to join, use ListGroupInvitations and
	ListGroupApplications.

]]
export type ListMembershipOpportunitiesRequest = {
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

--[[
	Describes an entity that is blocked from joining a group.

]]
export type GroupBlock = {
	--[[
		Entity wrapper class that contains the entity key and the entities that make
		up the lineage of the entity.

	]]
	Entity: EntityWithLineage?,
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Group: EntityKey,
}

--[[
	Lists all outstanding invitations for a group. Returns a list of entities
	that have been invited, as well as when the invitation will expire. To get
	the group invitations for a specific entity, use
	ListMembershipOpportunities.

]]
export type ListGroupInvitationsRequest = {
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Group: EntityKey,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

--[[
	Returns information about the role

]]
export type DeleteRoleRequest = {
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Group: EntityKey,
	--[[
		The ID of the role to delete. Role IDs must be between 1 and 64 characters
		long.

	]]
	RoleId: string?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type UpdateGroupResponse = {
	--[[
		Optional reason to explain why the operation was the result that it was.

	]]
	OperationReason: string?,
	--[[
		New version of the group data.

	]]
	ProfileVersion: number,
	SetResult: OperationTypes?,
}

--[[
	Describes a group role

]]
export type GroupRole = {
	--[[
		The name of the role

	]]
	RoleName: string?,
	--[[
		ID for the role

	]]
	RoleId: string?,
}

--[[
	Deletes a group and all roles, invitations, join requests, and blocks
	associated with it. Permission to delete is only required the group itself
	to execute this action. The group and data cannot be cannot be recovered
	once removed, but any abuse reports about the group will remain. No data is
	returned in the case of success.

]]
export type DeleteGroupRequest = {
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Group: EntityKey,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

--[[
	Checks to see if an entity is a member of a group or role within the group.
	A result indicating if the entity is a member of the group is returned, or a
	permission error if the caller does not have permission to read the group's
	member list.

]]
export type IsMemberRequest = {
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey,
	--[[
		Optional: ID of the role to check membership of. Defaults to any role (that
		is, check to see if the entity is a member of the group in any capacity) if
		not specified.

	]]
	RoleId: string?,
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Group: EntityKey,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

--[[
	Returns the ID, name, role list and other non-membership related information
	about a group.

]]
export type GetGroupRequest = {
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Group: EntityKey?,
	--[[
		The full name of the group

	]]
	GroupName: string?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

--[[
	Blocks a list of entities from joining a group. Blocked entities may not
	create new applications to join, be invited to join, accept an invitation,
	or have an application accepted. Failure due to being blocked does not clean
	up existing applications or invitations to the group. No data is returned in
	the case of success.

]]
export type BlockEntityRequest = {
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Group: EntityKey,
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

--[[
	Updates the role name. Returns information about whether the update was
	successful.

]]
export type UpdateGroupRoleRequest = {
	--[[
		ID of the role to update. Role IDs must be between 1 and 64 characters long.

	]]
	RoleId: string?,
	--[[
		Optional field used for concurrency control. By specifying the previously
		returned value of ProfileVersion from the GetGroup API, you can ensure that
		the group data update will only be performed if the group has not been updated
		by any other clients since the version you last loaded.

	]]
	ExpectedProfileVersion: number?,
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Group: EntityKey,
	--[[
		The new name of the role

	]]
	RoleName: string,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

--[[
	Adds members to a group or role. Existing members of the group will added to
	roles within the group, but if the user is not already a member of the
	group, only title claimants may add them to the group, and others must use
	the group application or invite system to add new members to a group.
	Returns nothing if successful.

]]
export type AddMembersRequest = {
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Group: EntityKey,
	--[[
		Optional: The ID of the existing role to add the entities to. If this is not
		specified, the default member role for the group will be used. Role IDs must
		be between 1 and 64 characters long.

	]]
	RoleId: string?,
	--[[
		List of entities to add to the group. Only entities of type
		title_player_account and character may be added to groups.

	]]
	Members: { EntityKey },
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type ListGroupMembersResponse = {
	--[[
		The requested list of roles and member entity IDs.

	]]
	Members: { EntityMemberRole }?,
}

export type ListGroupApplicationsResponse = {
	--[[
		The requested list of applications to the group.

	]]
	Applications: { GroupApplication }?,
}

--[[
	Lists all outstanding requests to join a group. Returns a list of all
	requests to join, as well as when the request will expire. To get the group
	applications for a specific entity, use ListMembershipOpportunities.

]]
export type ListGroupApplicationsRequest = {
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Group: EntityKey,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type IsMemberResponse = {
	--[[
		A value indicating whether or not the entity is a member.

	]]
	IsMember: boolean,
}

--[[
	Describes an application to join a group

]]
export type GroupApplication = {
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Group: EntityKey?,
	--[[
		When the application to join will expire and be deleted

	]]
	Expires: string,
	--[[
		Entity wrapper class that contains the entity key and the entities that make
		up the lineage of the entity.

	]]
	Entity: EntityWithLineage?,
}

--[[
	Creates a new group, as well as administration and member roles, based off
	of a title's group template. Returns information about the group that was
	created.

]]
export type CreateGroupRequest = {
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey?,
	--[[
		The name of the group. This is unique at the title level by default.

	]]
	GroupName: string,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type EmptyResponse = {
	-- No properties defined in spec
	[string]: any
}

--[[
	Creates an application to join a group. Calling this while a group
	application already exists will return the same application instead of an
	error and will not refresh the time before the application expires. By
	default, if the entity has an invitation to join the group outstanding, this
	will accept the invitation to join the group instead and return an error
	indicating such, rather than creating a duplicate application to join that
	will need to be cleaned up later. Returns information about the application
	or an error indicating an invitation was accepted instead.

]]
export type ApplyToGroupRequest = {
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Group: EntityKey,
	--[[
		Optional, default true. Automatically accept an outstanding invitation if one
		exists instead of creating an application

	]]
	AutoAcceptOutstandingInvite: boolean?,
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

--[[
	The basic wrapper around every failed API response

]]
export type ApiErrorWrapper = {
	--[[
		Detailed description of individual issues with the request object

	]]
	errorDetails: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		Numerical HTTP code

	]]
	code: number,
	--[[
		String HTTP code

	]]
	status: string?,
	--[[
		Numerical PlayFab error code

	]]
	errorCode: number,
	--[[
		Playfab error code

	]]
	error: string?,
	--[[
		Description for the PlayFab errorCode

	]]
	errorMessage: string?,
}

export type UpdateGroupRoleResponse = {
	--[[
		Optional reason to explain why the operation was the result that it was.

	]]
	OperationReason: string?,
	--[[
		New version of the role data.

	]]
	ProfileVersion: number,
	SetResult: OperationTypes?,
}

--[[
	Gets a list of members and the roles they belong to within the group. If the
	caller does not have permission to view the role, and the member is in no
	other role, the member is not displayed. Returns a list of entities that are
	members of the group.

]]
export type ListGroupMembersRequest = {
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Group: EntityKey,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

--[[
	Changes the role membership of a list of entities from one role to another
	in in a single operation. The destination role must already exist. This is
	equivalent to adding the entities to the destination role and removing from
	the origin role. Returns nothing if successful.

]]
export type ChangeMemberRoleRequest = {
	--[[
		The ID of the role that the entities will become a member of. This must be an
		existing role. Role IDs must be between 1 and 64 characters long.

	]]
	DestinationRoleId: string?,
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Group: EntityKey,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		List of entities to move between roles in the group. All entities in this list
		must be members of the group and origin role.

	]]
	Members: { EntityKey },
	--[[
		The ID of the role that the entities currently are a member of. Role IDs must
		be between 1 and 64 characters long.

	]]
	OriginRoleId: string,
}

--[[
	Lists all entities blocked from joining a group. A list of blocked entities
	is returned

]]
export type ListGroupBlocksRequest = {
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Group: EntityKey,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

--[[
	Removes an existing application to join the group. This is used for both
	rejection of an application as well as withdrawing an application. The
	applying entity or a parent in its chain (e.g. title) may withdraw the
	application, and any caller with appropriate access in the group may reject
	an application. No data is returned in the case of success.

]]
export type RemoveGroupApplicationRequest = {
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Group: EntityKey,
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type CreateGroupRoleResponse = {
	--[[
		ID for the role

	]]
	RoleId: string?,
	--[[
		The name of the role

	]]
	RoleName: string?,
	--[[
		The current version of the group profile, can be used for concurrency control
		during updates.

	]]
	ProfileVersion: number,
}

--[[
	Combined entity type and ID structure which uniquely identifies a single
	entity.

]]
export type EntityKey = {
	--[[
		Unique ID of the entity.

	]]
	Id: string,
	--[[
		Entity type. See
		https://docs.microsoft.com/gaming/playfab/features/data/entities/available-built-in-entity-types

	]]
	Type: string?,
}

--[[
	Updates data about a group, such as the name or default member role. Returns
	information about whether the update was successful. Only title claimants
	may modify the administration role for a group.

]]
export type UpdateGroupRequest = {
	--[[
		Optional: the ID of an existing role to set as the new member role for the
		group

	]]
	MemberRoleId: string?,
	--[[
		Optional field used for concurrency control. By specifying the previously
		returned value of ProfileVersion from the GetGroup API, you can ensure that
		the group data update will only be performed if the group has not been updated
		by any other clients since the version you last loaded.

	]]
	ExpectedProfileVersion: number?,
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Group: EntityKey,
	--[[
		Optional: the ID of an existing role to set as the new administrator role for
		the group

	]]
	AdminRoleId: string?,
	--[[
		Optional: the new name of the group

	]]
	GroupName: string?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

--[[
	Unblocks a list of entities from joining a group. No data is returned in the
	case of success.

]]
export type UnblockEntityRequest = {
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Group: EntityKey,
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

--[[
	Invites a player to join a group, if they are not blocked by the group. An
	optional role can be provided to automatically assign the player to the role
	if they accept the invitation. By default, if the entity has an application
	to the group outstanding, this will accept the application instead and
	return an error indicating such, rather than creating a duplicate invitation
	to join that will need to be cleaned up later. Returns information about the
	new invitation or an error indicating an existing application to join was
	accepted.

]]
export type InviteToGroupRequest = {
	--[[
		Optional. ID of an existing a role in the group to assign the user to. The
		group's default member role is used if this is not specified. Role IDs must be
		between 1 and 64 characters long.

	]]
	RoleId: string?,
	--[[
		Optional, default true. Automatically accept an application if one exists
		instead of creating an invitation

	]]
	AutoAcceptOutstandingApplication: boolean?,
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Group: EntityKey,
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type ListMembershipOpportunitiesResponse = {
	--[[
		The requested list of group applications.

	]]
	Applications: { GroupApplication }?,
	--[[
		The requested list of group invitations.

	]]
	Invitations: { GroupInvitation }?,
}

--[[
	Entity wrapper class that contains the entity key and the entities that make
	up the lineage of the entity.

]]
export type EntityWithLineage = {
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Key: EntityKey?,
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Lineage: EntityKey?,
}

export type ListGroupInvitationsResponse = {
	--[[
		The requested list of group invitations.

	]]
	Invitations: { GroupInvitation }?,
}

--[[
	Creates a new role within an existing group, with no members. Both the role
	ID and role name must be unique within the group, but the name can be the
	same as the ID. The role ID is set at creation and cannot be changed.
	Returns information about the role that was created.

]]
export type CreateGroupRoleRequest = {
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Group: EntityKey,
	--[[
		The ID of the role. This must be unique within the group and cannot be
		changed. Role IDs must be between 1 and 64 characters long and are restricted
		to a-Z, A-Z, 0-9, '(', ')', '_', '-' and '.'.

	]]
	RoleId: string,
	--[[
		The name of the role. This must be unique within the group and can be changed
		later. Role names must be between 1 and 100 characters long

	]]
	RoleName: string,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

--[[
	Removes members from a group. A member can always remove themselves from a
	group, regardless of permissions. Returns nothing if successful.

]]
export type RemoveMembersRequest = {
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Group: EntityKey,
	--[[
		The ID of the role to remove the entities from.

	]]
	RoleId: string?,
	--[[
		List of entities to remove

	]]
	Members: { EntityKey },
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type ListGroupBlocksResponse = {
	--[[
		The requested list blocked entities.

	]]
	BlockedEntities: { GroupBlock }?,
}

export type OperationTypes = 
	| "Created"
	| "Updated"
	| "Deleted"
	| "None"

--[[
	Removes an existing invitation to join the group. This is used for both
	rejection of an invitation as well as rescinding an invitation. The invited
	entity or a parent in its chain (e.g. title) may reject the invitation by
	calling this method, and any caller with appropriate access in the group may
	rescind an invitation. No data is returned in the case of success.

]]
export type RemoveGroupInvitationRequest = {
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Group: EntityKey,
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

--[[
	Describes an invitation to a group.

]]
export type GroupInvitation = {
	--[[
		When the invitation will expire and be deleted

	]]
	Expires: string,
	--[[
		Entity wrapper class that contains the entity key and the entities that make
		up the lineage of the entity.

	]]
	InvitedByEntity: EntityWithLineage?,
	--[[
		Entity wrapper class that contains the entity key and the entities that make
		up the lineage of the entity.

	]]
	InvitedEntity: EntityWithLineage?,
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Group: EntityKey?,
	--[[
		ID of the role in the group to assign the user to.

	]]
	RoleId: string?,
}

export type ListMembershipResponse = {
	--[[
		The list of groups

	]]
	Groups: { GroupWithRoles }?,
}

--[[
	Accepts an outstanding invitation to to join a group if the invited entity
	is not blocked by the group. Nothing is returned in the case of success.

]]
export type AcceptGroupApplicationRequest = {
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Group: EntityKey,
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}



return nil
