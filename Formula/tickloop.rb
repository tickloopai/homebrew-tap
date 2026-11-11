# frozen_string_literal: true

# Rendered by .github/workflows/release.yml into tickloopai/homebrew-tap; edit the template here.
class Tickloop < Formula
  desc "Terminal AI agent for code and office work, driven by live Ticks"
  homepage "https://tickloop.ai"
  version "0.2.48"

  on_macos do
    on_arm do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.48/tickloop-aarch64-apple-darwin.tar.gz"
      sha256 "76caae9efdbd22f9e6eefce6eab8e2613e3c4561e4a78b07176524a7015a6e7c"
    end
    on_intel do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.48/tickloop-x86_64-apple-darwin.tar.gz"
      sha256 "7a1c93811ee9f68169c3da84219b1371cd6d9cdd4041c11117dc2c35577b7245"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.48/tickloop-aarch64-unknown-linux-musl.tar.gz"
      sha256 "72782dfe0113e4044e9bb7fa878be4f7ede7718e6eb74ab0fdf9d552c2302771"
    end
    on_intel do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.48/tickloop-x86_64-unknown-linux-musl.tar.gz"
      sha256 "a5aec82ea1599b4ba8ddd098c45ef0c8b7b475a034910a635a94c093a4cb045f"
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
