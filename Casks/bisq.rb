cask "bisq" do
  arch arm: "aarch64", intel: "x86_64"

  version "1.10.7"
  sha256 arm:   "71b3d46e56982908e8b64daeb9f8ca62059d6344cc3cecb8f4cfe9b5a0da5873",
         intel: "42b8c6e8716478bd4cb7ea1b9ece6456f8d0aa0a0e071eab66de3c51a3438675"

  url "https://github.com/bisq-network/bisq/releases/download/v#{version}/Bisq-#{arch}-#{version}.dmg"
  name "Bisq"
  desc "Decentralised bitcoin exchange network"
  homepage "https://bisq.network/"

  livecheck do
    url :url
    strategy :github_latest
  end

  # Upstream disable! date: "2026-09-01", because: :fails_gatekeeper_check

  depends_on :macos

  app "Bisq.app"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/Bisq.app"
  end

  zap trash: [
    "~/Library/Application Support/Bisq",
    "~/Library/Saved Application State/io.bisq.CAT.savedState",
  ]
end
