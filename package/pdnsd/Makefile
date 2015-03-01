# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		pdnsd
PKG_VERSION:=		1.2.9a
PKG_RELEASE:=		1
PKG_HASH:=		bb5835d0caa8c4b31679d6fd6a1a090b71bdf70950db3b1d0cea9cf9cb7e2a7b
PKG_DESCR:=		proxy dns server
PKG_SECTION:=		net/dns
PKG_DEPENDS:=		libpthread
PKG_URL:=		http://members.home.nl/p.a.rombouts/pdnsd/index.html
PKG_SITES:=		http://members.home.nl/p.a.rombouts/pdnsd/releases/

PKG_FLAVOURS_PDNSD:=	WITH_IPV6
PKGFD_WITH_IPV6:=	enable IPv6 support

PKG_HOST_DEPENDS:=	!netbsd

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}-par.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,PDNSD,pdnsd,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ARGS+=	--with-target=Linux

ifneq (${ADK_PACKAGE_PDNSD_WITH_IPV6},)
CONFIGURE_ARGS+=	--enable-ipv6
else
CONFIGURE_ARGS+=	--disable-ipv6
endif

pdnsd-install:
	$(INSTALL_DIR) $(IDIR_PDNSD)/etc
	${INSTALL_DATA} ./files/pdnsd.conf ${IDIR_PDNSD}/etc/
	$(INSTALL_DIR) $(IDIR_PDNSD)/usr/sbin
	$(INSTALL_BIN) $(WRKINST)/usr/sbin/pdnsd{,-ctl} $(IDIR_PDNSD)/usr/sbin/

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
