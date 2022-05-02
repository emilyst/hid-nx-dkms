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
)
noextract=()

package() {
  install -Dm644 ${source[@]} -t "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/

  sed -e "s/^PACKAGE_NAME=.*$/PACKAGE_NAME=${_pkgbase}/" \
      -e "s/^PACKAGE_VERSION=.*$/PACKAGE_VERSION=${pkgver}/" \
      -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
}
