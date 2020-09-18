-- PlayFab Groups API
-- You should not require this file directly
-- All api calls are documented here: https://docs.microsoft.com/gaming/playfab/api-references/

local Promise = require(script.Parent.Promise)
local IPlayFabHttps = require(script.Parent.IPlayFabHttps)
local PlayFabSettings = require(script.Parent.PlayFabSettings)

local PlayFabGroupsApi = {
    settings = PlayFabSettings.settings
}

--[[
    Accepts an outstanding invitation to to join a group
    https://docs.microsoft.com/rest/api/playfab/groups/groups/acceptgroupapplication
--]]
function PlayFabGroupsApi:AcceptGroupApplication(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Group/AcceptGroupApplication", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

--[[
    Accepts an invitation to join a group
    https://docs.microsoft.com/rest/api/playfab/groups/groups/acceptgroupinvitation
--]]
function PlayFabGroupsApi:AcceptGroupInvitation(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Group/AcceptGroupInvitation", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

--[[
    Adds members to a group or role.
    https://docs.microsoft.com/rest/api/playfab/groups/groups/addmembers
--]]
function PlayFabGroupsApi:AddMembers(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Group/AddMembers", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

--[[
    Applies to join a group
    https://docs.microsoft.com/rest/api/playfab/groups/groups/applytogroup
--]]
function PlayFabGroupsApi:ApplyToGroup(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Group/ApplyToGroup", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

--[[
    Blocks a list of entities from joining a group.
    https://docs.microsoft.com/rest/api/playfab/groups/groups/blockentity
--]]
function PlayFabGroupsApi:BlockEntity(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Group/BlockEntity", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

--[[
    Changes the role membership of a list of entities from one role to another.
    https://docs.microsoft.com/rest/api/playfab/groups/groups/changememberrole
--]]
function PlayFabGroupsApi:ChangeMemberRole(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Group/ChangeMemberRole", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

--[[
    Creates a new group.
    https://docs.microsoft.com/rest/api/playfab/groups/groups/creategroup
--]]
function PlayFabGroupsApi:CreateGroup(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Group/CreateGroup", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

--[[
    Creates a new group role.
    https://docs.microsoft.com/rest/api/playfab/groups/groups/createrole
--]]
function PlayFabGroupsApi:CreateRole(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Group/CreateRole", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

--[[
    Deletes a group and all roles, invitations, join requests, and blocks associated with it.
    https://docs.microsoft.com/rest/api/playfab/groups/groups/deletegroup
--]]
function PlayFabGroupsApi:DeleteGroup(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Group/DeleteGroup", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

--[[
    Deletes an existing role in a group.
    https://docs.microsoft.com/rest/api/playfab/groups/groups/deleterole
--]]
function PlayFabGroupsApi:DeleteRole(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Group/DeleteRole", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

--[[
    Gets information about a group and its roles
    https://docs.microsoft.com/rest/api/playfab/groups/groups/getgroup
--]]
function PlayFabGroupsApi:GetGroup(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Group/GetGroup", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

--[[
    Invites a player to join a group
    https://docs.microsoft.com/rest/api/playfab/groups/groups/invitetogroup
--]]
function PlayFabGroupsApi:InviteToGroup(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Group/InviteToGroup", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

--[[
    Checks to see if an entity is a member of a group or role within the group
    https://docs.microsoft.com/rest/api/playfab/groups/groups/ismember
--]]
function PlayFabGroupsApi:IsMember(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Group/IsMember", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

--[[
    Lists all outstanding requests to join a group
    https://docs.microsoft.com/rest/api/playfab/groups/groups/listgroupapplications
--]]
function PlayFabGroupsApi:ListGroupApplications(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Group/ListGroupApplications", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

--[[
    Lists all entities blocked from joining a group
    https://docs.microsoft.com/rest/api/playfab/groups/groups/listgroupblocks
--]]
function PlayFabGroupsApi:ListGroupBlocks(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Group/ListGroupBlocks", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

--[[
    Lists all outstanding invitations for a group
    https://docs.microsoft.com/rest/api/playfab/groups/groups/listgroupinvitations
--]]
function PlayFabGroupsApi:ListGroupInvitations(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Group/ListGroupInvitations", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

--[[
    Lists all members for a group
    https://docs.microsoft.com/rest/api/playfab/groups/groups/listgroupmembers
--]]
function PlayFabGroupsApi:ListGroupMembers(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Group/ListGroupMembers", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

--[[
    Lists all groups and roles for an entity
    https://docs.microsoft.com/rest/api/playfab/groups/groups/listmembership
--]]
function PlayFabGroupsApi:ListMembership(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Group/ListMembership", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

--[[
    Lists all outstanding invitations and group applications for an entity
    https://docs.microsoft.com/rest/api/playfab/groups/groups/listmembershipopportunities
--]]
function PlayFabGroupsApi:ListMembershipOpportunities(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Group/ListMembershipOpportunities", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

--[[
    Removes an application to join a group
    https://docs.microsoft.com/rest/api/playfab/groups/groups/removegroupapplication
--]]
function PlayFabGroupsApi:RemoveGroupApplication(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Group/RemoveGroupApplication", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

--[[
    Removes an invitation join a group
    https://docs.microsoft.com/rest/api/playfab/groups/groups/removegroupinvitation
--]]
function PlayFabGroupsApi:RemoveGroupInvitation(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Group/RemoveGroupInvitation", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

--[[
    Removes members from a group.
    https://docs.microsoft.com/rest/api/playfab/groups/groups/removemembers
--]]
function PlayFabGroupsApi:RemoveMembers(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Group/RemoveMembers", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

--[[
    Unblocks a list of entities from joining a group
    https://docs.microsoft.com/rest/api/playfab/groups/groups/unblockentity
--]]
function PlayFabGroupsApi:UnblockEntity(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Group/UnblockEntity", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

--[[
    Updates non-membership data about a group.
    https://docs.microsoft.com/rest/api/playfab/groups/groups/updategroup
--]]
function PlayFabGroupsApi:UpdateGroup(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Group/UpdateGroup", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

--[[
    Updates metadata about a role.
    https://docs.microsoft.com/rest/api/playfab/groups/groups/updaterole
--]]
function PlayFabGroupsApi:UpdateRole(entityToken, request)
    return Promise.new(function(resolve, reject)
         if (not entityToken) then reject("Must provide an entityToken to call this method") end
        IPlayFabHttps.MakePlayFabApiCall("/Group/UpdateRole", request or {}, "X-EntityToken", entityToken, resolve, reject)
    end)
end

return PlayFabGroupsApi
