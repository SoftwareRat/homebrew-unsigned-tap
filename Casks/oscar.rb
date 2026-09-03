cask "oscar" do
  arch arm: "ARM", intel: "Intel"

  version "2.0.1"
  sha256 arm:   "78cd674ba7755ddcf505dd870c6e1d366c6e658a57482d91593eb191e611c769",
         intel: "b44aedb2855583457985fd9fc4467983254a24ce51bfb43134e72be64e12194e"

  oscar_version = version.split(".")[0, 2].join

  # Upstream disable! date: "2026-09-01", because: :fails_gatekeeper_check

  on_arm do
    depends_on macos: :ventura
  end
  on_intel do
    depends_on macos: :sequoia
  end

  url "https://www.sleepfiles.com/OSCAR/#{version}/OSCAR#{oscar_version}-#{version}-#{arch}.dmg"
  name "OSCAR"
  desc "CPAP Analysis Reporter"
  homepage "https://www.sleepfiles.com/OSCAR/"

  livecheck do
    url :homepage
    regex(%r{href=.*?/OSCAR\d+[._-](\d+(?:\.\d+)+)[-_].*?\.dmg}i)
  end

  app "OSCAR#{oscar_version}.app"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/OSCAR.app"
  end

  zap trash: [
    "~/Library/Preferences/org.oscar-team.OSCAR.plist",
    "~/Library/Saved Application State/org.oscar-team.OSCAR.savedState",
  ]
end
