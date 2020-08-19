<h1 align="center"><b>PlayFab SDK</b></h1>
<h3 align="center"> A PlayFab SDK for Roblox written in TypeScript.</h3>
<p align="center">
    <a href="https://github.com/grilme99/RobloxPlayFabSDK" target="_">GitHub</a>
    -
    <a href="https://www.npmjs.com/package/@rbxts/playfab" target="_">NPM</a>
<p>
<hr>
<br>

# Introduction
This is a module for interfacing with all PlayFab APIs and services that are relevant and/or usable on Roblox. It has been written with *TypeScript* (using <a href="http://roblox-ts.com/">Roblox-TS</a>). While it is possible to use the produced Lua code with a bit of modification, this project is specifically designed for Roblox-TS users because of the benefits TypeScript brings.

The entire PlayFab API is typed (using typings from the official Node SDK) and all methods have a basic explanation with links to the relevant API references on the PlayFab docs.

# Usage
This SDK follows an identical pattern to all other PlayFab SDKs which means that once you have a basic understanding of this SDKs usage you can easily follow all official PlayFab documentation like any other PlayFab SDK.

Before anything, you need to set the TitleId and Secret in the settings. If you are unsure of where to find your TitleId then please refer to [this](https://docs.microsoft.com/en-us/gaming/playfab/personas/developer) tutorial or [this](https://docs.microsoft.com/en-us/gaming/playfab/gamemanager/secret-key-management) one for the Secret.

```typescript
import { Settings } from '@rbxts/playfab'

Settings.settings.titleId = 'TITLE_ID'
Settings.settings.secretKey = 'SECRET_KEY'
```

Once you have set those you are free to use all methods! One important thing to note is that many PlayFab APIs are designed to run *on the client*. Obviously on Roblox this is not possible because HttpService is only accessible on the server. 

I got around this issue by making all methods that are designed to run on the client take a `player` argument. Before using any of these methods, you must log the client in using `ClientApi.LoginWithCustomID`.

```typescript
import { Players } from '@rbxts/services'
import { Settings, ClientApi } from '@rbxts/playfab'

Settings.settings.titleId = 'TITLE_ID'
Settings.settings.secretKey = 'SECRET_KEY'

Players.PlayerAdded.Connect(async player => {
    // Log client in
    // This must be async and no "client-side" methods can be used until this has returned.
    await ClientApi.LoginWithCustomID(player, {
        CreateAccount: true, // Create an account if one doesn't already exist
        CustomId: tostring(player.UserId) // You can use your own CustomId scheme
    })

    // You are ready to go!
    const profile = await ClientApi.GetPlayerProfile(player, {})
    
    if (profile.PlayerProfile) {
        print(profile.PlayerProfile.PlayerId)
    }
})
```