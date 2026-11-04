# frozen_string_literal: true

# Rendered by .github/workflows/release.yml into tickloopai/homebrew-tap; edit the template here.
class Tickloop < Formula
  desc "Terminal AI agent for code and office work, driven by live Ticks"
  homepage "https://tickloop.ai"
  version "0.2.37"

  on_macos do
    on_arm do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.37/tickloop-aarch64-apple-darwin.tar.gz"
      sha256 "8522b1068de42a8a0cc7d036c6b8c2056deb4764c884a04ac5174e60d5591970"
    end
    on_intel do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.37/tickloop-x86_64-apple-darwin.tar.gz"
      sha256 "27e0dc153003547e653397673d807c9878ad6dd3589e9efd7e06263296c2b410"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.37/tickloop-aarch64-unknown-linux-musl.tar.gz"
      sha256 "e73dadb8f2d3cd0893e994da5d483f62476c712ef345d8064559b11432ee659b"
    end
    on_intel do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.37/tickloop-x86_64-unknown-linux-musl.tar.gz"
      sha256 "79d9e4011adc3c1885c2adab3319ec44355bcf80e6a99fd1eb5e27bcfa753450"
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
