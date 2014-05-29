# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libXdmcp
PKG_VERSION:=		1.1.1
PKG_RELEASE:=		2
PKG_MD5SUM:=		194f30d2bb67b23dc33351e128db40a9
PKG_DESCR:=		display manager control protocol library
PKG_SECTION:=		x11/libs
PKG_BUILDDEP:=		xproto
PKG_SITES:=		${MASTER_SITE_XORG}
PKG_LIBNAME:=		libxdmcp
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

ifeq ($(ADK_STATIC),y)
PKG_OPTS+=		libonly
endif

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBXDMCP,libxdmcp,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

libxdmcp-install:
	${INSTALL_DIR} ${IDIR_LIBXDMCP}/usr/lib
	${CP} ${WRKINST}/usr/lib/libXdmcp.so* ${IDIR_LIBXDMCP}/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
