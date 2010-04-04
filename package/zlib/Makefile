# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		zlib
PKG_VERSION:=		1.2.3
PKG_RELEASE:=		6
PKG_MD5SUM:=		dee233bf288ee795ac96a98cc2e369b6
PKG_DESCR:=		implementation of the deflate compression method
PKG_SECTION:=		libs
PKG_URL:=		http://www.zlib.net
PKG_SITES:=		http://www.zlib.net/ \
			${MASTER_SITE_SOURCEFORGE:=zlib/}

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.bz2

ifeq ($(ADK_STATIC),y)
PKG_OPTS:=		libonly
endif

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,ZLIB,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))
$(eval $(call PKG_template,ZLIB_DEV,${PKG_NAME}-dev,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual

ifeq ($(ADK_NATIVE),)
COPTS:=                 $(TARGET_CONFIGURE_OPTS)
endif

ifeq ($(ADK_STATIC),)
CONFIGURE_OPTS:=	--shared
endif

do-configure:
	(cd $(WRKBUILD); $(COPTS) \
		CFLAGS="$(TARGET_CFLAGS) -fPIC" \
		CPPFLAGS="-I$(STAGING_DIR)/usr/include" \
		LDFLAGS="-L$(STAGING_DIR)/usr/lib" \
		./configure \
		--prefix=$(STAGING_DIR)/usr \
		--includedir=$(STAGING_DIR)/usr/include \
		$(CONFIGURE_OPTS) \
	);

post-install:
	${INSTALL_DIR} ${IDIR_ZLIB}/usr/lib
	${CP} ${WRKBUILD}/libz.so* ${IDIR_ZLIB}/usr/lib
	${INSTALL_DIR} ${IDIR_ZLIB_DEV}/usr/include
	${CP} ${WRKBUILD}/*.h ${IDIR_ZLIB_DEV}/usr/include

include ${TOPDIR}/mk/pkg-bottom.mk
