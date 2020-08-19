/// <reference path="../src/PlayFab.d.ts" />
/// <reference types="@rbxts/types" />
/**
 * Constructs full URL string (from an endpoint path) for use in HTTP requests.
 *
 * @param urlPath Endpoint path
 */
export declare const GetFullUrl: (urlPath: string) => string;
/**
 * Makes HTTP request to PlayFab.
 *
 * @param path Endpoint path
 * @param requestBody Body of the request
 * @param authKey The type of authentication
 * @param authValue Authentication value for the specified type
 */
declare const MakePlayFabApiCall: <T>(path: string, requestBody: object, authKey?: "X-EntityToken" | "X-Authorization" | "X-SecretKey" | undefined, authValue?: string | undefined) => Promise<T>;
export default MakePlayFabApiCall;
