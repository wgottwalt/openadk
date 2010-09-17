# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		expat
PKG_VERSION:=		2.0.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		ee8b492592568805593f81f8cdf2a04c
PKG_DESCR:=		a XML parsing library
PKG_SECTION:=		libs
PKG_URL:=		http://expat.sourceforge.net
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=expat/}

PKG_SUBPKGS:=		LIBEXPAT LIBEXPAT_DEV
PKGSD_LIBEXPAT_DEV:=	development files for expat
PKGSC_LIBEXPAT_DEV:=	devel

ifeq ($(ADK_STATIC),y)
PKG_OPTS:=		libonly
endif

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBEXPAT,libexpat,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))
$(eval $(call PKG_template,LIBEXPAT_DEV,libexpat-dev,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_LIBEXPAT_DEV},${PKGSC_LIBEXPAT_DEV}))

SUB_INSTALLS-y:=
SUB_INSTALLS-m:=
SUB_INSTALLS-${ADK_PACKAGE_LIBEXPAT_DEV}+=	libexpat-dev-install

post-install: ${SUB_INSTALLS-m} ${SUB_INSTALLS-y}
	${INSTALL_DIR} ${IDIR_LIBEXPAT}/usr/lib
	${CP} ${WRKINST}/usr/lib/libexpat.so* ${IDIR_LIBEXPAT}/usr/lib/

libexpat-dev-install:
	${INSTALL_DIR} ${IDIR_LIBEXPAT_DEV}/usr/include
	${CP} ${WRKINST}/usr/include/*.h ${IDIR_LIBEXPAT_DEV}/usr/include

include ${TOPDIR}/mk/pkg-bottom.mk
