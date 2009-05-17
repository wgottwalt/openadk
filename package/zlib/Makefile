# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		zlib
PKG_VERSION:=		1.2.3
PKG_RELEASE:=		5
PKG_MD5SUM:=		dee233bf288ee795ac96a98cc2e369b6
MASTER_SITES:=		http://www.zlib.net/ \
			${MASTER_SITE_SOURCEFORGE:=zlib/}
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.bz2

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,ZLIB,zlib,${PKG_VERSION}-${PKG_RELEASE},${ARCH}))

CONFIGURE_STYLE=	manual
BUILD_STYLE=		auto
INSTALL_STYLE=		auto

do-configure:
		(cd $(WRKBUILD); \
			$(TARGET_CONFIGURE_OPTS) \
			CFLAGS="$(TARGET_CFLAGS) -fPIC" \
			CPPFLAGS="-I$(STAGING_DIR)/usr/include" \
			LDFLAGS="-L$(STAGING_DIR)/usr/lib" \
			./configure \
			--prefix=$(STAGING_DIR)/usr \
			--includedir=$(STAGING_DIR)/usr/include \
			--shared \
		);

post-install:
	${INSTALL_DIR} ${IDIR_ZLIB}/usr/lib
	cd ${WRKBUILD} && ${CP} libz.so* ${IDIR_ZLIB}/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
