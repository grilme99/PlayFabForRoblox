/// <reference path="AuthenticationApiTypes.d.ts" />

import MakeRequest from './HTTP'
import Settings from './Settings'
import { PlayerData } from './PlayFab'

export const GetEntityToken = async (request: GetEntityTokenRequest, player?: Player) => {
    let authKey
    let authValue
    if (player) {
        const data = PlayerData.get(player)
        if (data!.SessionTicket) {
            authKey = 'X-Authorization'
            authValue = data!.SessionTicket
        } else if (data!.EntityToken) {
            authKey = 'X-EntityToken'
            authValue = data!.EntityToken
        }
    } else if (Settings.settings.secretKey) {
        authKey = 'X-SecretKey'
        authValue = Settings.settings.secretKey
    }

    const result = await MakeRequest<GetEntityTokenResponse>('/Authentication/GetEntityToken', request, authKey as 'X-EntityToken', authValue)
    return result
}