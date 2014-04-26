# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		libnl
PKG_VERSION:=		3.2.24
PKG_RELEASE:=		1
PKG_MD5SUM:=		6e0e7bad0674749d930dd9f285343d55
PKG_DESCR:=		netlink library
PKG_SECTION:=		libs
PKG_BUILDDEP:=		m4-host flex-host
PKG_URL:=		http://www.infradead.org/~tgr/libnl/
PKG_SITES:=		http://www.infradead.org/~tgr/libnl/files/
PKG_NOPARALLEL:=	1
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBNL,libnl,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

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

include ${TOPDIR}/mk/pkg-bottom.mk
