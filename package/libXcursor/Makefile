# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libXcursor
PKG_VERSION:=		1.1.11
PKG_RELEASE:=		1
PKG_MD5SUM:=		55558a41d0bcf9210636858844fa4d2f
PKG_DESCR:=		xcursor library
PKG_SECTION:=		x11/libs
PKG_SITES:=		${MASTER_SITE_XORG}

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBXCURSOR,libxcursor,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

post-install:
	$(INSTALL_DIR) $(IDIR_LIBXCURSOR)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libXcursor*.so* \
		$(IDIR_LIBXCURSOR)/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
