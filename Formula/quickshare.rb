class Quickshare < Formula
  desc "A CLI to quickly share files and link"
  homepage "https://github.com/squach90/homebrew-quickshare"
  url "https://github.com/squach90/homebrew-quickshare/archive/refs/tags/v1.0.2.tar.gz"
  sha256 "0bbe39b55a4cb3049cc66718db588b530e1bf0054c968313ac657f4530e65cfc"
  version "1.0.2"

  depends_on "gum"

  def install
    bin.install "quickshare.sh" => "quickshare"
  end
end


