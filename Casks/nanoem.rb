cask "nanoem" do
  version "34.10.0"
  sha256 "dd38a010648f9e5cc2b9d319dc5989527134d3482f55d80e6ab012b576af6a2c"

  url "https://github.com/hkrn/nanoem/releases/download/v#{version}/nanoem-v#{version}-macos.zip"
  name "nanoem"
  desc "Cross-platform MMD (MikuMikuDance) compatible implementation"
  homepage "https://github.com/hkrn/nanoem"

  # Upstream disable! date: "2026-09-01", because: :fails_gatekeeper_check

  depends_on :macos

  app "nanoem.app"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/nanoem.app"
  end

  zap trash: [
    "~/Library/Application Support/com.github.nanoem",
    "~/Library/Caches/com.github.nanoem",
    "~/Library/HTTPStorages/com.github.nanoem",
    "~/Library/Preferences/com.github.nanoem.plist",
    "~/Library/Saved Application State/com.github.nanoem.savedState",
  ]
end
