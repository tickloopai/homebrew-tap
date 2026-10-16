# frozen_string_literal: true

# Rendered by .github/workflows/release.yml into tickloopai/homebrew-tap; edit the template here.
class Tickloop < Formula
  desc "Terminal agent with market Ticks for self-directed investors"
  homepage "https://tickloop.ai"
  version "0.2.2"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.2/tickloop-aarch64-apple-darwin.tar.gz"
      sha256 "730e4d3801b886625b47c8a6abfcb200b861ea6916d84a4ee0bce2db1e3c9003"
    end
    on_intel do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.2/tickloop-x86_64-apple-darwin.tar.gz"
      sha256 "17aa825cd50ef5a1a3430a77db8ce03dddcfdd917077b47fdb2b7a522bc3c9a2"
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
