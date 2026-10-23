# Rendered by scripts/homebrew-cask from packaging/homebrew/juggler.rb.in in
# juggler-pro, and pushed here by its release workflow on every stable release.
# Edit the template, not this file: the next release overwrites it.
cask "juggler" do
  version "0.7.8"
  sha256 "ddb756ad8b7e2528aab661423fb7cb180be4dd01478218c424f0f79d03318728"

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
  binary "#{appdir}/Juggler.app/Contents/MacOS/juggler"

  uninstall quit: "studio.juggler.juggler"

  zap trash: [
    "~/.juggler",
    "~/Library/Caches/studio.juggler.juggler",
    "~/Library/HTTPStorages/studio.juggler.juggler",
    "~/Library/Logs/Juggler",
    "~/Library/Preferences/studio.juggler.juggler.plist",
    "~/Library/Saved Application State/studio.juggler.juggler.savedState",
    "~/Library/WebKit/studio.juggler.juggler",
  ]
end
