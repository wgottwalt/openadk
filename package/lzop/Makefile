# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		lzop
PKG_VERSION:=		1.03
PKG_RELEASE:=		1
PKG_HASH:=		c1425b8c77d49f5a679d5a126c90ea6ad99585a55e335a613cae59e909dbb2c9
PKG_DESCR:=		compression utility
PKG_SECTION:=		app/archive
PKG_DEPENDS:=		liblzo
PKG_BUILDDEP:=		liblzo
PKG_URL:=		http://www.lzop.org/
PKG_SITES:=		http://www.lzop.org/download/
PKG_BB:=		1

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/host.mk
include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call HOST_template,LZOP,lzop,$(PKG_VERSION)-${PKG_RELEASE}))
$(eval $(call PKG_template,LZOP,lzop,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

lzop-install:
	$(INSTALL_DIR) $(IDIR_LZOP)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/lzop $(IDIR_LZOP)/usr/bin

include ${ADK_TOPDIR}/mk/host-bottom.mk
include ${ADK_TOPDIR}/mk/pkg-bottom.mk
