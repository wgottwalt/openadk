# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		aircrack-ng
PKG_VERSION:=		1.1
PKG_RELEASE:=		2
PKG_HASH:=		b136b549b7d2a2751c21793100075ea43b28de9af4c1969508bb95bcc92224ad
PKG_DESCR:=		set of tools for auditing wireless networks
PKG_SECTION:=		net/wifi
PKG_DEPENDS:=		libpthread libpcap
PKG_BUILDDEP:=		libpcap
PKG_URL:=		http://www.aircrack-ng.org/
PKG_SITES:=		http://download.aircrack-ng.org/
# do not build parallel, otherwise libosdep.a may not be ready when compiling airtun-ng
PKG_NOPARALLEL:=	1

PKG_CHOICES_AIRCRACK_NG:=	WITHOUT_SSL WITH_LIBRESSL WITH_OPENSSL
PKGCD_WITHOUT_SSL:=	use no ssl
PKGCD_WITH_LIBRESSL:=	use libressl for crypto
PKGCB_WITH_LIBRESSL:=	libressl
PKGCS_WITH_LIBRESSL:=	libressl ca-certificates
PKGCD_WITH_OPENSSL:=	use openssl for crypto
PKGCB_WITH_OPENSSL:=	openssl
PKGCS_WITH_OPENSSL:=	libopenssl ca-certificates

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,AIRCRACK_NG,${PKG_NAME},$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual

XAKE_FLAGS+=		CC="$(TARGET_CC)" TOOL_PREFIX="$(TARGET_CROSS)" \
			CFLAGS="$(TARGET_CFLAGS) -Wall" \
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
