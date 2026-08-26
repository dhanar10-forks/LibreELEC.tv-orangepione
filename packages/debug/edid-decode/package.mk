# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="edid-decode"
PKG_VERSION="770cfb947ea9d9eb5cda57a87dc66d13c60cfefc"
PKG_SHA256="8382bab4a389f808342dbab93b868295007fbcf7ab4a917c3218612d48f30e5e"
PKG_LICENSE="None"
PKG_SITE="https://git.linuxtv.org/edid-decode.git/"
PKG_URL="https://github.com/oe-mirrors/edid-decode/archive/${PKG_VERSION}.zip"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="Decode EDID data in human-readable format"

EDID_SOURCES="edid-decode.cpp parse-base-block.cpp parse-cta-block.cpp \
              parse-displayid-block.cpp parse-ls-ext-block.cpp \
              parse-di-ext-block.cpp parse-vtb-ext-block.cpp"

make_target() {
  echo "${CXX} ${CPPFLAGS} -Wall ${LDFLAGS} -g -DSHA=${PKG_VERSION:0:12} -o edid-decode ${EDID_SOURCES} -lm"
  ${CXX} ${CPPFLAGS} -Wall ${LDFLAGS} -g -DSHA=${PKG_VERSION:0:12} -o edid-decode ${EDID_SOURCES} -lm
}

makeinstall_target() {
  mkdir -p ${INSTALL}/usr/bin
    cp edid-decode ${INSTALL}/usr/bin
}
