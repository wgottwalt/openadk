# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		json-c
PKG_VERSION:=		0.13
PKG_RELEASE:=		1
PKG_HASH:=		0316780be9ad16c42d7c26b015a784fd5df4b0909fef0aba51cfb13e492ac24d
PKG_DESCR:=		json library
PKG_SECTION:=		libs/data
PKG_URL:=		https://github.com/json-c/json-c/wiki
PKG_SITES:=		https://s3.amazonaws.com/json-c_releases/releases/
PKG_OPTS:=		dev

DISTFILES:=		$(PKG_NAME)-$(PKG_VERSION).tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,JSON_C,json-c,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION),$(PKG_OPTS)))

CONFIGURE_ENV+=		ac_cv_func_malloc_0_nonnull=yes \
			ac_cv_func_realloc_0_nonnull=yes

json-c-install:
	$(INSTALL_DIR) $(IDIR_JSON_C)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libjson*.so* \
		$(IDIR_JSON_C)/usr/lib

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
