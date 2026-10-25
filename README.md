# Yen

Hub, key system and loader for Yen scripts. Everything the loader needs lives in this repository, nothing is fetched from other people's repositories at runtime.

## Use

```lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/YOUR_USER/YOUR_REPO/main/Loader.lua"))()
```

Checks that the game is supported, asks for a key, then loads the script for that game.

Hub only, no key and no game check:

```lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/YOUR_USER/YOUR_REPO/main/Hub.lua"))()
```

The interface (Obsidian or Farcal) is switched in Settings > Interface and remembered between runs.

## Publish

1. Create an empty public GitHub repository.
2. Run `Tools/SetRepo.ps1 -User <your github name> -Repo <repository name>` once. It writes your raw url into the entry files and prints the loadstring.
3. Upload every file in this folder to the repository (GitHub > Add file > Upload files, or `git push`). Keep the folder layout.

## Files

| File | Job |
| --- | --- |
| `Loader.lua` | Main entry: game check, key, then the game script |
| `Hub.lua` | The hub, drawn by Obsidian or Farcal |
| `KeySystem.lua` | Key window (`Run`) and popups (`Notice`) |
| `KeyConfig.lua` | Name, links and how keys are checked |
| `Games.lua` | Supported games and the script each one loads |
| `Theme.lua` | Colors shared by every interface |
| `Import.lua` | Fetches files from this repository |
| `Libraries/`, `Assets/` | UI libraries, font and logo, see `THIRD_PARTY.md` |

## Add a game

Add an entry to `Games.lua` with the PlaceId (or GameId) and the script to load, then upload the script next to it.

## Keys

`Provider = "Static"` compares against `Keys` in `KeyConfig.lua`. Anything in a public repository can be read by anyone, so this only works as a speed bump.

For real protection set `Provider = "Http"` and point `Http.Url` at your own server. It receives `{Key}` and `{Hwid}` and must answer `true` or `{"valid":true}`. A valid key is remembered in `YenHub/key.txt` and checked again on every run.

## Develop locally

Copy this folder into your executor workspace (for example `YenHub/dev/`), then:

```lua
getgenv().YenLocalRoot = "YenHub/dev/"
loadstring(readfile("YenHub/dev/Loader.lua"))()
```

Files are read from the workspace instead of GitHub.
