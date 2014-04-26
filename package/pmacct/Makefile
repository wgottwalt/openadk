# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		pmacct
PKG_VERSION:=		0.12.5
PKG_RELEASE:=		1
PKG_MD5SUM:=		3d10f9301a17f034a0f221490a99a5d0
PKG_DESCR:=		IP accounting daemons
PKG_SECTION:=		net/misc
PKG_DEPENDS:=		libpcap
PKG_BUILDDEP:=		libpcap
PKG_URL:=		http://www.pmacct.net/
PKG_SITES:=		http://www.pmacct.net/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

PKG_SUBPKGS:=		NFACCTD PMACCTD SFACCTD PMACCT_CLIENT

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,NFACCTD,nfacctd,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,PMACCTD,pmacctd,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,SFACCTD,sfacctd,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,PMACCT_CLIENT,pmacct-client,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ARGS+=	--with-pcap-includes="$(STAGING_TARGET_DIR)/usr/include" \
			--with-pcap-libs="$(STAGING_TARGET_DIR)/usr/lib"

sfacctd-install:
	${INSTALL_DIR} $(IDIR_SFACCTD)/usr/sbin
	${INSTALL_BIN} $(WRKINST)/usr/sbin/sfacctd $(IDIR_SFACCTD)/usr/sbin/

nfacctd-install:
	${INSTALL_DIR} $(IDIR_NFACCTD)/usr/sbin $(IDIR_NFACCTD)/etc
	${INSTALL_BIN} $(WRKINST)/usr/sbin/nfacctd $(IDIR_NFACCTD)/usr/sbin/
	${INSTALL_DATA} ./files/nfacctd.conf $(IDIR_NFACCTD)/etc

pmacctd-install:
	${INSTALL_DIR} $(IDIR_PMACCTD)/usr/sbin $(IDIR_PMACCTD)/etc
	${INSTALL_BIN} $(WRKINST)/usr/sbin/pmacctd $(IDIR_PMACCTD)/usr/sbin/
	${INSTALL_DATA} ./files/pmacctd.conf $(IDIR_PMACCTD)/etc

pmacct-client-install:
	${INSTALL_DIR} $(IDIR_PMACCT_CLIENT)/usr/bin
	${INSTALL_BIN} $(WRKINST)/usr/bin/pmacct $(IDIR_PMACCT_CLIENT)/usr/bin/

include ${TOPDIR}/mk/pkg-bottom.mk
