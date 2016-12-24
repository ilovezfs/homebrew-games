class Advancemenu < Formula
  desc "Frontend for AdvanceMAME/MESS"
  homepage "http://www.advancemame.it/menu-readme.html"
  url "https://github.com/amadvance/advancemame/releases/download/v3.0/advancemame-3.0.tar.gz"
  sha256 "19077f55ab636ac8e996d87775a1eb86c2ced381cbcd57c1e0c0bf410f4b4101"

  bottle do
    sha256 "17b87afd785fefa91eb2fc1aa6e1ac4b96869d8f9921c958bb45e27a0beed1f7" => :sierra
    sha256 "bfa928fd5353506a31320b9563645c42ce951094b628698992c540cd1fc3260c" => :el_capitan
    sha256 "ada2ad9d75ca6887dd4c2e02c8b62fd3281c1146d56f9028bc730721579492ce" => :yosemite
  end

  depends_on "sdl"

  def install
    ENV.delete "SDKROOT" if MacOS.version == :yosemite
    system "./configure", "--prefix=#{prefix}"
    system "make", "install", "LDFLAGS=#{ENV.ldflags}", "mandir=#{man}"
  end

  test do
    system bin/"advmenu", "--version"
  end
end
