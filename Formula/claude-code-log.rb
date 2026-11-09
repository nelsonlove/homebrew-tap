class ClaudeCodeLog < Formula
  include Language::Python::Virtualenv

  desc "Convert Claude Code transcripts to HTML and browse them in a TUI"
  homepage "https://github.com/daaain/claude-code-log"
  url "https://files.pythonhosted.org/packages/ca/1f/cef0bc2488467179e75579576b99b10678f882a0c0dfd68e0f07ca117a33/claude_code_log-1.7.0.tar.gz"
  sha256 "c30b9463066429cabde6216b7e43c1f3721144517568eda69588c39b6341271e"
  license "MIT"

  depends_on "pydantic" => :no_linkage
  depends_on "python@3.15"

  pypi_packages exclude_packages: "pydantic"

  resource "click" do
    url "https://files.pythonhosted.org/packages/45/37/edbf1b0707709013c0cf2e8317e03d97ed29bf4cac709fe328904ae92a38/click-8.5.1.tar.gz"
    sha256 "9bbfada76703fd1d784b83eea012e3e8c6a001a876543ef104fa56aaaeb072b4"
  end

  resource "dateparser" do
    url "https://files.pythonhosted.org/packages/da/c6/8bb3f0584e7affe13f092906b42fac0a22b6375bf80ed3896bb31fdcb497/dateparser-1.5.0.tar.gz"
    sha256 "08d62f2c00d3a1e806fc59d40c79e7554e31d84d3b8c6145820af051c92e7292"
  end

  resource "gitdb" do
    url "https://files.pythonhosted.org/packages/72/94/63b0fc47eb32792c7ba1fe1b694daec9a63620db1e313033d18140c2320a/gitdb-4.0.12.tar.gz"
    sha256 "5ef71f855d191a3326fcfbc0d5da835f26b13fbcba60c32c21091c349ffdb571"
  end

  resource "gitpython" do
    url "https://files.pythonhosted.org/packages/c0/ff/fee293f1ec3e1b64db6eb270e00964f29c086d769201474cedb8d1608930/gitpython-3.2.1.tar.gz"
    sha256 "0f1229ec5c057bdabdeeda8bda4f17bda679ab33dbccc00f24e6a480553c8613"
  end

  resource "jinja2" do
    url "https://files.pythonhosted.org/packages/df/bf/f7da0350254c0ed7c72f3e33cef02e048281fec7ecec5f032d4aac52226b/jinja2-3.1.6.tar.gz"
    sha256 "0137fb05990d35f1275a587e9aee6d56da821fc83491a0fb838183be43f66d6d"
  end

  resource "linkify-it-py" do
    url "https://files.pythonhosted.org/packages/45/98/7a1a5f31fd5c7ba93e963b168e244b8e3dd705b3d2a718e3c3307583bf57/linkify_it_py-2.2.0.tar.gz"
    sha256 "907acd2d17ac1fbb9ddb62c8957ccbd6158cac602231a15c3b0cd1e215f03cee"
  end

  resource "markdown-it-py" do
    url "https://files.pythonhosted.org/packages/06/ff/7841249c247aa650a76b9ee4bbaeae59370dc8bfd2f6c01f3630c35eb134/markdown_it_py-4.2.0.tar.gz"
    sha256 "04a21681d6fbb623de53f6f364d352309d4094dd4194040a10fd51833e418d49"
  end

  resource "markupsafe" do
    url "https://files.pythonhosted.org/packages/38/9b/e422a865e1d5d57d0e509b4e0bf1c1a70a7f6382c29a5aa428df994c8bc8/markupsafe-3.0.4.tar.gz"
    sha256 "2e9ad7dd851bf45fab9f75cbff4cb493fee9979e8d8c7c9c3ee119022518edd6"
  end

  resource "mdit-py-plugins" do
    url "https://files.pythonhosted.org/packages/59/fc/f8d0863f8862f25602c0404d75568e89fb6b4109804645e5cdfb1be5cf56/mdit_py_plugins-0.6.1.tar.gz"
    sha256 "a2bca0f039f39dbd35fb74ae1b5f998608c437463371f0ff7f49a19a17a114d0"
  end

  resource "mdurl" do
    url "https://files.pythonhosted.org/packages/d6/54/cfe61301667036ec958cb99bd3efefba235e65cdeb9c84d24a8293ba1d90/mdurl-0.1.2.tar.gz"
    sha256 "bb413d29f5eea38f31dd4754dd7377d4465116fb207585f97bf925588687c1ba"
  end

  resource "packaging" do
    url "https://files.pythonhosted.org/packages/7d/fa/3944b40b07da9ce895c0e6303a5ab7d53da063554f534556b134a54d6093/packaging-26.3.tar.gz"
    sha256 "94edc256424af38762eb31306eed28beb9f0efc50a8837492c9d6fd6004aed79"
  end

  resource "platformdirs" do
    url "https://files.pythonhosted.org/packages/d7/9a/8475be631fb33ca1466915e70fd594c42a4e84b512db650eaa14f90fe75d/platformdirs-4.14.5.tar.gz"
    sha256 "32e9921db7385aa8169bee4fe9501923e5715ba9fb7ea3b9c69b0d8e0639f7a1"
  end

  resource "pygments" do
    url "https://files.pythonhosted.org/packages/49/2e/ced460408999b33da6b31b0021b0f37d329e202d4169aeb164493778f25b/pygments-2.21.0.tar.gz"
    sha256 "610ca751c9bc2492b38eb9a38a7fbc93edbbb2d7182edaf34e66ae493dee5c8c"
  end

  resource "python-dateutil" do
    url "https://files.pythonhosted.org/packages/18/39/b3927f3616f6223832f9b760e4208e8a7c7e1dea2b4d9ad7d32a5d214c3a/python_dateutil-4.0.0.tar.gz"
    sha256 "d7295ff14fdc0f92f662100bfb6c551d160ca090f2939f1ec5b9794265c03f06"
  end

  resource "pytz" do
    url "https://files.pythonhosted.org/packages/f5/b0/168030b0bfcc334cf09fa3313afdb888d892c8a0027324683d1de0ec277e/pytz-2026.6.tar.gz"
    sha256 "3b0fc2727707663d6e517936f444fd8a8b240f1fc32f4bf7ee03274245945284"
  end

  resource "quickjs-ng" do
    url "https://files.pythonhosted.org/packages/dc/0f/5b54f3cc785cd548bc30bca49a802aae24a7c38b0b51e49dba975fd78b82/quickjs_ng-0.15.1.1.tar.gz"
    sha256 "b3a482dea35e8c05a051c80f26a8b1672b4907ede586df57296c9cb3b03e775b"
  end

  resource "regex" do
    url "https://files.pythonhosted.org/packages/f1/54/e3bf7a314a5e5d0bab5455cfcfc7634ca136fc8b249a7c15c829e88b00f2/regex-2026.11.7.tar.gz"
    sha256 "8eedab0d8ac69b0602628bc59ab559d09007ff3bcd92aa740e62b10315403007"
  end

  resource "rich" do
    url "https://files.pythonhosted.org/packages/c0/8f/0722ca900cc807c13a6a0c696dacf35430f72e0ec571c4275d2371fca3e9/rich-15.0.0.tar.gz"
    sha256 "edd07a4824c6b40189fb7ac9bc4c52536e9780fbbfbddf6f1e2502c31b068c36"
  end

  resource "smmap" do
    url "https://files.pythonhosted.org/packages/1f/ea/49c993d6dfdd7338c9b1000a0f36817ed7ec84577ae2e52f890d1a4ff909/smmap-5.0.3.tar.gz"
    sha256 "4d9debb8b99007ae47165abc08670bd74cb74b5227dda7f643eccc4e9eb5642c"
  end

  resource "textual" do
    url "https://files.pythonhosted.org/packages/00/21/39a76b01bd5eea82a04baaca7580e105d8c59450df03998345bb2cfb307b/textual-8.2.8.tar.gz"
    sha256 "3f106a9fbc73e39dd266c9712432087de78a6d644084c7c241d6a25c3169115b"
  end

  resource "toml" do
    url "https://files.pythonhosted.org/packages/be/ba/1f744cdc819428fc6b5084ec34d9b30660f6f9daaf70eead706e3203ec3c/toml-0.10.2.tar.gz"
    sha256 "b3bda1d108d5dd99f4a20d24d9c348e91c4db7ab1b749200bded2f839ccbe68f"
  end

  resource "tzdata" do
    url "https://files.pythonhosted.org/packages/7a/29/6a1391d31cd00ff9e927215a224a880e1e84e826b64ba80a499e51c074d8/tzdata-2026.6.tar.gz"
    sha256 "85d2cd9c09f81f0bb29db27759fc83af4f1e620efb814f8c5bf8b4cc4feece6d"
  end

  resource "tzlocal" do
    url "https://files.pythonhosted.org/packages/d8/89/2bd035df331499589fc92e59375c17c6cea6a500453b2c5f6a6ec9572825/tzlocal-5.4.5.tar.gz"
    sha256 "ba976898bad27945178c9ca25c222c19e322b30c10342b9f40b46714f70d2d5f"
  end

  resource "wenmode" do
    url "https://files.pythonhosted.org/packages/3b/2f/9538fb2a2ecb35235c2ca62ded3021683fb8afbe7c8cce5df73de678b78f/wenmode-0.15.3.tar.gz"
    sha256 "ffd930245931b1b0346d7b6e151ad84c21d97b9145c219e4d7fa07981691282f"
  end

  # The quickjs-ng 0.15.1.1 sdist leaves out four headers that the QuickJS-NG
  # 0.15.1 sources it vendors include. Every file it does ship is identical to
  # that tag, so the missing ones come from the same tag.
  resource "quickjs-ng-sources" do
    url "https://github.com/quickjs-ng/quickjs/archive/refs/tags/v0.15.1.tar.gz"
    sha256 "c4e813951b7c46845096a948e978c620b11ab4cf5fd622ca09c727ec31f42623"
  end

  def install
    venv = virtualenv_create(libexec, "python3.15")
    resource("quickjs-ng").stage do
      vendored = Pathname.pwd/"upstream-quickjs"
      resource("quickjs-ng-sources").stage do
        %w[
          builtin-array-fromasync.h
          builtin-iterator-zip-keyed.h
          builtin-iterator-zip.h
          quickjs-c-atomics.h
        ].each { |header| cp header, vendored }
      end
      venv.pip_install Pathname.pwd
    end
    venv.pip_install resources.reject { |r| %w[quickjs-ng quickjs-ng-sources].include?(r.name) }
    venv.pip_install_and_link buildpath
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/claude-code-log --version")

    (testpath/"session.jsonl").write <<~JSON
      {"type":"user","uuid":"00000000-0000-0000-0000-000000000001","parentUuid":null,"sessionId":"brew-test","timestamp":"2026-01-01T00:00:00.000Z","isSidechain":false,"userType":"external","cwd":"/tmp","version":"2.0.0","message":{"role":"user","content":"hello from homebrew"}}
    JSON
    system bin/"claude-code-log", testpath/"session.jsonl", "-o", testpath/"out.md"
    assert_match "hello from homebrew", (testpath/"out.md").read
  end
end
