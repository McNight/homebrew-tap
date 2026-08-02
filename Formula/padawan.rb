class Padawan < Formula
  desc "Inspect and automate Apple game controllers from the command line"
  homepage "https://github.com/McNight/padawan-cli"
  url "https://github.com/McNight/padawan-cli/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "ddade69f240a7926cbc3baebc87fc10d4a16dc585c67406628fe40a2483d2c9c"
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
