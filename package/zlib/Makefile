# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		zlib
PKG_VERSION:=		1.2.7
PKG_RELEASE:=		2
PKG_MD5SUM:=		2ab442d169156f34c379c968f3f482dd
PKG_DESCR:=		implementation of the deflate compression method
PKG_SECTION:=		libs/misc
PKG_URL:=		http://www.zlib.net/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=libpng/zlib/}
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.bz2

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,ZLIB,zlib,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIG_STYLE:=		manual
CONFIGURE_ENV+=		uname=Linux

ifeq ($(ADK_TARGET_USE_STATIC_LIBS),)
CONFIGURE_OPTS:=	--shared
endif

ALL_TARGET:=		libz.a 
ifeq ($(ADK_TARGET_USE_STATIC_LIBS),)
ALL_TARGET+=		libz.so.$(PKG_VERSION)
endif

do-configure:
	(cd $(WRKBUILD); \
		uname="Linux" \
		$(TARGET_CONFIGURE_OPTS) \
		CFLAGS="$(TARGET_CFLAGS) -fPIC" \
		CPPFLAGS="-I$(STAGING_TARGET_DIR)/usr/include" \
		LDFLAGS="-L$(STAGING_TARGET_DIR)/usr/lib" \
		./configure \
		--prefix=/usr \
		$(CONFIGURE_OPTS) \
	);

zlib-install:
	${INSTALL_DIR} ${IDIR_ZLIB}/usr/lib
	${CP} ${WRKINST}/usr/lib/libz.so* ${IDIR_ZLIB}/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
