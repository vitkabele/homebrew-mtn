class Mtn < Formula
  desc "Saves thumbnails (screenshots) of movie or video files to jpeg files"
  homepage "https://gitlab.com/movie_thumbnailer/mtn/wikis/home"
  url "https://gitlab.com/movie_thumbnailer/mtn/-/archive/v3.4.2/mtn-v3.4.2.tar.gz"
  sha256 "19b2076c00f5b0ad70c2467189b17f335c6e7ece5d1a01ed8910779f6a5ca52a"

  depends_on "ffmpeg"
  depends_on "gd"

  def install
    system "make", "GB_F_FONTNAME=Supplemental/Tahoma Bold.ttf", "-Csrc", "install", "PREFIX=#{prefix}"
  end

  test do
    system "curl", "--output", "sample.avi", "-L", "https://bitbucket.org/wahibre/mtn/downloads/sample.avi"
    system "echo '918243383bc9a3a8ff37da451f4b6b17f9636769  sample_s.jpg' > checksum"
    system "#{bin}/mtn", "sample.avi"
    system "shasum", "--check", "checksum"
  end
end
