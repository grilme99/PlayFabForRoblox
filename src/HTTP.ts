/// <reference path="PlayFab.d.ts" />

/**
 * Handles sending HTTP requests to PlayFab
 */

import { HttpService } from '@rbxts/services'
import settings from './Settings'

// Types
type TAuthKeys = 'X-EntityToken' | 'X-Authorization' | 'X-SecretKey'

/**
 * Constructs full URL string (from an endpoint path) for use in HTTP requests.
 * 
 * @param urlPath Endpoint path
 */
export const GetFullUrl = (urlPath: string) => {
    let fullUrl = `https://${settings.settings.titleId}${settings._internalSettings.productionUrl}${urlPath}`

    const getParams = settings._internalSettings.requestGetParams
    let firstParam = true
    Object.keys(getParams).forEach(key => {
        const value = getParams[key]
        if (firstParam) {
            fullUrl += '?'
            firstParam = false
        } else fullUrl += '&'

        fullUrl += key + '=' + value
    })

    return fullUrl
}

/**
 * Makes HTTP request to PlayFab.
 * 
 * @param path Endpoint path
 * @param requestBody Body of the request
 * @param authKey The type of authentication
 * @param authValue Authentication value for the specified type
 */
const MakePlayFabApiCall = async<T>(path: string, requestBody: object, authKey?: TAuthKeys, authValue?: string) => {
    const fullUrl = GetFullUrl(path)
    const encodedBody = HttpService.JSONEncode(requestBody)

    // Build request headers
    const headers = new Map<string, string>()
    headers.set('X-ReportErrorAsSuccess', 'true')
    headers.set('X-PlayFabSDK', settings._internalSettings.sdkVersionString)
    headers.set('Content-Type', 'application/json')
    if (authKey && authValue) headers.set(authKey, authValue)

    let [success, response] = pcall(() => {
        return HttpService.RequestAsync({
            Url: fullUrl,
            Method: 'POST', // PlayFab only uses POST, for some reason, don't ask me
            Headers: headers as unknown as HttpHeaders, // types are annoying sometimes
            Body: encodedBody
        })
    })

    if (success) {
        response = response  as RequestAsyncResponse

        if (response.Success) {
            const responseBody = HttpService.JSONDecode(response.Body) as PlayFabModule.IPlayFabResultCommon
            
            if (responseBody && responseBody.code === 200 && responseBody.data) {
                return responseBody.data as T
            } else {
                throw response.StatusMessage
            }
        } else {
            throw response.StatusMessage
        }
    } else {
        throw tostring(response)
    }
}

export default MakePlayFabApiCall