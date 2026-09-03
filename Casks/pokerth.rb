cask "pokerth" do
  version "2.0.6"
  sha256 "07c73e0df0b0e379693699f5b704d38c3963cb95e2888e315ed666d1a630202c"

  url "https://downloads.sourceforge.net/pokerth/PokerTH-#{version}.dmg"
  name "PokerTH"
  desc "Free Texas hold'em poker"
  homepage "https://www.pokerth.net/"

  # Upstream disable! date: "2026-09-01", because: :fails_gatekeeper_check

  depends_on macos: :monterey

  app "pokerth.app"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/pokerth.app"
  end

  zap trash: "~/.pokerth"

  caveats do
    requires_rosetta
  end
end
