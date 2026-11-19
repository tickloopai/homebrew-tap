# frozen_string_literal: true

# Rendered by .github/workflows/release.yml into tickloopai/homebrew-tap; edit the template here.
class Tickloop < Formula
  desc "Terminal AI agent for code and office work, driven by live Ticks"
  homepage "https://tickloop.ai"
  version "0.2.63"

  on_macos do
    on_arm do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.63/tickloop-aarch64-apple-darwin.tar.gz"
      sha256 "dfa8158d1368fe7ad2f008f01badb4fdd9f504b57be5d33fff66a25ad510f2fe"
    end
    on_intel do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.63/tickloop-x86_64-apple-darwin.tar.gz"
      sha256 "6d61e8ed371afa39f5368f493d8f3e7259f3f08a6893815fcec321a23ca6bbb4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.63/tickloop-aarch64-unknown-linux-musl.tar.gz"
      sha256 "dc684c4956402b8723ee04929f9a7b8dcd0a2089003b8c5adf0822f7abd309bc"
    end
    on_intel do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.63/tickloop-x86_64-unknown-linux-musl.tar.gz"
      sha256 "744d394468877664d059b95316cf1d624c18a349939142d8b5ab1c4fe52ab461"
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
