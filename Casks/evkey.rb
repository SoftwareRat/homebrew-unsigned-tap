cask "evkey" do
  version "3.3.8"
  sha256 :no_check

  url "https://github.com/lamquangminh/EVKey/releases/download/Release/EVKeyMac.zip"
  name "EVKey"
  desc "Vietnamese keyboard"
  homepage "https://evkeyvn.com/"

  livecheck do
    url :homepage
    regex(/EVKeyMac\.zip.*?v?(\d+(?:\.\d+)+)/im)
  end

  # Upstream disable! date: "2026-09-01", because: :fails_gatekeeper_check

  depends_on :macos

  app "EVKey.app"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/EVKey.app"
  end

  zap trash: [
    "~/Library/Containers/com.lamquangminh.evkey",
    "~/Library/Containers/com.lamquangminh.evkeyhelper",
  ]
end
