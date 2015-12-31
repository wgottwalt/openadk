# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		libXi
PKG_VERSION:=		1.7.6
PKG_RELEASE:=		1
PKG_HASH:=		4e88fa7decd287e58140ea72238f8d54e4791de302938c83695fc0c9ac102b7e
PKG_DESCR:=		client interface to the xinput extension
PKG_SECTION:=		x11/libs
PKG_BUILDDEP:=		xproto xextproto libXext libXfixes
HOST_BUILDDEP:=		libXfixes-host
PKG_URL:=		http://xorg.freedesktop.org/
PKG_SITES:=		http://www.x.org/releases/individual/lib/
PKG_LIBNAME:=		libxi
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/host.mk
include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call HOST_template,LIBXI,libxi,$(PKG_VERSION)-${PKG_RELEASE}))
$(eval $(call PKG_template,LIBXI,libxi,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},$(PKG_OPTS)))

HOST_STYLE:=		auto
CONFIGURE_ARGS+=	--disable-malloc0returnsnull

libxi-install:
	$(INSTALL_DIR) $(IDIR_LIBXI)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libXi*.so* \
		$(IDIR_LIBXI)/usr/lib

include ${ADK_TOPDIR}/mk/host-bottom.mk
include ${ADK_TOPDIR}/mk/pkg-bottom.mk
