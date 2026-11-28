# frozen_string_literal: true

# Rendered by .github/workflows/release.yml into tickloopai/homebrew-tap; edit the template here.
class Tickloop < Formula
  desc "Terminal AI agent for code and office work, driven by live Ticks"
  homepage "https://tickloop.ai"
  version "0.2.76"

  on_macos do
    on_arm do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.76/tickloop-aarch64-apple-darwin.tar.gz"
      sha256 "107a30c91ad64298e47ff180d236e20ae179aea0d44a30b6326f0f3b94f43714"
    end
    on_intel do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.76/tickloop-x86_64-apple-darwin.tar.gz"
      sha256 "5730713ba4e6a392dccba5d419586088fef518836232629efa4d723c7bb04403"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.76/tickloop-aarch64-unknown-linux-musl.tar.gz"
      sha256 "a4a6fec23d0cc09c8a15d8a7b23b131237c296f325836d6ccc2841bce38def0f"
    end
    on_intel do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.76/tickloop-x86_64-unknown-linux-musl.tar.gz"
      sha256 "fa8606486213a9d0e8f99a1e940d13d7d0cdb8b8362bfd676f99ea516312aed8"
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
