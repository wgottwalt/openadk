# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libxshmfence
PKG_VERSION:=		1.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		323bb06c70765a2395df1d9c7ec3d14a
PKG_DESCR:=		interface to shared-memory fences
PKG_SECTION:=		x11/libs
PKG_SITES:=		${MASTER_SITE_XORG}
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBXSHMFENCE,libxshmfence,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

libxshmfence-install:
	${INSTALL_DIR} ${IDIR_LIBXSHMFENCE}/usr/lib
	${CP} ${WRKINST}/usr/lib/libxshmfence.so* ${IDIR_LIBXSHMFENCE}/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
