# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		xrdb
PKG_VERSION:=		1.1.0
PKG_RELEASE:=		1
PKG_HASH:=		44b0b6b7b7eb80b83486dfea67c880f6b0059052386c7ddec4d58fd2ad9ae8e9
PKG_DESCR:=		resource database management tools
PKG_SECTION:=		x11/utils
PKG_DEPENDS:=		libx11 libxmu
PKG_BUILDDEP:=		libX11 libXmu
PKG_SITES:=		http://www.x.org/releases/individual/app/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,XRDB,xrdb,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

xrdb-install:
	$(INSTALL_DIR) $(IDIR_XRDB)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/xrdb \
		$(IDIR_XRDB)/usr/bin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
