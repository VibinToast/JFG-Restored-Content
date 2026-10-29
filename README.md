# Jet Force Gemini: Recompiled · Restored Content

Content cut from Jet Force Gemini, brought back to work in [Jet Force Gemini: Recompiled](https://github.com/VibinToast/JetForceGemini-Recomp): enemies, props, pickups and lights that are in the game's data but never used. Each pack lives in its own folder with its own README, and is versioned and released on its own.

## Installing

The easy way is the game's launcher: **Get Mods** lists both packs (the Restored Content source), installs one with what it needs, and shows when one has an update. By hand: download a pack's `.nrm` from [Releases](https://github.com/VibinToast/JFG-Restored-Content/releases) and put it in the game's `mods` folder.

## The packs

| | Pack | | Tags | Version |
|---|---|---|---|---|
| <img src="jfg_restored_content/thumb.png" width="64" alt=""> | **[Restored Content](jfg_restored_content/README.md)** | The game's cut enemies, working again, for level packs to use. | Content | 0.1.1 |
| <img src="jfg_restored_content_test_hub/thumb.png" width="64" alt=""> | **[Restored Content Gallery](jfg_restored_content_test_hub/README.md)** | A hub of rooms showing every cut enemy, prop, pickup and light. Warp in front of King Jeff's house. | Levels, Content | 0.2.0 |

## Releases

Each pack is released on its own, tagged `<pack id>-v<version>`, with its `.nrm` and `thumb.png`. The `catalog` release (marked Latest) carries `catalog.json`, the list the launcher's Get Mods page reads.

## Building

Each pack is a [JFG-Studio](https://github.com/VibinToast/JFG-Studio) project; its README says how to build it. The projects hold no game data: JFG-Studio reads that from your own ROM.

## License

[MIT](LICENSE). Jet Force Gemini itself is not included: the packs need the game and the port.
