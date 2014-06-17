# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

# always use tab spaces as separator, no spaces
PKG_NAME:=		swconfig
PKG_VERSION:=		1.0
PKG_RELEASE:=		1
PKG_DESCR:=		OpenWrt switch config tool
PKG_SECTION:=		net/route
PKG_DEPENDS:=		libnl libpthread
PKG_BUILDDEP:=		libnl

WRKDIST=		${WRKDIR}/swconfig
NO_DISTFILES:=		1

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,SWCONFIG,swconfig,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual
TARGET_CFLAGS+=		-I$(STAGING_TARGET_DIR)/usr/include/libnl3/
#BUILD_STYLE:=		manual
INSTALL_STYLE:=	manual

# please install all files and directories to the package dir
swconfig-install:
	$(INSTALL_DIR) $(IDIR_SWCONFIG)/usr/bin
	$(INSTALL_BIN) $(WRKDIST)/swconfig \
		$(IDIR_SWCONFIG)/usr/bin

# please remove ALL above comments, before commiting
include ${TOPDIR}/mk/pkg-bottom.mk
