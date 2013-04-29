# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		mkfontdir
PKG_VERSION:=		1.0.6
PKG_RELEASE:=		1
PKG_MD5SUM:=		d13d01127f88eb50f5c6c3d47ae585e5
PKG_DESCR:=		font utility
PKG_SECTION:=		x11/apps
PKG_DEPENDS:=		mkfontscale
PKG_SITES:=		http://www.x.org/releases/X11R7.6/src/everything/
PKG_OPTS:=		noscripts

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,MKFONTDIR,$(PKG_NAME),$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

post-install:
	$(INSTALL_DIR) $(IDIR_MKFONTDIR)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/mkfontdir \
		$(IDIR_MKFONTDIR)/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
