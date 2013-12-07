require 'formula'

class Jeo < Formula
  homepage 'http://jeo.github.io'
  url 'http://ares.boundlessgeo.com/jeo/release/0.2/jeo-0.2-cli.zip'
  sha1 '668ec7ec5e146d53e44b80b12f152a576ffbc9ee'

  def install
    rm Dir['bin/*.{bat,cmd,dll,exe}']
    libexec.install Dir['*']
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    system "#{bin}/jeo", "-v"
  end
end
