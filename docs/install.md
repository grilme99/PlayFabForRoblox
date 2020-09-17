The preferred way to use this SDK is via [roblox-ts](https://roblox-ts.com) and [Rojo](https://rojo.space). However, it still has first-class support for Lua, should you be using it. For those using Typescript, the *entire* PlayFab API is fully typed and documented, supporting powerful IntelliSense in your favourite editor.

People not using Rojo can download the latest model file form the [releases section](https://github.com/grilme99/RobloxPlayFabSDK/releases), but this might not always be the most up-to-date version.

---

## Installation
Here are installation instructions for both Typescript and Lua. You will find that each section which involves code will have this.
    

<details>
    <summary>Typescript</summary>
    <p>
    Usage with Typescript is straightforward. All you need to do is install the package via NPM with <code>npm install @rbxts/playfab</code>. The SDK can then be used from anywhere in your game (if it is on the server)! Please continue down for Basic Usage.
    </p>
</details>

<details>
    <summary>Lua</summary>
    <p>
    <b>Manual</b>
    <br>
    You can download the latest model file release from the <a href="https://github.com/grilme99/RobloxPlayFabSDK/releases">releases section</a>, but this may not always be the most up-to-date version. You'll want to put this is a server directory, like <code>ServerScriptService</code> or <code>ServerStorage</code>.
    <br><br>
    <b>Advanced</b>
    <br>
    The SDK has no dependencies so you can easily include it as a Git submodule, syncing it in with Rojo. There should be no need to edit the actual SDK module itself (unless contributing).
    </p>
</details>

---

## Basic usage
#### TypeScript
```typescript
import { Players } from '@rbxts/services'
import { Settings, PlayFabClient } from '@rbxts/playfab'

Settings.devSecretKey = ''
Settings.titleId = '' // Put the title ID that you copied from the above section here

Players.PlayerAdded.Connect(async player => {
    // Log client in
    // This must be async and no "client-side" methods can be used until this has returned.
    PlayFabClient.LoginWithCustomID({
        CreateAccount: true,
        CustomId: tostring(player.UserId) // You can use your own CustomId scheme
    }).then(async loginResult => {
        const token = loginResult.EntityToken!.EntityToken!
        const ticket = loginResult.SessionTicket!

        // You are ready to go!
        const profile = await PlayFabClient.GetPlayerProfile(ticket)
        print(profile)
    })
})
```

#### Lua
```lua
local PlayFab = require(path.to.PlayFab)
local Settings = PlayFab.Settings
local Client = PlayFab.PlayFabClient

Settings.devSecretKey = ''
Settings.titleId = '' -- Put the title ID that you copied from the above section here

game.Players.PlayerAdded:Connect(function(player)
    -- Log client in
    -- This must be async and no "client-side" methods can be used until this has returned.
    Client.LoginWithCustomID({
        CreateAccount = true, -- Create an account if one doesn't already exist
        CustomId = tostring(player.UserId) -- You can use your own CustomId scheme
    }):andThen(function(loginResult)
        local entityToken = loginResult.EntityToken.EntityToken
        local sessionTicket = loginResult.SessionTicket

        -- You are ready to go!
        Client.GetPlayerProfile(sessionTicket):andThen(function(profile)
            print(profile)
        end):catch(function(err)
            print(err)
        end)
    end)
end)
```

---
## Notes and Best Practices

- Make sure you have `HttpEnabled` toggled on in `HttpService`! This SDK relies on HTTP requests.
- This SDK should **not** be used from the client. "Client-side" APIs should still run on the server but should have the clients `SessionTicket` or `EntityToken` passed to them.
- A `SessionTicket` and `EntityToken` can expire after a period of time. You should design your system with this in mind and be able to log the client back in, should one expire.
- You should store each players `SessionTicket` and `EntityToken` in a centralized store, like [Rodux](https://roblox.github.io/rodux), so that they can be accessed by any script that needs them.