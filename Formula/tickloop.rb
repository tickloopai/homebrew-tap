# frozen_string_literal: true

# Rendered by .github/workflows/release.yml into tickloopai/homebrew-tap; edit the template here.
class Tickloop < Formula
  desc "Terminal AI agent for code and office work, driven by live Ticks"
  homepage "https://tickloop.ai"
  version "0.2.39"

  on_macos do
    on_arm do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.39/tickloop-aarch64-apple-darwin.tar.gz"
      sha256 "3ec654582ac6a7ca7d016c5826cbf6d2cd430b05b1e91fc6f28515d36e356713"
    end
    on_intel do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.39/tickloop-x86_64-apple-darwin.tar.gz"
      sha256 "86fe6f3ae29cabf4489a18b3edec7a527f0cc496aa51c60ecd333dd0b3e462b3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.39/tickloop-aarch64-unknown-linux-musl.tar.gz"
      sha256 "eee2c2a07b6a2b74e25b1369908054db0a4265bc7309766bcc07c65c8e19bf0d"
    end
    on_intel do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.39/tickloop-x86_64-unknown-linux-musl.tar.gz"
      sha256 "2a232babc8426693a4fdd67e19766db157568b13bbf780f00345b0e55c58e829"
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
