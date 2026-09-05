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
  depends_on "nelsonlove/tap/hyphen"
  depends_on "pango"
  depends_on "poppler"

  def install
    # Homebrew's lexbor ships a broken pkg-config file (a bare -I), so the
    # build falls back to lexbor's CMake package config. Superenv already puts
    # HOMEBREW_PREFIX on CMAKE_PREFIX_PATH, so nothing to do here.
    system "meson", "setup", "build", *std_meson_args
    system "meson", "compile", "-C", "build", "--verbose"
    system "meson", "install", "-C", "build"

    build_app
  end

  # A formula installs a Unix binary, which Launchpad and Spotlight never see,
  # so wrap it in a Word42.app. Unlike upstream's build-aux/bundle-macos.sh,
  # which copies every dylib for a standalone build, this bundle keeps using
  # the ones in the Cellar -- Homebrew already guarantees they are there.
  def build_app
    contents = prefix/"Word42.app/Contents"
    (contents/"MacOS").mkpath
    (contents/"Resources").mkpath

    # Launch Services refuses a bundle whose main executable is a script
    # (-10669), so the launcher is a compiled stub.
    #
    # It names the hyphenation directory because upstream compiles
    # W42_HYPHEN_DIR to word42's own share/hyphen, where nothing is installed
    # -- the patterns belong to the hyphen keg -- and its remaining fallbacks
    # are hardcoded prefixes. find_dictionary() reads the variable first, so
    # this keeps hyphenation working wherever Homebrew lives.
    hyphen_dir = Formula["nelsonlove/tap/hyphen"].opt_share/"hyphen"
    (buildpath/"launcher.c").write <<~C
      #include <stdlib.h>
      #include <unistd.h>

      int main(int argc, char **argv) {
        (void) argc;
        setenv("W42_HYPHEN_DIR", HYPHEN_DIR, 0);
        execv(WORD42_BIN, argv);
        return 127;
      }
    C
    system ENV.cc, "-O2", "-Wall",
           "-DHYPHEN_DIR=\"#{hyphen_dir}\"",
           "-DWORD42_BIN=\"#{opt_bin}/word42\"",
           buildpath/"launcher.c", "-o", contents/"MacOS/word42"

    # The sizes and their @2x doubles that iconutil expects, from the PNGs
    # upstream ships for the hicolor theme.
    iconset = buildpath/"word42.iconset"
    iconset.mkpath
    {
      "16x16"   => ["icon_16x16"],
      "32x32"   => ["icon_16x16@2x", "icon_32x32"],
      "64x64"   => ["icon_32x32@2x"],
      "128x128" => ["icon_128x128"],
      "256x256" => ["icon_128x128@2x", "icon_256x256"],
    }.each do |dir, names|
      names.each do |name|
        cp buildpath/"data/icons/#{dir}/apps/org.word42.word42.png", iconset/"#{name}.png"
      end
    end
    system "iconutil", "--convert", "icns", iconset, "--output",
           contents/"Resources/word42.icns"

    (contents/"Info.plist").write <<~XML
      <?xml version="1.0" encoding="UTF-8"?>
      <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
      <plist version="1.0">
      <dict>
        <key>CFBundleName</key><string>Word42</string>
        <key>CFBundleDisplayName</key><string>Word42</string>
        <key>CFBundleIdentifier</key><string>org.word42.word42</string>
        <key>CFBundleVersion</key><string>#{version}</string>
        <key>CFBundleShortVersionString</key><string>#{version}</string>
        <key>CFBundlePackageType</key><string>APPL</string>
        <key>CFBundleExecutable</key><string>word42</string>
        <key>CFBundleIconFile</key><string>word42</string>
        <key>LSMinimumSystemVersion</key><string>12.0</string>
        <key>NSHighResolutionCapable</key><true/>
        <key>CFBundleDocumentTypes</key>
        <array>
          <dict>
            <key>CFBundleTypeName</key><string>Rich Text Document</string>
            <key>CFBundleTypeRole</key><string>Editor</string>
            <key>LSItemContentTypes</key><array><string>public.rtf</string></array>
          </dict>
          <dict>
            <key>CFBundleTypeName</key><string>Word Document</string>
            <key>CFBundleTypeRole</key><string>Viewer</string>
            <key>LSItemContentTypes</key><array><string>com.microsoft.word.doc</string></array>
          </dict>
          <dict>
            <key>CFBundleTypeName</key><string>Plain Text</string>
            <key>CFBundleTypeRole</key><string>Editor</string>
            <key>LSItemContentTypes</key><array><string>public.plain-text</string></array>
          </dict>
        </array>
      </dict>
      </plist>
    XML
  end

  def caveats
    <<~EOS
      Word42 is installed as a command, `word42`, and as an app bundle. Copy
      the bundle to Applications for Launchpad and Spotlight to find it --
      neither indexes a symlink, nor anything under #{HOMEBREW_PREFIX}:
        cp -R #{opt_prefix}/Word42.app /Applications/

      The copy survives upgrades: it runs whatever #{opt_bin}/word42
      currently is. Copy it again to pick up a new icon or version.
    EOS
  end

  test do
    assert_match "word42", shell_output("#{bin}/word42 --help 2>&1")

    app = prefix/"Word42.app"
    assert_path_exists app/"Contents/Resources/word42.icns"
    assert_match "org.word42.word42",
                 shell_output("plutil -extract CFBundleIdentifier raw #{app}/Contents/Info.plist")
    # The launcher must reach the real binary, not just exist.
    assert_match "word42", shell_output("#{app}/Contents/MacOS/word42 --help 2>&1")
    # It must also be a Mach-O binary: Launch Services will not open a bundle
    # whose main executable is a script, and running it by hand will not say so.
    assert_match "Mach-O", shell_output("file #{app}/Contents/MacOS/word42")
  end
end
