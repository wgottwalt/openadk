# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libXcursor
PKG_VERSION:=		1.1.13
PKG_RELEASE:=		2
PKG_MD5SUM:=		38a6c7ce393cb5bc10e67de087f9d582
PKG_DESCR:=		xcursor library
PKG_SECTION:=		x11/libs
PKG_SITES:=		${MASTER_SITE_XORG}
PKG_BUILDDEP:=		libXfixes libXrender
PKG_LIBNAME:=		libxcursor
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBXCURSOR,libxcursor,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

libxcursor-install:
	$(INSTALL_DIR) $(IDIR_LIBXCURSOR)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libXcursor*.so* \
		$(IDIR_LIBXCURSOR)/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
