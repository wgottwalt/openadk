# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		aircrack-ng
PKG_VERSION:=		1.2
PKG_RELEASE:=		1
PKG_HASH:=		ba5b3eda44254efc5b7c9f776eb756f7cc323ad5d0813c101e92edb483d157e9
PKG_DESCR:=		set of tools for auditing wireless networks
PKG_SECTION:=		net/wifi
PKG_DEPENDS:=		libpcap libnl libressl
PKG_BUILDDEP:=		libpcap libnl libressl
PKG_NEEDS:=		threads
PKG_URL:=		http://www.aircrack-ng.org/
PKG_SITES:=		http://download.aircrack-ng.org/
# do not build parallel, otherwise libosdep.a may not be ready when compiling airtun-ng
PKG_NOPARALLEL:=	1

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}-rc2.tar.gz
WRKDIST=		${WRKDIR}/${PKG_NAME}-${PKG_VERSION}-rc2

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,AIRCRACK_NG,${PKG_NAME},$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual

XAKE_FLAGS+=		CC="$(TARGET_CC)" \
			TOOL_PREFIX="$(TARGET_CROSS)" \
			OSNAME="Linux" prefix="/usr"

aircrack-ng-install:
	$(INSTALL_DIR) $(IDIR_AIRCRACK_NG)/usr/bin
	$(INSTALL_DIR) $(IDIR_AIRCRACK_NG)/usr/sbin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/aircrack-ng \
		$(IDIR_AIRCRACK_NG)/usr/bin/
	$(INSTALL_BIN) $(WRKINST)/usr/bin/airdecap-ng \
		$(IDIR_AIRCRACK_NG)/usr/bin/
	$(INSTALL_BIN) $(WRKINST)/usr/bin/packetforge-ng \
		$(IDIR_AIRCRACK_NG)/usr/bin/
	$(INSTALL_BIN) $(WRKINST)/usr/sbin/aireplay-ng \
		$(IDIR_AIRCRACK_NG)/usr/sbin/
	$(INSTALL_BIN) $(WRKINST)/usr/sbin/airodump-ng \
		$(IDIR_AIRCRACK_NG)/usr/sbin/
	$(INSTALL_BIN) $(WRKINST)/usr/sbin/airtun-ng \
		$(IDIR_AIRCRACK_NG)/usr/sbin/

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
