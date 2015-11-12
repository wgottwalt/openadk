# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		libnetfilter_conntrack
PKG_VERSION:=		1.0.5
PKG_RELEASE:=		1
PKG_HASH:=		fc9d7daf43605a73045de203bbfc0bca3e07f72d4ac61bcf656868f48692d73a
PKG_DESCR:=		connection tracking state table library
PKG_SECTION:=		libs/net
PKG_DEPENDS:=		libnfnetlink libmnl
PKG_BUILDDEP:=		libnfnetlink libmnl
PKG_URL:=		http://www.netfilter.org/projects/libnetfilter_conntrack/
PKG_SITES:=		http://www.netfilter.org/projects/libnetfilter_conntrack/files/
PKG_OPTS:=		dev

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.bz2

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBNETFILTER_CONNTRACK,libnetfilter-conntrack,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

libnetfilter-conntrack-install:
	$(INSTALL_DIR) $(IDIR_LIBNETFILTER_CONNTRACK)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libnetfilter_conntrack*so* \
		$(IDIR_LIBNETFILTER_CONNTRACK)/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
