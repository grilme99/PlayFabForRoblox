/// <reference path="DataApi.d.ts" />

import MakeRequest from './HTTP'
import Settings from './Settings'

/**
 * Retrieves objects from an entity's profile.
 * https://docs.microsoft.com/rest/api/playfab/data/object/getobjects
 */
export const GetObjects = async (request: GetObjectsRequest) => {
    if (Settings._internalSettings.entityToken === '') throw 'Must have Settings._internalSettings.entityToken set to call this method'
    const result = await MakeRequest<GetObjectsResponse>('/Object/GetObjects', request, 'X-EntityToken', Settings._internalSettings.entityToken)
    return result
}

/**
 * Sets objects on an entity's profile.
 * https://docs.microsoft.com/rest/api/playfab/data/object/setobjects
 */
export const SetObjects = async (request: SetObjectsRequest) => {
    if (Settings._internalSettings.entityToken === '') throw 'Must have Settings._internalSettings.entityToken set to call this method'
    const result = await MakeRequest<SetObjectsResponse>('/Object/SetObjects', request, 'X-EntityToken', Settings._internalSettings.entityToken)
    return result
}