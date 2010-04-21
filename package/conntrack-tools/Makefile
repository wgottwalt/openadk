# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		conntrack-tools
PKG_VERSION:=		0.9.9
PKG_RELEASE:=		1
PKG_MD5SUM:=		35b0ab9cde069b4ec8a493daae82d67b
PKG_DESCR:=		Connection tracking userspace tools
PKG_SECTION:=		firewall
PKG_DEPENDS:=		libnetfilter_conntrack
PKG_BUILDDEP+=		libnetfilter_conntrack
PKG_URL:=		http://conntrack-tools.netfilter.org
PKG_SITES:=		http://www.netfilter.org/projects/conntrack-tools/files/
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.bz2

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,CONNTRACK_TOOLS,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

post-install:
	$(INSTALL_DIR) $(IDIR_CONNTRACK_TOOLS)/usr/sbin
	$(INSTALL_BIN) $(WRKINST)/usr/sbin/conntrack{,d} $(IDIR_CONNTRACK_TOOLS)/usr/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
