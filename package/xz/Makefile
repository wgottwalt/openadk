# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		xz
PKG_VERSION:=		4.999.9beta
PKG_RELEASE:=		1
PKG_MD5SUM:=		f2073579b6da2fe35d453adee1aaf1b2
PKG_DESCR:=		lzma compression utility
PKG_SECTION:=		net
PKG_URL:=		http://tukaani.org/xz/
PKG_SITES:=		http://tukaani.org/xz/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,XZ,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

post-install:
	${INSTALL_DIR} ${IDIR_XZ}/usr/bin ${IDIR_XZ}/usr/lib
	${CP} ${WRKINST}/usr/bin/* ${IDIR_XZ}/usr/bin
	${CP} ${WRKINST}/usr/lib/*.so* ${IDIR_XZ}/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
