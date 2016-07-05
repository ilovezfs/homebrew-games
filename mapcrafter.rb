class Mapcrafter < Formula
  desc "Minecraft map renderer"
  homepage "http://mapcrafter.org"
  url "https://github.com/mapcrafter/mapcrafter/archive/v.2.3.tar.gz"
  sha256 "f7d8ec9620dd5c3f69ecb664e190e7032cf7a79b4b6f2731da06b6a81d7395c8"

  bottle do
    cellar :any
    sha256 "d21c510dda79488850e6bf5f52fdf7dcb97c273426962ebc90a1f96fafc03127" => :yosemite
    sha256 "5b6141324b7187245b9fb5fe64acd1da022e2017bc338e04434e008b76da84b0" => :mavericks
    sha256 "6e6be34d8043a96d98cb9b72d83b6d3ac25c8cdc3425ce7df0b6b7e557dc2081" => :mountain_lion
  end

  needs :cxx11

  depends_on "cmake" => :build
  depends_on "jpeg-turbo"
  depends_on "libpng"

  if MacOS.version < :mavericks
    depends_on "boost" => "c++11"
  else
    depends_on "boost"
  end

  def install
    ENV.cxx11

    args = std_cmake_args
    args << "-DJPEG_INCLUDE_DIR=#{Formula["jpeg-turbo"].opt_include}"
    args << "-DJPEG_LIBRARY=#{Formula["jpeg-turbo"].opt_lib}/libjpeg.dylib"

    system "cmake", ".", *args
    system "make", "install"
  end

  test do
    assert_match(/Mapcrafter/,
      shell_output("#{bin}/mapcrafter --version"))
  end
end
