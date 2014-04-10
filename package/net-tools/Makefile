# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		net-tools
PKG_VERSION:=		1.60
PKG_RELEASE:=		2
PKG_MD5SUM:=		888774accab40217dde927e21979c165
PKG_DESCR:=		Linux net-tools
PKG_SECTION:=		net
PKG_URL:=		http://net-tools.sourceforge.net/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=net-tools/}
PKG_NOPARALLEL:=	1

PKG_SUBPKGS:=		ARP

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.bz2

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,ARP,arp,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual
INSTALL_STYLE:=		manual
ifeq ($(ADK_TOOLCHAIN_USE_SSP),y)
TARGET_LDFLAGS+=	-lssp
endif

do-configure:
	$(CP) ./files/config.* $(WRKBUILD)/

arp-install:
	$(INSTALL_DIR) $(IDIR_ARP)/sbin
	$(INSTALL_BIN) $(WRKBUILD)/arp \
		$(IDIR_ARP)/sbin

include ${TOPDIR}/mk/pkg-bottom.mk
