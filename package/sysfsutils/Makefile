# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		sysfsutils
PKG_VERSION:=		2.1.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		14e7dcd0436d2f49aa403f67e1ef7ddc
PKG_DESCR:=		utilites built upon sysfs
PKG_SECTION:=		utils
PKG_URL:=		http://linux-diag.sourceforge.net/Sysfsutils.html
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=linux-diag/sysfsutils/2.1.0/}

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,SYSFSUTILS,$(PKG_NAME),$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

post-install:
	$(INSTALL_DIR) $(IDIR_SYSFSUTILS)/usr/bin
	$(INSTALL_DIR) $(IDIR_SYSFSUTILS)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libsysfs.so* \
		$(IDIR_SYSFSUTILS)/usr/lib
	$(INSTALL_BIN) $(WRKINST)/usr/bin/systool \
		$(IDIR_SYSFSUTILS)/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
