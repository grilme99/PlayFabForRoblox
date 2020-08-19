interface AcceptGroupApplicationRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // Optional. Type of the entity to accept as. If specified, must be the same entity as the claimant or an entity that is a
    // child of the claimant entity. Defaults to the claimant entity.
    Entity: EntityKey;
    // The identifier of the group
    Group: EntityKey;
}

interface AcceptGroupInvitationRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // The entity to perform this action on.
    Entity?: EntityKey;
    // The identifier of the group
    Group: EntityKey;
}

interface AddMembersRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // The identifier of the group
    Group: EntityKey;
    // List of entities to add to the group. Only entities of type title_player_account and character may be added to groups.
    Members: EntityKey[];
    // Optional: The ID of the existing role to add the entities to. If this is not specified, the default member role for the
    // group will be used. Role IDs must be between 1 and 64 characters long.
    RoleId?: string;
}

interface ApplyToGroupRequest extends PlayFabModule.IPlayFabRequestCommon {
    // Optional, default true. Automatically accept an outstanding invitation if one exists instead of creating an application
    AutoAcceptOutstandingInvite?: boolean;
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // The entity to perform this action on.
    Entity?: EntityKey;
    // The identifier of the group
    Group: EntityKey;
}

interface ApplyToGroupResponse extends PlayFabModule.IPlayFabResultCommon {
    // Type of entity that requested membership
    Entity?: EntityWithLineage;
    // When the application to join will expire and be deleted
    Expires: string;
    // ID of the group that the entity requesting membership to
    Group?: EntityKey;
}

interface BlockEntityRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // The entity to perform this action on.
    Entity: EntityKey;
    // The identifier of the group
    Group: EntityKey;
}

interface ChangeMemberRoleRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // The ID of the role that the entities will become a member of. This must be an existing role. Role IDs must be between 1
    // and 64 characters long.
    DestinationRoleId?: string;
    // The identifier of the group
    Group: EntityKey;
    // List of entities to move between roles in the group. All entities in this list must be members of the group and origin
    // role.
    Members: EntityKey[];
    // The ID of the role that the entities currently are a member of. Role IDs must be between 1 and 64 characters long.
    OriginRoleId: string;
}

interface CreateGroupRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // The entity to perform this action on.
    Entity?: EntityKey;
    // The name of the group. This is unique at the title level by default.
    GroupName: string;
}

interface CreateGroupResponse extends PlayFabModule.IPlayFabResultCommon {
    // The ID of the administrator role for the group.
    AdminRoleId?: string;
    // The server date and time the group was created.
    Created: string;
    // The identifier of the group
    Group: EntityKey;
    // The name of the group.
    GroupName?: string;
    // The ID of the default member role for the group.
    MemberRoleId?: string;
    // The current version of the profile, can be used for concurrency control during updates.
    ProfileVersion: number;
    // The list of roles and names that belong to the group.
    Roles?: { [key: string]: string | null };
}

interface CreateGroupRoleRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // The identifier of the group
    Group: EntityKey;
    // The ID of the role. This must be unique within the group and cannot be changed. Role IDs must be between 1 and 64
    // characters long.
    RoleId: string;
    // The name of the role. This must be unique within the group and can be changed later. Role names must be between 1 and
    // 100 characters long
    RoleName: string;
}

interface CreateGroupRoleResponse extends PlayFabModule.IPlayFabResultCommon {
    // The current version of the group profile, can be used for concurrency control during updates.
    ProfileVersion: number;
    // ID for the role
    RoleId?: string;
    // The name of the role
    RoleName?: string;
}

interface DeleteGroupRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // ID of the group or role to remove
    Group: EntityKey;
}

interface DeleteRoleRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // The identifier of the group
    Group: EntityKey;
    // The ID of the role to delete. Role IDs must be between 1 and 64 characters long.
    RoleId?: string;
}

interface EmptyResponse extends PlayFabModule.IPlayFabResultCommon {}

interface EntityKey {
    // Unique ID of the entity.
    Id: string;
    // Entity type. See https://docs.microsoft.com/gaming/playfab/features/data/entities/available-built-in-entity-types
    Type?: string;
}

interface EntityMemberRole {
    // The list of members in the role
    Members?: EntityWithLineage[];
    // The ID of the role.
    RoleId?: string;
    // The name of the role
    RoleName?: string;
}

interface EntityWithLineage {
    // The entity key for the specified entity
    Key?: EntityKey;
    // Dictionary of entity keys for related entities. Dictionary key is entity type.
    Lineage?: { [key: string]: EntityKey };
}

interface GetGroupRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // The identifier of the group
    Group?: EntityKey;
    // The full name of the group
    GroupName?: string;
}

interface GetGroupResponse extends PlayFabModule.IPlayFabResultCommon {
    // The ID of the administrator role for the group.
    AdminRoleId?: string;
    // The server date and time the group was created.
    Created: string;
    // The identifier of the group
    Group: EntityKey;
    // The name of the group.
    GroupName?: string;
    // The ID of the default member role for the group.
    MemberRoleId?: string;
    // The current version of the profile, can be used for concurrency control during updates.
    ProfileVersion: number;
    // The list of roles and names that belong to the group.
    Roles?: { [key: string]: string | null };
}

interface GroupApplication {
    // Type of entity that requested membership
    Entity?: EntityWithLineage;
    // When the application to join will expire and be deleted
    Expires: string;
    // ID of the group that the entity requesting membership to
    Group?: EntityKey;
}

interface GroupBlock {
    // The entity that is blocked
    Entity?: EntityWithLineage;
    // ID of the group that the entity is blocked from
    Group: EntityKey;
}

interface GroupInvitation {
    // When the invitation will expire and be deleted
    Expires: string;
    // The group that the entity invited to
    Group?: EntityKey;
    // The entity that created the invitation
    InvitedByEntity?: EntityWithLineage;
    // The entity that is invited
    InvitedEntity?: EntityWithLineage;
    // ID of the role in the group to assign the user to.
    RoleId?: string;
}

interface GroupRole {
    // ID for the role
    RoleId?: string;
    // The name of the role
    RoleName?: string;
}

interface GroupWithRoles {
    // ID for the group
    Group?: EntityKey;
    // The name of the group
    GroupName?: string;
    // The current version of the profile, can be used for concurrency control during updates.
    ProfileVersion: number;
    // The list of roles within the group
    Roles?: GroupRole[];
}

interface InviteToGroupRequest extends PlayFabModule.IPlayFabRequestCommon {
    // Optional, default true. Automatically accept an application if one exists instead of creating an invitation
    AutoAcceptOutstandingApplication?: boolean;
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // The entity to perform this action on.
    Entity: EntityKey;
    // The identifier of the group
    Group: EntityKey;
    // Optional. ID of an existing a role in the group to assign the user to. The group's default member role is used if this
    // is not specified. Role IDs must be between 1 and 64 characters long.
    RoleId?: string;
}

interface InviteToGroupResponse extends PlayFabModule.IPlayFabResultCommon {
    // When the invitation will expire and be deleted
    Expires: string;
    // The group that the entity invited to
    Group?: EntityKey;
    // The entity that created the invitation
    InvitedByEntity?: EntityWithLineage;
    // The entity that is invited
    InvitedEntity?: EntityWithLineage;
    // ID of the role in the group to assign the user to.
    RoleId?: string;
}

interface IsMemberRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // The entity to perform this action on.
    Entity: EntityKey;
    // The identifier of the group
    Group: EntityKey;
    // Optional: ID of the role to check membership of. Defaults to any role (that is, check to see if the entity is a member
    // of the group in any capacity) if not specified.
    RoleId?: string;
}

interface IsMemberResponse extends PlayFabModule.IPlayFabResultCommon {
    // A value indicating whether or not the entity is a member.
    IsMember: boolean;
}

interface ListGroupApplicationsRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // The identifier of the group
    Group: EntityKey;
}

interface ListGroupApplicationsResponse extends PlayFabModule.IPlayFabResultCommon {
    // The requested list of applications to the group.
    Applications?: GroupApplication[];
}

interface ListGroupBlocksRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // The identifier of the group
    Group: EntityKey;
}

interface ListGroupBlocksResponse extends PlayFabModule.IPlayFabResultCommon {
    // The requested list blocked entities.
    BlockedEntities?: GroupBlock[];
}

interface ListGroupInvitationsRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // The identifier of the group
    Group: EntityKey;
}

interface ListGroupInvitationsResponse extends PlayFabModule.IPlayFabResultCommon {
    // The requested list of group invitations.
    Invitations?: GroupInvitation[];
}

interface ListGroupMembersRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // ID of the group to list the members and roles for
    Group: EntityKey;
}

interface ListGroupMembersResponse extends PlayFabModule.IPlayFabResultCommon {
    // The requested list of roles and member entity IDs.
    Members?: EntityMemberRole[];
}

interface ListMembershipOpportunitiesRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // The entity to perform this action on.
    Entity?: EntityKey;
}

interface ListMembershipOpportunitiesResponse extends PlayFabModule.IPlayFabResultCommon {
    // The requested list of group applications.
    Applications?: GroupApplication[];
    // The requested list of group invitations.
    Invitations?: GroupInvitation[];
}

interface ListMembershipRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // The entity to perform this action on.
    Entity?: EntityKey;
}

interface ListMembershipResponse extends PlayFabModule.IPlayFabResultCommon {
    // The list of groups
    Groups?: GroupWithRoles[];
}

interface RemoveGroupApplicationRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // The entity to perform this action on.
    Entity: EntityKey;
    // The identifier of the group
    Group: EntityKey;
}

interface RemoveGroupInvitationRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // The entity to perform this action on.
    Entity: EntityKey;
    // The identifier of the group
    Group: EntityKey;
}

interface RemoveMembersRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // The identifier of the group
    Group: EntityKey;
    // List of entities to remove
    Members: EntityKey[];
    // The ID of the role to remove the entities from.
    RoleId?: string;
}

interface UnblockEntityRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // The entity to perform this action on.
    Entity: EntityKey;
    // The identifier of the group
    Group: EntityKey;
}

interface UpdateGroupRequest extends PlayFabModule.IPlayFabRequestCommon {
    // Optional: the ID of an existing role to set as the new administrator role for the group
    AdminRoleId?: string;
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // Optional field used for concurrency control. By specifying the previously returned value of ProfileVersion from the
    // GetGroup API, you can ensure that the group data update will only be performed if the group has not been updated by any
    // other clients since the version you last loaded.
    ExpectedProfileVersion?: number;
    // The identifier of the group
    Group: EntityKey;
    // Optional: the new name of the group
    GroupName?: string;
    // Optional: the ID of an existing role to set as the new member role for the group
    MemberRoleId?: string;
}

interface UpdateGroupResponse extends PlayFabModule.IPlayFabResultCommon {
    // Optional reason to explain why the operation was the result that it was.
    OperationReason?: string;
    // New version of the group data.
    ProfileVersion: number;
    // Indicates which operation was completed, either Created, Updated, Deleted or None.
    SetResult?: string;
}

interface UpdateGroupRoleRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // Optional field used for concurrency control. By specifying the previously returned value of ProfileVersion from the
    // GetGroup API, you can ensure that the group data update will only be performed if the group has not been updated by any
    // other clients since the version you last loaded.
    ExpectedProfileVersion?: number;
    // The identifier of the group
    Group: EntityKey;
    // ID of the role to update. Role IDs must be between 1 and 64 characters long.
    RoleId?: string;
    // The new name of the role
    RoleName: string;
}

interface UpdateGroupRoleResponse extends PlayFabModule.IPlayFabResultCommon {
    // Optional reason to explain why the operation was the result that it was.
    OperationReason?: string;
    // New version of the role data.
    ProfileVersion: number;
    // Indicates which operation was completed, either Created, Updated, Deleted or None.
    SetResult?: string;
}