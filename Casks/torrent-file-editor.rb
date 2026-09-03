cask "torrent-file-editor" do
  version "1.0.1"
  sha256 "65a1d3a324904cf61e9e0caac3d128ff1c7876bb02cf537affdecf013b2b889a"

  url "https://github.com/torrent-file-editor/torrent-file-editor/releases/download/v#{version}/torrent-file-editor-#{version}.dmg"
  name "Torrent File Editor"
  desc "GUI for editing and creating torrent files"
  homepage "https://torrent-file-editor.github.io/"

  # Upstream disable! date: "2026-09-01", because: :fails_gatekeeper_check

  depends_on :macos

  app "Torrent File Editor.app"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/Torrent File Editor.app"
  end

  zap trash: [
    "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/net.sourceforge.torrent-file-editor.sfl*",
    "~/Library/Caches/net.sourceforge.torrent-file-editor",
    "~/Library/Cookies/net.sourceforge.torrent-file-editor.binarycookies",
    "~/Library/Preferences/net.sourceforge.torrent-file-editor.plist",
    "~/Library/Saved Application State/net.sourceforge.torrent-file-editor.savedState",
  ]

  caveats do
    requires_rosetta
  end
end
