# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libXi
PKG_VERSION:=		1.4.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		b9dfc98b27e3770567e4c6a3365a21b7
PKG_DESCR:=		X Window System client interface to the XINPUT extension to the X protocol.
PKG_SECTION:=		x11/libs
PKG_BUILDDEP:=		xproto xextproto libXext
PKG_URL:=		http://xorg.freedesktop.org/
PKG_SITES:=		${MASTER_SITE_XORG}

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBXI,libxi,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ARGS+=	--disable-malloc0returnsnull

post-install:
	$(INSTALL_DIR) $(IDIR_LIBXI)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libXi*.so* \
		$(IDIR_LIBXI)/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
