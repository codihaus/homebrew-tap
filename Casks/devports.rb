cask "devports" do
  version "1.0.0"
  sha256 "e3c72f2b6d9e12ef984c5affd28135a0e23145121f01227bd7435da49c615833"

  url "https://github.com/codihaus/devports/releases/download/v#{version}/DevPorts.app.zip"
  name "DevPorts"
  desc "Tiny macOS menu bar app for monitoring local dev servers and ports"
  homepage "https://github.com/codihaus/devports"

  depends_on macos: ">= :sonoma"

  app "DevPorts.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/DevPorts.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/LaunchAgents/com.devports.app.plist",
  ]
end
