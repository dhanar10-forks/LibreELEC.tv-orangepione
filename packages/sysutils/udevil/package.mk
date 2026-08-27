# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="udevil"
PKG_VERSION="f2b715d1d821e4b69b2fb0864a5a178dd67877f0"
PKG_SHA256="9285649d4304e7aac303d67e9ddcc6979602296bbfd80cf984317701de3a46e9"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/arnie97/udevil-ng"
PKG_URL="https://github.com/arnie97/udevil-ng/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain systemd glib"
PKG_LONGDESC="Mounts and unmounts removable devices and networks without a password."

PKG_CONFIGURE_OPTS_TARGET="--disable-systemd \
                           --with-mount-prog=/usr/bin/mount \
                           --with-umount-prog=/usr/bin/umount \
                           --with-losetup-prog=/usr/sbin/losetup \
                           --with-setfacl-prog=/usr/bin/setfacl"

makeinstall_target() {
 : # nothing to install
}

post_makeinstall_target() {
  mkdir -p ${INSTALL}/etc/udevil
    cp ${PKG_DIR}/config/udevil.conf ${INSTALL}/etc/udevil
    ln -sf /storage/.config/udevil.conf ${INSTALL}/etc/udevil/udevil-user-root.conf

  mkdir -p ${INSTALL}/usr/bin
    cp -PR src/udevil ${INSTALL}/usr/bin

  mkdir -p ${INSTALL}/usr/sbin
  echo -e '#!/bin/sh\nexec /usr/bin/mount -t ntfs3 "$@"' > ${INSTALL}/usr/sbin/mount.ntfs
  chmod 755 ${INSTALL}/usr/sbin/mount.ntfs
}

post_install() {
  enable_service udevil-mount@.service
}
