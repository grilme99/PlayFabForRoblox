--[[
	This file was generated on 2025-08-03 at 00:04 UTC. Do not edit directly.

]]

export type SetEntityProfilePolicyResponse = {
	--[[
		The permissions that govern access to this entity profile and its properties.
		Only includes permissions set on this profile, not global statements from
		titles and namespaces.

	]]
	Permissions: { EntityPermissionStatement }?,
}

export type EntityStatisticValue = {
	--[[
		Statistic name

	]]
	Name: string?,
	--[[
		Statistic scores

	]]
	Scores: { string }?,
	--[[
		Statistic version

	]]
	Version: number,
	--[[
		Metadata associated with the Statistic.

	]]
	Metadata: string?,
}

export type SetGlobalPolicyResponse = {
	-- No properties defined in spec
	[string]: any
}

--[[
	Given a master player account id (PlayFab ID), returns all title player
	accounts associated with it.

]]
export type GetTitlePlayersFromMasterPlayerAccountIdsRequest = {
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		Master player account ids.

	]]
	MasterPlayerAccountIds: { string },
	--[[
		Id of title to get players from.

	]]
	TitleId: string?,
}

--[[
	An entity object and its associated meta data.

]]
export type EntityDataObject = {
	--[[
		Name of this object.

	]]
	ObjectName: string?,
	--[[
		Escaped string JSON body of the object, if DataAsObject is default or false.

	]]
	EscapedDataObject: string?,
	--[[
		Un-escaped JSON object, if DataAsObject is true.

	]]
	DataObject: {
		-- No properties defined in spec
		[string]: any
	}?,
}

--[[
	Given an entity type and entity identifier will retrieve the profile from
	the entity store. If the profile being retrieved is the caller's, then the
	read operation is consistent, if not it is an inconsistent read. An
	inconsistent read means that we do not guarantee all committed writes have
	occurred before reading the profile, allowing for a stale read. If
	consistency is important the Version Number on the result can be used to
	compare which version of the profile any reader has.

]]
export type GetEntityProfileRequest = {
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey?,
	--[[
		Determines whether the objects will be returned as an escaped JSON string or
		as a un-escaped JSON object. Default is JSON string.

	]]
	DataAsObject: boolean?,
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

export type EffectType = 
	| "Allow"
	| "Deny"

export type EntityLineage = {
	--[[
		The Title Player Account Id of the associated entity.

	]]
	TitlePlayerAccountId: string?,
	--[[
		The Master Player Account Id of the associated entity.

	]]
	MasterPlayerAccountId: string?,
	--[[
		The Group Id of the associated entity.

	]]
	GroupId: string?,
	--[[
		The Namespace Id of the associated entity.

	]]
	NamespaceId: string?,
	--[[
		The Character Id of the associated entity.

	]]
	CharacterId: string?,
	--[[
		The Title Id of the associated entity.

	]]
	TitleId: string?,
}

export type GetEntityProfilesResponse = {
	--[[
		Entity profiles

	]]
	Profiles: { EntityProfileBody }?,
}

export type EntityProfileBody = {
	--[[
		The creation time of this profile in UTC.

	]]
	Created: string,
	--[[
		Avatar URL for the entity.

	]]
	AvatarUrl: string?,
	--[[
		The permissions that govern access to this entity profile and its properties.
		Only includes permissions set on this profile, not global statements from
		titles and namespaces.

	]]
	Permissions: { EntityPermissionStatement }?,
	--[[
		The chain of responsibility for this entity. Use Lineage.

	]]
	EntityChain: string?,
	--[[
		The display name of the entity. This field may serve different purposes for
		different entity types. i.e.: for a title player account it could represent
		the display name of the player, whereas on a character it could be character's
		name.

	]]
	DisplayName: string?,
	--[[
		An entity object and its associated meta data.

	]]
	Objects: EntityDataObject?,
	Lineage: EntityLineage?,
	Statistics: EntityStatisticValue?,
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey?,
	--[[
		An entity file's meta data. To get a download URL call File/GetFiles API.

	]]
	Files: EntityProfileFileMetadata?,
	--[[
		The version number of the profile in persistent storage at the time of the
		read. Used for optional optimistic concurrency during update.

	]]
	VersionNumber: number,
	--[[
		The language on this profile.

	]]
	Language: string?,
	--[[
		The experiment variants of this profile.

	]]
	ExperimentVariants: { string }?,
}

--[[
	This will set the access policy statements on the given entity profile. This
	is not additive, any existing statements will be replaced with the
	statements in this request.

]]
export type SetEntityProfilePolicyRequest = {
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey,
	--[[
		The statements to include in the access policy.

	]]
	Statements: { EntityPermissionStatement },
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
	Retrieves the title access policy that is used before the profile's policy
	is inspected during a request. If never customized this will return the
	default starter policy built by PlayFab.

]]
export type GetGlobalPolicyRequest = {
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

export type SetDisplayNameResponse = {
	OperationResult: OperationTypes?,
	--[[
		The updated version of the profile after the display name update

	]]
	VersionNumber: number?,
}

--[[
	Given an entity profile, will update its display name to the one passed in
	if the profile's version is equal to the specified value

]]
export type SetDisplayNameRequest = {
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
	--[[
		The expected version of a profile to perform this update on

	]]
	ExpectedVersion: number?,
	--[[
		The new value to be set on Entity Profile's display name

	]]
	DisplayName: string?,
}

export type GetGlobalPolicyResponse = {
	--[[
		The permissions that govern access to all entities under this title or
		namespace.

	]]
	Permissions: { EntityPermissionStatement }?,
}

export type OperationTypes = 
	| "Created"
	| "Updated"
	| "Deleted"
	| "None"

export type GetTitlePlayersFromMasterPlayerAccountIdsResponse = {
	--[[
		Optional id of title to get players from, required if calling using a
		master_player_account.

	]]
	TitleId: string?,
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	TitlePlayerAccounts: EntityKey?,
}

--[[
	An entity file's meta data. To get a download URL call File/GetFiles API.

]]
export type EntityProfileFileMetadata = {
	--[[
		Checksum value for the file, can be used to check if the file on the server
		has changed.

	]]
	Checksum: string?,
	--[[
		Last UTC time the file was modified

	]]
	LastModified: string,
	--[[
		Name of the file

	]]
	FileName: string?,
	--[[
		Storage service's reported byte count

	]]
	Size: number,
}

export type GetTitlePlayersFromProviderIDsResponse = {
	TitlePlayerAccounts: EntityLineage?,
}

export type SetProfileLanguageResponse = {
	OperationResult: OperationTypes?,
	--[[
		The updated version of the profile after the language update

	]]
	VersionNumber: number?,
}

--[[
	Given an entity profile, will update its language to the one passed in if
	the profile's version is equal to the one passed in.

]]
export type SetProfileLanguageRequest = {
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey?,
	--[[
		The expected version of a profile to perform this update on

	]]
	ExpectedVersion: number?,
	--[[
		The language to set on the given entity. Deletes the profile's language if
		passed in a null string.

	]]
	Language: string?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type EntityPermissionStatement = {
	--[[
		The principal this statement will effect.

	]]
	Principal: {
		-- No properties defined in spec
		[string]: any
	},
	--[[
		The action this statement effects. May be 'Read', 'Write' or '*' for both read
		and write.

	]]
	Action: string,
	Effect: EffectType,
	--[[
		A comment about the statement. Intended solely for bookkeeping and debugging.

	]]
	Comment: string?,
	--[[
		Additional conditions to be applied for entity resources.

	]]
	Condition: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		The resource this statements effects. Similar to 'pfrn:data--title![Title
		ID]/Profile/*'

	]]
	Resource: string,
}

export type GetEntityProfileResponse = {
	Profile: EntityProfileBody?,
}

--[[
	Given a set of entity types and entity identifiers will retrieve all
	readable profiles properties for the caller. Profiles that the caller is not
	allowed to read will silently not be included in the results.

]]
export type GetEntityProfilesRequest = {
	--[[
		Determines whether the objects will be returned as an escaped JSON string or
		as a un-escaped JSON object. Default is JSON string.

	]]
	DataAsObject: boolean?,
	--[[
		Entity keys of the profiles to load. Must be between 1 and 25

	]]
	Entities: { EntityKey },
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
	Updates the title access policy that is used before the profile's policy is
	inspected during a request. Policies are compiled and cached for several
	minutes so an update here may not be reflected in behavior for a short time.

]]
export type SetGlobalPolicyRequest = {
	--[[
		The permissions that govern access to all entities under this title or
		namespace.

	]]
	Permissions: { EntityPermissionStatement }?,
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
	Given a collection of Xbox IDs (XUIDs), returns all title player accounts.

]]
export type GetTitlePlayersFromXboxLiveIDsRequest = {
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		Xbox Sandbox the players had on their Xbox tokens.

	]]
	Sandbox: string,
	--[[
		List of Xbox Live XUIDs

	]]
	XboxLiveIds: { string },
	--[[
		Optional ID of title to get players from, required if calling using a
		master_player_account.

	]]
	TitleId: string?,
}



return nil
