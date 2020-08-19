/// <reference path="GroupsApi.d.ts" />

import MakeRequest from './HTTP'
import { PlayerData, IsClientLoggedIn } from './PlayFab'

/**
 * Accepts an outstanding invitation to to join a group
 * https://docs.microsoft.com/rest/api/playfab/groups/groups/acceptgroupapplication
 */
export const AcceptGroupApplication = async (player: Player, request: AcceptGroupApplicationRequest) => {
    const data = PlayerData.get(player)
    if ((!IsClientLoggedIn(player)) || (!data)) throw 'Must be logged in to call this method'
    const result = await MakeRequest<EmptyResponse>('/Group/AcceptGroupApplication', request, 'X-EntityToken', data.EntityToken)
    return result
}

/**
 * Accepts an invitation to join a group
 * https://docs.microsoft.com/rest/api/playfab/groups/groups/acceptgroupinvitation
 */
export const AcceptGroupInvitation = async (player: Player, request: AcceptGroupInvitationRequest) => {
    const data = PlayerData.get(player)
    if ((!IsClientLoggedIn(player)) || (!data)) throw 'Must be logged in to call this method'
    const result = await MakeRequest<EmptyResponse>('/Group/AcceptGroupInvitation', request, 'X-EntityToken', data.EntityToken)
    return result
}

/**
 * Applies to join a group
 * https://docs.microsoft.com/rest/api/playfab/groups/groups/applytogroup
 */
export const AddMembers = async (player: Player, request: AddMembersRequest) => {
    const data = PlayerData.get(player)
    if ((!IsClientLoggedIn(player)) || (!data)) throw 'Must be logged in to call this method'
    const result = await MakeRequest<EmptyResponse>('/Group/AddMembers', request, 'X-EntityToken', data.EntityToken)
    return result
}

/**
 * Applies to join a group
 * https://docs.microsoft.com/rest/api/playfab/groups/groups/applytogroup
 */
export const ApplyToGroup = async (player: Player, request: ApplyToGroupRequest) => {
    const data = PlayerData.get(player)
    if ((!IsClientLoggedIn(player)) || (!data)) throw 'Must be logged in to call this method'
    const result = await MakeRequest<ApplyToGroupResponse>('/Group/ApplyToGroup', request, 'X-EntityToken', data.EntityToken)
    return result
}

/**
 * Blocks a list of entities from joining a group.
 * https://docs.microsoft.com/rest/api/playfab/groups/groups/blockentity
 */
export const BlockEntity = async (player: Player, request: BlockEntityRequest) => {
    const data = PlayerData.get(player)
    if ((!IsClientLoggedIn(player)) || (!data)) throw 'Must be logged in to call this method'
    const result = await MakeRequest<EmptyResponse>('/Group/BlockEntity', request, 'X-EntityToken', data.EntityToken)
    return result
}

/**
 * Changes the role membership of a list of entities from one role to another.
 * https://docs.microsoft.com/rest/api/playfab/groups/groups/changememberrole
 */
export const ChangeMemberRole = async (player: Player, request: ChangeMemberRoleRequest) => {
    const data = PlayerData.get(player)
    if ((!IsClientLoggedIn(player)) || (!data)) throw 'Must be logged in to call this method'
    const result = await MakeRequest<EmptyResponse>('/Group/ChangeMemberRole', request, 'X-EntityToken', data.EntityToken)
    return result
}

/**
 * Creates a new group.
 * https://docs.microsoft.com/rest/api/playfab/groups/groups/creategroup
 */
export const CreateGroup = async (player: Player, request: CreateGroupRequest) => {
    const data = PlayerData.get(player)
    if ((!IsClientLoggedIn(player)) || (!data)) throw 'Must be logged in to call this method'
    const result = await MakeRequest<CreateGroupResponse>('/Group/CreateGroup', request, 'X-EntityToken', data.EntityToken)
    return result
}

/**
 * Creates a new group role.
 * https://docs.microsoft.com/rest/api/playfab/groups/groups/createrole
 */
export const CreateRole = async (player: Player, request: CreateGroupRoleRequest) => {
    const data = PlayerData.get(player)
    if ((!IsClientLoggedIn(player)) || (!data)) throw 'Must be logged in to call this method'
    const result = await MakeRequest<CreateGroupRoleResponse>('/Group/CreateRole', request, 'X-EntityToken', data.EntityToken)
    return result
}

/**
 * Deletes a group and all roles, invitations, join requests, and blocks associated with it.
 * https://docs.microsoft.com/rest/api/playfab/groups/groups/deletegroup
 */
export const DeleteGroup = async (player: Player, request: DeleteGroupRequest) => {
    const data = PlayerData.get(player)
    if ((!IsClientLoggedIn(player)) || (!data)) throw 'Must be logged in to call this method'
    const result = await MakeRequest<EmptyResponse>('/Group/DeleteGroup', request, 'X-EntityToken', data.EntityToken)
    return result
}

/**
 * Gets information about a group and its roles
 * https://docs.microsoft.com/rest/api/playfab/groups/groups/getgroup
 */
export const GetGroup = async (player: Player, request: GetGroupRequest) => {
    const data = PlayerData.get(player)
    if ((!IsClientLoggedIn(player)) || (!data)) throw 'Must be logged in to call this method'
    const result = await MakeRequest<GetGroupResponse>('/Group/GetGroup', request, 'X-EntityToken', data.EntityToken)
    return result
}

/**
 * Invites a player to join a group
 * https://docs.microsoft.com/rest/api/playfab/groups/groups/invitetogroup
 */
export const InviteToGroup = async (player: Player, request: InviteToGroupRequest) => {
    const data = PlayerData.get(player)
    if ((!IsClientLoggedIn(player)) || (!data)) throw 'Must be logged in to call this method'
    const result = await MakeRequest<InviteToGroupResponse>('/Group/InviteToGroup', request, 'X-EntityToken', data.EntityToken)
    return result
}

/**
 * Checks to see if an entity is a member of a group or role within the group
 * https://docs.microsoft.com/rest/api/playfab/groups/groups/ismember
 */
export const IsMember = async (player: Player, request: IsMemberRequest) => {
    const data = PlayerData.get(player)
    if ((!IsClientLoggedIn(player)) || (!data)) throw 'Must be logged in to call this method'
    const result = await MakeRequest<IsMemberResponse>('/Group/IsMember', request, 'X-EntityToken', data.EntityToken)
    return result
}

/**
 * Lists all outstanding invitations for a group
 * https://docs.microsoft.com/rest/api/playfab/groups/groups/listgroupinvitations
 */
export const ListGroupApplications = async (player: Player, request: ListGroupApplicationsRequest) => {
    const data = PlayerData.get(player)
    if ((!IsClientLoggedIn(player)) || (!data)) throw 'Must be logged in to call this method'
    const result = await MakeRequest<ListGroupApplicationsResponse>('/Group/ListGroupApplications', request, 'X-EntityToken', data.EntityToken)
    return result
}

/**
 * Lists all members for a group
 * https://docs.microsoft.com/rest/api/playfab/groups/groups/listgroupmembers
 */
export const ListGroupMembers = async (player: Player, request: ListGroupMembersRequest) => {
    const data = PlayerData.get(player)
    if ((!IsClientLoggedIn(player)) || (!data)) throw 'Must be logged in to call this method'
    const result = await MakeRequest<ListGroupMembersResponse>('/Group/ListGroupMembers', request, 'X-EntityToken', data.EntityToken)
    return result
}

/**
 * Lists all groups and roles for an entity
 * https://docs.microsoft.com/rest/api/playfab/groups/groups/listmembership
 */
export const ListMembership = async (player: Player, request: ListMembershipRequest) => {
    const data = PlayerData.get(player)
    if ((!IsClientLoggedIn(player)) || (!data)) throw 'Must be logged in to call this method'
    const result = await MakeRequest<ListMembershipResponse>('/Group/ListMembership', request, 'X-EntityToken', data.EntityToken)
    return result
}

/**
 * Lists all outstanding invitations and group applications for an entity
 * https://docs.microsoft.com/rest/api/playfab/groups/groups/listmembershipopportunities
 */
export const ListMembershipOpportunities = async (player: Player, request: ListMembershipOpportunitiesRequest) => {
    const data = PlayerData.get(player)
    if ((!IsClientLoggedIn(player)) || (!data)) throw 'Must be logged in to call this method'
    const result = await MakeRequest<ListMembershipOpportunitiesResponse>('/Group/ListMembershipOpportunities', request, 'X-EntityToken', data.EntityToken)
    return result
}

/**
 * Removes an application to join a group
 * https://docs.microsoft.com/rest/api/playfab/groups/groups/removegroupapplication
 */
export const RemoveGroupApplication = async (player: Player, request: RemoveGroupApplicationRequest) => {
    const data = PlayerData.get(player)
    if ((!IsClientLoggedIn(player)) || (!data)) throw 'Must be logged in to call this method'
    const result = await MakeRequest<EmptyResponse>('/Group/RemoveGroupApplication', request, 'X-EntityToken', data.EntityToken)
    return result
}

/**
 * Removes an invitation join a group
 * https://docs.microsoft.com/rest/api/playfab/groups/groups/removegroupinvitation
 */
export const RemoveGroupInvitation = async (player: Player, request: RemoveGroupInvitationRequest) => {
    const data = PlayerData.get(player)
    if ((!IsClientLoggedIn(player)) || (!data)) throw 'Must be logged in to call this method'
    const result = await MakeRequest<EmptyResponse>('/Group/RemoveGroupInvitation', request, 'X-EntityToken', data.EntityToken)
    return result
}

/**
 * Removes members from a group.
 * https://docs.microsoft.com/rest/api/playfab/groups/groups/removemembers
 */
export const RemoveMembers = async (player: Player, request: RemoveMembersRequest) => {
    const data = PlayerData.get(player)
    if ((!IsClientLoggedIn(player)) || (!data)) throw 'Must be logged in to call this method'
    const result = await MakeRequest<EmptyResponse>('/Group/RemoveMembers', request, 'X-EntityToken', data.EntityToken)
    return result
}

/**
 * Unblocks a list of entities from joining a group
 * https://docs.microsoft.com/rest/api/playfab/groups/groups/unblockentity
 */
export const UnblockEntity = async (player: Player, request: UnblockEntityRequest) => {
    const data = PlayerData.get(player)
    if ((!IsClientLoggedIn(player)) || (!data)) throw 'Must be logged in to call this method'
    const result = await MakeRequest<EmptyResponse>('/Group/UnblockEntity', request, 'X-EntityToken', data.EntityToken)
    return result
}

/**
 * Updates non-membership data about a group.
 * https://docs.microsoft.com/rest/api/playfab/groups/groups/updategroup
 */
export const UpdateGroup = async (player: Player, request: UpdateGroupRequest) => {
    const data = PlayerData.get(player)
    if ((!IsClientLoggedIn(player)) || (!data)) throw 'Must be logged in to call this method'
    const result = await MakeRequest<UpdateGroupResponse>('/Group/UpdateGroup', request, 'X-EntityToken', data.EntityToken)
    return result
}

/**
 * Updates metadata about a role.
 * https://docs.microsoft.com/rest/api/playfab/groups/groups/updaterole
 */
export const UpdateRole = async (player: Player, request: UpdateGroupRoleRequest) => {
    const data = PlayerData.get(player)
    if ((!IsClientLoggedIn(player)) || (!data)) throw 'Must be logged in to call this method'
    const result = await MakeRequest<UpdateGroupRoleResponse>('/Group/UpdateRole', request, 'X-EntityToken', data.EntityToken)
    return result
}