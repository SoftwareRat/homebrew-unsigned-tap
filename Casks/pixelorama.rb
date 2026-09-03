cask "pixelorama" do
  version "1.1.8"
  sha256 "f3b7912e2323ae035132aa45b41cf3c71fa9ce77cae70613840ac2adf918d486"

  url "https://github.com/Orama-Interactive/Pixelorama/releases/download/v#{version}/Pixelorama-Mac.dmg"
  name "Pixelorama"
  desc "2D sprite editor made with the Godot Engine"
  homepage "https://orama-interactive.itch.io/pixelorama"

  # Upstream disable! date: "2026-09-01", because: :fails_gatekeeper_check

  depends_on macos: :big_sur

  app "Pixelorama.app"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/Pixelorama.app"
  end

  zap trash: "~/Library/Saved Application State/com.orama_interactive.pixelorama.savedState"
end
