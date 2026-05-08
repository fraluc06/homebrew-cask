cask "openchamber" do
  arch arm: "arm64", intel: "x64"

  version "1.10.1"
  sha256 arm:   "70f48e286bc103809900ca2a1c482ef76b6d38f86270f14fa17c6803f1e29a82",
         intel: "4b7af2c038b03d1964f3ae5f8e6b8970772414cc8535622f8ad0a2176e75bf88"

  url "https://github.com/openchamber/openchamber/releases/download/v#{version}/OpenChamber-#{version}-#{arch}.dmg"
  name "OpenChamber"
  desc "Rich interface for OpenCode"
  homepage "https://github.com/openchamber/openchamber"

  depends_on macos: ">= :monterey"

  app "OpenChamber.app"

  zap trash: "~/.config/openchamber"
end
