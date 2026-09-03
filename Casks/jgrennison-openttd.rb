cask "jgrennison-openttd" do
  version "0.71.0"
  sha256 "a84e380551723414ffd97414d1e670e069c512178a0838e4393f474018caeee3"

  url "https://github.com/JGRennison/OpenTTD-patches/releases/download/jgrpp-#{version}/openttd-jgrpp-#{version}-macos-universal.dmg"
  name "JGR's OpenTTD Patchpack"
  desc "Collection of patches applied to OpenTTD"
  homepage "https://github.com/JGRennison/OpenTTD-patches/"

  # Upstream disable! date: "2026-09-01", because: :fails_gatekeeper_check

  depends_on :macos

  app "OpenTTD.app"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/OpenTTD.app"
  end

  zap trash: [
    "~/Documents/OpenTTD",
    "~/Library/Application Support/CrashReporter/openttd_*.plist",
    "~/Library/Logs/DiagnosticReports/openttd_*.crash",
    "~/Library/Saved Application State/org.openttd.openttd.jgrpp.savedState",
    "~/Library/Saved Application State/org.openttd.openttd.savedState",
  ]
end
