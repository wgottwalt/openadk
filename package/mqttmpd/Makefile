# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		mqttmpd
PKG_VERSION:=		r5
PKG_RELEASE:=		1
PKG_GIT:=		tag
PKG_DESCR:=		mqtt mpd bridge
PKG_SECTION:=		mm/audio	
PKG_DEPENDS:=		mosquitto mpd
PKG_BUILDDEP:=		mosquitto
PKG_URL:=		https://github.com/kurt-vd/mqttmpd
PKG_SITES:=		https://github.com/kurt-vd/mqttmpd.git

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,MQTTMPD,mqttmpd,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION)))

CONFIG_STYLE:=		manual

mqttmpd-install:
	$(INSTALL_DIR) $(IDIR_MQTTMPD)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/mqttmpd \
		$(IDIR_MQTTMPD)/usr/bin

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
