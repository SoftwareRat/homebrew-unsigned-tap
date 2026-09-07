cask "youtype" do
  version "0.7.3"
  sha256 :no_check

  url "https://github.com/freefelt/YouType/raw/main/YouType.zip"
  name "YouType"
  desc "Input method helper"
  homepage "https://github.com/freefelt/YouType"

  livecheck do
    url "https://raw.githubusercontent.com/freefelt/YouType/main/appcast.xml"
    strategy :sparkle
  end

  # Upstream disable! date: "2026-09-01", because: :fails_gatekeeper_check

  auto_updates true
  depends_on :macos

  app "YouType.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-r", "-d", "com.apple.quarantine", "#{appdir}/YouType.app"]
  end

  uninstall quit: "com.AVKorotkov.YouType"

  zap trash: [
    "~/Library/Caches/com.AVKorotkov.YouType",
    "~/Library/Preferences/com.AVKorotkov.YouType.plist",
  ]
end
