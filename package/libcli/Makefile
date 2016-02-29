# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		libcli
PKG_VERSION:=		c63c9d35144939c8b4fa3c5394aed2e29ff517b0
PKG_RELEASE:=		1
PKG_GIT:=		hash
PKG_DESCR:=		cisco-like command-line interface library
PKG_SECTION:=		libs/misc
PKG_URL:=		http://sites.dparrish.com/libcli
PKG_SITES:=		https://github.com/dparrish/libcli.git
PKG_OPTS:=		dev

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBCLI,libcli,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIG_STYLE:=		manual

libcli-install:
	${INSTALL_DIR} ${IDIR_LIBCLI}/usr/lib
	${CP} ${WRKINST}/usr/lib/libcli.so* ${IDIR_LIBCLI}/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
