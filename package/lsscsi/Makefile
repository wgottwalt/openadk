# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		lsscsi
PKG_VERSION:=		0.25
PKG_RELEASE:=		1
PKG_MD5SUM:=		c4e36b106624aff78527c54cf08ecbfe
PKG_DESCR:=		list SCSI devices
PKG_SECTION:=		utils
PKG_URL:=		http://sg.danny.cz/scsi/lsscsi.html
PKG_SITES:=		http://sg.danny.cz/scsi/

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tgz

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LSSCSI,lsscsi,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

lsscsi-install:
	$(INSTALL_DIR) $(IDIR_LSSCSI)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/lsscsi \
		$(IDIR_LSSCSI)/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
