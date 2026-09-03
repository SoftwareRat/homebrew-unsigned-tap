cask "headlamp" do
  arch arm: "arm64", intel: "x64"

  version "0.40.1"
  sha256 arm:   "bb109455be76ca5e9839ef692caf8079cc3cf08abd159de5acec079a6b60ce58",
         intel: "9b8d8762e0b23ca93abea88412d5f0f250030b094cabe4c7a25cfe90fa63d2ce"

  url "https://github.com/headlamp-k8s/headlamp/releases/download/v#{version.sub(/-\d+/, "")}/Headlamp-#{version}-mac-#{arch}.dmg"
  name "Headlamp"
  desc "UI for Kubernetes"
  homepage "https://headlamp.dev/"

  livecheck do
    url :url
    regex(/Headlamp[._-]v?(\d+(?:[.-]\d+)+)-mac-#{arch}/i)
    strategy :github_latest do |json, regex|
      json["assets"]&.map do |asset|
        match = asset["name"]&.match(regex)
        next if match.blank?

        match[1]
      end
    end
  end

  # Upstream disable! date: "2026-09-01", because: :fails_gatekeeper_check

  depends_on :macos

  app "Headlamp.app"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/Headlamp.app"
  end

  uninstall quit: "com.kinvolk.headlamp"

  zap trash: [
    "~/Library/Application Support/Headlamp",
    "~/Library/Logs/Headlamp",
    "~/Library/Preferences/com.kinvolk.headlamp.plist",
  ]
end
