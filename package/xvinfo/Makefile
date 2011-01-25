# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		xvinfo
PKG_VERSION:=		1.1.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		49f5a19ddff9393aaea4ecaacaedddb3
PKG_DESCR:=		Print out X-Video extension adaptor information
PKG_SECTION:=		x11/apps
PKG_DEPENDS:=		xorg-server
PKG_BUILDDEP:=		xorg-server
PKG_URL:=		http://xorg.freedesktop.org/
PKG_SITES:=		${MASTER_SITE_XORG}

PKG_ARCH_DEPENDS:=	!cris

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,XVINFO,$(PKG_NAME),$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

post-install:
	$(INSTALL_DIR) $(IDIR_XVINFO)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/xvinfo \
		$(IDIR_XVINFO)/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
