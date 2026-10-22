# frozen_string_literal: true

# Rendered by .github/workflows/release.yml into tickloopai/homebrew-tap; edit the template here.
class Tickloop < Formula
  desc "Terminal AI agent for code and office work, driven by live Ticks"
  homepage "https://tickloop.ai"
  version "0.2.20"

  on_macos do
    on_arm do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.20/tickloop-aarch64-apple-darwin.tar.gz"
      sha256 "218cc37353e418b29c7d3eaf3ba8b4dfbb08f56e19b1db2384b67169d9b2fb4b"
    end
    on_intel do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.20/tickloop-x86_64-apple-darwin.tar.gz"
      sha256 "ade3802a2b7721f543f92c610721057ce34c7c681506be809e56f8134cb290d7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.20/tickloop-aarch64-unknown-linux-musl.tar.gz"
      sha256 "9b6ec4fb69d8f1e2589a730f3c7c1d20f8dbbd3730c1f56ec39514c2d5e2fe2e"
    end
    on_intel do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.20/tickloop-x86_64-unknown-linux-musl.tar.gz"
      sha256 "b02dc40eee7c1ce39d0faa1e1733d2df90dfdbc3ebba095f9d831c4e1a541b6c"
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
