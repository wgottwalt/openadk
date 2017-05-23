# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		tiff
PKG_VERSION:=		4.0.8
PKG_RELEASE:=		1
PKG_HASH:=		59d7a5a8ccd92059913f246877db95a2918e6c04fb9d43fd74e5c3390dac2910
PKG_DESCR:=		library for reading/writing tiff images
PKG_SECTION:=		libs/image
PKG_NEEDS:=		c++
PKG_BUILDDEP:=		cmake-host zlib xz
PKG_URL:=		http://simplesystems.org/libtiff/
PKG_SITES:=		http://download.osgeo.org/libtiff/
PKG_LIBNAME:=		libtiff
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBTIFF,libtiff,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIG_STYLE:=		cmake

libtiff-install:
	${INSTALL_DIR} ${IDIR_LIBTIFF}/usr/lib
	${CP} ${WRKINST}/usr/lib/libtiff.so* ${IDIR_LIBTIFF}/usr/lib/

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
