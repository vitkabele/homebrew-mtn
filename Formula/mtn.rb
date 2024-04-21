class Mtn < Formula
  desc "Saves thumbnails (screenshots) of movie or video files to jpeg files"
  homepage "https://gitlab.com/movie_thumbnailer/mtn/wikis/home"
  url "https://gitlab.com/movie_thumbnailer/mtn/-/archive/v3.5.0/mtn-v3.5.0.tar.gz"
  sha256 "0354e598dcbd3b7ac7f44e6c8b77699c5c7b51691b23e711513d785c3af06933"

  depends_on "ffmpeg"
  depends_on "gd"

  def install
    cd "src" do
      system "make", "GB_F_FONTNAME=Supplemental/Tahoma Bold.ttf"
      system "make", "install", "PREFIX=#{prefix}"
    end
  end

  test do
    system "curl", "--output", "sample.avi", "-L", "https://bitbucket.org/wahibre/mtn/downloads/sample.avi"
    system "echo '918243383bc9a3a8ff37da451f4b6b17f9636769  sample_s.jpg' > checksum"
    system "#{bin}/mtn", "sample.avi"
    system "shasum", "--check", "checksum"
  end
end
