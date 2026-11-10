# frozen_string_literal: true

# Rendered by .github/workflows/release.yml into tickloopai/homebrew-tap; edit the template here.
class Tickloop < Formula
  desc "Terminal AI agent for code and office work, driven by live Ticks"
  homepage "https://tickloop.ai"
  version "0.2.46"

  on_macos do
    on_arm do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.46/tickloop-aarch64-apple-darwin.tar.gz"
      sha256 "d5439e38693462ace1a7ae4b9c976e29139300ab0afb4e257c77b482eecf8236"
    end
    on_intel do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.46/tickloop-x86_64-apple-darwin.tar.gz"
      sha256 "76f6c51ab1527e2c74ccef8c12c74daaaaf0f23dd3cb6215e1c76b0b99d05642"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.46/tickloop-aarch64-unknown-linux-musl.tar.gz"
      sha256 "6256596f90de4f4ddf343463c468df2071e460457c1a5cde6e7cb7302d63aaf9"
    end
    on_intel do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.46/tickloop-x86_64-unknown-linux-musl.tar.gz"
      sha256 "d6afe761d9b97d3b76a243c1f6e69dcaf6f46b8e9692bff46322923eccf56bb9"
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
