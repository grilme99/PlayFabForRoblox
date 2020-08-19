/// <reference path="MultiplayerApi.d.ts" />

import MakeRequest from './HTTP'
import Settings from './Settings'

/**
 * Cancel all active tickets the player is a member of in a given queue.
 * https://docs.microsoft.com/rest/api/playfab/multiplayer/matchmaking/cancelallmatchmakingticketsforplayer
 */
export const CancelAllMatchmakingTicketsForPlayer = async (request: CancelAllMatchmakingTicketsForPlayerRequest) => {
    if (Settings.settings.entityToken === '') throw 'Must have Settings.settings.entityToken set to call this method'
    const result = await MakeRequest<CancelAllMatchmakingTicketsForPlayerResult>('/Match/CancelAllMatchmakingTicketsForPlayer', request, 'X-EntityToken', Settings.settings.entityToken)
    return result
}

/**
 * Cancel all active backfill tickets the player is a member of in a given queue.
 * https://docs.microsoft.com/rest/api/playfab/multiplayer/matchmaking/cancelallserverbackfillticketsforplayer
 */
export const CancelAllServerBackfillTicketsForPlayer = async (request: CancelAllServerBackfillTicketsForPlayerRequest) => {
    if (Settings.settings.entityToken === '') throw 'Must have Settings.settings.entityToken set to call this method'
    const result = await MakeRequest<CancelAllServerBackfillTicketsForPlayerResult>('/Match/CancelAllServerBackfillTicketsForPlayer', request, 'X-EntityToken', Settings.settings.entityToken)
    return result
}

/**
 * Cancel a matchmaking ticket.
 * https://docs.microsoft.com/rest/api/playfab/multiplayer/matchmaking/cancelmatchmakingticket
 */
export const CancelMatchmakingTicket = async (request: CancelMatchmakingTicketRequest) => {
    if (Settings.settings.entityToken === '') throw 'Must have Settings.settings.entityToken set to call this method'
    const result = await MakeRequest<CancelMatchmakingTicketResult>('/Match/CancelMatchmakingTicket', request, 'X-EntityToken', Settings.settings.entityToken)
    return result
}

/**
 * Cancel a server backfill ticket.
 * https://docs.microsoft.com/rest/api/playfab/multiplayer/matchmaking/cancelserverbackfillticket
 */
export const CancelServerBackfillTicket = async (request: CancelServerBackfillTicketRequest) => {
    if (Settings.settings.entityToken === '') throw 'Must have Settings.settings.entityToken set to call this method'
    const result = await MakeRequest<CancelServerBackfillTicketResult>('/Match/CancelServerBackfillTicket', request, 'X-EntityToken', Settings.settings.entityToken)
    return result
}

/**
 * Create a matchmaking ticket as a client.
 * https://docs.microsoft.com/rest/api/playfab/multiplayer/matchmaking/creatematchmakingticket
 */
export const CreateMatchmakingTicket = async (request: CreateMatchmakingTicketRequest) => {
    if (Settings.settings.entityToken === '') throw 'Must have Settings.settings.entityToken set to call this method'
    const result = await MakeRequest<CreateMatchmakingTicketResult>('/Match/CreateMatchmakingTicket', request, 'X-EntityToken', Settings.settings.entityToken)
    return result
}

/**
 * Create a backfill matchmaking ticket as a server. A backfill ticket represents an ongoing game. The matchmaking service
 * automatically starts matching the backfill ticket against other matchmaking tickets. Backfill tickets cannot match with
 * other backfill tickets.
 * https://docs.microsoft.com/rest/api/playfab/multiplayer/matchmaking/createserverbackfillticket
 */
export const CreateServerBackfillTicket = async (request: CreateServerBackfillTicketRequest) => {
    if (Settings.settings.entityToken === '') throw 'Must have Settings.settings.entityToken set to call this method'
    const result = await MakeRequest<CreateServerBackfillTicketResult>('/Match/CreateServerBackfillTicket', request, 'X-EntityToken', Settings.settings.entityToken)
    return result
}

/**
 * Create a matchmaking ticket as a server. The matchmaking service automatically starts matching the ticket against other
 * matchmaking tickets.
 * https://docs.microsoft.com/rest/api/playfab/multiplayer/matchmaking/createservermatchmakingticket
 */
export const CreateServerMatchmakingTicket = async (request: CreateServerMatchmakingTicketRequest) => {
    if (Settings.settings.entityToken === '') throw 'Must have Settings.settings.entityToken set to call this method'
    const result = await MakeRequest<CreateMatchmakingTicketResult>('/Match/CreateServerMatchmakingTicket', request, 'X-EntityToken', Settings.settings.entityToken)
    return result
}

/**
 * SDK support is limited to C# and Java for this API. Get a matchmaking queue configuration.
 * https://docs.microsoft.com/rest/api/playfab/multiplayer/matchmaking-admin/getmatchmakingqueue
 */
export const GetMatchmakingQueue = async (request: GetMatchmakingQueueRequest) => {
    if (Settings.settings.entityToken === '') throw 'Must have Settings.settings.entityToken set to call this method'
    const result = await MakeRequest<GetMatchmakingQueueResult>('/Match/GetMatchmakingQueue', request, 'X-EntityToken', Settings.settings.entityToken)
    return result
}

/**
 * Get a matchmaking ticket by ticket Id.
 * https://docs.microsoft.com/rest/api/playfab/multiplayer/matchmaking/getmatchmakingticket
 */
export const GetMatchmakingTicket = async (request: GetMatchmakingTicketRequest) => {
    if (Settings.settings.entityToken === '') throw 'Must have Settings.settings.entityToken set to call this method'
    const result = await MakeRequest<GetMatchmakingTicketResult>('/Match/GetMatchmakingTicket', request, 'X-EntityToken', Settings.settings.entityToken)
    return result
}

/**
 * Get the statistics for a queue.
 * https://docs.microsoft.com/rest/api/playfab/multiplayer/matchmaking/getqueuestatistics
 */
export const GetQueueStatistics = async (request: GetQueueStatisticsRequest) => {
    if (Settings.settings.entityToken === '') throw 'Must have Settings.settings.entityToken set to call this method'
    const result = await MakeRequest<GetQueueStatisticsResult>('/Match/GetQueueStatistics', request, 'X-EntityToken', Settings.settings.entityToken)
    return result
}

/**
 * Get a matchmaking backfill ticket by ticket Id.
 * https://docs.microsoft.com/rest/api/playfab/multiplayer/matchmaking/getserverbackfillticket
 */
export const GetServerBackfillTicket = async (request: GetServerBackfillTicketRequest) => {
    if (Settings.settings.entityToken === '') throw 'Must have Settings.settings.entityToken set to call this method'
    const result = await MakeRequest<GetServerBackfillTicketResult>('/Match/GetServerBackfillTicket', request, 'X-EntityToken', Settings.settings.entityToken)
    return result
}

/**
 * Join a matchmaking ticket.
 * https://docs.microsoft.com/rest/api/playfab/multiplayer/matchmaking/joinmatchmakingticket
 */
export const JoinMatchmakingTicket = async (request: JoinMatchmakingTicketRequest) => {
    if (Settings.settings.entityToken === '') throw 'Must have Settings.settings.entityToken set to call this method'
    const result = await MakeRequest<JoinMatchmakingTicketResult>('/Match/JoinMatchmakingTicket', request, 'X-EntityToken', Settings.settings.entityToken)
    return result
}

/**
 * SDK support is limited to C# and Java for this API. List all matchmaking queue configs.
 * https://docs.microsoft.com/rest/api/playfab/multiplayer/matchmaking-admin/listmatchmakingqueues
 */
export const ListMatchmakingQueues = async (request: ListMatchmakingQueuesRequest) => {
    if (Settings.settings.entityToken === '') throw 'Must have Settings.settings.entityToken set to call this method'
    const result = await MakeRequest<ListMatchmakingQueuesResult>('/Match/ListMatchmakingQueues', request, 'X-EntityToken', Settings.settings.entityToken)
    return result
}

/**
 * List all matchmaking ticket Ids the user is a member of.
 * https://docs.microsoft.com/rest/api/playfab/multiplayer/matchmaking/listmatchmakingticketsforplayer
 */
export const ListMatchmakingTicketsForPlayer = async (request: ListMatchmakingTicketsForPlayerRequest) => {
    if (Settings.settings.entityToken === '') throw 'Must have Settings.settings.entityToken set to call this method'
    const result = await MakeRequest<ListMatchmakingTicketsForPlayerResult>('/Match/ListMatchmakingTicketsForPlayer', request, 'X-EntityToken', Settings.settings.entityToken)
    return result
}

/**
 * List all server backfill ticket Ids the user is a member of.
 * https://docs.microsoft.com/rest/api/playfab/multiplayer/matchmaking/listserverbackfillticketsforplayer
 */
export const ListServerBackfillTicketsForPlayer = async (request: ListServerBackfillTicketsForPlayerRequest) => {
    if (Settings.settings.entityToken === '') throw 'Must have Settings.settings.entityToken set to call this method'
    const result = await MakeRequest<ListServerBackfillTicketsForPlayerResult>('/Match/ListServerBackfillTicketsForPlayer', request, 'X-EntityToken', Settings.settings.entityToken)
    return result
}

/**
 * SDK support is limited to C# and Java for this API. Remove a matchmaking queue config.
 * https://docs.microsoft.com/rest/api/playfab/multiplayer/matchmaking-admin/removematchmakingqueue
 */
export const RemoveMatchmakingQueue = async (request: RemoveMatchmakingQueueRequest) => {
    if (Settings.settings.entityToken === '') throw 'Must have Settings.settings.entityToken set to call this method'
    const result = await MakeRequest<RemoveMatchmakingQueueResult>('/Match/RemoveMatchmakingQueue', request, 'X-EntityToken', Settings.settings.entityToken)
    return result
}

/**
 * SDK support is limited to C# and Java for this API. Create or update a matchmaking queue configuration.
 * https://docs.microsoft.com/rest/api/playfab/multiplayer/matchmaking-admin/setmatchmakingqueue
 */
export const SetMatchmakingQueue = async (request: SetMatchmakingQueueRequest) => {
    if (Settings.settings.entityToken === '') throw 'Must have Settings.settings.entityToken set to call this method'
    const result = await MakeRequest<SetMatchmakingQueueResult>('/Match/SetMatchmakingQueue', request, 'X-EntityToken', Settings.settings.entityToken)
    return result
}