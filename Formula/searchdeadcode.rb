# typed: false
# frozen_string_literal: true

class Searchdeadcode < Formula
  desc "Fast CLI tool to detect dead/unused code in Android projects (Kotlin & Java)"
  homepage "https://github.com/KevinDoremy/SearchDeadCode"
  version "0.10.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/KevinDoremy/SearchDeadCode/releases/download/v0.10.0/searchdeadcode-macos-x86_64"
      sha256 "98f7fb1874efb532a541a24d0d469078719130a82e36befb2d6426dced92c1a3"
    end
    on_arm do
      url "https://github.com/KevinDoremy/SearchDeadCode/releases/download/v0.10.0/searchdeadcode-macos-aarch64"
      sha256 "f6afbb877f5d5078b5edcef79f4afc42014eab0d6121222008dd0b7abb260b69"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/KevinDoremy/SearchDeadCode/releases/download/v0.10.0/searchdeadcode-linux-x86_64"
      sha256 "4876d62ef4455719ddf832fb1563f7648872d6464696126e8f19ff0766395612"
    end
    on_arm do
      url "https://github.com/KevinDoremy/SearchDeadCode/releases/download/v0.10.0/searchdeadcode-linux-aarch64"
      sha256 "0886c58878dbb8a5a73d681280b93e2e446075d928ff43bb56eb0d809deda0e2"
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
