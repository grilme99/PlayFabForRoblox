local Settings = require(script.Settings)
local makeApiCall = require(script.Utility.makeApiCall)

local PlayFabCommon = {}

PlayFabCommon.settings = Settings
PlayFabCommon.makeApiCall = makeApiCall

return table.freeze(PlayFabCommon)
