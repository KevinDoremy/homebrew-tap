# typed: false
# frozen_string_literal: true

class Searchdeadcode < Formula
  desc "Fast CLI tool to detect dead/unused code in Android projects (Kotlin & Java)"
  homepage "https://github.com/KevinDoremy/SearchDeadCode"
  version "0.10.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/KevinDoremy/SearchDeadCode/releases/download/v0.10.1/searchdeadcode-macos-x86_64"
      sha256 "c917f8f2957a7a73238fedb47ef4b9859fb38dba1c80faad40ff2afb7539b8d3"
    end
    on_arm do
      url "https://github.com/KevinDoremy/SearchDeadCode/releases/download/v0.10.1/searchdeadcode-macos-aarch64"
      sha256 "f28891b0cd5ae2628791d8599d2372d2fa5a637edb32fb9b90f12358bf195f25"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/KevinDoremy/SearchDeadCode/releases/download/v0.10.1/searchdeadcode-linux-x86_64"
      sha256 "0dd11749dd7b918b34c0a70f73960a7d769630a8bcde48ba1452cbf40ae00f39"
    end
    on_arm do
      url "https://github.com/KevinDoremy/SearchDeadCode/releases/download/v0.10.1/searchdeadcode-linux-aarch64"
      sha256 "8da90f573bc73c307e5eda6e116aba4884d0acd50cbf856f74cce49dd763d1f5"
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
