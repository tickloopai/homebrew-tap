# frozen_string_literal: true

# Rendered by .github/workflows/release.yml into tickloopai/homebrew-tap; edit the template here.
class Tickloop < Formula
  desc "Terminal AI agent for code and office work, driven by live Ticks"
  homepage "https://tickloop.ai"
  version "0.2.64"

  on_macos do
    on_arm do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.64/tickloop-aarch64-apple-darwin.tar.gz"
      sha256 "c99b5c403b19f550ef38b0b91999bb0a7b4435bcbfdcbee7cc88846baf665732"
    end
    on_intel do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.64/tickloop-x86_64-apple-darwin.tar.gz"
      sha256 "0419bc49f4c91af31625503ca58d967167c5b6f5f9569fec77e0da3f5cefb5ca"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.64/tickloop-aarch64-unknown-linux-musl.tar.gz"
      sha256 "82159d4423cc2b1dffc29a65f507eb27505185ca906cb1b4c1b435db6bc03e7f"
    end
    on_intel do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.64/tickloop-x86_64-unknown-linux-musl.tar.gz"
      sha256 "cf8d89df689999b1c8cd2d96bd358217d15c65fc4979e0db173a971e62c1702f"
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
