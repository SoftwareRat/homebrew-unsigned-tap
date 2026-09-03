cask "codeexpander" do
  version :latest
  sha256 :no_check

  url "https://download.floweb.cn/CodeExpander_latest_universal.dmg"
  name "CodeExpander"
  desc "Cloud synchronisation development tool"
  homepage "https://codeexpander.com/"

  # Upstream disable! date: "2026-09-01", because: :fails_gatekeeper_check

  depends_on :macos

  app "CodeExpander.app"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/CodeExpander.app"
  end

  zap trash: [
    "~/.codeexpander",
    "~/Documents/codeexpander",
    "~/Library/Logs/Codeexpander",
    "~/Library/Preferences/com.codeexpander.plist",
    "~/Library/Saved Application State/com.codeexpander.savedState",
  ]
end
