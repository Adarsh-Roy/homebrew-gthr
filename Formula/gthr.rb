class Gthr < Formula
  desc "A CLI tool for interactive directory text ingestion with fuzzy finder"
  homepage "https://github.com/Adarsh-Roy/gthr"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Adarsh-Roy/gthr/releases/download/v0.2.0/gthr-aarch64-apple-darwin.tar.gz"
      sha256 "156a91dcb7bebceb8ca586e0744b05514ba4a7812becf1ebfee8fcbda9c1dd9e"
    else
      url "https://github.com/Adarsh-Roy/gthr/releases/download/v0.2.0/gthr-x86_64-apple-darwin.tar.gz"
      sha256 "67debbf7c925e1ab5ede673ea22aef4a6e51c2aa3798354880e502fe861a69b2"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/Adarsh-Roy/gthr/releases/download/v0.2.0/gthr-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f2c7d7b6b5a4a0e9c0c60f3837ca53b78bb2b01a00317b6ed2319196554e2a8f"
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
