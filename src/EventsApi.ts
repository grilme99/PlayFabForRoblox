/// <reference path="EventsApi.d.ts" />

import MakeRequest from './HTTP'
import { PlayerData, IsClientLoggedIn } from './PlayFab'

/**
 * Write batches of entity based events to PlayStream. The namespace of the Event must be 'custom' or start with 'custom.'.
 * https://docs.microsoft.com/rest/api/playfab/events/playstream-events/writeevents
 */
export const WriteEvents = async (player: Player, request: WriteEventsRequest) => {
    const data = PlayerData.get(player)
    if ((!IsClientLoggedIn(player)) || (!data)) throw 'Must be logged in to call this method'
    const result = await MakeRequest<WriteEventsResponse>('/Event/WriteEvents', request, 'X-EntityToken', data.EntityToken)
        .catch((e: string) => { throw e })
    return result
}

/**
 * Write batches of entity based events to as Telemetry events (bypass PlayStream). The namespace must be 'custom' or start
 * with 'custom.'
 * https://docs.microsoft.com/rest/api/playfab/events/playstream-events/writetelemetryevents
 */
export const WriteTelemetryEvents = async (player: Player, request: WriteEventsRequest) => {
    const data = PlayerData.get(player)
    if ((!IsClientLoggedIn(player)) || (!data)) throw 'Must be logged in to call this method'
    const result = await MakeRequest<WriteEventsResponse>('/Event/WriteTelemetryEvents', request, 'X-EntityToken', data.EntityToken)
        .catch((e: string) => { throw e })
    return result
}