# frozen_string_literal: true

# Rendered by .github/workflows/release.yml into tickloopai/homebrew-tap; edit the template here.
class Tickloop < Formula
  desc "Terminal agent with market Ticks for self-directed investors"
  homepage "https://tickloop.ai"
  version "0.2.12"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.12/tickloop-aarch64-apple-darwin.tar.gz"
      sha256 "3b93b7c2da2bb792703dfd0ef0e38a23ebec597c5d6d565d3921671281f37c65"
    end
    on_intel do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.12/tickloop-x86_64-apple-darwin.tar.gz"
      sha256 "782afce897fa7ef7de101bddd405d4813329c83d550f27150aaad47ac6611f0e"
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
