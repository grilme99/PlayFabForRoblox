# Example Project

I've provided a full production-ready implementation of PlayFab's matchmaking here. Anybody is welcome to adapt it to
their needs or contribute back up. The project comes with:

- A client-side UI for joining the queue and getting queue data.
- A proven production-ready implementation of PlayFab's matchmaking on the server.
- Infrastructure for teleporting many players from multiple servers into one match.

# Building

> **HEADS UP!** Building this example is a bit of a process!
> You'll need a PlayFab project and matchmaking queue setup before getting started. Refer to the PlayFab docs, they're
> very good!
> 
> Alternatively, check out a prebuilt version [here](https://roblox.com).

Before anything, you'll want [Foreman](https://github.com/Roblox/foreman) or [Aftman](https://github.com/LPGhatguy/aftman) (ideally Aftman) installed to manage dependencies. If you're crazy, you can also just install `Rojo` and `Wally` manually. The PlayFab SDK requires Wally!

After installing dependencies, run `wally install` *or*, if you want to fix type re-exports with Wally, `scripts/install_packages.sh`. Running the shell script will require you to have [`wally-package-types`](https://github.com/JohnnyMorganz/wally-package-types) installed. Just use Wally or Foreman to manage this for you!

Next, rename `src/server/TitleId.example.lua` to `TitleId.lua` and replace `TITLE_ID_HERE` with your actual PlayFab title ID.

FINALLY, run `rojo build --output example.rbxl`