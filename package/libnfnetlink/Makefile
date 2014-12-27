# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		libnfnetlink
PKG_VERSION:=		1.0.1
PKG_RELEASE:=		5
PKG_HASH:=		f270e19de9127642d2a11589ef2ec97ef90a649a74f56cf9a96306b04817b51a
PKG_DESCR:=		netfilter related kernel/userspace communication
PKG_SECTION:=		libs/net
PKG_URL:=		http://www.netfilter.org/projects/libnfnetlink/
PKG_SITES:=		http://www.netfilter.org/projects/libnfnetlink/files/
PKG_OPTS:=		dev

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.bz2

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBNFNETLINK,libnfnetlink,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

libnfnetlink-install:
	$(INSTALL_DIR) $(IDIR_LIBNFNETLINK)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libnfnetlink.so* $(IDIR_LIBNFNETLINK)/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
