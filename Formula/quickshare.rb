class Quickshare < Formula
  desc "A CLI to quickly share files and link"
  homepage "https://github.com/squach90/homebrew-quickshare"
  url "https://github.com/squach90/homebrew-quickshare/archive/refs/tags/v1.1.1.tar.gz"
  sha256 "350fbe64838c472efeda01a6e501aa53baed5a729658ebebb255976fb27d5117"
  version "1.1.1"

  depends_on "gum"
  depends_on "qrencode"

  def install
    bin.install "quickshare.sh" => "quickshare"
  end
end


