# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		libxkbfile
PKG_VERSION:=		1.0.8
PKG_RELEASE:=		2
PKG_HASH:=		e7a95626b9c74c8a4765302890907f35d8a7e701840a69e3fb21160cd735ac80
PKG_DESCR:=		keyboard configuration extension library
PKG_SECTION:=		x11/libs
PKG_BUILDDEP:=		kbproto libX11
PKG_SITES:=		${MASTER_SITE_XORG}
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBXKBFILE,libxkbfile,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

libxkbfile-install:
	${INSTALL_DIR} ${IDIR_LIBXKBFILE}/usr/lib
	${CP} ${WRKINST}/usr/lib/libxkbfile.so* ${IDIR_LIBXKBFILE}/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
