# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libIDL
PKG_VERSION:=		0.8.14
PKG_RELEASE:=		1
PKG_MD5SUM:=		531fbc1b40b80dd1d6f3b5e76b99067c
PKG_DESCR:=		libraries for Interface Definition Language files
PKG_SECTION:=		libs
PKG_URL:=		http://www.gnome.org/
PKG_SITES:=		http://ftp.gnome.org/pub/GNOME/sources/libIDL/0.8/

PKG_SUBPKGS:=		LIBIDL LIBIDL_DEV
PKGSD_LIBIDL_DEV:=	libidl headers
PKGSC_LIBIDL_DEV:=	devel

include $(TOPDIR)/mk/package.mk

CONFIGURE_ENV+=		libIDL_cv_long_long_format=ll

$(eval $(call PKG_template,LIBIDL,libidl,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIBIDL_DEV,libidl-dev,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_LIBIDL_DEV},${PKGSC_LIBIDL_DEV}))

libidl-install:
	$(INSTALL_DIR) $(IDIR_LIBIDL)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libIDL*.so* \
		$(IDIR_LIBIDL)/usr/lib

libidl-dev-install:
	$(INSTALL_DIR) $(IDIR_LIBIDL_DEV)/usr/include
	$(CP) $(WRKINST)/usr/include/* \
		$(IDIR_LIBIDL_DEV)/usr/include
	$(INSTALL_DIR) $(IDIR_LIBIDL_DEV)/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/libIDL-config-2 \
		$(IDIR_LIBIDL_DEV)/usr/bin
	$(INSTALL_DIR) $(IDIR_LIBIDL_DEV)/usr/lib/pkgconfig
	${INSTALL_DATA} ${WRKINST}/usr/lib/pkgconfig/*.pc \
		$(IDIR_LIBIDL_DEV)/usr/lib/pkgconfig

include ${TOPDIR}/mk/pkg-bottom.mk
