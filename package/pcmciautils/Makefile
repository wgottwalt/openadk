# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		pcmciautils
PKG_VERSION:=		017
PKG_RELEASE:=		1
PKG_MD5SUM:=		ee5837214d297661c8b8189055a351fc
PKG_DESCR:=		Utilities for PCMCIA subsystem
PKG_SECTION:=		utils
PKG_BUILDDEP:=		sysfsutils
PKG_URL:=		http://www.kernel.org/pub/linux/utils/kernel/pcmcia/pcmcia.html
PKG_SITES:=		http://www.kernel.org/pub/linux/utils/kernel/pcmcia/

PKG_CFLINE_PCMCIAUTILS:=depends on ADK_TARGET_WITH_CARDBUS

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,PCMCIAUTILS,$(PKG_NAME),$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE=		manual

post-install:
	$(INSTALL_DIR) $(IDIR_PCMCIAUTILS)/etc/pcmcia
	$(INSTALL_DATA) ./files/config.opts \
		$(IDIR_PCMCIAUTILS)/etc/pcmcia
	$(INSTALL_DIR) $(IDIR_PCMCIAUTILS)/usr/sbin
	$(INSTALL_BIN) $(WRKINST)/sbin/pccardctl \
		$(IDIR_PCMCIAUTILS)/usr/sbin
	$(INSTALL_BIN) $(WRKINST)/lib/udev/pcmcia-socket-startup \
		$(IDIR_PCMCIAUTILS)/usr/sbin

include ${TOPDIR}/mk/pkg-bottom.mk
