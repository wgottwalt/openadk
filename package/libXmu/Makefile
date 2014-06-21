# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		libXmu
PKG_VERSION:=		1.1.1
PKG_RELEASE:=		2
PKG_MD5SUM:=		53fd02bc7174dd643a26bcc88147c146
PKG_DESCR:=		miscellaneous utility functions for x libraries
PKG_SECTION:=		x11/libs
PKG_BUILDDEP:=		libXt libXext
PKG_SITES:=		${MASTER_SITE_XORG}
PKG_LIBNAME:=		libxmu
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBXMU,libxmu,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

libxmu-install:
	${INSTALL_DIR} ${IDIR_LIBXMU}/usr/lib
	${CP} ${WRKINST}/usr/lib/libXmu.so* ${IDIR_LIBXMU}/usr/lib
	${CP} ${WRKINST}/usr/lib/libXmuu.so* ${IDIR_LIBXMU}/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
