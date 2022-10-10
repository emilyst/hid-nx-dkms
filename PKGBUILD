# Maintainer: Emily Strickland <linux(at)emily(dot)st>

_pkgbase=hid-nx
pkgname=${_pkgbase}-dkms
pkgver=v1.14
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
            '23c9b806a4ec7aca47a77e1603376a7ce6367da55f2fd9bb7960ec39c890b364'
            '57b90c41ea41d68cf874ea2f4db0b1612ed9ba60071d99a81c4a3e7e3cbeee6b'
            '94d9bc887635a986b87a410f86b9ead20b98d8191be6ea4fe1fa1bd28067bbe6'
            '0f3c1f56a3e8b4f3dccc6ce10b1ce480a94270cf90a239c94fec3dcb0280444d')

package() {
  install -Dm644 ${source[@]} -t "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/

  sed -e "s/^PACKAGE_NAME=.*$/PACKAGE_NAME=${_pkgbase}/" \
      -e "s/^PACKAGE_VERSION=.*$/PACKAGE_VERSION=${pkgver}/" \
      -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
}
