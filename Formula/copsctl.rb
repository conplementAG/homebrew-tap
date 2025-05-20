class Copsctl < Formula
  desc "Conplement AG Kubernetes developer tooling"
  homepage "https://github.com/conplementAG/copsctl"

  version "test-version"

  download_prefix = "https://github.com/conplementAG/copsctl/releases/download"
  arch_string = Hardware::CPU.intel? ? "x86_64" : "arm64"
  darwin_url = "#{download_prefix}/v#{version}/copsctl_Darwin_#{arch_string}.tar.gz"
  linux_url = "#{download_prefix}/v#{version}/copsctl_Linux_#{arch_string}.tar.gz"

  darwin_x86_64_sha = "12"
  darwin_arm64_sha = "34"
  linux_x86_64_sha = "56"
  linux_arm64_sha = "78"

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
