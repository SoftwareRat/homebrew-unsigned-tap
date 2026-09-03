cask "cabal" do
  version "8.0.0"
  sha256 "bb62f21d9dc51b31c9fcc4d5a7bc48898270cfd62059efb4265f413093d5050d"

  url "https://github.com/cabal-club/cabal-desktop/releases/download/v#{version}/cabal-desktop-#{version}-mac.dmg"
  name "Cabal"
  desc "Desktop client for the chat platform Cabal"
  homepage "https://cabal.chat/"

  # Upstream disable! date: "2026-09-01", because: :fails_gatekeeper_check

  depends_on :macos

  app "Cabal.app"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/Cabal.app"
  end

  zap trash: [
    "~/.cabal-desktop",
    "~/Library/Application Support/Cabal",
    "~/Library/Preferences/club.cabal.desktop.plist",
    "~/Library/Saved Application State/club.cabal.desktop.savedState",
  ]

  caveats do
    requires_rosetta
  end
end
