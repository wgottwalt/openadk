# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libXmu
PKG_VERSION:=		1.1.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		53fd02bc7174dd643a26bcc88147c146
PKG_DESCR:=		miscellaneous utility functions for X libraries
PKG_SECTION:=		x11/libs
PKG_BUILDDEP:=		libXt libXext
PKG_SITES:=		${MASTER_SITE_XORG}

PKG_SUBPKGS:=		LIBXMU LIBXMU_DEV
PKGSD_LIBXMU_DEV:=	X miscellaneous utility function headers
PKGSC_LIBXMU_DEV:=	x11/devel

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBXMU,libxmu,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIBXMU_DEV,libxmu-dev,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

libxmu-install:
	${INSTALL_DIR} ${IDIR_LIBXMU}/usr/lib
	${CP} ${WRKINST}/usr/lib/libXmu.so* ${IDIR_LIBXMU}/usr/lib
	${CP} ${WRKINST}/usr/lib/libXmuu.so* ${IDIR_LIBXMU}/usr/lib

libxmu-dev-install:
	${INSTALL_DIR} ${IDIR_LIBXMU_DEV}/usr/include
	${CP} ${WRKINST}/usr/include/* ${IDIR_LIBXMU_DEV}/usr/include
	${INSTALL_DIR} ${IDIR_LIBXMU_DEV}/usr/lib/pkgconfig
	${INSTALL_DATA} ${WRKINST}/usr/lib/pkgconfig/*.pc \
		${IDIR_LIBXMU_DEV}/usr/lib/pkgconfig

include ${TOPDIR}/mk/pkg-bottom.mk
