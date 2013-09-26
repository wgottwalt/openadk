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

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}-gpl.tgz

PKG_SUBPKGS:=		LIBPOLARSSL LIBPOLARSSL_DEV

include $(TOPDIR)/mk/package.mk

PKGSD_LIBPOLARSSL_DEV:=	development files for polarssl
PKGSC_LIBPOLARSSL_DEV:=	devel

$(eval $(call PKG_template,LIBPOLARSSL,libpolarssl,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIBPOLARSSL_DEV,libpolarssl-dev,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_LIBPOLARSSL_DEV},${PKGSC_LIBPOLARSSL_DEV}))

CONFIG_STYLE:=		manual
ALL_TARGET:=		no_test

libpolarssl-install:
	$(INSTALL_DIR) $(IDIR_LIBPOLARSSL)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libpolarssl.so* \
		$(IDIR_LIBPOLARSSL)/usr/lib

libpolarssl-dev-install:
	$(INSTALL_DIR) $(IDIR_LIBPOLARSSL_DEV)/usr/include
	$(CP) $(WRKINST)/usr/include/* \
		$(IDIR_LIBPOLARSSL_DEV)/usr/include

include ${TOPDIR}/mk/pkg-bottom.mk
