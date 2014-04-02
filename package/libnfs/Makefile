# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libnfs
PKG_VERSION:=		1.9.3
PKG_RELEASE:=		1
PKG_MD5SUM:=		a07656eeca58ad8d4870da546745628a
PKG_DESCR:=		NFS client library
PKG_SECTION:=		libs
PKG_BUILDDEP:=		autotool
PKG_URL:=		https://github.com/sahlberg/libnfs
PKG_SITES:=		https://sites.google.com/site/libnfstarballs/li/
PKG_OPTS:=		dev

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBNFS,libnfs,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

AUTOTOOL_STYLE:=	autoreconf

libnfs-install:
	$(INSTALL_DIR) $(IDIR_LIBNFS)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libnfs*.so* \
		$(IDIR_LIBNFS)/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
