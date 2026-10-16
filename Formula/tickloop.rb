# frozen_string_literal: true

# Rendered by .github/workflows/release.yml into tickloopai/homebrew-tap; edit the template here.
class Tickloop < Formula
  desc "Terminal agent with market Ticks for self-directed investors"
  homepage "https://tickloop.ai"
  version "0.2.1"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.1/tickloop-aarch64-apple-darwin.tar.gz"
      sha256 "a537ea9039186945061362f6548d780392675d3850dc7b0b15ce93001cb70e75"
    end
    on_intel do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.1/tickloop-x86_64-apple-darwin.tar.gz"
      sha256 "f98cac3b0365e7d5c2695397416b1cfde63fd1889c137460206b096ac00bd85e"
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
