cask "mgm" do
  version "0.0.1"
  
  if Hardware::CPU.intel?
    sha256 "NOT_BUILT"
    url "https://github.com/13shivam/mgm/releases/download/v#{version}/macOS.Gateway.Monitor-#{version}-x64.dmg"
  else
    sha256 "e14acad2190a077c30efe1904bb694dcb11fc5abd2a117603c0b825ecdc52135"
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
    ⚠️  This app is not code-signed. On first launch:
    1. Right-click the app in Applications
    2. Select "Open" from the menu
    3. Click "Open" in the security dialog
    
    Or: System Settings → Privacy & Security → Click "Open Anyway"
    
    macOS Gateway Monitor requires admin privileges for full functionality.
    Run the setup script for passwordless sudo:
      cd /Applications/macOS\ Gateway\ Monitor.app/Contents/Resources/app
      ./setup-admin.sh
  EOS
end
