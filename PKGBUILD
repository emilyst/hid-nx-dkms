# Maintainer: Emily Strickland <linux(at)emily(dot)st>

_pkgbase=hid-nx
pkgname=${_pkgbase}-dkms
pkgver=v1.13
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
            'b2509d1ba3ee3b67f9c4ea312e80081125f394717091774094339de078aefa31'
            '57b90c41ea41d68cf874ea2f4db0b1612ed9ba60071d99a81c4a3e7e3cbeee6b'
            'ea7cacc78248a693c6db6ad20bb91425db605615abc5327ca33ac2141ffd7803'
            '0f3c1f56a3e8b4f3dccc6ce10b1ce480a94270cf90a239c94fec3dcb0280444d')

package() {
  install -Dm644 ${source[@]} -t "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/

  sed -e "s/^PACKAGE_NAME=.*$/PACKAGE_NAME=${_pkgbase}/" \
      -e "s/^PACKAGE_VERSION=.*$/PACKAGE_VERSION=${pkgver}/" \
      -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
}
