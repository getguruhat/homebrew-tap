cask "tocapad" do
  version "0.1.2"
  sha256 "6ffb6c16904b98c724525546f15f404b83c0db16e589c36800635279aa6accb2"

  url "https://github.com/getguruhat/tocapad-macos/releases/download/v#{version}/TocaPad-#{version}-Installer.dmg"
  name "TocaPad"
  desc "Trackpad edges for volume and brightness"
  homepage "https://guruhat.com/apps/tocapad/"

  livecheck do
    url "https://github.com/getguruhat/tocapad-macos"
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "TocaPad.app"

  uninstall quit: "com.guruhat.tocapad"

  zap trash: [
    "~/Library/Caches/com.guruhat.tocapad",
    "~/Library/HTTPStorages/com.guruhat.tocapad",
    "~/Library/Preferences/com.guruhat.tocapad.plist",
  ]

  caveats <<~EOS
    #{token} is not notarized by Apple. If macOS blocks the first launch, open
    System Settings > Privacy & Security and click "Open Anyway".
  EOS
end
