cask "powder-player" do
  version "1.60"
  sha256 "66f532b975c12f3d5343e7589dcc6746e1a555416494bd8f6b80642464b7b66a"

  url "https://github.com/jaruba/PowderPlayer/releases/download/v#{version}/PowderPlayer_v#{version}.dmg"
  name "Powder Player"
  desc "Torrent client and streaming media player"
  homepage "https://powder.media/"

  # Upstream disable! date: "2026-09-01", because: :fails_gatekeeper_check

  depends_on :macos

  app "Powder Player.app"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/Powder Player.app"
  end

  zap trash: [
    "~/Library/Application Support/Powder-Player",
    "~/Library/Caches/Powder-Player",
    "~/Library/Preferences/media.powder.player.plist",
    "~/Library/Saved Application State/media.powder.player.savedState",
  ]

  caveats do
    requires_rosetta
  end
end
