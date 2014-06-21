# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		libXfixes
PKG_VERSION:=		5.0
PKG_RELEASE:=		2
PKG_MD5SUM:=		0a2139e91df4758218e0fddbd549e13c
PKG_DESCR:=		x11 fixes library
PKG_SECTION:=		x11/libs
PKG_BUILDDEP:=		fixesproto xextproto xproto libX11
PKG_URL:=		http://xorg.freedesktop.org/
PKG_SITES:=		${MASTER_SITE_XORG}
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
