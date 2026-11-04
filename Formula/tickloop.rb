# frozen_string_literal: true

# Rendered by .github/workflows/release.yml into tickloopai/homebrew-tap; edit the template here.
class Tickloop < Formula
  desc "Terminal AI agent for code and office work, driven by live Ticks"
  homepage "https://tickloop.ai"
  version "0.2.38"

  on_macos do
    on_arm do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.38/tickloop-aarch64-apple-darwin.tar.gz"
      sha256 "ca2ca976fa88b3f5b50db66d46aadbd081915df1950e0a64404cbf4c2b4b081d"
    end
    on_intel do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.38/tickloop-x86_64-apple-darwin.tar.gz"
      sha256 "0354f6c3828f40e3205df7df37dfae1bf3ba04aa5f5cfb4f512449569c029d99"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.38/tickloop-aarch64-unknown-linux-musl.tar.gz"
      sha256 "1d1afa6897f0e4438ae38de47128f0a94d23fb57328cb6c631b1d55daa059b1f"
    end
    on_intel do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.38/tickloop-x86_64-unknown-linux-musl.tar.gz"
      sha256 "3df50c0c329a4047148cea553b40971d9b068f6bc3e3d0e497ddf43ca92a30b3"
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
