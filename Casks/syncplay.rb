cask "syncplay" do
  version "1.7.5"
  sha256 "7742ff6e2f4b702f8f85f142e79f6e5d9416ae45d7393a1d849f21e2fdaeecba"

  url "https://github.com/Syncplay/syncplay/releases/download/v#{version}/Syncplay_#{version}.dmg"
  name "Syncplay"
  desc "Synchronize video playback across multiple media players over the network"
  homepage "https://syncplay.pl/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "Syncplay.app"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/Syncplay.app"
  end
end
