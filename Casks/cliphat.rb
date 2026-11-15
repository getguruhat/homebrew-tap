cask "cliphat" do
  version "1.0.3"
  sha256 "c36f0bece3cafd1b6f58e77e99770efbc6cf1cae61b4751cc9cada927a7571c6"

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
