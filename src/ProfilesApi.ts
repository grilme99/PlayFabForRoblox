/// <reference path="ProfilesApiTypes.d.ts" />

import MakeRequest from './HTTP'
import Settings from './Settings'

/**
 * Gets the global title access policy
 * https://docs.microsoft.com/rest/api/playfab/profiles/account-management/getglobalpolicy
 */
export const GetGlobalPolicy = async (request: GetGlobalPolicyRequest) => {
    if (Settings._internalSettings.entityToken === '') throw 'Must have Settings._internalSettings.entityToken set to call this method'
    const result = await MakeRequest<GetGlobalPolicyResponse>('/Profile/GetGlobalPolicy', request, 'X-EntityToken', Settings._internalSettings.entityToken)
    return result
}

/**
 * Retrieves the entity's profile.
 * https://docs.microsoft.com/rest/api/playfab/profiles/account-management/getprofile
 */
export const GetProfile = async (request: GetEntityProfileRequest) => {
    if (Settings._internalSettings.entityToken === '') throw 'Must have Settings._internalSettings.entityToken set to call this method'
    const result = await MakeRequest<GetEntityProfileResponse>('/Profile/GetProfile', request, 'X-EntityToken', Settings._internalSettings.entityToken)
    return result
}

/**
 * Retrieves the entity's profile.
 * https://docs.microsoft.com/rest/api/playfab/profiles/account-management/getprofiles
 */
export const GetProfiles = async (request: GetEntityProfileRequest) => {
    if (Settings._internalSettings.entityToken === '') throw 'Must have Settings._internalSettings.entityToken set to call this method'
    const result = await MakeRequest<GetEntityProfileResponse>('/Profile/GetProfiles', request, 'X-EntityToken', Settings._internalSettings.entityToken)
    return result
}

/**
 * Retrieves the title player accounts associated with the given master player account.
 * https://docs.microsoft.com/rest/api/playfab/profiles/account-management/gettitleplayersfrommasterplayeraccountids
 */
export const GetTitlePlayersFromMasterPlayerAccountIds = async (request: GetTitlePlayersFromMasterPlayerAccountIdsRequest) => {
    if (Settings._internalSettings.entityToken === '') throw 'Must have Settings._internalSettings.entityToken set to call this method'
    const result = await MakeRequest<GetTitlePlayersFromMasterPlayerAccountIdsResponse>('/Profile/GetTitlePlayersFromMasterPlayerAccountIds', request, 'X-EntityToken', Settings._internalSettings.entityToken)
    return result
}

/**
 * Sets the global title access policy
 * https://docs.microsoft.com/rest/api/playfab/profiles/account-management/setglobalpolicy
 */
export const SetGlobalPolicy = async (request: SetGlobalPolicyRequest) => {
    if (Settings._internalSettings.entityToken === '') throw 'Must have Settings._internalSettings.entityToken set to call this method'
    const result = await MakeRequest<SetGlobalPolicyResponse>('/Profile/SetGlobalPolicy', request, 'X-EntityToken', Settings._internalSettings.entityToken)
    return result
}

/**
 * Updates the entity's language. The precedence hierarchy for communication to the player is Title Player Account
 * language, Master Player Account language, and then title default language if the first two aren't set or supported.
 * https://docs.microsoft.com/rest/api/playfab/profiles/account-management/setprofilelanguage
 */
export const SetProfileLanguage = async (request: SetProfileLanguageRequest) => {
    if (Settings._internalSettings.entityToken === '') throw 'Must have Settings._internalSettings.entityToken set to call this method'
    const result = await MakeRequest<SetProfileLanguageResponse>('/Profile/SetProfileLanguage', request, 'X-EntityToken', Settings._internalSettings.entityToken)
    return result
}

/**
 * Sets the profiles access policy
 * https://docs.microsoft.com/rest/api/playfab/profiles/account-management/setprofilepolicy
 */
export const SetProfilePolicy = async (request: SetEntityProfilePolicyRequest) => {
    if (Settings._internalSettings.entityToken === '') throw 'Must have Settings._internalSettings.entityToken set to call this method'
    const result = await MakeRequest<SetEntityProfilePolicyResponse>('/Profile/SetProfilePolicy', request, 'X-EntityToken', Settings._internalSettings.entityToken)
    return result
}