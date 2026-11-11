cask "tocapad" do
  version "0.1.3"
  sha256 "919c32551e9951e624f5b356ac5a4aca0d761f69f24a0c0b59b5901d0e15fa4b"

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
