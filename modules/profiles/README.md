# PlayFab Profiles API

All PlayFab entities have profiles, which hold top-level properties about the entity. These APIs give you the tools needed to manage entity profiles. The Master Player APIs allow you to perform operations on a master player account.

All PlayFab APIs are separated into their own Wally and NPM packages to help prevent redundant code.
PlayFab APIs are **big**, and only importing the APIs you actually need will help save thousands of lines of code.

Wally is the easiest way to manage the PlayFab SDK, and is currently the only supported distribution method.
To use this package, add the following to your `wally.toml` file:

```toml
PlayFabProfilesApi = "grilme99/playfab-profiles@1.221007.3"
```

More information and documentation is available at:
https://github.com/grilme99/RobloxPlayFabSDK
