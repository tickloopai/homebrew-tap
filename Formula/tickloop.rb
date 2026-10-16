# frozen_string_literal: true

# Rendered by .github/workflows/release.yml into tickloopai/homebrew-tap; edit the template here.
class Tickloop < Formula
  desc "Terminal agent with market Ticks for self-directed investors"
  homepage "https://tickloop.ai"
  version "0.2.3"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.3/tickloop-aarch64-apple-darwin.tar.gz"
      sha256 "3970a76f4ad0754ee1f1a76bc198d908e3f817564ba6b6572567fc88a98bfd6d"
    end
    on_intel do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.3/tickloop-x86_64-apple-darwin.tar.gz"
      sha256 "8f614c7764e82f272ce2e480a45cae94f5bf213910e4852271bdd5c80575c870"
    end
  end

  def install
    bin.install "tickloop", "tickhost", "tick-reader"
  end

  test do
    assert_match(/^Usage: tickloop /, shell_output("#{bin}/tickloop --help"))
    assert_match(/^Usage: tickhost /, shell_output("#{bin}/tickhost --help"))
    assert_match(/^Usage: tick-reader /, shell_output("#{bin}/tick-reader --help"))
  end
end
