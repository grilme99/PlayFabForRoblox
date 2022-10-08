# PlayFab SDK Generator

The Roblox PlayFab SDK comes with its own custom generator, and is where most contributions to the library should be made. The generator is implemented as a Rust CLI and does codegen from PlayFab's Swagger spec.

We're not using PlayFab's [official generator](https://github.com/PlayFab/SDKGenerator) because it's clearly got a lot of tech debt and is difficult for Roblox users to contribute back up to. I don't work at PlayFab, so can't get my PlayFab SDK officially supported in their generator repo. Making my own generator is just much much easier.
