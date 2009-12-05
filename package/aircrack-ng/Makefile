# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		aircrack-ng
PKG_VERSION:=		1.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		dafbfaf944ca9d523fde4bae86f0c067
PKG_DESCR:=		set of tools for auditing wireless networks
PKG_SECTION:=		net
PKG_DEPENDS:=		libpthread libopenssl libpcap
PKG_URL:=		http://www.aircrack-ng.org
PKG_SITES:=		http://download.aircrack-ng.org/

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,AIRCRACK_NG,${PKG_NAME},$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

BUILD_STYLE:=	auto
INSTALL_STYLE:=	auto
XAKE_FLAGS+=	CC="$(TARGET_CC)" \
		CFLAGS="$(TARGET_CFLAGS) -Wall" \
		CROSS="$(TARGET_CROSS)" OSNAME="Linux" \
		prefix="/usr"

post-install:
	$(INSTALL_DIR) $(IDIR_AIRCRACK_NG)/usr/bin
	$(INSTALL_DIR) $(IDIR_AIRCRACK_NG)/usr/sbin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/aircrack-ng $(IDIR_AIRCRACK_NG)/usr/bin/
	$(INSTALL_BIN) $(WRKINST)/usr/bin/airdecap-ng $(IDIR_AIRCRACK_NG)/usr/bin/
	$(INSTALL_BIN) $(WRKINST)/usr/bin/packetforge-ng $(IDIR_AIRCRACK_NG)/usr/bin/
	$(INSTALL_BIN) $(WRKINST)/usr/sbin/aireplay-ng $(IDIR_AIRCRACK_NG)/usr/sbin/
	$(INSTALL_BIN) $(WRKINST)/usr/sbin/airodump-ng $(IDIR_AIRCRACK_NG)/usr/sbin/
	$(INSTALL_BIN) $(WRKINST)/usr/sbin/airtun-ng $(IDIR_AIRCRACK_NG)/usr/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
