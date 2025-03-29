class QuickShare < Formula
  desc "A CLI to quickly share files and link"
  homepage "https://github.com/squach90/homebrew-quickshare"
  url "https://github.com/squach90/homebrew-quickshare/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  version "1.0.0"

  depends_on "gum"

  def install
    bin.install "quickshare.sh" => "quickshare"
  end
end


