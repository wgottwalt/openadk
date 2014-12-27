# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		conntrack-tools
PKG_VERSION:=		1.4.2
PKG_RELEASE:=		1
PKG_HASH:=		e5c423dc077f9ca8767eaa6cf40446943905711c6a8fe27f9cc1977d4d6aa11e
PKG_DESCR:=		connection tracking userspace tools
PKG_SECTION:=		net/firewall
PKG_DEPENDS:=		libtirpc libnetfilter_queue libnetfilter-conntrack libnetfilter-cttimeout libnetfilter-cthelper libmnl
PKG_BUILDDEP:=		libtirpc libnetfilter_queue libnetfilter_conntrack libnetfilter_cttimeout libnetfilter_cthelper libmnl
PKG_URL:=		http://conntrack-tools.netfilter.org/
PKG_SITES:=		http://www.netfilter.org/projects/conntrack-tools/files/

PKG_SUBPKGS:=		CONNTRACK CONNTRACKD
PKGSD_CONNTRACK:=	connection tracking client utility
PKGSD_CONNTRACKD:=	connection tracking daemon

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.bz2

include $(ADK_TOPDIR)/mk/package.mk

TARGET_CPPFLAGS+=	-I$(STAGING_TARGET_DIR)/usr/include/tirpc -D_GNU_SOURCE

$(eval $(call PKG_template,CONNTRACK,conntrack,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_CONNTRACK},${PKG_SECTION}))
$(eval $(call PKG_template,CONNTRACKD,conntrackd,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_CONNTRACKD},${PKG_SECTION}))

conntrack-install:
	$(INSTALL_DIR) $(IDIR_CONNTRACK)/usr/sbin
	$(INSTALL_BIN) $(WRKINST)/usr/sbin/conntrack $(IDIR_CONNTRACK)/usr/sbin

conntrackd-install:
	$(INSTALL_DIR) $(IDIR_CONNTRACKD)/usr/sbin
	$(INSTALL_BIN) $(WRKINST)/usr/sbin/conntrackd $(IDIR_CONNTRACKD)/usr/sbin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
