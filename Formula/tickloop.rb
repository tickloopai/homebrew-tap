# frozen_string_literal: true

# Rendered by .github/workflows/release.yml into tickloopai/homebrew-tap; edit the template here.
class Tickloop < Formula
  desc "Terminal AI agent for code and office work, driven by live Ticks"
  homepage "https://tickloop.ai"
  version "0.2.36"

  on_macos do
    on_arm do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.36/tickloop-aarch64-apple-darwin.tar.gz"
      sha256 "b69b0df3c14105e28e8afd4192e80e0dd395459932c50490cc549a8252e3b713"
    end
    on_intel do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.36/tickloop-x86_64-apple-darwin.tar.gz"
      sha256 "abe44f2846a22e91354131ddb176f3135e1707a801499f999cdd7c853e64e1fb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.36/tickloop-aarch64-unknown-linux-musl.tar.gz"
      sha256 "979dafe578406a2685b069d5c55effdb08c5d9c472b37b288aad4937e7e710ca"
    end
    on_intel do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.36/tickloop-x86_64-unknown-linux-musl.tar.gz"
      sha256 "79863293d3fbda62c737584936added45697675310f9a35928bea5aca0ed93d9"
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
