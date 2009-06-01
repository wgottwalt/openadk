# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		arpwatch
PKG_VERSION:=		2.1a15
PKG_RELEASE:=		1
PKG_MD5SUM:=		cebfeb99c4a7c2a6cee2564770415fe7
PKG_DESCR:=		Ethernet monitor program for keeping track of ethernet/ip address pairings
PKG_SECTION:=		net
PKG_DEPENDS:=		libpcap
PKG_URL:=		http://www-nrg.ee.lbl.gov
PKG_SITES:=		ftp://ftp.ee.lbl.gov/

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,ARPWATCH,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE=	gnu
BUILD_STYLE=		auto
MAKE_FLAGS+=		ARPDIR=/etc/arpwatch \
			CCOPT="$(TARGET_CFLAGS)" \
			INCLS="-I. -I$(STAGING_DIR)/usr/include" \
			LIBS="-L$(STAGING_DIR)/usr/lib -lpcap"

do-install:
	$(INSTALL_DIR) $(IDIR_ARPWATCH)/usr/sbin $(IDIR_ARPWATCH)/etc/arpwatch
	$(INSTALL_BIN) $(WRKBUILD)/arpwatch $(IDIR_ARPWATCH)/usr/sbin/
	$(INSTALL_BIN) $(WRKBUILD)/arpsnmp $(IDIR_ARPWATCH)/usr/sbin/
	$(INSTALL_DATA) $(WRKBUILD)/arp.dat $(IDIR_ARPWATCH)/etc/arpwatch/

include ${TOPDIR}/mk/pkg-bottom.mk
