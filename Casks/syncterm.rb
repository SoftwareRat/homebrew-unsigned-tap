cask "syncterm" do
  version "1.7"
  sha256 "669c9861d278221e17c3d4b19c3c551c03b7a2c7d3d7be8e33a85c3d8c94ba97"

  url "https://downloads.sourceforge.net/syncterm/syncterm/syncterm-#{version}/syncterm-#{version}-macos.zip"
  name "SyncTERM"
  desc "BBS terminal program"
  homepage "https://syncterm.bbsdev.net/"

  # Upstream disable! date: "2026-09-01", because: :fails_gatekeeper_check

  depends_on macos: :ventura

  app "SyncTERM.app"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/SyncTERM.app"
  end

  zap trash: [
    "~/Library/Preferences/SyncTERM",
    "~/Library/Preferences/syncterm.plist",
  ]
end
