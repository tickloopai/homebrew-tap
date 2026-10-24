# frozen_string_literal: true

# Rendered by .github/workflows/release.yml into tickloopai/homebrew-tap; edit the template here.
class Tickloop < Formula
  desc "Terminal AI agent for code and office work, driven by live Ticks"
  homepage "https://tickloop.ai"
  version "0.2.21"

  on_macos do
    on_arm do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.21/tickloop-aarch64-apple-darwin.tar.gz"
      sha256 "5110724a8876ce6fe1fb70e8e14dec392b711eedefe3e597e61b30b399f99756"
    end
    on_intel do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.21/tickloop-x86_64-apple-darwin.tar.gz"
      sha256 "211e4fee867e6c16daf29ed325e62fb1b8f9eacb3a7744a2a531b5f0a43d6a74"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.21/tickloop-aarch64-unknown-linux-musl.tar.gz"
      sha256 "458ec7a7bea592576bbf168544ff4bc79f4207da4a2eb686a17d208bf01ea1d4"
    end
    on_intel do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.21/tickloop-x86_64-unknown-linux-musl.tar.gz"
      sha256 "eddbc950cb9db1c3e699507b6b851e5f6f6e91e7910e5a7dd1c8bce49d9b307c"
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
