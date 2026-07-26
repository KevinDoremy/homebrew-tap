# typed: false
# frozen_string_literal: true

class Searchdeadcode < Formula
  desc "Fast CLI tool to detect dead/unused code in Android projects (Kotlin & Java)"
  homepage "https://github.com/KevinDoremy/SearchDeadCode"
  version "0.9.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/KevinDoremy/SearchDeadCode/releases/download/v0.9.0/searchdeadcode-macos-x86_64"
      sha256 "f26d66fb852412f8147bc41f84aa2b487d83fde085bae04c62d7bb3b636f7d32"
    end
    on_arm do
      url "https://github.com/KevinDoremy/SearchDeadCode/releases/download/v0.9.0/searchdeadcode-macos-aarch64"
      sha256 "35a68ddf3a5af84c3e24666c41f0b83c4763fbf0108eb185d1c93c2323d07bc5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/KevinDoremy/SearchDeadCode/releases/download/v0.9.0/searchdeadcode-linux-x86_64"
      sha256 "fff36df24c81ba60c3ffc8d14c70b4f8c4ab3e3ca10bb82f923653e36daf9050"
    end
    on_arm do
      url "https://github.com/KevinDoremy/SearchDeadCode/releases/download/v0.9.0/searchdeadcode-linux-aarch64"
      sha256 "6a1b932579035ae3f7fdc905f7b36ec308f1c3abe47265fcc3c9ba7252d570db"
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
