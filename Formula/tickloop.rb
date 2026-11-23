# frozen_string_literal: true

# Rendered by .github/workflows/release.yml into tickloopai/homebrew-tap; edit the template here.
class Tickloop < Formula
  desc "Terminal AI agent for code and office work, driven by live Ticks"
  homepage "https://tickloop.ai"
  version "0.2.67"

  on_macos do
    on_arm do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.67/tickloop-aarch64-apple-darwin.tar.gz"
      sha256 "2fa8ea69fd6dd89673f06921f6e4b12a3fd6d2f11cc1678b432e25543dae4f88"
    end
    on_intel do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.67/tickloop-x86_64-apple-darwin.tar.gz"
      sha256 "f22f5175e2a024db0fe428afc03789eb34b808f4966657609be72248fba9392b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.67/tickloop-aarch64-unknown-linux-musl.tar.gz"
      sha256 "9857643b5b304e404d1a02d42fea07e45afb3922b857166add34a17337d01aa0"
    end
    on_intel do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.67/tickloop-x86_64-unknown-linux-musl.tar.gz"
      sha256 "37aff881580bc1816ef9265c77b44259f5fea0d7bafb0d268483a4f0596a765c"
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
