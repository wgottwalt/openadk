# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		xrdb
PKG_VERSION:=		1.0.7
PKG_RELEASE:=		1
PKG_MD5SUM:=		146c009e7abc52b611db4cac4883488e
PKG_DESCR:=		resource database management tools
PKG_SECTION:=		x11/utils
PKG_DEPENDS:=		libx11 libxmu
PKG_BUILDDEP:=		libX11 libXmu
PKG_SITES:=		${MASTER_SITE_XORG}

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,XRDB,xrdb,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

xrdb-install:
	$(INSTALL_DIR) $(IDIR_XRDB)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/xrdb \
		$(IDIR_XRDB)/usr/bin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
