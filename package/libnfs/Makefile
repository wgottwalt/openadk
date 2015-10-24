# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		libnfs
PKG_VERSION:=		1.9.8
PKG_RELEASE:=		1
PKG_HASH:=		4d403fe5adc1f0d75fa2cd260a907834617f2ba81fd46f438b16e0a0fc8bff81
PKG_DESCR:=		nfs client library
PKG_SECTION:=		libs/net
PKG_URL:=		https://github.com/sahlberg/libnfs
PKG_SITES:=		https://sites.google.com/site/libnfstarballs/li/
PKG_OPTS:=		dev

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBNFS,libnfs,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

AUTOTOOL_STYLE:=	autoreconf

libnfs-install:
	$(INSTALL_DIR) $(IDIR_LIBNFS)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libnfs*.so* \
		$(IDIR_LIBNFS)/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
