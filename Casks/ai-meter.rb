cask "ai-meter" do
  version "1.6.2"
  sha256 "7a8010de3e4d0f99291f724754cc938f298cd927de2e9d885e616d41a0de112e"

  url "https://github.com/getguruhat/ai-meter/releases/download/v#{version}/AI-Meter-#{version}-Installer.dmg"
  name "AI Meter"
  desc "Menu bar meter for Claude Code and Codex usage limits"
  homepage "https://github.com/getguruhat/ai-meter"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "AI Meter.app"

  uninstall launchctl: "com.guruhat.aimeter",
            quit:      "com.guruhat.aimeter"

  zap trash: [
    "~/Library/Caches/com.guruhat.aimeter",
    "~/Library/HTTPStorages/com.guruhat.aimeter",
    "~/Library/LaunchAgents/com.guruhat.aimeter.plist",
    "~/Library/Preferences/com.guruhat.aimeter.plist",
  ]

  caveats <<~EOS
    #{token} is not notarized by Apple. If macOS blocks the first launch, open
    System Settings > Privacy & Security and click "Open Anyway".
  EOS
end
