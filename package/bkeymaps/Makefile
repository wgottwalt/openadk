# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		bkeymaps
PKG_VERSION:=		1.13
PKG_RELEASE:=		1
PKG_MD5SUM:=		a68058ab4a81cf9a8dcbaaa7a5df5b11
PKG_DESCR:=		binary keymaps for busybox loadkmap
PKG_SECTION:=		utils
PKG_URL:=		http://dev.alpinelinux.org/bkeymaps/
PKG_SITES:=		http://dev.alpinelinux.org/bkeymaps/

PKG_DFLT_BKEYMAPS:=	y if ADK_TARGET_WITH_INPUT

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,BKEYMAPS,$(PKG_NAME),$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

KBD_LAYOUT:=$(strip $(subst ",, $(ADK_RUNTIME_KBD_LAYOUT)))
KBD_DIR:=$(shell echo $(KBD_LAYOUT)|cut -c 1-2)

do-install:
	$(INSTALL_DIR) $(IDIR_BKEYMAPS)/usr/share/keymaps/
	$(INSTALL_DATA) $(WRKBUILD)/bkeymaps/$(KBD_DIR)/$(KBD_LAYOUT).bmap \
		$(IDIR_BKEYMAPS)/usr/share/keymaps/keymap.bmap

include ${TOPDIR}/mk/pkg-bottom.mk
