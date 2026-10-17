# frozen_string_literal: true

# Rendered by .github/workflows/release.yml into tickloopai/homebrew-tap; edit the template here.
class Tickloop < Formula
  desc "Terminal agent with market Ticks for self-directed investors"
  homepage "https://tickloop.ai"
  version "0.2.4"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.4/tickloop-aarch64-apple-darwin.tar.gz"
      sha256 "94b11f2c38998c89967a0ac2812c89ff9a27694fa9a8ffc32192f18ddd9e9752"
    end
    on_intel do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.4/tickloop-x86_64-apple-darwin.tar.gz"
      sha256 "446335b7ce2ea636fbfe0f2cf521ca601107c0e913237e5d0efe76a1ac60e074"
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
