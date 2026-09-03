cask "texstudio" do
  arch arm: "-m1"

  version "4.9.1"
  sha256 arm:   "53eeb9b6c2f394fe14c8166aa720ed2b355a00a2304c88ddd855d485653208ab",
         intel: "5e28f4f3986d8e984271bcec04161c9eebc7ceb34ac923c7f0baa0ac0b63921b"

  url "https://github.com/texstudio-org/texstudio/releases/download/#{version}/texstudio-#{version}-osx#{arch}.zip"
  name "TeXstudio"
  desc "LaTeX editor"
  homepage "https://texstudio.org/"

  # Upstream disable! date: "2026-09-01", because: :fails_gatekeeper_check

  depends_on macos: :ventura

  app "texstudio-#{version}-osx#{arch}.app"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/texstudio-#{version}-osx#{arch}.app"
  end

  zap trash: [
    "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/texstudio.sfl*",
    "~/Library/Preferences/texstudio.plist",
    "~/Library/Saved Application State/texstudio.savedState",
  ]
end
