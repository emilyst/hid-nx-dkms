# Maintainer: Emily Strickland <linux(at)emily(dot)st>

_pkgbase=hid-nintendo-dkms
pkgname=hid-nintendo-dkms
pkgver=v1.5
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
        '54010db435d100fd6ac1aae0ddbb9dcbbaffcc79bf640ca73f2f9baee9760cd3c981374195b8e20e45881315d4097d52a982bec3dc4ab873611412c26f4fc0a9'
        '97e86380aa58ab564a8b03c00610fff66067634f5e31055f90e96ed840ca7bb0ea678cf7ddbf650f4f7b29993ba05c8958680f75db498fec673e89d8b06e7871'
        '70d3b089a368d961eb4fc7997d9c416fce51519673af0afce9c1c44f4ceffcc8ab1cbba20a33504aa5c569bad25a8e554a20a2b42f0770841377660c4c4c7818')

pkgver() {
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  install -Dm644 ${source[@]} -t "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/

  sed -e "s/^PACKAGE_NAME=.*$/PACKAGE_NAME=${_pkgbase}/" \
      -e "s/^PACKAGE_VERSION=.*$/PACKAGE_VERSION=${pkgver}/" \
      -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
}
