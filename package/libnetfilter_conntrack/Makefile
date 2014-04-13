# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libnetfilter_conntrack
PKG_VERSION:=		1.0.4
PKG_RELEASE:=		2
PKG_MD5SUM:=		18cf80c4b339a3285e78822dbd4f08d7
PKG_DESCR:=		API to connection tracking state table
PKG_SECTION:=		libs
PKG_DEPENDS:=		libnfnetlink libmnl
PKG_BUILDDEP:=		libnfnetlink libmnl
PKG_URL:=		http://www.netfilter.org/projects/libnetfilter_conntrack/
PKG_SITES:=		http://www.netfilter.org/projects/libnetfilter_conntrack/files/
PKG_OPTS:=		dev

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.bz2

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBNETFILTER_CONNTRACK,libnetfilter-conntrack,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

libnetfilter-conntrack-install:
	$(INSTALL_DIR) $(IDIR_LIBNETFILTER_CONNTRACK)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libnetfilter_conntrack*so* \
		$(IDIR_LIBNETFILTER_CONNTRACK)/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
