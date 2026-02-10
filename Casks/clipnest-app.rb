cask "clipnest-app" do
  version "0.0.1"
  sha256 "0a69078fc26bf36dbc726e7f49de9535074155d29ead7a7b72e6ce1f873c2526"

  url "https://github.com/AleCo3lho/clipnest/releases/download/v#{version}/ClipNest.app.zip"
  name "ClipNest"
  desc "Privacy-first clipboard manager for macOS"
  homepage "https://github.com/AleCo3lho/clipnest"

  depends_on formula: "AleCo3lho/clipnest/clipnest"
  depends_on macos: ">= :tahoe"

  app "ClipNest.app"

  postflight do
    system_command "/opt/homebrew/bin/brew",
                   args: ["services", "start", "AleCo3lho/clipnest/clipnest"],
                   sudo: false
  end

  uninstall quit: "com.clipnest.app"

  zap trash: [
    "/tmp/clipnest.sock",
  ]
end
