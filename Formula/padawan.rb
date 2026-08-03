class Padawan < Formula
  desc "Inspect and automate Apple game controllers from the command line"
  homepage "https://github.com/McNight/padawan-cli"
  url "https://github.com/McNight/padawan-cli/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "f3e1b72876dea01510e444aa16f29f3222c43924c915d4200062c85a2166d7f9"
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
