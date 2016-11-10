# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

PKG_NAME:=		mpc
PKG_VERSION:=		1.0.3
PKG_RELEASE:=		1
PKG_HASH:=		617decc6ea09889fb08ede330917a00b16809b8db88c29c31bfbb49cbf88ecc3
PKG_SITES:=		http://www.multiprecision.org/mpc/download/
GMP_BUILD_DIR:=		$(TOOLCHAIN_BUILD_DIR)/w-$(PKG_NAME)-$(PKG_VERSION)-$(PKG_RELEASE)/$(PKG_NAME)-$(PKG_VERSION)
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz
