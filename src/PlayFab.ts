/**
 * Main interface to the PlayFab API wrapper
 */

interface IPlayFabPlayerData {
    SessionTicket: string
    EntityToken: string
    TokenExpiration: string
    PlayFabId: string
}

export const PlayerData = new Map<Player, IPlayFabPlayerData>()

/**
 * Returns if the player is logged in with PlayFab.
 * @param player Player instance to check
 */
export const IsClientLoggedIn = (player: Player) => {
    const data = PlayerData.get(player)
    if (!data) return false

    return data.SessionTicket !== undefined && data.SessionTicket.size() > 0 && data.EntityToken !== ''
}