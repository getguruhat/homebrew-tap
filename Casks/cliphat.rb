cask "cliphat" do
  version "1.0.2"
  sha256 "31cfc8e2f5c3e97b963d5a8f85103997c7be42d03c5ac89dad23247265b090f0"

  url "https://github.com/getguruhat/cliphat-macos/releases/download/v#{version}/ClipHat-#{version}-install.dmg"
  name "ClipHat"
  desc "Clipboard history manager"
  homepage "https://github.com/getguruhat/cliphat-macos"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "ClipHat.app"

  uninstall quit: "com.guruhat.ClipHat"

  zap trash: [
        "~/Library/Application Support/GuruHat/ClipHat",
        "~/Library/Caches/com.guruhat.ClipHat",
        "~/Library/HTTPStorages/com.guruhat.ClipHat",
        "~/Library/Preferences/com.guruhat.ClipHat.plist",
      ],
      rmdir: "~/Library/Application Support/GuruHat"

  caveats <<~EOS
    #{token} is not notarized by Apple. If macOS blocks the first launch, open
    System Settings > Privacy & Security and click "Open Anyway".
  EOS
end
