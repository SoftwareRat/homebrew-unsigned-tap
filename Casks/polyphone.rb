cask "polyphone" do
  file_id = on_arch_conditional arm: "157", intel: "158"
  livecheck_arch = on_arch_conditional intel: "_Intel"

  version "2.6.0,#{file_id}"
  sha256 arm:   "9b53047fa33208921ee40f68b6817cb6bbb94379980a537b029a757f45da856e",
         intel: "0dcdff039a011f913cf03a100fbcef5c9dde9744ac0a369531022a43aaf9fd6c"

  url "https://www.polyphone.io/en/software/download?file_id=#{version.csv.second}"
  name "Polyphone"
  desc "Soundfont editor for quickly designing musical instruments"
  homepage "https://www.polyphone.io/en"

  livecheck do
    url "https://www.polyphone.io/en/software"
    regex(
      %r{
        <a[^>]+
        href=["']/en/software/download\?file_id=(\d+)["'][^>]+
        title=["'][^"']*Polyphone[-_](\d+(?:\.\d+)+)[-_]macOS_12#{livecheck_arch}\.dmg
      }ix,
    )
    strategy :page_match do |page, regex|
      page.scan(regex).map do |file_id, version|
        "#{version},#{file_id}"
      end
    end
  end

  # Upstream disable! date: "2026-09-01", because: :fails_gatekeeper_check

  depends_on macos: :monterey

  app "Polyphone.app"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/Polyphone.app"
  end

  zap trash: [
    "~/Library/Preferences/com.polyphone.Polyphone.plist",
    "~/Library/Saved Application State/fr.polyphone.Polyphone.savedState",
  ]
end
