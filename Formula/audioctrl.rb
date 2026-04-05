class Audioctrl < Formula
    desc "CLI tool to control macOS audio"
    homepage "https://github.com/McNight/audioctrl"
    url "https://github.com/McNight/audioctrl/archive/refs/tags/v1.0.0.tar.gz"
    sha256 "9c443b04ee1e17b6ce206e8b7971562df9611ee561953f819beb5ee50249a651"
    license "MIT"

    depends_on :macos
    depends_on xcode: ["15.0", :build]

    def install
      system "swift", "build", "--configuration", "release", "--disable-sandbox"
      bin.install ".build/release/audioctrl"
    end

    test do
      system "#{bin}/audioctrl", "--version"
    end
end
