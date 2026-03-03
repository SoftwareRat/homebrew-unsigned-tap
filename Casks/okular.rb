# unnotarized
cask "other-okular" do
  arch arm: "arm64", intel: "x86_64"

  version "6171"
  sha256 arm:   "a6cf172357c6746f3cde014087d85ccd8ad62e01e24ee7258851c2f296d14954",
         intel: "160f86c075e2340cefc9b9421e6b5607451d663ce3c29deb6a241ecf1c2ef71e"

  url "https://cdn.kde.org/ci-builds/graphics/okular/master/macos-arm64/okular-master-#{version}-macos-clang-#{arch}.dmg"
  name "Okular"
  desc "Document viewer"
  homepage "https://okular.kde.org/"

  livecheck do
    url "https://cdn.kde.org/ci-builds/graphics/okular/master/macos-#{arch}/"
    regex(/okular-master-(\d+)-macos-clang-#{arch}\.dmg/i)
  end

  app "okular.app"

  zap trash: [
    "~/Library/Application Support/okular",
    "~/Library/Preferences/org.kde.okular.plist",
  ]
end