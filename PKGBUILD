# Maintainer: Emily Strickland <linux(at)emily(dot)st>

_pkgbase=hid-nx
pkgname=${_pkgbase}-dkms
pkgver=v1.12
pkgrel=1
pkgdesc='Nintendo Switch controller driver with NSO controller support'
arch=(any)
url=https://github.com/emilyst/${pkgname}
license=('GPL')
groups=()
depends=(dkms)
makedepends=()
optdepends=()
provides=()
conflicts=(hid-nintendo-nso-dkms hid-nintendo-dkms)
replaces=()
backup=()
options=()
install=
changelog=
source=(
  Makefile
  hid-nx.c
  hid-ids.h
  dkms.conf
  99-joycond-ignore.rules
)
noextract=()
sha256sums=('8d4551038e60b39d4080287ff4578c50eedfa3ae33d2edc70c5e92223f229c0f'
            '1f74bee099700954b376f8737e0d3f29e0845bf33882538358da67fff46be21f'
            '57b90c41ea41d68cf874ea2f4db0b1612ed9ba60071d99a81c4a3e7e3cbeee6b'
            '66695d7d6b36c7fdd301537fdd2fc5a14f5b4288e2264a6e73ca5b45806f3f4a'
            '0f3c1f56a3e8b4f3dccc6ce10b1ce480a94270cf90a239c94fec3dcb0280444d')

package() {
  install -Dm644 ${source[@]} -t "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/

  sed -e "s/^PACKAGE_NAME=.*$/PACKAGE_NAME=${_pkgbase}/" \
      -e "s/^PACKAGE_VERSION=.*$/PACKAGE_VERSION=${pkgver}/" \
      -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
}
