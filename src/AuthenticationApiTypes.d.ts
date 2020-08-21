/// <reference path="PlayFabTypes.d.ts" />

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

interface GetEntityTokenRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // The entity to perform this action on.
    Entity?: EntityKey;
}

interface GetEntityTokenResponse extends PlayFabModule.IPlayFabResultCommon {
    // The entity id and type.
    Entity?: EntityKey;
    // The token used to set X-EntityToken for all entity based API calls.
    EntityToken?: string;
    // The time the token will expire, if it is an expiring token, in UTC.
    TokenExpiration?: string;
}

type IdentifiedDeviceType = "Unknown"
    | "XboxOne"
    | "Scarlett";

interface ValidateEntityTokenRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // Client EntityToken
    EntityToken: string;
}

interface ValidateEntityTokenResponse extends PlayFabModule.IPlayFabResultCommon {
    // The entity id and type.
    Entity?: EntityKey;
    // The authenticated device for this entity, for the given login
    IdentifiedDeviceType?: string;
    // The identity provider for this entity, for the given login
    IdentityProvider?: string;
    // The lineage of this profile.
    Lineage?: EntityLineage;
}
