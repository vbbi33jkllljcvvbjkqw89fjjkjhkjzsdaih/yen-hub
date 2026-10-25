# Third party code

| Path | What | Author | License |
| --- | --- | --- | --- |
| `Libraries/Obsidian/` | Obsidian UI library, pinned to commit `bdaa9b8f555ed5ff1c4d87bb2d7339babe874e6f` | deividcomsono | MIT, see `Libraries/Obsidian/LICENSE` |
| `Libraries/Farcal.lua` | Farcal UI library, patched | samet | Not stated, confirm before publishing |
| `Libraries/Spring.lua` | Spring helper used by Farcal | samet | Not stated, confirm before publishing |
| `Assets/Inter-Medium.otf` | Inter Medium 3.19 | The Inter Project Authors (rsms) | SIL Open Font License 1.1, see `Assets/Inter-LICENSE.txt` |

Farcal and its helper came without a license file. Get the author's permission to redistribute them (or replace them) before making the repository public.

## Patches

Both libraries are patched so that nothing reaches the console. Every callback, delayed task, thread and signal connection is protected, and `warn`/`error` output goes to `Import.Report`, which feeds the Diagnostics box in Settings.

Farcal also fixes sliders without a step returning NaN, closes single choice dropdowns after a pick, and lets notification cards grow (`MaxHeight`) and measure long text correctly. It has its own global (`FarcalLibrary`), a working Inter font, a bundled Spring, `Validate` support in the key system, and `Exit` no longer clears its own library reference (delayed callbacks used to crash after switching interface).
