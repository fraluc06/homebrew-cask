cask "copilot-cli@prerelease" do
  arch arm: "arm64", intel: "x64"
  os macos: "darwin", linux: "linux"

  version "1.0.44-1"
  sha256 arm:          "2965f3ea3872b2c5e1f4da6089c7974fd59ad65bbed5c4bc9f1e55b3fe3318f1",
         intel:        "e2fdb74448e8ad23e38137a3fcba27a47ce0ebdb0daacf65add421c36341d142",
         arm64_linux:  "d448a8bddd0783c2a6ef62a4536e175042848201662049da324361715f7eb9bb",
         x86_64_linux: "4fa3beabd26e77ef2cd1f84dd54351c8195542adc583078f95cd0df351a8ff43"

  url "https://github.com/github/copilot-cli/releases/download/v#{version}/copilot-#{os}-#{arch}.tar.gz"
  name "GitHub Copilot CLI"
  desc "Brings the power of Copilot coding agent directly to your terminal"
  homepage "https://docs.github.com/en/copilot/concepts/agents/about-copilot-cli"

  livecheck do
    url :url
    regex(/^v?(\d+(?:[.-]\d+)+)$/i)
    strategy :github_releases do |json, regex|
      json.map do |release|
        next if release["draft"]

        match = release["tag_name"]&.match(regex)
        next if match.blank?

        match[1]
      end
    end
  end

  auto_updates true
  conflicts_with cask: "copilot-cli"
  depends_on macos: ">= :ventura"

  binary "copilot"

  zap trash: "~/.copilot"
end
