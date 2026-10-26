# frozen_string_literal: true

# Rendered by .github/workflows/release.yml into tickloopai/homebrew-tap; edit the template here.
class Tickloop < Formula
  desc "Terminal AI agent for code and office work, driven by live Ticks"
  homepage "https://tickloop.ai"
  version "0.2.25"

  on_macos do
    on_arm do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.25/tickloop-aarch64-apple-darwin.tar.gz"
      sha256 "690027fe2dde04c5cc3f27a148bccb3cf05b1c75931224f0196c2e968d4a40de"
    end
    on_intel do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.25/tickloop-x86_64-apple-darwin.tar.gz"
      sha256 "07122e9a01dfe64628837bc397bebcb981f171a9be7190cc0f1e31f8c56a9a59"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.25/tickloop-aarch64-unknown-linux-musl.tar.gz"
      sha256 "945c76f0649278b0aa7e1115aac9b787b0d7f91cec76fa4070d29bd4cd393f61"
    end
    on_intel do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.25/tickloop-x86_64-unknown-linux-musl.tar.gz"
      sha256 "3540c46426521c78f2a63a1321fc82ccc7ef7f18dbaf6d926693c2682984bd72"
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
