# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		polarssl
PKG_VERSION:=		1.3.6
PKG_RELEASE:=		1
PKG_MD5SUM:=		1245884d3e73150cfcc196f91de2b5c4
PKG_DESCR:=		embedded ssl/tls library
PKG_SECTION:=		libs/crypto
PKG_URL:=		https://polarssl.org/
PKG_SITES:=		https://polarssl.org/download/
PKG_LIBNAME:=		libpolarssl
PKG_OPTS:=		dev

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}-gpl.tgz

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBPOLARSSL,libpolarssl,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIG_STYLE:=		manual
ALL_TARGET:=		lib
TARGET_CFLAGS+=		-DSHARED

libpolarssl-install:
	$(INSTALL_DIR) $(IDIR_LIBPOLARSSL)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libpolarssl.so* \
		$(IDIR_LIBPOLARSSL)/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
