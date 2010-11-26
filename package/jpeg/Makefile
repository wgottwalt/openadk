# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		jpeg
PKG_VERSION:=		7
PKG_RELEASE:=		2
PKG_MD5SUM:=		382ef33b339c299b56baf1296cda9785
PKG_DESCR:=		The Independent JPEG Groups JPEG runtime library
PKG_SECTION:=		libs
PKG_URL:=		http://www.ijg.org/
PKG_SITES:=		http://www.ijg.org/files/

PKG_SUBPKGS:=		LIBJPEG JPEG_DEV
PKGSD_JPEG_DEV:=	development files for jpeg
PKGSC_JPEG_DEV:=	devel

DISTFILES:=		${PKG_NAME}src.v${PKG_VERSION}.tar.gz

ifeq ($(ADK_STATIC),y)
PKG_OPTS:=		libonly
endif

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBJPEG,libjpeg,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))
$(eval $(call PKG_template,JPEG_DEV,libjpeg-dev,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_JPEG_DEV},${PKGSC_JPEG_DEV}))

SUB_INSTALLS-y:=
SUB_INSTALLS-m:=
SUB_INSTALLS-${ADK_PACKAGE_JPEG_DEV}+=	jpeg-dev-install

post-install: ${SUB_INSTALLS-m} ${SUB_INSTALLS-y}
	${INSTALL_DIR} ${IDIR_LIBJPEG}/usr/lib
	${CP} ${WRKINST}/usr/lib/libjpeg.so* ${IDIR_LIBJPEG}/usr/lib/

jpeg-dev-install:
	${INSTALL_DIR} ${IDIR_JPEG_DEV}/usr/include
	${CP} ${WRKINST}/usr/include/*.h ${IDIR_JPEG_DEV}/usr/include

include ${TOPDIR}/mk/pkg-bottom.mk
