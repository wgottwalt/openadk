# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		libnfs
PKG_VERSION:=		1.9.7
PKG_RELEASE:=		1
PKG_HASH:=		f4fa071de1a8b15f0160a5414fcf4fbbfc4882de1f6758cf3c4187aec68b3f68
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
