cask "rowboat" do
  arch arm: "arm64", intel: "x64"

  version "0.3.9"
  sha256 arm:   "ab827c34e662ddcd0de51941791c795d96a955f2dca9cb581d2b52f18912e3a5",
         intel: "c4c3e4ae91721bf5c654c30648737cce6eb8f96b3b6facbcab9aa1497ea98a3d"

  url "https://github.com/rowboatlabs/rowboat/releases/download/v#{version}/Rowboat-darwin-#{arch}-#{version}.zip",
      verified: "github.com/rowboatlabs/rowboat/"
  name "Rowboat"
  desc "Open-source AI coworker, with memory"
  homepage "https://www.rowboatlabs.com/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :monterey"

  app "rowboat.app"

  zap trash: [
    "~/.rowboat",
    "~/Library/Application Support/Rowboat",
  ]
end
