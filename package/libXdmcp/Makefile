# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libXdmcp
PKG_VERSION:=		1.1.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		194f30d2bb67b23dc33351e128db40a9
PKG_DESCR:=		X11 display manager control protocol library
PKG_SECTION:=		x11/libs
PKG_BUILDDEP:=		xproto
PKG_SITES:=		${MASTER_SITE_XORG}

PKG_SUBPKGS:=		LIBXDMCP LIBXDMCP_DEV
PKGSB_LIBXDMCP:=	xproto
PKGSD_LIBXDMCP_DEV:=	XDMCP headers
PKGSC_LIBXDMCP_DEV:=	x11/devel

ifeq ($(ADK_STATIC),y)
PKG_OPTS:=		libonly
endif

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBXDMCP,libxdmcp,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))
$(eval $(call PKG_template,LIBXDMCP_DEV,libxdmcp-dev,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_LIBXDMCP_DEV},${PKGSC_LIBXDMCP_DEV},${PKG_OPTS}))

libxdmcp-install:
	${INSTALL_DIR} ${IDIR_LIBXDMCP}/usr/lib
	${CP} ${WRKINST}/usr/lib/libXdmcp.so* ${IDIR_LIBXDMCP}/usr/lib

libxdmcp-dev-install:
	${INSTALL_DIR} ${IDIR_LIBXDMCP_DEV}/usr/include/X11
	${CP} ${WRKINST}/usr/include/X11/* \
		${IDIR_LIBXDMCP_DEV}/usr/include/X11
	${INSTALL_DIR} ${IDIR_LIBXDMCP_DEV}/usr/lib/pkgconfig
	${CP} ${WRKINST}/usr/lib/pkgconfig/*.pc \
		${IDIR_LIBXDMCP_DEV}/usr/lib/pkgconfig

include ${TOPDIR}/mk/pkg-bottom.mk
