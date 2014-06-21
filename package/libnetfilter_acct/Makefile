# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		libnetfilter_acct
PKG_VERSION:=		1.0.2
PKG_RELEASE:=		2
PKG_MD5SUM:=		2118d9514c079839ebd9cb3144ad2ad7
PKG_DESCR:=		extended accounting infrastructure library
PKG_SECTION:=		libs/net
PKG_DEPENDS:=		libnfnetlink
PKG_BUILDDEP:=		libnfnetlink
PKG_URL:=		http://www.netfilter.org/projects/libnetfilter_acct/
PKG_SITES:=		http://www.netfilter.org/projects/libnetfilter_acct/files/
PKG_OPTS:=		dev

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.bz2

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBNETFILTER_ACCT,libnetfilter-acct,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

libnetfilter-acct-install:
	$(INSTALL_DIR) $(IDIR_LIBNETFILTER_ACCT)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libnetfilter_acct*so* \
		$(IDIR_LIBNETFILTER_ACCT)/usr/lib/

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
