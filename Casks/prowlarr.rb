cask "prowlarr" do
  arch arm: "arm64", intel: "x64"

  version "2.3.0.5236"
  sha256 arm:   "f4308e14631ac8ec10f627a668bb33301b82b68343bf38892646f678dc84e9e0",
         intel: "af74e48ee670b1fd53d077fdb03ef561b1271cefa45059094fb291ab65e72842"

  url "https://github.com/Prowlarr/Prowlarr/releases/download/v#{version}/Prowlarr.master.#{version}.osx-app-core-#{arch}.zip"
  name "Prowlarr"
  desc "Indexer manager/proxy for various PVR apps"
  homepage "https://prowlarr.com/"

  livecheck do
    url "https://prowlarr.servarr.com/v1/update/master/changes?os=osx&arch=#{arch}"
    strategy :json do |json|
      json.map { |item| item["version"] }
    end
  end

  # Upstream disable! date: "2026-09-01", because: :fails_gatekeeper_check

  auto_updates true
  depends_on macos: :big_sur

  app "Prowlarr.app"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/Prowlarr.app"
  end

  zap trash: "~/.config/Prowlarr"
end
