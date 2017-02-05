class Advancemame < Formula
  desc "MAME with advanced video support"
  homepage "http://www.advancemame.it/"
  url "https://github.com/amadvance/advancemame/releases/download/v3.2/advancemame-3.2.tar.gz"
  sha256 "7fd10d765cc1ce38bb463bf4c7d5947619bc08838a8671a9f3da0bc6d76eb822"

  bottle do
    sha256 "63208837d31d054aa77903d6ec2fadbf7433192190492a3ede42dabe96ad80d2" => :yosemite
    sha256 "16cde98601b01a2936f676119feaa2bd8244ad7c0f3075f69e907c07e2f448d0" => :mavericks
    sha256 "9497d5d422cef467cefbc3a2731745fe204cdd28c36c68b7ff27e714670bbf85" => :mountain_lion
  end

  depends_on "sdl"
  depends_on "freetype"

  def install
    ENV.delete "SDKROOT" if MacOS.version == :yosemite
    system "./configure", "--prefix=#{prefix}"
    system "make", "install", "LDFLAGS=#{ENV.ldflags}", "mandir=#{man}", "docdir=#{doc}"
  end

  test do
    system "#{bin}/advmame", "--version"
  end
end
