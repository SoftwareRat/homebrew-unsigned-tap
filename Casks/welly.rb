cask "welly" do
  version "3.2.0"
  sha256 "504219867e8ceb625d51fc25c7d3e7488db1eca4877a8734aca5bb9494d5f695"

  url "https://github.com/clyang/welly/releases/download/#{version}/Welly.v.#{version}.zip"
  name "Welly"
  desc "BBS client"
  homepage "https://github.com/clyang/welly"

  # Upstream disable! date: "2026-09-01", because: :fails_gatekeeper_check

  auto_updates true
  depends_on :macos

  app "Welly.app"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/Welly.app"
  end

  zap trash: [
    "~/Library/Application Support/Welly",
    "~/Library/Caches/org.net9.Welly",
    "~/Library/Caches/Welly",
    "~/Library/Cookies/org.net9.Welly.binarycookies",
    "~/Library/Preferences/org.net9.Welly.plist",
  ]
end
