class Gthr < Formula
  desc "A CLI tool for interactive directory text ingestion with fuzzy finder"
  homepage "https://github.com/Adarsh-Roy/gthr"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Adarsh-Roy/gthr/releases/download/v0.3.0/gthr-aarch64-apple-darwin.tar.gz"
      sha256 "9b4002f3265e7668753661de5d130700bbff3763c1e5a78d925a01fb9542bc5b"
    else
      url "https://github.com/Adarsh-Roy/gthr/releases/download/v0.3.0/gthr-x86_64-apple-darwin.tar.gz"
      sha256 "0b89365beb1ad043332c58adf0d33311a726bb2b414593e2a05c561b8e163acf"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/Adarsh-Roy/gthr/releases/download/v0.3.0/gthr-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d417d07e815105024139e8fff65a0cad76a48a195d5d616635465008f99a19e0"
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
