# frozen_string_literal: true

# Rendered by .github/workflows/release.yml into tickloopai/homebrew-tap; edit the template here.
class Tickloop < Formula
  desc "Terminal AI agent for code and office work, driven by live Ticks"
  homepage "https://tickloop.ai"
  version "0.2.41"

  on_macos do
    on_arm do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.41/tickloop-aarch64-apple-darwin.tar.gz"
      sha256 "9cab2a2403f2c079426b082b3f7c495aa6790333d4deff189439c3b661c86ac7"
    end
    on_intel do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.41/tickloop-x86_64-apple-darwin.tar.gz"
      sha256 "90cfb7659f4036a97bd73538942d6f664b1f44723c742ba2d31940eaaa1ee011"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.41/tickloop-aarch64-unknown-linux-musl.tar.gz"
      sha256 "d828a9f359978a59f77f61598b5d81f4cf2bd8500a3fe9297333b1dd1059ee10"
    end
    on_intel do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.41/tickloop-x86_64-unknown-linux-musl.tar.gz"
      sha256 "64e4defa40c0f08ffb66c4e140d5845acc7cde4836a285c3693658dd74426332"
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
