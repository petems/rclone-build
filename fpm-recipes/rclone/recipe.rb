class Rclone < FPM::Cookery::Recipe
  name 'rclone'

  version '1.33'
  revision '2'
  description 'Rclone'

  homepage 'http://rclone.org/'
  source "https://github.com/ncw/rclone/releases/download/v#{version}/rclone-v#{version}-linux-amd64.zip"
  sha256 '1263d74c8034ac0144f973931ea02ecef65ed96a19d7000b771d340aeb423348'

  maintainer 'Nick Craig-Wood <nick@craig-wood.com>'

  license 'MIT'

  conflicts 'rclone'
  replaces 'rclone'

  case FPM::Cookery::Facts.target
  when :rpm
    build_depends 'rpm-build'
  end

  build_depends 'unzip'

  def build
    # binaries are pre-compiled from github
    # Still need to define a build method or FPM barfs
  end

  def install
    # binary into path
    bin.install "rclone-v#{version}-linux-amd64/rclone"

    # man page
    man1.install "rclone-v#{version}-linux-amd64/rclone.1"
  end
end
