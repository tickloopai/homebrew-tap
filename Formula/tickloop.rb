# frozen_string_literal: true

# Rendered by .github/workflows/release.yml into tickloopai/homebrew-tap; edit the template here.
class Tickloop < Formula
  desc "Terminal AI agent for code and office work, driven by live Ticks"
  homepage "https://tickloop.ai"
  version "0.2.61"

  on_macos do
    on_arm do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.61/tickloop-aarch64-apple-darwin.tar.gz"
      sha256 "ff70983262552d85dd07f1745a5354868cc4ac15a0664743099ee0a9b9066fc0"
    end
    on_intel do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.61/tickloop-x86_64-apple-darwin.tar.gz"
      sha256 "311f19c5a76b5d00585d04b225440ea364afaa167fb1fb926dcf03869b9f0d62"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.61/tickloop-aarch64-unknown-linux-musl.tar.gz"
      sha256 "3f35ccc13daa605aa27a291d3585f75d7eb5ad63bf74155b3ed9996b4a89db71"
    end
    on_intel do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.61/tickloop-x86_64-unknown-linux-musl.tar.gz"
      sha256 "339124ad6ccd4d107b4712b12793cc0b905714cef22e97c13bc89d31e01950d3"
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
