# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		xbindkeys
PKG_VERSION:=		1.8.3
PKG_RELEASE:=		1
PKG_HASH:=		ca8033ffdc19f382ec35796318dd6a9e17f04aac1d54d75fb972db6d964f56b4
PKG_DESCR:=		keybindings for x11
PKG_BUILDDEP:=		libX11
PKG_SECTION:=		x11/utils
PKG_SITES:=		http://www.nongnu.org/xbindkeys/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,XBINDKEYS,xbindkeys,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ARGS+=	--disable-guile \
			--disable-tk
CONFIGURE_ENV+=		ac_cv_func_malloc_0_nonnull=yes
TARGET_LDFLAGS+=	-lX11

xbindkeys-install:
	$(INSTALL_DIR) $(IDIR_XBINDKEYS)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/xbindkeys \
		$(IDIR_XBINDKEYS)/usr/bin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
