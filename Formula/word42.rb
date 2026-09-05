class Word42 < Formula
  desc "Classic word processor built on GTK 4, Pango and Cairo"
  homepage "https://word42.org"
  url "https://github.com/office-42/word42/archive/refs/tags/1.0.0.tar.gz"
  sha256 "5ac6197daf8398cd3983615551b1400162da758ce458955194381a6564a76eb8"
  license "GPL-3.0-or-later"
  head "https://github.com/office-42/word42.git", branch: "main"

  depends_on "cmake" => :build
  depends_on "meson" => :build
  depends_on "ninja" => :build
  depends_on "pkgconf" => :build

  depends_on "cairo"
  depends_on "enchant"
  depends_on "gdk-pixbuf"
  depends_on "glib"
  depends_on "gtk4"
  depends_on "lexbor"
  depends_on "pango"
  depends_on "poppler"

  def install
    # Homebrew's lexbor ships a broken pkg-config file (a bare -I), so the
    # build falls back to lexbor's CMake package config; point CMake at the
    # Homebrew prefix so it can be found.
    ENV["CMAKE_PREFIX_PATH"] = HOMEBREW_PREFIX

    system "meson", "setup", "build", "--buildtype=release", *std_meson_args
    system "meson", "compile", "-C", "build", "--verbose"
    system "meson", "install", "-C", "build"
  end

  test do
    assert_match "word42", shell_output("#{bin}/word42 --help 2>&1")
  end
end
