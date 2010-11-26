# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libXdmcp
PKG_VERSION:=		1.0.3
PKG_RELEASE:=		2
PKG_MD5SUM:=		c3f1bce1affc7dfbc222145e00e1310e
PKG_DESCR:=		X11 display manager control protocol library
PKG_SECTION:=		x11/libs
PKG_SITES:=		${MASTER_SITE_XORG}

PKG_SUBPKGS:=		LIBXDMCP LIBXDMCP_DEV
PKGSD_LIBXDMCP_DEV:=	XDMCP headers
PKGSC_LIBXDMCP_DEV:=	devel

ifeq ($(ADK_STATIC),y)
PKG_OPTS:=		libonly
endif

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBXDMCP,libxdmcp,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))
$(eval $(call PKG_template,LIBXDMCP_DEV,libxdmcp-dev,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_LIBXDMCP_DEV},${PKGSC_LIBXDMCP_DEV},${PKG_OPTS}))

SUB_INSTALLS-y:=
SUB_INSTALLS-m:=
SUB_INSTALLS-${ADK_PACKAGE_LIBXDMCP_DEV}+=libxdmcp-dev-install

post-install: ${SUB_INSTALLS-m} ${SUB_INSTALLS-y}
	${INSTALL_DIR} ${IDIR_LIBXDMCP}/usr/lib
	${CP} ${WRKINST}/usr/lib/libXdmcp.so* ${IDIR_LIBXDMCP}/usr/lib/

libxdmcp-dev-install:
	${INSTALL_DIR} ${IDIR_LIBXDMCP_DEV}/usr/include/X11/
	${CP} ${WRKINST}/usr/include/X11/* \
		${IDIR_LIBXDMCP_DEV}/usr/include/X11/
	

include ${TOPDIR}/mk/pkg-bottom.mk
