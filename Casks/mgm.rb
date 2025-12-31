cask "mgm" do
  version "0.0.1"
  
  if Hardware::CPU.intel?
    sha256 "INTEL_SHA256_PLACEHOLDER"
    url "https://github.com/13shivam/mgm/releases/download/v#{version}/macOS-Gateway-Monitor-#{version}-Intel.dmg"
  else
    sha256 "02339a1f14b9948a15da4ac6f8c299a9087e7ef73dc2eadfe3ddb29fc0b0ae37"
    url "https://github.com/13shivam/mgm/releases/download/v#{version}/macOS-Gateway-Monitor-#{version}-AppleSilicon.dmg"
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
    macOS Gateway Monitor requires admin privileges for full functionality.
    
    For optimal experience, run the setup script:
      ./setup-admin.sh
    
    Or grant passwordless sudo access manually.
  EOS
end
