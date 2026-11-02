# frozen_string_literal: true

# Rendered by .github/workflows/release.yml into tickloopai/homebrew-tap; edit the template here.
class Tickloop < Formula
  desc "Terminal AI agent for code and office work, driven by live Ticks"
  homepage "https://tickloop.ai"
  version "0.2.34"

  on_macos do
    on_arm do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.34/tickloop-aarch64-apple-darwin.tar.gz"
      sha256 "c0f7d5595566c74c4cafc60ed171d8396fd074a83277d7339eb4b988810b8124"
    end
    on_intel do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.34/tickloop-x86_64-apple-darwin.tar.gz"
      sha256 "354b8cbe335423fd4db4f11578fe124588d600a742f994ea9ff084b9b7edb428"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.34/tickloop-aarch64-unknown-linux-musl.tar.gz"
      sha256 "9b77ebf2aaa6c807d2cab7c1cd61497833b7459990089e9603ce03faa7e78253"
    end
    on_intel do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.34/tickloop-x86_64-unknown-linux-musl.tar.gz"
      sha256 "2898caca9b4cb2b803eeb8f06b3d574e66aed8490ba309e4cc0c00ef83d8b646"
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
