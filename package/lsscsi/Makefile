# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		lsscsi
PKG_VERSION:=		0.28
PKG_RELEASE:=		1
PKG_HASH:=		025d009a1af42bc5b2fca664c44c9ecdfd754356e4a44f5c6aced2420afadd50
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
