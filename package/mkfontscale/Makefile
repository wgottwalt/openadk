# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		mkfontscale
PKG_VERSION:=		1.1.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		c663f511a17e0052fe08139700321955
PKG_DESCR:=		font utility
PKG_SECTION:=		x11/fonts
PKG_BUILDDEP:=		freetype libfontenc
PKG_SITES:=		${MASTER_SITE_XORG}

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,MKFONTSCALE,mkfontscale,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

mkfontscale-install:
	$(INSTALL_DIR) $(IDIR_MKFONTSCALE)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/mkfontscale \
		$(IDIR_MKFONTSCALE)/usr/bin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
