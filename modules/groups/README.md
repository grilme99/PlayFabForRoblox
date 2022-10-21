# PlayFab Groups API

The Groups API is designed for any permanent or semi-permanent collections of Entities (players, or non-players). If you want to make Guilds/Clans/Corporations/etc., then you should use groups. Groups can also be used to make chatrooms, parties, or any other persistent collection of entities.

All PlayFab APIs are separated into their own Wally and NPM packages to help prevent redundant code.
PlayFab APIs are **big**, and only importing the APIs you actually need will help save thousands of lines of code.

Wally is the easiest way to manage the PlayFab SDK, and is currently the only supported distribution method.
To use this package, add the following to your `wally.toml` file:

```toml
PlayFabGroupsApi = "grilme99/playfab-groups@1.221010.1"
```

More information and documentation is available at:
https://github.com/grilme99/RobloxPlayFabSDK
