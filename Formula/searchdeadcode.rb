# typed: false
# frozen_string_literal: true

class Searchdeadcode < Formula
  desc "Fast CLI tool to detect dead/unused code in Android projects (Kotlin & Java)"
  homepage "https://github.com/KevinDoremy/SearchDeadCode"
  version "0.10.2"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/KevinDoremy/SearchDeadCode/releases/download/v0.10.2/searchdeadcode-macos-x86_64"
      sha256 "084fd632176cb2a495378b81e5e9b7228cd2473efec1f84f67e6f5e4712761ac"
    end
    on_arm do
      url "https://github.com/KevinDoremy/SearchDeadCode/releases/download/v0.10.2/searchdeadcode-macos-aarch64"
      sha256 "368df567e8bc1edaa39826a382300932dde83bd88cde2e9dc35e17747ae287c5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/KevinDoremy/SearchDeadCode/releases/download/v0.10.2/searchdeadcode-linux-x86_64"
      sha256 "875767864f6662dc8c3a7e3c7e159cf8d5042424fe8442fcc783b783f6735f0b"
    end
    on_arm do
      url "https://github.com/KevinDoremy/SearchDeadCode/releases/download/v0.10.2/searchdeadcode-linux-aarch64"
      sha256 "cfbd5aecd2b4cd407f13cd3e0a69c81f630f655ee76934f1f0dd27fd22449ca9"
    end
  end

  def install
    binary_name = "searchdeadcode"
    if OS.mac?
      binary_name = Hardware::CPU.arm? ? "searchdeadcode-macos-aarch64" : "searchdeadcode-macos-x86_64"
    elsif OS.linux?
      binary_name = Hardware::CPU.arm? ? "searchdeadcode-linux-aarch64" : "searchdeadcode-linux-x86_64"
    end

    # The downloaded file doesn't have an extension, rename it
    bin.install Dir["*"].first => "searchdeadcode"
  end

  test do
    assert_match "SearchDeadCode", shell_output("#{bin}/searchdeadcode --help")
  end
end
