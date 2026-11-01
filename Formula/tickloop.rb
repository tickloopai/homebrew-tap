# frozen_string_literal: true

# Rendered by .github/workflows/release.yml into tickloopai/homebrew-tap; edit the template here.
class Tickloop < Formula
  desc "Terminal AI agent for code and office work, driven by live Ticks"
  homepage "https://tickloop.ai"
  version "0.2.30"

  on_macos do
    on_arm do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.30/tickloop-aarch64-apple-darwin.tar.gz"
      sha256 "812ab82235f2d73b56b1da78529dbb3ad8d4049c02006c8e05f9463adb7471b4"
    end
    on_intel do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.30/tickloop-x86_64-apple-darwin.tar.gz"
      sha256 "931af253d2740addaa46dd976987f670dd5da1ab594baf488dd003f2e328bc3b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.30/tickloop-aarch64-unknown-linux-musl.tar.gz"
      sha256 "7fadc2f8d36328787c7c7c73d4742d8dc20556bda4ad4f74ec058b2b8872d29a"
    end
    on_intel do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.30/tickloop-x86_64-unknown-linux-musl.tar.gz"
      sha256 "e2ccc6916fa5be22b39382628e1aec2ca4bc8b151a9d47295c449dad4cba93c0"
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
