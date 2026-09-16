cask "bifrost" do
  version "0.2.0"
  sha256 "1baafe1f96947541397eba91a7d29f05f17e13f990b4a1b3d5b0baee3015a655"

  # Recipients supply the shared read-only download token; never embed it here.
  # Homebrew preserves this standard variable while resolving GitHub redirects.
  url "https://api.github.com/repos/McNight/bifrost-releases/releases/assets/567982731",
      header: [
        "Accept: application/octet-stream",
        "Authorization: Bearer #{ENV.fetch("HOMEBREW_GITHUB_API_TOKEN")}",
      ]
  name "Bifrost"
  desc "Foreground WireGuard client for macOS"
  homepage "https://github.com/McNight/bifrost-releases"

  depends_on macos: :ventura
  depends_on arch: :arm64

  pkg "bifrost-#{version}-macos-arm64.pkg"
  binary "/usr/local/bin/bifrost" if HOMEBREW_PREFIX.to_s != "/usr/local"

  uninstall script: {
              executable: "/usr/local/libexec/bifrost/root-manager",
              args:       ["--installation-check"],
              sudo:       true,
            },
            pkgutil: "fr.mcnight.bifrost"

  caveats <<~EOS
    Set HOMEBREW_GITHUB_API_TOKEN to the shared read-only download token
    provided privately by the publisher. No repository invitation is needed.
    Stop all Bifrost sessions with 'bifrost down' before upgrading or uninstalling.
    The CLI runs in the foreground; 'up' prompts sudo for the root-owned helpers.
  EOS
end
