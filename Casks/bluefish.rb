cask "bluefish" do
  version "2.4.0"
  sha256 "a07229868bff403fe2fbdb055a6bcdae8b7294b777b0bfb6153eaeac2ef53bf2"

  url "https://www.bennewitz.com/bluefish/stable/binaries/macosx/Bluefish-#{version}.dmg"
  name "Bluefish"
  desc "Open source code editor"
  homepage "https://bluefish.openoffice.nl/index.html"

  livecheck do
    url "https://www.bennewitz.com/bluefish/stable/binaries/macosx/"
    regex(/href=.*?Bluefish[._-]v?(\d+(?:\.\d+)+)\.dmg/i)
  end

  # Upstream disable! date: "2026-09-01", because: :fails_gatekeeper_check

  depends_on :macos

  app "Bluefish.app"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/Bluefish.app"
  end

  zap trash: [
    "~/.bluefish",
    "~/Library/Preferences/nl.openoffice.bluefish.plist",
    "~/Library/Saved Application State/nl.openoffice.bluefish.savedState",
  ]

  caveats do
    requires_rosetta
  end
end
