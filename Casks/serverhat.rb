cask "serverhat" do
  version "0.2.2"
  sha256 "d34cd2a3ce8232b769f2a8ea59df5925464aae3b131c19cd755e4ebf12a5a526"

  url "https://github.com/getguruhat/serverhat-macos/releases/download/v#{version}/ServerHat-#{version}-Installer.dmg"
  name "ServerHat"
  desc "Menu bar manager for local dev servers, with MCP for Claude Code and Codex"
  homepage "https://github.com/getguruhat/serverhat-macos"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "ServerHat.app"

  # Quitting stops the servers ServerHat started.
  uninstall quit: "com.guruhat.serverhat"

  zap trash: [
    "~/Library/Application Support/ServerHat",
    "~/Library/Caches/com.guruhat.serverhat",
    "~/Library/HTTPStorages/com.guruhat.serverhat",
    "~/Library/Logs/ServerHat",
    "~/Library/Preferences/com.guruhat.serverhat.plist",
  ]

  caveats <<~EOS
    #{token} is not notarized by Apple. If macOS blocks the first launch, open
    System Settings > Privacy & Security and click "Open Anyway".

    To give Claude Code its MCP tools:
      claude mcp add --scope user serverhat -- #{appdir}/ServerHat.app/Contents/MacOS/ServerHat --mcp
  EOS
end
