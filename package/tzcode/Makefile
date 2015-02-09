# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		tzcode
PKG_VERSION:=		2014d
PKG_RELEASE:=		1
PKG_HASH:=		e9c775bb76c9700521ada77776277c25f8650a22b56d46c9f00f4147970ef13e
PKG_DESCR:=		date utility
PKG_SECTION:=		base/apps
PKG_URL:=		http://www.iana.org/time-zones/
PKG_SITES:=		http://www.iana.org/time-zones/repository/releases/
PKG_NOPARALLEL:=	1

PKG_LIBC_DEPENDS:=	glibc musl

DISTFILES:=             $(PKG_NAME)$(PKG_VERSION).tar.gz
WRKDIST=		$(WRKDIR)

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,DATE,date,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKGSD_DATE),$(PKG_SECTION)))

CONFIG_STYLE:=		manual
HOST_CFLAGS+=		-DSTD_INSPIRED=1 -DHAVE_STDINT_H=1
TARGET_CFLAGS+=		-DHAVE_INTTYPES_H=1
XAKE_FLAGS+=		TZDIR="/usr/share/zoneinfo" cc="$(TARGET_CC)"
ALL_TARGET:=		ALL
INSTALL_TARGET:=	INSTALL

date-install:
	$(INSTALL_DIR) $(IDIR_DATE)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/date $(IDIR_DATE)/usr/bin/

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
