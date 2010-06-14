# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libXi
PKG_VERSION:=		1.3
PKG_RELEASE:=		1
PKG_MD5SUM:=		1c038312e4f9b61fe72e52d0f59a01d5
PKG_DESCR:=		X Window System client interface to the XINPUT extension to the X protocol.
PKG_SECTION:=		x11
PKG_BUILDDEP+=		xproto xextproto libXext
PKG_URL:=		http://xorg.freedesktop.org/
PKG_SITES:=		http://xorg.freedesktop.org/releases/individual/lib/

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBXI,libxi,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ARGS+= 	--disable-malloc0returnsnull

post-install:
	$(INSTALL_DIR) $(IDIR_LIBXI)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libXi*.so* \
		$(IDIR_LIBXI)/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
