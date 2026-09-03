cask "assinador-serpro" do
  arch arm: "MacOS-ARM", intel: "x86_64"

  on_arm do
    version "4.5.0"
    sha256 "82c2df5721f030cbf42fcd8c216c983cf9c226a969311bba1906808d292625b9"
  end
  on_intel do
    version "4.4.0"
    sha256 "29dface119b5974b2f47ca365371d78d0c1988f4dedf489bb711cd0faaf7e1f9"
  end

  url "https://artefatos-assinador.serpro.gov.br/downloads/#{version}/Assinador-Serpro-#{version}-#{arch}.pkg"
  name "Assinador Serpro"
  desc "Validate and sign documents using digital certificates"
  homepage "https://artefatos-assinador.serpro.gov.br/"

  livecheck do
    url :homepage
    regex(/href=.*?Assinador[-_]Serpro[-_]v?(\d+(?:\.\d+)+)[_-]#{arch}\.m?pkg/i)
  end

  depends_on :macos

  pkg "Assinador-Serpro-#{version}-#{arch}.pkg"

  # Upstream disable! date: "2026-09-01", because: :fails_gatekeeper_check

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{staged_path}/Assinador-Serpro-#{version}-#{arch}.pkg"
  end

  uninstall pkgutil: "br.gov.serpro.desktop.assinador"

  zap trash: "~/Library/Preferences/org.demoiselle.signer.serpro.desktop.Main.plist"
end
