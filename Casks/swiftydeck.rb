cask "swiftydeck" do
  version "0.2.0"
  sha256 "abbd5318bd340c976ae53f14af6b35606ccbae654cd08660e3699ef9c7799146"

  # Recipients supply the shared read-only token; never embed it here.
  url "https://api.github.com/repos/McNight/swiftydeck-releases/releases/assets/586069653",
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
