cask "swiftydeck" do
  version "0.2.4"
  sha256 "5f2cbec3c44c87b82ac53e80653b7df2f193df023cf3d89b3e85690431a78569"

  # Recipients supply the shared read-only token; never embed it here.
  url "https://api.github.com/repos/McNight/swiftydeck-releases/releases/assets/591840248",
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
