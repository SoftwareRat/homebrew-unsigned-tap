cask "hashbackup" do
  version "3336"
  sha256 :no_check

  url "https://www.hashbackup.com/download/hb-mac-64bit.tar.gz"
  name "HashBackup"
  desc "Command-line backup program"
  homepage "https://www.hashbackup.com/hashbackup/"

  livecheck do
    url "https://www.hashbackup.com/hashbackup/releases.html"
    regex(/id=["']?_?(\d+)/i)
  end

  # Upstream disable! date: "2026-09-01", because: :fails_gatekeeper_check

  binary "hb"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-r", "-d", "com.apple.quarantine", "#{staged_path}/hb"]
  end

  zap trash: "~/hashbackup"

  caveats do
    requires_rosetta
  end
end
