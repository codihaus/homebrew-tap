cask "devports" do
  version "1.0.0"
  sha256 "0670458475390e7a77e40341df5c402f8073a92d7c4a99848c73de9331e4f598"

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
