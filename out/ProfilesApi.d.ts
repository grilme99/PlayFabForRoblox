/// <reference path="PlayFab.d.ts" />

interface EntityDataObject {
    // Un-escaped JSON object, if DataAsObject is true.
    DataObject?: any;
    // Escaped string JSON body of the object, if DataAsObject is default or false.
    EscapedDataObject?: string;
    // Name of this object.
    ObjectName?: string;
}

interface EntityKey {
    // Unique ID of the entity.
    Id: string;
    // Entity type. See https://docs.microsoft.com/gaming/playfab/features/data/entities/available-built-in-entity-types
    Type?: string;
}

interface EntityLineage {
    // The Character Id of the associated entity.
    CharacterId?: string;
    // The Group Id of the associated entity.
    GroupId?: string;
    // The Master Player Account Id of the associated entity.
    MasterPlayerAccountId?: string;
    // The Namespace Id of the associated entity.
    NamespaceId?: string;
    // The Title Id of the associated entity.
    TitleId?: string;
    // The Title Player Account Id of the associated entity.
    TitlePlayerAccountId?: string;
}

interface EntityPermissionStatement {
    // The action this statement effects. May be 'Read', 'Write' or '*' for both read and write.
    Action: string;
    // A comment about the statement. Intended solely for bookkeeping and debugging.
    Comment?: string;
    // Additional conditions to be applied for entity resources.
    Condition?: any;
    // The effect this statement will have. It may be either Allow or Deny
    Effect: string;
    // The principal this statement will effect.
    Principal: any;
    // The resource this statements effects. Similar to 'pfrn:data--title![Title ID]/Profile/*'
    Resource: string;
}

interface EntityProfileBody {
    // Avatar URL for the entity.
    AvatarUrl?: string;
    // The creation time of this profile in UTC.
    Created: string;
    // The display name of the entity. This field may serve different purposes for different entity types. i.e.: for a title
    // player account it could represent the display name of the player, whereas on a character it could be character's name.
    DisplayName?: string;
    // The entity id and type.
    Entity?: EntityKey;
    // The chain of responsibility for this entity. Use Lineage.
    EntityChain?: string;
    // The experiment variants of this profile.
    ExperimentVariants?: string[];
    // The files on this profile.
    Files?: { [key: string]: EntityProfileFileMetadata };
    // The language on this profile.
    Language?: string;
    // Leaderboard metadata for the entity.
    LeaderboardMetadata?: string;
    // The lineage of this profile.
    Lineage?: EntityLineage;
    // The objects on this profile.
    Objects?: { [key: string]: EntityDataObject };
    // The permissions that govern access to this entity profile and its properties. Only includes permissions set on this
    // profile, not global statements from titles and namespaces.
    Permissions?: EntityPermissionStatement[];
    // The statistics on this profile.
    Statistics?: { [key: string]: EntityStatisticValue };
    // The version number of the profile in persistent storage at the time of the read. Used for optional optimistic
    // concurrency during update.
    VersionNumber: number;
}

interface EntityProfileFileMetadata {
    // Checksum value for the file
    Checksum?: string;
    // Name of the file
    FileName?: string;
    // Last UTC time the file was modified
    LastModified: string;
    // Storage service's reported byte count
    Size: number;
}

interface EntityStatisticChildValue {
    // Child name value, if child statistic
    ChildName?: string;
    // Child statistic metadata
    Metadata?: string;
    // Child statistic value
    Value: number;
}

interface EntityStatisticValue {
    // Child statistic values
    ChildStatistics?: { [key: string]: EntityStatisticChildValue };
    // Statistic metadata
    Metadata?: string;
    // Statistic name
    Name?: string;
    // Statistic value
    Value?: number;
    // Statistic version
    Version: number;
}

interface GetEntityProfileRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // Determines whether the objects will be returned as an escaped JSON string or as a un-escaped JSON object. Default is
    // JSON string.
    DataAsObject?: boolean;
    // The entity to perform this action on.
    Entity?: EntityKey;
}

interface GetEntityProfileResponse extends PlayFabModule.IPlayFabResultCommon {
    // Entity profile
    Profile?: EntityProfileBody;
}

interface GetEntityProfilesRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // Determines whether the objects will be returned as an escaped JSON string or as a un-escaped JSON object. Default is
    // JSON string.
    DataAsObject?: boolean;
    // Entity keys of the profiles to load. Must be between 1 and 25
    Entities: EntityKey[];
}

interface GetEntityProfilesResponse extends PlayFabModule.IPlayFabResultCommon {
    // Entity profiles
    Profiles?: EntityProfileBody[];
}

interface GetGlobalPolicyRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
}

interface GetGlobalPolicyResponse extends PlayFabModule.IPlayFabResultCommon {
    // The permissions that govern access to all entities under this title or namespace.
    Permissions?: EntityPermissionStatement[];
}

interface GetTitlePlayersFromMasterPlayerAccountIdsRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // Master player account ids.
    MasterPlayerAccountIds: string[];
    // Id of title to get players from.
    TitleId?: string;
}

interface GetTitlePlayersFromMasterPlayerAccountIdsResponse extends PlayFabModule.IPlayFabResultCommon {
    // Optional id of title to get players from, required if calling using a master_player_account.
    TitleId?: string;
    // Dictionary of master player ids mapped to title player entity keys and id pairs
    TitlePlayerAccounts?: { [key: string]: EntityKey };
}

interface SetEntityProfilePolicyRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // The entity to perform this action on.
    Entity: EntityKey;
    // The statements to include in the access policy.
    Statements?: EntityPermissionStatement[];
}

interface SetEntityProfilePolicyResponse extends PlayFabModule.IPlayFabResultCommon {
    // The permissions that govern access to this entity profile and its properties. Only includes permissions set on this
    // profile, not global statements from titles and namespaces.
    Permissions?: EntityPermissionStatement[];
}

interface SetGlobalPolicyRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // The permissions that govern access to all entities under this title or namespace.
    Permissions?: EntityPermissionStatement[];
}

interface SetGlobalPolicyResponse extends PlayFabModule.IPlayFabResultCommon {}

interface SetProfileLanguageRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // The entity to perform this action on.
    Entity?: EntityKey;
    // The expected version of a profile to perform this update on
    ExpectedVersion?: number;
    // The language to set on the given entity. Deletes the profile's language if passed in a null string.
    Language?: string;
}

interface SetProfileLanguageResponse extends PlayFabModule.IPlayFabResultCommon {
    // The type of operation that occured on the profile's language
    OperationResult?: string;
    // The updated version of the profile after the language update
    VersionNumber?: number;
}