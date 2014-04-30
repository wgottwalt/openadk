# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		librsvg
PKG_VERSION:=		2.40.2
PKG_RELEASE:=		1
PKG_MD5SUM:=		acdecdb9f08f3bf662a68bf7dafb8b82
PKG_DESCR:=		SVG library
PKG_BUILDDEP:=		libcroco
HOST_BUILDDEP:=		libcroco-host
PKG_SECTION:=		libs
PKG_URL:=		https://wiki.gnome.org/action/show/Projects/LibRsvg?action=show&redirect=LibRsvg
PKG_SITES:=		http://ftp.gnome.org/pub/gnome/sources/librsvg/2.40/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.xz

include $(TOPDIR)/mk/host.mk
include $(TOPDIR)/mk/package.mk

$(eval $(call HOST_template,LIBRSVG,librsvg,$(PKG_VERSION)-${PKG_RELEASE}))
$(eval $(call PKG_template,LIBRSVG,librsvg,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

HOST_STYLE:=		auto
CONFIGURE_ARGS+=	--enable-introspection=no

librsvg-install:
	$(INSTALL_DIR) $(IDIR_LIBRSVG)/usr/lib
	$(CP) $(WRKINST)/usr/lib/librsvg*.so* \
		$(IDIR_LIBRSVG)/usr/lib

include ${TOPDIR}/mk/host-bottom.mk
include ${TOPDIR}/mk/pkg-bottom.mk
