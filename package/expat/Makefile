# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		expat
PKG_VERSION:=		2.0.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		ee8b492592568805593f81f8cdf2a04c
PKG_DESCR:=		a fast, non-validating, stream-oriented XML parsing library
PKG_SECTION:=		libs
PKG_URL:=		http://expat.sourceforge.net
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=expat/}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBEXPAT,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE=	gnu
BUILD_STYLE=		auto
INSTALL_STYLE=		auto

post-install:
	${INSTALL_DIR} ${IDIR_LIBEXPAT}/usr/lib
	${CP} ${WRKINST}/usr/lib/libexpat.so.* ${IDIR_LIBEXPAT}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
