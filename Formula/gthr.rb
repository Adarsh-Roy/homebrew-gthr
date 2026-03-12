class Gthr < Formula
  desc "A CLI tool for interactive directory text ingestion with fuzzy finder"
  homepage "https://github.com/Adarsh-Roy/gthr"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Adarsh-Roy/gthr/releases/download/v0.3.0/gthr-aarch64-apple-darwin.tar.gz"
      sha256 "1afd36ef67f1b42a91247879c1ef644770d0be6b184caa2320ca1349297df370"
    else
      url "https://github.com/Adarsh-Roy/gthr/releases/download/v0.3.0/gthr-x86_64-apple-darwin.tar.gz"
      sha256 "a7e7a6d3c251156e61c266a287ff1ecbf984cb70843e1303e53ca8288f33da5a"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/Adarsh-Roy/gthr/releases/download/v0.3.0/gthr-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c4c8890928e715fbca4f3c59ffbe8da8934193f2a011a0d1bb3991a9ecfba3f2"
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
