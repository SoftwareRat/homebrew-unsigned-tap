cask "ankama" do
  version "3.14.2"
  sha256 :no_check

  url "https://launcher.cdn.ankama.com/installers/production/Ankama%20Launcher-Setup.dmg"
  name "Ankama Launcher"
  desc "Video game launcher"
  homepage "https://www.ankama.com/en/launcher"

  livecheck do
    url "https://launcher.cdn.ankama.com/installers/production/latest-mac.yml"
    strategy :electron_builder
  end

  # Upstream disable! date: "2026-09-01", because: :fails_gatekeeper_check

  auto_updates true
  depends_on :macos

  app "Ankama Launcher.app"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/Ankama Launcher.app"
  end

  uninstall quit: "Ankama Launcher"

  zap trash: [
    "~/Library/Application Support/Ankama Launcher",
    "~/Library/Preferences/com.ankama.zaap.plist",
    "~/Library/Saved Application State/com.ankama.zaap.savedState",
  ]

  caveats do
    requires_rosetta
  end
end
