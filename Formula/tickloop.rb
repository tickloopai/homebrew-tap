# frozen_string_literal: true

# Rendered by .github/workflows/release.yml into tickloopai/homebrew-tap; edit the template here.
class Tickloop < Formula
  desc "Terminal AI agent for code and office work, driven by live Ticks"
  homepage "https://tickloop.ai"
  version "0.2.51"

  on_macos do
    on_arm do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.51/tickloop-aarch64-apple-darwin.tar.gz"
      sha256 "2f70c2630af692b2f00ebeb299f9f161819157925bd8dbc0b3c5beaaf2270d34"
    end
    on_intel do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.51/tickloop-x86_64-apple-darwin.tar.gz"
      sha256 "e9e76ee031108af6021b076242cdff76a4043890b4f2502acf4cbf039fb960eb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.51/tickloop-aarch64-unknown-linux-musl.tar.gz"
      sha256 "1be66c03fb2ffca5d40af6f747aad0ba61a863e6fa26e744a8dc427d74b79576"
    end
    on_intel do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.51/tickloop-x86_64-unknown-linux-musl.tar.gz"
      sha256 "54d8201d62d58dcac1f7d05c20c80de38e5e265cce47bb4ccf81ab8f82250cf1"
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
