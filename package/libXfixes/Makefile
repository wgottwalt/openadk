# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		libXfixes
PKG_VERSION:=		5.0.3
PKG_RELEASE:=		1
PKG_HASH:=		9ab6c13590658501ce4bd965a8a5d32ba4d8b3bb39a5a5bc9901edffc5666570
PKG_DESCR:=		x11 fixes library
PKG_SECTION:=		x11/libs
PKG_BUILDDEP:=		fixesproto xextproto xproto libX11
HOST_BUILDDEP:=		fixesproto-host
PKG_URL:=		http://xorg.freedesktop.org/
PKG_SITES:=		http://www.x.org/releases/individual/lib/
PKG_LIBNAME:=		libxfixes
PKG_OPTS:=		dev

DISTFILES:=		$(PKG_NAME)-$(PKG_VERSION).tar.gz

include $(ADK_TOPDIR)/mk/host.mk
include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call HOST_template,LIBXFIXES,libxfixes,$(PKG_VERSION)-$(PKG_RELEASE)))
$(eval $(call PKG_template,LIBXFIXES,libxfixes,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION),$(PKG_OPTS)))

libxfixes-install:
	$(INSTALL_DIR) $(IDIR_LIBXFIXES)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libXfixes*.so* \
		$(IDIR_LIBXFIXES)/usr/lib

include $(ADK_TOPDIR)/mk/host-bottom.mk
include $(ADK_TOPDIR)/mk/pkg-bottom.mk
