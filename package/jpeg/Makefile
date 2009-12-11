# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		jpeg
PKG_VERSION:=		7
PKG_RELEASE:=		1
PKG_MD5SUM:=		382ef33b339c299b56baf1296cda9785
PKG_DESCR:=		The Independent JPEG Groups JPEG runtime library
PKG_SECTION:=		libs
PKG_URL:=		http://www.ijg.org/
PKG_SITES:=		http://www.ijg.org/files/ \
			ftp://ftp.uu.net/graphics/jpeg/

DISTFILES:=		${PKG_NAME}src.v${PKG_VERSION}.tar.gz

ifeq ($(ADK_STATIC),y)
PKG_OPTS:=		libonly
endif

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBJPEG,libjpeg,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIGURE_STYLE:=	gnu
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

post-install:
	${INSTALL_DIR} ${IDIR_LIBJPEG}/usr/lib
	${CP} ${WRKINST}/usr/lib/libjpeg.so* ${IDIR_LIBJPEG}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
