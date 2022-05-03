# Maintainer: Emily Strickland <linux(at)emily(dot)st>

_pkgbase=hid-nx
pkgname=${_pkgbase}-dkms
pkgver=v1.11
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
            'bc5473caab898257803704df3bacf25660ae8a707a3952f5e192c68caa2dea5e'
            '57b90c41ea41d68cf874ea2f4db0b1612ed9ba60071d99a81c4a3e7e3cbeee6b'
            '487723a21ccf9c116b3cad6c51f769301165b844a88e3d2b319e174b5488695e'
            '0f3c1f56a3e8b4f3dccc6ce10b1ce480a94270cf90a239c94fec3dcb0280444d')

package() {
  install -Dm644 ${source[@]} -t "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/

  sed -e "s/^PACKAGE_NAME=.*$/PACKAGE_NAME=${_pkgbase}/" \
      -e "s/^PACKAGE_VERSION=.*$/PACKAGE_VERSION=${pkgver}/" \
      -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
}
