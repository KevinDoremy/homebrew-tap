# typed: false
# frozen_string_literal: true

class Searchdeadcode < Formula
  desc "Fast CLI tool to detect dead/unused code in Android projects (Kotlin & Java)"
  homepage "https://github.com/KevinDoremy/SearchDeadCode"
  version "0.5.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/KevinDoremy/SearchDeadCode/releases/download/v0.5.0/searchdeadcode-macos-x86_64"
      sha256 "98eaaebdcb287b299a888d084b2fb85c359796d92517c81449b507e6cc22d914"
    end
    on_arm do
      url "https://github.com/KevinDoremy/SearchDeadCode/releases/download/v0.5.0/searchdeadcode-macos-aarch64"
      sha256 "cac80de24116c1a90f8d4d82a7ef0228a975c1fef15785077c193a15f25be818"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/KevinDoremy/SearchDeadCode/releases/download/v0.5.0/searchdeadcode-linux-x86_64"
      sha256 "084fd07406f18b2708c56aadf3e5ca20d802c2bab23f568a819ec9160d3c3dfb"
    end
    on_arm do
      url "https://github.com/KevinDoremy/SearchDeadCode/releases/download/v0.5.0/searchdeadcode-linux-aarch64"
      sha256 "8611a3271d73e52b628dbc8e1e5cac928ac025398bfc6f20bf4361cf67c9fbd6"
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
