PlayFab is a complete backend platform for live games with managed game services, 
real-time analytics, and LiveOps. This SDK provides complete access to the entire 
PlayFab API on Roblox. 

Each API scope (client, server, admin, matchmaking, etc) is split into its own 
Wally package to help reduce the overall bundle size (see reference below). 
PlayFab APIs are **big**, so only import the packages you actually need. 

----- 

# API Reference 

Documentation for all PlayFab APIs are available on the Microsoft website (linked 
for each package below). 

| API | Wally Package | Description |
| --- | ------------- | ----------- |
| [Admin](https://learn.microsoft.com/en-gb/rest/api/playfab/admin) | `grilme99/playfab-admin@1.220926.0` | APIs for managing title configurations, uploaded Game Server code executables, and user data |
| [Data](https://learn.microsoft.com/en-gb/rest/api/playfab/data) | `grilme99/playfab-data@1.220926.0` | Store arbitrary data associated with an entity. Objects are small (~1KB) JSON-compatible objects which are stored directly on the entity profile. Objects are made available for use in other PlayFab contexts, such as PlayStream events and CloudScript functions. Files can efficiently store data of any size or format. Both objects and files support a flexible permissions system to control read and write access by other entities. |
| [Multiplayer](https://learn.microsoft.com/en-gb/rest/api/playfab/multiplayer) | `grilme99/playfab-multiplayer@1.220926.0` | API methods for managing multiplayer servers. API methods for managing parties. The lobby service helps players group together to play multiplayer games. It is often used as a rendezvous point for players to share connection information. |
| [Matchmaker](https://learn.microsoft.com/en-gb/rest/api/playfab/matchmaker) | `grilme99/playfab-matchmaker@1.220926.0` | Enables the use of an external match-making service in conjunction with PlayFab hosted Game Server instances |
| [Insights](https://learn.microsoft.com/en-gb/rest/api/playfab/insights) | `grilme99/playfab-insights@1.220926.0` | Manage the Insights performance level and data storage retention settings. |
| [Server](https://learn.microsoft.com/en-gb/rest/api/playfab/server) | `grilme99/playfab-server@1.220926.0` | Provides functionality to allow external (developer-controlled) servers to interact with user inventories and data in a trusted manner, and to handle matchmaking and client connection orchestration |
| [Events](https://learn.microsoft.com/en-gb/rest/api/playfab/events) | `grilme99/playfab-events@1.220926.0` | Write custom PlayStream and Telemetry events for any PlayFab entity. Telemetry events can be used for analytic, reporting, or debugging. PlayStream events can do all of that and also trigger custom actions in near real-time. |
| [CloudScript](https://learn.microsoft.com/en-gb/rest/api/playfab/cloudscript) | `grilme99/playfab-cloud-script@1.220926.0` | API methods for executing CloudScript using an Entity Profile |
| [Groups](https://learn.microsoft.com/en-gb/rest/api/playfab/groups) | `grilme99/playfab-groups@1.220926.0` | The Groups API is designed for any permanent or semi-permanent collections of Entities (players, or non-players). If you want to make Guilds/Clans/Corporations/etc., then you should use groups. Groups can also be used to make chatrooms, parties, or any other persistent collection of entities. |
| [Experimentation](https://learn.microsoft.com/en-gb/rest/api/playfab/experimentation) | `grilme99/playfab-experimentation@1.220926.0` | APIs for managing experiments. |
| [Profiles](https://learn.microsoft.com/en-gb/rest/api/playfab/profiles) | `grilme99/playfab-profiles@1.220926.0` | All PlayFab entities have profiles, which hold top-level properties about the entity. These APIs give you the tools needed to manage entity profiles. The Master Player APIs allow you to perform operations on a master player account |
| [Economy](https://learn.microsoft.com/en-gb/rest/api/playfab/economy) | `grilme99/playfab-economy@1.220926.0` | API methods for managing the catalog. Inventory manages in-game assets for any given entity. |
| [Leaderboards](https://learn.microsoft.com/en-gb/rest/api/playfab/leaderboards) | `grilme99/playfab-leaderboards@1.220926.0` | Manage entity statistics Manage entity statistics |
| [Localization](https://learn.microsoft.com/en-gb/rest/api/playfab/localization) | `grilme99/playfab-localization@1.220926.0` | The Localization APIs give you the tools needed to manage language setup in your title. |
| [Authentication](https://learn.microsoft.com/en-gb/rest/api/playfab/authentication) | `grilme99/playfab-authentication@1.220926.0` | The Authentication APIs provide a convenient way to convert classic authentication responses into entity authentication models. These APIs will provide you with the entity authentication token needed for subsequent Entity API calls. Manage API keys for authenticating any entity. The game_server API is designed to create uniquely identifiable game_server entities. The game_server Entity token can be used to call Matchmaking Lobby and Pubsub for server scenarios. |
| [Client](https://learn.microsoft.com/en-gb/rest/api/playfab/client) | `grilme99/playfab-client@1.220926.0` | APIs which provide the full range of PlayFab features available to the client - authentication, account and data management, inventory, friends, matchmaking, reporting, and platform-specific functionality |

