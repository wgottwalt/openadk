# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		mkfontdir
PKG_VERSION:=		1.0.7
PKG_RELEASE:=		1
PKG_HASH:=		bccc5fb7af1b614eabe4a22766758c87bfc36d66191d08c19d2fa97674b7b5b7
PKG_DESCR:=		font utility
PKG_SECTION:=		x11/fonts
PKG_DEPENDS:=		mkfontscale
PKG_SITES:=		http://www.x.org/releases/individual/app/
PKG_OPTS:=		noscripts

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,MKFONTDIR,mkfontdir,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

mkfontdir-install:
	$(INSTALL_DIR) $(IDIR_MKFONTDIR)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/mkfontdir \
		$(IDIR_MKFONTDIR)/usr/bin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
