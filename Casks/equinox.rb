cask "equinox" do
  version "5.0"
  sha256 "52cc1243ca8afd052a720cc4c8a9edf903eea68f2819e018ae0e3f4636606ca1"

  url "https://github.com/rlxone/Equinox/releases/download/v#{version}/Equinox-Installer.dmg"
  name "Equinox"
  desc "Create dynamic wallpapers"
  homepage "https://equinoxmac.com/"

  # Upstream disable! date: "2026-09-01", because: :fails_gatekeeper_check

  depends_on :macos

  app "Equinox.app"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/Equinox.app"
  end

  zap trash: [
    "~/Library/Application Scripts/com.rlxone.equinox",
    "~/Library/Containers/com.rlxone.equinox",
  ]
end
