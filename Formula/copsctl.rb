class Copsctl < Formula
  desc "Conplement AG Kubernetes developer tooling"
  homepage "https://github.com/conplementAG/copsctl"

  version "0.20.0"

  download_prefix = "https://github.com/conplementAG/copsctl/releases/download"
  arch_string = Hardware::CPU.intel? ? "x86_64" : "arm64"
  darwin_url = "#{download_prefix}/v#{version}/copsctl_Darwin_#{arch_string}.tar.gz"
  linux_url = "#{download_prefix}/v#{version}/copsctl_Linux_#{arch_string}.tar.gz"

  darwin_x86_64_sha = "7b0c2c1900d847f94277e8d1ebcfc946b430f9909e78eb191e5b372a1e7356d7"
  darwin_arm64_sha = "240b43f39fe9a42b209c17212e8cc961786f56a2f0f2cfb44fe94d19950df12a"
  linux_x86_64_sha = "770c84f69254dd8e01e5a439db62eee440b379684ff386665bca66bc073131d6"
  linux_arm64_sha = "91eb87b352f35c4f0a70c3901009483802a74f4b383d5623cdbe07cb7232516c"

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
