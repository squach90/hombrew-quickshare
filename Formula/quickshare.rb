class QuickShare < Formula
  desc "A CLI to quickly share files and link"
  homepage "https://github.com/squach90/homebrew-quickshare"
  url "https://github.com/squach90/homebrew-quickshare/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "5eba714df46d2f11d13628a75af22c764860034910ac55d41049a3cb0c0ed39c"
  version "1.0.1"

  depends_on "gum"

  def install
    bin.install "quickshare.sh" => "quickshare"
  end
end


