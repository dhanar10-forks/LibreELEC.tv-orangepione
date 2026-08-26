# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="dav1d"
PKG_VERSION="0.8.2"
PKG_SHA256="78ec7a1714d98a8f4ecbc4255e83e6c4c944cdd881871ea234ce40153fd3df04"
PKG_LICENSE="BSD"
PKG_SITE="http://www.jbkempf.com/blog/post/2018/Introducing-dav1d"
PKG_URL="https://mirror.nju.edu.cn/buildroot/dav1d/dav1d-${PKG_VERSION}.tar.bz2"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="dav1d is an AV1 decoder :)"

if [ "${TARGET_ARCH}" = "x86_64" ]; then
  PKG_DEPENDS_TARGET+=" nasm:host"
fi

PKG_MESON_OPTS_TARGET="-Denable_tools=false \
                       -Denable_tests=false"
