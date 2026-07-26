# typed: false
# frozen_string_literal: true

class Searchdeadcode < Formula
  desc "Fast CLI tool to detect dead/unused code in Android projects (Kotlin & Java)"
  homepage "https://github.com/KevinDoremy/SearchDeadCode"
  version "0.7.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/KevinDoremy/SearchDeadCode/releases/download/v0.7.0/searchdeadcode-macos-x86_64"
      sha256 "f0c2cfec054f84409b32403edf09001f34fdf56fd31a253cad48b509bae20b5b"
    end
    on_arm do
      url "https://github.com/KevinDoremy/SearchDeadCode/releases/download/v0.7.0/searchdeadcode-macos-aarch64"
      sha256 "7f769599c5ca7c1f5c026352b600886e58407b40286466447f3aa49e7935b738"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/KevinDoremy/SearchDeadCode/releases/download/v0.7.0/searchdeadcode-linux-x86_64"
      sha256 "e8b1b0b17db413900db0bb835d17bd458e173791a40883c767853a3e78bdf1cc"
    end
    on_arm do
      url "https://github.com/KevinDoremy/SearchDeadCode/releases/download/v0.7.0/searchdeadcode-linux-aarch64"
      sha256 "845818c520039997b013bc5fc56ff6224089072c11899cb27dd872dd2f2b8dc1"
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
