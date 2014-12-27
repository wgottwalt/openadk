# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		libnetfilter_cttimeout
PKG_VERSION:=		1.0.0
PKG_RELEASE:=		2
PKG_HASH:=		aeab12754f557cba3ce2950a2029963d817490df7edb49880008b34d7ff8feba
PKG_DESCR:=		API to the fine-grain connection tracking timeout infrastructure
PKG_SECTION:=		libs/net
PKG_DEPENDS:=		libnfnetlink libmnl
PKG_BUILDDEP:=		libnfnetlink libmnl
PKG_URL:=		http://www.netfilter.org/projects/libnetfilter_cttimeout/
PKG_SITES:=		http://www.netfilter.org/projects/libnetfilter_cttimeout/files/
PKG_OPTS:=		dev

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.bz2

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBNETFILTER_CTTIMEOUT,libnetfilter-cttimeout,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

libnetfilter-cttimeout-install:
	$(INSTALL_DIR) $(IDIR_LIBNETFILTER_CTTIMEOUT)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libnetfilter_cttimeout*so* \
		$(IDIR_LIBNETFILTER_CTTIMEOUT)/usr/lib/

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
