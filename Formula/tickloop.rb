# frozen_string_literal: true

# Rendered by .github/workflows/release.yml into tickloopai/homebrew-tap; edit the template here.
class Tickloop < Formula
  desc "Terminal AI agent for code and office work, driven by live Ticks"
  homepage "https://tickloop.ai"
  version "0.2.50"

  on_macos do
    on_arm do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.50/tickloop-aarch64-apple-darwin.tar.gz"
      sha256 "acdcf4bb7c25f5d1fd9101387b7f3b9441a38fb20b3968a25e7a95ef97e1f266"
    end
    on_intel do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.50/tickloop-x86_64-apple-darwin.tar.gz"
      sha256 "b238225a7e5003d78b3949249ebb0c6c98f83674925bdaaf710100f2959fff72"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.50/tickloop-aarch64-unknown-linux-musl.tar.gz"
      sha256 "8649920cee30de3d15fff2082539dabf48944d8a9bdf991190b4c9a395187925"
    end
    on_intel do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.50/tickloop-x86_64-unknown-linux-musl.tar.gz"
      sha256 "93377e39b7ca71faef70ea40bda80d2c54a069390d14176820d2795f0c50453b"
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
