cask "qlcolorcode" do
  version "4.1.0"
  sha256 "a0f7a97a20cd85eebaef15e399ad29c47711dae2e33e9f51de034f3c8a7a251f"

  url "https://github.com/anthonygelibert/QLColorCode/releases/download/release-#{version}/QLColorCode.qlgenerator.zip"
  name "QLColorCode"
  desc "Quick Look plug-in that renders source code with syntax highlighting"
  homepage "https://github.com/anthonygelibert/QLColorCode"

  depends_on :macos

  qlplugin "QLColorCode.qlgenerator"

  # Upstream deprecate! date: "2025-09-22", because: :no_longer_meets_criteria

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{staged_path}/QLColorCode.qlgenerator"
  end

  zap trash: "~/Library/Preferences/org.n8gray.QLColorCode.plist"
end
