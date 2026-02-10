cask "clipnest-app" do
  version "0.0.5"
  sha256 "368b19bacf2027cfc2d91401790b2f1515dddfbfa2db0c9a0a48bc5285259177"

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
