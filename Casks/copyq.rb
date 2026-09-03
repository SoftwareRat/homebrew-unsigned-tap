cask "copyq" do
  version "13.0.0"

  on_arm do
    sha256 "2eb743cc57a97fde6c71d6ec0587408ae2beb41939699117d32b74e68882e77e"

    url "https://github.com/hluk/CopyQ/releases/download/v#{version}/CopyQ-macos-13-m1.dmg.zip"

    depends_on macos: :monterey
  end
  on_intel do
    sha256 "12087e0b9788d8e2b8e055759444346ffbe8901189219c941a3e3d631784bf98"

    url "https://github.com/hluk/CopyQ/releases/download/v#{version}/CopyQ-macos-13.dmg.zip"

    depends_on macos: :ventura
  end

  name "CopyQ"
  desc "Clipboard manager with advanced features"
  homepage "https://hluk.github.io/CopyQ/"

  livecheck do
    url :url
    strategy :github_latest
  end

  # Upstream disable! date: "2026-09-01", because: :fails_gatekeeper_check

  app "CopyQ.app"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/CopyQ.app"
  end

  zap trash: [
    "~/.config/copyq",
    "~/Library/Application Support/copyq",
    "~/Library/Application Support/copyq.log",
    "~/Library/Preferences/com.copyq.copyq.plist",
  ]

  caveats do
    unsigned_accessibility
  end
end
