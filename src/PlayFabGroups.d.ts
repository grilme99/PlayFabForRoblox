/// <reference path="PlayFab.d.ts" />

declare module PlayFabGroupsModule {
    export interface IPlayFabGroups {
        /**
         * Accepts an outstanding invitation to to join a group
         * https://docs.microsoft.com/rest/api/playfab/groups/groups/acceptgroupapplication
         */
        AcceptGroupApplication(
            entityToken: string,
            request?: PlayFabGroupsModels.AcceptGroupApplicationRequest
        ): Promise<PlayFabGroupsModels.EmptyResponse>;
        /**
         * Accepts an invitation to join a group
         * https://docs.microsoft.com/rest/api/playfab/groups/groups/acceptgroupinvitation
         */
        AcceptGroupInvitation(
            entityToken: string,
            request?: PlayFabGroupsModels.AcceptGroupInvitationRequest
        ): Promise<PlayFabGroupsModels.EmptyResponse>;
        /**
         * Adds members to a group or role.
         * https://docs.microsoft.com/rest/api/playfab/groups/groups/addmembers
         */
        AddMembers(
            entityToken: string,
            request?: PlayFabGroupsModels.AddMembersRequest
        ): Promise<PlayFabGroupsModels.EmptyResponse>;
        /**
         * Applies to join a group
         * https://docs.microsoft.com/rest/api/playfab/groups/groups/applytogroup
         */
        ApplyToGroup(
            entityToken: string,
            request?: PlayFabGroupsModels.ApplyToGroupRequest
        ): Promise<PlayFabGroupsModels.ApplyToGroupResponse>;
        /**
         * Blocks a list of entities from joining a group.
         * https://docs.microsoft.com/rest/api/playfab/groups/groups/blockentity
         */
        BlockEntity(
            entityToken: string,
            request?: PlayFabGroupsModels.BlockEntityRequest
        ): Promise<PlayFabGroupsModels.EmptyResponse>;
        /**
         * Changes the role membership of a list of entities from one role to another.
         * https://docs.microsoft.com/rest/api/playfab/groups/groups/changememberrole
         */
        ChangeMemberRole(
            entityToken: string,
            request?: PlayFabGroupsModels.ChangeMemberRoleRequest
        ): Promise<PlayFabGroupsModels.EmptyResponse>;
        /**
         * Creates a new group.
         * https://docs.microsoft.com/rest/api/playfab/groups/groups/creategroup
         */
        CreateGroup(
            entityToken: string,
            request?: PlayFabGroupsModels.CreateGroupRequest
        ): Promise<PlayFabGroupsModels.CreateGroupResponse>;
        /**
         * Creates a new group role.
         * https://docs.microsoft.com/rest/api/playfab/groups/groups/createrole
         */
        CreateRole(
            entityToken: string,
            request?: PlayFabGroupsModels.CreateGroupRoleRequest
        ): Promise<PlayFabGroupsModels.CreateGroupRoleResponse>;
        /**
         * Deletes a group and all roles, invitations, join requests, and blocks associated with it.
         * https://docs.microsoft.com/rest/api/playfab/groups/groups/deletegroup
         */
        DeleteGroup(
            entityToken: string,
            request?: PlayFabGroupsModels.DeleteGroupRequest
        ): Promise<PlayFabGroupsModels.EmptyResponse>;
        /**
         * Deletes an existing role in a group.
         * https://docs.microsoft.com/rest/api/playfab/groups/groups/deleterole
         */
        DeleteRole(
            entityToken: string,
            request?: PlayFabGroupsModels.DeleteRoleRequest
        ): Promise<PlayFabGroupsModels.EmptyResponse>;
        /**
         * Gets information about a group and its roles
         * https://docs.microsoft.com/rest/api/playfab/groups/groups/getgroup
         */
        GetGroup(
            entityToken: string,
            request?: PlayFabGroupsModels.GetGroupRequest
        ): Promise<PlayFabGroupsModels.GetGroupResponse>;
        /**
         * Invites a player to join a group
         * https://docs.microsoft.com/rest/api/playfab/groups/groups/invitetogroup
         */
        InviteToGroup(
            entityToken: string,
            request?: PlayFabGroupsModels.InviteToGroupRequest
        ): Promise<PlayFabGroupsModels.InviteToGroupResponse>;
        /**
         * Checks to see if an entity is a member of a group or role within the group
         * https://docs.microsoft.com/rest/api/playfab/groups/groups/ismember
         */
        IsMember(
            entityToken: string,
            request?: PlayFabGroupsModels.IsMemberRequest
        ): Promise<PlayFabGroupsModels.IsMemberResponse>;
        /**
         * Lists all outstanding requests to join a group
         * https://docs.microsoft.com/rest/api/playfab/groups/groups/listgroupapplications
         */
        ListGroupApplications(
            entityToken: string,
            request?: PlayFabGroupsModels.ListGroupApplicationsRequest
        ): Promise<PlayFabGroupsModels.ListGroupApplicationsResponse>;
        /**
         * Lists all entities blocked from joining a group
         * https://docs.microsoft.com/rest/api/playfab/groups/groups/listgroupblocks
         */
        ListGroupBlocks(
            entityToken: string,
            request?: PlayFabGroupsModels.ListGroupBlocksRequest
        ): Promise<PlayFabGroupsModels.ListGroupBlocksResponse>;
        /**
         * Lists all outstanding invitations for a group
         * https://docs.microsoft.com/rest/api/playfab/groups/groups/listgroupinvitations
         */
        ListGroupInvitations(
            entityToken: string,
            request?: PlayFabGroupsModels.ListGroupInvitationsRequest
        ): Promise<PlayFabGroupsModels.ListGroupInvitationsResponse>;
        /**
         * Lists all members for a group
         * https://docs.microsoft.com/rest/api/playfab/groups/groups/listgroupmembers
         */
        ListGroupMembers(
            entityToken: string,
            request?: PlayFabGroupsModels.ListGroupMembersRequest
        ): Promise<PlayFabGroupsModels.ListGroupMembersResponse>;
        /**
         * Lists all groups and roles for an entity
         * https://docs.microsoft.com/rest/api/playfab/groups/groups/listmembership
         */
        ListMembership(
            entityToken: string,
            request?: PlayFabGroupsModels.ListMembershipRequest
        ): Promise<PlayFabGroupsModels.ListMembershipResponse>;
        /**
         * Lists all outstanding invitations and group applications for an entity
         * https://docs.microsoft.com/rest/api/playfab/groups/groups/listmembershipopportunities
         */
        ListMembershipOpportunities(
            entityToken: string,
            request?: PlayFabGroupsModels.ListMembershipOpportunitiesRequest
        ): Promise<PlayFabGroupsModels.ListMembershipOpportunitiesResponse>;
        /**
         * Removes an application to join a group
         * https://docs.microsoft.com/rest/api/playfab/groups/groups/removegroupapplication
         */
        RemoveGroupApplication(
            entityToken: string,
            request?: PlayFabGroupsModels.RemoveGroupApplicationRequest
        ): Promise<PlayFabGroupsModels.EmptyResponse>;
        /**
         * Removes an invitation join a group
         * https://docs.microsoft.com/rest/api/playfab/groups/groups/removegroupinvitation
         */
        RemoveGroupInvitation(
            entityToken: string,
            request?: PlayFabGroupsModels.RemoveGroupInvitationRequest
        ): Promise<PlayFabGroupsModels.EmptyResponse>;
        /**
         * Removes members from a group.
         * https://docs.microsoft.com/rest/api/playfab/groups/groups/removemembers
         */
        RemoveMembers(
            entityToken: string,
            request?: PlayFabGroupsModels.RemoveMembersRequest
        ): Promise<PlayFabGroupsModels.EmptyResponse>;
        /**
         * Unblocks a list of entities from joining a group
         * https://docs.microsoft.com/rest/api/playfab/groups/groups/unblockentity
         */
        UnblockEntity(
            entityToken: string,
            request?: PlayFabGroupsModels.UnblockEntityRequest
        ): Promise<PlayFabGroupsModels.EmptyResponse>;
        /**
         * Updates non-membership data about a group.
         * https://docs.microsoft.com/rest/api/playfab/groups/groups/updategroup
         */
        UpdateGroup(
            entityToken: string,
            request?: PlayFabGroupsModels.UpdateGroupRequest
        ): Promise<PlayFabGroupsModels.UpdateGroupResponse>;
        /**
         * Updates metadata about a role.
         * https://docs.microsoft.com/rest/api/playfab/groups/groups/updaterole
         */
        UpdateRole(
            entityToken: string,
            request?: PlayFabGroupsModels.UpdateGroupRoleRequest
        ): Promise<PlayFabGroupsModels.UpdateGroupRoleResponse>;

    }
}

declare module PlayFabGroupsModels {
    export interface AcceptGroupApplicationRequest extends PlayFabModule.IPlayFabRequestCommon {
        /** The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.). */
        CustomTags?: { [key: string]: string | undefined };
        /**
         * Optional. Type of the entity to accept as. If specified, must be the same entity as the claimant or an entity that is a
         * child of the claimant entity. Defaults to the claimant entity.
         */
        Entity: EntityKey;
        /** The identifier of the group */
        Group: EntityKey;
    }

    export interface AcceptGroupInvitationRequest extends PlayFabModule.IPlayFabRequestCommon {
        /** The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.). */
        CustomTags?: { [key: string]: string | undefined };
        /** The entity to perform this action on. */
        Entity?: EntityKey;
        /** The identifier of the group */
        Group: EntityKey;
    }

    export interface AddMembersRequest extends PlayFabModule.IPlayFabRequestCommon {
        /** The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.). */
        CustomTags?: { [key: string]: string | undefined };
        /** The identifier of the group */
        Group: EntityKey;
        /** List of entities to add to the group. Only entities of type title_player_account and character may be added to groups. */
        Members: EntityKey[];
        /**
         * Optional: The ID of the existing role to add the entities to. If this is not specified, the default member role for the
         * group will be used. Role IDs must be between 1 and 64 characters long.
         */
        RoleId?: string;
    }

    export interface ApplyToGroupRequest extends PlayFabModule.IPlayFabRequestCommon {
        /** Optional, default true. Automatically accept an outstanding invitation if one exists instead of creating an application */
        AutoAcceptOutstandingInvite?: boolean;
        /** The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.). */
        CustomTags?: { [key: string]: string | undefined };
        /** The entity to perform this action on. */
        Entity?: EntityKey;
        /** The identifier of the group */
        Group: EntityKey;
    }

    export interface ApplyToGroupResponse extends PlayFabModule.IPlayFabResultCommon {
        /** Type of entity that requested membership */
        Entity?: EntityWithLineage;
        /** When the application to join will expire and be deleted */
        Expires: string;
        /** ID of the group that the entity requesting membership to */
        Group?: EntityKey;
    }

    export interface BlockEntityRequest extends PlayFabModule.IPlayFabRequestCommon {
        /** The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.). */
        CustomTags?: { [key: string]: string | undefined };
        /** The entity to perform this action on. */
        Entity: EntityKey;
        /** The identifier of the group */
        Group: EntityKey;
    }

    export interface ChangeMemberRoleRequest extends PlayFabModule.IPlayFabRequestCommon {
        /** The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.). */
        CustomTags?: { [key: string]: string | undefined };
        /**
         * The ID of the role that the entities will become a member of. This must be an existing role. Role IDs must be between 1
         * and 64 characters long.
         */
        DestinationRoleId?: string;
        /** The identifier of the group */
        Group: EntityKey;
        /**
         * List of entities to move between roles in the group. All entities in this list must be members of the group and origin
         * role.
         */
        Members: EntityKey[];
        /** The ID of the role that the entities currently are a member of. Role IDs must be between 1 and 64 characters long. */
        OriginRoleId: string;
    }

    export interface CreateGroupRequest extends PlayFabModule.IPlayFabRequestCommon {
        /** The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.). */
        CustomTags?: { [key: string]: string | undefined };
        /** The entity to perform this action on. */
        Entity?: EntityKey;
        /** The name of the group. This is unique at the title level by default. */
        GroupName: string;
    }

    export interface CreateGroupResponse extends PlayFabModule.IPlayFabResultCommon {
        /** The ID of the administrator role for the group. */
        AdminRoleId?: string;
        /** The server date and time the group was created. */
        Created: string;
        /** The identifier of the group */
        Group: EntityKey;
        /** The name of the group. */
        GroupName?: string;
        /** The ID of the default member role for the group. */
        MemberRoleId?: string;
        /** The current version of the profile, can be used for concurrency control during updates. */
        ProfileVersion: number;
        /** The list of roles and names that belong to the group. */
        Roles?: { [key: string]: string | undefined };
    }

    export interface CreateGroupRoleRequest extends PlayFabModule.IPlayFabRequestCommon {
        /** The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.). */
        CustomTags?: { [key: string]: string | undefined };
        /** The identifier of the group */
        Group: EntityKey;
        /**
         * The ID of the role. This must be unique within the group and cannot be changed. Role IDs must be between 1 and 64
         * characters long.
         */
        RoleId: string;
        /**
         * The name of the role. This must be unique within the group and can be changed later. Role names must be between 1 and
         * 100 characters long
         */
        RoleName: string;
    }

    export interface CreateGroupRoleResponse extends PlayFabModule.IPlayFabResultCommon {
        /** The current version of the group profile, can be used for concurrency control during updates. */
        ProfileVersion: number;
        /** ID for the role */
        RoleId?: string;
        /** The name of the role */
        RoleName?: string;
    }

    export interface DeleteGroupRequest extends PlayFabModule.IPlayFabRequestCommon {
        /** The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.). */
        CustomTags?: { [key: string]: string | undefined };
        /** ID of the group or role to remove */
        Group: EntityKey;
    }

    export interface DeleteRoleRequest extends PlayFabModule.IPlayFabRequestCommon {
        /** The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.). */
        CustomTags?: { [key: string]: string | undefined };
        /** The identifier of the group */
        Group: EntityKey;
        /** The ID of the role to delete. Role IDs must be between 1 and 64 characters long. */
        RoleId?: string;
    }

    export interface EmptyResponse extends PlayFabModule.IPlayFabResultCommon {}

    export interface EntityKey {
        /** Unique ID of the entity. */
        Id: string;
        /** Entity type. See https://docs.microsoft.com/gaming/playfab/features/data/entities/available-built-in-entity-types */
        Type?: string;
    }

    export interface EntityMemberRole {
        /** The list of members in the role */
        Members?: EntityWithLineage[];
        /** The ID of the role. */
        RoleId?: string;
        /** The name of the role */
        RoleName?: string;
    }

    export interface EntityWithLineage {
        /** The entity key for the specified entity */
        Key?: EntityKey;
        /** Dictionary of entity keys for related entities. Dictionary key is entity type. */
        Lineage?: { [key: string]: EntityKey };
    }

    export interface GetGroupRequest extends PlayFabModule.IPlayFabRequestCommon {
        /** The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.). */
        CustomTags?: { [key: string]: string | undefined };
        /** The identifier of the group */
        Group?: EntityKey;
        /** The full name of the group */
        GroupName?: string;
    }

    export interface GetGroupResponse extends PlayFabModule.IPlayFabResultCommon {
        /** The ID of the administrator role for the group. */
        AdminRoleId?: string;
        /** The server date and time the group was created. */
        Created: string;
        /** The identifier of the group */
        Group: EntityKey;
        /** The name of the group. */
        GroupName?: string;
        /** The ID of the default member role for the group. */
        MemberRoleId?: string;
        /** The current version of the profile, can be used for concurrency control during updates. */
        ProfileVersion: number;
        /** The list of roles and names that belong to the group. */
        Roles?: { [key: string]: string | undefined };
    }

    export interface GroupApplication {
        /** Type of entity that requested membership */
        Entity?: EntityWithLineage;
        /** When the application to join will expire and be deleted */
        Expires: string;
        /** ID of the group that the entity requesting membership to */
        Group?: EntityKey;
    }

    export interface GroupBlock {
        /** The entity that is blocked */
        Entity?: EntityWithLineage;
        /** ID of the group that the entity is blocked from */
        Group: EntityKey;
    }

    export interface GroupInvitation {
        /** When the invitation will expire and be deleted */
        Expires: string;
        /** The group that the entity invited to */
        Group?: EntityKey;
        /** The entity that created the invitation */
        InvitedByEntity?: EntityWithLineage;
        /** The entity that is invited */
        InvitedEntity?: EntityWithLineage;
        /** ID of the role in the group to assign the user to. */
        RoleId?: string;
    }

    export interface GroupRole {
        /** ID for the role */
        RoleId?: string;
        /** The name of the role */
        RoleName?: string;
    }

    export interface GroupWithRoles {
        /** ID for the group */
        Group?: EntityKey;
        /** The name of the group */
        GroupName?: string;
        /** The current version of the profile, can be used for concurrency control during updates. */
        ProfileVersion: number;
        /** The list of roles within the group */
        Roles?: GroupRole[];
    }

    export interface InviteToGroupRequest extends PlayFabModule.IPlayFabRequestCommon {
        /** Optional, default true. Automatically accept an application if one exists instead of creating an invitation */
        AutoAcceptOutstandingApplication?: boolean;
        /** The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.). */
        CustomTags?: { [key: string]: string | undefined };
        /** The entity to perform this action on. */
        Entity: EntityKey;
        /** The identifier of the group */
        Group: EntityKey;
        /**
         * Optional. ID of an existing a role in the group to assign the user to. The group's default member role is used if this
         * is not specified. Role IDs must be between 1 and 64 characters long.
         */
        RoleId?: string;
    }

    export interface InviteToGroupResponse extends PlayFabModule.IPlayFabResultCommon {
        /** When the invitation will expire and be deleted */
        Expires: string;
        /** The group that the entity invited to */
        Group?: EntityKey;
        /** The entity that created the invitation */
        InvitedByEntity?: EntityWithLineage;
        /** The entity that is invited */
        InvitedEntity?: EntityWithLineage;
        /** ID of the role in the group to assign the user to. */
        RoleId?: string;
    }

    export interface IsMemberRequest extends PlayFabModule.IPlayFabRequestCommon {
        /** The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.). */
        CustomTags?: { [key: string]: string | undefined };
        /** The entity to perform this action on. */
        Entity: EntityKey;
        /** The identifier of the group */
        Group: EntityKey;
        /**
         * Optional: ID of the role to check membership of. Defaults to any role (that is, check to see if the entity is a member
         * of the group in any capacity) if not specified.
         */
        RoleId?: string;
    }

    export interface IsMemberResponse extends PlayFabModule.IPlayFabResultCommon {
        /** A value indicating whether or not the entity is a member. */
        IsMember: boolean;
    }

    export interface ListGroupApplicationsRequest extends PlayFabModule.IPlayFabRequestCommon {
        /** The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.). */
        CustomTags?: { [key: string]: string | undefined };
        /** The identifier of the group */
        Group: EntityKey;
    }

    export interface ListGroupApplicationsResponse extends PlayFabModule.IPlayFabResultCommon {
        /** The requested list of applications to the group. */
        Applications?: GroupApplication[];
    }

    export interface ListGroupBlocksRequest extends PlayFabModule.IPlayFabRequestCommon {
        /** The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.). */
        CustomTags?: { [key: string]: string | undefined };
        /** The identifier of the group */
        Group: EntityKey;
    }

    export interface ListGroupBlocksResponse extends PlayFabModule.IPlayFabResultCommon {
        /** The requested list blocked entities. */
        BlockedEntities?: GroupBlock[];
    }

    export interface ListGroupInvitationsRequest extends PlayFabModule.IPlayFabRequestCommon {
        /** The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.). */
        CustomTags?: { [key: string]: string | undefined };
        /** The identifier of the group */
        Group: EntityKey;
    }

    export interface ListGroupInvitationsResponse extends PlayFabModule.IPlayFabResultCommon {
        /** The requested list of group invitations. */
        Invitations?: GroupInvitation[];
    }

    export interface ListGroupMembersRequest extends PlayFabModule.IPlayFabRequestCommon {
        /** The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.). */
        CustomTags?: { [key: string]: string | undefined };
        /** ID of the group to list the members and roles for */
        Group: EntityKey;
    }

    export interface ListGroupMembersResponse extends PlayFabModule.IPlayFabResultCommon {
        /** The requested list of roles and member entity IDs. */
        Members?: EntityMemberRole[];
    }

    export interface ListMembershipOpportunitiesRequest extends PlayFabModule.IPlayFabRequestCommon {
        /** The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.). */
        CustomTags?: { [key: string]: string | undefined };
        /** The entity to perform this action on. */
        Entity?: EntityKey;
    }

    export interface ListMembershipOpportunitiesResponse extends PlayFabModule.IPlayFabResultCommon {
        /** The requested list of group applications. */
        Applications?: GroupApplication[];
        /** The requested list of group invitations. */
        Invitations?: GroupInvitation[];
    }

    export interface ListMembershipRequest extends PlayFabModule.IPlayFabRequestCommon {
        /** The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.). */
        CustomTags?: { [key: string]: string | undefined };
        /** The entity to perform this action on. */
        Entity?: EntityKey;
    }

    export interface ListMembershipResponse extends PlayFabModule.IPlayFabResultCommon {
        /** The list of groups */
        Groups?: GroupWithRoles[];
    }

    type OperationTypes = "Created"
        | "Updated"
        | "Deleted"
        | "None";

    export interface RemoveGroupApplicationRequest extends PlayFabModule.IPlayFabRequestCommon {
        /** The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.). */
        CustomTags?: { [key: string]: string | undefined };
        /** The entity to perform this action on. */
        Entity: EntityKey;
        /** The identifier of the group */
        Group: EntityKey;
    }

    export interface RemoveGroupInvitationRequest extends PlayFabModule.IPlayFabRequestCommon {
        /** The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.). */
        CustomTags?: { [key: string]: string | undefined };
        /** The entity to perform this action on. */
        Entity: EntityKey;
        /** The identifier of the group */
        Group: EntityKey;
    }

    export interface RemoveMembersRequest extends PlayFabModule.IPlayFabRequestCommon {
        /** The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.). */
        CustomTags?: { [key: string]: string | undefined };
        /** The identifier of the group */
        Group: EntityKey;
        /** List of entities to remove */
        Members: EntityKey[];
        /** The ID of the role to remove the entities from. */
        RoleId?: string;
    }

    export interface UnblockEntityRequest extends PlayFabModule.IPlayFabRequestCommon {
        /** The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.). */
        CustomTags?: { [key: string]: string | undefined };
        /** The entity to perform this action on. */
        Entity: EntityKey;
        /** The identifier of the group */
        Group: EntityKey;
    }

    export interface UpdateGroupRequest extends PlayFabModule.IPlayFabRequestCommon {
        /** Optional: the ID of an existing role to set as the new administrator role for the group */
        AdminRoleId?: string;
        /** The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.). */
        CustomTags?: { [key: string]: string | undefined };
        /**
         * Optional field used for concurrency control. By specifying the previously returned value of ProfileVersion from the
         * GetGroup API, you can ensure that the group data update will only be performed if the group has not been updated by any
         * other clients since the version you last loaded.
         */
        ExpectedProfileVersion?: number;
        /** The identifier of the group */
        Group: EntityKey;
        /** Optional: the new name of the group */
        GroupName?: string;
        /** Optional: the ID of an existing role to set as the new member role for the group */
        MemberRoleId?: string;
    }

    export interface UpdateGroupResponse extends PlayFabModule.IPlayFabResultCommon {
        /** Optional reason to explain why the operation was the result that it was. */
        OperationReason?: string;
        /** New version of the group data. */
        ProfileVersion: number;
        /** Indicates which operation was completed, either Created, Updated, Deleted or None. */
        SetResult?: string;
    }

    export interface UpdateGroupRoleRequest extends PlayFabModule.IPlayFabRequestCommon {
        /** The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.). */
        CustomTags?: { [key: string]: string | undefined };
        /**
         * Optional field used for concurrency control. By specifying the previously returned value of ProfileVersion from the
         * GetGroup API, you can ensure that the group data update will only be performed if the group has not been updated by any
         * other clients since the version you last loaded.
         */
        ExpectedProfileVersion?: number;
        /** The identifier of the group */
        Group: EntityKey;
        /** ID of the role to update. Role IDs must be between 1 and 64 characters long. */
        RoleId?: string;
        /** The new name of the role */
        RoleName: string;
    }

    export interface UpdateGroupRoleResponse extends PlayFabModule.IPlayFabResultCommon {
        /** Optional reason to explain why the operation was the result that it was. */
        OperationReason?: string;
        /** New version of the role data. */
        ProfileVersion: number;
        /** Indicates which operation was completed, either Created, Updated, Deleted or None. */
        SetResult?: string;
    }

}
