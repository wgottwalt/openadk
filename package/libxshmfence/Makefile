# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		libxshmfence
PKG_VERSION:=		1.3
PKG_RELEASE:=		1
PKG_HASH:=		7eb3d46ad91bab444f121d475b11b39273142d090f7e9ac43e6a87f4ff5f902c
PKG_DESCR:=		interface to shared-memory fences
PKG_SECTION:=		x11/libs
PKG_SITES:=		http://www.x.org/releases/individual/lib/
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBXSHMFENCE,libxshmfence,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

libxshmfence-install:
	${INSTALL_DIR} ${IDIR_LIBXSHMFENCE}/usr/lib
	${CP} ${WRKINST}/usr/lib/libxshmfence.so* ${IDIR_LIBXSHMFENCE}/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
