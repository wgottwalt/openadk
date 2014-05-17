# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		u-boot
PKG_VERSION:=		2014.01
PKG_RELEASE:=		1
PKG_MD5SUM:=		e531307578f6d32a7ccb1d04f1e08cbc
PKG_DESCR:=		bootloader
PKG_SECTION:=		boot
PKG_URL:=		http://www.denx.de/wiki/U-Boot	
PKG_SITES:=		ftp://ftp.denx.de/pub/u-boot/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.bz2
PKG_CFLINE_U_BOOT:=	depends on ADK_BROKEN
PKG_SYSTEM_DEPENDS:=	!cubox-i

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,U_BOOT,u-boot,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual

do-configure:
	echo "no config for your target available"

u-boot-install:

include ${TOPDIR}/mk/pkg-bottom.mk
