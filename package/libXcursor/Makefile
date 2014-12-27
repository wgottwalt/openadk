# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		libXcursor
PKG_VERSION:=		1.1.13
PKG_RELEASE:=		2
PKG_HASH:=		df4475096192ad60c1300df7b5e2509019ad1a733a0cadcad13b5d3f4b7d615b
PKG_DESCR:=		cursor library
PKG_SECTION:=		x11/libs
PKG_SITES:=		${MASTER_SITE_XORG}
PKG_BUILDDEP:=		libXfixes libXrender
PKG_LIBNAME:=		libxcursor
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBXCURSOR,libxcursor,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

libxcursor-install:
	$(INSTALL_DIR) $(IDIR_LIBXCURSOR)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libXcursor*.so* \
		$(IDIR_LIBXCURSOR)/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
