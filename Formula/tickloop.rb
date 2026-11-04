# frozen_string_literal: true

# Rendered by .github/workflows/release.yml into tickloopai/homebrew-tap; edit the template here.
class Tickloop < Formula
  desc "Terminal AI agent for code and office work, driven by live Ticks"
  homepage "https://tickloop.ai"
  version "0.2.40"

  on_macos do
    on_arm do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.40/tickloop-aarch64-apple-darwin.tar.gz"
      sha256 "5b87095ed51dc7127b09d0370ed679fe7cea39ae8ba5095c5a424fdae1163ff9"
    end
    on_intel do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.40/tickloop-x86_64-apple-darwin.tar.gz"
      sha256 "e064698a2c6c9f5060bd291b5cd2997c05cfb078e84958a81d80693acf748385"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.40/tickloop-aarch64-unknown-linux-musl.tar.gz"
      sha256 "6591b4a07d4714357997926f897b8100ecf4b63887528e845ba17bec0e3cdc99"
    end
    on_intel do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.40/tickloop-x86_64-unknown-linux-musl.tar.gz"
      sha256 "19c55acdcb5c8c1c67152471165c6da59b7f3e46bf3ff515b23fb8b0111fe657"
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
