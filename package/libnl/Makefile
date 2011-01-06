# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		libnl
PKG_VERSION:=		1.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		ae970ccd9144e132b68664f98e7ceeb1
PKG_DESCR:=		Netlink library
PKG_SECTION:=		libs
PKG_SITES:=		http://downloads.openwrt.org/sources/

PKG_SUBPKGS:=		LIBNL LIBNL_DEV
PKGSD_LIBNL_DEV:=	header files for netlink library
PKGSC_LIBNL_DEV:=	devel

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBNL,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIBNL_DEV,${PKG_NAME}-dev,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_LIBNL_DEV},${PKGSC_LIBNL_DEV}))

post-install:
	${INSTALL_DIR} ${IDIR_LIBNL}/usr/lib
	${CP} ${WRKINST}/usr/lib/libnl.so* ${IDIR_LIBNL}/usr/lib

libnl-dev-install:
	${INSTALL_DIR} ${IDIR_LIBNL_DEV}/usr/include
	${CP} ${WRKINST}/usr/include/* ${IDIR_LIBNL_DEV}/usr/include

include ${TOPDIR}/mk/pkg-bottom.mk
