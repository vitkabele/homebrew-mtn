class SssCli < Formula
  desc "Shamir secret share command line interface"
  homepage "https://github.com/dsprenkels/sss-cli"
  url "https://github.com/dsprenkels/sss-cli/archive/v0.1.1.tar.gz"
  sha256 "dd8232b11d968df6f1e21b2492796221a0fc13ee78d99bc2e725faf11159798f"

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
