# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		mkfontscale
PKG_VERSION:=		1.0.8
PKG_RELEASE:=		1
PKG_MD5SUM:=		ae166427657f6f31183b2e4378231110
PKG_DESCR:=		font utility
PKG_SECTION:=		x11/apps
PKG_BUILDDEP:=		freetype libfontenc
PKG_SITES:=		http://www.x.org/releases/X11R7.6/src/everything/

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,MKFONTSCALE,$(PKG_NAME),$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

post-install:
	$(INSTALL_DIR) $(IDIR_MKFONTSCALE)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/mkfontscale \
		$(IDIR_MKFONTSCALE)/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
