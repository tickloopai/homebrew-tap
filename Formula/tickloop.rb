# frozen_string_literal: true

# Rendered by .github/workflows/release.yml into tickloopai/homebrew-tap; edit the template here.
class Tickloop < Formula
  desc "Terminal agent with market Ticks for self-directed investors"
  homepage "https://tickloop.ai"
  version "0.2.0"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.0/tickloop-aarch64-apple-darwin.tar.gz"
      sha256 "d5ca4fe3f8cec34d4c720a8ad0f7ccddab84b1efd53206e09bd31d6856ab4d95"
    end
    on_intel do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.0/tickloop-x86_64-apple-darwin.tar.gz"
      sha256 "46f82440833b6a030460102c3f1bdf7da27ac2e806ab5a2a6f8cdefa536e5a18"
    end
  end

  def install
    bin.install "tickloop", "tickhost", "tick"
  end

  test do
    assert_match(/^Usage: tickloop /, shell_output("#{bin}/tickloop --help"))
    assert_match(/^Usage: tickhost /, shell_output("#{bin}/tickhost --help"))
    assert_match(/^Usage: tick /, shell_output("#{bin}/tick --help"))
  end
end
