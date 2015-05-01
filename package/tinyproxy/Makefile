# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		tinyproxy
PKG_VERSION:=		1.8.3
PKG_RELEASE:=		2
PKG_HASH:=		682416c8f0f733a8106c87bb395c631222569751fe4617bc381d0499b0f0c017
PKG_DESCR:=		lightweight http and https proxy
PKG_SECTION:=		net/proxy
PKG_URL:=		https://www.banu.com/tinyproxy/
PKG_SITES:=		https://www.banu.com/pub/tinyproxy/1.8/

DISTFILES:=		$(PKG_NAME)-$(PKG_VERSION).tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,TINYPROXY,tinyproxy,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION)))

AUTOTOOL_STYLE:=	autoreconf
CONFIGURE_ARGS+=	--disable-regexcheck
CONFIGURE_ENV+=         ac_cv_func_malloc_0_nonnull=yes \
			ac_cv_func_realloc_0_nonnull=yes

tinyproxy-install:
	$(INSTALL_DIR) $(IDIR_TINYPROXY)/usr/sbin
	$(INSTALL_DIR) $(IDIR_TINYPROXY)/etc/tinyproxy
	$(INSTALL_DIR) $(IDIR_TINYPROXY)/usr/share/tinyproxy
	$(INSTALL_DATA) ./files/tinyproxy.conf \
		$(IDIR_TINYPROXY)/etc/tinyproxy
	$(INSTALL_BIN) $(WRKINST)/usr/sbin/tinyproxy \
		$(IDIR_TINYPROXY)/usr/sbin/
	$(INSTALL_DATA) $(WRKINST)/usr/share/tinyproxy/{default,stats,debug}.html \
		$(IDIR_TINYPROXY)/usr/share/tinyproxy/

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
