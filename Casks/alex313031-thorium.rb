cask "alex313031-thorium" do
  arch arm: "ARM64", intel: "x64"

  version "M138.0.7204.303"
  sha256  arm:   "01f77352f40445e5c39a838c6e48198a09b64c14b0ec423c83fd9b461e0d7069",
          intel: "9a31c4d3fea1f6a49f2943f30d3400ef7cffbb8ab815567e83049b88652b8778"

  url "https://github.com/Alex313031/Thorium-MacOS/releases/download/#{version}/Thorium_MacOS_#{arch}.dmg"
  name "Thorium"
  desc "Chromium-based web browser"
  homepage "https://thorium.rocks/"

  # Ignore any version that has beta in the name
  livecheck do
    url :url
    regex(/^(M?\d+(?:\.\d+)+)$/i)
    strategy :github_releases do |json, regex|
      json.map do |release|
        next if release["draft"] || release["prerelease"]

        match = release["tag_name"]&.match(regex)
        # Ignore releases that have `Beta` in their names
        next if match.blank? || release["name"]&.match?(/beta/i)

        match[1]
      end
    end
  end

  # Upstream disable! date: "2026-09-01", because: :fails_gatekeeper_check

  depends_on macos: :big_sur

  # shim script (https://github.com/Homebrew/homebrew-cask/issues/18809)
  shimscript = "#{staged_path}/thorium.wrapper.sh"

  app "Thorium.app", target: "Thorium Browser.app"
  binary shimscript, target: "thorium"

  preflight do
    File.write shimscript, <<~EOS
      #!/bin/bash
      exec '#{appdir}/Thorium Browser.app/Contents/MacOS/Thorium' "$@"
    EOS
  end

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/Thorium Browser.app"
  end

  zap trash: [
    "~/Library/Application Support/Thorium",
    "~/Library/Caches/Thorium",
    "~/Library/Preferences/org.chromium.Thorium.plist",
    "~/Library/Saved Application State/org.chromium.Thorium.savedState",
  ]
end
