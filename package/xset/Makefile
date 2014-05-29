# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		xset
PKG_VERSION:=		1.2.2
PKG_RELEASE:=		1
PKG_MD5SUM:=		25bafb9ec4de87f2c44dde5e1dd12dab
PKG_DESCR:=		set utility
PKG_SECTION:=		x11/utils
PKG_BUILDDEP:=		libXmu
PKG_URL:=		http://xorg.freedesktop.org/
PKG_SITES:=		${MASTER_SITE_XORG}

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,XSET,xset,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

xset-install:
	$(INSTALL_DIR) $(IDIR_XSET)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/xset \
		$(IDIR_XSET)/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
