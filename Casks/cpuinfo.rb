cask "cpuinfo" do
  version "1.5.1"
  sha256 "e6037c41db55d6032bfb0c5f6ed6b62d8303a58b1a13a972522253aeebef427a"

  url "https://github.com/yusukeshib/cpuinfo/raw/#{version}/dist/cpuinfo.zip"
  name "cpuinfo"
  desc "CPU meter menu bar app"
  homepage "https://github.com/yusukeshib/cpuinfo"

  # Upstream disable! date: "2026-09-01", because: :fails_gatekeeper_check

  depends_on :macos

  app "cpuinfo.app"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/cpuinfo.app"
  end

  zap trash: [
    "~/Library/Application Scripts/io.fata.shibata.cpuinfo",
    "~/Library/Containers/io.fata.shibata.cpuinfo",
  ]
end
