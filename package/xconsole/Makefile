# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		xconsole
PKG_VERSION:=		1.0.4
PKG_RELEASE:=		1
PKG_HASH:=		71fabb3f41af726ef2a81d50100d8741ba0b4e7bcb40fad102d9cee943444ca2
PKG_DESCR:=		console application
PKG_SECTION:=		x11/utils
PKG_BUILDDEP:=		libXaw
PKG_URL:=		http://xorg.freedesktop.org/
PKG_SITES:=		${MASTER_SITE_XORG}

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,XCONSOLE,xconsole,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

xconsole-install:
	$(INSTALL_DIR) $(IDIR_XCONSOLE)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/xconsole \
		$(IDIR_XCONSOLE)/usr/bin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
