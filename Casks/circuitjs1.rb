cask "circuitjs1" do
  # NOTE: "1" is not a version number, but an intrinsic part of the product name
  arch arm: "arm"

  version "3.1.4js"
  sha256 :no_check

  url "https://www.falstad.com/circuit/offline/CircuitJS1-mac#{arch}.dmg"
  name "Falstad CircuitJS"
  desc "Electronic circuit simulator"
  homepage "https://www.falstad.com/circuit/"

  livecheck do
    url :url
    strategy :extract_plist
  end

  # Upstream disable! date: "2026-09-01", because: :fails_gatekeeper_check

  depends_on :macos

  app "CircuitJS1.app"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/CircuitJS1.app"
  end

  zap trash: [
    "~/Library/Preferences/com.falstad.CircuitJS1.plist",
    "~/Library/Saved Application State/com.falstad.CircuitJS1.savedState",
  ]
end
