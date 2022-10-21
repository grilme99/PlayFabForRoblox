--!strict

local PlayFabInternal = require(script.Parent.Parent.PlayFabInternal)
local Types = require(script.Parent.Types)

local Apis = {}

--- Retrieves the title access policy that is used before the profile's policy is 
--- inspected during a request. If never customized this will return the default 
--- starter policy built by PlayFab. 
---
--- https://docs.microsoft.com/rest/api/playfab/profiles/account-management/getglobalpolicy
function Apis.GetGlobalPolicyAsync(
	entityToken: string, 
	request: Types.GetGlobalPolicyRequest
): Types.GetGlobalPolicyResponse
	return PlayFabInternal.MakeApiCall(
		"/Profile/GetGlobalPolicy",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Given an entity type and entity identifier will retrieve the profile from the 
--- entity store. If the profile being retrieved is the caller's, then the read 
--- operation is consistent, if not it is an inconsistent read. An inconsistent 
--- read means that we do not guarantee all committed writes have occurred before 
--- reading the profile, allowing for a stale read. If consistency is important 
--- the Version Number on the result can be used to compare which version of the 
--- profile any reader has. 
---
--- https://docs.microsoft.com/rest/api/playfab/profiles/account-management/getprofile
function Apis.GetProfileAsync(
	entityToken: string, 
	request: Types.GetEntityProfileRequest
): Types.GetEntityProfileResponse
	return PlayFabInternal.MakeApiCall(
		"/Profile/GetProfile",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Given a set of entity types and entity identifiers will retrieve all readable 
--- profiles properties for the caller. Profiles that the caller is not allowed 
--- to read will silently not be included in the results. 
---
--- https://docs.microsoft.com/rest/api/playfab/profiles/account-management/getprofiles
function Apis.GetProfilesAsync(
	entityToken: string, 
	request: Types.GetEntityProfilesRequest
): Types.GetEntityProfilesResponse
	return PlayFabInternal.MakeApiCall(
		"/Profile/GetProfiles",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Given a master player account id (PlayFab ID), returns all title player accounts 
--- associated with it. 
---
--- https://docs.microsoft.com/rest/api/playfab/profiles/account-management/gettitleplayersfrommasterplayeraccountids
function Apis.GetTitlePlayersFromMasterPlayerAccountIdsAsync(
	entityToken: string, 
	request: Types.GetTitlePlayersFromMasterPlayerAccountIdsRequest
): Types.GetTitlePlayersFromMasterPlayerAccountIdsResponse
	return PlayFabInternal.MakeApiCall(
		"/Profile/GetTitlePlayersFromMasterPlayerAccountIds",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Updates the title access policy that is used before the profile's policy is 
--- inspected during a request. Policies are compiled and cached for several minutes 
--- so an update here may not be reflected in behavior for a short time. 
---
--- https://docs.microsoft.com/rest/api/playfab/profiles/account-management/setglobalpolicy
function Apis.SetGlobalPolicyAsync(
	entityToken: string, 
	request: Types.SetGlobalPolicyRequest
): Types.SetGlobalPolicyResponse
	return PlayFabInternal.MakeApiCall(
		"/Profile/SetGlobalPolicy",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Given an entity profile, will update its language to the one passed in if the 
--- profile's version is equal to the one passed in. 
---
--- https://docs.microsoft.com/rest/api/playfab/profiles/account-management/setprofilelanguage
function Apis.SetProfileLanguageAsync(
	entityToken: string, 
	request: Types.SetProfileLanguageRequest
): Types.SetProfileLanguageResponse
	return PlayFabInternal.MakeApiCall(
		"/Profile/SetProfileLanguage",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- This will set the access policy statements on the given entity profile. This 
--- is not additive, any existing statements will be replaced with the statements 
--- in this request. 
---
--- https://docs.microsoft.com/rest/api/playfab/profiles/account-management/setprofilepolicy
function Apis.SetProfilePolicyAsync(
	entityToken: string, 
	request: Types.SetEntityProfilePolicyRequest
): Types.SetEntityProfilePolicyResponse
	return PlayFabInternal.MakeApiCall(
		"/Profile/SetProfilePolicy",
		request,
		"X-EntityToken",
		entityToken
	)
end

return Apis

