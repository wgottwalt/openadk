# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		tiff
PKG_VERSION:=		4.0.4
PKG_RELEASE:=		1
PKG_HASH:=		8cb1d90c96f61cdfc0bcf036acc251c9dbe6320334da941c7a83cfe1576ef890
PKG_DESCR:=		library for reading/writing tiff images
PKG_DEPENDS:=		libstdcxx
PKG_SECTION:=		libs/image
PKG_URL:=		http://www.libtiff.org/
PKG_SITES:=		ftp://ftp.remotesensing.org/pub/libtiff/
PKG_LIBNAME:=		libtiff
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBTIFF,libtiff,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIGURE_ARGS+=	--disable-cxx \
			--disable-rpath

libtiff-install:
	${INSTALL_DIR} ${IDIR_LIBTIFF}/usr/lib
	${CP} ${WRKINST}/usr/lib/libtiff.so* ${IDIR_LIBTIFF}/usr/lib/

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
