# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		conntrack-tools
PKG_VERSION:=		1.4.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		3cc4703d883c6f07085e29bdc993222b
PKG_DESCR:=		Connection tracking userspace tools
PKG_SECTION:=		firewall
PKG_DEPENDS:=		libtirpc libnetfilter_queue libnetfilter-conntrack libnetfilter-cttimeout libnetfilter-cthelper libmnl
PKG_BUILDDEP:=		libtirpc libnetfilter_queue libnetfilter_conntrack libnetfilter_cttimeout libnetfilter_cthelper libmnl
PKG_URL:=		http://conntrack-tools.netfilter.org/
PKG_SITES:=		http://www.netfilter.org/projects/conntrack-tools/files/

PKG_LIBC_DEPENDS:=	uclibc glibc

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.bz2

include $(TOPDIR)/mk/package.mk

TARGET_CPPFLAGS+=	-I$(STAGING_TARGET_DIR)/usr/include/tirpc

$(eval $(call PKG_template,CONNTRACK_TOOLS,conntrack-tools,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

conntrack-tools-install:
	$(INSTALL_DIR) $(IDIR_CONNTRACK_TOOLS)/usr/sbin
	$(INSTALL_BIN) $(WRKINST)/usr/sbin/conntrack{,d} $(IDIR_CONNTRACK_TOOLS)/usr/sbin

include ${TOPDIR}/mk/pkg-bottom.mk
