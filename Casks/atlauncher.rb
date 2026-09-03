cask "atlauncher" do
  version "3.4.40.3"
  sha256 "36a412b22c93d7b98e4d4c17a830320f4741c07c1fecd87d82334eddf30bf93c"

  url "https://github.com/ATLauncher/ATLauncher/releases/download/v#{version}/ATLauncher-#{version}.zip"
  name "ATLauncher"
  desc "Minecraft launcher"
  homepage "https://atlauncher.com/"

  # Upstream disable! date: "2026-09-01", because: :fails_gatekeeper_check

  depends_on :macos

  app "ATLauncher.app"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/ATLauncher.app"
  end

  zap trash: [
    "~/Library/Preferences/com.atlauncher.App.plist",
    "~/Library/Saved Application State/com.atlauncher.App.savedState",
  ]
end
