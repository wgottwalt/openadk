# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		xvinfo
PKG_VERSION:=		1.1.1
PKG_RELEASE:=		1
PKG_HASH:=		0d26f9efd5274e6ce4186603457deba60d79fd95a0600bc940306783c3b8a97d
PKG_DESCR:=		print out x-video extension adaptor information
PKG_SECTION:=		x11/utils
PKG_BUILDDEP:=		libXv
PKG_URL:=		http://xorg.freedesktop.org/
PKG_SITES:=		${MASTER_SITE_XORG}

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,XVINFO,xvinfo,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

xvinfo-install:
	$(INSTALL_DIR) $(IDIR_XVINFO)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/xvinfo \
		$(IDIR_XVINFO)/usr/bin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
