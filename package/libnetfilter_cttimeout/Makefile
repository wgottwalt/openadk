# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libnetfilter_cttimeout
PKG_VERSION:=		1.0.0
PKG_RELEASE:=		2
PKG_MD5SUM:=		7697437fc9ebb6f6b83df56a633db7f9
PKG_DESCR:=		API to the fine-grain connection tracking timeout infrastructure
PKG_SECTION:=		libs/net
PKG_DEPENDS:=		libnfnetlink libmnl
PKG_BUILDDEP:=		libnfnetlink libmnl
PKG_URL:=		http://www.netfilter.org/projects/libnetfilter_cttimeout/
PKG_SITES:=		http://www.netfilter.org/projects/libnetfilter_cttimeout/files/
PKG_OPTS:=		dev

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.bz2

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBNETFILTER_CTTIMEOUT,libnetfilter-cttimeout,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

libnetfilter-cttimeout-install:
	$(INSTALL_DIR) $(IDIR_LIBNETFILTER_CTTIMEOUT)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libnetfilter_cttimeout*so* \
		$(IDIR_LIBNETFILTER_CTTIMEOUT)/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
