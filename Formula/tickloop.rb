# frozen_string_literal: true

# Rendered by .github/workflows/release.yml into tickloopai/homebrew-tap; edit the template here.
class Tickloop < Formula
  desc "Terminal agent with market Ticks for self-directed investors"
  homepage "https://tickloop.ai"
  version "0.2.6"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.6/tickloop-aarch64-apple-darwin.tar.gz"
      sha256 "ab66e318b957cbdd0c847a4b09eeaf1857fd00026b805d1bda8fe56f7f31be2f"
    end
    on_intel do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.6/tickloop-x86_64-apple-darwin.tar.gz"
      sha256 "c6eac284c9b7768a9582b24a2887f065a21ca65bda3daa1808e8cc32cf7b37ae"
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
