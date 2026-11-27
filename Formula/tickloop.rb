# frozen_string_literal: true

# Rendered by .github/workflows/release.yml into tickloopai/homebrew-tap; edit the template here.
class Tickloop < Formula
  desc "Terminal AI agent for code and office work, driven by live Ticks"
  homepage "https://tickloop.ai"
  version "0.2.75"

  on_macos do
    on_arm do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.75/tickloop-aarch64-apple-darwin.tar.gz"
      sha256 "91b45105f7e87b9e715140c9d89ff79e0b693a7ea2dabfbda233336305e8c7de"
    end
    on_intel do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.75/tickloop-x86_64-apple-darwin.tar.gz"
      sha256 "94a58906660ffc7f2fb24f699a80f5b654c9de82352b3f3a4c12ba8182829de5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.75/tickloop-aarch64-unknown-linux-musl.tar.gz"
      sha256 "e540524797b5a8a26521a0ed9c8cbbdcea0a6d4830a7cb256e50613159c029f7"
    end
    on_intel do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.75/tickloop-x86_64-unknown-linux-musl.tar.gz"
      sha256 "656daf8ed39887860fd2bdbdf77eaae152ca89ac5593a259d0b1fdf9eda84c7f"
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
