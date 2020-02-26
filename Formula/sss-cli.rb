class SssCli < Formula
  desc "Shamir secret share command line interface"
  homepage "https://github.com/dsprenkels/sss-cli"
  url "https://github.com/dsprenkels/sss-cli/archive/v0.1.0.tar.gz"
  sha256 "25295aac4fb4e910ef69578cf1b559cc9f9ed29b75042d3f71621cbb5fca2bb6"

  depends_on "rust"

  def install
    system "cargo", "install", "--root", "#{prefix}"
  end

  test do
    system "sh", "-ec", """
      echo secret > secret.txt
      #{bin}/secret-share-split --count 10 --threshold 5 secret.txt > shares.txt
      head -n 5 shares.txt | #{bin}/secret-share-combine > result.txt
      [ `cat secret.txt` == `cat result.txt` ] 
    """ 
  end
end
