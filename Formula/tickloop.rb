# frozen_string_literal: true

# Rendered by .github/workflows/release.yml into tickloopai/homebrew-tap; edit the template here.
class Tickloop < Formula
  desc "Terminal AI agent for code and office work, driven by live Ticks"
  homepage "https://tickloop.ai"
  version "0.2.60"

  on_macos do
    on_arm do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.60/tickloop-aarch64-apple-darwin.tar.gz"
      sha256 "fdb55046a9f5a2e9ce9432a35131fdc5f92d22a290c191740aa49491922867fd"
    end
    on_intel do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.60/tickloop-x86_64-apple-darwin.tar.gz"
      sha256 "0f4c9f0692b61cac4214734d8d30a425ec118cbd570086a7946937eb7b0d9dfc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.60/tickloop-aarch64-unknown-linux-musl.tar.gz"
      sha256 "280d8e735fddd2ffb50accfc10b6597574bf0813029a72d758ed4101d427bdeb"
    end
    on_intel do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.60/tickloop-x86_64-unknown-linux-musl.tar.gz"
      sha256 "ac4a7c53a18852b77ed32da74c94b6cb97dbc4e6d4806a234b2ab8f9342f9ddf"
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
