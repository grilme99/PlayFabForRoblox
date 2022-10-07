# PlayFab Authentication API

The Authentication APIs provide a convenient way to convert classic authentication responses into entity authentication models. These APIs will provide you with the entity authentication token needed for subsequent Entity API calls. Manage API keys for authenticating any entity. The game_server API is designed to create uniquely identifiable game_server entities. The game_server Entity token can be used to call Matchmaking Lobby and Pubsub for server scenarios.

All PlayFab APIs are separated into their own Wally and NPM packages to help prevent redundant code.
PlayFab APIs are **big**, and only importing the APIs you actually need will help save thousands of lines of code.

Wally is the easiest way to manage the PlayFab SDK, and is currently the only supported distribution method.
To use this package, add the following to your `wally.toml` file:

```toml
PlayFabAuthenticationApi = "grilme99/playfab-authentication@1.220926.4"
```

More information and documentation is available at:
https://github.com/grilme99/RobloxPlayFabSDK
