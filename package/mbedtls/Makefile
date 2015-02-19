# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		mbedtls
PKG_VERSION:=		1.3.10
PKG_RELEASE:=		1
PKG_HASH:=		bf981c989b4fddbda4c6ab448623c2f6f928a6c3ab1b0c0295084dae0f63e854
PKG_DESCR:=		embedded ssl/tls library
PKG_SECTION:=		libs/crypto
PKG_URL:=		https://polarssl.org/
PKG_SITES:=		https://github.com/polarssl/polarssl/archive/
PKG_LIBNAME:=		libmbedtls
PKG_OPTS:=		dev

DISTFILES:=             $(PKG_NAME)-$(PKG_VERSION).tar.gz
WRKDIST=		$(WRKDIR)/polarssl-$(PKG_NAME)-$(PKG_VERSION)

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBMBEDTLS,libmbedtls,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION),$(PKG_OPTS)))

CONFIG_STYLE:=		manual
ALL_TARGET:=		lib
TARGET_CFLAGS+=		-DSHARED

libpolarssl-install:
	$(INSTALL_DIR) $(IDIR_LIBMBEDTLS)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libpolarssl.so* \
		$(IDIR_LIBMBEDTLS)/usr/lib

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
