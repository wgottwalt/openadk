# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libXpm
PKG_VERSION:=		3.5.9
PKG_RELEASE:=		1
PKG_MD5SUM:=		d6d4b0f76248a6b346eb42dfcdaa72a6
PKG_DESCR:=		common operation for the XPM pixmap format
PKG_SECTION:=		x11/libs
PKG_SITES:=		${MASTER_SITE_XORG}

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBXPM,libxpm,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ENV+=		ac_cv_search_gettext=no

post-install:
	${INSTALL_DIR} ${IDIR_LIBXPM}/usr/lib
	${CP} ${WRKINST}/usr/lib/libXpm.so* ${IDIR_LIBXPM}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
