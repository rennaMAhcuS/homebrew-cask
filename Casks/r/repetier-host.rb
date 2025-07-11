cask "repetier-host" do
  version "1.2.1"
  sha256 "87aba4161581040c2e618b66887f0c192767ce193c4cd955967d3f4f3d53422d"

  url "https://download1.repetier.com/files/host-mac/Repetier-Host-Mac_#{version.dots_to_underscores}.dmg"
  name "Repetier-Host"
  desc "3D printing application"
  homepage "https://www.repetier.com/"

  livecheck do
    url "https://download1.repetier.com/files/host-mac/rhm-appcast.xml"
    strategy :sparkle, &:short_version
  end

  no_autobump! because: :requires_manual_review

  app "Repetier-Host Mac.app"

  zap trash: [
    "~/Library/Preferences/com.repetier.Repetier-Host-Mac.plist",
    "~/Library/Saved Application State/com.repetier.Repetier-Host-Mac.savedState",
  ]
end
