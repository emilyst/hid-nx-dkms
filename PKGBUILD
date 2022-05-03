# Maintainer: Emily Strickland <linux(at)emily(dot)st>

_pkgbase=hid-nintendo
pkgname=${_pkgbase}-dkms
pkgver=v1.10
pkgrel=1
pkgdesc='Nintendo Switch controller driver with NSO controller support'
arch=(any)
url=https://github.com/emilyst/hid-nintendo
license=('GPL')
groups=()
depends=(dkms)
makedepends=()
optdepends=()
provides=()
conflicts=(hid-nintendo-nso-dkms)
replaces=()
backup=()
options=()
install=
changelog=
source=(
  Makefile
  hid-nintendo.c
  hid-ids.h
  dkms.conf
  99-joycond-ignore.rules
)
noextract=()
sha256sums=('6f8c360b69753e97843adc026052705af7710845177524bd808c3c6d4f1f926e'
            'c80954d2d39527d1ccdcc532375e911d8712aa81421566e69979e3597a589c0b'
            '57b90c41ea41d68cf874ea2f4db0b1612ed9ba60071d99a81c4a3e7e3cbeee6b'
            '2f1327606268d22909b50f6eb480731d255fc5f6ee208eda6e80805b19cf47fe'
            '0f3c1f56a3e8b4f3dccc6ce10b1ce480a94270cf90a239c94fec3dcb0280444d')

package() {
  install -Dm644 ${source[@]} -t "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/

  sed -e "s/^PACKAGE_NAME=.*$/PACKAGE_NAME=${_pkgbase}/" \
      -e "s/^PACKAGE_VERSION=.*$/PACKAGE_VERSION=${pkgver}/" \
      -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
}
