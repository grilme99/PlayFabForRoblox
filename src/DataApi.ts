/// <reference path="DataApi.d.ts" />

import MakeRequest from './HTTP'
import Settings from './Settings'

/**
 * Retrieves objects from an entity's profile.
 * https://docs.microsoft.com/rest/api/playfab/data/object/getobjects
 */
export const GetObjects = async (request: GetObjectsRequest) => {
    if (Settings.settings.entityToken === '') throw 'Must have Settings.settings.entityToken set to call this method'
    const result = await MakeRequest<GetObjectsResponse>('/Object/GetObjects', request, 'X-EntityToken', Settings.settings.entityToken)
        .catch((e: string) => { throw e })
    return result
}

/**
 * Sets objects on an entity's profile.
 * https://docs.microsoft.com/rest/api/playfab/data/object/setobjects
 */
export const SetObjects = async (request: SetObjectsRequest) => {
    if (Settings.settings.entityToken === '') throw 'Must have Settings.settings.entityToken set to call this method'
    const result = await MakeRequest<SetObjectsResponse>('/Object/SetObjects', request, 'X-EntityToken', Settings.settings.entityToken)
        .catch((e: string) => { throw e })
    return result
}