# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libxcb
PKG_VERSION:=		1.7
PKG_RELEASE:=		1
PKG_MD5SUM:=		f715e53c9c1b25f856d14d6123663d96
PKG_DESCR:=		X11 keyboard library
PKG_SECTION:=		x11/libs
PKG_BUILDDEP:=		python2 libpthread-stubs libxslt libXau xcb-proto
PKG_SITES:=		${MASTER_SITE_XORG}

PKG_SUBPKGS:=		LIBXCB LIBXCB_DEV
PKGSD_LIBXCB_DEV:=	XML-XCB protocol headers
PKGSS_LIBXCB_DEV:=	libxcb
PKGSC_LIBXCB_DEV:=	x11/devel

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBXCB,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIBXCB_DEV,${PKG_NAME}-dev,${PKG_VERSION}-${PKG_RELEASE},${PKGSS_LIBXCB_DEV},${PKGSD_LIBXCB_DEV},${PKGSC_LIBXCB_DEV}))

include $(TOPDIR)/mk/python.mk

CONFIGURE_ENV+=		PYTHON=$(PYTHON)

libxcb-install:
	${INSTALL_DIR} ${IDIR_LIBXCB}/usr/lib
	${CP} ${WRKINST}/usr/lib/libxcb*.so* ${IDIR_LIBXCB}/usr/lib/

libxcb-dev-install:
	${INSTALL_DIR} ${IDIR_LIBXCB_DEV}/usr/include
	${CP} ${WRKINST}/usr/include/xcb ${IDIR_LIBXCB_DEV}/usr/include
	${INSTALL_DIR} ${IDIR_LIBXCB_DEV}/usr/lib/pkgconfig
	${CP} ${WRKINST}/usr/lib/pkgconfig/*.pc \
		${IDIR_LIBXCB_DEV}/usr/lib/pkgconfig

include ${TOPDIR}/mk/pkg-bottom.mk
