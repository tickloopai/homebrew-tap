# frozen_string_literal: true

# Rendered by .github/workflows/release.yml into tickloopai/homebrew-tap; edit the template here.
class Tickloop < Formula
  desc "Terminal AI agent for code and office work, driven by live Ticks"
  homepage "https://tickloop.ai"
  version "0.2.68"

  on_macos do
    on_arm do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.68/tickloop-aarch64-apple-darwin.tar.gz"
      sha256 "6ef6ebe1371f2b2cf08ecd39d415cd58941c28819a00028cd30c9fb8381df106"
    end
    on_intel do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.68/tickloop-x86_64-apple-darwin.tar.gz"
      sha256 "57bfd3525d3d1a45ea04bceda317c8fa00097ef218e1dc4748a6ae3e6aa01ae0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.68/tickloop-aarch64-unknown-linux-musl.tar.gz"
      sha256 "979f17cc0d26c22ea3950f31cb37ef508123c9442560c30582d3c0024cbf2b06"
    end
    on_intel do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.68/tickloop-x86_64-unknown-linux-musl.tar.gz"
      sha256 "742e120a423e3ddee5c481d490b7c4a9437729bc48a1c1d447dfaf9ec882405d"
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
