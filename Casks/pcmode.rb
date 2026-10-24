cask "pcmode" do
  version "1.4.1"
  sha256 "8262ea63abd46ea01fa3b2e2a6c114aac17b48bbf283f15e793c7ab4d469a554"

  url "https://github.com/getguruhat/PCMode/releases/download/v#{version}/PCMode-Installer.dmg"
  name "PC Mode"
  desc "Windows-style keyboard shortcuts"
  homepage "https://github.com/getguruhat/PCMode"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "PCMode.app"

  uninstall launchctl: "com.andre.pcmode",
            quit:      "com.andre.pcmode"

  zap trash: [
    "~/Library/Caches/com.andre.pcmode",
    "~/Library/HTTPStorages/com.andre.pcmode",
    "~/Library/LaunchAgents/com.andre.pcmode.plist",
    "~/Library/Preferences/com.andre.pcmode.plist",
  ]

  caveats <<~EOS
    #{token} is not notarized by Apple. If macOS blocks the first launch, open
    System Settings > Privacy & Security and click "Open Anyway".

    PC Mode needs Accessibility access to remap shortcuts. Grant it in
    System Settings > Privacy & Security > Accessibility.
  EOS
end
