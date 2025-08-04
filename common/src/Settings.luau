type Map<K, V> = { [K]: V }

export type Settings = {
    --[[
        You must set this value for PlayFab to work properly (Found in the
        Game Manager for your title, at the PlayFab website).

        This can either be a `string` or a `Secret`. The latter is returned by
        [`HttpService:GetSecret()`](https://create.roblox.com/docs/reference/engine/classes/HttpService#GetSecret).
        Secrets cannot be replicated to clients, printed to the console, or
        accessed from inside Studio.
    ]]
    titleId: string | Secret,
    --[[
        For security reasons you must never expose this value to the client or
        players - You must set this value for Server-APIs to work properly
        (Found in the Game Manager for your title, at the PlayFab website).

        This can either be a `string` or a `Secret`. The latter is returned by
        [`HttpService:GetSecret()`](https://create.roblox.com/docs/reference/engine/classes/HttpService#GetSecret).
        Secrets cannot be replicated to clients, printed to the console, or
        accessed from inside Studio.
    ]]
    secretKey: string | Secret,

    --[[
		The name of a customer vertical. This is only for customers running a
		private cluster. Generally you shouldn't touch this.
	]]
    verticalName: string?,

    --[[
		The production URL of the PlayFab API. This is only for customers
		running a private cluster. Generally you shouldn't touch this.
	]]
    productionUrl: string?,

    -- Mostly internal settings
    requestGetParams: Map<string, string>?,
}

local Settings: Settings = {
    titleId = "",
    secretKey = "",

    productionUrl = ".playfabapi.com",
    verticalName = nil,

    requestGetParams = {
        -- TODO: Get the actual SDK version
        sdk = "LuauSdk-unknown",
    },
}

return Settings
