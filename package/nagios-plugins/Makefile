# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		nagios-plugins
PKG_VERSION:=		1.4.15
PKG_RELEASE:=		1
PKG_MD5SUM:=		56abd6ade8aa860b38c4ca4a6ac5ab0d
PKG_DESCR:=		Nagios plugins
PKG_SECTION:=		net
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=nagiosplug/}


include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,NAGIOS_PLUGINS,nagios-plugins,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

nagios-plugins-install:
	$(INSTALL_DIR) $(IDIR_NAGIOS_PLUGINS)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/nagios-plugins \
		$(IDIR_NAGIOS_PLUGINS)/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
