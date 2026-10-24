# frozen_string_literal: true

# Rendered by .github/workflows/release.yml into tickloopai/homebrew-tap; edit the template here.
class Tickloop < Formula
  desc "Terminal AI agent for code and office work, driven by live Ticks"
  homepage "https://tickloop.ai"
  version "0.2.22"

  on_macos do
    on_arm do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.22/tickloop-aarch64-apple-darwin.tar.gz"
      sha256 "b545e35e7212b2fb8af137294865e32bfdd05828c023fed77b3d041f7cbd7b7e"
    end
    on_intel do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.22/tickloop-x86_64-apple-darwin.tar.gz"
      sha256 "0c064e5775934976ccc1103a3fc88f1b386dfa31ee908b0a2d9102fcf9e8fd64"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.22/tickloop-aarch64-unknown-linux-musl.tar.gz"
      sha256 "6d83ce4865f66b97fa97b92e756be5687cb1da916cfd73bee7f5f181c841b739"
    end
    on_intel do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.22/tickloop-x86_64-unknown-linux-musl.tar.gz"
      sha256 "b13f8f93e21d3e28da045612b264045d4e099c25b14660d1a980f8668714206d"
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
