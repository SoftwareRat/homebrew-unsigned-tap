cask "warzone-2100" do
  version "4.6.3"
  sha256 "22e90a76b051fc340fc1f9d95a51d24cbefbd4cfb917879b10fa6225cfb397de"

  url "https://github.com/Warzone2100/warzone2100/releases/download/#{version}/warzone2100_macOS_universal.zip"
  name "Warzone 2100"
  desc "Free and open-source real time strategy game"
  homepage "https://wz2100.net/"

  livecheck do
    url :url
    strategy :github_latest
  end

  # Upstream disable! date: "2026-09-01", because: :fails_gatekeeper_check

  depends_on :macos

  app "Warzone 2100.app"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/Warzone 2100.app"
  end

  zap trash: [
    "~/Library/Application Support/Warzone 2100*",
    "~/Library/Saved Application State/net.wz2100.Warzone2100.savedState",
  ]
end
