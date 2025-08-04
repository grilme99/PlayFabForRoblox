local Settings = require(script.Settings)
local Types = require(script.Types)
local makeApiCall = require(script.Utility.makeApiCall)

export type Result<T, E> = Types.Result<T, E>

local PlayFabCommon = {}

PlayFabCommon.settings = Settings
PlayFabCommon.makeApiCall = makeApiCall

return table.freeze(PlayFabCommon)
