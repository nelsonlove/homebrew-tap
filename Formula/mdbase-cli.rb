class MdbaseCli < Formula
  desc "CLI for mdbase collections (typed markdown + YAML frontmatter)"
  homepage "https://github.com/callumalpass/mdbase-cli"
  url "https://registry.npmjs.org/mdbase-cli/-/mdbase-cli-0.1.0.tgz"
  sha256 "f53f444ede830e9933a9d4cda9aa63614ca9e58573935b87e069c692978570e4"
  # Upstream declares no license field.

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match(/mdbase/i, shell_output("#{bin}/mdbase --help 2>&1"))
  end
end
