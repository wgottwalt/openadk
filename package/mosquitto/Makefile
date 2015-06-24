# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		mosquitto
PKG_VERSION:=		1.3.5
PKG_RELEASE:=		1
PKG_HASH:=		16eb3dbef183827665feee9288362c7352cd016ba04ca0402a0ccf857d1c2ab2
PKG_DESCR:=		MQTT Broker	
PKG_SECTION:=		net/misc
PKG_DEPENDS:=		c-ares
PKG_BUILDDEP:=		cmake-host c-ares
PKG_URL:=		http://mosquitto.org
PKG_SITES:=		http://mosquitto.org/files/source/

# if downloaded package is not ending with .tar.xz use following
DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,MOSQUITTO,mosquitto,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=          manual

do-configure:
        (cd ${WRKBUILD} && PATH='${HOST_PATH}' \
                cmake -DCMAKE_SYSTEM_NAME=Linux .)

mosquitto-install:
	$(INSTALL_DIR) $(IDIR_MOSQUITTO)/usr/bin
	$(INSTALL_DIR) $(IDIR_MOSQUITTO)/usr/sbin
	$(INSTALL_DIR) $(IDIR_MOSQUITTO)/usr/lib
	$(INSTALL_DIR) $(IDIR_MOSQUITTO)/etc/mosquitto
	$(INSTALL_BIN) $(WRKINST)/usr/local/bin/mosquitto* \
		$(IDIR_MOSQUITTO)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/local/sbin/mosquitto* \
		$(IDIR_MOSQUITTO)/usr/sbin
	$(INSTALL_DATA) $(WRKINST)/etc/mosquitto/* \
		$(IDIR_MOSQUITTO)/etc/mosquitto
	$(CP) $(WRKINST)/usr/local/lib/*.so* \
		$(IDIR_MOSQUITTO)/usr/lib



include ${ADK_TOPDIR}/mk/pkg-bottom.mk
