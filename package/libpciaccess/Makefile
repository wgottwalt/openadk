# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libpciaccess
PKG_VERSION:=		0.11.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		8f7ea197384e5ddd1c355f55e639f677
PKG_DESCR:=		X.org PCI access library
PKG_SECTION:=		x11/libs
PKG_SITES:=		${MASTER_SITE_XORG}

PKG_SUBPKGS:=		LIBPCIACCESS LIBPCIACCESS_DEV
PKGSD_LIBPCIACCESS_DEV:=X.org PCI access headers
PKGSC_LIBPCIACCESS_DEV:=devel

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBPCIACCESS,libpciaccess,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIBPCIACCESS_DEV,libpciaccess-dev,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_LIBPCIACCESS_DEV},${PKGSC_LIBPCIACCESS_DEV}))

libpciaccess-install:
	${INSTALL_DIR} ${IDIR_LIBPCIACCESS}/usr/lib
	${CP} ${WRKINST}/usr/lib/libpciaccess.so* \
		${IDIR_LIBPCIACCESS}/usr/lib

libpciaccess-dev-install:
	${INSTALL_DIR} ${IDIR_LIBPCIACCESS_DEV}/usr/include
	${CP} ${WRKINST}/usr/include/pciaccess.h \
		${IDIR_LIBPCIACCESS_DEV}/usr/include
	${INSTALL_DIR} ${IDIR_LIBPCIACCESS_DEV}/usr/lib/pkgconfig
	${INSTALL_DATA} ${WRKINST}/usr/lib/pkgconfig/pciaccess.pc \
		${IDIR_LIBPCIACCESS_DEV}/usr/lib/pkgconfig

include ${TOPDIR}/mk/pkg-bottom.mk
