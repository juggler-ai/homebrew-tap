# Rendered by scripts/homebrew-cask from packaging/homebrew/juggler.rb.in in
# juggler-pro, and pushed here by its release workflow on every stable release.
# Edit the template, not this file: the next release overwrites it.
cask "juggler" do
  version "0.8.2"
  sha256 "4b18f5ea46546e446f34c70bfa3bbcb694cbbd97807573fd376a292907aed775"

  url "https://github.com/juggler-ai/juggler/releases/download/v#{version}/Juggler-v#{version}.dmg",
      verified: "github.com/juggler-ai/juggler/"
  name "Juggler"
  desc "See and control your coding agent, locally or remotely"
  homepage "https://juggler.studio/"

  livecheck do
    url :url
    strategy :github_latest
  end

  # The app replaces its own bundle in place (Settings → Updates), so brew
  # leaves upgrades to it unless asked with --greedy.
  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Juggler.app"
  binary "#{appdir}/Juggler.app/Contents/Helpers/juggler"

  uninstall quit: "studio.juggler.juggler"

  # The server is a bundle of its own (Contents/Helpers/JugglerServer.app),
  # whose WebKit data, caches and HTTP storage go under its own identifier.
  zap trash: [
    "~/.juggler",
    "~/Library/Caches/studio.juggler.juggler",
    "~/Library/Caches/studio.juggler.juggler.server",
    "~/Library/HTTPStorages/studio.juggler.juggler",
    "~/Library/HTTPStorages/studio.juggler.juggler.server",
    "~/Library/Logs/Juggler",
    "~/Library/Preferences/studio.juggler.juggler.plist",
    "~/Library/Saved Application State/studio.juggler.juggler.savedState",
    "~/Library/WebKit/studio.juggler.juggler",
    "~/Library/WebKit/studio.juggler.juggler.server",
  ]
end
