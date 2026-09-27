cask "swiftydeck" do
  version "0.3.0"
  sha256 "af002391e9cacbdd067b00455e56c0d83befd8e1ca29a858feb3b4de81f3b8fa"

  # Recipients supply the shared read-only token; never embed it here.
  url "https://api.github.com/repos/McNight/swiftydeck-releases/releases/assets/592728004",
      header: [
        "Accept: application/octet-stream",
        "Authorization: Bearer #{ENV.fetch("HOMEBREW_GITHUB_API_TOKEN")}",
      ]
  name "SwiftyDeck"
  desc "Create and run macOS presentations written in SwiftUI"
  homepage "https://github.com/McNight/swiftydeck-releases"

  depends_on macos: :sequoia

  pkg "swiftydeck-#{version}-macos-universal.pkg"
  binary "/usr/local/share/SwiftyDeck/bin/swiftydeck"

  uninstall pkgutil: "fr.mcnight.swiftydeck"

  caveats <<~EOS
    Set HOMEBREW_GITHUB_API_TOKEN to the shared read-only download token
    provided privately by the publisher. No repository invitation is needed.
    Xcode 26 or another Swift 6.2 toolchain is required to build presentations.
  EOS
end
