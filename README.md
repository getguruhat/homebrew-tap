# GuruHat Homebrew Tap

Free, open-source Mac apps from [GuruHat](https://guruhat.com), installable with Homebrew.

```bash
brew install --cask getguruhat/tap/ai-meter   # Claude Code / Codex usage in the menu bar
brew install --cask getguruhat/tap/cliphat    # Clipboard history
brew install --cask getguruhat/tap/pcmode     # Windows-style shortcuts on macOS
```

Or tap once and use short names:

```bash
brew tap getguruhat/tap
brew trust getguruhat/tap   # Homebrew 7+ only loads short names from trusted taps
brew install --cask ai-meter cliphat pcmode
```

Upgrade with `brew upgrade --cask`. Remove an app with `brew uninstall --cask <name>`,
or `brew uninstall --zap --cask <name>` to also delete its settings and data.

| Cask       | App          | Source                                                          |
| ---------- | ------------ | --------------------------------------------------------------- |
| `ai-meter` | AI Meter     | [getguruhat/ai-meter](https://github.com/getguruhat/ai-meter)    |
| `cliphat`  | ClipHat      | [getguruhat/cliphat-macos](https://github.com/getguruhat/cliphat-macos) |
| `pcmode`   | PC Mode      | [getguruhat/PCMode](https://github.com/getguruhat/PCMode)        |

Requirements: macOS 13 Ventura or later on Apple silicon.

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
