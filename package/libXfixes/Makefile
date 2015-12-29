# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		libXfixes
PKG_VERSION:=		5.0.1
PKG_RELEASE:=		1
PKG_HASH:=		81b692856c0e7ab2778a34a32aa6b3f455b9b58cf388f009cba872ed933ae9c0
PKG_DESCR:=		x11 fixes library
PKG_SECTION:=		x11/libs
PKG_BUILDDEP:=		fixesproto xextproto xproto libX11
PKG_URL:=		http://xorg.freedesktop.org/
PKG_SITES:=		http://www.x.org/releases/individual/lib/
PKG_LIBNAME:=		libxfixes
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBXFIXES,libxfixes,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

libxfixes-install:
	$(INSTALL_DIR) $(IDIR_LIBXFIXES)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libXfixes*.so* \
		$(IDIR_LIBXFIXES)/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
