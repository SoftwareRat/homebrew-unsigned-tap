cask "cinco" do
  version "2.0.1"
  sha256 "6b8e07c76c896ee5b79708f3317deb1197ce6c1f87acd45ee740c4423b5a8645"

  url "https://ls5download.cs.tu-dortmund.de/cinco/releases/#{version}/cinco-#{version}-macos.dmg"
  name "Cinco"
  desc "Generator-driven Eclipse IDE for domain-specific graphical modelling tools"
  homepage "https://cinco.scce.info/"

  livecheck do
    url "https://ls5download.cs.tu-dortmund.de/cinco/releases/"
    regex(%r{href=["']?v?(\d+(?:\.\d+)+)/?["' >]}i)
  end

  depends_on :macos

  pkg "Install Cinco.pkg"

  # Upstream disable! date: "2026-09-01", because: :fails_gatekeeper_check

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{staged_path}/Install Cinco.pkg"
  end

  uninstall quit:    "de.jabc.cinco.meta.product.product",
            pkgutil: "de.jabc.cinco.meta.product.product.cinco.pkg.component"

  zap trash: [
    "~/Library/Preferences/de.jabc.cinco.meta.product.product.plist",
    "~/Library/Saved Application State/de.jabc.cinco.meta.product.product.savedState",
  ]

  caveats do
    license "https://www.eclipse.org/legal/epl-v10.html"
    depends_on_java "11"
    requires_rosetta
  end
end
