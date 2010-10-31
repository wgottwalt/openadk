# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		xz
PKG_VERSION:=		5.0.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		f3c0706d100ad2b6d63327584d026c50
PKG_DESCR:=		lzma compression utility
PKG_SECTION:=		archive
PKG_URL:=		http://tukaani.org/xz/
PKG_SITES:=		http://tukaani.org/xz/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,XZ,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

post-install:
	${INSTALL_DIR} ${IDIR_XZ}/usr/bin ${IDIR_XZ}/usr/lib
	${CP} ${WRKINST}/usr/bin/* ${IDIR_XZ}/usr/bin
	${CP} ${WRKINST}/usr/lib/*.so* ${IDIR_XZ}/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
