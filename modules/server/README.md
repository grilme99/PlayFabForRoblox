# PlayFab Server API

Provides functionality to allow external (developer-controlled) servers to interact with user inventories and data in a trusted manner, and to handle matchmaking and client connection orchestration.

All PlayFab APIs are separated into their own Wally and NPM packages to help prevent redundant code.
PlayFab APIs are **big**, and only importing the APIs you actually need will help save thousands of lines of code.

Wally is the easiest way to manage the PlayFab SDK, and is currently the only supported distribution method.
To use this package, add the following to your `wally.toml` file:

```toml
PlayFabServerApi = "grilme99/playfab-server@1.220926.0"
```

More information and documentation is available at:
https://github.com/grilme99/RobloxPlayFabSDK
