# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

PKG_NAME:=		mpc
PKG_VERSION:=		1.2.1
PKG_RELEASE:=		1
PKG_HASH:=		17503d2c395dfcf106b622dc142683c1199431d095367c6aacba6eec30340459
PKG_SITES:=		https://ftp.gnu.org/gnu/mpc/
GMP_BUILD_DIR:=		$(TOOLCHAIN_BUILD_DIR)/w-$(PKG_NAME)-$(PKG_VERSION)-$(PKG_RELEASE)/$(PKG_NAME)-$(PKG_VERSION)
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz
