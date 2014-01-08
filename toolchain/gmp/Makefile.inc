# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

PKG_NAME:=		gmp
PKG_VERSION:=		5.1.3
PKG_RELEASE:=		1
PKG_MD5SUM:=		e5fe367801ff067b923d1e6a126448aa
PKG_SITES:=		${MASTER_SITE_GNU:=gmp/}
DISTFILES:=		$(PKG_NAME)-$(PKG_VERSION).tar.xz
GMP_BUILD_DIR:=		$(TOOLCHAIN_BUILD_DIR)/w-$(PKG_NAME)-$(PKG_VERSION)-$(PKG_RELEASE)/$(PKG_NAME)-$(PKG_VERSION)
