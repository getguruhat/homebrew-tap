cask "mame4mac-slim" do
  version "8"
  sha256 "7307ae6690a2d1571910b9bda50e475ec94db91ab50c25859523bf6830473775"

  url "https://github.com/getguruhat/MAME4iOS/releases/download/slim-#{version}/MAME4mac-slim.zip"
  name "MAME4mac Slim"
  desc "Slim arcade emulator (MAME) with only a chosen set of drivers"
  homepage "https://github.com/getguruhat/MAME4iOS"

  livecheck do
    url :url
    regex(/^slim[._-]v?(\d+)$/i)
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "MAME4mac-slim.app"

  # Unsigned, not notarized build: clear the download quarantine flag so it opens without the Gatekeeper block.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/MAME4mac-slim.app"],
                   must_succeed: false
  end

  uninstall quit: "com.getguruhat.mame4ios"

  # ROMs and saves live in ~/Documents (roms, cfg, nvram, ...) and are never removed.
  zap trash: [
    "~/Library/Containers/com.getguruhat.mame4ios",
    "~/Library/Preferences/com.getguruhat.mame4ios.plist",
    "~/Library/Saved Application State/com.getguruhat.mame4ios.savedState",
  ]

  caveats <<~EOS
    #{token} is an unofficial, unsigned slim build of MAME4mac for Apple silicon.
    It is not notarized by Apple, so this cask removes the download quarantine flag after
    install so the app opens. If macOS still blocks it, right-click the app and choose Open,
    or use System Settings > Privacy & Security > Open Anyway.

    Only the drivers listed in keep-drivers.flt are built in, and no ROMs are included.
    Put your own ROMs in ~/Documents/roms.

    Source (GPL-2.0-or-later): https://github.com/getguruhat/MAME4iOS and
    https://github.com/getguruhat/mame, forks of ToddLa/MAME4iOS and ToddLa/mame.
  EOS
end
