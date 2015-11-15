# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		swconfig
PKG_VERSION:=		1.0
PKG_RELEASE:=		1
PKG_DESCR:=		switch config tool
PKG_SECTION:=		net/route
PKG_DEPENDS:=		libnl
PKG_BUILDDEP:=		libnl
PKG_NEEDS:=		threads

PKG_SYSTEM_DEPENDS:=	mikrotik-rb4xx

WRKDIST=		${WRKDIR}/swconfig
NO_DISTFILES:=		1

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,SWCONFIG,swconfig,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

TARGET_CFLAGS+=		-I$(STAGING_TARGET_DIR)/usr/include/libnl3/

CONFIG_STYLE:=		manual
INSTALL_STYLE:=		manual

swconfig-install:
	$(INSTALL_DIR) $(IDIR_SWCONFIG)/usr/bin
	$(INSTALL_BIN) $(WRKDIST)/swconfig \
		$(IDIR_SWCONFIG)/usr/bin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
