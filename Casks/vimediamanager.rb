cask "vimediamanager" do
  version "0.7a23"
  sha256 "e5c1a6960f60936edc0b07cf4b9fdddbf013fa6840162ab3c4b0aa266a17d570"

  url "https://github.com/vidalvanbergen/ViMediaManager/releases/download/v#{version}/vimediamanager.zip"
  name "ViMediaManager"
  desc "Manage digital artifacts for your movie, television and anime collections"
  homepage "https://github.com/vidalvanbergen/ViMediaManager"

  livecheck do
    url :url
    regex(/v?(\d+(?:\.\d+)+[a-z]\d+)/i)
    strategy :github_latest
  end

  # Upstream disable! date: "2026-09-01", because: :fails_gatekeeper_check

  depends_on :macos

  app "ViMediaManager.app"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/ViMediaManager.app"
  end

  zap trash: [
    "~/Library/Application Support/ViMediaManager",
    "~/Library/Caches/com.vidalvanbergen.vimediamanager-alpha",
    "~/Library/Preferences/com.vidalvanbergen.vimediamanager-alpha.plist",
    "~/Library/Saved Application State/com.vidalvanbergen.vimediamanager-alpha.savedState",
  ]
end
