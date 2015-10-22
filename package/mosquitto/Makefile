# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		mosquitto
PKG_VERSION:=		1.4.4
PKG_RELEASE:=		1
PKG_HASH:=		c643c7123708aadcd29287dda7b5ce7c910f75b02956a8fc4fe65ad2ea767a5f
PKG_DESCR:=		mqtt broker
PKG_SECTION:=		net/misc
PKG_DEPENDS:=		c-ares librt libpthreads
PKG_BUILDDEP:=		cmake-host c-ares
PKG_URL:=		http://mosquitto.org
PKG_SITES:=		http://mosquitto.org/files/source/

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.gz

PKG_CHOICES_MOSQUITTO:=	WITH_LIBRESSL WITH_OPENSSL
PKGCD_WITH_LIBRESSL:=	use libressl for crypto
PKGCB_WITH_LIBRESSL:=	libressl
PKGCS_WITH_LIBRESSL:=	libressl
PKGCD_WITH_OPENSSL:=	use openssl for crypto
PKGCB_WITH_OPENSSL:=	openssl
PKGCS_WITH_OPENSSL:=	libopenssl

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,MOSQUITTO,mosquitto,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION)))

CONFIG_STYLE:=          cmake
CMAKE_FLAGS+=		-DINC_MEMTRACK=OFF -DWITH_TLS_PSK=OFF

mosquitto-install:
	$(INSTALL_DIR) $(IDIR_MOSQUITTO)/usr/bin
	$(INSTALL_DIR) $(IDIR_MOSQUITTO)/usr/sbin
	$(INSTALL_DIR) $(IDIR_MOSQUITTO)/usr/lib
	$(INSTALL_DIR) $(IDIR_MOSQUITTO)/etc/mosquitto
	$(INSTALL_BIN) $(WRKINST)/usr/bin/mosquitto* \
		$(IDIR_MOSQUITTO)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/sbin/mosquitto* \
		$(IDIR_MOSQUITTO)/usr/sbin
	$(INSTALL_DATA) $(WRKINST)/etc/mosquitto/* \
		$(IDIR_MOSQUITTO)/etc/mosquitto
	$(CP) $(WRKINST)/usr/lib/*.so* \
		$(IDIR_MOSQUITTO)/usr/lib



include ${ADK_TOPDIR}/mk/pkg-bottom.mk
