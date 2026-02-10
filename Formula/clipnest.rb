class Clipnest < Formula
  desc "Privacy-first clipboard manager for macOS"
  homepage "https://github.com/AleCo3lho/clipnest"
  url "https://github.com/AleCo3lho/clipnest/archive/refs/tags/v0.0.1.tar.gz"
  sha256 "cd503bd8c35e6530dbb321fad3082f98694c88340f4a062ab98b09faf5e27023"
  license "MIT"

  depends_on "go" => :build
  depends_on :macos

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w", output: bin/"clipnest"), "./cmd/clipnest"
    system "go", "build", *std_go_args(ldflags: "-s -w", output: bin/"clipnestd"), "./cmd/clipnestd"
  end

  service do
    run [opt_bin/"clipnestd"]
    keep_alive true
    log_path var/"log/clipnest.log"
    error_log_path var/"log/clipnest.log"
  end

  test do
    assert_match "clipnest", shell_output("#{bin}/clipnest version")
  end
end
