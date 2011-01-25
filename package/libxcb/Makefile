# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libxcb
PKG_VERSION:=		1.7
PKG_RELEASE:=		1
PKG_MD5SUM:=		f715e53c9c1b25f856d14d6123663d96
PKG_DESCR:=		X11 keyboard library
PKG_SECTION:=		x11/libs
PKG_BUILDDEP:=		python2 libpthread-stubs
PKG_SITES:=		${MASTER_SITE_XORG}

PKG_SUBPKGS:=		LIBXCB LIBXCB_DEVEL

PKGSD_LIBXCB_DEVEL:=	XML-XCB protocol headers
PKGSS_LIBXCB_DEVEL:=	libxcb
PKGSC_LIBXCB_DEVEL:=	x11/devel

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBXCB,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIBXCB_DEVEL,${PKG_NAME}-devel,${PKG_VERSION}-${PKG_RELEASE},${PKGSS_LIBXCB_DEVEL},${PKGSD_LIBXCB_DEVEL},${PKGSC_LIBXCB_DEVEL}))

include $(TOPDIR)/mk/python.mk

libxcb-install:
	${INSTALL_DIR} ${IDIR_LIBXCB}/usr/lib
	${CP} ${WRKINST}/usr/lib/libxcb*.so* ${IDIR_LIBXCB}/usr/lib/

libxcb-devel-install:
	${INSTALL_DIR} ${IDIR_LIBXCB_DEVEL}/usr/include
	${CP} ${WRKINST}/usr/include/xcb ${IDIR_LIBXCB_DEVEL}/usr/include

include ${TOPDIR}/mk/pkg-bottom.mk
