# typed: false
# frozen_string_literal: true

class Searchdeadcode < Formula
  desc "Fast CLI tool to detect dead/unused code in Android projects (Kotlin & Java)"
  homepage "https://github.com/KevinDoremy/SearchDeadCode"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/KevinDoremy/SearchDeadCode/releases/download/v0.4.0/searchdeadcode-macos-x86_64"
      sha256 "5b4690511563d3d7f517e799c22fab85a7bdda7aaec8184a436a341224af8556"
    end
    on_arm do
      url "https://github.com/KevinDoremy/SearchDeadCode/releases/download/v0.4.0/searchdeadcode-macos-aarch64"
      sha256 "49d1153f61ca1ac88618cbf79f360206fbaa4efb43c6e0362be856500dc4d6ea"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/KevinDoremy/SearchDeadCode/releases/download/v0.4.0/searchdeadcode-linux-x86_64"
      sha256 "cadb703677bad9d94b2eb291a5221b91b765be5a90452342575ee43b18a92d9f"
    end
    on_arm do
      url "https://github.com/KevinDoremy/SearchDeadCode/releases/download/v0.4.0/searchdeadcode-linux-aarch64"
      sha256 "0943e2e8f3dd2700f203327faad4c2d1eb891654d85c0a7f561f353a8eeef0ac"
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
