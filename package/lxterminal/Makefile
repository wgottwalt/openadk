# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		lxterminal
PKG_VERSION:=		0.1.9
PKG_RELEASE:=		1
PKG_MD5SUM:=		cb10cc667611dce3c141294712049c43
PKG_DESCR:=		LXDE terminal
PKG_SECTION:=		x11/lxde
PKG_BUILDDEP:=		vte
PKG_DEPENDS:=		vte
PKG_URL:=		http://lxde.org/
PKG_SITES:=		http://netcologne.dl.sourceforge.net/project/lxde/LXTerminal%20%28terminal%20emulator%29/LXTerminal%200.1.9/

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LXTERMINAL,lxterminal,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

lxterminal-install:
	$(INSTALL_DIR) $(IDIR_LXTERMINAL)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/lxterminal \
		$(IDIR_LXTERMINAL)/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
