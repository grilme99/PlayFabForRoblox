# PlayFab Admin API

APIs for managing title configurations, uploaded Game Server code executables, and user data.

All PlayFab APIs are separated into their own Wally and NPM packages to help prevent redundant code.
PlayFab APIs are **big**, and only importing the APIs you actually need will help save thousands of lines of code.

Wally is the easiest way to manage the PlayFab SDK, and is currently the only supported distribution method.
To use this package, add the following to your `wally.toml` file:

```toml
PlayFabAdminApi = "grilme99/playfab-admin@1.220926.0"
```

More information and documentation is available at:
https://github.com/grilme99/RobloxPlayFabSDK
