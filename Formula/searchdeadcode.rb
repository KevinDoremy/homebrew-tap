# typed: false
# frozen_string_literal: true

class Searchdeadcode < Formula
  desc "Fast CLI tool to detect dead/unused code in Android projects (Kotlin & Java)"
  homepage "https://github.com/KevinDoremy/SearchDeadCode"
  version "0.8.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/KevinDoremy/SearchDeadCode/releases/download/v0.8.0/searchdeadcode-macos-x86_64"
      sha256 "213d1eb240b7951b2a905d472c99457d84600ae0109fa0c108163de87ad6fc21"
    end
    on_arm do
      url "https://github.com/KevinDoremy/SearchDeadCode/releases/download/v0.8.0/searchdeadcode-macos-aarch64"
      sha256 "8bb9049b8b5efe929a8d32e070e2deaab09168c1946c74bb685a53d157c51802"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/KevinDoremy/SearchDeadCode/releases/download/v0.8.0/searchdeadcode-linux-x86_64"
      sha256 "25826ea5f571624fcaabdcef4457ec70d9acecf743df7e7c157f0185ee4a4065"
    end
    on_arm do
      url "https://github.com/KevinDoremy/SearchDeadCode/releases/download/v0.8.0/searchdeadcode-linux-aarch64"
      sha256 "ac80cbd751ea987ab17d98f6bb14ae7c32636c5263535ec76037db19fa104cfc"
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
