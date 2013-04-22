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
PKG_BUILDDEP:=		libXfixes libXrender

PKG_SUBPKGS:=		LIBXCURSOR LIBXCURSOR_DEV

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBXCURSOR,libxcursor,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIBXCURSOR_DEV,libxcursor-dev,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

libxcursor-install:
	$(INSTALL_DIR) $(IDIR_LIBXCURSOR)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libXcursor*.so* \
		$(IDIR_LIBXCURSOR)/usr/lib

libxcursor-dev-install:
	$(INSTALL_DIR) $(IDIR_LIBXCURSOR_DEV)/usr/lib/pkgconfig
	$(CP) $(WRKINST)/usr/lib/pkgconfig/*.pc \
		$(IDIR_LIBXCURSOR_DEV)/usr/lib/pkgconfig
	$(INSTALL_DIR) $(IDIR_LIBXCURSOR_DEV)/usr/include
	$(CP) $(WRKINST)/usr/include/* \
		$(IDIR_LIBXCURSOR_DEV)/usr/include

include ${TOPDIR}/mk/pkg-bottom.mk
