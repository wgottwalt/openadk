# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		atk
PKG_VERSION:=		1.33.6
PKG_RELEASE:=		1
PKG_MD5SUM:=		4338e0c94f767714f4786878112750dd
PKG_DESCR:=		atk library
PKG_SECTION:=		libs
PKG_BUILDDEP:=		glib
PKG_URL:=		http://www.gnome.org/
PKG_SITES:=		${MASTER_SITE_GNOME:=/atk/1.33/}

#DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.xz

PKG_SUBPKGS:=		LIBATK LIBATK_DEV
PKGSC_LIBATK_DEV:=	devel
PKGSD_LIBATK_DEV:=	libatk headers

ifeq ($(ADK_STATIC),y)
PKG_OPTS:=		libonly
endif

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBATK,libatk,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))
$(eval $(call PKG_template,LIBATK_DEV,libatk-dev,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_LIBATK_DEV},${PKGSC_LIBATK_DEV},${PKG_OPTS}))

libatk-install:
	${INSTALL_DIR} ${IDIR_LIBATK}/usr/lib
	${CP} ${WRKINST}/usr/lib/libatk-*.so* ${IDIR_LIBATK}/usr/lib

libatk-dev-install:
	${INSTALL_DIR} ${IDIR_LIBATK_DEV}/usr/lib/pkgconfig
	${CP} ${WRKINST}/usr/lib/pkgconfig/*.pc ${IDIR_LIBATK_DEV}/usr/lib/pkgconfig
	${INSTALL_DIR} ${IDIR_LIBATK_DEV}/usr/include
	${CP} ${WRKINST}/usr/include/* ${IDIR_LIBATK_DEV}/usr/include

include ${TOPDIR}/mk/pkg-bottom.mk
