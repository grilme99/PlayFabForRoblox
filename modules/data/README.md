# PlayFab Data API

Store arbitrary data associated with an entity. Objects are small (~1KB) JSON-compatible objects which are stored directly on the entity profile. Objects are made available for use in other PlayFab contexts, such as PlayStream events and CloudScript functions. Files can efficiently store data of any size or format. Both objects and files support a flexible permissions system to control read and write access by other entities.

All PlayFab APIs are separated into their own Wally and NPM packages to help prevent redundant code.
PlayFab APIs are **big**, and only importing the APIs you actually need will help save thousands of lines of code.

Wally is the easiest way to manage the PlayFab SDK, and is currently the only supported distribution method.
To use this package, add the following to your `wally.toml` file:

```toml
PlayFabDataApi = "grilme99/playfab-data@1.220926.5"
```

More information and documentation is available at:
https://github.com/grilme99/RobloxPlayFabSDK
