# frozen_string_literal: true

# Rendered by .github/workflows/release.yml into tickloopai/homebrew-tap; edit the template here.
class Tickloop < Formula
  desc "Terminal agent with market Ticks for self-directed investors"
  homepage "https://tickloop.ai"
  version "0.2.8"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.8/tickloop-aarch64-apple-darwin.tar.gz"
      sha256 "6e31111a3160ecaeabc28ce3e3066d9c225fa56ca3d76505b29e59b8992bd7db"
    end
    on_intel do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.8/tickloop-x86_64-apple-darwin.tar.gz"
      sha256 "8c9015cb516e89bd62dcdc229503d48b02211a45eac60a4ec5b8cbe37b9398e0"
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
