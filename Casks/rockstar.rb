cask "rockstar" do
  version "1.4"
  sha256 "1b80c0b940f9f6a6f4cf416f6f438298ad88c99db70b704c25c7c548e01bbf73"

  url "https://github.com/hp77-creator/rockstar/releases/download/v#{version}/Rockstar.dmg"
  name "Rockstar"
  desc "A powerful clipboard manager for macOS with Obsidian sync capabilities"
  homepage "https://github.com/hp77-creator/rockstar"

  depends_on macos: ">= :ventura" # Based on LSMinimumSystemVersion in Info.plist (13.0)

  conflicts_with cask: "clipboardmanager"
  app "ClipboardManager.app"

  caveats <<~EOS
    When launching Rockstar for the first time, macOS may show a security warning.
    To resolve this:
    1. Right-click (or Control-click) on the app in Finder
    2. Select "Open" from the context menu
    3. Click "Open Anyway" in the security dialog / You might have to allow it to run from your settings under 
    security tab in `Allow applications from` option
    
    This is a one-time process required by macOS security features.
  EOS

  zap trash: [
    "~/Library/Application Support/Rockstar",
    "~/Library/Preferences/com.hp77.ClipboardManager.plist",
    "~/Library/Caches/Rockstar",
    "~/Library/Logs/Rockstar"
  ]
end
