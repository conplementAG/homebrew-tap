class Copsctl < Formula
  desc "Conplement AG Kubernetes developer tooling"
  homepage "https://github.com/conplementAG/copsctl"

  version "0.21.0"

  download_prefix = "https://github.com/conplementAG/copsctl/releases/download"
  arch_string = Hardware::CPU.intel? ? "x86_64" : "arm64"
  darwin_url = "#{download_prefix}/v#{version}/copsctl_Darwin_#{arch_string}.tar.gz"
  linux_url = "#{download_prefix}/v#{version}/copsctl_Linux_#{arch_string}.tar.gz"

  darwin_x86_64_sha = "d107e7d74d2658d036523b61e8d3c4b9eea9465fdc74357cae6bf88cfd7c6c7e"
  darwin_arm64_sha = "9c8330ff6e62c8f3e33e06955a1cd37bd2ca47cb5538d8dffbca9a4d0143ed40"
  linux_x86_64_sha = "24c7830574ea81cf9ccb4a9a67dfdb67c969ca8d662199e5aeedbda7a2f72a95"
  linux_arm64_sha = "8855abb0d34ddbbcd80432bdd2f13293ca359765527f65ecf9f97bd0b09d1254"

  if OS.mac? && Hardware::CPU.intel?
    url darwin_url
    sha256 darwin_x86_64_sha
  end

  if OS.mac? && Hardware::CPU.arm?
    url darwin_url
    sha256 darwin_arm64_sha
  end

  if OS.linux? && Hardware::CPU.intel?
    url linux_url
    sha256 linux_x86_64_sha
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url linux_url
    sha256 linux_arm64_sha
  end

  def install
    bin.install "copsctl"
    generate_completions_from_executable(bin/"copsctl", "completion")
    ohai "Installation complete!"
    puts <<~EOS
      Please check (in a new terminal window) if the tab-completions work.
      If not, completion needs to be configured in your shell.
      See https://docs.brew.sh/Shell-Completion
    EOS
  end

  test do
    assert_match "copsctl version #{version}", shell_output("#{bin}/copsctl --version")
  end
end
