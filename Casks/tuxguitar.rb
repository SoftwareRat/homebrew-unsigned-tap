cask "tuxguitar" do
  version "2.0.1"
  sha256 "b2041622009f6c1663aaeaab123f6b93a1d99550e92d8080d3af918327570912"

  url "https://github.com/helge17/tuxguitar/releases/download/#{version}/tuxguitar-#{version}-macosx-swt-cocoa-x86_64.app.tar.gz"
  name "TuxGuitar"
  desc "Multitrack guitar tablature editor and player"
  homepage "https://www.tuxguitar.app/"

  livecheck do
    url :url
    strategy :github_latest
  end

  # Upstream disable! date: "2026-09-01", because: :fails_gatekeeper_check

  depends_on :macos

  app "tuxguitar-#{version}-macosx-swt-cocoa-x86_64.app"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/tuxguitar-#{version}-macosx-swt-cocoa-x86_64.app"
  end

  zap trash: "~/Library/Application Support/tuxguitar"
end
