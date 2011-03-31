# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libXft
PKG_VERSION:=		2.1.9
PKG_RELEASE:=		1
PKG_MD5SUM:=		0a1e129b1d8b2d3905dc02a64255b781
PKG_DESCR:=		X FreeType library
PKG_SECTION:=		x11/libs
PKG_BUILDDEP:=		libXrender
PKG_SITES:=		${MASTER_SITE_XORG}

PKG_SUBPKGS:=		LIBXFT LIBXFT_DEV
PKGSD_LIBXFT_DEV:=	X FreeType headers
PKGSC_LIBXFT_DEV:=	x11/devel

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBXFT,libxft,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIBXFT_DEV,libxft-dev,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_LIBXFT_DEV},${PKGSC_LIBXFT_DEV}))

TARGET_CFLAGS:=         $(filter-out -flto,$(TARGET_CFLAGS))
CONFIGURE_ARGS+=	--disable-malloc0returnsnull \
			--disable-install-makestrs

libxft-install:
	${INSTALL_DIR} ${IDIR_LIBXFT}/usr/lib
	${CP} ${WRKINST}/usr/lib/libXft.so* ${IDIR_LIBXFT}/usr/lib

libxft-dev-install:
	${INSTALL_DIR} ${IDIR_LIBXFT_DEV}/usr/include
	${CP} ${WRKINST}/usr/include/* ${IDIR_LIBXFT_DEV}/usr/include

include ${TOPDIR}/mk/pkg-bottom.mk
