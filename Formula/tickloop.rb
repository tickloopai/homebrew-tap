# frozen_string_literal: true

# Rendered by .github/workflows/release.yml into tickloopai/homebrew-tap; edit the template here.
class Tickloop < Formula
  desc "Terminal AI agent for code and office work, driven by live Ticks"
  homepage "https://tickloop.ai"
  version "0.2.42"

  on_macos do
    on_arm do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.42/tickloop-aarch64-apple-darwin.tar.gz"
      sha256 "b71a1fbb8cceaba9a10e96abafc8847d2cf979136160b417c3cecfb82df04de6"
    end
    on_intel do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.42/tickloop-x86_64-apple-darwin.tar.gz"
      sha256 "0663c60c4f32aaada8ac2dc5a58075bcb6112556a98220912bf4a64ed3e0016b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.42/tickloop-aarch64-unknown-linux-musl.tar.gz"
      sha256 "59b8193825a56f4788ec288fc32178605ed66b84c2bfb5dd46e1da14aee3627e"
    end
    on_intel do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.42/tickloop-x86_64-unknown-linux-musl.tar.gz"
      sha256 "d392233e88900c74da4850476b81ce7c12aede19fd52db9593359548f052de0c"
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
