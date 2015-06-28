# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		mosquitto
PKG_VERSION:=		1.3.5
PKG_RELEASE:=		1
PKG_HASH:=		16eb3dbef183827665feee9288362c7352cd016ba04ca0402a0ccf857d1c2ab2
PKG_DESCR:=		mqtt broker
PKG_SECTION:=		net/misc
PKG_DEPENDS:=		c-ares libopenssl librt libpthreads
PKG_BUILDDEP:=		cmake-host c-ares openssl
PKG_URL:=		http://mosquitto.org
PKG_SITES:=		http://mosquitto.org/files/source/

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,MOSQUITTO,mosquitto,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION)))

CONFIG_STYLE:=          cmake
CMAKE_FLAGS+=		-DINC_MEMTRACK=OFF

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
