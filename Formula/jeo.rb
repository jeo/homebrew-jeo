require 'formula'

class Jeo < Formula
  homepage 'http://jeo.io'
  url 'https://github.com/jeo/jeo-cli/releases/download/0.5/jeo-0.5-cli.zip'
  sha1 'f98ec568ac41df9d995cc4bbf33d1639f713a698'

  resource 'gdal' do
    url 'https://github.com/jeo/jeo-cli/releases/download/0.5/gdaljni-1.11.1-osx-x86_64.tgz'
    sha1 '98b5c6520c6bf43a570ab7618879e0b09b2b744d'
  end

  def install
    rm Dir['bin/*.{bat,cmd,dll,exe}']
    libexec.install Dir['*']
    bin.install_symlink Dir["#{libexec}/bin/*"]

    (libexec/'ext').install resource('gdal')
  end

  test do
    system "#{bin}/jeo", "-v"
  end
end
