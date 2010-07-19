# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		xvinfo
PKG_VERSION:=		1.1.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		cc00d609136ecc0b6b571dc42740a675
PKG_DESCR:=		Print out X-Video extension adaptor information
PKG_SECTION:=		x11/apps
PKG_DEPENDS:=		xorg-server
KG_BUILDDEP+=		xorg-server
PKG_URL:=		http://xorg.freedesktop.org/
PKG_SITES:=		http://xorg.freedesktop.org/archive/individual/app/

PKG_TARGET_DEPENDS:=	!foxboard

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,XVINFO,$(PKG_NAME),$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

post-install:
	$(INSTALL_DIR) $(IDIR_XVINFO)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/xvinfo \
		$(IDIR_XVINFO)/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
