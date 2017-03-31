# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		ucl
PKG_VERSION:=		1.03
PKG_RELEASE:=		1
PKG_HASH:=		b865299ffd45d73412293369c9754b07637680e5c826915f097577cd27350348
PKG_DESCR:=		lossless data compression library
PKG_SECTION:=		libs/comp
PKG_URL:=		http://www.oberhumer.com/opensource/ucl/
PKG_SITES:=		http://www.oberhumer.com/opensource/ucl/download/
PKG_OPTS:=		dev
PKG_LIBNAME:=		libucl

DISTFILES:=             $(PKG_NAME)-$(PKG_VERSION).tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBUCL,libucl,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION),$(PKG_OPTS)))

TARGET_CFLAGS+=		-std=gnu90

libucl-install:
	$(INSTALL_DIR) $(IDIR_LIBUCL)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libucl*.so* \
		$(IDIR_LIBUCL)/usr/lib

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
