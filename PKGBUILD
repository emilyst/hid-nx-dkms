# Maintainer: Emily Strickland <linux(at)emily(dot)st>

_pkgbase=hid-nintendo-dkms
pkgname=hid-nintendo-dkms
pkgver=v1.3
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
        '0424ac9a5e8ca64ede2b446e238b5935c8afb50f82388d23b96376b9c167dc356a76cb20c71c2ad073abb44080cbcc5cfe4e29ed2443670ae19aa8e1c93a9ef2'
        '97e86380aa58ab564a8b03c00610fff66067634f5e31055f90e96ed840ca7bb0ea678cf7ddbf650f4f7b29993ba05c8958680f75db498fec673e89d8b06e7871'
        '4ef5422163176e926ffdc3824639eb7cd60297bc5bcafebc035fc71806462dace993ea092cabe6986d62768cfdb7fd29d252a78274084c5afbe22f2ca6ef2dc0')

pkgver() {
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  install -Dm644 ${source[@]} -t "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/

  sed -e "s/^PACKAGE_NAME=.*$/PACKAGE_NAME=${_pkgbase}/" \
      -e "s/^PACKAGE_VERSION=.*$/PACKAGE_VERSION=${pkgver}/" \
      -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
}
