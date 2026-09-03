cask "salesforce-cli" do
  arch arm: "arm64", intel: "x64"

  version "2.127.2,99c2587"
  sha256 arm:   "6674ad8339936311622841bbc7283c433195c97d0cb35565c7c8a5384d2ec89c",
         intel: "c58fbe183b8bf55c5a7c7b3f5917aedbc5cdbae528cfa383579b301f2b633eff"

  url "https://github.com/salesforcecli/cli/releases/download/#{version.csv.first}/sf-v#{version.csv.first}-#{version.csv.second}-#{arch}.pkg"
  name "Salesforce CLI"
  desc "CLI tools for Salesforce"
  homepage "https://developer.salesforce.com/tools/salesforcecli"

  livecheck do
    url "https://developer.salesforce.com/media/salesforce-cli/sf/channels/stable/sf-darwin-#{arch}-buildmanifest"
    strategy :json do |json|
      next if json["version"].blank? || json["sha"].blank?

      "#{json["version"]},#{json["sha"]}"
    end
  end

  depends_on :macos

  pkg "sf-v#{version.csv.first}-#{version.csv.second}-#{arch}.pkg"

  # Upstream disable! date: "2026-09-01", because: :fails_gatekeeper_check

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{staged_path}/sf-v#{version.csv.first}-#{version.csv.second}-#{arch}.pkg"
  end

  uninstall pkgutil: "com.salesforce.cli",
            delete:  [
              "/usr/local/bin/sf",
              "/usr/local/bin/sfdx",
            ]

  zap trash: [
    "~/.cache/sf",
    "~/.config/sf",
    "~/.local/share/sf",
    "~/.sf",
  ]
end
