# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libXmu
PKG_VERSION:=		1.1.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		15e1cb9aaf97eae169bfe6944e0a541e
PKG_DESCR:=		miscellaneous utility functions for X libraries
PKG_SECTION:=		x11/libs
PKG_BUILDDEP:=		libXt
PKG_SITES:=		${MASTER_SITE_XORG}

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBXMU,libxmu,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

post-install:
	${INSTALL_DIR} ${IDIR_LIBXMU}/usr/lib
	${CP} ${WRKINST}/usr/lib/libXmu.so* ${IDIR_LIBXMU}/usr/lib/
	${CP} ${WRKINST}/usr/lib/libXmuu.so* ${IDIR_LIBXMU}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
