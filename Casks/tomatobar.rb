cask "tomatobar" do
  version "3.6.1"
  sha256 "880d1f4b4474935fca5723ffbda0995376716d8bc94e499ff5a54cbc7b9be702"

  url "https://github.com/ivoronin/TomatoBar/releases/download/v#{version}/TomatoBar-v#{version}.zip"
  name "TomatoBar"
  desc "Menu bar pomodoro timer"
  homepage "https://github.com/ivoronin/TomatoBar"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "TomatoBar.app"

  # Upstream ships an app with no Developer ID signature and no notarisation,
  # so homebrew-cask disabled the cask on 2026-09-01 (fails_gatekeeper_check).
  # Homebrew still quarantines what it downloads, and Gatekeeper then refuses
  # to open the app. Clear the quarantine flag after every install and upgrade.
  postflight_steps do
    run "/usr/bin/xattr",
        args:           ["-dr", "com.apple.quarantine", "{{appdir}}/TomatoBar.app"],
        writable_paths: ["TomatoBar.app"],
        writable_base:  :appdir
  end

  zap trash: [
    "~/Library/Application Scripts/com.github.ivoronin.TomatoBar",
    "~/Library/Containers/com.github.ivoronin.TomatoBar",
  ]
end
