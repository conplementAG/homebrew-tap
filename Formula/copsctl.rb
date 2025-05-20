class Copsctl < Formula
  desc "Conplement AG Kubernetes developer tooling"
  homepage "https://github.com/conplementAG/copsctl"

  version "0.14.0"

  download_prefix = "https://github.com/conplementAG/copsctl/releases/download"
  arch_string = Hardware::CPU.intel? ? "x86_64" : "arm64"
  darwin_url = "#{download_prefix}/v#{version}/copsctl_Darwin_#{arch_string}.tar.gz"
  linux_url = "#{download_prefix}/v#{version}/copsctl_Linux_#{arch_string}.tar.gz"

  darwin_x86_64_sha = "b2a4379c5d8d6bb50dc4b43080a5e39b7176da3f1ec99a2007a8452d696fa29f"
  darwin_arm64_sha = "b319736119e48604730df3eb895c7699fb94ac056c4534254d5d60a054da7c08"
  linux_x86_64_sha = "ef988796557c350c11f02728a3d5d271bdec458dc7205e8ae3195c42de429e8e"
  linux_arm64_sha = "7c719b17c56c1dda5a3df4686c516c3020b65bee797108325abe9e57faf74cdd"

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
