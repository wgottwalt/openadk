# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		libnl
PKG_VERSION:=		2.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		6aaf1e9802a17a7d702bb0638044ffa7
PKG_DESCR:=		Netlink library
PKG_SECTION:=		libs
PKG_URL:=		http://www.infradead.org/~tgr/libnl/
PKG_SITES:=		http://www.infradead.org/~tgr/libnl/files/

PKG_SUBPKGS:=		LIBNL LIBNL_DEV
PKGSD_LIBNL_DEV:=	header files for netlink library
PKGSC_LIBNL_DEV:=	devel

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBNL,libnl,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIBNL_DEV,libnl-dev,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_LIBNL_DEV},${PKGSC_LIBNL_DEV}))

libnl-install:
	${INSTALL_DIR} ${IDIR_LIBNL}/usr/lib
	${CP} ${WRKINST}/usr/lib/libnl.so* ${IDIR_LIBNL}/usr/lib

libnl-dev-install:
	${INSTALL_DIR} ${IDIR_LIBNL_DEV}/usr/include
	${CP} ${WRKINST}/usr/include/* ${IDIR_LIBNL_DEV}/usr/include

include ${TOPDIR}/mk/pkg-bottom.mk
