class Paperboy < Formula
  desc "A Fast & Modern Email Campaign Delivery"
  homepage "https://paperboy.email"
  url "https://github.com/rykov/paperboy/releases/download/v0.2.0/Paperboy_0.2.0_macOS_64bit.tar.gz"
  sha256 "f74a620aaf6c06beb22b12e92df46891af36f0531d8dec02915d55553be8b5af"

  def install
    system "mv", "paperboy", "#{prefix}"
  end
end 
