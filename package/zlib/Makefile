# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		zlib
PKG_VERSION:=		1.2.5
PKG_RELEASE:=		1
PKG_MD5SUM:=		be1e89810e66150f5b0327984d8625a0
PKG_DESCR:=		implementation of the deflate compression method
PKG_SECTION:=		libs
PKG_URL:=		http://www.zlib.net/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=libpng/zlib/}

PKG_SUBPKGS:=		ZLIB ZLIB_DEV
PKGSD_ZLIB_DEV:=	development files for zlib
PKGSC_ZLIB_DEV:=	devel

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.bz2

ifeq ($(ADK_STATIC),y)
PKG_OPTS:=		libonly
endif

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,ZLIB,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))
$(eval $(call PKG_template,ZLIB_DEV,${PKG_NAME}-dev,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_ZLIB_DEV},${PKGSC_ZLIB_DEV}))

SUB_INSTALLS-y:=
SUB_INSTALLS-m:=
SUB_INSTALLS-${ADK_PACKAGE_ZLIB_DEV}+=	zlib-dev-install

CONFIG_STYLE:=		manual
CONFIGURE_ENV+=		uname=Linux

ifeq ($(ADK_NATIVE),)
COPTS:=                 $(TARGET_CONFIGURE_OPTS)
endif

ifeq ($(ADK_STATIC),)
CONFIGURE_OPTS:=	--shared
endif

do-configure:
	(cd $(WRKBUILD); $(COPTS) \
		uname="Linux" \
		CFLAGS="$(TARGET_CFLAGS) -fPIC" \
		CPPFLAGS="-I$(STAGING_DIR)/usr/include" \
		LDFLAGS="-L$(STAGING_DIR)/usr/lib" \
		./configure \
		--prefix=/usr \
		$(CONFIGURE_OPTS) \
	);

post-install: ${SUB_INSTALLS-m} ${SUB_INSTALLS-y}
	${INSTALL_DIR} ${IDIR_ZLIB}/usr/lib
	${CP} ${WRKBUILD}/libz.so* ${IDIR_ZLIB}/usr/lib

zlib-dev-install:
	${INSTALL_DIR} ${IDIR_ZLIB_DEV}/usr/include
	${CP} ${WRKBUILD}/*.h ${IDIR_ZLIB_DEV}/usr/include

include ${TOPDIR}/mk/pkg-bottom.mk
