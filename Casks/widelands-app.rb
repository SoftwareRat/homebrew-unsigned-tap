cask "widelands-app" do
  arch arm: "arm64", intel: "x86"

  version "1.3.1"
  sha256 arm:   "f68d29fbeaf2f61c4b94c91956bf454b65734937b7951fb116dd5692f320395c",
         intel: "7f01ec51081a397de05fb9094424d5a2a735ff12fa501a5fb725934f30adc301"

  url "https://github.com/widelands/widelands/releases/download/v#{version}/Widelands-#{version}-macOS12_#{arch}.dmg"
  name "Widelands"
  desc "Free real-time strategy game like Settlers II"
  homepage "https://www.widelands.org/"

  livecheck do
    url :url
    regex(/Widelands[._-]v?(\d+(?:\.\d+)+)[._-]MacOS/i)
    strategy :github_latest do |json, regex|
      json["assets"]&.filter_map do |asset|
        asset["browser_download_url"]&.[](regex, 1)
      end
    end
  end

  # Upstream disable! date: "2026-09-01", because: :fails_gatekeeper_check

  depends_on macos: :big_sur

  app "Widelands.app"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/Widelands.app"
  end

  zap trash: "~/.widelands"
end
