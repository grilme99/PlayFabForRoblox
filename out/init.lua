-- Compiled with https://roblox-ts.github.io v0.3.2
-- August 19, 2020, 7:42 PM British Summer Time

local TS = _G[script];
local exports = {};
local admin = TS.import(script, script, "AdminApi");
local auth = TS.import(script, script, "AuthenticationApi");
local client = TS.import(script, script, "ClientApi");
local data = TS.import(script, script, "DataApi");
local events = TS.import(script, script, "EventsApi");
local experimentation = TS.import(script, script, "ExperimentationApi");
local groups = TS.import(script, script, "GroupsApi");
local multiplayer = TS.import(script, script, "MultiplayerApi");
local profiles = TS.import(script, script, "ProfilesApi");
local server = TS.import(script, script, "ServerApi");
local settings = TS.import(script, script, "Settings").default;
local AdminApi = admin;
local AuthenticationApi = auth;
local ClientApi = client;
local DataApi = data;
local EventsApi = events;
local ExperimentationApi = experimentation;
local GroupsApi = groups;
local MultiplayerApi = multiplayer;
local ProfilesApi = profiles;
local ServerApi = server;
exports.Settings = settings;
exports.AdminApi = AdminApi;
exports.AuthenticationApi = AuthenticationApi;
exports.ClientApi = ClientApi;
exports.DataApi = DataApi;
exports.EventsApi = EventsApi;
exports.ExperimentationApi = ExperimentationApi;
exports.GroupsApi = GroupsApi;
exports.MultiplayerApi = MultiplayerApi;
exports.ProfilesApi = ProfilesApi;
exports.ServerApi = ServerApi;
return exports;
