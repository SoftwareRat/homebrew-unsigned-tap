cask "darktable" do
  arch arm: "arm64", intel: "x86_64"

  version "5.4.1"
  sha256 arm:   "23ce74a4d7cbab30dc5e55043f97480b2a4eb1d96d602d529c9f9a428b99d041",
         intel: "d615f7e78af9fb23d7c8017a5d35be50ea13f1ccf89491ef4b927e23eff0f43a"

  on_arm do
    depends_on macos: :sonoma
  end
  on_intel do
    depends_on macos: :sequoia
  end

  url "https://github.com/darktable-org/darktable/releases/download/release-#{version.major_minor_patch}/darktable-#{version}-#{arch}.dmg"
  name "darktable"
  desc "Photography workflow application and raw developer"
  homepage "https://www.darktable.org/"

  livecheck do
    url "https://www.darktable.org/install/"
    regex(/href=.*?darktable[._-]v?(\d+(?:\.\d+)+)[._-]#{arch}\.dmg/i)
  end

  # Upstream disable! date: "2026-09-01", because: :fails_gatekeeper_check

  app "darktable.app"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/darktable.app"
  end

  zap trash: [
    "~/.cache/darktable",
    "~/.config/darktable",
    "~/.local/share/darktable",
    "~/Library/Saved Application State/org.darktable.savedState",
  ]
end
