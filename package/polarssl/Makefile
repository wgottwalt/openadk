# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		polarssl
PKG_VERSION:=		1.3.9
PKG_RELEASE:=		1
PKG_HASH:=		d3605afc28ed4b7d1d9e3142d72e42855e4a23c07c951bbb0299556b02d36755
PKG_DESCR:=		embedded ssl/tls library
PKG_SECTION:=		libs/crypto
PKG_URL:=		https://polarssl.org/
PKG_SITES:=		https://polarssl.org/download/
PKG_LIBNAME:=		libpolarssl
PKG_OPTS:=		dev

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}-gpl.tgz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBPOLARSSL,libpolarssl,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIG_STYLE:=		manual
ALL_TARGET:=		lib
TARGET_CFLAGS+=		-DSHARED

libpolarssl-install:
	$(INSTALL_DIR) $(IDIR_LIBPOLARSSL)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libpolarssl.so* \
		$(IDIR_LIBPOLARSSL)/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
