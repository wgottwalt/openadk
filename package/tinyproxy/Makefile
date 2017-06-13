# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		tinyproxy
PKG_VERSION:=		1.8.4
PKG_RELEASE:=		1
PKG_HASH:=		1999c88c43e31ff4cb5e8379b76776a65fa3d326eea868cb5f88ef58a8f631de
PKG_DESCR:=		lightweight http and https proxy
PKG_SECTION:=		net/proxy
PKG_URL:=		https://tinyproxy.github.io
PKG_SITES:=		https://github.com/tinyproxy/tinyproxy/archive/

DISTFILES:=		$(PKG_VERSION).tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,TINYPROXY,tinyproxy,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION)))

AUTOTOOL_STYLE:=	autoreconf
CONFIGURE_ARGS+=	--disable-regexcheck
CONFIGURE_ENV+=         ac_cv_func_malloc_0_nonnull=yes \
			ac_cv_func_realloc_0_nonnull=yes

tinyproxy-install:
	$(INSTALL_DIR) $(IDIR_TINYPROXY)/usr/sbin
	$(INSTALL_DIR) $(IDIR_TINYPROXY)/etc
	$(INSTALL_DIR) $(IDIR_TINYPROXY)/usr/share/tinyproxy
	$(INSTALL_DATA) ./files/tinyproxy.conf \
		$(IDIR_TINYPROXY)/etc
	$(INSTALL_BIN) $(WRKINST)/usr/sbin/tinyproxy \
		$(IDIR_TINYPROXY)/usr/sbin/
	$(INSTALL_DATA) $(WRKINST)/usr/share/tinyproxy/{default,stats,debug}.html \
		$(IDIR_TINYPROXY)/usr/share/tinyproxy/

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
