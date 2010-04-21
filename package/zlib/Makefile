# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		zlib
PKG_VERSION:=		1.2.4
PKG_RELEASE:=		1
PKG_MD5SUM:=		763c6a0b4ad1cdf5549e3ab3f140f4cb
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

SUB_INSTALLS-y:=
SUB_INSTALLS-m:=
SUB_INSTALLS-${ADK_PACKAGE_ZLIB_DEV}+=	zlib-dev-install

CONFIG_STYLE:=		manual

ifeq ($(ADK_NATIVE),)
COPTS:=                 $(TARGET_CONFIGURE_OPTS)
endif

ifeq ($(ADK_STATIC),)
CONFIGURE_OPTS:=	--shared
endif

#--includedir=$(STAGING_DIR)/usr/include 
do-configure:
	(cd $(WRKBUILD); $(COPTS) \
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
