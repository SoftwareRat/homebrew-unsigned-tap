cask "qtspim" do
  version "9.1.24"
  sha256 "3842fa065851d4493e139dae500f37dd5dd33f267c69115ec75e68411985ace1"

  url "https://downloads.sourceforge.net/spimsimulator/QtSpim_#{version}_mac.mpkg.zip"
  name "QtSpim"
  desc "Simulator that runs MIPS32 assembly language programmes"
  homepage "https://spimsimulator.sourceforge.net/"

  livecheck do
    url :url
    regex(%r{url=.*?/QtSpim[._-]v?(\d+(?:\.\d+)+)[._-]mac\.(?:m?pkg(?:\.zip)?|dmg)}i)
  end

  depends_on :macos

  pkg "QtSpim.mpkg/Contents/Packages/QtSpim.pkg"

  # Upstream disable! date: "2026-09-01", because: :fails_gatekeeper_check

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{staged_path}/QtSpim.mpkg/Contents/Packages/QtSpim.pkg"
  end

  uninstall pkgutil: "org.larusstone.pkg.QtSpim"

  zap trash: [
    "~/Library/Preferences/org.larus.qtspim.plist",
    "~/Library/Saved Application State/org.larus.qtspim.savedState",
  ]

  caveats do
    requires_rosetta
  end
end
