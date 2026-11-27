# frozen_string_literal: true

# Rendered by .github/workflows/release.yml into tickloopai/homebrew-tap; edit the template here.
class Tickloop < Formula
  desc "Terminal AI agent for code and office work, driven by live Ticks"
  homepage "https://tickloop.ai"
  version "0.2.73"

  on_macos do
    on_arm do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.73/tickloop-aarch64-apple-darwin.tar.gz"
      sha256 "064c23288a5f16b2586ea0df12093e2109dcfb0040e9eef190c1cd8ae74957c1"
    end
    on_intel do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.73/tickloop-x86_64-apple-darwin.tar.gz"
      sha256 "cb0ab496af33b601ad131c507aac768d9310a07fe7f5d7e4b62cc5f3f9bf5fbf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.73/tickloop-aarch64-unknown-linux-musl.tar.gz"
      sha256 "260c178a83ca2041c2c0d7d0b4c849f9693b0e53d53f4413b24581de78e7559b"
    end
    on_intel do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.73/tickloop-x86_64-unknown-linux-musl.tar.gz"
      sha256 "574dfc0418c1723d8e8ddf33fb5b98dcb370b6610a169800f017cf9c2c3442d2"
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
