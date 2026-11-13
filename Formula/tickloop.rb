# frozen_string_literal: true

# Rendered by .github/workflows/release.yml into tickloopai/homebrew-tap; edit the template here.
class Tickloop < Formula
  desc "Terminal AI agent for code and office work, driven by live Ticks"
  homepage "https://tickloop.ai"
  version "0.2.49"

  on_macos do
    on_arm do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.49/tickloop-aarch64-apple-darwin.tar.gz"
      sha256 "c23935e376499ebad9ce78950439c53b8bd2036bbd915f1169e2af70af99fbb9"
    end
    on_intel do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.49/tickloop-x86_64-apple-darwin.tar.gz"
      sha256 "98844a5f776a81d88d433a64ff2deeefe599fc3f7fa0b4fee88c895f72291e09"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.49/tickloop-aarch64-unknown-linux-musl.tar.gz"
      sha256 "1a71d3fb1797c6c2046addb194a139b5e821e2583a98320dd87cac9d57ab4785"
    end
    on_intel do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.49/tickloop-x86_64-unknown-linux-musl.tar.gz"
      sha256 "0d76afd04d8eca4596b86d0839886b29bbe43518ebf0e1b7a236df0a70f07f18"
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
