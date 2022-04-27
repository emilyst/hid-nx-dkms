# Maintainer: Emily Strickland <linux(at)emily(dot)st>

_pkgbase=hid-nintendo-dkms
pkgname=hid-nintendo-dkms
pkgver=v1.6
pkgrel=1
pkgdesc='Nintendo Switch HID driver with NSO controller support'
url=https://github.com/emilyst/hid-nintendo
arch=(any)
license=(GPL)
depends=(dkms)
provides=(hid-nintendo-dkms)
conflicts=(hid-nintendo-nso-dkms)
source=(
  Makefile
  hid-nintendo.c
  hid-ids.h
  dkms.conf
)
b2sums=('e638a74c624cb218a21509e8194f02c34254ec2fcd9a740574f2a2f28fe3ef14691e654514cb05b52f94e49aedcdb0583ee1525bb896650f514fb85aafbb34e1'
        '18dd7a4e868e04615b47d8688b3ce3d01cc74550a28d80ed3f597d0e5a356d203b36e9d789dddb361042b3f13a032333248356a4e17ebb03e0044b7e9556a499'
        'df8038f5fc1de957dd41163d964b5a8b57d98c37bf1263f5397e452f270a43a4bd66f345a312c3cf73ca48db982248126db7d147ef755b5acae33005c1f548c2'
        'ef401f0906e444d799f49b4ea4e7863c81c80c6b23ae7d5a850255f190c50772afce8bdbce44f7328bf732c9483d719dc17d4b1897d7fc5d155c2b3d0f881909')

pkgver() {
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  install -Dm644 ${source[@]} -t "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/

  sed -e "s/^PACKAGE_NAME=.*$/PACKAGE_NAME=${_pkgbase}/" \
      -e "s/^PACKAGE_VERSION=.*$/PACKAGE_VERSION=${pkgver}/" \
      -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
}
