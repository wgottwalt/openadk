# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		libtiff
PKG_VERSION:=		3.9.4
PKG_RELEASE:=		1
PKG_MD5SUM:=		2006c1bdd12644dbf02956955175afd6
PKG_DESCR:=		A library for reading/writing TIFF images
PKG_SECTION:=		libs
PKG_URL:=		http://www.libtiff.org/
PKG_SITES:=		ftp://ftp.remotesensing.org/pub/libtiff/

DISTFILES:=		tiff-${PKG_VERSION}.tar.gz
WRKDIST=		${WRKDIR}/tiff-${PKG_VERSION}

ifeq ($(ADK_STATIC),y)
PKG_OPTS:=		libonly
endif

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBTIFF,libtiff,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIGURE_ARGS+=	--disable-cxx

post-install:
	${INSTALL_DIR} ${IDIR_LIBTIFF}/usr/lib
	${CP} ${WRKINST}/usr/lib/libtiff.so* ${IDIR_LIBTIFF}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
