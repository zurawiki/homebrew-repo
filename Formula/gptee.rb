class Gptee < Formula
  version = "0.3.3"
  desc "Output from a language model using standard input as the prompt"
  homepage "https://github.com/zurawiki/gptee"
  url "https://github.com/zurawiki/gptee/archive/v" + version.to_s + ".tar.gz"
  sha256 "35a83e922cccf0b65f6db8f6fd6412aa7908b4b2360181a74a464c4104dda033"
  license "MIT"
  head "https://github.com/zurawiki/gptee.git", branch: "main"

  depends_on "rust" => :build

  uses_from_macos "zlib"

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gptee -V")
  end
end