# frozen_string_literal: true

# Rendered by .github/workflows/release.yml into tickloopai/homebrew-tap; edit the template here.
class Tickloop < Formula
  desc "Terminal AI agent for code and office work, driven by live Ticks"
  homepage "https://tickloop.ai"
  version "0.2.66"

  on_macos do
    on_arm do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.66/tickloop-aarch64-apple-darwin.tar.gz"
      sha256 "51a977e68d889f6b2cd14836cba8920d86cbde155d8b4b67fa359126b87d16ee"
    end
    on_intel do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.66/tickloop-x86_64-apple-darwin.tar.gz"
      sha256 "f9373e0bb346801c85dca15c1002bcd385c72360cab8aa00e4199c4db7c44118"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.66/tickloop-aarch64-unknown-linux-musl.tar.gz"
      sha256 "3162a65dabbc03580e8eeb09fcfeaf2db6b09b7b5f53ff7708cf687c93a85db3"
    end
    on_intel do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.66/tickloop-x86_64-unknown-linux-musl.tar.gz"
      sha256 "e131bf99427c67b980ce8597d42d808b23e72ae7447069ba3e5f20d7bd5a167b"
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
