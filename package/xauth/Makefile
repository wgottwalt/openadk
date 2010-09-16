# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		xauth
PKG_VERSION:=		1.0.4
PKG_RELEASE:=		1
PKG_MD5SUM:=		2eb3cc3e4421e1b747c4ac16aac20cda
PKG_DESCR:=		X authority file utility
PKG_SECTION:=		x11/apps
PKG_DEPENDS:=		libx11 libxext libxmu
PKG_BUILDDEP:=		libX11 libXext libXmu
PKG_URL:=		http://www.x.org
PKG_SITES:=		${MASTER_SITE_XORG}

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,XAUTH,$(PKG_NAME),$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

post-install:
	$(INSTALL_DIR) $(IDIR_XAUTH)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/xauth $(IDIR_XAUTH)/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
