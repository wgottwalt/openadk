# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libXext
PKG_VERSION:=		1.3.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		249478eae5c4fab7722894cb99565405
PKG_DESCR:=		X client interface to extensions of the X protocol
PKG_SECTION:=		x11/libs
PKG_BUILDDEP:=		libX11 xextproto
PKG_SITES:=		${MASTER_SITE_XORG}

PKG_SUBPKGS:=		LIBXEXT LIBXEXT_DEV
PKGSD_LIBXEXT_DEV:=	X11 extension headers
PKGSC_LIBXEXT_DEV:=	x11/devel
PKGSS_LIBXEXT_DEV:=	xextproto

ifeq ($(ADK_STATIC),y)
PKG_OPTS:=		libonly
endif

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBXEXT,libxext,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))
$(eval $(call PKG_template,LIBXEXT_DEV,libxext-dev,$(PKG_VERSION)-${PKG_RELEASE},${PKGSS_LIBXEXT_DEV},${PKGSD_LIBXEXT_DEV},${PKGSC_LIBXEXT_DEV},${PKG_OPTS}))

CONFIGURE_ARGS+=	--disable-malloc0returnsnull

libxext-install:
	${INSTALL_DIR} ${IDIR_LIBXEXT}/usr/lib
	${CP} ${WRKINST}/usr/lib/libXext.so* ${IDIR_LIBXEXT}/usr/lib/

libxext-dev-install:
	${INSTALL_DIR} ${IDIR_LIBXEXT_DEV}/usr/include/X11/extensions
	${CP} ${WRKINST}/usr/include/X11/extensions/*.h \
		${IDIR_LIBXEXT_DEV}/usr/include/X11/extensions
	${INSTALL_DIR} ${IDIR_LIBXEXT_DEV}/usr/lib/pkgconfig
	${INSTALL_DATA} ${WRKINST}/usr/lib/pkgconfig/xext.pc \
		${IDIR_LIBXEXT_DEV}/usr/lib/pkgconfig

include ${TOPDIR}/mk/pkg-bottom.mk
