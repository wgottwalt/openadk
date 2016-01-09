# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		mbedtls
PKG_VERSION:=		2.2.1
PKG_RELEASE:=		1
PKG_HASH:=		6ddd5ca2e7dfb43d2fd750400856246fc1c98344dabf01b1594eb2f9880ef7ce
PKG_DESCR:=		embedded ssl/tls library
PKG_SECTION:=		libs/crypto
PKG_URL:=		https://tls.mbed.org
PKG_SITES:=		https://tls.mbed.org/download/
PKG_LIBNAME:=		libmbedtls
PKG_OPTS:=		dev

DISTFILES:=             $(PKG_NAME)-$(PKG_VERSION)-apache.tgz

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
