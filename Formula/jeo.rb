require 'formula'

class Jeo < Formula
  homepage 'http://jeo.github.io'
  url 'http://ares.boundlessgeo.com/jeo/release/0.3/jeo-0.3-cli.zip'
  sha1 '9a2855ffe66a0c59ca48ed9413ff14a4f2236522'

  def install
    rm Dir['bin/*.{bat,cmd,dll,exe}']
    libexec.install Dir['*']
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    system "#{bin}/jeo", "-v"
  end
end
