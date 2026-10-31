# Yen

Hub and key system for Yen scripts. Everything loads from this repository, which has to stay public.

## Use

Key system, game check and terms, then the script for the game:

```lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/vbbi33jkllljcvvbjkqw89fjjkjhkjzsdaih/yen-hub/main/YenKeySystem.lua"))()
```

Hub only, no key and no game check:

```lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/vbbi33jkllljcvvbjkqw89fjjkjhkjzsdaih/yen-hub/main/YenHub.lua"))()
```

The interface (Obsidian or Farcal) is switched in Settings > Interface and remembered between runs.

## Files

| File | Job |
| --- | --- |
| `YenKeySystem.lua` | Main entry: game list, key, terms, then the game script. All key settings are at the top |
| `YenHub.lua` | Loads the hub without the key system |
| `Hub.lua` | The hub, drawn by Obsidian or Farcal |
| `Import.lua` | Fetches files from this repository |
| `Theme.lua` | Colors shared by every interface |
| `Libraries/`, `Assets/` | UI libraries, font and logo, see `THIRD_PARTY.md` |

## Add a game

Add an entry to `Games` in `YenKeySystem.lua` with the PlaceIds or GameIds and the script to load (a path in this repo or a full url). A GameId covers every place in that game.

## Keys and terms

A key is valid for `Duration` seconds (one hour by default). When it runs out the hub unloads and the key window comes back; the hub shows the time left in Live Stats.

`Provider = "Static"` compares against `Keys`. Anything in a public repository can be read by anyone, so this only works as a speed bump. For real protection set `Provider = "Http"` and point `HttpUrl` at your own server. It receives `{Key}` and `{Hwid}` and must answer `true` or `{"valid":true}`. A valid key is remembered in `YenHub/key.txt`.

After the key, players must accept the terms in `Terms`. The acceptance is remembered until you raise `Version`. The text is a template, have it checked before you rely on it.

## Develop the hub locally

Copy this folder into your executor workspace (for example `YenHub/dev/`), then:

```lua
getgenv().YenLocalRoot = "YenHub/dev/"
loadstring(readfile("YenHub/dev/Hub.lua"))()
```

Files are read from the workspace instead of GitHub.
