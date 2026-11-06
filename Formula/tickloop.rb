# frozen_string_literal: true

# Rendered by .github/workflows/release.yml into tickloopai/homebrew-tap; edit the template here.
class Tickloop < Formula
  desc "Terminal AI agent for code and office work, driven by live Ticks"
  homepage "https://tickloop.ai"
  version "0.2.43"

  on_macos do
    on_arm do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.43/tickloop-aarch64-apple-darwin.tar.gz"
      sha256 "6285d37a78134a159363dd2e6d506c79cf237e7a1d0895507d12d232c8de0923"
    end
    on_intel do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.43/tickloop-x86_64-apple-darwin.tar.gz"
      sha256 "76803c9055e3dcfc29472c634cd74e3c3cf02ec7d9710a66f08ed1c723a03425"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.43/tickloop-aarch64-unknown-linux-musl.tar.gz"
      sha256 "711782eaaa553b7416328d31ae05de05a11d8c76c8f0dcefd60f193ba0732716"
    end
    on_intel do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.43/tickloop-x86_64-unknown-linux-musl.tar.gz"
      sha256 "f37e4e664e1f0cfca02065fc112aa11c88b87ed0cd1145a1eaacf09bad6febd4"
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
