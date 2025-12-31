cask "mgm" do
  version "0.0.1"
  
  if Hardware::CPU.intel?
    sha256 "NOT_BUILT"
    url "https://github.com/13shivam/mgm/releases/download/v#{version}/macOS.Gateway.Monitor-#{version}-x64.dmg"
  else
    sha256 "630c45e42f0bddcbd4efde380d2620ede7579eb357a45bca7e10434d0771c04f"
    url "https://github.com/13shivam/mgm/releases/download/v#{version}/macOS.Gateway.Monitor-#{version}-arm64.dmg"
  end
  
  name "macOS Gateway Monitor"
  desc "macOS security and network monitoring tool with real-time process analysis"
  homepage "https://github.com/13shivam/mgm"
  
  app "macOS Gateway Monitor.app"
  
  zap trash: [
    "~/Library/Application Support/macOS Gateway Monitor",
    "~/Library/Preferences/com.enterprise.macos-gateway-monitor.plist",
    "~/Library/Caches/com.enterprise.macos-gateway-monitor",
  ]
  
  caveats <<~EOS
    ⚠️  If you see "damaged" error, run:
      sudo xattr -cr "/Applications/macOS Gateway Monitor.app"
    
    Then open the app normally.
  EOS
end
