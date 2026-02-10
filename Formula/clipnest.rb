class Clipnest < Formula
  desc "Privacy-first clipboard manager for macOS"
  homepage "https://github.com/AleCo3lho/clipnest"
  url "https://github.com/AleCo3lho/clipnest/archive/refs/tags/v0.0.4.tar.gz"
  sha256 "0388fb081651fdb63096548a2523d32d9f4095f422ec8be0bd84767de4551d74"
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
