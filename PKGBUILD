# Maintainer: echo -n 'bWF0dEBnZXRjcnlzdC5hbA==' | base64 --decode

pkgname=jade_tui
pkgver=1.0.0
pkgrel=1
pkgdesc="TUI for installing the system with jade"
license=('GPL3')
arch=('any')
url="https://github.com/crystal-linux/jade-tui"
source=("jade-tui" "locales")
depends=('jade' 'gum' 'openssl')
md5sums=('f8bfed0ea3f1b5e85138b0c8b4770e48'
         'cba37f460dcf5f678043df39d6378c35')

package() {
    install -D -m 755 jade-tui ${pkgdir}/usr/bin/.
    install -D -m 700 locales ${pkgdir}/usr/share/jade-tui/.
}
