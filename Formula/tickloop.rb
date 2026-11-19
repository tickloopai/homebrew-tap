# frozen_string_literal: true

# Rendered by .github/workflows/release.yml into tickloopai/homebrew-tap; edit the template here.
class Tickloop < Formula
  desc "Terminal AI agent for code and office work, driven by live Ticks"
  homepage "https://tickloop.ai"
  version "0.2.62"

  on_macos do
    on_arm do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.62/tickloop-aarch64-apple-darwin.tar.gz"
      sha256 "8d93511a0ccbbc56530c56270cb059c87bcf3d4bf98c636226bbb81bd3bf2f13"
    end
    on_intel do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.62/tickloop-x86_64-apple-darwin.tar.gz"
      sha256 "16e0319d51602caa79ec1b8ca4ed7234f8fe1c820e86e99254599ad4962aca98"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.62/tickloop-aarch64-unknown-linux-musl.tar.gz"
      sha256 "0fc268fdebd80525462c1183d841f880e21073be2cf8d6f1f9b424d07f35c03f"
    end
    on_intel do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.62/tickloop-x86_64-unknown-linux-musl.tar.gz"
      sha256 "d757a6c8c520a74cb3edd31d276f0cad828c0104ae87b35011e30a1de4703a07"
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
