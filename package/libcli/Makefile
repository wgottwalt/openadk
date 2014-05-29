# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		libcli
PKG_VERSION:=		1.9.7
PKG_RELEASE:=		1
PKG_MD5SUM:=		1b07b09e2840f910defde66afa28fbe7
PKG_DESCR:=		cisco-like command-line interface library
PKG_SECTION:=		libs/misc
PKG_URL:=		http://sites.dparrish.com/libcli
PKG_SITES:=		https://github.com/dparrish/libcli
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBCLI,libcli,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIG_STYLE:=		manual

libcli-install:
	${INSTALL_DIR} ${IDIR_LIBCLI}/usr/lib
	${CP} ${WRKINST}/usr/lib/libcli.so* ${IDIR_LIBCLI}/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
