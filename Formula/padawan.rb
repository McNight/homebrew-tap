class Padawan < Formula
  desc "Inspect and automate Apple game controllers from the command line"
  homepage "https://github.com/McNight/padawan-cli"
  url "https://github.com/McNight/padawan-cli/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "8a9aade4a9ccbc723eb112df4104f8160b2185bba75763e3ed3150ed958de717"
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
