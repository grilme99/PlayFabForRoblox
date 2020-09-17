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