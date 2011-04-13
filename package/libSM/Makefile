# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libSM
PKG_VERSION:=		1.2.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		4dcf47665aa64161bc5ca74c0778a149
PKG_DESCR:=		X11 Session Management library
PKG_SECTION:=		x11/libs
PKG_DEPENDS:=		libuuid
PKG_BUILDDEP:=		libICE e2fsprogs
PKG_SITES:=		${MASTER_SITE_XORG}

PKG_SUBPKGS:=		LIBSM LIBSM_DEV
PKGSD_LIBSM_DEV:=	X11 Session Management headers
PKGSC_LIBSM_DEV:=	x11/devel

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBSM,libsm,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIBSM_DEV,libsm-dev,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_LIBSM_DEV},${PKGSC_LIBSM_DEV}))

libsm-install:
	${INSTALL_DIR} ${IDIR_LIBSM}/usr/lib
	${CP} ${WRKINST}/usr/lib/libSM.so* ${IDIR_LIBSM}/usr/lib

libsm-dev-install:
	${INSTALL_DIR} ${IDIR_LIBSM_DEV}/usr/include
	${CP} ${WRKINST}/usr/include/* ${IDIR_LIBSM_DEV}/usr/include
	${INSTALL_DIR} ${IDIR_LIBSM_DEV}/usr/lib/pkgconfig
	${INSTALL_DATA} ${WRKINST}/usr/lib/pkgconfig/*.pc \
		${IDIR_LIBSM_DEV}/usr/lib/pkgconfig

include ${TOPDIR}/mk/pkg-bottom.mk
