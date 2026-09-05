class Hyphen < Formula
  desc "Library for high-quality hyphenation and justification"
  homepage "https://github.com/hunspell/hyphen"
  url "https://github.com/hunspell/hyphen/releases/download/v2.8.9/hyphen-2.8.9.tar.gz"
  sha256 "783743daf477de8c4d16e3c74b4d2827377017718d8e17e2d9440210246f6abe"
  license any_of: ["GPL-2.0-or-later", "LGPL-2.1-or-later", "MPL-1.1"]

  # Only the release tarball ships a generated configure; the git tree needs
  # autotools run first.
  head do
    url "https://github.com/hunspell/hyphen.git", branch: "master"

    depends_on "autoconf" => :build
    depends_on "automake" => :build
    depends_on "libtool" => :build
  end

  # `make` rebuilds hyph_en_US.dic from hyphen.tex with patch, awk and perl
  # rather than installing the copy in the tarball. macOS supplies all three,
  # and the result is byte-identical to the shipped file.
  uses_from_macos "perl" => :build

  def install
    system "autoreconf", "--force", "--install", "--verbose" if build.head?

    system "./configure", "--disable-silent-rules", *std_configure_args
    system "make"
    system "make", "check"
    system "make", "install"
  end

  test do
    (testpath/"test.c").write <<~C
      #include <hyphen.h>
      #include <stdio.h>
      #include <stdlib.h>
      #include <string.h>

      int main(void) {
        const char *word = "hyphenation";
        int len = (int) strlen(word);
        char *hyphens = calloc(len + 5, 1);
        char *out = calloc(len * 2 + 1, 1);
        char **rep = NULL;
        int *pos = NULL, *cut = NULL;
        HyphenDict *dict = hnj_hyphen_load("#{pkgshare}/hyph_en_US.dic");

        if (dict == NULL) {
          fprintf(stderr, "could not load hyph_en_US.dic\\n");
          return 1;
        }
        if (hnj_hyphen_hyphenate2(dict, word, len, hyphens, out, &rep, &pos, &cut)) {
          fprintf(stderr, "hyphenation failed\\n");
          return 1;
        }
        printf("%s\\n", out);
        hnj_hyphen_free(dict);
        return 0;
      }
    C

    system ENV.cc, "test.c", "-I#{include}", "-L#{lib}", "-lhyphen", "-o", "test"
    assert_equal "hy=phen=ation", shell_output("./test").chomp
  end
end
