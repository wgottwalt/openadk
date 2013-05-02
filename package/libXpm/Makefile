# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libXpm
PKG_VERSION:=		3.5.10
PKG_RELEASE:=		1
PKG_MD5SUM:=		a70507638d74541bf30a771f1e5938bb
PKG_DESCR:=		common operation for the XPM pixmap format
PKG_BUILDDEP:=		libX11 libXt
PKG_SECTION:=		x11/libs
PKG_SITES:=		${MASTER_SITE_XORG}

PKG_SUBPKGS:=		LIBXPM LIBXPM_DEV
PKGSD_LIBXPM_DEV:=	XPM pixmap format headers
PKGSC_LIBXPM_DEV:=	x11/devel

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBXPM,libxpm,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIBXPM_DEV,libxpm-dev,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_LIBXPM_DEV},${PKGSC_LIBXPM_DEV}))

CONFIGURE_ENV+=		ac_cv_search_gettext=no

libxpm-install:
	${INSTALL_DIR} ${IDIR_LIBXPM}/usr/lib
	${CP} ${WRKINST}/usr/lib/libXpm.so* ${IDIR_LIBXPM}/usr/lib

libxpm-dev-install:
	${INSTALL_DIR} ${IDIR_LIBXPM_DEV}/usr/include
	${CP} ${WRKINST}/usr/include/* ${IDIR_LIBXPM_DEV}/usr/include
	${INSTALL_DIR} ${IDIR_LIBXPM_DEV}/usr/lib/pkgconfig
	${INSTALL_DATA} ${WRKINST}/usr/lib/pkgconfig/*.pc \
		${IDIR_LIBXPM_DEV}/usr/lib/pkgconfig

include ${TOPDIR}/mk/pkg-bottom.mk
