cask "craft-anything" do
  arch arm:   on_system_conditional(macos: "universal", linux: "aarch64"),
       intel: on_system_conditional(macos: "universal", linux: "x86_64")
  os macos: "macos", linux: "linux"
  url_end = on_system_conditional macos: "dmg", linux: "AppImage"

  version "0.6.1"
  sha256 arm:          "bbb777d221a4ffe693323c1b6e625f02e71bfa04d74d32a5d50c4542655ed664",
         intel:        "bbb777d221a4ffe693323c1b6e625f02e71bfa04d74d32a5d50c4542655ed664",
         arm64_linux:  "e1a981f3ff2f2270cb50ceece0f36142db5d8cfe611d53e715f140a6b87083fd",
         x86_64_linux: "7eadde1d74ab42cc838862fe3f831e3cf3c9fa6ba5e2bf04e2824bbc47146134"

  on_macos do
    app "Craft Anything.app"

    zap trash: [
      "~/Library/Application Support/ai.storyteller.craft-anything",
      "~/Library/Application Support/craft-anything",
      "~/Library/Caches/Craft Anything",
    ]
  end
  on_linux do
    app_image "craft-anything-#{version}-linux-#{arch}.AppImage", target: "CraftAnything.AppImage"

    zap trash: [
      "~/.cache/Craft Anything",
      "~/.config/craft-anything",
    ]
  end

  url "https://github.com/storytold/craft-anything/releases/download/v#{version}/craft-anything-#{version}-#{os}-#{arch}.#{url_end}"
  name "Craft Anything"
  desc "Inspects software and rebuilds it with a coding agent"
  homepage "https://getartcraft.com/apps/craft-anything"
end
