# frozen_string_literal: true

# Rendered by .github/workflows/release.yml into tickloopai/homebrew-tap; edit the template here.
class Tickloop < Formula
  desc "Terminal AI agent for code and office work, driven by live Ticks"
  homepage "https://tickloop.ai"
  version "0.2.59"

  on_macos do
    on_arm do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.59/tickloop-aarch64-apple-darwin.tar.gz"
      sha256 "2e4a5d2596a028fb71885770267cb9580769be3e372787d4af98559fed6a1ca1"
    end
    on_intel do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.59/tickloop-x86_64-apple-darwin.tar.gz"
      sha256 "2f3925a4f4515b77f0862cd2a365816c3a6b48e75367d70a6e92d85a7867f692"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.59/tickloop-aarch64-unknown-linux-musl.tar.gz"
      sha256 "4317cc68ce682e9e0b1d17842b8e9a5144f52e8fa3b620a7d97177e8d16a9ff7"
    end
    on_intel do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.59/tickloop-x86_64-unknown-linux-musl.tar.gz"
      sha256 "8fc70bb086597b7ee1d5d955127daed0ded829c4c5e3845bfe80b402e7bddca9"
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
