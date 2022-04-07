# Maintainer: Emily Strickland <linux(at)emily(dot)st>

_pkgbase=hid-nintendo-dkms
pkgname=hid-nintendo-dkms
pkgver=v1.4.r1.gb755970
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
        '1269c21aa7740c3e10ba24809d78b97f96f9dbe17abb187fff91904b4909857af6de1b1d03492daedaec1a2bb3731b6cd6975f79685ae9123096c1e24e64d6df'
        '97e86380aa58ab564a8b03c00610fff66067634f5e31055f90e96ed840ca7bb0ea678cf7ddbf650f4f7b29993ba05c8958680f75db498fec673e89d8b06e7871'
        'ab98c9caaff81a1b6fefbda5d6552b862bf8ecc9d97c5f7cde675e45d27bc09c2fc23a686b829a59ed00b10dfb0e0c7fec78bcddc296ba5337d625806ced7f0d')

pkgver() {
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  install -Dm644 ${source[@]} -t "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/

  sed -e "s/^PACKAGE_NAME=.*$/PACKAGE_NAME=${_pkgbase}/" \
      -e "s/^PACKAGE_VERSION=.*$/PACKAGE_VERSION=${pkgver}/" \
      -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
}
