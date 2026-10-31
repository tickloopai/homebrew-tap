# frozen_string_literal: true

# Rendered by .github/workflows/release.yml into tickloopai/homebrew-tap; edit the template here.
class Tickloop < Formula
  desc "Terminal AI agent for code and office work, driven by live Ticks"
  homepage "https://tickloop.ai"
  version "0.2.28"

  on_macos do
    on_arm do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.28/tickloop-aarch64-apple-darwin.tar.gz"
      sha256 "b13b81dd3dd7a3849f03797a5ee1439acfdac7e370f2d42f0eaa0145c6a93c01"
    end
    on_intel do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.28/tickloop-x86_64-apple-darwin.tar.gz"
      sha256 "67003ff1e017b6ddaf09ed6dff57ec89c2e085e471f2c38b7d869efa502284eb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.28/tickloop-aarch64-unknown-linux-musl.tar.gz"
      sha256 "77b5309935bf8cf0a65b556bf4bb0b185b6a68484a2ea8dfcddcf44e0c2c28de"
    end
    on_intel do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.28/tickloop-x86_64-unknown-linux-musl.tar.gz"
      sha256 "440225bc755085a9998266da182ee8d0868bdb76875b2be433e40788f5ecb5cc"
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
