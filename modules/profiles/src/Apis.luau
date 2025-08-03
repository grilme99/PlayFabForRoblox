--[[
	This file was generated on 2025-08-03 at 00:04 UTC. Do not edit directly.

]]

local Types = require(script.Parent.Types)

local Common = require(script.Parent.Parent.PlayFabCommon)
local makeApiCall = Common.makeApiCall
type Result<T, E> = Common.Result<T, E>

local Apis = {}

--[[
	Update the display name of the entity

	Given an entity profile, will update its display name to the one passed in
	if the profile's version is equal to the specified value

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/profiles/account-management/setdisplayname).

	### Errors
	- AccountNotFound
	- ConcurrentEditError
	- EntityProfileConstraintValidationFailed
	- EntityProfileVersionMismatch
	- InvalidPartnerResponse
	- NameNotAvailable
	- ProfaneDisplayName

]]
function Apis.SetDisplayName(request: Types.SetDisplayNameRequest, entityToken: string): Result<Types.SetDisplayNameResponse, string>
	return makeApiCall(
		"/Profile/SetDisplayName",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Sets the global title access policy

	Updates the title access policy that is used before the profile's policy is
	inspected during a request. Policies are compiled and cached for several
	minutes so an update here may not be reflected in behavior for a short time.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/profiles/account-management/setglobalpolicy).

]]
function Apis.SetGlobalPolicy(request: Types.SetGlobalPolicyRequest, entityToken: string): Result<Types.SetGlobalPolicyResponse, string>
	return makeApiCall(
		"/Profile/SetGlobalPolicy",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Retrieves the title player accounts associated with the given master player
	account.

	Given a master player account id (PlayFab ID), returns all title player
	accounts associated with it.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/profiles/account-management/gettitleplayersfrommasterplayeraccountids).

]]
function Apis.GetTitlePlayersFromMasterPlayerAccountIds(request: Types.GetTitlePlayersFromMasterPlayerAccountIdsRequest, entityToken: string): Result<Types.GetTitlePlayersFromMasterPlayerAccountIdsResponse, string>
	return makeApiCall(
		"/Profile/GetTitlePlayersFromMasterPlayerAccountIds",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Retrieves the title player accounts associated with the given XUIDs.

	Given a collection of Xbox IDs (XUIDs), returns all title player accounts.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/profiles/account-management/gettitleplayersfromxboxliveids).

]]
function Apis.GetTitlePlayersFromXboxLiveIDs(request: Types.GetTitlePlayersFromXboxLiveIDsRequest, entityToken: string): Result<Types.GetTitlePlayersFromProviderIDsResponse, string>
	return makeApiCall(
		"/Profile/GetTitlePlayersFromXboxLiveIDs",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Updates the entity's language. The precedence hierarchy for communication to
	the player is Title Player Account language, Master Player Account language,
	and then title default language if the first two aren't set or supported.

	Given an entity profile, will update its language to the one passed in if
	the profile's version is equal to the one passed in.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/profiles/account-management/setprofilelanguage).

]]
function Apis.SetProfileLanguage(request: Types.SetProfileLanguageRequest, entityToken: string): Result<Types.SetProfileLanguageResponse, string>
	return makeApiCall(
		"/Profile/SetProfileLanguage",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Sets the profiles access policy

	This will set the access policy statements on the given entity profile. This
	is not additive, any existing statements will be replaced with the
	statements in this request.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/profiles/account-management/setprofilepolicy).

]]
function Apis.SetProfilePolicy(request: Types.SetEntityProfilePolicyRequest, entityToken: string): Result<Types.SetEntityProfilePolicyResponse, string>
	return makeApiCall(
		"/Profile/SetProfilePolicy",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Retrieves the entity's profile.

	Given a set of entity types and entity identifiers will retrieve all
	readable profiles properties for the caller. Profiles that the caller is not
	allowed to read will silently not be included in the results.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/profiles/account-management/getprofiles).

]]
function Apis.GetProfiles(request: Types.GetEntityProfilesRequest, entityToken: string): Result<Types.GetEntityProfilesResponse, string>
	return makeApiCall(
		"/Profile/GetProfiles",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Retrieves the entity's profile.

	Given an entity type and entity identifier will retrieve the profile from
	the entity store. If the profile being retrieved is the caller's, then the
	read operation is consistent, if not it is an inconsistent read. An
	inconsistent read means that we do not guarantee all committed writes have
	occurred before reading the profile, allowing for a stale read. If
	consistency is important the Version Number on the result can be used to
	compare which version of the profile any reader has.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/profiles/account-management/getprofile).

]]
function Apis.GetProfile(request: Types.GetEntityProfileRequest, entityToken: string): Result<Types.GetEntityProfileResponse, string>
	return makeApiCall(
		"/Profile/GetProfile",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Gets the global title access policy

	Retrieves the title access policy that is used before the profile's policy
	is inspected during a request. If never customized this will return the
	default starter policy built by PlayFab.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/profiles/account-management/getglobalpolicy).

]]
function Apis.GetGlobalPolicy(request: Types.GetGlobalPolicyRequest, entityToken: string): Result<Types.GetGlobalPolicyResponse, string>
	return makeApiCall(
		"/Profile/GetGlobalPolicy",
		request,
		"X-EntityToken",
		entityToken
	)
end

return Apis
