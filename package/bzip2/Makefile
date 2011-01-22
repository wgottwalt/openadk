# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		bzip2
PKG_VERSION:=		1.0.5
PKG_RELEASE:=		1
PKG_MD5SUM:=		3c15a0c8d1d3ee1c46a1634d00617b1a
PKG_DESCR:=		bzip2 compression utility
PKG_SECTION:=		archive
PKG_URL:=		http://www.bzip.org/
PKG_SITES:=		http://www.bzip.org/1.0.5/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,BZIP2,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual
TARGET_CFLAGS+=		-fPIC
XAKE_FLAGS+=		PREFIX=${WRKINST}/usr

post-install:
	${INSTALL_DIR} ${IDIR_BZIP2}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/bzip2 ${IDIR_BZIP2}/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
