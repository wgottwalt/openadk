# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		tiff
PKG_VERSION:=		3.9.4
PKG_RELEASE:=		4
PKG_MD5SUM:=		2006c1bdd12644dbf02956955175afd6
PKG_DESCR:=		library for reading/writing tiff images
PKG_DEPENDS:=		libstdcxx
PKG_SECTION:=		libs/image
PKG_URL:=		http://www.libtiff.org/
PKG_SITES:=		ftp://ftp.remotesensing.org/pub/libtiff/
PKG_LIBNAME:=		libtiff
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

ifeq ($(ADK_STATIC),y)
PKG_OPTS+=		libonly
endif

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBTIFF,libtiff,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIGURE_ARGS+=	--disable-cxx \
			--disable-rpath

libtiff-install:
	${INSTALL_DIR} ${IDIR_LIBTIFF}/usr/lib
	${CP} ${WRKINST}/usr/lib/libtiff.so* ${IDIR_LIBTIFF}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
