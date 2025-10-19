class Gthr < Formula
  desc "A CLI tool for interactive directory text ingestion with fuzzy finder"
  homepage "https://github.com/Adarsh-Roy/gthr"
  version "0.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Adarsh-Roy/gthr/releases/download/v0.2.1/gthr-aarch64-apple-darwin.tar.gz"
      sha256 "83490330607103cc794e34ffb87c091ba9d87409d72dbe80c667aa07a390b08f"
    else
      url "https://github.com/Adarsh-Roy/gthr/releases/download/v0.2.1/gthr-x86_64-apple-darwin.tar.gz"
      sha256 "0a9630efa4636b4092e17a6ad7a85fa2fa113a9a5167ac6d8413adb80f47d94b"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/Adarsh-Roy/gthr/releases/download/v0.2.1/gthr-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "290d9b34a01c495da3b5bf6f3150eb7884f4cc0b214b730cc1d1912cd568acec"
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
