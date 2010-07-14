# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		pmacct
PKG_VERSION:=		0.12.2
PKG_RELEASE:=		1
PKG_MD5SUM:=		1c656ea9ca13455c54e8efb9f8299b3d
PKG_DESCR:=		IP accounting daemons
PKG_SECTION:=		net/misc
PKG_DEPENDS:=		libpcap
PKG_BUILDDEP+=		libpcap
ifneq ($(ADK_COMPILE_PMACCT_MYSQL),)
PKG_BUILDDEP+=		mysql
endif
ifneq ($(ADK_COMPILE_PMACCT_PGSQL),)
PKG_BUILDDEP+=		postgresql
endif
ifneq ($(ADK_COMPILE_PMACCT_SQLITE),)
PKG_BUILDDEP+=		sqlite
endif
PKG_URL:=		http://www.pmacct.net/
PKG_SITES:=		http://www.pmacct.net/

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,NFACCTD,nfacctd,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,PMACCTD,pmacctd,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,SFACCTD,sfacctd,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,PMACCT_CLIENT,pmacct-client,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ARGS+=	--with-pcap-includes="$(STAGING_DIR)/usr/include" \
			--with-pcap-libs="$(STAGING_DIR)/usr/lib"

post-install:
	${INSTALL_DIR} $(IDIR_SFACCTD)/usr/sbin
	${INSTALL_BIN} $(WRKINST)/usr/sbin/sfacctd $(IDIR_SFACCTD)/usr/sbin/
	${INSTALL_DIR} $(IDIR_NFACCTD)/usr/sbin $(IDIR_NFACCTD)/etc
	${INSTALL_BIN} $(WRKINST)/usr/sbin/nfacctd $(IDIR_NFACCTD)/usr/sbin/
	${INSTALL_DATA} ./files/nfacctd.conf $(IDIR_NFACCTD)/etc
	${INSTALL_DIR} $(IDIR_PMACCTD)/usr/sbin $(IDIR_PMACCTD)/etc
	${INSTALL_BIN} $(WRKINST)/usr/sbin/pmacctd $(IDIR_PMACCTD)/usr/sbin/
	${INSTALL_DATA} ./files/pmacctd.conf $(IDIR_PMACCTD)/etc
	${INSTALL_DIR} $(IDIR_PMACCT_CLIENT)/usr/bin
	${INSTALL_BIN} $(WRKINST)/usr/bin/pmacct $(IDIR_PMACCT_CLIENT)/usr/bin/

include ${TOPDIR}/mk/pkg-bottom.mk
