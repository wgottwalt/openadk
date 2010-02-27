# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

PKG_NAME:=		gmp
PKG_VERSION:=		4.3.2
PKG_RELEASE:=		1
PKG_MD5SUM:=		dd60683d7057917e34630b4a787932e8
PKG_SITES:=		${MASTER_SITE_GNU:=gmp/}
DISTFILES:=		$(PKG_NAME)-$(PKG_VERSION).tar.bz2
GMP_BUILD_DIR:=		$(TOOLCHAIN_BUILD_DIR)/w-$(PKG_NAME)-$(PKG_VERSION)-$(PKG_RELEASE)/$(PKG_NAME)-$(PKG_VERSION)
