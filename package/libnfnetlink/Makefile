# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libnfnetlink
PKG_VERSION:=		1.0.1
PKG_RELEASE:=		4
PKG_MD5SUM:=		98927583d2016a9fb1936fed992e2c5e
PKG_DESCR:=		netfilter related kernel/userspace communication
PKG_SECTION:=		libs
PKG_URL:=		http://www.netfilter.org/projects/libnfnetlink/
PKG_SITES:=		http://www.netfilter.org/projects/libnfnetlink/files/
PKG_OPTS:=		dev

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.bz2

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBNFNETLINK,libnfnetlink,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

libnfnetlink-install:
	$(INSTALL_DIR) $(IDIR_LIBNFNETLINK)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libnfnetlink.so* $(IDIR_LIBNFNETLINK)/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
