cask "quicklook-json" do
  version "2,1.0"
  sha256 :no_check

  url "http://www.sagtau.com/media/QuickLookJSON.qlgenerator.zip"
  name "quick look JSON"
  desc "Quick Look plugin for JSON files"
  homepage "http://www.sagtau.com/quicklookjson.html"

  depends_on :macos

  qlplugin "QuickLookJSON.qlgenerator"

  # Upstream disable! date: "2025-12-23", because: :no_longer_meets_criteria

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{staged_path}/QuickLookJSON.qlgenerator"
  end

  # No zap stanza required
end
