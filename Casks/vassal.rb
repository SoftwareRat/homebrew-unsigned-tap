cask "vassal" do
  version "3.7.20"
  sha256 "c046c43806f5349d280c4a3890bf223c5d5fbd56095229226cbf3c3feb94340a"

  url "https://github.com/vassalengine/vassal/releases/download/#{version}/VASSAL-#{version}-macos-universal.dmg"
  name "VASSAL"
  desc "Board game engine"
  homepage "https://www.vassalengine.org/"

  livecheck do
    url :url
    strategy :github_latest
  end

  # Upstream disable! date: "2026-09-01", because: :fails_gatekeeper_check

  depends_on :macos

  app "VASSAL.app"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/VASSAL.app"
  end

  zap trash: "~/Library/Application Support/VASSAL"
end
