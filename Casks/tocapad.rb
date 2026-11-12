cask "tocapad" do
  version "0.1.5"
  sha256 "9906df3b32b1ca6b2d87dd96f54307169aefbb4c4d7b9e6a522ed4b76b4c2447"

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
