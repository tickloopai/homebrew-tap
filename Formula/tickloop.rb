# frozen_string_literal: true

# Rendered by .github/workflows/release.yml into tickloopai/homebrew-tap; edit the template here.
class Tickloop < Formula
  desc "Terminal AI agent for code and office work, driven by live Ticks"
  homepage "https://tickloop.ai"
  version "0.2.23"

  on_macos do
    on_arm do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.23/tickloop-aarch64-apple-darwin.tar.gz"
      sha256 "e8c7cabd2b019b1df6d89ae75b233264badf636f82273d7e9abaac4f2cdee7e1"
    end
    on_intel do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.23/tickloop-x86_64-apple-darwin.tar.gz"
      sha256 "5f039836ec9369aa3631a7c848fbfa12b02f9bb9c6f3153c9bc23a035d40685e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.23/tickloop-aarch64-unknown-linux-musl.tar.gz"
      sha256 "074e899e603b0aa4886fca8bcbf3eed0d138d56658698c89bae050c8ff4c856f"
    end
    on_intel do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.23/tickloop-x86_64-unknown-linux-musl.tar.gz"
      sha256 "642f2b407c9767e343a5b6678b0ac77a2697bca7079264ca9cd62e4a51840708"
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
