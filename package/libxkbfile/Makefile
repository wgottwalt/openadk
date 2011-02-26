# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libxkbfile
PKG_VERSION:=		1.0.6
PKG_RELEASE:=		1
PKG_MD5SUM:=		a1384a9a48430397aff236f97e26ed05
PKG_DESCR:=		X11 keyboard configuration extension library
PKG_SECTION:=		x11/libs
PKG_BUILDDEP:=		kbproto libX11
PKG_SITES:=		${MASTER_SITE_XORG}

PKG_SUBPKGS:=		LIBXKBFILE LIBXKBFILE_DEV
PKGSD_LIBXKBFILE_DEV:=	X11 keyboard configuration extension headers
PKGSC_LIBXKBFILE_DEV:=	devel

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBXKBFILE,libxkbfile,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIBXKBFILE_DEV,libxkbfile-dev,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_LIBXKBFILE_DEV},${PKGSC_LIBXKBFILE_DEV}))

libxkbfile-install:
	${INSTALL_DIR} ${IDIR_LIBXKBFILE}/usr/lib
	${CP} ${WRKINST}/usr/lib/libxkbfile.so* ${IDIR_LIBXKBFILE}/usr/lib

libxkbfile-dev-install:
	${INSTALL_DIR} ${IDIR_LIBXKBFILE_DEV}/usr/include
	${CP} ${WRKINST}/usr/include/* \
		${IDIR_LIBXKBFILE_DEV}/usr/include
	${INSTALL_DIR} ${IDIR_LIBXKBFILE_DEV}/usr/lib/pkgconfig
	${INSTALL_DATA} ${WRKINST}/usr/lib/pkgconfig/xkbfile.pc \
		${IDIR_LIBXKBFILE_DEV}/usr/lib/pkgconfig

include ${TOPDIR}/mk/pkg-bottom.mk
