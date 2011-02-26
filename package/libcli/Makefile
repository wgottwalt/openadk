# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		libcli
PKG_VERSION:=		1.9.4
PKG_RELEASE:=		1
PKG_MD5SUM:=		b917617d21b90db214971efe64a33416
PKG_DESCR:=		Cisco-like command-line interface library
PKG_SECTION:=		libs
PKG_URL:=		http://code.google.com/p/libcli
PKG_SITES:=		http://libcli.googlecode.com/files/

PKG_SUBPKGS:=		LIBCLI LIBCLI_DEV
PKGSD_LIBCLI_DEV:=	command-line interface headers
PKGSC_LIBCLI_DEV:=	devel

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBCLI,libcli,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIBCLI_DEV,libcli-dev,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_LIBCLI_DEV},${PKGSC_LIBCLI_DEV}))

CONFIG_STYLE:=		manual

libcli-install:
	${INSTALL_DIR} ${IDIR_LIBCLI}/usr/lib
	${CP} ${WRKINST}/usr/lib/libcli.so* ${IDIR_LIBCLI}/usr/lib

libcli-dev-install:
	${INSTALL_DIR} ${IDIR_LIBCLI_DEV}/usr/include
	${CP} ${WRKINST}/usr/include/* ${IDIR_LIBCLI_DEV}/usr/include

include ${TOPDIR}/mk/pkg-bottom.mk
