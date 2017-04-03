class Libmtp < Formula
  desc "Implementation of Microsoft's Media Transfer Protocol (MTP)"
  homepage "https://libmtp.sourceforge.io/"
  url "https://downloads.sourceforge.net/project/libmtp/libmtp/1.1.13/libmtp-1.1.13.tar.gz"
  sha256 "494ee02fbfbc316aad75b93263dac00f02a4899f28cfda1decbbd6e26fda6d40"

  bottle do
    cellar :any
    sha256 "636ae6764697e9b4e9c7139aeddbf703e4af538397e40abccfcf986758f16e06" => :sierra
    sha256 "d85bd08a48d040faf70211a58d66c7403e72ea0d5e5d9062a75c01f00c579f21" => :el_capitan
    sha256 "9de77ac16de49e3806fc97e92321dcf730e72cd5b8846098ffc1ffefdcb8593c" => :yosemite
    sha256 "c72299056365814ddd66dd8bd9041a24d98926b583626faeff8216470deb3fee" => :mavericks
  end

  depends_on "pkg-config" => :build
  depends_on "libusb-compat"

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--disable-mtpz"
    system "make", "install"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mtp-getfile")
  end
end
