local admin = require(script.AdminApi)
local auth = require(script.AuthenticationApi)
local client = require(script.ClientApi)
local data = require(script.DataApi)
local events = require(script.EventsApi)
local experimentation = require(script.ExperimentationApi)
local groups = require(script.GroupsApi)
local multiplayer = require(script.MultiplayerApi)
local profiles = require(script.ProfilesApi)
local server = require(script.ServerApi)
local settings = require(script.Settings)

return {
    AdminApi = admin,
    AuthenticationApi = auth,
    ClientApi = client,
    DataApi = data,
    EventsApi = events,
    ExperimentationApi = experimentation,
    GroupsApi = groups,
    MultiplayerApi = multiplayer,
    ProfilesApi = profiles,
    ServerApi = server,
    Settings = settings
}