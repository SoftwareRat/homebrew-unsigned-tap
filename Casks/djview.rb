cask "djview" do
  version "4.12,3.5.29"
  sha256 "eebe6373c896a02d102607566dfa0626ab8541b7816779c3bce5524bf10e65fb"

  url "https://downloads.sourceforge.net/djvu/DjVuLibre-#{version.csv.second}%2BDjView-#{version.csv.first}-universal.dmg"
  name "DjView"
  desc "DjVu viewer and browser plugin"
  homepage "https://djvu.sourceforge.net/"

  livecheck do
    url "https://sourceforge.net/projects/djvu/rss?path=/DjVuLibre_MacOS"
    regex(%r{url=.*?/DjVuLibre[._-](\d+(?:\.\d+)+)%2BDjView[._-](\d+(?:\.\d+)+)[._-]universal(?:-(\d+))?\.dmg}i)
    strategy :sourceforge do |page, regex|
      page.scan(regex).map do |match|
        match[2].present? ? "#{match[1]},#{match[0]},#{match[2]}" : "#{match[1]},#{match[0]}"
      end
    end
  end

  # Upstream disable! date: "2026-09-01", because: :fails_gatekeeper_check

  depends_on :macos

  app "DjView.app"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/DjView.app"
  end

  zap trash: [
    "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/org.djvu.djview.sfl*",
    "~/Library/Preferences/org.djvu.DjView.plist",
    "~/Library/Saved Application State/org.djvu.DjView.savedState",
  ]
end
