cask "duckduckgo" do
  version "1.144.0,462"
  sha256 "faeb34067a79508f6ba49e098a9caa1c8790d40af9b291efc8f191c6c6b42f43"

  url "https://staticcdn.duckduckgo.com/macos-desktop-browser/duckduckgo-#{version.csv.first}.#{version.csv.second}.dmg"
  name "DuckDuckGo"
  desc "Web browser focusing on privacy"
  homepage "https://duckduckgo.com/"

  livecheck do
    url "https://staticcdn.duckduckgo.com/macos-desktop-browser/appcast2.xml"
    strategy :sparkle do |items|
      items.find { |item| item.channel.nil? }&.nice_version
    end
  end

  auto_updates true
  depends_on macos: ">= :big_sur"

  app "DuckDuckGo.app"

  zap trash: [
    "~/Library/Caches/com.duckduckgo.macos.browser",
    "~/Library/Containers/com.duckduckgo.macos.browser",
    "~/Library/HTTPStorages/com.duckduckgo.macos.browser",
    "~/Library/Preferences/com.duckduckgo.macos.browser.plist",
    "~/Library/Saved Application State/com.duckduckgo.macos.browser.savedState",
    "~/Library/WebKit/com.duckduckgo.macos.browser",
  ]
end
