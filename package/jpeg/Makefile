# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		jpeg
PKG_VERSION:=		8c
PKG_RELEASE:=		1
PKG_MD5SUM:=		a2c10c04f396a9ce72894beb18b4e1f9
PKG_DESCR:=		The Independent JPEG Groups JPEG runtime library
PKG_SECTION:=		libs
PKG_URL:=		http://www.ijg.org/
PKG_SITES:=		http://www.ijg.org/files/

PKG_SUBPKGS:=		LIBJPEG LIBJPEG_DEV
PKGSD_LIBJPEG_DEV:=	development files for libjpeg
PKGSC_LIBJPEG_DEV:=	devel

DISTFILES:=		${PKG_NAME}src.v${PKG_VERSION}.tar.gz

ifeq ($(ADK_STATIC),y)
PKG_OPTS:=		libonly
endif

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBJPEG,libjpeg,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))
$(eval $(call PKG_template,LIBJPEG_DEV,libjpeg-dev,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_LIBJPEG_DEV},${PKGSC_LIBJPEG_DEV}))

libjpeg-install:
	${INSTALL_DIR} ${IDIR_LIBJPEG}/usr/lib
	${CP} ${WRKINST}/usr/lib/libjpeg.so* ${IDIR_LIBJPEG}/usr/lib/

libjpeg-dev-install:
	${INSTALL_DIR} ${IDIR_LIBJPEG_DEV}/usr/include
	${CP} ${WRKINST}/usr/include/*.h ${IDIR_LIBJPEG_DEV}/usr/include

include ${TOPDIR}/mk/pkg-bottom.mk
