# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		lsscsi
PKG_VERSION:=		0.27
PKG_RELEASE:=		1
PKG_MD5SUM:=		33ab2927a9e567a47905e6a618c17859
PKG_DESCR:=		list scsi devices
PKG_SECTION:=		sys/hw
PKG_URL:=		http://sg.danny.cz/scsi/lsscsi.html
PKG_SITES:=		http://sg.danny.cz/scsi/

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tgz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LSSCSI,lsscsi,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

lsscsi-install:
	$(INSTALL_DIR) $(IDIR_LSSCSI)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/lsscsi \
		$(IDIR_LSSCSI)/usr/bin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
