# frozen_string_literal: true

# Rendered by .github/workflows/release.yml into tickloopai/homebrew-tap; edit the template here.
class Tickloop < Formula
  desc "Terminal AI agent for code and office work, driven by live Ticks"
  homepage "https://tickloop.ai"
  version "0.2.45"

  on_macos do
    on_arm do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.45/tickloop-aarch64-apple-darwin.tar.gz"
      sha256 "cea8561d6f2916bad8207f603eb5f3388cdd933ff112c10d6c31a07b0c9c2d24"
    end
    on_intel do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.45/tickloop-x86_64-apple-darwin.tar.gz"
      sha256 "ae2f0e1d158cf308ca7a08609d49e9caaae1a2309971c5fd22b9a7ed09c145d2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.45/tickloop-aarch64-unknown-linux-musl.tar.gz"
      sha256 "3ac892dab68872a9dca5cdbf08dd0d9c8a199a5a2a20e682a2fa9d00fb1be004"
    end
    on_intel do
      url "https://github.com/tickloopai/homebrew-tap/releases/download/v0.2.45/tickloop-x86_64-unknown-linux-musl.tar.gz"
      sha256 "c2f145d4ab338194a624eff953a68167cecc664bd22fd9b65800df270dad8b5f"
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
