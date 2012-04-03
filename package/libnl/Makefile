# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		libnl
PKG_VERSION:=		3.2.7
PKG_RELEASE:=		1
PKG_MD5SUM:=		6a233a9dffa0ee3a7f6110c95c5410ab
PKG_DESCR:=		Netlink library
PKG_SECTION:=		libs
PKG_URL:=		http://www.infradead.org/~tgr/libnl/
PKG_SITES:=		http://www.infradead.org/~tgr/libnl/files/
PKG_NOPARALLEL:=	1

PKG_SUBPKGS:=		LIBNL LIBNL_DEV
PKGSD_LIBNL_DEV:=	header files for netlink library
PKGSC_LIBNL_DEV:=	devel

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBNL,libnl,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIBNL_DEV,libnl-dev,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_LIBNL_DEV},${PKGSC_LIBNL_DEV}))

libnl-install:
	${INSTALL_DIR} ${IDIR_LIBNL}/etc/libnl
	$(CP) ${WRKINST}/etc/libnl/* ${IDIR_LIBNL}/etc/libnl
	${INSTALL_DIR} ${IDIR_LIBNL}/usr/lib
	${CP} ${WRKINST}/usr/lib/libnl-3.so* ${IDIR_LIBNL}/usr/lib
	${CP} ${WRKINST}/usr/lib/libnl-genl-3.so* ${IDIR_LIBNL}/usr/lib
	${CP} ${WRKINST}/usr/lib/libnl-cli-3.so* ${IDIR_LIBNL}/usr/lib
	${CP} ${WRKINST}/usr/lib/libnl-route-3.so* ${IDIR_LIBNL}/usr/lib
	${CP} ${WRKINST}/usr/lib/libnl-nf-3.so* ${IDIR_LIBNL}/usr/lib
	${INSTALL_DIR} ${IDIR_LIBNL}/usr/lib/libnl/cli/cls
	$(CP) ${WRKINST}/usr/lib/libnl/cli/cls/*.so \
		${IDIR_LIBNL}/usr/lib/libnl/cli/cls
	${INSTALL_DIR} ${IDIR_LIBNL}/usr/lib/libnl/cli/qdisc
	$(CP) ${WRKINST}/usr/lib/libnl/cli/qdisc/*.so \
		${IDIR_LIBNL}/usr/lib/libnl/cli/qdisc

libnl-dev-install:
	${INSTALL_DIR} ${IDIR_LIBNL_DEV}/usr/include
	${CP} ${WRKINST}/usr/include/* ${IDIR_LIBNL_DEV}/usr/include
	${INSTALL_DIR} ${IDIR_LIBNL_DEV}/usr/lib/pkgconfig
	${INSTALL_DATA} ${WRKINST}/usr/lib/pkgconfig/*.pc \
		${IDIR_LIBNL_DEV}/usr/lib/pkgconfig

include ${TOPDIR}/mk/pkg-bottom.mk
