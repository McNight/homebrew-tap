class Padawan < Formula
  desc "Inspect and automate Apple game controllers from the command line"
  homepage "https://github.com/McNight/padawan-cli"
  url "https://github.com/McNight/padawan-cli/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "06fe6e614d3e31ce4127c3e2684c7aa28d16289aede6fdce6bd11bd18b2741d4"
  license "MIT"

  depends_on :macos
  depends_on xcode: ["26.0", :build]

  def install
    system "swift", "build", "--configuration", "release", "--disable-sandbox"
    bin.install ".build/release/padawan"
  end

  test do
    system "#{bin}/padawan", "--version"
  end
end
