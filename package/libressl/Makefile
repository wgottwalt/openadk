# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		libressl
PKG_VERSION:=		2.1.1
PKG_RELEASE:=		1
PKG_HASH:=		fb5ada41a75b31c8dd9ff013daca57b253047ad14e43f65d8b41879b7b8e3c17
PKG_DESCR:=		ssl library
PKG_SECTION:=		libs/crypto
PKG_URL:=		http://www.libressl.org
PKG_SITES:=		http://ftp.openbsd.org/pub/OpenBSD/LibreSSL/
PKG_OPTS:=		dev

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBRESSL,libressl,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

XAKE_FLAGS+=		GCC_HONOUR_COPTS=s

libressl-install:
	$(INSTALL_DIR) $(IDIR_LIBRESSL)/usr/lib
	$(CP) $(WRKINST)/usr/lib/lib{crypto,ssl}.so* \
		$(IDIR_LIBRESSL)/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
