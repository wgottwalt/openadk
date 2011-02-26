# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libnetfilter_conntrack
PKG_VERSION:=		0.9.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		67e6b44c4d9343a8b3d3ba36bb0a4a8b
PKG_DESCR:=		API to connection tracking state table
PKG_SECTION:=		libs
PKG_DEPENDS:=		libnfnetlink
PKG_BUILDDEP:=		libnfnetlink
PKG_URL:=		http://www.netfilter.org/projects/libnetfilter_conntrack/
PKG_SITES:=		http://www.netfilter.org/projects/libnetfilter_conntrack/files/

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.bz2

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBNETFILTER_CONNTRACK,libnetfilter-conntrack,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

post-install:
	$(INSTALL_DIR) $(IDIR_LIBNETFILTER_CONNTRACK)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libnetfilter_conntrack*so* \
		$(IDIR_LIBNETFILTER_CONNTRACK)/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
