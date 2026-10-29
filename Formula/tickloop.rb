# frozen_string_literal: true

# Rendered by .github/workflows/release.yml into tickloopai/homebrew-tap; edit the template here.
class Tickloop < Formula
  desc "Terminal AI agent for code and office work, driven by live Ticks"
  homepage "https://tickloop.ai"
  version "0.2.26"

  on_macos do
    on_arm do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.26/tickloop-aarch64-apple-darwin.tar.gz"
      sha256 "f5653e5d5e10fac1a70fc7b25d8f18f90018f0c92a72783d3c1e81f3c2341e0b"
    end
    on_intel do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.26/tickloop-x86_64-apple-darwin.tar.gz"
      sha256 "7cb05925ed68b0f8eaea8905111313249cca5a0810ee57db1da52b7e76daecc0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.26/tickloop-aarch64-unknown-linux-musl.tar.gz"
      sha256 "b96a0fa9b94aab2b30560a7fa48a352f7f60ff251d8dab1132a9a13f4ad0e7fe"
    end
    on_intel do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.26/tickloop-x86_64-unknown-linux-musl.tar.gz"
      sha256 "03e8d75619fffc6288c33c63e9ee4b823270c1ba9f1c3a46d5dad5f8c6d8407d"
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
