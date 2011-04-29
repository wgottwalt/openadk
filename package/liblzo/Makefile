# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		lzo
PKG_VERSION:=		2.04
PKG_RELEASE:=		1
PKG_MD5SUM:=		a383c7055a310e2a71b9ecd19cfea238
PKG_DESCR:=		a real-time data compression library
PKG_SECTION:=		libs
PKG_URL:=		http://www.oberhumer.com/opensource/lzo
PKG_SITES:=		http://www.oberhumer.com/opensource/lzo/download/

PKG_SUBPKGS:=		LIBLZO LIBLZO_DEV
PKGSD_LIBLZO_DEV:=	lzo library headers
PKGSC_LIBLZO_DEV:=	devel

ifeq ($(ADK_STATIC),y)
PKG_OPTS:=		libonly
endif

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBLZO,liblzo,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},$(PKG_OPTS)))
$(eval $(call PKG_template,LIBLZO_DEV,liblzo-dev,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_LIBLZO_DEV},${PKGSC_LIBLZO_DEV},$(PKG_OPTS)))

CONFIGURE_ARGS+=	--enable-static
MAKE_FLAGS+=		CFLAGS_O="${TARGET_CFLAGS}"

post-install:
	${INSTALL_DIR} ${IDIR_LIBLZO}/usr/lib
	${CP} ${WRKINST}/usr/lib/liblzo2.so* ${IDIR_LIBLZO}/usr/lib

liblzo-dev-install:
	${INSTALL_DIR} ${IDIR_LIBLZO_DEV}/usr/include/lzo
	${CP} ${WRKINST}/usr/include/lzo/*.h ${IDIR_LIBLZO_DEV}/usr/include/lzo

include ${TOPDIR}/mk/pkg-bottom.mk
