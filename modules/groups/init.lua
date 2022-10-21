--!strict
--[=[
	# GroupsApi

	The Groups API is designed for any permanent or semi-permanent collections of 
	Entities (players, or non-players). If you want to make Guilds/Clans/Corporations/etc., 
	then you should use groups. Groups can also be used to make chatrooms, parties, 
	or any other persistent collection of entities. 

	API Version: 1.221010.0
]=]

local PlayFabInternal = require(script.Parent.PlayFabInternal)
local Types = require(script.Parent.Types)
local GroupsApi = require(script.Apis)

function GroupsApi.SetSettings(settings: PlayFabInternal.ISettings)
	PlayFabInternal.SetSettings(settings)
end

export type AcceptGroupApplicationRequest = Types.AcceptGroupApplicationRequest
export type AcceptGroupInvitationRequest = Types.AcceptGroupInvitationRequest
export type AddMembersRequest = Types.AddMembersRequest
export type ApiErrorWrapper = Types.ApiErrorWrapper
export type ApplyToGroupRequest = Types.ApplyToGroupRequest
export type ApplyToGroupResponse = Types.ApplyToGroupResponse
export type BlockEntityRequest = Types.BlockEntityRequest
export type ChangeMemberRoleRequest = Types.ChangeMemberRoleRequest
export type CreateGroupRequest = Types.CreateGroupRequest
export type CreateGroupResponse = Types.CreateGroupResponse
export type CreateGroupRoleRequest = Types.CreateGroupRoleRequest
export type CreateGroupRoleResponse = Types.CreateGroupRoleResponse
export type DeleteGroupRequest = Types.DeleteGroupRequest
export type DeleteRoleRequest = Types.DeleteRoleRequest
export type EmptyResponse = Types.EmptyResponse
export type EntityKey = Types.EntityKey
export type EntityMemberRole = Types.EntityMemberRole
export type EntityWithLineage = Types.EntityWithLineage
export type GetGroupRequest = Types.GetGroupRequest
export type GetGroupResponse = Types.GetGroupResponse
export type GroupApplication = Types.GroupApplication
export type GroupBlock = Types.GroupBlock
export type GroupInvitation = Types.GroupInvitation
export type GroupRole = Types.GroupRole
export type GroupWithRoles = Types.GroupWithRoles
export type InviteToGroupRequest = Types.InviteToGroupRequest
export type InviteToGroupResponse = Types.InviteToGroupResponse
export type IsMemberRequest = Types.IsMemberRequest
export type IsMemberResponse = Types.IsMemberResponse
export type ListGroupApplicationsRequest = Types.ListGroupApplicationsRequest
export type ListGroupApplicationsResponse = Types.ListGroupApplicationsResponse
export type ListGroupBlocksRequest = Types.ListGroupBlocksRequest
export type ListGroupBlocksResponse = Types.ListGroupBlocksResponse
export type ListGroupInvitationsRequest = Types.ListGroupInvitationsRequest
export type ListGroupInvitationsResponse = Types.ListGroupInvitationsResponse
export type ListGroupMembersRequest = Types.ListGroupMembersRequest
export type ListGroupMembersResponse = Types.ListGroupMembersResponse
export type ListMembershipOpportunitiesRequest = Types.ListMembershipOpportunitiesRequest
export type ListMembershipOpportunitiesResponse = Types.ListMembershipOpportunitiesResponse
export type ListMembershipRequest = Types.ListMembershipRequest
export type ListMembershipResponse = Types.ListMembershipResponse
export type OperationTypes = Types.OperationTypes
export type RemoveGroupApplicationRequest = Types.RemoveGroupApplicationRequest
export type RemoveGroupInvitationRequest = Types.RemoveGroupInvitationRequest
export type RemoveMembersRequest = Types.RemoveMembersRequest
export type UnblockEntityRequest = Types.UnblockEntityRequest
export type UpdateGroupRequest = Types.UpdateGroupRequest
export type UpdateGroupResponse = Types.UpdateGroupResponse
export type UpdateGroupRoleRequest = Types.UpdateGroupRoleRequest
export type UpdateGroupRoleResponse = Types.UpdateGroupRoleResponse

return GroupsApi

