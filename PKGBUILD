# Maintainer: Yunus Emre YILMAZ <yunusemreyl>

pkgname=omen-space-git
_pkgname=OMEN-HUB
pkgver=2.0.3
pkgrel=1
pkgdesc="Advanced HP Omen/Victus laptop manager for Linux with RGB, Fan, and MUX control"
arch=('x86_64')
url="https://github.com/AdityaTummuri/OMEN-HUB"
license=('GPL')
depends=('dkms' 'polkit' 'gtk4' 'libadwaita')
makedepends=('git' 'gcc' 'make' 'pkg-config' 'rust')
provides=('omen-space')
conflicts=('omen-space' 'hp-laptop-manager' 'omenctl')
source=('git+https://github.com/AdityaTummuri/OMEN-HUB.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g' | sed 's/^v//'
}

build() {
  cd "$srcdir/${pkgname%-git}"
  cargo build --release --locked
}

package() {
  cd "$srcdir/${pkgname%-git}"

  # Install directories
  mkdir -p "$pkgdir/usr/libexec/omen-hub"
  mkdir -p "$pkgdir/usr/libexec/omen-space"
  mkdir -p "$pkgdir/etc/omen-hub"
  mkdir -p "$pkgdir/etc/omen-space"
  mkdir -p "$pkgdir/etc/dbus-1/system.d"
  mkdir -p "$pkgdir/usr/lib/systemd/system"
  mkdir -p "$pkgdir/usr/lib/sysusers.d"
  mkdir -p "$pkgdir/usr/lib/udev/rules.d"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/applications"
  mkdir -p "$pkgdir/usr/share/dbus-1/services"
  mkdir -p "$pkgdir/usr/share/pixmaps"
  mkdir -p "$pkgdir/usr/share/icons/hicolor/512x512/apps"
  mkdir -p "$pkgdir/usr/share/omen-hub/assets"
  mkdir -p "$pkgdir/usr/share/omen-space/assets"
  mkdir -p "$pkgdir/etc/xdg/autostart"

  # Binaries
  cp target/release/omen-hub-daemon "$pkgdir/usr/libexec/omen-hub/"
  ln -sf /usr/libexec/omen-hub/omen-hub-daemon "$pkgdir/usr/libexec/omen-space/omen-space-daemon"
  cp target/release/omen-hub-cli "$pkgdir/usr/bin/"
  ln -sf /usr/bin/omen-hub-cli "$pkgdir/usr/bin/omen-cli"
  cp target/release/omen-hub-tray "$pkgdir/usr/bin/"
  ln -sf /usr/bin/omen-hub-tray "$pkgdir/usr/bin/omen-tray"
  cp target/release/omen-hub-gui "$pkgdir/usr/bin/"
  ln -sf /usr/bin/omen-hub-gui "$pkgdir/usr/bin/omen-gui"

  # System configuration files
  cp data/org.hp.omen.conf "$pkgdir/etc/dbus-1/system.d/"
  cp data/omen-hub-daemon.service "$pkgdir/usr/lib/systemd/system/"
  ln -sf /usr/lib/systemd/system/omen-hub-daemon.service "$pkgdir/usr/lib/systemd/system/omen-space-daemon.service"
  cp data/sysusers.d/omen-hub.conf "$pkgdir/usr/lib/sysusers.d/"
  cp data/sysusers.d/omen-space.conf "$pkgdir/usr/lib/sysusers.d/"
  cp data/99-omen-hub.rules "$pkgdir/usr/lib/udev/rules.d/"
  cp data/99-omen-space.rules "$pkgdir/usr/lib/udev/rules.d/"

  # Desktop integration and assets
  cp data/org.hp.OmenSpace.desktop "$pkgdir/usr/share/applications/"
  cp data/omen-hub.desktop "$pkgdir/usr/share/applications/"
  cp data/org.hp.OmenSpace.service "$pkgdir/usr/share/dbus-1/services/"
  cp src/omen-gui/assets/omenspace.png "$pkgdir/usr/share/pixmaps/omenspace.png"
  cp src/omen-gui/assets/omen-hub.png "$pkgdir/usr/share/pixmaps/omen-hub.png"
  cp src/omen-gui/assets/omenspace.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/omenspace.png"
  cp src/omen-gui/assets/omen-hub.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/omen-hub.png"
  cp -r src/omen-gui/assets/* "$pkgdir/usr/share/omen-hub/assets/"
  cp -r src/omen-gui/assets/* "$pkgdir/usr/share/omen-space/assets/"

  # Autostart tray
  cat <<EOF > "$pkgdir/etc/xdg/autostart/omen-hub-tray.desktop"
[Desktop Entry]
Name=OMEN-HUB Tray
Comment=OMEN-HUB System Tray Icon
Exec=/usr/bin/omen-hub-tray
Icon=omen-hub
Terminal=false
Type=Application
Categories=Utility;
EOF

  # DKMS Driver
  _dkms_dir="$pkgdir/usr/src/hp-omen-extra-${pkgver}"
  mkdir -p "$_dkms_dir"
  cp driver/hp-wmi.c "$_dkms_dir/"
  cp driver/hp-omen-extra.c "$_dkms_dir/"
  cp driver/Makefile "$_dkms_dir/"
  cp driver/dkms.conf "$_dkms_dir/"

  # Set version in dkms.conf
  sed -i "s/PACKAGE_VERSION=.*/PACKAGE_VERSION=\"${pkgver}\"/" "$_dkms_dir/dkms.conf"
}
