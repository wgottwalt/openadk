# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		xauth
PKG_VERSION:=		1.0.7
PKG_RELEASE:=		1
PKG_MD5SUM:=		63c5fe6f8459ac08088958febc1db122
PKG_DESCR:=		authority file utility
PKG_SECTION:=		x11/utils
PKG_DEPENDS:=		libx11 libxext libxmu
PKG_BUILDDEP:=		libX11 libXext libXmu
PKG_URL:=		http://www.x.org
PKG_SITES:=		${MASTER_SITE_XORG}

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,XAUTH,xauth,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

xauth-install:
	$(INSTALL_DIR) $(IDIR_XAUTH)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/xauth $(IDIR_XAUTH)/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
