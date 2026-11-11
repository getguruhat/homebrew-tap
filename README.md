# GuruHat Homebrew Tap

Free, open-source Mac apps from [GuruHat](https://guruhat.com), installable with Homebrew.

```bash
brew install --cask getguruhat/tap/ai-meter   # Claude Code / Codex usage in the menu bar
brew install --cask getguruhat/tap/cliphat    # Clipboard history
brew install --cask getguruhat/tap/pcmode     # Windows-style shortcuts on macOS
brew install --cask getguruhat/tap/serverhat  # Local dev servers in the menu bar
brew install --cask getguruhat/tap/tocapad    # Trackpad edges for volume and brightness
brew install --cask getguruhat/tap/mame4mac-slim  # Slim MAME arcade emulator (your own ROMs)
```

Or tap once and use short names:

```bash
brew tap getguruhat/tap
brew trust getguruhat/tap   # Homebrew 7+ only loads short names from trusted taps
brew install --cask ai-meter cliphat pcmode serverhat tocapad mame4mac-slim
```

Upgrade with `brew upgrade --cask`. Remove an app with `brew uninstall --cask <name>`,
or `brew uninstall --zap --cask <name>` to also delete its settings and data.

| Cask       | App          | Source                                                          |
| ---------- | ------------ | --------------------------------------------------------------- |
| `ai-meter` | AI Meter     | [getguruhat/ai-meter](https://github.com/getguruhat/ai-meter)    |
| `cliphat`  | ClipHat      | [getguruhat/cliphat-macos](https://github.com/getguruhat/cliphat-macos) |
| `pcmode`   | PC Mode      | [getguruhat/PCMode](https://github.com/getguruhat/PCMode)        |
| `serverhat` | ServerHat   | [getguruhat/serverhat-macos](https://github.com/getguruhat/serverhat-macos) |
| `tocapad`  | TocaPad      | [getguruhat/tocapad-macos](https://github.com/getguruhat/tocapad-macos) |
| `mame4mac-slim` | MAME4mac Slim | [getguruhat/MAME4iOS](https://github.com/getguruhat/MAME4iOS) (fork of ToddLa/MAME4iOS) |

Requirements: macOS 13 Ventura or later on Apple silicon.

## MAME4mac Slim

`mame4mac-slim` is an unofficial, unsigned slim build of [MAME4mac](https://github.com/ToddLa/MAME4iOS)
for Apple silicon (about 80 MB instead of 500+ MB). Only the MAME drivers listed in
[`keep-drivers.flt`](https://github.com/getguruhat/mame/blob/master/keep-drivers.flt) are built in,
so other games will not run, and no ROMs are included: put your own in `~/Documents/roms`.
It is GPL-2.0-or-later like upstream; the source is the two forks linked above. MAME is a
trademark of its owner and this is not an official release.

## First launch

These apps are not yet notarized by Apple. If macOS blocks the first launch, open
**System Settings → Privacy & Security** and click **Open Anyway**.

## Maintaining (for GuruHat)

When a new release is published on GitHub:

```bash
brew bump-cask-pr --write-only --version <new-version> getguruhat/tap/<cask>
brew style Casks/<cask>.rb
brew audit --cask --online getguruhat/tap/<cask>
```

Then commit and push. `brew livecheck --tap getguruhat/tap` lists casks that are behind.
