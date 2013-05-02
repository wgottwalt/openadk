# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libXaw
PKG_VERSION:=		1.0.11
PKG_RELEASE:=		1
PKG_MD5SUM:=		c487a810a8a9b0eb5091f382790b4e75
PKG_DESCR:=		X11 Athena Widget library
PKG_SECTION:=		x11/libs
PKG_BUILDDEP:=		libXext libXmu libXpm
PKG_SITES:=		${MASTER_SITE_XORG}

PKG_SUBPKGS:=		LIBXAW LIBXAW_DEV
PKGSC_LIBXAW_DEV:=	x11/devel
PKGSD_LIBXAW_DEV:=	X11 Athena Widget headers

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBXAW,libxaw,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIBXAW_DEV,libxaw-dev,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_LIBXAW_DEV},${PKGSC_LIBXAW_DEV}))

libxaw-install:
	${INSTALL_DIR} ${IDIR_LIBXAW}/usr/lib
	${CP} ${WRKINST}/usr/lib/libXaw*.so* ${IDIR_LIBXAW}/usr/lib

libxaw-dev-install:
	${INSTALL_DIR} ${IDIR_LIBXAW_DEV}/usr/include
	${CP} ${WRKINST}/usr/include/* ${IDIR_LIBXAW_DEV}/usr/include

include ${TOPDIR}/mk/pkg-bottom.mk
