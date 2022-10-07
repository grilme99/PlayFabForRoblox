--!strict
--[=[
	# ProfilesApi

	All PlayFab entities have profiles, which hold top-level properties about the 
	entity. These APIs give you the tools needed to manage entity profiles. The 
	Master Player APIs allow you to perform operations on a master player account. 

	API Version: 1.220926.4
]=]

local PlayFabInternal = require(script.Parent.PlayFabInternal)

local ProfilesApi = {}

function ProfilesApi.SetSettings(settings: PlayFabInternal.ISettings)
	PlayFabInternal.SetSettings(settings)
end

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

export type EffectType = 
	"Allow"
	| "Deny"

--- An entity object and its associated meta data. 
export type EntityDataObject = {
	--- Un-escaped JSON object, if DataAsObject is true. 
	DataObject: {[any]: any}?,
	--- Escaped string JSON body of the object, if DataAsObject is default or false. 
	EscapedDataObject: string?,
	--- Name of this object. 
	ObjectName: string?,
}

--- Combined entity type and ID structure which uniquely identifies a single entity. 
export type EntityKey = {
	--- Unique ID of the entity. 
	Id: string,
	--- Entity type. See https://docs.microsoft.com/gaming/playfab/features/data/entities/available-built-in-entity-types 
	Type: string?,
}

export type EntityLineage = {
	--- The Character Id of the associated entity. 
	CharacterId: string?,
	--- The Group Id of the associated entity. 
	GroupId: string?,
	--- The Master Player Account Id of the associated entity. 
	MasterPlayerAccountId: string?,
	--- The Namespace Id of the associated entity. 
	NamespaceId: string?,
	--- The Title Player Account Id of the associated entity. 
	TitlePlayerAccountId: string?,
}

export type EntityPermissionStatement = {
	--- The action this statement effects. May be 'Read', 'Write' or '*' for both read 
	--- and write. 
	Action: string,
	--- A comment about the statement. Intended solely for bookkeeping and debugging. 
	Comment: string?,
	--- Additional conditions to be applied for entity resources. 
	Condition: {[any]: any}?,
	--- The effect this statement will have. It may be either Allow or Deny 
	Effect: string,
	--- The principal this statement will effect. 
	Principal: {[any]: any},
	--- The resource this statements effects. Similar to 'pfrn:data--title![Title ID]/Profile/*' 
	Resource: string,
}

export type EntityProfileBody = {
	--- Avatar URL for the entity. 
	AvatarUrl: string?,
	--- The creation time of this profile in UTC. 
	Created: string,
	--- The display name of the entity. This field may serve different purposes for 
	--- different entity types. i.e.: for a title player account it could represent 
	--- the display name of the player, whereas on a character it could be character's 
	--- name. 
	DisplayName: string?,
	--- The entity id and type. 
	Entity: EntityKey?,
	--- The chain of responsibility for this entity. Use Lineage. 
	EntityChain: string?,
	--- The experiment variants of this profile. 
	ExperimentVariants: {any}?,
	--- The files on this profile. 
	Files: EntityProfileFileMetadata?,
	--- The language on this profile. 
	Language: string?,
	--- Leaderboard metadata for the entity. 
	LeaderboardMetadata: string?,
	--- The lineage of this profile. 
	Lineage: EntityLineage?,
	--- The objects on this profile. 
	Objects: EntityDataObject?,
	--- The permissions that govern access to this entity profile and its properties. 
	--- Only includes permissions set on this profile, not global statements from titles 
	--- and namespaces. 
	Permissions: {EntityPermissionStatement}?,
	--- The statistics on this profile. 
	Statistics: EntityStatisticValue?,
	--- The version number of the profile in persistent storage at the time of the read. 
	--- Used for optional optimistic concurrency during update. 
	VersionNumber: number,
}

--- An entity file's meta data. To get a download URL call File/GetFiles API. 
export type EntityProfileFileMetadata = {
	--- Checksum value for the file, can be used to check if the file on the server 
	--- has changed. 
	Checksum: string?,
	--- Name of the file 
	FileName: string?,
	--- Last UTC time the file was modified 
	LastModified: string,
	--- Storage service's reported byte count 
	Size: number,
}

export type EntityStatisticChildValue = {
	--- Child name value, if child statistic 
	ChildName: string?,
	--- Child statistic metadata 
	Metadata: string?,
	--- Child statistic value 
	Value: number,
}

export type EntityStatisticValue = {
	--- Child statistic values 
	ChildStatistics: EntityStatisticChildValue?,
	--- Statistic metadata 
	Metadata: string?,
	--- Statistic name 
	Name: string?,
	--- Statistic value 
	Value: number?,
	--- Statistic version 
	Version: number,
}

--- Given an entity type and entity identifier will retrieve the profile from the 
--- entity store. If the profile being retrieved is the caller's, then the read 
--- operation is consistent, if not it is an inconsistent read. An inconsistent 
--- read means that we do not guarantee all committed writes have occurred before 
--- reading the profile, allowing for a stale read. If consistency is important 
--- the Version Number on the result can be used to compare which version of the 
--- profile any reader has. 
export type GetEntityProfileRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- Determines whether the objects will be returned as an escaped JSON string or 
	--- as a un-escaped JSON object. Default is JSON string. 
	DataAsObject: boolean?,
	--- The optional entity to perform this action on. Defaults to the currently logged 
	--- in entity. 
	Entity: EntityKey?,
}

export type GetEntityProfileResponse = {
	--- Entity profile 
	Profile: EntityProfileBody?,
}

--- Given a set of entity types and entity identifiers will retrieve all readable 
--- profiles properties for the caller. Profiles that the caller is not allowed 
--- to read will silently not be included in the results. 
export type GetEntityProfilesRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- Determines whether the objects will be returned as an escaped JSON string or 
	--- as a un-escaped JSON object. Default is JSON string. 
	DataAsObject: boolean?,
	--- Entity keys of the profiles to load. Must be between 1 and 25 
	Entities: {EntityKey},
}

export type GetEntityProfilesResponse = {
	--- Entity profiles 
	Profiles: {EntityProfileBody}?,
}

--- Retrieves the title access policy that is used before the profile's policy is 
--- inspected during a request. If never customized this will return the default 
--- starter policy built by PlayFab. 
export type GetGlobalPolicyRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The optional entity to perform this action on. Defaults to the currently logged 
	--- in entity. 
	Entity: EntityKey?,
}

export type GetGlobalPolicyResponse = {
	--- The permissions that govern access to all entities under this title or namespace. 
	Permissions: {EntityPermissionStatement}?,
}

--- Given a master player account id (PlayFab ID), returns all title player accounts 
--- associated with it. 
export type GetTitlePlayersFromMasterPlayerAccountIdsRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- Master player account ids. 
	MasterPlayerAccountIds: {any},
}

export type GetTitlePlayersFromMasterPlayerAccountIdsResponse = {
	--- Dictionary of master player ids mapped to title player entity keys and id pairs 
	TitlePlayerAccounts: EntityKey?,
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
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The entity to perform this action on. 
	Entity: EntityKey,
	--- The statements to include in the access policy. 
	Statements: {EntityPermissionStatement}?,
}

export type SetEntityProfilePolicyResponse = {
	--- The permissions that govern access to this entity profile and its properties. 
	--- Only includes permissions set on this profile, not global statements from titles 
	--- and namespaces. 
	Permissions: {EntityPermissionStatement}?,
}

--- Updates the title access policy that is used before the profile's policy is 
--- inspected during a request. Policies are compiled and cached for several minutes 
--- so an update here may not be reflected in behavior for a short time. 
export type SetGlobalPolicyRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The permissions that govern access to all entities under this title or namespace. 
	Permissions: {EntityPermissionStatement}?,
}

export type SetGlobalPolicyResponse = {
}

--- Given an entity profile, will update its language to the one passed in if the 
--- profile's version is equal to the one passed in. 
export type SetProfileLanguageRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The optional entity to perform this action on. Defaults to the currently logged 
	--- in entity. 
	Entity: EntityKey?,
	--- The expected version of a profile to perform this update on 
	ExpectedVersion: number?,
	--- The language to set on the given entity. Deletes the profile's language if passed 
	--- in a null string. 
	Language: string?,
}

export type SetProfileLanguageResponse = {
	--- The type of operation that occured on the profile's language 
	OperationResult: string?,
	--- The updated version of the profile after the language update 
	VersionNumber: number?,
}


--- Retrieves the title access policy that is used before the profile's policy is 
--- inspected during a request. If never customized this will return the default 
--- starter policy built by PlayFab. 
---
--- https://docs.microsoft.com/rest/api/playfab/profiles/account-management/getglobalpolicy
function ProfilesApi.GetGlobalPolicyAsync(
	entityToken: string, 
	request: GetGlobalPolicyRequest
): GetGlobalPolicyResponse
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
): GetEntityProfileResponse
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
): GetEntityProfilesResponse
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
): GetTitlePlayersFromMasterPlayerAccountIdsResponse
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
): SetGlobalPolicyResponse
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
): SetProfileLanguageResponse
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
): SetEntityProfilePolicyResponse
	return PlayFabInternal.MakeApiCall(
		"/Profiles/SetProfilePolicy",
		request,
		"X-EntityToken",
		entityToken
	)
end

return ProfilesApi

