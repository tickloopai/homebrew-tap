# frozen_string_literal: true

# Rendered by .github/workflows/release.yml into tickloopai/homebrew-tap; edit the template here.
class Tickloop < Formula
  desc "Terminal AI agent for code and office work, driven by live Ticks"
  homepage "https://tickloop.ai"
  version "0.2.65"

  on_macos do
    on_arm do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.65/tickloop-aarch64-apple-darwin.tar.gz"
      sha256 "0f2eef3b331ad3e70a07dfd3fc8190e2449f4dd237c0e789765d60fcc0ba2b7b"
    end
    on_intel do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.65/tickloop-x86_64-apple-darwin.tar.gz"
      sha256 "f867d0e0c35995b597809284faefad29909f5ea4d6e40715bc114091e7d1e54c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.65/tickloop-aarch64-unknown-linux-musl.tar.gz"
      sha256 "7bef5d7178da03d3ff97ec6629e92224d4ee35f5db916333f48545326139fd39"
    end
    on_intel do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.65/tickloop-x86_64-unknown-linux-musl.tar.gz"
      sha256 "2c1206553394e6dbbdb7de38dce8291bf4bdad194b27be6704152b5d277d1a92"
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
