# frozen_string_literal: true

# Rendered by .github/workflows/release.yml into tickloopai/homebrew-tap; edit the template here.
class Tickloop < Formula
  desc "Terminal AI agent for code and office work, driven by live Ticks"
  homepage "https://tickloop.ai"
  version "0.2.24"

  on_macos do
    on_arm do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.24/tickloop-aarch64-apple-darwin.tar.gz"
      sha256 "2ec6bd1361086232d476f26b32dff685005272046687da5e546e501b6fcbd25e"
    end
    on_intel do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.24/tickloop-x86_64-apple-darwin.tar.gz"
      sha256 "72a2ad4fa3f33d19baea4b86503089bd867ac095f06f7eca612e6ea5cfe33174"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.24/tickloop-aarch64-unknown-linux-musl.tar.gz"
      sha256 "936d2b2b7dbd2311e320fa4f4ad4ce4ce3bd0c922965a23b0b364c8945008b0d"
    end
    on_intel do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.24/tickloop-x86_64-unknown-linux-musl.tar.gz"
      sha256 "f074fc29195e68ce83ba47e8a6d9bcdce9a1b11a51436f4e3c5a65d592f226f1"
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
