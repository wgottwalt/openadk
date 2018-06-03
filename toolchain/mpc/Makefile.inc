# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

PKG_NAME:=		mpc
PKG_VERSION:=		1.1.0
PKG_RELEASE:=		1
PKG_HASH:=		6985c538143c1208dcb1ac42cedad6ff52e267b47e5f970183a3e75125b43c2e
PKG_SITES:=		https://ftp.gnu.org/gnu/mpc/
GMP_BUILD_DIR:=		$(TOOLCHAIN_BUILD_DIR)/w-$(PKG_NAME)-$(PKG_VERSION)-$(PKG_RELEASE)/$(PKG_NAME)-$(PKG_VERSION)
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz
