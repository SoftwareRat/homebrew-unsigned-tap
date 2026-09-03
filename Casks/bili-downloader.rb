cask "bili-downloader" do
  version "1.7.2"
  sha256 "aacc58eb79d64437b15882502190be17e68656999af6efcc81fa831973115bfa"

  url "https://github.com/JimmyLiang-lzm/biliDownloader_GUI/releases/download/V#{version}/BiliDownloader_for_MacOS_X.dmg"
  name "BiliDownloader"
  desc "BiliBili media downloader"
  homepage "https://github.com/JimmyLiang-lzm/biliDownloader_GUI"

  livecheck do
    url :url
    strategy :github_latest
  end

  # Upstream disable! date: "2026-09-01", because: :fails_gatekeeper_check

  depends_on :macos

  app "biliDownloader_GUI.app"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/biliDownloader_GUI.app"
  end

  zap trash: "~/Library/Saved Application State/biliDownloader_GUI.savedState"

  caveats do
    requires_rosetta
  end
end
