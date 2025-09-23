class Gthr < Formula
  desc "A CLI tool for interactive directory text ingestion with fuzzy finder"
  homepage "https://github.com/Adarsh-Roy/gthr"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Adarsh-Roy/gthr/releases/download/v0.1.0/gthr-aarch64-apple-darwin.tar.gz"
      sha256 "744ceb5156d80b9e3324f15067c599b1d98d17fece5e0569614f114c495dfedd"
    else
      url "https://github.com/Adarsh-Roy/gthr/releases/download/v0.1.0/gthr-x86_64-apple-darwin.tar.gz"
      sha256 "6dc62fd935076a4fe48b3e7604f3c4041c666f6d65539fd07164074539a2254a"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/Adarsh-Roy/gthr/releases/download/v0.1.0/gthr-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "dcc41754ed4a4f5257273f292e5810b743561c9d8a8af56e5cba3e135ff9617e"
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
