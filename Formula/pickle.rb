class Pickle < Formula
  desc "Local mdbase-backed human approval inbox for agents"
  homepage "https://github.com/nelsonlove/pickle"
  version "0.2.0-nl.1"
  # Upstream declares no license; prebuilt from nelsonlove/pickle release assets.

  on_macos do
    on_arm do
      url "https://github.com/nelsonlove/pickle/releases/download/v0.2.0-nl.1/pickle-aarch64-apple-darwin.tar.gz"
      sha256 "3ce05f229dc3fed8236f2a9227834a0246d282216451e9e6d0eee2aaa0fc89c2"
    end
    on_intel do
      url "https://github.com/nelsonlove/pickle/releases/download/v0.2.0-nl.1/pickle-x86_64-apple-darwin.tar.gz"
      sha256 "608e75171eae63e7bececbb4d1d9fd9ff6e88fa008c26f2ed1af72b5fd7f871d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/nelsonlove/pickle/releases/download/v0.2.0-nl.1/pickle-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4c006c583bcc72c6179e32c373b0d1136482161d27884bdf9c4231e1e08c593b"
    end
  end

  def install
    bin.install "pickle"
  end

  test do
    assert_match "inbox", shell_output("#{bin}/pickle --help 2>&1")
  end
end
