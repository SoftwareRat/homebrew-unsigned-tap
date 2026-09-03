cask "olympus" do
  version "5355"
  sha256 "f6059b3fdac15eca6533cb5f618849d8787db3a738428c97d6468d514d8fcd96"

  url "https://dev.azure.com/EverestAPI/Olympus/_apis/build/builds/#{version}/artifacts?artifactName=macos.main&$format=zip"
  name "Olympus"
  desc "Everest (Mod loader for video games Celeste) installer / manager"
  homepage "https://everestapi.github.io/"

  livecheck do
    url "https://dev.azure.com/EverestAPI/Olympus/_apis/build/builds"
    strategy :json do |json|
      json["value"]&.map do |build|
        build["id"]&.to_s if build["sourceBranch"] == "refs/heads/stable"
      end
    end
  end

  # Upstream disable! date: "2026-09-01", because: :fails_gatekeeper_check

  depends_on :macos
  container nested: "macos.main/dist.zip"

  app "Olympus.app"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/Olympus.app"
  end

  zap trash: [
    "~/Library/Application Support/Olympus",
    "~/Library/Saved Application State/everest.olympus.savedState",
  ]
end
