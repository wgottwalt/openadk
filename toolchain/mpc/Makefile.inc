# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

PKG_NAME:=		mpc
PKG_VERSION:=		0.8.2
PKG_RELEASE:=		1
PKG_MD5SUM:=		e98267ebd5648a39f881d66797122fb6
PKG_SITES:=		http://www.multiprecision.org/mpc/download/
GMP_BUILD_DIR:=		$(TOOLCHAIN_BUILD_DIR)/w-$(PKG_NAME)-$(PKG_VERSION)-$(PKG_RELEASE)/$(PKG_NAME)-$(PKG_VERSION)
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz
