# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		ralink-firmware
PKG_VERSION:=		1.0
PKG_RELEASE:=		1
PKG_HASH:=		afecbffbea1bd734437c12db5f24863b9d93c9583a4c0dbe61f57b120f993b87
PKG_DESCR:=		ralink wireless driver firmware	
PKG_SECTION:=		sys/firmware
PKG_SITES:=		http://distfiles.openadk.org/

DISTFILES:=		$(PKG_NAME)-$(PKG_VERSION).tgz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,RALINK_FIRMWARE,ralink-firmware,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION)))

CONFIG_STYLE:=		manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

do-install:
	$(INSTALL_DIR) $(IDIR_RALINK_FIRMWARE)/lib/firmware
	${CP} ${WRKBUILD}/*.bin ${IDIR_RALINK_FIRMWARE}/lib/firmware

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
