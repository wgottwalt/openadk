# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		pdnsd
PKG_VERSION:=		1.2.7
PKG_RELEASE:=		2
PKG_MD5SUM:=		114b3b21b09b43cbfcccdde726b84c12
PKG_DESCR:=		Proxy DNS server with permanent caching
PKG_SECTION:=		net
PKG_DEPENDS:=		libpthread
PKG_URL:=		http://www.phys.uu.nl/~rombouts/pdnsd.html
PKG_SITES:=		http://www.phys.uu.nl/~rombouts/pdnsd/releases/

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}-par.tar.gz

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,PDNSD,$(PKG_NAME),$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

post-install:
	$(INSTALL_DIR) $(IDIR_PDNSD)/etc
	${INSTALL_DATA} ./files/pdnsd.conf ${IDIR_PDNSD}/etc/
	$(INSTALL_DIR) $(IDIR_PDNSD)/usr/sbin
	$(INSTALL_BIN) $(WRKINST)/usr/sbin/pdnsd{,-ctl} $(IDIR_PDNSD)/usr/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
