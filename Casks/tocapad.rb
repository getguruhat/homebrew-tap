cask "tocapad" do
  version "0.1.4"
  sha256 "297f94e38e395d8b232144aef55e149346932956319494a1d29a2d394e297af9"

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
