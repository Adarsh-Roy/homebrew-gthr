class Gthr < Formula
  desc "A CLI tool for interactive directory text ingestion with fuzzy finder"
  homepage "https://github.com/Adarsh-Roy/gthr"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Adarsh-Roy/gthr/releases/download/v0.1.1/gthr-aarch64-apple-darwin.tar.gz"
      sha256 "25f1928315a499dff3ed2cb6f954397b8560ab3e2d117e3b83ea435fdef999ca"
    else
      url "https://github.com/Adarsh-Roy/gthr/releases/download/v0.1.1/gthr-x86_64-apple-darwin.tar.gz"
      sha256 "40428b777bbcf3c3ad580dd0eea1707e94247390dbb59beff1050a905eb86703"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/Adarsh-Roy/gthr/releases/download/v0.1.1/gthr-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "47575321013ca762c4664e2369b845a516c82815ad3c519223d3b414fc988f6a"
    end
  end

  def install
    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "gthr-aarch64-apple-darwin" => "gthr"
      else
        bin.install "gthr-x86_64-apple-darwin" => "gthr"
      end
    elsif OS.linux?
      bin.install "gthr-x86_64-unknown-linux-gnu" => "gthr"
    end
  end

  test do
    system "#{bin}/gthr", "--help"
  end
end
