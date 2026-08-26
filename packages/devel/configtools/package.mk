# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="configtools"
PKG_VERSION="c8ddc8472f8efcadafc1ef53ca1d863415fddd5f" # 2020-12-22
PKG_SHA256="96eb3dd6ab6fd962112071ccf0ea83a8d47d6a39b6fcd314f5ab56c491f603ce"
PKG_LICENSE="GPL"
PKG_SITE="http://git.savannah.gnu.org/cgit/config.git"
PKG_URL="https://github.com/gnu-mirror-unofficial/config/archive/${PKG_VERSION}.zip"
PKG_DEPENDS_HOST=""
PKG_LONGDESC="configtools"
PKG_TOOLCHAIN="manual"
PKG_SOURCE_DIR="config-${PKG_VERSION}"

makeinstall_host() {
  mkdir -p ${TOOLCHAIN}/configtools
  cp config.* ${TOOLCHAIN}/configtools
}
