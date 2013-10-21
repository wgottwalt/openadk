# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		polarssl
PKG_VERSION:=		1.2.8
PKG_RELEASE:=		1
PKG_MD5SUM:=		985151639b1ca037293f06da44fbc6bc
PKG_DESCR:=		embedded SSL/TLS library
PKG_SECTION:=		libs
PKG_URL:=		https://polarssl.org/
PKG_SITES:=		http://www.openadk.org/distfiles/
PKG_LIBNAME:=		libpolarssl
PKG_OPTS:=		dev

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}-gpl.tgz

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBPOLARSSL,libpolarssl,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIG_STYLE:=		manual
ALL_TARGET:=		no_test

libpolarssl-install:
	$(INSTALL_DIR) $(IDIR_LIBPOLARSSL)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libpolarssl.so* \
		$(IDIR_LIBPOLARSSL)/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
