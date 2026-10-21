# frozen_string_literal: true

# Rendered by .github/workflows/release.yml into tickloopai/homebrew-tap; edit the template here.
class Tickloop < Formula
  desc "Terminal AI agent for code and office work, driven by live Ticks"
  homepage "https://tickloop.ai"
  version "0.2.17"

  on_macos do
    on_arm do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.17/tickloop-aarch64-apple-darwin.tar.gz"
      sha256 "1c33cca4e7a461b8aada3394f69ae6737b363d86a4529241531ea906d4cc8ea1"
    end
    on_intel do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.17/tickloop-x86_64-apple-darwin.tar.gz"
      sha256 "e7294d3843132b8691aa6a0d1e3f4794aa01e9b153088ba9c917811c02ffad74"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.17/tickloop-aarch64-unknown-linux-musl.tar.gz"
      sha256 "f4ad133bf601f0901bf8e2fb53246df5d317e57787f0890e017dcb6db7e8393b"
    end
    on_intel do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.17/tickloop-x86_64-unknown-linux-musl.tar.gz"
      sha256 "34423e7c94693966db32dbbc19ef7815f992c49a952772cc524fa83bfb57e285"
    end
  end

  def install
    bin.install "tickloop", "tickhost", "tick-reader"
    bin.install_symlink "tickloop" => "tl"
  end

  test do
    assert_match(/^Usage: tickloop /, shell_output("#{bin}/tickloop --help"))
    assert_match(/^Usage: tickloop /, shell_output("#{bin}/tl --help"))
    assert_match(/^Usage: tickhost /, shell_output("#{bin}/tickhost --help"))
    assert_match(/^Usage: tick-reader /, shell_output("#{bin}/tick-reader --help"))
  end
end
