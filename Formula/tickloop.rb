# frozen_string_literal: true

# Rendered by .github/workflows/release.yml into tickloopai/homebrew-tap; edit the template here.
class Tickloop < Formula
  desc "Terminal AI agent for code and office work, driven by live Ticks"
  homepage "https://tickloop.ai"
  version "0.2.19"

  on_macos do
    on_arm do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.19/tickloop-aarch64-apple-darwin.tar.gz"
      sha256 "7f1aa73ea69d155927068383ea8977c8c64d8c907df41c8709a297be2f7208b6"
    end
    on_intel do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.19/tickloop-x86_64-apple-darwin.tar.gz"
      sha256 "934fc7acc14ccd68515097914ffd5eb7a3a87e53b26212145c9a988beb6e8597"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.19/tickloop-aarch64-unknown-linux-musl.tar.gz"
      sha256 "52f4342d823aeeb796f8a554f316973f09d44ed581d82f225962dca003226ccc"
    end
    on_intel do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.19/tickloop-x86_64-unknown-linux-musl.tar.gz"
      sha256 "893bc24609d8a29b0f314f483c299c2c80aa3ad94541ec3ff34f41878d680a62"
    end
  end

  def install
    bin.install "tickloop", "tickhost"
    bin.install_symlink "tickloop" => "tl"
  end

  test do
    assert_match(/^Usage: tickloop /, shell_output("#{bin}/tickloop --help"))
    assert_match(/^Usage: tickloop /, shell_output("#{bin}/tl --help"))
    assert_match(/^Usage: tickhost /, shell_output("#{bin}/tickhost --help"))
  end
end
