# frozen_string_literal: true

# Rendered by .github/workflows/release.yml into tickloopai/homebrew-tap; edit the template here.
class Tickloop < Formula
  desc "Terminal agent with market Ticks for self-directed investors"
  homepage "https://tickloop.ai"
  version "0.2.9"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.9/tickloop-aarch64-apple-darwin.tar.gz"
      sha256 "13216dce47701772979fd6d7bea7e323e5dc99eca21f0c8ec2fd620eb084d5b3"
    end
    on_intel do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.9/tickloop-x86_64-apple-darwin.tar.gz"
      sha256 "ed83a05f9eb9994bdc23f47e34f8c7b927d8e9ece93bf5abe977f8c53cfe132f"
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
