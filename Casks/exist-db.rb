cask "exist-db" do
  version "6.4.1"
  sha256 "22873e01f000466433e3cf4b91403f78e0285848562585ba4c3eab2c2b63d7d5"

  url "https://github.com/eXist-db/exist/releases/download/eXist-#{version}/eXist-db-#{version}.dmg"
  name "eXist-db"
  desc "Native XML database and application platform"
  homepage "https://exist-db.org/exist/apps/homepage/index.html"

  # Upstream disable! date: "2026-09-01", because: :fails_gatekeeper_check

  depends_on :macos

  app "eXist-db.app"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/eXist-db.app"
  end

  zap trash: "~/Library/Application Support/org.exist"

  caveats do
    depends_on_java "8"
  end
end
