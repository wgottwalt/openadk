# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		libXdamage
PKG_VERSION:=		1.1.4
PKG_RELEASE:=		1
PKG_HASH:=		4bb3e9d917f5f593df2277d452926ee6ad96de7b7cd1017cbcf4579fe5d3442b
PKG_DESCR:=		client interface to the damage extension
PKG_SECTION:=		x11/libs
PKG_BUILDDEP:=		libXfixes damageproto
PKG_SITES:=		http://www.x.org/releases/individual/lib/
PKG_LIBNAME:=		libxdamage
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBXDAMAGE,libxdamage,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

libxdamage-install:
	$(INSTALL_DIR) $(IDIR_LIBXDAMAGE)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libXdamage*.so* \
		$(IDIR_LIBXDAMAGE)/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
