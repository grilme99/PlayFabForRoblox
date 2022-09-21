--!strict
--[=[
	# ProfilesApi

	All PlayFab entities have profiles, which hold top-level properties about the 
	entity. These APIs give you the tools needed to manage entity profiles. The 
	Master Player APIs allow you to perform operations on a master player account. 
]=]

local PlayFabInternal = require(script.Parent.PlayFabInternal)

local ProfilesApi = {}

function ProfilesApi.SetSettings(settings: PlayFabInternal.ISettings)
	PlayFabInternal.SetSettings(settings)
end

--- The basic wrapper around every failed API response 
export type ApiErrorWrapper = {
	code: number, --- Numerical HTTP code
	error: string?, --- Playfab error code
	errorCode: number, --- Numerical PlayFab error code
	errorDetails: {[any]: any}?, --- Detailed description of individual issues with the request object
	errorMessage: string?, --- Description for the PlayFab errorCode
	status: string?, --- String HTTP code
}

export type EffectType = 
	"Allow"
	| "Deny"

--- An entity object and its associated meta data. 
export type EntityDataObject = {
	DataObject: {[any]: any}?, --- Un-escaped JSON object, if DataAsObject is true.
	EscapedDataObject: string?, --- Escaped string JSON body of the object, if DataAsObject is default or false.
	ObjectName: string?, --- Name of this object.
}

--- Combined entity type and ID structure which uniquely identifies a single entity. 
export type EntityKey = {
	Id: string, --- Unique ID of the entity.
	Type: string?, --- Entity type. See https://docs.microsoft.com/gaming/playfab/features/data/entities/available-built-in-entity-types
}

export type EntityLineage = {
	CharacterId: string?, --- The Character Id of the associated entity.
	GroupId: string?, --- The Group Id of the associated entity.
	MasterPlayerAccountId: string?, --- The Master Player Account Id of the associated entity.
	NamespaceId: string?, --- The Namespace Id of the associated entity.
	TitleId: string?, --- The Title Id of the associated entity.
	TitlePlayerAccountId: string?, --- The Title Player Account Id of the associated entity.
}

export type EntityPermissionStatement = {
	Action: string, --- The action this statement effects. May be 'Read', 'Write' or '*' for both read and write.
	Comment: string?, --- A comment about the statement. Intended solely for bookkeeping and debugging.
	Condition: {[any]: any}?, --- Additional conditions to be applied for entity resources.
	Effect: string, --- The effect this statement will have. It may be either Allow or Deny
	Principal: {[any]: any}, --- The principal this statement will effect.
	Resource: string, --- The resource this statements effects. Similar to 'pfrn:data--title![Title ID]/Profile/*'
}

export type EntityProfileBody = {
	AvatarUrl: string?, --- Avatar URL for the entity.
	Created: string, --- The creation time of this profile in UTC.
	DisplayName: string?, --- The display name of the entity. This field may serve different purposes for different entity types. i.e.: for a title player account it could represent the display name of the player, whereas on a character it could be character's name.
	Entity: EntityKey?, --- The entity id and type.
	EntityChain: string?, --- The chain of responsibility for this entity. Use Lineage.
	ExperimentVariants: {any}?, --- The experiment variants of this profile.
	Files: EntityProfileFileMetadata?, --- The files on this profile.
	Language: string?, --- The language on this profile.
	LeaderboardMetadata: string?, --- Leaderboard metadata for the entity.
	Lineage: EntityLineage?, --- The lineage of this profile.
	Objects: EntityDataObject?, --- The objects on this profile.
	Permissions: {EntityPermissionStatement}?, --- The permissions that govern access to this entity profile and its properties. Only includes permissions set on this profile, not global statements from titles and namespaces.
	Statistics: EntityStatisticValue?, --- The statistics on this profile.
	VersionNumber: number, --- The version number of the profile in persistent storage at the time of the read. Used for optional optimistic concurrency during update.
}

--- An entity file's meta data. To get a download URL call File/GetFiles API. 
export type EntityProfileFileMetadata = {
	Checksum: string?, --- Checksum value for the file, can be used to check if the file on the server has changed.
	FileName: string?, --- Name of the file
	LastModified: string, --- Last UTC time the file was modified
	Size: number, --- Storage service's reported byte count
}

export type EntityStatisticChildValue = {
	ChildName: string?, --- Child name value, if child statistic
	Metadata: string?, --- Child statistic metadata
	Value: number, --- Child statistic value
}

export type EntityStatisticValue = {
	ChildStatistics: EntityStatisticChildValue?, --- Child statistic values
	Metadata: string?, --- Statistic metadata
	Name: string?, --- Statistic name
	Value: number?, --- Statistic value
	Version: number, --- Statistic version
}

--- Given an entity type and entity identifier will retrieve the profile from the 
--- entity store. If the profile being retrieved is the caller's, then the read 
--- operation is consistent, if not it is an inconsistent read. An inconsistent 
--- read means that we do not guarantee all committed writes have occurred before 
--- reading the profile, allowing for a stale read. If consistency is important 
--- the Version Number on the result can be used to compare which version of the 
--- profile any reader has. 
export type GetEntityProfileRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	DataAsObject: boolean?, --- Determines whether the objects will be returned as an escaped JSON string or as a un-escaped JSON object. Default is JSON string.
	Entity: EntityKey?, --- The optional entity to perform this action on. Defaults to the currently logged in entity.
}

export type GetEntityProfileResponse = {
	Profile: EntityProfileBody?, --- Entity profile
}

--- Given a set of entity types and entity identifiers will retrieve all readable 
--- profiles properties for the caller. Profiles that the caller is not allowed 
--- to read will silently not be included in the results. 
export type GetEntityProfilesRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	DataAsObject: boolean?, --- Determines whether the objects will be returned as an escaped JSON string or as a un-escaped JSON object. Default is JSON string.
	Entities: {EntityKey}, --- Entity keys of the profiles to load. Must be between 1 and 25
}

export type GetEntityProfilesResponse = {
	Profiles: {EntityProfileBody}?, --- Entity profiles
}

--- Retrieves the title access policy that is used before the profile's policy is 
--- inspected during a request. If never customized this will return the default 
--- starter policy built by PlayFab. 
export type GetGlobalPolicyRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	Entity: EntityKey?, --- The optional entity to perform this action on. Defaults to the currently logged in entity.
}

export type GetGlobalPolicyResponse = {
	Permissions: {EntityPermissionStatement}?, --- The permissions that govern access to all entities under this title or namespace.
}

--- Given a master player account id (PlayFab ID), returns all title player accounts 
--- associated with it. 
export type GetTitlePlayersFromMasterPlayerAccountIdsRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	MasterPlayerAccountIds: {any}, --- Master player account ids.
	TitleId: string?, --- Id of title to get players from.
}

export type GetTitlePlayersFromMasterPlayerAccountIdsResponse = {
	TitleId: string?, --- Optional id of title to get players from, required if calling using a master_player_account.
	TitlePlayerAccounts: EntityKey?, --- Dictionary of master player ids mapped to title player entity keys and id pairs
}

export type OperationTypes = 
	"Created"
	| "Updated"
	| "Deleted"
	| "None"

--- This will set the access policy statements on the given entity profile. This 
--- is not additive, any existing statements will be replaced with the statements 
--- in this request. 
export type SetEntityProfilePolicyRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	Entity: EntityKey, --- The entity to perform this action on.
	Statements: {EntityPermissionStatement}?, --- The statements to include in the access policy.
}

export type SetEntityProfilePolicyResponse = {
	Permissions: {EntityPermissionStatement}?, --- The permissions that govern access to this entity profile and its properties. Only includes permissions set on this profile, not global statements from titles and namespaces.
}

--- Updates the title access policy that is used before the profile's policy is 
--- inspected during a request. Policies are compiled and cached for several minutes 
--- so an update here may not be reflected in behavior for a short time. 
export type SetGlobalPolicyRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	Permissions: {EntityPermissionStatement}?, --- The permissions that govern access to all entities under this title or namespace.
}

export type SetGlobalPolicyResponse = {
}

--- Given an entity profile, will update its language to the one passed in if the 
--- profile's version is equal to the one passed in. 
export type SetProfileLanguageRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	Entity: EntityKey?, --- The optional entity to perform this action on. Defaults to the currently logged in entity.
	ExpectedVersion: number?, --- The expected version of a profile to perform this update on
	Language: string?, --- The language to set on the given entity. Deletes the profile's language if passed in a null string.
}

export type SetProfileLanguageResponse = {
	OperationResult: string?, --- The type of operation that occured on the profile's language
	VersionNumber: number?, --- The updated version of the profile after the language update
}


--- Retrieves the title access policy that is used before the profile's policy is 
--- inspected during a request. If never customized this will return the default 
--- starter policy built by PlayFab. 
---
--- https://docs.microsoft.com/rest/api/playfab/profiles/account-management/getglobalpolicy
function ProfilesApi.GetGlobalPolicyAsync(
	entityToken: string, 
	request: GetGlobalPolicyRequest
): GetGlobalPolicyResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Profiles/GetGlobalPolicy",
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
function ProfilesApi.GetProfileAsync(
	entityToken: string, 
	request: GetEntityProfileRequest
): GetEntityProfileResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Profiles/GetProfile",
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
function ProfilesApi.GetProfilesAsync(
	entityToken: string, 
	request: GetEntityProfilesRequest
): GetEntityProfilesResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Profiles/GetProfiles",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Given a master player account id (PlayFab ID), returns all title player accounts 
--- associated with it. 
---
--- https://docs.microsoft.com/rest/api/playfab/profiles/account-management/gettitleplayersfrommasterplayeraccountids
function ProfilesApi.GetTitlePlayersFromMasterPlayerAccountIdsAsync(
	entityToken: string, 
	request: GetTitlePlayersFromMasterPlayerAccountIdsRequest
): GetTitlePlayersFromMasterPlayerAccountIdsResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Profiles/GetTitlePlayersFromMasterPlayerAccountIds",
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
function ProfilesApi.SetGlobalPolicyAsync(
	entityToken: string, 
	request: SetGlobalPolicyRequest
): SetGlobalPolicyResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Profiles/SetGlobalPolicy",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Given an entity profile, will update its language to the one passed in if the 
--- profile's version is equal to the one passed in. 
---
--- https://docs.microsoft.com/rest/api/playfab/profiles/account-management/setprofilelanguage
function ProfilesApi.SetProfileLanguageAsync(
	entityToken: string, 
	request: SetProfileLanguageRequest
): SetProfileLanguageResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Profiles/SetProfileLanguage",
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
function ProfilesApi.SetProfilePolicyAsync(
	entityToken: string, 
	request: SetEntityProfilePolicyRequest
): SetEntityProfilePolicyResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Profiles/SetProfilePolicy",
		request,
		"X-EntityToken",
		entityToken
	)
end

return ProfilesApi

