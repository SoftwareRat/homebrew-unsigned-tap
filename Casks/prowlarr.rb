cask "prowlarr" do
  arch arm: "arm64", intel: "x64"

  version "2.3.0.5236"
  sha256 arm:   "f4308e14631ac8ec10f627a668bb33301b82b68343bf38892646f678dc84e9e0",
         intel: "af74e48ee670b1fd53d077fdb03ef561b1271cefa45059094fb291ab65e72842"

  url "https://github.com/Prowlarr/Prowlarr/releases/download/v#{version}/Prowlarr.master.#{version}.osx-app-core-#{arch}.zip",
      verified: "github.com/Prowlarr/Prowlarr/"
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
  depends_on :macos

  app "Prowlarr.app"

  postflight_steps do
    on_macos do
      run "/usr/bin/codesign", args: ["--force", "--deep", "--sign", "-", "{{appdir}}/Prowlarr.app"]
      run "/usr/bin/xattr", args: ["-rd", "com.apple.quarantine", "{{appdir}}/Prowlarr.app"]
    end
  end

  zap trash: "~/.config/Prowlarr"
end
