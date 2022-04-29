# Maintainer: Emily Strickland <linux(at)emily(dot)st>

_pkgbase=hid-nintendo-dkms
pkgname=hid-nintendo-dkms
pkgver=v1.8
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
        'a885619704dbe5b907167ef7e1cf62e807984f3ee3a67f4b7064edd04f177283f4ae5bed0ab754cf31127591e0c7f83a3403726a4a74d47fa9661cad9856ed47'
        'df8038f5fc1de957dd41163d964b5a8b57d98c37bf1263f5397e452f270a43a4bd66f345a312c3cf73ca48db982248126db7d147ef755b5acae33005c1f548c2'
        'e1023e18072c420134fe34bf85dd25e5c78643841dc8becbe419f487fef0fd72c6111a31febd70b09b5625a97e57f7db40080f60a1085ccfa3ec0de977c83553')

pkgver() {
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  install -Dm644 ${source[@]} -t "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/

  sed -e "s/^PACKAGE_NAME=.*$/PACKAGE_NAME=${_pkgbase}/" \
      -e "s/^PACKAGE_VERSION=.*$/PACKAGE_VERSION=${pkgver}/" \
      -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
}
