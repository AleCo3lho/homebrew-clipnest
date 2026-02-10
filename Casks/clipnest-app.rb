cask "clipnest-app" do
  version "0.0.4"
  sha256 "0dd523e0759be59dde3c5e1f2badfaff1fd49ef0b7b8f78141260737e8922987"

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
