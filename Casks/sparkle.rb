cask "sparkle" do
  version "2.9.0"
  sha256 "01e0f0ebf6614061ea816d414de50f937d64ffa6822ad572243031ca3676fe19"

  url "https://github.com/sparkle-project/Sparkle/releases/download/#{version}/Sparkle-#{version}.tar.xz"
  name "Sparkle"
  desc "Software update framework for Cocoa developers"
  homepage "https://sparkle-project.org/"

  livecheck do
    url :url
    strategy :github_latest
  end

  # Upstream disable! date: "2026-09-01", because: :fails_gatekeeper_check

  depends_on :macos

  app "Sparkle Test App.app"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/Sparkle Test App.app"
  end

  zap trash: [
    "~/Library/Application Scripts/org.sparkle-project.Downloader",
    "~/Library/Application Scripts/org.sparkle-project.SparkleTestApp",
    "~/Library/Containers/org.sparkle-project.Downloader",
    "~/Library/Containers/org.sparkle-project.SparkleTestApp",
    "~/Library/Preferences/org.sparkle-project.SparkleTestApp.plist",
  ]
end
