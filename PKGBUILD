# Maintainer: Emily Strickland <linux(at)emily(dot)st>

_pkgbase=hid-nintendo-dkms
pkgname=hid-nintendo-dkms
pkgver=v1.9
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
        '2983327db041782bb0fedd8bf3ae54a510075ebbeda13e20e36f6367faacaf71e24eb3b302617a6a2afe3b7a37b24fd2d619a3330cab0e3741c91396feb89b3f'
        'df8038f5fc1de957dd41163d964b5a8b57d98c37bf1263f5397e452f270a43a4bd66f345a312c3cf73ca48db982248126db7d147ef755b5acae33005c1f548c2'
        '0aaddee5523d16b6371a15cf0b26c37eb29f7d6b4c183cbbf72550a02dd02c7352ffc225da945abd4256550ecf329da0ac33a1c47d5d97ceb31b62ef4fe96b22')

pkgver() {
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  install -Dm644 ${source[@]} -t "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/

  sed -e "s/^PACKAGE_NAME=.*$/PACKAGE_NAME=${_pkgbase}/" \
      -e "s/^PACKAGE_VERSION=.*$/PACKAGE_VERSION=${pkgver}/" \
      -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
}
