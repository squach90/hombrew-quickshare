class Quickshare < Formula
  desc "A CLI to quickly share files and link"
  homepage "https://github.com/squach90/homebrew-quickshare"
  url "https://github.com/squach90/homebrew-quickshare/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "3888ac8424f0e7538d61bfc57356f415b2efdf04036eaf9e8f33859613d3a1e9"
  version "1.1.0"

  depends_on "gum"
  depends_on "qrencode"

  def install
    bin.install "quickshare.sh" => "quickshare"
  end
end


