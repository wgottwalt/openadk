# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		xcb-util
PKG_VERSION:=		0.3.6
PKG_RELEASE:=		1
PKG_MD5SUM:=		a8f8f710a202079d1ead532abd061672
PKG_DESCR:=		XCB utils
PKG_SECTION:=		x11/apps
PKG_SITES:=		http://xcb.freedesktop.org/dist/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,XCB_UTIL,xcb-util,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

xcb-util-install:
	$(INSTALL_DIR) $(IDIR_XCB_UTIL)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libxcb-*.so* \
		$(IDIR_XCB_UTIL)/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
