# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libxkbfile
PKG_VERSION:=		1.0.8
PKG_RELEASE:=		2
PKG_MD5SUM:=		f5b92ef9813c6b78105dfa960ddddcaa
PKG_DESCR:=		keyboard configuration extension library
PKG_SECTION:=		x11/libs
PKG_BUILDDEP:=		kbproto libX11
PKG_SITES:=		${MASTER_SITE_XORG}
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBXKBFILE,libxkbfile,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

libxkbfile-install:
	${INSTALL_DIR} ${IDIR_LIBXKBFILE}/usr/lib
	${CP} ${WRKINST}/usr/lib/libxkbfile.so* ${IDIR_LIBXKBFILE}/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
